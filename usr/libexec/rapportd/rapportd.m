void sub_10000521C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100005D48(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (dword_100142248 <= 30 && (dword_100142248 != -1 || _LogCategory_Initialize()))
  {
    id v32 = v5;
    v34 = (void *)nw_agent_client_copy_endpoint();
    LogPrintF();
  }
  v7 = (void *)nw_agent_client_copy_parameters();
  if (v7)
  {
    if (dword_100142248 <= 30 && (dword_100142248 != -1 || _LogCategory_Initialize()))
    {
      id v32 = v7;
      LogPrintF();
    }
    unsigned int v8 = [*(id *)(a1 + 32) _isTCPTransport:v7, v32, v34];
    v9 = +[RPNWAgentClient findAgentClient:tryPort:isTCP:isFlowHandler:](RPNWAgentClient, "findAgentClient:tryPort:isTCP:isFlowHandler:", v5, 1);
    id v10 = v9;
    if (v9)
    {
      if ([v9 type] != (id)1
        || ([v10 flowClient], v11 = objc_claimAutoreleasedReturnValue(), v11, !v11))
      {
        v40 = v6;
        v12 = v10;
        id v10 = 0;
        goto LABEL_30;
      }
      if (dword_100142248 > 30 || dword_100142248 == -1 && !_LogCategory_Initialize())
      {
LABEL_28:
        uint64_t v13 = +[RPNWAgentClient addAgentClient];
        if (!v13)
        {
          if (dword_100142248 <= 90 && (dword_100142248 != -1 || _LogCategory_Initialize())) {
            LogPrintF();
          }
          goto LABEL_57;
        }
        v12 = (void *)v13;
        v40 = v6;
        v14 = [v10 applicationService];
        [v12 setApplicationService:v14];

LABEL_30:
        v15 = [*(id *)(a1 + 32) _quicProtocolOptionsFromParameters:v7];
        BOOL v39 = v15 != 0;

        uint64_t pid = nw_parameters_get_pid();
        v16 = [*(id *)(a1 + 32) getPersonaFromParameters:v7];
        char v17 = v8;
        if (dword_100142248 <= 30 && (dword_100142248 != -1 || _LogCategory_Initialize()))
        {
          if (v15) {
            CFStringRef v18 = @"YES";
          }
          else {
            CFStringRef v18 = @"NO";
          }
          if (v8) {
            CFStringRef v19 = @"YES";
          }
          else {
            CFStringRef v19 = @"NO";
          }
          [v16 substringToIndex:8];
          v37 = CFStringRef v36 = v19;
          uint64_t v33 = pid;
          CFStringRef v35 = v18;
          LogPrintF();
        }
        *(void *)uu = 0;
        uint64_t v54 = 0;
        v20 = nw_agent_client_copy_endpoint();
        v21 = v20;
        if (v20 && nw_endpoint_get_type(v20) == (nw_endpoint_type_url|nw_endpoint_type_host)) {
          nw_endpoint_get_service_identifier();
        }
        v38 = v21;
        if (uuid_is_null(uu)
          || (id v23 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:uu]) == 0)
        {
          BOOL v22 = 0;
        }
        else
        {
          v24 = v23;
          v25 = +[RPNWNearbyInvitationEndpoint findEndpoint:v23];

          BOOL v22 = v25 != 0;
        }
        v26 = [v10 nearbyInvitationConnection:v33, v35, v36, v37];

        if (v26) {
          int v27 = 1;
        }
        else {
          int v27 = v22;
        }
        v28 = *(void **)(a1 + 32);
        if (v27) {
          v29 = 0;
        }
        else {
          v29 = v16;
        }
        v42[0] = _NSConcreteStackBlock;
        v42[1] = 3221225472;
        v42[2] = sub_1000062E8;
        v42[3] = &unk_100123DE8;
        id v43 = v12;
        id v44 = v5;
        id v10 = v10;
        BOOL v51 = v39;
        char v52 = v17;
        id v6 = v40;
        int v50 = pid;
        id v45 = v10;
        id v46 = v16;
        uint64_t v47 = *(void *)(a1 + 32);
        v48 = v7;
        id v49 = v40;
        id v30 = v16;
        id v31 = v12;
        [v28 executeAgentLogicInPersona:v29 pid:pid handlerDescription:@"Flow Request" handler:v42];

LABEL_57:
        goto LABEL_58;
      }
    }
    else if (dword_100142248 > 30 || dword_100142248 == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_28;
    }
    LogPrintF();
    goto LABEL_28;
  }
  if (dword_100142248 <= 90 && (dword_100142248 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
LABEL_58:
}

id sub_1000062E8(uint64_t a1)
{
  HIDWORD(v9) = *(_DWORD *)(a1 + 88);
  *(_WORD *)((char *)&v9 + 1) = *(_WORD *)(a1 + 92);
  LOBYTE(v9) = 1;
  [*(id *)(a1 + 32) updateAgentClientInfo:0 browseResponse:0 listener:0 bundleID:0 advertiseDescriptor:0 browseDescriptor:0 isFlowHandler:0 isUsingQUIC:0 isTCP:0 agentClientPID:v9 persona:0];
  [*(id *)(a1 + 32) setControlFlags:[*(id *)(a1 + 64) convertConnectionParametersToControlFlags:*(void *)(a1 + 72)]];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 72);
  uint64_t v5 = *(void *)(a1 + 80);
  v7 = *(void **)(a1 + 64);

  return _[v7 startFlow:v4 listener:v2 client:v3 assign:v5 parameters:v6];
}

Class sub_10000677C()
{
  if (qword_100142B88 != -1) {
    dispatch_once(&qword_100142B88, &stru_100121110);
  }
  Class result = objc_getClass("LSApplicationWorkspace");
  qword_100142B80 = (uint64_t)result;
  off_100140B90 = (uint64_t (*)())sub_1000067E0;
  return result;
}

id sub_1000067E0()
{
  return (id)qword_100142B80;
}

void sub_1000067EC(id a1)
{
  qword_100142B90 = (uint64_t)dlopen("/System/Library/Frameworks/MobileCoreServices.framework/MobileCoreServices", 2);
}

void sub_1000077F8(id a1)
{
  v1 = objc_alloc_init(RPCloudDaemon);
  uint64_t v2 = (void *)qword_100142B98;
  qword_100142B98 = (uint64_t)v1;
}

id sub_100007C7C(uint64_t a1)
{
  if (dword_100140D18 <= 30 && (dword_100140D18 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  uint64_t v2 = *(void **)(a1 + 32);
  if (!v2[15])
  {
    id v3 = objc_alloc_init((Class)CUSystemMonitor);
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 120);
    *(void *)(v4 + 120) = v3;

    [*(id *)(*(void *)(a1 + 32) + 120) setDispatchQueue:*(void *)(*(void *)(a1 + 32) + 128)];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100007E20;
    v12[3] = &unk_100121158;
    uint64_t v13 = *(void *)(a1 + 32);
    [*(id *)(v13 + 120) setFirstUnlockHandler:v12];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100007E28;
    v10[3] = &unk_100121158;
    uint64_t v11 = *(void *)(a1 + 32);
    [*(id *)(v11 + 120) setPrimaryAppleIDChangedHandler:v10];
    uint64_t v6 = *(void *)(a1 + 32);
    v7 = *(void **)(v6 + 120);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100007E30;
    v9[3] = &unk_100121158;
    v9[4] = v6;
    [v7 activateWithCompletion:v9];
    uint64_t v2 = *(void **)(a1 + 32);
  }
  return [v2 prefsChanged];
}

id sub_100007E20(uint64_t a1)
{
  return [*(id *)(a1 + 32) _update];
}

id sub_100007E28(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _primaryAppleIDChanged];
}

id sub_100007E30(uint64_t a1)
{
  return [*(id *)(a1 + 32) _update];
}

id sub_100007EAC(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _invalidate];
}

void sub_100008BF0(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 128));
  *(unsigned char *)(*(void *)(a1 + 32) + 76) = 0;
  if (!*(void *)(*(void *)(a1 + 32) + 8))
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v22 = v3;
    id obj = [v3 allValues];
    id v4 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v29;
LABEL_4:
      uint64_t v7 = 0;
      while (1)
      {
        if (*(void *)v29 != v6) {
          objc_enumerationMutation(obj);
        }
        unsigned int v8 = *(void **)(*((void *)&v28 + 1) + 8 * v7);
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        id v9 = v8;
        id v10 = [v9 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v10)
        {
          id v11 = v10;
          uint64_t v12 = *(void *)v25;
          while (2)
          {
            for (i = 0; i != v11; i = (char *)i + 1)
            {
              if (*(void *)v25 != v12) {
                objc_enumerationMutation(v9);
              }
              v14 = *(void **)(*((void *)&v24 + 1) + 8 * i);
              v15 = [v14 senderCorrelationIdentifier:v19, v20, v21];

              if (v15)
              {
                uint64_t v16 = [v14 senderCorrelationIdentifier];
                if (dword_100140D18 <= 30 && (dword_100140D18 != -1 || _LogCategory_Initialize()))
                {
                  uint64_t v20 = *(void *)(*(void *)(a1 + 32) + 8);
                  uint64_t v21 = v16;
                  uint64_t v19 = *(void *)(a1 + 40);
                  LogPrintF();
                }
                uint64_t v17 = *(void *)(a1 + 32);
                CFStringRef v18 = *(void **)(v17 + 8);
                *(void *)(v17 + 8) = v16;

                goto LABEL_21;
              }
            }
            id v11 = [v9 countByEnumeratingWithState:&v24 objects:v32 count:16];
            if (v11) {
              continue;
            }
            break;
          }
        }
LABEL_21:

        if (*(void *)(*(void *)(a1 + 32) + 8)) {
          break;
        }
        if ((id)++v7 == v5)
        {
          id v5 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
          if (v5) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

    id v3 = v22;
    if (!*(void *)(*(void *)(a1 + 32) + 8)
      && dword_100140D18 <= 30
      && (dword_100140D18 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

void sub_100008F74(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000090F0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000091E8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000093A4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100009684(uint64_t a1, void *a2, void *a3)
{
  id v33 = a2;
  id v5 = a3;
  *(unsigned char *)(*(void *)(a1 + 32) + 76) = 0;
  if (dword_100140D18 <= 30 && (dword_100140D18 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 128));
  uint64_t v6 = +[NSDate date];
  uint64_t v7 = *(void *)(a1 + 32);
  unsigned int v8 = *(void **)(v7 + 80);
  *(void *)(v7 + 80) = v6;

  if (v5)
  {
    if (dword_100140D18 <= 90 && (dword_100140D18 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    uint64_t v27 = *(void *)(a1 + 32);
    long long v28 = *(void **)(v27 + 80);
    *(void *)(v27 + 80) = 0;
  }
  else
  {
    uint64_t v30 = a1;
    id v9 = objc_alloc_init((Class)NSMutableArray);
    id v10 = objc_alloc_init((Class)NSMutableDictionary);
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id obj = [v33 allKeys];
    id v34 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
    if (v34)
    {
      uint64_t v32 = *(void *)v42;
      do
      {
        for (i = 0; i != v34; i = (char *)i + 1)
        {
          if (*(void *)v42 != v32) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void *)(*((void *)&v41 + 1) + 8 * i);
          uint64_t v13 = [v33 objectForKey:v12, v29];
          v14 = [v13 endpoints];

          if (v14)
          {
            CFStringRef v35 = v13;
            CFStringRef v36 = i;
            long long v39 = 0u;
            long long v40 = 0u;
            long long v37 = 0u;
            long long v38 = 0u;
            v15 = [v13 endpoints];
            id v16 = [v15 countByEnumeratingWithState:&v37 objects:v45 count:16];
            if (v16)
            {
              id v17 = v16;
              uint64_t v18 = *(void *)v38;
              do
              {
                for (j = 0; j != v17; j = (char *)j + 1)
                {
                  if (*(void *)v38 != v18) {
                    objc_enumerationMutation(v15);
                  }
                  uint64_t v20 = *(void **)(*((void *)&v37 + 1) + 8 * (void)j);
                  [v9 addObject:v20];
                  uint64_t v21 = [v20 familyEndpointData];
                  id v22 = [v21 deviceUniqueID];

                  if (v22)
                  {
                    [v10 setObject:v20 forKeyedSubscript:v22];
                  }
                  else if (dword_100140D18 <= 90 && (dword_100140D18 != -1 || _LogCategory_Initialize()))
                  {
                    LogPrintF();
                  }
                }
                id v17 = [v15 countByEnumeratingWithState:&v37 objects:v45 count:16];
              }
              while (v17);
            }

            uint64_t v13 = v35;
            i = v36;
          }
          else if (dword_100140D18 <= 90 && (dword_100140D18 != -1 || _LogCategory_Initialize()))
          {
            uint64_t v29 = v12;
            LogPrintF();
          }
        }
        id v34 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
      }
      while (v34);
    }

    uint64_t v23 = *(void *)(v30 + 32);
    long long v24 = *(void **)(v23 + 40);
    *(void *)(v23 + 40) = v10;
    id v25 = v10;

    long long v26 = +[RPDaemon sharedDaemon];

    [v26 postDaemonInfoChanges:2048];
    id v5 = 0;
  }
}

void sub_100009C10(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100009DBC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100009FB4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000A160(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000A30C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000A4B8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000A628(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000A7B4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

const char *sub_10000AE3C(int a1)
{
  if (a1 > 47)
  {
    if (a1 <= 63)
    {
      if (a1 == 48) {
        return "WatchIdentityRequest";
      }
      if (a1 == 49) {
        return "WatchIdentityResponse";
      }
    }
    else
    {
      switch(a1)
      {
        case '@':
          return "FriendIdentityRequest";
        case 'A':
          return "FriendIdentityResponse";
        case 'B':
          return "FriendIdentityUpdate";
      }
    }
    return "?";
  }
  else
  {
    Class result = "Invalid";
    switch(a1)
    {
      case 0:
        return result;
      case 1:
        Class result = "NoOp";
        break;
      case 3:
        Class result = "PS_Start";
        break;
      case 4:
        Class result = "PS_Next";
        break;
      case 5:
        Class result = "PV_Start";
        break;
      case 6:
        Class result = "PV_Next";
        break;
      case 7:
        Class result = "U_OPACK";
        break;
      case 8:
        Class result = "E_OPACK";
        break;
      case 9:
        Class result = "P_OPACK";
        break;
      case 10:
        Class result = "PA_Req";
        break;
      case 11:
        Class result = "PA_Rsp";
        break;
      case 16:
        Class result = "SessionStartRequest";
        break;
      case 17:
        Class result = "SessionStartResponse";
        break;
      case 18:
        Class result = "SessionData";
        break;
      case 32:
        Class result = "FamilyIdentityRequest";
        break;
      case 33:
        Class result = "FamilyIdentityResponse";
        break;
      case 34:
        Class result = "FamilyIdentityUpdate";
        break;
      default:
        return "?";
    }
  }
  return result;
}

void sub_10000DBA4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

unint64_t *RPBonjourFlagsUpdateWithRPCompanionLinkFlags(unint64_t *result, unsigned int a2)
{
  *Class result = *result & 0xFFFFFFFFFFFFF803 | (a2 >> 1) & 4 | (2 * a2) & 0x68 | (16 * ((a2 >> 1) & 1)) | (a2 >> 1) & 0x80 | (a2 >> 2) & 0x700;
  return result;
}

BOOL sub_10000DD3C()
{
  if (qword_100142BB0 != -1) {
    dispatch_once(&qword_100142BB0, &stru_1001212E8);
  }
  return byte_100142BA8 && IsAppleInternalBuild() != 0;
}

void sub_10000DD98(id a1)
{
  byte_100142BA8 = MGGetBoolAnswer();
}

id RPErrorF()
{
  v0 = NSErrorV();

  return v0;
}

id sub_10000DE10(void *a1)
{
  v1 = [a1 componentsSeparatedByString:@","];
  if ((unint64_t)[v1 count] < 2)
  {
    id v6 = 0;
  }
  else
  {
    uint64_t v2 = [v1 objectAtIndexedSubscript:0];
    id v3 = (char *)[v2 rangeOfString:@"iPad"];
    if (v4)
    {
      id v5 = [v2 substringFromIndex:&v3[v4]];

      id v6 = [v5 intValue];
      uint64_t v2 = v5;
    }
    else
    {
      id v6 = 0;
    }
  }
  return v6;
}

id sub_10000DEBC(void *a1)
{
  v1 = [a1 componentsSeparatedByString:@","];
  if ((unint64_t)[v1 count] < 2)
  {
    id v3 = 0;
  }
  else
  {
    uint64_t v2 = [v1 objectAtIndexedSubscript:1];
    if ([v2 length]) {
      id v3 = [v2 intValue];
    }
    else {
      id v3 = 0;
    }
  }
  return v3;
}

id sub_10000DF44(void *a1)
{
  v1 = [a1 componentsSeparatedByString:@","];
  if ((unint64_t)[v1 count] < 2)
  {
    id v6 = 0;
  }
  else
  {
    uint64_t v2 = [v1 objectAtIndexedSubscript:0];
    id v3 = (char *)[v2 rangeOfString:@"AppleTV"];
    if (v4)
    {
      id v5 = [v2 substringFromIndex:&v3[v4]];

      id v6 = [v5 intValue];
      uint64_t v2 = v5;
    }
    else
    {
      id v6 = 0;
    }
  }
  return v6;
}

id RPNestedErrorF()
{
  v0 = NSErrorNestedV();

  return v0;
}

id RPVersionToSourceVersionString()
{
  SourceVersionToCString();

  return 0;
}

id sub_10000E0C8()
{
  GestaltProductTypeStringToDeviceClass();
  if ((DeviceOSVersionAtOrLaterEx() & 1) != 0
    || (DeviceOSVersionAtOrLaterEx() & 1) != 0
    || (DeviceOSVersionAtOrLaterEx() & 1) != 0
    || (DeviceOSVersionAtOrLaterEx() & 1) != 0
    || (DeviceOSVersionAtOrLaterEx() & 1) != 0
    || (DeviceOSVersionAtOrLaterEx() & 1) != 0
    || (DeviceOSVersionAtOrLaterEx() & 1) != 0
    || (DeviceOSVersionAtOrLater() & 1) != 0
    || (DeviceOSVersionAtOrLater() & 1) != 0
    || (DeviceOSVersionAtOrLater() & 1) != 0
    || (DeviceOSVersionAtOrLater() & 1) != 0
    || (DeviceOSVersionAtOrLater() & 1) != 0
    || (DeviceOSVersionAtOrLater() & 1) != 0
    || (DeviceOSVersionAtOrLater() & 1) != 0
    || (DeviceOSVersionAtOrLater() & 1) != 0
    || (DeviceOSVersionAtOrLater() & 1) != 0
    || (DeviceOSVersionAtOrLater() & 1) != 0
    || DeviceOSVersionAtOrLater()
    || (DeviceOSVersionAtOrLater() & 1) != 0
    || (DeviceOSVersionAtOrLater() & 1) != 0
    || (DeviceOSVersionAtOrLater() & 1) != 0
    || (DeviceOSVersionAtOrLater() & 1) != 0
    || (DeviceOSVersionAtOrLater() & 1) != 0
    || (DeviceOSVersionAtOrLater() & 1) != 0
    || (DeviceOSVersionAtOrLater() & 1) != 0
    || (DeviceOSVersionAtOrLater() & 1) != 0
    || (DeviceOSVersionAtOrLater() & 1) != 0
    || (DeviceOSVersionAtOrLater() & 1) != 0
    || NADyFF4UGjtVGBmEW6h()
    || (TN6sBSnEP2() & 1) != 0
    || wInTP56r94EFs9NAAi())
  {
    v0 = RPVersionToSourceVersionString();
  }
  else
  {
    v0 = 0;
  }

  return v0;
}

id sub_10000E8DC(uint64_t *a1)
{
  if (*a1 < 1)
  {
    id v1 = 0;
  }
  else
  {
    NSAppendPrintF();
    id v1 = 0;
  }

  return v1;
}

id sub_10000E944(uint64_t a1)
{
  NSAppendPrintF();
  id v1 = 0;
  id v2 = [v1 rangeOfString:@":"];
  id v3 = 0;
  if (v2 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v3 = [v1 substringWithRange:0, v2];
  }
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = v1;
  }
  id v5 = v4;

  return v5;
}

void sub_10000E9E0(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  id v8 = [a1 componentsSeparatedByString:@"."];
  id v3 = [v8 count];
  if (v3)
  {
    unint64_t v4 = (unint64_t)v3;
    id v5 = [v8 objectAtIndexedSubscript:0];
    *a2 = [v5 integerValue];

    if (v4 != 1)
    {
      id v6 = [v8 objectAtIndexedSubscript:1];
      a2[1] = [v6 integerValue];

      if (v4 >= 3)
      {
        uint64_t v7 = [v8 objectAtIndexedSubscript:2];
        a2[2] = [v7 integerValue];
      }
    }
  }
}

BOOL sub_10000EABC(int a1)
{
  return a1 == 4 || a1 == 7;
}

BOOL sub_10000EACC()
{
  if (qword_100142BC0 != -1) {
    dispatch_once(&qword_100142BC0, &stru_100121308);
  }
  return (byte_100142BB8 & 1) == 0;
}

void sub_10000EB18(id a1)
{
  if ((os_variant_has_internal_content() & 1) == 0) {
    byte_100142BB8 = 1;
  }
  if (CFPrefs_GetInt64()) {
    byte_100142BB8 = 0;
  }
}

id sub_10000EB7C(uint64_t a1, int a2)
{
  id v3 = +[NSMutableString stringWithCString:a1 encoding:4];
  unint64_t v4 = v3;
  if (a2) {
    CFStringRef v5 = @"'%@'";
  }
  else {
    CFStringRef v5 = @"'%~@'";
  }
  [v3 appendString:v5];
  id v6 = v4;
  id v7 = [v6 UTF8String];

  return v7;
}

void sub_10000EF20(id a1)
{
  id v1 = objc_alloc_init(RPCompanionLinkDaemon);
  id v2 = (void *)qword_100142BC8;
  qword_100142BC8 = (uint64_t)v1;
}

BOOL sub_10000F154(id a1, NSString *a2)
{
  return [(NSString *)a2 hasPrefix:@"AppleTV"];
}

BOOL sub_10000F164(id a1, NSString *a2)
{
  id v2 = a2;
  if ([(NSString *)v2 hasPrefix:@"AudioAccessory1,"]
    || [(NSString *)v2 hasPrefix:@"AudioAccessory5,"]
    || [(NSString *)v2 hasPrefix:@"AudioAccessory6,"])
  {
    unsigned __int8 v3 = 1;
  }
  else
  {
    unsigned __int8 v3 = [(NSString *)v2 hasPrefix:@"HomePod"];
  }

  return v3;
}

BOOL sub_10000F1EC(id a1, NSString *a2)
{
  return [(NSString *)a2 containsString:@"Mac"];
}

BOOL sub_10000F1FC(id a1, NSString *a2)
{
  return [(NSString *)a2 hasPrefix:@"iPad"];
}

BOOL sub_10000F20C(id a1, NSString *a2)
{
  return [(NSString *)a2 hasPrefix:@"iPhone"];
}

BOOL sub_10000F21C(id a1, NSString *a2)
{
  return [(NSString *)a2 hasPrefix:@"iPod"];
}

BOOL sub_10000F22C(id a1, NSString *a2)
{
  return [(NSString *)a2 hasPrefix:@"Watch"];
}

BOOL sub_10000F23C(id a1, unint64_t a2)
{
  return (a2 >> 19) & 1;
}

BOOL sub_10000F244(id a1, unint64_t a2)
{
  return (a2 >> 14) & 1;
}

BOOL sub_10000F24C(id a1, unint64_t a2)
{
  return (a2 >> 17) & 1;
}

BOOL sub_10000F254(id a1, unint64_t a2)
{
  return (a2 >> 13) & 1;
}

void sub_10000F3E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000F400(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000F410(uint64_t a1)
{
}

void sub_10000F418(void *a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  id v20 = v5;
  if (dword_100140E48 <= 30)
  {
    if (dword_100140E48 != -1 || (v8 = _LogCategory_Initialize(), id v5 = v20, v8))
    {
      id v6 = [v5 peerIdentifier];
      id v7 = [v20 peerDeviceInfo];
      [v7 idsDeviceIdentifier];
      v19 = id v17 = v6;
      LogPrintF();

      id v5 = v20;
    }
  }
  id v9 = [v5 peerIdentifier:v17, v19];
  if ([v9 isEqualToString:a1[4]])
  {
  }
  else
  {
    id v10 = [v20 peerDeviceInfo];
    id v11 = [v10 idsDeviceIdentifier];
    unsigned int v12 = [v11 isEqual:a1[5]];

    if (!v12) {
      goto LABEL_13;
    }
  }
  if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v13 = [v20 peerDeviceInfo];
    uint64_t v18 = [v13 name];
    LogPrintF();
  }
  uint64_t v14 = [v20 peerDeviceInfo:v18];
  uint64_t v15 = *(void *)(a1[6] + 8);
  id v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v14;

  *a3 = 1;
LABEL_13:
}

void sub_10000F7CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000F7E4(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v5 = [a2 peerDeviceInfo];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  *a3 = 1;
}

void sub_100010F68(_Unwind_Exception *a1)
{
}

void sub_100011024(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  id obj = *(id *)(v3 + 40);
  unint64_t v4 = [a3 bleDevice];
  uint64_t v5 = CUDescriptionWithLevel();
  NSAppendPrintF();
  objc_storeStrong((id *)(v3 + 40), obj);
}

void sub_1000110AC(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  id obj = *(id *)(v1 + 40);
  id v2 = CUDescriptionWithLevel();
  NSAppendPrintF();
  objc_storeStrong((id *)(v1 + 40), obj);
}

void sub_100011118(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  id obj = *(id *)(v1 + 40);
  id v2 = CUDescriptionWithLevel();
  NSAppendPrintF();
  objc_storeStrong((id *)(v1 + 40), obj);
}

void sub_100011184(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  id obj = *(id *)(v1 + 40);
  id v2 = CUDescriptionWithLevel();
  NSAppendPrintF();
  objc_storeStrong((id *)(v1 + 40), obj);
}

void sub_1000111F0(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  id obj = *(id *)(v6 + 40);
  int v8 = CUDescriptionWithLevel();
  NSAppendPrintF();
  objc_storeStrong((id *)(v6 + 40), obj);

  if (++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) >= 0x11uLL)
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
    id v9 = *(id *)(v7 + 40);
    NSAppendPrintF();
    objc_storeStrong((id *)(v7 + 40), v9);
    *a4 = 1;
  }
}

void sub_1000112D4(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  id obj = *(id *)(v6 + 40);
  int v8 = CUDescriptionWithLevel();
  NSAppendPrintF();
  objc_storeStrong((id *)(v6 + 40), obj);

  if (++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) >= 0x11uLL)
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
    id v9 = *(id *)(v7 + 40);
    NSAppendPrintF();
    objc_storeStrong((id *)(v7 + 40), v9);
    *a4 = 1;
  }
}

void sub_1000113B8(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  id obj = *(id *)(v6 + 40);
  int v8 = CUDescriptionWithLevel();
  NSAppendPrintF();
  objc_storeStrong((id *)(v6 + 40), obj);

  if (++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) >= 0x11uLL)
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
    id v9 = *(id *)(v7 + 40);
    NSAppendPrintF();
    objc_storeStrong((id *)(v7 + 40), v9);
    *a4 = 1;
  }
}

void sub_10001149C(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  id obj = *(id *)(v6 + 40);
  int v8 = CUDescriptionWithLevel();
  NSAppendPrintF();
  objc_storeStrong((id *)(v6 + 40), obj);

  if (++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) >= 0x11uLL)
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
    id v9 = *(id *)(v7 + 40);
    NSAppendPrintF();
    objc_storeStrong((id *)(v7 + 40), v9);
    *a4 = 1;
  }
}

void sub_100011580(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  id obj = *(id *)(v6 + 40);
  int v8 = CUDescriptionWithLevel();
  NSAppendPrintF();
  objc_storeStrong((id *)(v6 + 40), obj);

  if (++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) >= 0x11uLL)
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
    id v9 = *(id *)(v7 + 40);
    NSAppendPrintF();
    objc_storeStrong((id *)(v7 + 40), v9);
    *a4 = 1;
  }
}

void sub_100011664(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  id obj = *(id *)(v1 + 40);
  id v2 = CUDescriptionWithLevel();
  NSAppendPrintF();
  objc_storeStrong((id *)(v1 + 40), obj);
}

void sub_1000116D0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = [v5 event];
  int v8 = [v7 objectForKeyedSubscript:@"type"];
  id v9 = [v7 objectForKeyedSubscript:@"serviceType"];
  uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
  id obj = *(id *)(v10 + 40);
  [v5 state];

  NSAppendPrintF();
  objc_storeStrong((id *)(v10 + 40), obj);
}

void sub_1000117B8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  id obj = *(id *)(v3 + 40);
  id v4 = a3;
  id v5 = [v4 serviceType];
  id v6 = [v4 peerID];
  [v4 sessionID];
  [v4 startTicks];

  UpTicksToSeconds();
  NSAppendPrintF();
  objc_storeStrong((id *)(v3 + 40), obj);
}

id sub_1000118F4(id result)
{
  uint64_t v1 = *((void *)result + 4);
  if (!*(unsigned char *)(v1 + 8))
  {
    *(unsigned char *)(v1 + _Block_object_dispose(&STACK[0x578], 8) = 1;
    return _[*((id *)result + 4) _activate];
  }
  return result;
}

id sub_100011BE0(uint64_t a1)
{
  return [*(id *)(a1 + 32) prefsChanged];
}

void *sub_100011BE8(uint64_t a1)
{
  if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 552) = 0;
  Class result = *(void **)(a1 + 32);
  if (!result[66])
  {
    return [result _update];
  }
  return result;
}

id sub_100011CB8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _update];
}

void sub_100011CC0(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 58_Block_object_dispose(&STACK[0x578], 8) = 1;
  [*(id *)(a1 + 32) _localDeviceUpdate];
  id v1 = +[RPIdentityDaemon sharedIdentityDaemon];
  [v1 updateSharedTVIdentities];
}

id sub_100011D90(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _invalidate];
}

void sub_10001259C(id a1, RPConnection *a2, BOOL *a3)
{
}

void sub_100013F18(uint64_t a1, void *a2, void *a3)
{
  id v17 = a2;
  id v5 = a3;
  int v6 = *(unsigned __int8 *)(a1 + 32);
  if (v6 != [v5 state])
  {
    uint64_t v7 = [v5 event];
    CFStringGetTypeID();
    int v8 = CFDictionaryGetTypedValue();
    if ([v8 isEqual:@"discovery"])
    {
      CFStringGetTypeID();
      id v9 = CFDictionaryGetTypedValue();
      if ([v9 isEqual:@"_companion-link._tcp"])
      {
        [v5 setState:*(unsigned __int8 *)(a1 + 32)];
        id v10 = [v17 unsignedLongLongValue];
        if (dword_100140E48 <= 30)
        {
          id v11 = v10;
          if (dword_100140E48 != -1 || _LogCategory_Initialize())
          {
            id v15 = v11;
            uint64_t v16 = *(unsigned __int8 *)(a1 + 32);
            LogPrintF();
          }
        }
        uint64_t v12 = [v5 handler:v15, v16];
        uint64_t v13 = (void *)v12;
        if (v12)
        {
          if (*(unsigned char *)(a1 + 32)) {
            uint64_t v14 = 6;
          }
          else {
            uint64_t v14 = 5;
          }
          (*(void (**)(uint64_t, uint64_t, void, void))(v12 + 16))(v12, v14, 0, 0);
        }
      }
    }
  }
}

void sub_100014190(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v6 event];
  CFStringGetTypeID();
  int v8 = CFDictionaryGetTypedValue();
  if ([v8 isEqual:@"discovery"])
  {
    CFStringGetTypeID();
    id v9 = CFDictionaryGetTypedValue();
    if ([v9 isEqual:@"RPUserNotificationAppSignIn"])
    {
      v17[0] = @"type";
      v17[1] = @"serviceType";
      v18[0] = v8;
      v18[1] = v9;
      v17[2] = @"deviceID";
      v18[2] = *(void *)(a1 + 32);
      id v10 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:3];
      if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
      {
        id v11 = [v5 unsignedLongLongValue];
        CUDescriptionWithLevel();
        uint64_t v16 = v15 = v9;
        id v14 = v11;
        LogPrintF();
      }
      uint64_t v12 = [v6 handler:v14, v15, v16];
      uint64_t v13 = (void *)v12;
      if (v12) {
        (*(void (**)(uint64_t, void, void *, void))(v12 + 16))(v12, 0, v10, 0);
      }
    }
  }
}

void sub_100014460(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v6 event];
  CFStringGetTypeID();
  int v8 = CFDictionaryGetTypedValue();
  if ([v8 isEqual:@"discovery"])
  {
    CFStringGetTypeID();
    id v9 = CFDictionaryGetTypedValue();
    if ([v9 isEqual:@"com.apple.CompanionAuthentication"])
    {
      v17[0] = @"type";
      v17[1] = @"serviceType";
      v18[0] = v8;
      v18[1] = v9;
      v17[2] = @"deviceID";
      v18[2] = *(void *)(a1 + 32);
      id v10 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:3];
      if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
      {
        id v11 = [v5 unsignedLongLongValue];
        CUDescriptionWithLevel();
        uint64_t v16 = v15 = v9;
        id v14 = v11;
        LogPrintF();
      }
      uint64_t v12 = [v6 handler:v14, v15, v16];
      uint64_t v13 = (void *)v12;
      if (v12) {
        (*(void (**)(uint64_t, void, void *, void))(v12 + 16))(v12, 0, v10, 0);
      }
    }
  }
}

id sub_100014C3C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _update];
}

id sub_100014C44(uint64_t a1)
{
  if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
  {
    id v2 = [*(id *)(*(void *)(a1 + 32) + 776) meDeviceName];
    [*(id *)(*(void *)(a1 + 32) + 776) meDeviceIsMe];
    LogPrintF();
  }
  uint64_t v3 = *(void **)(a1 + 32);

  return [v3 _update];
}

id sub_100014D10(uint64_t a1)
{
  return [*(id *)(a1 + 32) _update];
}

id sub_100014D18(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 625) = 1;
  return [*(id *)(a1 + 32) _update];
}

id sub_100014D2C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _update];
}

id sub_100014D34(uint64_t a1)
{
  return [*(id *)(a1 + 32) _update];
}

id sub_100014D3C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _update];
}

void sub_100014D44(uint64_t a1)
{
  if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
  {
    id v2 = [*(id *)(*(void *)(a1 + 32) + 776) bluetoothAddressData];
    [v2 bytes];
    LogPrintF();
  }
}

void sub_100014DFC(id a1, NSError *a2)
{
  id v2 = a2;
  uint64_t v3 = v2;
  if (v2)
  {
    if (dword_100140E48 <= 90)
    {
      id v5 = v2;
      if (dword_100140E48 != -1 || (v4 = _LogCategory_Initialize(), uint64_t v3 = v5, v4))
      {
        LogPrintF();
        uint64_t v3 = v5;
      }
    }
  }
}

void sub_1000157EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47)
{
}

void sub_100015840(uint64_t a1, void *a2)
{
  id v9 = a2;
  uint64_t v3 = +[RPCloudDaemon sharedCloudDaemon];
  int v4 = [v3 idsDeviceMap];
  id v5 = [v4 objectForKeyedSubscript:v9];

  id v6 = [v5 nsuuid];

  if (v6)
  {
    uint64_t v7 = *(void **)(a1 + 32);
    int v8 = [v5 nsuuid];
    [v7 addObject:v8];
LABEL_3:

    goto LABEL_8;
  }
  if (dword_100140E48 <= 90 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
  {
    int v8 = [*(id *)(a1 + 40) client];
    LogPrintF();
    goto LABEL_3;
  }
LABEL_8:
}

void sub_100015974(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = [a3 event];
  CFStringGetTypeID();
  int v4 = CFDictionaryGetTypedValue();
  if ([v4 isEqual:@"discovery"])
  {
    CFStringGetTypeID();
    id v5 = CFDictionaryGetTypedValue();
    if ([v5 isEqual:@"RPUserNotificationAppSignIn"])
    {
      uint64_t v6 = 0x4000000;
    }
    else
    {
      if (![v5 isEqual:@"com.apple.CompanionAuthentication"])
      {
LABEL_7:

        goto LABEL_8;
      }
      uint64_t v6 = 0x2000000000;
    }
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) |= v6;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    goto LABEL_7;
  }
LABEL_8:
}

void sub_100015EF0(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 1088))
  {
    id v2 = +[RBSProcessPredicate predicateMatchingIdentifiers:](RBSProcessPredicate, "predicateMatchingIdentifiers:");
    if (*(void *)(*(void *)(a1 + 32) + 672))
    {
      if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 672);
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_1000164E0;
      v11[3] = &unk_1001217E8;
      int v4 = &v12;
      uint64_t v12 = v2;
      id v5 = v2;
      [v3 updateConfiguration:v11];
    }
    else
    {
      if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_1000160D0;
      v13[3] = &unk_1001217C0;
      int v4 = (id *)v14;
      uint64_t v6 = *(void *)(a1 + 32);
      v14[0] = v2;
      v14[1] = v6;
      id v7 = v2;
      uint64_t v8 = +[RBSProcessMonitor monitorWithConfiguration:v13];
      uint64_t v9 = *(void *)(a1 + 32);
      id v10 = *(void **)(v9 + 672);
      *(void *)(v9 + 672) = v8;
    }
  }
}

void sub_1000160D0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init((Class)RBSProcessStateDescriptor);
  [v4 setValues:1];
  [v3 setStateDescriptor:v4];
  id v5 = +[NSArray arrayWithObject:*(void *)(a1 + 32)];
  [v3 setPredicates:v5];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000161B8;
  v6[3] = &unk_100121798;
  v6[4] = *(void *)(a1 + 40);
  [v3 setUpdateHandler:v6];
}

void sub_1000161B8(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
  {
    id v10 = [v8 name];
    [v8 pid];
    id v11 = [v9 previousState];
    [v11 taskState];
    uint64_t v12 = NSStringFromRBSTaskState();
    uint64_t v13 = [v9 state];
    [v13 taskState];
    uint64_t v18 = NSStringFromRBSTaskState();
    LogPrintF();
  }
  uint64_t v14 = *(void *)(a1 + 32);
  id v15 = *(NSObject **)(v14 + 1032);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100016374;
  block[3] = &unk_100121770;
  block[4] = v14;
  id v20 = v8;
  id v21 = v9;
  id v16 = v9;
  id v17 = v8;
  dispatch_async(v15, block);
}

void sub_100016374(uint64_t a1)
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 880);
  id v3 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v15;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v8 = [v7 xpcCnx:v14];
        unsigned int v9 = [v8 processIdentifier];
        unsigned int v10 = [*(id *)(a1 + 40) pid];

        if (v9 == v10)
        {
          id v11 = [*(id *)(a1 + 48) state];
          unsigned int v12 = [v11 taskState];

          if (v12 == 3)
          {
            uint64_t v13 = [v7 xpcCnx];
            [v13 invalidate];
          }
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v4);
  }
}

void sub_1000164E0(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  id v4 = +[NSArray arrayWithObject:v2];
  [v3 setPredicates:v4];
}

void sub_100016734(id a1, NSString *a2, RPConnection *a3, BOOL *a4)
{
}

void sub_10001673C(id a1, NSString *a2, RPConnection *a3, BOOL *a4)
{
}

void sub_100016744(id a1, NSString *a2, RPConnection *a3, BOOL *a4)
{
}

_DWORD *sub_100016A14(uint64_t a1, uint64_t a2)
{
  Class result = *(_DWORD **)(a1 + 32);
  if (result[18] == *(_DWORD *)(a1 + 40)) {
    return _[result _clientBLEDiscoveryDeviceFound:a2 deviceFlags:2];
  }
  return result;
}

_DWORD *sub_100016A3C(uint64_t a1, uint64_t a2)
{
  Class result = *(_DWORD **)(a1 + 32);
  if (result[18] == *(_DWORD *)(a1 + 40)) {
    return [result _clientBLEDiscoveryDeviceLost:a2 force:0 deviceFlags:2];
  }
  return result;
}

_DWORD *sub_100016A68(uint64_t a1, uint64_t a2)
{
  Class result = *(_DWORD **)(a1 + 32);
  if (result[18] == *(_DWORD *)(a1 + 40)) {
    return _[result _clientBLEDiscoveryDeviceFound:a2 deviceFlags:2];
  }
  return result;
}

uint64_t sub_100016A90(uint64_t result)
{
  if (*(_DWORD *)(*(void *)(result + 32) + 72) == *(_DWORD *)(result + 40) && dword_100140E48 <= 30)
  {
    if (dword_100140E48 != -1) {
      return LogPrintF();
    }
    Class result = _LogCategory_Initialize();
    if (result) {
      return LogPrintF();
    }
  }
  return result;
}

void sub_100016B28(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    id v9 = v3;
    if (dword_100140E48 <= 90 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
    {
      id v8 = v9;
      LogPrintF();
    }
    [*(id *)(*(void *)(a1 + 32) + 64) invalidate:v8];
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void **)(v5 + 64);
    *(void *)(v5 + 64) = 0;

    goto LABEL_10;
  }
  if (dword_100140E48 <= 30)
  {
    id v9 = 0;
    if (dword_100140E48 != -1 || (v7 = _LogCategory_Initialize(), id v4 = 0, v7))
    {
      LogPrintF();
LABEL_10:
      id v4 = v9;
    }
  }
}

_DWORD *sub_100017474(uint64_t a1, uint64_t a2)
{
  Class result = *(_DWORD **)(a1 + 32);
  if (result[27] == *(_DWORD *)(a1 + 40)) {
    return _[result _clientBLEDiscoveryDeviceFound:a2 deviceFlags:1];
  }
  return result;
}

_DWORD *sub_10001749C(uint64_t a1, uint64_t a2)
{
  Class result = *(_DWORD **)(a1 + 32);
  if (result[27] == *(_DWORD *)(a1 + 40)) {
    return [result _clientBLEDiscoveryDeviceLost:a2 force:0 deviceFlags:1];
  }
  return result;
}

_DWORD *sub_1000174C8(uint64_t a1, uint64_t a2)
{
  Class result = *(_DWORD **)(a1 + 32);
  if (result[27] == *(_DWORD *)(a1 + 40)) {
    return _[result _clientBLEDiscoveryDeviceFound:a2 deviceFlags:1];
  }
  return result;
}

uint64_t sub_1000174F0(uint64_t result)
{
  if (*(_DWORD *)(*(void *)(result + 32) + 108) == *(_DWORD *)(result + 40) && dword_100140E48 <= 30)
  {
    if (dword_100140E48 != -1) {
      return LogPrintF();
    }
    Class result = _LogCategory_Initialize();
    if (result) {
      return LogPrintF();
    }
  }
  return result;
}

void sub_100017588(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    id v9 = v3;
    if (dword_100140E48 <= 90 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
    {
      id v8 = v9;
      LogPrintF();
    }
    [*(id *)(*(void *)(a1 + 32) + 88) invalidate:v8];
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void **)(v5 + 88);
    *(void *)(v5 + 8_Block_object_dispose(&STACK[0x578], 8) = 0;

    goto LABEL_10;
  }
  if (dword_100140E48 <= 30)
  {
    id v9 = 0;
    if (dword_100140E48 != -1 || (v7 = _LogCategory_Initialize(), id v4 = 0, v7))
    {
      LogPrintF();
LABEL_10:
      id v4 = v9;
    }
  }
}

void sub_10001798C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000179A4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    id v7 = v3;
    if (dword_100140E48 <= 90)
    {
      if (dword_100140E48 != -1 || (int v5 = _LogCategory_Initialize(), v4 = v7, v5))
      {
        LogPrintF();
        id v4 = v7;
      }
    }
    if (*(void *)(a1 + 40))
    {
      id v6 = v4;
      id v4 = v7;
      **(void **)(a1 + 40) = v6;
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
}

id sub_100018860(uint64_t a1)
{
  dispatch_source_cancel(*(dispatch_source_t *)(*(void *)(a1 + 32) + 648));
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 648);
  *(void *)(v2 + 64_Block_object_dispose(&STACK[0x578], 8) = 0;

  id v4 = *(void **)(a1 + 32);

  return _[v4 _processPendingLostBLEDevices];
}

void sub_1000197D8(uint64_t a1, void *a2)
{
  id v8 = a2;
  if (v8)
  {
    if (dword_100140E48 <= 90 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
    {
      id v7 = v8;
      LogPrintF();
    }
    [*(id *)(*(void *)(a1 + 32) + 176) invalidate:v7];
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 176);
    *(void *)(v3 + 176) = 0;
    goto LABEL_13;
  }
  if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  int v5 = *(void **)(*(void *)(a1 + 32) + 184);
  if (v5)
  {
    id v6 = v5;
    id v4 = +[RPMetrics sharedMetrics];
    [v4 logNeedsAWDLAdvertisementClient:v6 actionType:51 bluetoothType:15];

LABEL_13:
  }
}

void sub_10001A4B4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v3)
  {
    id v11 = v3;
    [*(id *)(v4 + 136) invalidate];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 136);
    *(void *)(v5 + 136) = 0;
  }
  else
  {
    id v7 = *(void **)(v4 + 144);
    if (!v7) {
      goto LABEL_6;
    }
    id v11 = 0;
    id v8 = *(void **)(v4 + 160);
    id v9 = v7;
    id v10 = [v8 nearbyActionV2Type];
    id v6 = +[RPMetrics sharedMetrics];
    [v6 logNeedsAWDLAdvertisementClient:v9 actionType:v10 bluetoothType:21];
  }
  id v3 = v11;
LABEL_6:
}

void sub_10001AB58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001AB78(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (!v3)
  {
    if (!*(unsigned char *)(*(void *)(a1[6] + 8) + 24)) {
      goto LABEL_11;
    }
    id v10 = 0;
    uint64_t v5 = *(void **)(a1[4] + 608);
    if (!v5)
    {
      uint64_t v6 = +[NSMutableSet set];
      uint64_t v7 = a1[4];
      id v8 = *(void **)(v7 + 608);
      *(void *)(v7 + 60_Block_object_dispose(&STACK[0x578], 8) = v6;

      uint64_t v5 = *(void **)(a1[4] + 608);
    }
    [v5 addObject:a1[5]];
    goto LABEL_9;
  }
  if (dword_100140E48 <= 30)
  {
    id v10 = v3;
    if (dword_100140E48 != -1 || (v9 = _LogCategory_Initialize(), uint64_t v4 = v10, v9))
    {
      LogPrintF();
LABEL_9:
      uint64_t v4 = v10;
    }
  }
LABEL_11:
}

void *sub_10001AED0(uint64_t a1, uint64_t a2)
{
  Class result = *(void **)(a1 + 32);
  if (result[36]) {
    return [result _clientBonjourFoundDevice:a2 reevaluate:0];
  }
  return result;
}

void *sub_10001AEEC(uint64_t a1, uint64_t a2)
{
  Class result = *(void **)(a1 + 32);
  if (result[36]) {
    return [result _clientBonjourLostDevice:a2];
  }
  return result;
}

void *sub_10001AF04(uint64_t a1, uint64_t a2)
{
  Class result = *(void **)(a1 + 32);
  if (result[36]) {
    return [result _clientBonjourFoundDevice:a2 reevaluate:0];
  }
  return result;
}

id sub_10001B9C4(void *a1)
{
  id v1 = a1;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v2 = [v1 shortDescription];
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      [v1 descriptionWithLevel:50];
    }
    else {
    uint64_t v2 = [v1 description];
    }
  }
  id v3 = (void *)v2;

  return v3;
}

void *sub_10001C9A8(void *result)
{
  uint64_t v1 = result[5];
  if (result[4] == *(void *)(v1 + 328))
  {
    uint64_t v2 = result;
    *(void *)(v1 + 320) = 0;
    id v3 = *(void **)(result[5] + 328);
    if (v3)
    {
      uint64_t v4 = v3;
      dispatch_source_cancel(v4);
      uint64_t v5 = v2[5];
      uint64_t v6 = *(void **)(v5 + 328);
      *(void *)(v5 + 32_Block_object_dispose(&STACK[0x578], 8) = 0;
    }
    uint64_t v7 = (void *)v2[5];
    return [v7 _clientBonjourReevaluateAllDevices];
  }
  return result;
}

void *sub_10001CE58(uint64_t a1, uint64_t a2)
{
  Class result = *(void **)(a1 + 32);
  if (result[37]) {
    return _[result _clientBonjourAWDLBrowserFoundDevice:a2];
  }
  return result;
}

void *sub_10001CE70(uint64_t a1, uint64_t a2)
{
  Class result = *(void **)(a1 + 32);
  if (result[37]) {
    return _[result _clientBonjourAWDLBrowserLostDevice:a2];
  }
  return result;
}

void *sub_10001CE88(uint64_t a1, uint64_t a2)
{
  Class result = *(void **)(a1 + 32);
  if (result[37]) {
    return _[result _clientBonjourAWDLBrowserFoundDevice:a2];
  }
  return result;
}

id sub_10001EB24(uint64_t a1)
{
  [*(id *)(a1 + 32) _clientConnectionEnded:*(void *)(a1 + 40) uniqueID:*(void *)(a1 + 48)];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 _clientBonjourReevaluateAllDevices];
}

void sub_10001EB64(uint64_t a1)
{
  [*(id *)(a1 + 32) _stereoDeviceUpdate:0];
  [*(id *)(a1 + 32) _personalDeviceUpdate];
  uint64_t v2 = [*(id *)(a1 + 40) peerDeviceInfo];
  if (v2)
  {
    id v3 = v2;
    [*(id *)(a1 + 32) _activeDeviceChanged:v2 changes:2];
    uint64_t v2 = v3;
  }
}

id sub_10001EBDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) _receivedEventID:a2 event:a3 options:a4 unauth:0 cnx:*(void *)(a1 + 40)];
}

id sub_10001EBF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [*(id *)(a1 + 32) _receivedRequestID:a2 request:a3 options:a4 responseHandler:a5 unauth:0 cnx:*(void *)(a1 + 40)];
}

id sub_10001EC18(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _connectionStateChanged:a2 cnx:*(void *)(a1 + 40)];
}

void sub_10001EC28(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 40);
  id v6 = [*(id *)(a1 + 32) peerDeviceInfo];
  id v3 = [v6 homeKitUserIdentifiers];
  uint64_t v4 = [v2 _filterHomeKitUserIdentifiers:v3];
  uint64_t v5 = [*(id *)(a1 + 32) peerDeviceInfo];
  [v5 setHomeKitUserIdentifiers:v4];
}

void sub_10001ECC0(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) peerIdentifier];
  [v1 _sendProxyDeviceUpdateToPeer:v2];
}

id sub_10001FB14(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) authCompletion:a2];
}

id sub_10001FB20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) passwordTypeActual];

  return _[v5 promptForPasswordType:v6 flags:a2 throttleSeconds:a3];
}

void sub_10001FB74(uint64_t a1)
{
  [*(id *)(a1 + 32) _clientOnDemandConnectionEnded:*(void *)(a1 + 40) uniqueID:*(void *)(a1 + 48)];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 880);
  id v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v14;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v8 = [v7 netCnx:v13];
        int v9 = v8;
        if (v8 == *(void **)(a1 + 40))
        {
        }
        else
        {
          id v10 = [v7 session];
          id v11 = [v10 cnx];
          unsigned int v12 = *(void **)(a1 + 40);

          if (v11 != v12) {
            continue;
          }
        }
        [v7 handleDisconnect];
      }
      id v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }
}

id sub_10001FCE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) _receivedEventID:a2 event:a3 options:a4 unauth:0 cnx:*(void *)(a1 + 40)];
}

id sub_10001FCFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [*(id *)(a1 + 32) _receivedRequestID:a2 request:a3 options:a4 responseHandler:a5 unauth:0 cnx:*(void *)(a1 + 40)];
}

id sub_10001FD1C(uint64_t a1, uint64_t a2)
{
  if (a2 == 1)
  {
    if ([*(id *)(a1 + 32) isEqualToDevice:*(void *)(*(void *)(a1 + 40) + 160)]) {
      [*(id *)(a1 + 40) _clientBLENearbyActionV2AdvertiserRestart];
    }
    if ([*(id *)(a1 + 32) isEqualToDevice:*(void *)(*(void *)(a1 + 40) + 192)]) {
      [*(id *)(a1 + 40) _clientBLENeedsCLinkAdvertiserRestart];
    }
  }
  id v4 = *(void **)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);

  return [v4 _connectionStateChanged:a2 cnx:v5];
}

void sub_10001FD90(uint64_t a1)
{
  id v2 = *(void **)(a1 + 40);
  id v6 = [*(id *)(a1 + 32) peerDeviceInfo];
  id v3 = [v6 homeKitUserIdentifiers];
  id v4 = [v2 _filterHomeKitUserIdentifiers:v3];
  uint64_t v5 = [*(id *)(a1 + 32) peerDeviceInfo];
  [v5 setHomeKitUserIdentifiers:v4];
}

void sub_10001FE28(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) peerIdentifier];
  [v1 _sendProxyDeviceUpdateToPeer:v2];
}

id sub_100020928(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) authCompletion:a2];
}

id sub_100020934(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) passwordTypeActual];

  return _[v5 promptForPasswordType:v6 flags:a2 throttleSeconds:a3];
}

id sub_100020988(uint64_t a1)
{
  [*(id *)(a1 + 32) _clientConnectionEndedUnauth:*(void *)(a1 + 40) publicID:*(void *)(a1 + 48)];
  id v2 = *(void **)(a1 + 56);

  return [v2 handleDisconnect];
}

id sub_1000209C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) _receivedEventID:a2 event:a3 options:a4 unauth:1 cnx:*(void *)(a1 + 40)];
}

id sub_1000209E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [*(id *)(a1 + 32) _receivedRequestID:a2 request:a3 options:a4 responseHandler:a5 unauth:1 cnx:*(void *)(a1 + 40)];
}

id sub_100020A04(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _connectionStateChanged:a2 cnx:*(void *)(a1 + 40)];
}

void sub_100020A14(uint64_t a1)
{
  id v2 = *(void **)(a1 + 40);
  id v6 = [*(id *)(a1 + 32) peerDeviceInfo];
  id v3 = [v6 homeKitUserIdentifiers];
  id v4 = [v2 _filterHomeKitUserIdentifiers:v3];
  uint64_t v5 = [*(id *)(a1 + 32) peerDeviceInfo];
  [v5 setHomeKitUserIdentifiers:v4];
}

void sub_100020AAC(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) peerIdentifier];
  [v1 _sendProxyDeviceUpdateToPeer:v2];
}

id sub_100020E60(uint64_t a1)
{
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  id v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);

  return _[v2 _clientOnDemandAWDLDiscoveryTimedOutForDevice:v3 xpcCnx:v4];
}

id sub_1000210B8(uint64_t a1)
{
  if (dword_100140E48 <= 90 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  [*(id *)(a1 + 40) setDiscoveryTimer:0];
  [*(id *)(a1 + 40) setNeedsCLink:0];
  *(unsigned char *)(*(void *)(a1 + 48) + 424) = 0;
  id v2 = *(void **)(a1 + 48);

  return [v2 _update];
}

void sub_100021FAC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_100021FD8(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v7 = a3;
  if (([v7 uiTriggered] & 1) == 0)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    *a4 = 1;
  }
}

id sub_100022050(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id result = [a3 appSignIn];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

id *sub_10002230C(id *result, uint64_t a2, uint64_t a3)
{
  if (result[4] == *((id *)result[5] + 104)) {
    return (id *)_[result[5] _clientUINoteAction:a2 error:a3 device:result[6]];
  }
  return result;
}

id sub_100022978(uint64_t a1)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 1032));
  id v2 = *(void **)(a1 + 32);

  return [v2 _update];
}

void *sub_1000229B8(void *result, uint64_t a2)
{
  if (a2)
  {
    id v2 = result;
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(result[4] + 1032));
    uint64_t v3 = (void *)v2[4];
    return [v3 _serverNearbyActionV2DiscoveryEnsureStopped];
  }
  return result;
}

void sub_100022CB0(uint64_t a1, void *a2)
{
  uint64_t v3 = *(NSObject **)(*(void *)(a1 + 32) + 1032);
  id v4 = a2;
  dispatch_assert_queue_V2(v3);
  [*(id *)(a1 + 32) _serverNearbyInfoV2DeviceFound:v4 deviceFlags:4];
}

void sub_100022D14(uint64_t a1, void *a2)
{
  uint64_t v3 = *(NSObject **)(*(void *)(a1 + 32) + 1032);
  id v4 = a2;
  dispatch_assert_queue_V2(v3);
  [*(id *)(a1 + 32) _serverNearbyInfoV2DeviceLost:v4 idsIdentifier:0 force:0 deviceFlags:4];
}

void sub_100022D80(uint64_t a1, uint64_t a2)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 1032));
  if (a2)
  {
    id v4 = *(void **)(a1 + 32);
    [v4 _serverNearbyInfoV2DiscoveryEnsureStopped];
  }
}

_DWORD *sub_10002321C(uint64_t a1, uint64_t a2)
{
  int v2 = *(_DWORD *)(a1 + 40);
  id result = *(_DWORD **)(a1 + 32);
  if (v2 == result[54]) {
    return _[result _serverBLENeedsCLinkScannerDeviceFound:a2];
  }
  return result;
}

_DWORD *sub_10002323C(uint64_t a1, uint64_t a2)
{
  int v2 = *(_DWORD *)(a1 + 40);
  id result = *(_DWORD **)(a1 + 32);
  if (v2 == result[54]) {
    return _[result _serverBLENeedsCLinkScannerDeviceLost:a2];
  }
  return result;
}

_DWORD *sub_10002325C(uint64_t a1, uint64_t a2)
{
  int v2 = *(_DWORD *)(a1 + 40);
  id result = *(_DWORD **)(a1 + 32);
  if (v2 == result[54]) {
    return _[result _serverBLENeedsCLinkScannerDeviceFound:a2];
  }
  return result;
}

void sub_10002327C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    id v9 = v3;
    if (dword_100140E48 <= 90 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
    {
      id v8 = v9;
      LogPrintF();
    }
    [*(id *)(*(void *)(a1 + 32) + 208) invalidate:v8];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 208);
    *(void *)(v5 + 20_Block_object_dispose(&STACK[0x578], 8) = 0;

    goto LABEL_10;
  }
  if (dword_100140E48 <= 30)
  {
    id v9 = 0;
    if (dword_100140E48 != -1 || (v7 = _LogCategory_Initialize(), id v4 = 0, v7))
    {
      LogPrintF();
LABEL_10:
      id v4 = v9;
    }
  }
}

id sub_100023C18(uint64_t a1)
{
  dispatch_source_cancel(*(dispatch_source_t *)(*(void *)(a1 + 32) + 656));
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 656);
  *(void *)(v2 + 656) = 0;

  id v4 = *(void **)(a1 + 32);

  return _[v4 _processPendingLostNeedsCLinkDevices];
}

void sub_1000258F4(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 616);
  if (v2)
  {
    id v3 = v2;
    dispatch_source_cancel(v3);
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 616);
    *(void *)(v4 + 616) = 0;
  }
  if (*(void *)(*(void *)(a1 + 32) + 600))
  {
    if (dword_100140E48 <= 90 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = *(void **)(v6 + 600);
    *(void *)(v6 + 600) = 0;

    id v8 = *(void **)(a1 + 32);
    [v8 _update];
  }
}

void sub_100025D1C(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "_shouldReceiveActivityLevelOverWiFi:", objc_msgSend(v5, "deviceType")))
  {
    id v3 = *(void **)(a1 + 40);
    uint64_t v4 = [v5 uniqueID];
    [v3 addObject:v4];
  }
}

void sub_100025D9C(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  id v3 = v2;
  if (v2)
  {
    if (dword_100140E48 <= 30)
    {
      id v5 = v2;
      if (dword_100140E48 != -1 || (v4 = _LogCategory_Initialize(), id v3 = v5, v4))
      {
        LogPrintF();
        id v3 = v5;
      }
    }
  }
}

id sub_100025F78(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _serverBTAddressChanged];
}

id sub_100025F80(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _serverBTAddressChanged];
}

void sub_100026538(id a1, CUTCPConnection *a2)
{
}

void *sub_100026544(uint64_t a1, uint64_t a2)
{
  id result = *(void **)(a1 + 32);
  if (result[102]) {
    return [result _serverTCPHandleConnectionStarted:a2];
  }
  return result;
}

id sub_100026A7C(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) invalidationHandled];
  if ((result & 1) == 0)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v3 = *(void **)(a1 + 40);
    return [v3 _serverTCPHandleConnectionEnded:v4];
  }
  return result;
}

void sub_100026AC8(uint64_t a1)
{
  if (([*(id *)(a1 + 32) controlFlags] & 0x200) == 0)
  {
    [*(id *)(a1 + 40) _stereoDeviceUpdate:0];
    [*(id *)(a1 + 40) _personalDeviceUpdate];
    uint64_t v2 = [*(id *)(a1 + 32) peerDeviceInfo];
    if (v2)
    {
      id v3 = v2;
      [*(id *)(a1 + 40) _activeDeviceChanged:v2 changes:2];
      uint64_t v2 = v3;
    }
  }
}

void sub_100026B5C(uint64_t a1, void *a2, void *a3, void *a4)
{
  int v7 = *(void **)(a1 + 32);
  id v8 = a4;
  id v9 = a3;
  id v10 = a2;
  [*(id *)(a1 + 40) _receivedEventID:v10 event:v9 options:v8 unauth:((unint64_t)objc_msgSend(v7, "flags") & 1) cnx:*(void *)(a1 + 32)];
}

void sub_100026BF4(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = *(void **)(a1 + 32);
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = a2;
  [*(id *)(a1 + 40) _receivedRequestID:v13 request:v12 options:v11 responseHandler:v10 unauth:objc_msgSend(v9, "flags") & 1 cnx:*(void *)(a1 + 32)];
}

id sub_100026CA0(uint64_t a1, uint64_t a2)
{
  id result = [*(id *)(a1 + 32) invalidationHandled];
  if ((result & 1) == 0)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    id v5 = *(void **)(a1 + 40);
    return [v5 _connectionStateChanged:a2 cnx:v6];
  }
  return result;
}

void sub_100026CF4(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 40);
  id v6 = [*(id *)(a1 + 32) peerDeviceInfo];
  id v3 = [v6 homeKitUserIdentifiers];
  uint64_t v4 = [v2 _filterHomeKitUserIdentifiers:v3];
  id v5 = [*(id *)(a1 + 32) peerDeviceInfo];
  [v5 setHomeKitUserIdentifiers:v4];
}

void sub_100026D8C(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) peerIdentifier];
  [v1 _sendProxyDeviceUpdateToPeer:v2];
}

void sub_100026E6C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) pairVerifyAuthType] == 9) {
    [v3 setCopyIdentityHandler:&stru_100121C28];
  }
}

CUPairingIdentity *__cdecl sub_100026ED0(id a1, unint64_t a2, id *a3)
{
  if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
  {
    unint64_t v16 = a2;
    LogPrintF();
  }
  id v5 = +[RPIdentityDaemon sharedIdentityDaemon];
  id v17 = 0;
  id v6 = [v5 identityOfTemporarySelfAndReturnError:&v17];
  id v7 = v17;

  if (v7) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = v6 == 0;
  }
  if (v8)
  {
    if (dword_100140E48 <= 90 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v9 = 0;
    if (a3) {
      *a3 = v7;
    }
  }
  else
  {
    id v9 = objc_alloc_init((Class)CUPairingIdentity);
    id v10 = +[RPIdentityDaemon sharedIdentityDaemon];
    id v11 = [v10 adHocPairingIdentifier];
    [v9 setIdentifier:v11];

    id v12 = [v6 deviceIRKData];
    [v9 setAltIRK:v12];

    id v13 = [v6 edPKData];
    [v9 setPublicKey:v13];

    if ((a2 & 2) != 0)
    {
      long long v14 = [v6 edSKData];
      [v9 setSecretKey:v14];
    }
  }

  return (CUPairingIdentity *)v9;
}

id sub_100027624(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) _bleServerHandleConnectionStarted:a2];
}

void sub_100027630(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (v3)
  {
    id v9 = v3;
    if (dword_100140E48 <= 90 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
    {
      id v8 = v9;
      LogPrintF();
    }
    [*(id *)(*(void *)(a1 + 32) + 232) invalidate:v8];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 232);
    *(void *)(v5 + 232) = 0;

    goto LABEL_10;
  }
  if (dword_100140E48 <= 30)
  {
    id v9 = 0;
    if (dword_100140E48 != -1 || (v7 = _LogCategory_Initialize(), uint64_t v4 = 0, v7))
    {
      [*(id *)(*(void *)(a1 + 32) + 232) listeningPSM];
      LogPrintF();
LABEL_10:
      uint64_t v4 = v9;
    }
  }
}

id sub_100027BB4(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) invalidationHandled];
  if ((result & 1) == 0)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v3 = *(void **)(a1 + 40);
    return _[v3 _bleServerHandleConnectionEnded:v4];
  }
  return result;
}

void sub_100027C00(uint64_t a1, void *a2, void *a3, void *a4)
{
  int v7 = *(void **)(a1 + 32);
  id v8 = a4;
  id v9 = a3;
  id v10 = a2;
  [*(id *)(a1 + 40) _receivedEventID:v10 event:v9 options:v8 unauth:[(unint64_t)objc_msgSend(v7, "flags") & 1] cnx:*(void *)(a1 + 32)];
}

void sub_100027C98(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = *(void **)(a1 + 32);
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = a2;
  [*(id *)(a1 + 40) _receivedRequestID:v13 request:v12 options:v11 responseHandler:v10 unauth:((unint64_t)objc_msgSend(v9, "flags") & 1) cnx:*(void *)(a1 + 32)];
}

id sub_100027D44(uint64_t a1, uint64_t a2)
{
  id result = [*(id *)(a1 + 32) invalidationHandled];
  if ((result & 1) == 0)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(a1 + 40);
    return [v5 _connectionStateChanged:a2 cnx:v6];
  }
  return result;
}

void sub_100027D98(uint64_t a1)
{
  id v2 = *(void **)(a1 + 40);
  id v6 = [*(id *)(a1 + 32) peerDeviceInfo];
  id v3 = [v6 homeKitUserIdentifiers];
  uint64_t v4 = [v2 _filterHomeKitUserIdentifiers:v3];
  uint64_t v5 = [*(id *)(a1 + 32) peerDeviceInfo];
  [v5 setHomeKitUserIdentifiers:v4];
}

void sub_100027E30(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) peerIdentifier];
  [v1 _sendProxyDeviceUpdateToPeer:v2];
}

id *sub_100028088(id *result)
{
  if (result[4]) {
    return (id *)[result[5] _btPipeHandleStateChanged:];
  }
  return result;
}

void sub_10002809C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (v3)
  {
    if (*(void *)(a1 + 32))
    {
      if (dword_100140E48 <= 90)
      {
        id v6 = v3;
        if (dword_100140E48 != -1 || (int v5 = _LogCategory_Initialize(), v4 = v6, v5))
        {
          LogPrintF();
          uint64_t v4 = v6;
        }
      }
    }
  }
}

void sub_100028490(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 376) state] == 1)
  {
    id v2 = [*(id *)(*(void *)(a1 + 32) + 376) peerDeviceInfo];
    if (v2)
    {
      id v6 = v2;
      unint64_t v3 = (unint64_t)[v2 statusFlags];
      BOOL v4 = [*(id *)(*(void *)(a1 + 32) + 368) peerHostState] == 1;
      id v2 = v6;
      BOOL v5 = v4;
      if ((v3 & 0xFFFFFFFFFFFFFFDFLL | (32 * v5)) != v3)
      {
        [v6 setStatusFlags:];
        [*(id *)(a1 + 32) _activeDeviceChanged:v6 changes:2];
        id v2 = v6;
      }
    }
  }
}

id sub_100028550(uint64_t a1, uint64_t a2)
{
  return [_objc_msgSend(*(id *)(a1 + 32), "_handleContextCollectorRequest:responseHandler:", a2);
}

id sub_10002855C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _[*(id *)(a1 + 32) _handleContextCollectorProxyRequest:a2 options:a3 responseHandler:a4];
}

id sub_100028860(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _btPipeConnectionStart];
}

id sub_100028C1C(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _btPipeConnectionEnded:*(void *)(a1 + 40)];
}

void sub_100028C28(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v5 = v3;
    BOOL v4 = GestaltGetDeviceClass() == 6;
    id v3 = v5;
    if (v4)
    {
      [*(id *)(a1 + 32) _btPipeSyncKeysIfNeeded];
      id v3 = v5;
    }
  }
}

void sub_100028C88(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) peerDeviceInfo];
  if (v2)
  {
    id v3 = v2;
    [*(id *)(a1 + 40) _activeDeviceChanged:v2 changes:2];
    id v2 = v3;
  }
}

id sub_100028CEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) _receivedEventID:a2 event:a3 options:a4 unauth:0 cnx:*(void *)(a1 + 40)];
}

id sub_100028D08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [*(id *)(a1 + 32) _receivedRequestID:a2 request:a3 options:a4 responseHandler:a5 unauth:0 cnx:*(void *)(a1 + 40)];
}

id sub_100028D28(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _connectionStateChanged:a2 cnx:*(void *)(a1 + 40)];
}

void sub_100028D38(uint64_t a1)
{
  id v2 = *(void **)(a1 + 40);
  id v6 = [*(id *)(a1 + 32) peerDeviceInfo];
  id v3 = [v6 homeKitUserIdentifiers];
  BOOL v4 = [v2 _filterHomeKitUserIdentifiers:v3];
  id v5 = [*(id *)(a1 + 32) peerDeviceInfo];
  [v5 setHomeKitUserIdentifiers:v4];
}

void sub_100028DD0(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) peerIdentifier];
  [v1 _sendProxyDeviceUpdateToPeer:v2];
}

void sub_10002956C(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v16 = a2;
  id v7 = a3;
  id v8 = v7;
  if (*(id *)(a1 + 32) != v7)
  {
    id v9 = [v7 peerDeviceInfo];
    id v10 = [v9 idsDeviceIdentifier];
    unsigned int v11 = [v10 isEqual:*(void *)(a1 + 40)];

    if (v11)
    {
      if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
      {
        id v12 = CUDescriptionWithLevel();
        long long v15 = CUDescriptionWithLevel();
        LogPrintF();
      }
      id v13 = *(void **)(a1 + 32);
      long long v14 = RPErrorF();
      [v13 invalidateWithError:v14];

      *a4 = 1;
    }
  }
}

void sub_100029EC0(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  uint64_t v5 = [*(id *)(a1 + 32) showPasswordHandler];
  id v6 = (void *)v5;
  if (v5) {
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, a2, v7);
  }
}

void sub_100029F38(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) hidePasswordHandler];
  if (v3)
  {
    id v4 = v3;
    v3[2](v3, a2);
    id v3 = (void (**)(void, void))v4;
  }
}

void sub_10002A888(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 identityResolved];
  if ([v4 type] == 9)
  {
    uint64_t v5 = [v4 identifier];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v6 = *(id *)(a1 + 32);
    id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v16;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          unsigned int v11 = [*(id *)(*((void *)&v15 + 1) + 8 * i) identifier];
          unsigned __int8 v12 = [v11 isEqual:v5];

          if (v12)
          {

            goto LABEL_16;
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
    {
      long long v14 = CUDescriptionWithLevel();
      LogPrintF();

      [v3 invalidate:v14];
    }
    else
    {
      [v3 invalidate:v13];
    }
LABEL_16:
  }
}

void sub_10002AC78(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 identityVerified];
  if ([v4 type] == 8)
  {
    uint64_t v5 = [v4 identifier];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v6 = *(id *)(a1 + 32);
    id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v16;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          unsigned int v11 = [*(id *)(*((void *)&v15 + 1) + 8 * i) identifier];
          unsigned __int8 v12 = [v11 isEqual:v5];

          if (v12)
          {

            goto LABEL_16;
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
    {
      long long v14 = CUDescriptionWithLevel();
      LogPrintF();

      [v3 invalidate:v14];
    }
    else
    {
      [v3 invalidate:v13];
    }
LABEL_16:
  }
}

void sub_10002B348(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10002B360(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  unsigned int v7 = [v6 linkType];
  unint64_t v8 = *(void *)(a1 + 56);
  if (((v8 & 0x400000) == 0 || v7 != 4)
    && ((v8 & 0x200000) == 0 || (v7 & 0xFFFFFFFE) != 6)
    && (((v8 & 0x200000) == 0 || !*(unsigned char *)(*(void *)(a1 + 32) + 929)) && ((v8 >> 42) & 1) == 0 || v7 != 8)
    && ((v8 & 0x10000000) == 0 || v7 == 10)
    && ((v8 & 0x20000000000) == 0 || v7 != 1))
  {
    uint64_t v9 = [v6 peerDeviceInfo];
    if (!v9) {
      goto LABEL_18;
    }
    id v10 = [v6 peerIdentifier];
    unsigned __int8 v11 = [v10 isEqual:*(void *)(a1 + 40)];

    if (v11) {
      goto LABEL_17;
    }
    unsigned __int8 v12 = [v9 identifier];
    unsigned __int8 v13 = [v12 isEqual:*(void *)(a1 + 40)];

    if ((v13 & 1) != 0
      || ([v9 idsDeviceIdentifier],
          long long v14 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v15 = [v14 isEqual:*(void *)(a1 + 40)],
          v14,
          (v15 & 1) != 0))
    {
LABEL_17:
      unsigned int v16 = 1;
    }
    else
    {
LABEL_18:
      long long v17 = [v6 identityVerified];
      long long v18 = [v17 idsDeviceID];
      unsigned int v16 = [v18 isEqual:*(void *)(a1 + 40)];
    }
    if ((*(unsigned char *)(a1 + 60) & 4) != 0)
    {
      uint64_t v19 = [v6 proxyDevices];

      if (!v19)
      {
        if (!v16)
        {
LABEL_37:

          goto LABEL_38;
        }
LABEL_34:
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v9);
        uint64_t v27 = *(id **)(a1 + 64);
        if (v27) {
          objc_storeStrong(v27, a2);
        }
        *a3 = 1;
        goto LABEL_37;
      }
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v20 = [v6 proxyDevices];
      id v21 = [v20 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v21)
      {
        id v22 = v21;
        long long v28 = v9;
        uint64_t v23 = *(void *)v30;
        while (2)
        {
          for (i = 0; i != v22; i = (char *)i + 1)
          {
            if (*(void *)v30 != v23) {
              objc_enumerationMutation(v20);
            }
            id v25 = [*(id *)(*((void *)&v29 + 1) + 8 * i) identifier];
            unsigned int v26 = [v25 isEqual:*(void *)(a1 + 40)];

            if (v26)
            {

              uint64_t v9 = v28;
              goto LABEL_34;
            }
          }
          id v22 = [v20 countByEnumeratingWithState:&v29 objects:v33 count:16];
          if (v22) {
            continue;
          }
          break;
        }

        uint64_t v9 = v28;
        goto LABEL_37;
      }
    }
    if ((v16 & 1) == 0) {
      goto LABEL_37;
    }
    goto LABEL_34;
  }
LABEL_38:
}

void sub_10002B740(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10002B758(uint64_t a1, void *a2, unsigned char *a3)
{
  id v9 = a2;
  id v6 = [v9 peerDeviceInfo];
  unsigned int v7 = [v6 idsDeviceIdentifier];
  unsigned int v8 = [v7 isEqual:*(void *)(a1 + 32)];

  if (v8 && [v9 linkType] == 6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }
}

void sub_10002BB50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10002BB68(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v5 = [a2 peerDeviceInfo];
  if (v5)
  {
    id obj = v5;
    id v6 = [v5 publicIdentifier];
    unsigned int v7 = [v6 isEqual:*(void *)(a1 + 32)];

    uint64_t v5 = obj;
    if (v7)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
      uint64_t v5 = obj;
      *a3 = 1;
    }
  }
}

void sub_10002BF74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44)
{
}

uint64_t sub_10002BFAC(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    *a4 = 1;
  }
  return result;
}

uint64_t sub_10002C008(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    *a4 = 1;
  }
  return result;
}

uint64_t sub_10002C064(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    *a4 = 1;
  }
  return result;
}

void sub_10002C180(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "_destinationID:matchesCnx:", *(void *)(a1 + 40))) {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void sub_10002C2CC(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = [v8 peerDeviceInfo];
  uint64_t v4 = [v3 identifier];

  uint64_t v5 = [v8 peerDeviceInfo];
  uint64_t v6 = [v5 idsDeviceIdentifier];

  if (!(v4 | v6))
  {
    if (dword_100140E48 <= 90 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    goto LABEL_17;
  }
  if (!v4)
  {
    unsigned __int8 v7 = 0;
    if (!v6) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  unsigned __int8 v7 = [*(id *)(a1 + 32) containsObject:v4];
  if (v6) {
LABEL_7:
  }
    v7 |= [*(id *)(a1 + 32) containsObject:v6];
LABEL_8:
  if (v4) {
    [*(id *)(a1 + 32) addObject:v4];
  }
  if (v6) {
    [*(id *)(a1 + 32) addObject:v6];
  }
  if ((v7 & 1) == 0) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
LABEL_17:
}

void sub_10002EA0C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = [a3 server];
  id v6 = [v4 serviceType];

  uint64_t v5 = v6;
  if (v6)
  {
    [*(id *)(a1 + 32) addObject:v6];
    uint64_t v5 = v6;
  }
}

id sub_10002ED50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _[*(id *)(a1 + 32) _interestSendEventID:a2 event:a3];
}

void sub_10002EF04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 585) = 0;
  if (a2 && !a3)
  {
    uint64_t v4 = MRPairedDeviceCopyIdentifier();
    uint64_t v5 = (void *)v4;
    if (!v4)
    {
      if (dword_100140E48 > 90
        || (v14 = 0, dword_100140E48 == -1) && (v11 = _LogCategory_Initialize(), uint64_t v5 = 0, !v11))
      {
LABEL_28:

        return;
      }
      LogPrintF();
LABEL_27:
      uint64_t v5 = v14;
      goto LABEL_28;
    }
    id v14 = (id)v4;
    id v6 = [*(id *)(*(void *)(a1 + 32) + 1040) mediaRemoteIdentifier];
    id v7 = v14;
    id v8 = v6;
    id v9 = v8;
    if (v7 == v8)
    {
    }
    else
    {
      if (v8)
      {
        unsigned __int8 v10 = [v7 isEqual:v8];

        if (v10) {
          goto LABEL_26;
        }
      }
      else
      {
      }
      if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
      {
        unsigned __int8 v12 = v9;
        id v13 = v7;
        LogPrintF();
      }
      [*(id *)(*(void *)(a1 + 32) + 1040) setMediaRemoteIdentifier:v7, v12, v13];
      [*(id *)(*(void *)(a1 + 32) + 1040) setChanged:1];
      [*(id *)(a1 + 32) _update];
      id v7 = +[RPDaemon sharedDaemon];
      [v7 postDaemonInfoChanges:0x20000];
    }

LABEL_26:
    goto LABEL_27;
  }
  if (dword_100140E48 <= 90 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
}

void sub_10002F1E0(uint64_t a1, void *a2, void *a3)
{
  id v15 = a2;
  id v5 = a3;
  [*(id *)(a1 + 32) invalidate];
  *(unsigned char *)(*(void *)(a1 + 40) + 586) = 0;
  if (v15 && !v5)
  {
    id v6 = [*(id *)(*(void *)(a1 + 40) + 1040) mediaRouteIdentifier];
    id v7 = [v15 identifier];
    id v8 = [v7 UUIDString];

    if (v8)
    {
      id v9 = v8;
      id v10 = v6;
      int v11 = v10;
      if (v9 == v10)
      {
      }
      else
      {
        if (v10)
        {
          unsigned __int8 v12 = [v9 isEqual:v10];

          if (v12) {
            goto LABEL_21;
          }
        }
        else
        {
        }
        if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
        {
          id v13 = v11;
          id v14 = v9;
          LogPrintF();
        }
        [*(id *)(*(void *)(a1 + 40) + 1040) setMediaRouteIdentifier:v9, v13, v14];
        [*(id *)(*(void *)(a1 + 40) + 1040) setChanged:1];
        [*(id *)(a1 + 40) _update];
        int v11 = +[RPDaemon sharedDaemon];
        [v11 postDaemonInfoChanges:0x20000];
      }
    }
LABEL_21:

    goto LABEL_22;
  }
  if (dword_100140E48 <= 90 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
LABEL_22:
}

id sub_10002F67C(uint64_t a1, uint64_t a2)
{
  return [_objc_msgSend(*(id *)(a1 + 32), "_miscHandleLaunchAppRequest:responseHandler:", a2);
}

id sub_10002F688(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _miscHandleSpeakRequest:a2];
}

id sub_10002F694(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return _[*(id *)(a1 + 32) _sessionHandleStartRequest:a3 options:a4 cnx:a2 responseHandler:a5];
}

id sub_10002F6A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return _[*(id *)(a1 + 32) _sessionHandleStopRequest:a3 options:a4 cnx:a2 responseHandler:a5];
}

void sub_10002F9E8(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 48))
  {
    id v2 = off_100140ED0();
    id v9 = v2;
    id v10 = &__kCFBooleanTrue;
    id v3 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  }
  else
  {
    id v3 = 0;
  }
  uint64_t v4 = [(objc_class *)off_100140ED8() optionsWithDictionary:v3];
  id v5 = [(objc_class *)off_100140EE0() serviceWithDefaultShellEndpoint];
  uint64_t v6 = *(void *)(a1 + 32);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002FB58;
  v7[3] = &unk_100121EF8;
  v7[4] = v6;
  id v8 = *(id *)(a1 + 40);
  [v5 openApplication:v6 withOptions:v4 completion:v7];
}

void sub_10002FB58(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (v5)
  {
    if (dword_100140E48 > 90 || dword_100140E48 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_11;
    }
LABEL_7:
    LogPrintF();
    goto LABEL_11;
  }
  if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
    goto LABEL_7;
  }
LABEL_11:
  (*(void (**)(void, void *))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), &__NSDictionary0__struct);
}

void sub_10002FC98(uint64_t a1)
{
  id v2 = [(objc_class *)off_100140EE8() defaultWorkspace];
  uint64_t v3 = *(void *)(a1 + 32);
  id v8 = 0;
  unsigned __int8 v4 = [v2 openURL:v3 withOptions:&__NSDictionary0__struct error:&v8];
  id v5 = v8;

  if (v4)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    if (dword_100140E48 <= 90 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    uint64_t v6 = *(void *)(a1 + 40);
    id v7 = RPNestedErrorF();
    (*(void (**)(uint64_t, void, void, void *))(v6 + 16))(v6, 0, 0, v7);
  }
}

id sub_10002FF6C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 40);
  if (a2) {
    id v5 = 0;
  }
  else {
    id v5 = &__NSDictionary0__struct;
  }
  (*(void (**)(uint64_t, void *, void, uint64_t))(v4 + 16))(v4, v5, 0, a2);
  uint64_t v6 = *(void **)(a1 + 32);

  return [v6 invalidate];
}

id sub_1000301EC(id result)
{
  uint64_t v1 = *((void *)result + 4);
  if (*(unsigned char *)(v1 + 745))
  {
    *(unsigned char *)(v1 + 744) = *((unsigned char *)result + 40);
    return [*((id *)result + 4) _stereoDeviceUpdate:0];
  }
  return result;
}

unsigned char *sub_100030210(uint64_t a1)
{
  uint64_t result = *(unsigned char **)(a1 + 32);
  if (result[584]) {
    return [result _serverBonjourUpdateTXT];
  }
  return result;
}

void sub_1000303A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000303BC(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (([v7 statusFlags] & 0x80000) != 0
    && ([v7 controlFlags] & 0x200) == 0)
  {
    uint64_t v4 = [v7 peerDeviceInfo];
    id v5 = [v4 idsDeviceIdentifier];
    if ([v5 isEqual:*(void *)(a1 + 32)])
    {
      if (([v4 isPersonal] & 1) == 0)
      {
        [v4 setPersonal:1];
LABEL_8:
        [v4 setStatusFlags:((unint64_t)[v4 statusFlags] | 0x80)];
        [*(id *)(a1 + 40) _activeDeviceChanged:v4 changes:2];
      }
    }
    else
    {
      unint64_t v6 = (unint64_t)[v4 statusFlags] & 0x10000080000;
      if ([v4 isPersonal] != (v6 == 0x10000080000))
      {
        [v4 setPersonal:v6 == 0x10000080000];
        if (v6 != 0x10000080000)
        {
          [v4 setStatusFlags:((unint64_t)[v4 statusFlags] & 0xFFFFFFFFFFFFFF7FLL)];
          [*(id *)(a1 + 40) _activeDeviceChanged:v4 changes:2];
          goto LABEL_11;
        }
        goto LABEL_8;
      }
      if (v6 != 0x10000080000)
      {
LABEL_11:

        goto LABEL_12;
      }
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
    goto LABEL_11;
  }
LABEL_12:
}

void sub_100031254(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
}

void sub_1000312B0(uint64_t a1, void *a2)
{
  id v9 = a2;
  if (([v9 statusFlags] & 0x80000) != 0
    && ([v9 controlFlags] & 0x200) == 0
    && [v9 state] == 1)
  {
    uint64_t v4 = [v9 peerDeviceInfo];
    if ([v4 mediaSystemRole] == *(_DWORD *)(a1 + 56))
    {
      id v5 = [v4 mediaSystemIdentifier];
      unsigned int v6 = [v5 isEqual:*(void *)(a1 + 32)];

      if (v6)
      {
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
        id v7 = [v9 peerIdentifier];
        id v8 = v7;
        if (v7
          && *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)
          && ((unint64_t)objc_msgSend(v7, "caseInsensitiveCompare:") & 0x8000000000000000) != 0)
        {
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v8);
        }
      }
    }
  }
}

id sub_1000313D0(uint64_t a1)
{
  return [*(id *)(a1 + 32) _update];
}

void *sub_1000318F4(void *result)
{
  if (*(void *)(result[4] + 536))
  {
    uint64_t v1 = result;
    id v2 = +[RPIdentityDaemon sharedIdentityDaemon];
    uint64_t v3 = [*(id *)(v1[4] + 536) resolvableAccessories];
    [v2 resolvableAccessoriesUpdated:v3];

    uint64_t v4 = (void *)v1[4];
    return [v4 _clientBonjourReevaluateUnauthDevices];
  }
  return result;
}

void *sub_100031988(uint64_t a1)
{
  uint64_t result = *(void **)(a1 + 32);
  if (result[67]) {
    return _[result _homeKitSelfAccessoryMediaAccessUpdated];
  }
  return result;
}

void *sub_10003199C(uint64_t a1)
{
  uint64_t result = *(void **)(a1 + 32);
  if (result[67]) {
    return [result _homeKitSelfAccessoryMediaSystemUpdated:0];
  }
  return result;
}

void *sub_1000319B4(uint64_t a1)
{
  uint64_t result = *(void **)(a1 + 32);
  if (result[67]) {
    return _[result _homeKitSelfAccessoryUpdated];
  }
  return result;
}

void *sub_1000319C8(uint64_t a1)
{
  uint64_t result = *(void **)(a1 + 32);
  if (result[67]) {
    return _[result _homeKitSelfAccessoryUpdated];
  }
  return result;
}

void *sub_1000319DC(void *result, int a2)
{
  if (a2 == 1)
  {
    id v2 = result;
    uint64_t result = (void *)result[4];
    if (result[67])
    {
      if (!*((unsigned char *)result + 512) && !*((unsigned char *)result + 513))
      {
        if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        *(unsigned char *)(v2[4] + 512) = 1;
        uint64_t result = (void *)v2[4];
      }
      return [result _homeKitEnsureStarted];
    }
  }
  return result;
}

id sub_100031A9C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updatePersonalRequestsStateForHomeHubDevices];
}

id sub_100031AA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _[*(id *)(a1 + 32) _updateRoomInfoForHomeHubDevice:a2 roomName:a3];
}

id sub_100031CA0(uint64_t a1)
{
  return [*(id *)(a1 + 32) _homeKitGetPairingIdentities];
}

void *sub_100031D98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 513) = 0;
  uint64_t result = *(void **)(a1 + 32);
  if (result[67]) {
    return _[result _homeKitIdentityUpdated:a2 error:a3];
  }
  return result;
}

void sub_1000324F4(id a1, RPConnection *a2, BOOL *a3)
{
  uint64_t v3 = a2;
  if (([(RPConnection *)v3 controlFlags] & 0x200) == 0) {
    [(RPConnection *)v3 homeKitIdentityUpdated];
  }
}

void sub_100033F8C(id a1, NSError *a2)
{
  id v2 = a2;
  uint64_t v3 = v2;
  if (v2)
  {
    if (dword_100140E48 <= 90)
    {
      id v5 = v2;
      if (dword_100140E48 != -1 || (v4 = _LogCategory_Initialize(), uint64_t v3 = v5, v4))
      {
        LogPrintF();
        uint64_t v3 = v5;
      }
    }
  }
}

void sub_1000341BC(id a1, NSError *a2)
{
  id v2 = a2;
  uint64_t v3 = v2;
  if (v2)
  {
    if (dword_100140E48 <= 90)
    {
      id v5 = v2;
      if (dword_100140E48 != -1 || (v4 = _LogCategory_Initialize(), uint64_t v3 = v5, v4))
      {
        LogPrintF();
        uint64_t v3 = v5;
      }
    }
  }
}

void sub_100034DC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
  _Block_object_dispose(&a63, 8);
  _Block_object_dispose(&a67, 8);
  _Unwind_Resume(a1);
}

void sub_100034E04(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v13 = 0;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  [v3 canDecode128bit];
  Data = (void *)OPACKEncoderCreateData();
  if (!Data)
  {
    if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
    {
      uint64_t v5 = RPErrorF();
      uint64_t v6 = *(void *)(*(void *)(a1 + 64) + 8);
      id v7 = *(void **)(v6 + 40);
      *(void *)(v6 + 40) = v5;
    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
  uint64_t v8 = *(unsigned int *)(a1 + 80);
  uint64_t v9 = *(void *)(a1 + 48);
  uint64_t v10 = *(void *)(a1 + 56);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100034F34;
  v12[3] = &unk_100122098;
  uint64_t v11 = *(void *)(a1 + 64);
  void v12[4] = *(void *)(a1 + 32);
  v12[5] = v11;
  [v3 sendEncryptedEventID:v9 data:Data xid:v8 options:v10 completion:v12];
  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
}

void sub_100034F34(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (v7)
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v6 = *(void *)(v4 + 40);
    uint64_t v5 = (id *)(v4 + 40);
    if (!v6) {
      objc_storeStrong(v5, a2);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_100034FA0(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v13 = 0;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  [v3 canDecode128bit];
  Data = (void *)OPACKEncoderCreateData();
  if (!Data)
  {
    if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
    {
      uint64_t v5 = RPErrorF();
      uint64_t v6 = *(void *)(*(void *)(a1 + 64) + 8);
      id v7 = *(void **)(v6 + 40);
      *(void *)(v6 + 40) = v5;
    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
  uint64_t v8 = *(unsigned int *)(a1 + 80);
  uint64_t v9 = *(void *)(a1 + 48);
  uint64_t v10 = *(void *)(a1 + 56);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000350D0;
  v12[3] = &unk_100122098;
  uint64_t v11 = *(void *)(a1 + 64);
  void v12[4] = *(void *)(a1 + 32);
  v12[5] = v11;
  [v3 sendEncryptedEventID:v9 data:Data xid:v8 options:v10 completion:v12];
  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
}

void sub_1000350D0(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (v7)
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v6 = *(void *)(v4 + 40);
    uint64_t v5 = (id *)(v4 + 40);
    if (!v6) {
      objc_storeStrong(v5, a2);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t sub_10003513C(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  }
  return result;
}

void sub_100035E54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *sub_100035E6C(void *result, void *a2, unsigned char *a3)
{
  uint64_t v3 = *(void *)(result[8] + 8);
  if (!*(unsigned char *)(v3 + 24))
  {
    *(unsigned char *)(v3 + 24) = 1;
    uint64_t result = [a2 sendEncryptedRequestID:result[4] request:result[5] xpcID:*((unsigned int *)result + 18) options:result[6] responseHandler:result[7]];
    *a3 = 1;
  }
  return result;
}

void sub_1000377C0(id a1, NSError *a2)
{
  id v2 = a2;
  uint64_t v3 = v2;
  if (v2)
  {
    if (dword_100140E48 <= 90)
    {
      uint64_t v5 = v2;
      if (dword_100140E48 != -1 || (v4 = _LogCategory_Initialize(), uint64_t v3 = v5, v4))
      {
        LogPrintF();
        uint64_t v3 = v5;
      }
    }
  }
}

void sub_100038114(uint64_t a1)
{
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  id v8 = [*(id *)(*(void *)(a1 + 40) + 560) objectForKeyedSubscript:*(void *)(a1 + 48)];
  [v8 setTimer:0];
  [*(id *)(*(void *)(a1 + 40) + 560) setObject:0 forKeyedSubscript:*(void *)(a1 + 48)];
  mach_absolute_time();
  [v8 sendTicks];
  UpTicksToSecondsF();
  if (dword_100140E48 <= 90)
  {
    uint64_t v3 = v2;
    if (dword_100140E48 != -1 || _LogCategory_Initialize())
    {
      [v8 requestID];
      uint64_t v6 = v7 = v3;
      LogPrintF();
    }
  }
  [v8 responseHandler:v6, v7];
  int v4 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
  uint64_t v5 = RPErrorF();
  ((void (**)(void, void, void, void *))v4)[2](v4, 0, 0, v5);
}

void sub_1000387B8(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  id v8 = [*(id *)(*(void *)(a1 + 32) + 560) objectForKeyedSubscript:*(void *)(a1 + 40)];
  if (v8)
  {
    [*(id *)(*(void *)(a1 + 32) + 560) setObject:0 forKeyedSubscript:*(void *)(a1 + 40)];
    uint64_t v9 = [v8 timer];
    [v8 setTimer:0];
    if (v9) {
      dispatch_source_cancel(v9);
    }
    uint64_t v10 = [v8 responseHandler];
    if (v7)
    {
      if (dword_100140E48 <= 90 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
      {
        id v15 = [*(id *)(a1 + 56) identifier];
        LogPrintF();
      }
      ((void (**)(void, void, void, id))v10)[2](v10, 0, 0, v7);
    }
    else
    {
      if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
      {
        id v14 = [*(id *)(a1 + 40) unsignedIntegerValue];
        LogPrintF();
      }
      v16[0] = @"dlt";
      v16[1] = @"senderID";
      uint64_t v12 = *(void *)(a1 + 40);
      uint64_t v11 = *(void *)(a1 + 48);
      v17[0] = &off_10012B090;
      v17[1] = v11;
      v16[2] = @"xid";
      v17[2] = v12;
      int v13 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v17, v16, 3, v14);
      ((void (**)(void, id, void *, void))v10)[2](v10, v6, v13, 0);
    }
  }
  else if (dword_100140E48 <= 90 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
  {
    [*(id *)(a1 + 40) unsignedIntegerValue];
    LogPrintF();
  }
}

void sub_100038F58(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v11 = a4;
  if (v11)
  {
    if (dword_100140E48 <= 90 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    (*(void (**)(void, id, uint64_t, uint64_t))(*(void *)(a1 + 72) + 16))(*(void *)(a1 + 72), v11, v9, v10);
  }
  else
  {
    uint64_t Int64 = CFDictionaryGetInt64();
    if (Int64)
    {
      uint64_t v13 = *(void *)(a1 + 80) | (Int64 << 32);
      id v14 = +[NSNumber numberWithUnsignedLongLong:v13];
      id v15 = [*(id *)(a1 + 56) peerIdentifier];
      [*(id *)(a1 + 48) setPeerID:v15];

      [*(id *)(a1 + 48) setSessionID:v13];
      unsigned int v16 = *(void **)(*(void *)(a1 + 64) + 1064);
      if (!v16)
      {
        id v17 = objc_alloc_init((Class)NSMutableDictionary);
        uint64_t v18 = *(void *)(a1 + 64);
        uint64_t v19 = *(void **)(v18 + 1064);
        *(void *)(v18 + 1064) = v17;

        unsigned int v16 = *(void **)(*(void *)(a1 + 64) + 1064);
      }
      [v16 setObject:*(void *)(a1 + 48) forKeyedSubscript:v14];
      if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      (*(void (**)(void, void, uint64_t, uint64_t))(*(void *)(a1 + 72) + 16))(*(void *)(a1 + 72), 0, v20, v21);
    }
    else
    {
      id v14 = RPErrorF();
      if (dword_100140E48 <= 90 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      (*(void (**)(void, void *, uint64_t, uint64_t))(*(void *)(a1 + 72) + 16))(*(void *)(a1 + 72), v14, v22, v23);
    }
  }
}

void sub_1000394BC(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v11 = a2;
  id v7 = a3;
  id v10 = a4;
  if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  (*(void (**)(void, id, uint64_t, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v10, v8, v9);
}

void sub_100039D44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,char a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a52, 8);
  (*(void (**)(void))(a15 + 16))();
  _Block_object_dispose(&a65, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100039DD0(uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 40) + 8) + 40))
  {
    uint64_t v1 = result;
    if (dword_100140E48 <= 90 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    uint64_t v2 = *(uint64_t (**)(void))(*(void *)(v1 + 32) + 16);
    return v2();
  }
  return result;
}

void sub_100039EAC(void *a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v10 = a3;
  id v7 = [v10 server];
  uint64_t v8 = [v7 serviceType];
  unsigned int v9 = [v8 isEqual:a1[4]];

  if (v9)
  {
    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a3);
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), v7);
    *a4 = 1;
  }
}

void sub_100039F68(void *a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v4 = a1[7];
    uint64_t v5 = RPNestedErrorF();
    (*(void (**)(uint64_t, void, void, void *))(v4 + 16))(v4, 0, 0, v5);

    [*(id *)(a1[4] + 1064) setObject:0 forKeyedSubscript:a1[5]];
    id v6 = (void *)a1[6];
    [v6 invalidate];
  }
  else
  {
    CFStringRef v9 = @"_sid";
    id v7 = +[NSNumber numberWithUnsignedLongLong:a1[8]];
    id v10 = v7;
    uint64_t v8 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];

    (*(void (**)(void))(a1[7] + 16))();
  }
}

void sub_10003A4DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  (*(void (**)(uint64_t))(v13 + 16))(v13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10003A520(uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 40) + 8) + 40))
  {
    uint64_t v1 = result;
    if (dword_100140E48 <= 90 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    uint64_t v2 = *(uint64_t (**)(void))(*(void *)(v1 + 32) + 16);
    return v2();
  }
  return result;
}

void sub_10003A9D0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_10003A9E8(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = (id)a1[4];
  if (v4) {
    BOOL v5 = v4 == v3;
  }
  else {
    BOOL v5 = 0;
  }
  if (!v5)
  {
    id v11 = v3;
    id v6 = [v3 session];
    id v7 = [v6 cnx];
    uint64_t v8 = v7;
    if (v7 == (void *)a1[5])
    {

      id v3 = v11;
    }
    else
    {
      CFStringRef v9 = [v11 netCnx];
      id v10 = (void *)a1[5];

      id v3 = v11;
      if (v9 != v10) {
        goto LABEL_10;
      }
    }
    ++*(void *)(*(void *)(a1[6] + 8) + 24);
  }
LABEL_10:
}

void sub_10003AABC(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 cnx];
  BOOL v5 = *(void **)(a1 + 32);

  if (v4 == v5) {
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
}

uint64_t sub_10003AD60(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_10003B5F4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _xpcConnectionInvalidated:*(void *)(a1 + 40)];
}

void sub_10003C19C(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (v5 && dword_100140E48 <= 20 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = v5;
    LogPrintF();
  }
  [*(id *)(a1 + 40) connectionInvalidatedCore:v3, v4];
}

void sub_10003C4F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10003C50C(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (([*(id *)(a1 + 32) _connectionHasActiveSessions:v5] & 1) == 0
    && ([v5 controlFlags] & 0x200) != 0)
  {
    uint64_t v6 = [v5 client];
    if (!v6
      || (id v7 = (void *)v6,
          [v5 client],
          uint64_t v8 = objc_claimAutoreleasedReturnValue(),
          CFStringRef v9 = *(void **)(*(void *)(a1 + 32) + 48),
          v8,
          v7,
          v8 == v9))
    {
      [v5 invalidate];
      [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v10];
    }
  }
}

void sub_10003C9F0(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 104) identifier];
  if (v3
    || ([*(id *)(*(void *)(a1 + 32) + 48) destinationDevice],
        id v4 = objc_claimAutoreleasedReturnValue(),
        [v4 identifier],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        v4,
        v3))
  {
    [*(id *)(*(void *)(a1 + 32) + 96) interestDeregisterEventID:v5 peerIdentifier:v3];
  }
}

void sub_10003CA94(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = v2;
  if (dword_100140E48 <= 30)
  {
    id v5 = v2;
    if (dword_100140E48 != -1 || (v4 = _LogCategory_Initialize(), uint64_t v3 = v5, v4))
    {
      LogPrintF();
      uint64_t v3 = v5;
    }
  }
}

void sub_10003D1C0(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  int v4 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) launchInstanceID];
  LODWORD(v4) = [v4 shouldReportDevice:v6 toXPCConnectionWithLaunchInstanceID:v5 outReason:0];

  if (v4) {
    [*(id *)(a1 + 48) addObject:v6];
  }
}

void sub_10003D248(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  int v4 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) launchInstanceID];
  LODWORD(v4) = [v4 shouldReportDevice:v6 toXPCConnectionWithLaunchInstanceID:v5 outReason:0];

  if (v4) {
    [*(id *)(a1 + 48) addObject:v6];
  }
}

void sub_10003D2D0(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  int v4 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) launchInstanceID];
  LODWORD(v4) = [v4 shouldReportDevice:v6 toXPCConnectionWithLaunchInstanceID:v5 outReason:0];

  if (v4) {
    [*(id *)(a1 + 48) addObject:v6];
  }
}

void sub_10003D358(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  int v4 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) launchInstanceID];
  LODWORD(v4) = [v4 shouldReportDevice:v6 toXPCConnectionWithLaunchInstanceID:v5 outReason:0];

  if (v4) {
    [*(id *)(a1 + 48) addObject:v6];
  }
}

void sub_10003D3E0(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  int v4 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) launchInstanceID];
  LODWORD(v4) = [v4 shouldReportDevice:v6 toXPCConnectionWithLaunchInstanceID:v5 outReason:0];

  if (v4) {
    [*(id *)(a1 + 48) addObject:v6];
  }
}

void sub_10003D468(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  int v4 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) launchInstanceID];
  LODWORD(v4) = [v4 shouldReportDevice:v6 toXPCConnectionWithLaunchInstanceID:v5 outReason:0];

  if (v4) {
    [*(id *)(a1 + 48) addObject:v6];
  }
}

void sub_10003ED58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
}

uint64_t sub_10003EDF0(uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 56) + 8) + 40))
  {
    uint64_t v1 = result;
    if (dword_100140E48 <= 90 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
    {
      [*(id *)(*(void *)(v1 + 40) + 208) processIdentifier];
      LogPrintF();
    }
    uint64_t result = *(void *)(v1 + 48);
    if (result)
    {
      uint64_t v2 = *(uint64_t (**)(void))(result + 16);
      return v2();
    }
  }
  return result;
}

void sub_10003EED8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    int v4 = [*(id *)(*(void *)(a1 + 32) + 192) cnx];
    unint64_t v5 = (unint64_t)[v4 statusFlags];

    unsigned __int8 v6 = [*(id *)(a1 + 40) flags];
    if ((v5 & 0x70000AE000) == 0 && (v6 & 1) == 0)
    {
      if (dword_100140E48 <= 90 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      RPErrorF();
      id v3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v3 = 0;
    }
  }
  uint64_t v8 = *(void *)(a1 + 56);
  if (v8)
  {
    if (v3) {
      CFStringRef v9 = 0;
    }
    else {
      CFStringRef v9 = &__NSArray0__struct;
    }
    id v10 = v3;
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
    id v3 = v10;
  }
}

void sub_100040B54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
}

uint64_t sub_100040BB8(uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 40) + 8) + 40))
  {
    uint64_t v1 = result;
    if (dword_100140E48 <= 90 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    uint64_t v2 = *(uint64_t (**)(void))(*(void *)(v1 + 32) + 16);
    return v2();
  }
  return result;
}

void sub_100040C8C(uint64_t a1, uint64_t a2, void *a3)
{
  int v4 = *(void **)(*(void *)(a1 + 32) + 208);
  id v5 = a3;
  id v6 = [v4 remoteObjectProxy];
  [v6 xpcServerShowPassword:v5 flags:a2];
}

void sub_100040D00(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(*(void *)(a1 + 32) + 208) remoteObjectProxy];
  [v3 xpcServerHidePassword:a2];
}

Class sub_1000414C8()
{
  if (qword_100142BE8 != -1) {
    dispatch_once(&qword_100142BE8, &stru_1001223C8);
  }
  Class result = objc_getClass("SFDeviceDiscovery");
  qword_100142BE0 = (uint64_t)result;
  off_100140EB8 = (uint64_t (*)())sub_10004152C;
  return result;
}

id sub_10004152C()
{
  return (id)qword_100142BE0;
}

void sub_100041538(id a1)
{
  qword_100142BF0 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/Sharing.framework/Sharing", 2);
}

Class sub_100041564()
{
  if (qword_100142BE8 != -1) {
    dispatch_once(&qword_100142BE8, &stru_1001223C8);
  }
  Class result = objc_getClass("SFService");
  qword_100142BF8 = (uint64_t)result;
  off_100140EC0 = (uint64_t (*)())sub_1000415C8;
  return result;
}

id sub_1000415C8()
{
  return (id)qword_100142BF8;
}

Class sub_1000415D4()
{
  if (qword_100142BE8 != -1) {
    dispatch_once(&qword_100142BE8, &stru_1001223C8);
  }
  Class result = objc_getClass("SFClient");
  qword_100142C00 = (uint64_t)result;
  off_100140EC8 = (uint64_t (*)())sub_100041638;
  return result;
}

id sub_100041638()
{
  return (id)qword_100142C00;
}

id sub_100041644()
{
  if (qword_100142C08 != -1) {
    dispatch_once(&qword_100142C08, &stru_1001223E8);
  }
  v0 = (id *)dlsym((void *)qword_100142C10, "FBSOpenApplicationOptionKeyActivateSuspended");
  if (v0) {
    objc_storeStrong((id *)&qword_100142BD8, *v0);
  }
  off_100140ED0 = (uint64_t (*)())sub_1000416D4;
  uint64_t v1 = (void *)qword_100142BD8;

  return v1;
}

id sub_1000416D4()
{
  return (id)qword_100142BD8;
}

void sub_1000416E0(id a1)
{
  qword_100142C10 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/FrontBoardServices.framework/FrontBoardServices", 2);
}

Class sub_10004170C()
{
  if (qword_100142C08 != -1) {
    dispatch_once(&qword_100142C08, &stru_1001223E8);
  }
  Class result = objc_getClass("FBSOpenApplicationOptions");
  qword_100142C18 = (uint64_t)result;
  off_100140ED8 = (uint64_t (*)())sub_100041770;
  return result;
}

id sub_100041770()
{
  return (id)qword_100142C18;
}

Class sub_10004177C()
{
  if (qword_100142C08 != -1) {
    dispatch_once(&qword_100142C08, &stru_1001223E8);
  }
  Class result = objc_getClass("FBSOpenApplicationService");
  qword_100142C20 = (uint64_t)result;
  off_100140EE0 = (uint64_t (*)())sub_1000417E0;
  return result;
}

id sub_1000417E0()
{
  return (id)qword_100142C20;
}

Class sub_1000417EC()
{
  if (qword_100142C30 != -1) {
    dispatch_once(&qword_100142C30, &stru_100122408);
  }
  Class result = objc_getClass("LSApplicationWorkspace");
  qword_100142C28 = (uint64_t)result;
  off_100140EE8 = (uint64_t (*)())sub_100041850;
  return result;
}

id sub_100041850()
{
  return (id)qword_100142C28;
}

void sub_10004185C(id a1)
{
  qword_100142C38 = (uint64_t)dlopen("/System/Library/Frameworks/MobileCoreServices.framework/MobileCoreServices", 2);
}

void sub_100041984(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 60))
  {
    if (dword_100141070 <= 30 && (dword_100141070 != -1 || _LogCategory_Initialize()))
    {
      +[RPNWFramer controlCodeToString:*(unsigned int *)(a1 + 56)];
      strerror(*(unsigned __int8 *)(a1 + 60));
LABEL_8:
      LogPrintF();
    }
  }
  else if (dword_100141070 <= 30 && (dword_100141070 != -1 || _LogCategory_Initialize()))
  {
    +[RPNWFramer controlCodeToString:*(unsigned int *)(a1 + 56)];
    goto LABEL_8;
  }
}

void sub_100041BBC(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) length];
  id v3 = (const uint8_t *)[*(id *)(a1 + 32) bytes];
  *(void *)output_buffer = 0;
  id v5 = v2;
  nw_framer_write_output(*(nw_framer_t *)(a1 + 40), output_buffer, 0x10uLL);
  if (dword_100141070 <= 30 && (dword_100141070 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  nw_framer_write_output(*(nw_framer_t *)(a1 + 40), v3, (size_t)v2);
  if (dword_100141070 <= 30 && (dword_100141070 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
}

void sub_100041F8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Block_object_dispose((const void *)(v11 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100041FBC(uint64_t a1, void *a2)
{
  id v6 = a2;
  while (1)
  {
    do
    {
      uint64_t v7 = *(void *)(a1 + 56);
      if (*(unsigned char *)(*(void *)(v7 + 8) + 24)) {
        break;
      }
      uint64_t v27 = 0;
      long long v28 = &v27;
      uint64_t v29 = 0x3010000000;
      long long v30 = &unk_1000FFA8E;
      uint64_t v31 = 0;
      uint64_t v32 = 0;
      parse[0] = _NSConcreteStackBlock;
      parse[1] = 3221225472;
      parse[2] = sub_100042410;
      parse[3] = &unk_100122668;
      uint64_t v26 = 16;
      parse[4] = &v27;
      parse[5] = v7;
      long long v25 = *(_OWORD *)(a1 + 64);
      if (!nw_framer_parse_input(v6, 0x10uLL, 0x10uLL, 0, parse))
      {
        _Block_object_dispose(&v27, 8);
        uint64_t v14 = 16;
        goto LABEL_41;
      }
      if (dword_100141070 <= 40 && (dword_100141070 != -1 || _LogCategory_Initialize()))
      {
        uint64_t v8 = +[RPNWFramer controlCodeToString:](RPNWFramer, "controlCodeToString:", *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24), v16, v17, v18, v19);
        uint64_t v9 = *((unsigned __int8 *)v28 + 33);
        uint64_t v18 = strerror(*((unsigned __int8 *)v28 + 33));
        uint64_t v19 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
        unsigned int v16 = v8;
        uint64_t v17 = v9;
        LogPrintF();
      }
      _Block_object_dispose(&v27, 8);
    }
    while (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24));
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
    {
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) == 3)
      {
        if (dword_100141070 <= 40 && (dword_100141070 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
      }
      else
      {
        if (dword_100141070 <= 90 && (dword_100141070 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        nw_framer_mark_failed_with_error(*(nw_framer_t *)(a1 + 32), 57);
      }
      (*(void (**)(void, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v3, v4, v5);
      goto LABEL_40;
    }
    if (!*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)) {
      break;
    }
    if (dword_100141070 <= 40 && (dword_100141070 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    uint64_t v10 = *(void *)(a1 + 72);
    size_t v11 = *(void *)(*(void *)(v10 + 8) + 24);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100042480;
    v20[3] = &unk_100122690;
    uint64_t v22 = v10;
    id v12 = *(id *)(a1 + 40);
    uint64_t v13 = *(void *)(a1 + 56);
    id v21 = v12;
    uint64_t v23 = v13;
    if (!nw_framer_parse_input(v6, 1uLL, v11, 0, v20))
    {
      if (dword_100141070 <= 40 && (dword_100141070 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }

LABEL_40:
      uint64_t v14 = 0;
      goto LABEL_41;
    }
  }
  if (dword_100141070 <= 40 && (dword_100141070 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  uint64_t v14 = 0;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
LABEL_41:

  return v14;
}

void sub_1000423F8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100042410(void *a1, _OWORD *a2, unint64_t a3)
{
  if (!a2 || a1[8] > a3) {
    return 0;
  }
  *(_OWORD *)(*(void *)(a1[4] + 8) + 32) = *a2;
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = *(unsigned char *)(*(void *)(a1[4] + 8) + 32);
  *(void *)(*(void *)(a1[7] + 8) + 24) = *(void *)(*(void *)(a1[4] + 8) + 40);
  return a1[8];
}

unint64_t sub_100042480(void *a1, uint64_t a2, unint64_t a3)
{
  if (!a2) {
    return 0;
  }
  unint64_t v3 = a3;
  if (*(void *)(*(void *)(a1[5] + 8) + 24) <= a3)
  {
    if (dword_100141070 <= 40 && (dword_100141070 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    (*(void (**)(void))(a1[4] + 16))(a1[4]);
    *(void *)(*(void *)(a1[5] + 8) + 24) = 0;
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
  }
  else
  {
    if (dword_100141070 <= 40 && (dword_100141070 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    (*(void (**)(void))(a1[4] + 16))(a1[4]);
    *(void *)(*(void *)(a1[5] + 8) + 24) -= v3;
  }
  return v3;
}

void sub_1000425E4(id a1, OS_nw_framer *a2, OS_nw_protocol_metadata *a3, unint64_t a4, BOOL a5)
{
  uint64_t v7 = a2;
  id v6 = a3;
  if (dword_100141070 <= 90 && (dword_100141070 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
}

void sub_100042684(id a1, OS_nw_framer *a2)
{
  id v2 = a2;
  unint64_t v3 = v2;
  if (dword_100141070 <= 30)
  {
    uint64_t v5 = v2;
    if (dword_100141070 != -1 || (v4 = _LogCategory_Initialize(), unint64_t v3 = v5, v4))
    {
      LogPrintF();
      unint64_t v3 = v5;
    }
  }
}

nw_protocol_definition_t nwrapport_copy_protocol_definition()
{
  nw_protocol_definition_t definition = nw_framer_create_definition("rapport-client-peer", 0, &stru_100122778);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "registering rapport peer protocol", v2, 2u);
  }
  return definition;
}

int sub_10004279C(id a1, OS_nw_framer *a2)
{
  id v2 = a2;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  char v14 = 0;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3010000000;
  void v12[4] = 0;
  v12[5] = 0;
  v12[3] = &unk_1000FFA8E;
  nw_framer_message_t v3 = nw_framer_message_create((nw_framer_t)v2);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100042908;
  v7[3] = &unk_1001227C8;
  uint64_t v10 = v13;
  size_t v11 = v12;
  int v4 = v2;
  uint64_t v8 = v4;
  uint64_t v5 = v3;
  uint64_t v9 = v5;
  nw_framer_set_input_handler(v4, v7);
  nw_framer_set_output_handler(v4, &stru_1001227E8);
  nw_framer_set_stop_handler(v4, &stru_100122828);
  nw_framer_set_cleanup_handler(v4, &stru_100122848);

  _Block_object_dispose(v12, 8);
  _Block_object_dispose(v13, 8);

  return 2;
}

void sub_1000428E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100042908(uint64_t a1, void *a2)
{
  nw_framer_message_t v3 = a2;
  uint64_t v4 = a1 + 56;
  uint64_t v5 = *(void *)(a1 + 48);
  BOOL v6 = *(unsigned char *)(*(void *)(v5 + 8) + 24) == 0;
  uint64_t v7 = 16;
  uint64_t v8 = &OBJC_IVAR___RPNearbyInvitationXPCConnection__xpcCnx;
  do
  {
    if (!v6) {
      break;
    }
    parse[0] = _NSConcreteStackBlock;
    parse[1] = 3221225472;
    parse[2] = sub_100042C80;
    parse[3] = &unk_1001227A0;
    parse[5] = v5;
    void parse[6] = 16;
    parse[4] = *(void *)v4;
    if (!nw_framer_parse_input(v3, 0x10uLL, 0x10uLL, 0, parse)) {
      goto LABEL_31;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      id v9 = [v8 + 612 controlCodeToString:*(unsigned __int8 *)(*(void *)(*(void *)v4 + 8) + 32)];
      int v10 = *(unsigned __int8 *)(*(void *)(*(void *)v4 + 8) + 33);
      size_t v11 = strerror(v10);
      uint64_t v12 = *(void *)(*(void *)(*(void *)v4 + 8) + 40);
      *(_DWORD *)buf = 136315906;
      id v22 = v9;
      uint64_t v8 = &OBJC_IVAR___RPNearbyInvitationXPCConnection__xpcCnx;
      __int16 v23 = 1024;
      int v24 = v10;
      __int16 v25 = 2080;
      uint64_t v26 = v11;
      __int16 v27 = 2048;
      uint64_t v28 = v12;
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Client RX framer msg header={%s error: %d (%s), length: %zu}", buf, 0x26u);
    }
    uint64_t v5 = *(void *)(a1 + 48);
    BOOL v6 = 1;
  }
  while (!*(unsigned char *)(*(void *)(v5 + 8) + 24));
  uint64_t v13 = (void *)nw_framer_connection_state_copy_object_value();
  BOOL v14 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
  if (v13)
  {
    if (v14) {
      sub_1000BF494(a1 + 56);
    }
    uint64_t v15 = *(void *)(*(void *)v4 + 8);
    if (!*(unsigned char *)(v15 + 32) && *(void *)(v15 + 40))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
        sub_1000BF408(a1 + 56);
      }
      nw_framer_deliver_input_no_copy(v3, *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), *(nw_framer_message_t *)(a1 + 40), 0);
      goto LABEL_30;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_1000BF37C(a1 + 56);
    }
    unsigned int v16 = *(NSObject **)(a1 + 32);
    int v17 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 33);
  }
  else
  {
    if (v14) {
      sub_1000BF334();
    }
    if (*(_DWORD *)(*(void *)(*(void *)v4 + 8) + 36) == 320017171)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
        sub_1000BF234();
      }
      nw_framer_connection_state_set_object_value();
      nw_framer_mark_ready(*(nw_framer_t *)(a1 + 32));
      goto LABEL_30;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000BF2B4();
    }
    uint64_t v18 = *(void *)(*(void *)v4 + 8);
    int v17 = *(unsigned __int8 *)(v18 + 33);
    if (!*(unsigned char *)(v18 + 33))
    {
      *(unsigned char *)(v18 + 33) = 53;
      int v17 = *(unsigned __int8 *)(*(void *)(*(void *)v4 + 8) + 33);
    }
    unsigned int v16 = *(NSObject **)(a1 + 32);
  }
  nw_framer_mark_failed_with_error(v16, v17);
LABEL_30:
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;

  uint64_t v7 = 0;
LABEL_31:

  return v7;
}

uint64_t sub_100042C80(void *a1, _OWORD *a2, unint64_t a3)
{
  if (!a2 || a1[6] > a3) {
    return 0;
  }
  *(_OWORD *)(*(void *)(a1[4] + 8) + 32) = *a2;
  uint64_t v4 = a1[5];
  uint64_t result = a1[6];
  *(unsigned char *)(*(void *)(v4 + 8) + 24) = 1;
  return result;
}

void sub_100042CBC(id a1, OS_nw_framer *a2, OS_nw_protocol_metadata *a3, unint64_t a4, BOOL a5)
{
  BOOL v6 = a2;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_1000BF530(a4);
  }
  v7[0] = 0;
  v7[1] = a4;
  nw_framer_write_output((nw_framer_t)v6, (const uint8_t *)v7, 0x10uLL);
  nw_framer_write_output_no_copy((nw_framer_t)v6, a4);
}

BOOL sub_100042D30(id a1, OS_nw_framer *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000BF5B0((uint64_t)v2);
  }
  +[RPNWFramer writeControlOnFramer:v2 type:3 error:0];

  return 1;
}

void sub_100042D94(id a1, OS_nw_framer *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v3 = 138412290;
    uint64_t v4 = a2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Cleanup handler called for framer=%@", (uint8_t *)&v3, 0xCu);
  }
}

void sub_100042E9C(id a1)
{
  uint64_t v1 = (void *)qword_100142C40;
  qword_100142C40 = (uint64_t)&off_10012B3D0;
}

void sub_100043C8C(id a1, NSError *a2)
{
  id v2 = a2;
  int v3 = v2;
  if (dword_1001410E0 <= 90)
  {
    uint64_t v5 = v2;
    if (dword_1001410E0 != -1 || (v4 = _LogCategory_Initialize(), int v3 = v5, v4))
    {
      LogPrintF();
      int v3 = v5;
    }
  }
}

void sub_100043E90(uint64_t a1, int a2)
{
  int v4 = [*(id *)(a1 + 32) dispatchQueue];
  dispatch_assert_queue_V2(v4);

  if (a2)
  {
    uint64_t v5 = [*(id *)(a1 + 40) tapEvent];
    id v8 = [v5 contactID];
  }
  else
  {
    id v8 = 0;
  }
  BOOL v6 = [*(id *)(a1 + 40) tapEvent];
  [v6 setContactID:v8];

  uint64_t v7 = [*(id *)(a1 + 32) _remoteObjectProxy];
  [v7 didUpdateTransaction:*(void *)(a1 + 40)];
}

void sub_100044708(id a1)
{
  uint64_t v1 = (void *)qword_100142C50;
  qword_100142C50 = (uint64_t)&off_10012B3E8;
}

void sub_1000447F0(id a1)
{
  uint64_t v1 = (void *)qword_100142C60;
  qword_100142C60 = (uint64_t)&off_10012B410;
}

id sub_100046388(uint64_t a1)
{
  if (dword_1001412D0 <= 40 && (dword_1001412D0 != -1 || _LogCategory_Initialize()))
  {
    id v2 = *(id *)(a1 + 32);
    id v3 = objc_alloc_init((Class)NSMutableString);
    [v3 appendFormat:@"%p", v2];

    id v7 = v3;
    LogPrintF();
  }
  int v4 = [*(id *)(a1 + 32) ageOutListenerTimer:v7];
  dispatch_source_cancel(v4);

  [*(id *)(a1 + 32) setAgeOutListenerTimer:0];
  uint64_t v5 = *(void *)(a1 + 40);

  return +[RPNWListener removeListenerForApplicationService:v5];
}

void sub_1000475E8(id a1)
{
  uint64_t v1 = objc_alloc_init(RPEndpoint);
  id v2 = (void *)qword_100142C80;
  qword_100142C80 = (uint64_t)v1;
}

uint64_t start(int a1, uint64_t a2)
{
  if (a1 >= 2)
  {
    char v2 = 0;
    id v3 = (const char **)(a2 + 8);
    uint64_t v4 = a1 - 1;
    while (1)
    {
      uint64_t v5 = *v3;
      if (!strcmp(*v3, "--system"))
      {
        char v2 = 1;
      }
      else
      {
        if (!strcmp(v5, "-V") || !strcmp(v5, "--version") || !strcmp(v5, "version"))
        {
          fprintf(__stdoutp, "Rapport daemon version %s\n", "630.42.2");
          return 0;
        }
        fprintf(__stderrp, "warning: unknown option '%s'\n", v5);
      }
      ++v3;
      if (!--v4) {
        goto LABEL_12;
      }
    }
  }
  char v2 = 0;
LABEL_12:
  if ((_set_user_dir_suffix() & 1) == 0
    && dword_100141340 <= 90
    && (dword_100141340 != -1 || _LogCategory_Initialize()))
  {
    __error();
    LogPrintF();
  }
  if (!confstr(65537, v14, 0x400uLL)
    && dword_100141340 <= 90
    && (dword_100141340 != -1 || _LogCategory_Initialize()))
  {
    __error();
    LogPrintF();
  }
  signal(13, (void (__cdecl *)(int))1);
  LogSetAppID();
  LogControl();
  if (v2)
  {
    if (dword_100141340 <= 30 && (dword_100141340 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  else
  {
    if (dword_100141340 <= 30 && (dword_100141340 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v7 = objc_alloc_init(_TtC8rapportd27RPSwiftMemoryTest_objCClass);
    [(RPSwiftMemoryTest_objCClass *)v7 performLog];
    id v8 = objc_alloc_init((Class)CUPairingDaemon);
    dispatch_queue_t v9 = dispatch_queue_create("CUPairingDaemon", 0);
    [v8 setDispatchQueue:v9];

    [v8 activate];
    int v10 = +[RPDaemon sharedDaemon];
    size_t v11 = CUMainQueue();
    [v10 setDispatchQueue:v11];

    [v10 activate];
  }
  uint64_t v12 = +[NSRunLoop currentRunLoop];
  [v12 run];

  return 0;
}

void sub_10004AF88(id a1)
{
  uint64_t v1 = objc_alloc_init(RPDaemon);
  char v2 = (void *)qword_100142C90;
  qword_100142C90 = (uint64_t)v1;
}

void sub_10004B2BC(id a1)
{
  id v1 = +[RPDaemon sharedDaemon];
  [v1 postDaemonInfoChanges:0x80000];
}

id sub_10004C3E0(uint64_t a1)
{
  return [*(id *)(a1 + 32) _prefsChanged];
}

uint64_t sub_10004C3E8(uint64_t result)
{
  if (*(_DWORD *)(*(void *)(result + 32) + 32) != -1)
  {
    uint64_t v1 = result;
    if (dword_100141340 <= 30)
    {
      if (dword_100141340 != -1 || (uint64_t result = _LogCategory_Initialize(), result)) {
        uint64_t result = LogPrintF();
      }
    }
    *(unsigned char *)(*(void *)(v1 + 32) + 144) = 1;
    return _xpc_transaction_exit_clean(result);
  }
  return result;
}

void sub_10004C490(uint64_t a1)
{
  if (dword_100141340 <= 30 && (dword_100141340 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 145) = 1;
  [*(id *)(a1 + 32) _prefsChanged];
  exit(0);
}

id sub_10004C50C(uint64_t a1)
{
  if (dword_100141340 <= 30 && (dword_100141340 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  char v2 = *(void **)(a1 + 32);

  return [v2 _updateErrorFlags];
}

id sub_10004C590(uint64_t a1)
{
  if (dword_100141340 <= 30 && (dword_100141340 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  char v2 = *(void **)(a1 + 32);

  return [v2 _updateErrorFlags];
}

id sub_10004C614(uint64_t a1)
{
  if (dword_100141340 <= 30 && (dword_100141340 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  char v2 = *(void **)(a1 + 32);

  return [v2 _updateErrorFlags];
}

id sub_10004C698(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateErrorFlags];
}

uint64_t sub_10004C6A0(uint64_t a1, xpc_object_t xdict)
{
  uint64_t result = (uint64_t)xpc_dictionary_get_string(xdict, _xpc_event_key_name);
  if (result && (uint64_t result = strcmp((const char *)result, "com.apple.rapport.prefsChanged"), !result))
  {
    if (dword_100141340 <= 30 && (dword_100141340 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    uint64_t v4 = *(void **)(a1 + 32);
    return (uint64_t)[v4 _prefsChanged];
  }
  else if (dword_100141340 <= 60)
  {
    if (dword_100141340 != -1) {
      return LogPrintF();
    }
    uint64_t result = _LogCategory_Initialize();
    if (result) {
      return LogPrintF();
    }
  }
  return result;
}

void *sub_10004C7C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = *(void **)(a1 + 32);
  if (result[15]) {
    return _[result _xpcPublisherAction:a2 token:a3 event:a4];
  }
  return result;
}

uint64_t sub_10004C7E4(uint64_t result)
{
  if (*(void *)(*(void *)(result + 32) + 120))
  {
    if (dword_100141340 <= 90)
    {
      if (dword_100141340 != -1) {
        return LogPrintF();
      }
      uint64_t result = _LogCategory_Initialize();
      if (result) {
        return LogPrintF();
      }
    }
  }
  return result;
}

uint64_t sub_10004C86C()
{
  return CUStateDumpWithObject();
}

os_state_data_s *__cdecl sub_10004C888(id a1, os_state_hints_s *a2)
{
  char v2 = +[RPIdentityDaemon sharedIdentityDaemon];
  id v3 = (os_state_data_s *)CUStateDumpWithObject();

  return v3;
}

uint64_t sub_10004C8DC(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) keychainStateString];
  uint64_t v2 = CUStateDumpWithObject();

  return v2;
}

os_state_data_s *__cdecl sub_10004C92C(id a1, os_state_hints_s *a2)
{
  uint64_t v2 = +[RPPrivateDaemon sharedPrivateDaemon];
  id v3 = (os_state_data_s *)CUStateDumpWithObject();

  return v3;
}

id sub_10004CF64(uint64_t a1)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 152));
  [*(id *)(a1 + 40) connectionInvalidated];
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(void **)(*(void *)(a1 + 32) + 96);

  return [v3 removeObject:v2];
}

void sub_10004D210(uint64_t a1)
{
  if (dword_100141340 <= 30 && (dword_100141340 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v7 = *(void *)(a1 + 40);
    id v8 = &unk_10011A302;
    LogPrintF();
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 80);
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * i) daemonInfoChanged:*(void *)(a1 + 40), v7, v8, (void)v9];
      }
      id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

void sub_10004D9E0(uint64_t a1, int a2, void *a3, void *a4)
{
  id v12 = a3;
  uint64_t v7 = a4;
  switch(a2)
  {
    case 6:
      id v8 = *(void **)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 40);
      uint64_t v10 = 1;
LABEL_7:
      [v8 _xpcPublisherStateChangedForToken:v9 state:v10];
      goto LABEL_12;
    case 5:
      id v8 = *(void **)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 40);
      uint64_t v10 = 0;
      goto LABEL_7;
    case 0:
      [*(id *)(a1 + 32) _xpcPublisherTriggeredToken:*(void *)(a1 + 40) payload:v12 responseHandler:v7];
      goto LABEL_14;
  }
  if (dword_100141340 <= 90 && (dword_100141340 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
LABEL_12:
  if (v7)
  {
    long long v11 = RPErrorF();
    v7[2](v7, 0, v11);
  }
LABEL_14:
}

id sub_10004DF28(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) _xpcPublisherTriggeredReply:a2 token:*(void *)(a1 + 48) responseHandler:*(void *)(a1 + 40)];
}

void sub_10004E198(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  (*(void (**)(uint64_t))(v11 + 16))(v11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10004E1D4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10004E1E4(uint64_t a1)
{
}

uint64_t sub_10004E1EC(uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 40) + 8) + 40))
  {
    uint64_t v1 = result;
    if (dword_100141340 <= 90 && (dword_100141340 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v2 = *(uint64_t (**)(void))(*(void *)(v1 + 32) + 16);
    return v2();
  }
  return result;
}

BOOL sub_100050274()
{
  int v0 = dword_100142CA0;
  if (!dword_100142CA0)
  {
    uint64_t v1 = [(objc_class *)off_1001414E0() currentState];
    id v2 = v1;
    if (v1)
    {
      if ([v1 supportsDataTransfer]) {
        int v3 = 5;
      }
      else {
        int v3 = 6;
      }
      dword_100142CA0 = v3;
      if (dword_100141470 > 50 || dword_100141470 == -1 && !_LogCategory_Initialize()) {
        goto LABEL_14;
      }
    }
    else if (dword_100141470 > 90 || dword_100141470 == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_14;
    }
    LogPrintF();
LABEL_14:

    int v0 = dword_100142CA0;
  }
  return v0 == 6;
}

Class sub_100050C6C()
{
  if (qword_100142CB0 != -1) {
    dispatch_once(&qword_100142CB0, &stru_100122B78);
  }
  Class result = objc_getClass("WiFiP2PAWDLState");
  qword_100142CA8 = (uint64_t)result;
  off_1001414E0 = (uint64_t (*)())sub_100050CD0;
  return result;
}

id sub_100050CD0()
{
  return (id)qword_100142CA8;
}

void sub_100050CDC(id a1)
{
  qword_100142CB8 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/WiFiPeerToPeer.framework/WiFiPeerToPeer", 2);
}

void sub_100051FD8(id a1)
{
  id v1 = objc_alloc_init((Class)NSDateFormatter);
  id v2 = (void *)qword_100142CC0;
  qword_100142CC0 = (uint64_t)v1;

  int v3 = +[NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"];
  [(id)qword_100142CC0 setLocale:v3];

  [(id)qword_100142CC0 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZZZZZ"];
  id v4 = +[NSTimeZone timeZoneForSecondsFromGMT:0];
  [(id)qword_100142CC0 setTimeZone:v4];
}

id sub_1000524E4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleCommand:a2 responseHandler:];
}

id sub_1000524F0(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleTouchStart:a2];
}

id sub_1000524FC(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleTouchStop:a2 responseHandler:];
}

id sub_100052508(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) _handleTouchEvent:a2];
}

id sub_100052514(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleGameControllerStart:a2];
}

id sub_100052520(uint64_t a1, uint64_t a2)
{
  return [_objc_msgSend(*(id *)(a1 + 32), "_handleGameControllerStop:responseHandler:", a2);
}

id sub_10005252C(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) _handleGameControllerEvent:a2];
}

void sub_100054160(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va1, a8);
  va_start(va, a8);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

id sub_100054188(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  id result = [a3 getValue:&v9];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8) + 6 * (*(unsigned char *)(v7 + 24))++;
  *(unsigned char *)(v8 + 32) = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  *(unsigned char *)(v8 + 33) = (v10 - 1) < 3;
  *(_DWORD *)(v8 + 34) = HIDWORD(v9);
  if (*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) >= 2u) {
    *a4 = 1;
  }
  return result;
}

id sub_100054348(uint64_t a1)
{
  return [*(id *)(a1 + 32) _injectKeyboardEventUsagePage:12 usageCode:128 buttonState:*(unsigned int *)(a1 + 40)];
}

void sub_1000547DC(id a1)
{
  id v1 = objc_alloc_init(RPNearFieldDaemon);
  id v2 = (void *)qword_100142CD0;
  qword_100142CD0 = (uint64_t)v1;
}

id sub_100054928(id result)
{
  uint64_t v1 = *((void *)result + 4);
  if (!*(unsigned char *)(v1 + 8))
  {
    *(unsigned char *)(v1 + _Block_object_dispose(&STACK[0x578], 8) = 1;
    return _[*((id *)result + 4) _activate];
  }
  return result;
}

id sub_100054B84(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _invalidate];
}

void sub_100055048(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) transactionChangedHandler];

  if (v2)
  {
    int v3 = [*(id *)(a1 + 32) transactionChangedHandler];
    v3[2]();
  }
}

void sub_1000550C8(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) nearFieldController];
  [v1 invalidate];
}

uint64_t sub_1000552F8()
{
  int DeviceClass = GestaltGetDeviceClass();
  LODWORD(result) = _os_feature_enabled_impl();
  if (DeviceClass == 1 || DeviceClass == 6) {
    return result;
  }
  else {
    return 0;
  }
}

uint64_t sub_10005533C(void *a1)
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v1 = a1;
  uint64_t v2 = (uint64_t)[v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v8 != v3) {
          objc_enumerationMutation(v1);
        }
        uint64_t v5 = *(void **)(*((void *)&v7 + 1) + 8 * i);
        if (objc_msgSend(v5, "serviceType", (void)v7) == (id)1)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            && ([v5 isSingleBandModeRequired] & 1) != 0)
          {
            uint64_t v2 = 1;
            goto LABEL_13;
          }
        }
      }
      uint64_t v2 = (uint64_t)[v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v2) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return v2;
}

BOOL sub_100055474(unint64_t a1)
{
  return a1 < 2;
}

IOPMAssertionID *sub_100055480(IOPMAssertionID *a1)
{
  id v1 = a1;
  if (a1)
  {
    if (*a1)
    {
      return 0;
    }
    else
    {
      v5[0] = @"AssertType";
      v5[1] = @"AssertLevel";
      v6[0] = @"PreventUserIdleSystemSleep";
      v6[1] = &off_10012B228;
      v5[2] = @"AssertName";
      v5[3] = @"TimeoutSeconds";
      v6[2] = @"com.apple.rapport.RPNFCTransactionController.potentialInitiator";
      v6[3] = &off_10012B240;
      v5[4] = @"TimeoutAction";
      v6[4] = @"TimeoutActionTurnOff";
      CFDictionaryRef v2 = +[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:5];
      if (IOPMAssertionCreateWithProperties(v2, v1) || (IOPMAssertionID v3 = *v1) == 0)
      {
        IOPMAssertionID v3 = 0;
        IOPMAssertionID *v1 = 0;
      }
      id v1 = (IOPMAssertionID *)(v3 != 0);
    }
  }
  return v1;
}

uint64_t sub_1000555A0(uint64_t result)
{
  if (result)
  {
    id v1 = (_DWORD *)result;
    uint64_t result = *(unsigned int *)result;
    if (result)
    {
      IOPMAssertionRelease(result);
      _DWORD *v1 = 0;
      return 1;
    }
  }
  return result;
}

const char *sub_1000564F8(int a1)
{
  if (a1 >= 0x20000)
  {
    if (a1 >= 327680)
    {
      if (a1 > 589824)
      {
        if (a1 <= 2147418111)
        {
          switch(a1)
          {
            case 589825:
              return "FindNearbyPencil";
            case 655360:
              return "AccessDigitalHomeKey";
            case 786432:
              return "ProxControlDeviceClose";
            default:
              return "?";
          }
        }
        else
        {
          switch(a1)
          {
            case 2147418112:
              uint64_t result = "InternalTestNoLockScan";
              break;
            case 2147418113:
              uint64_t result = "InternalTestNoScreenOffScan";
              break;
            case 2147418114:
              uint64_t result = "InternalTestScanWithNoDups";
              break;
            case 2147418115:
              uint64_t result = "InternalTestScanWithDups";
              break;
            case 2147418116:
              uint64_t result = "InternalTestScanFor20Seconds";
              break;
            case 2147418117:
              uint64_t result = "InternalTestActiveScan";
              break;
            case 2147418118:
              uint64_t result = "InternalTestUUIDScan";
              break;
            case 2147418119:
              uint64_t result = "InternalTestScanFor10ClockSeconds";
              break;
            case 2147418120:
              uint64_t result = "InternalTestScanBoost";
              break;
            default:
              return "?";
          }
        }
      }
      else if (a1 > 458752)
      {
        switch(a1)
        {
          case 524288:
            uint64_t result = "ADPD";
            break;
          case 524289:
            uint64_t result = "ADPDBuffer";
            break;
          case 524290:
            uint64_t result = "MicroLocation";
            break;
          case 524291:
            uint64_t result = "MicroLocationLeech";
            break;
          default:
            if (a1 == 458753)
            {
              uint64_t result = "PrecisionFindingFindee";
            }
            else
            {
              if (a1 != 589824) {
                return "?";
              }
              uint64_t result = "FindNearbyRemote";
            }
            break;
        }
      }
      else
      {
        switch(a1)
        {
          case 393216:
            uint64_t result = "CaptiveNetworkJoin";
            break;
          case 393217:
            uint64_t result = "UseCaseSIMTransfer";
            break;
          case 393218:
            uint64_t result = "MacSetup";
            break;
          case 393219:
            uint64_t result = "AppleIDSignIn";
            break;
          case 393220:
            uint64_t result = "AppleIDSignInSettings";
            break;
          default:
            if (a1 == 327680)
            {
              uint64_t result = "RapportThirdParty";
            }
            else
            {
              if (a1 != 458752) {
                return "?";
              }
              uint64_t result = "PrecisionFindingFinder";
            }
            break;
        }
      }
    }
    else
    {
      switch(a1)
      {
        case 131072:
          return "SharingDefault";
        case 131073:
          return "SharingPhoneAutoUnlock";
        case 131074:
          return "SharingSiriWatchAuth";
        case 131075:
          return "SharingMacAutoUnlock";
        case 131076:
          return "SharingEDTScreenOn";
        case 131077:
          return "SharingEDTWiFiDisabled";
        case 131078:
          return "SharingEDTWombatEligibleAsDefaultCamera";
        case 131079:
          return "SharingEDTWombatCameraPicker";
        case 131080:
          return "SharingWombatBackground";
        case 131081:
          return "SharingUniversalControl";
        case 131082:
          return "SharingPeopleProximity";
        case 131083:
          return "SharingEDTEnsembleOpenDisplayPrefs";
        case 131084:
          return "SharingEDTNearbydMotionStopped";
        case 131085:
          return "SharingDoubleBoostGenericScan";
        case 131086:
          return "SharingEDTIncomingAdvertisement ";
        case 131087:
          return "SharingEDTWombatStreamStart";
        case 131088:
          return "SharingOYAutoUnlock";
        case 131089:
          return "?";
        case 131090:
          return "SharingAirDrop";
        case 131091:
          return "SharingNearbyInvitationHost";
        case 131092:
          return "SharingNearbyInvitationParticipant";
        case 131093:
          return "SharingAirDropAskToAirDrop";
        case 131094:
          return "SharingAirDropTempIdentity";
        case 131095:
          return "SharingAirDropNeedsCLink";
        case 131096:
          return "SharingRemoteWidgetUpdate";
        case 131097:
          return "SharingCountryCodeUpdate";
        case 131098:
          return "SharingMacPhoneAutoUnlock";
        case 131099:
          return "SharingVisionProDiscovery";
        case 131100:
          return "SharingVisionProStateChange";
        case 131101:
          return "SharingContinuityScreen";
        case 131102:
          return "SharingEDTRemoteDisplay";
        default:
          if (a1 == 196608)
          {
            uint64_t result = "DigitalIDTSA";
          }
          else
          {
            if (a1 != 0x40000) {
              return "?";
            }
            uint64_t result = "DigitalCarKeyThirdParty";
          }
          break;
      }
    }
  }
  else if (a1 <= 0x20000)
  {
    switch(a1)
    {
      case 65536:
        uint64_t result = "FindMyAction";
        break;
      case 65537:
        uint64_t result = "FindMyBackground";
        break;
      case 65538:
        uint64_t result = "FindMyActionHELE";
        break;
      case 65539:
        uint64_t result = "FindMyBackgroundHELE";
        break;
      case 65540:
        uint64_t result = "FindMyActionTransient";
        break;
      case 65541:
        uint64_t result = "FindMyBackgroundTransient";
        break;
      case 65542:
        uint64_t result = "FindMyActionHELETransient";
        break;
      case 65543:
        uint64_t result = "FindMyBackgroundHELETransient";
        break;
      case 65544:
        uint64_t result = "FindMyNotOptedIn";
        break;
      case 65545:
        uint64_t result = "FindMyOptedIn";
        break;
      case 65546:
        uint64_t result = "FindMySepAlertsEnabled";
        break;
      case 65547:
        uint64_t result = "FindMyTemporaryAggressiveLegacy";
        break;
      case 65548:
        uint64_t result = "FindMyTemporaryLongAggressive";
        break;
      case 65549:
        uint64_t result = "FindMyBTFindingUserInitiated";
        break;
      case 65550:
        uint64_t result = "FindMyHELE";
        break;
      case 65551:
        uint64_t result = "FindMyBeaconOnDemand";
        break;
      case 65552:
        uint64_t result = "FindMyWildTimedScan";
        break;
      case 65553:
        uint64_t result = "FindMyBackgroundLeechScan";
        break;
      case 65554:
        uint64_t result = "FindMySnifferMode";
        break;
      case 65555:
        uint64_t result = "FindMyUnpair";
        break;
      case 65556:
        uint64_t result = "FindMyUnpairHELE";
        break;
      case 65557:
        uint64_t result = "FindMyPlaySound";
        break;
      case 65558:
        uint64_t result = "FindMyPlaySoundHELE";
        break;
      case 65559:
        uint64_t result = "FindMyNotOptedInBeepOnMoveWaking";
        break;
      case 65560:
        uint64_t result = "FindMyUTTransient";
        break;
      case 65561:
        uint64_t result = "FindMyUTHELETransient";
        break;
      default:
        JUMPOUT(0);
    }
  }
  else
  {
    uint64_t result = "Unspecified";
    switch(a1)
    {
      case 0:
        return result;
      case 1:
        uint64_t result = "HealthKit";
        break;
      case 2:
        uint64_t result = "HomeKit";
        break;
      case 3:
        uint64_t result = "FindMyObjectConnection";
        break;
      case 4:
        uint64_t result = "FindMyObjectConnectionTransient";
        break;
      case 5:
        uint64_t result = "MIDI";
        break;
      case 6:
        uint64_t result = "Continuity";
        break;
      case 7:
        uint64_t result = "InstantHotSpot";
        break;
      case 8:
        uint64_t result = "NearBy";
        break;
      case 9:
        uint64_t result = "Sharing";
        break;
      case 10:
        uint64_t result = "HearingSupport";
        break;
      case 11:
        uint64_t result = "Magnet";
        break;
      case 12:
        uint64_t result = "HID";
        break;
      case 13:
        uint64_t result = "LEA";
        break;
      case 14:
        uint64_t result = "External";
        break;
      case 15:
        uint64_t result = "ExternalMedical";
        break;
      case 16:
        uint64_t result = "ExternalLock";
        break;
      case 17:
        uint64_t result = "ExternalWatch";
        break;
      case 18:
        uint64_t result = "SmartRouting";
        break;
      case 19:
        uint64_t result = "DigitalID";
        break;
      case 20:
        uint64_t result = "DigitalKey";
        break;
      case 21:
        uint64_t result = "DigitalCarKey";
        break;
      case 22:
        uint64_t result = "HeySiri";
        break;
      case 23:
        uint64_t result = "ThirdPartyApp";
        break;
      case 24:
        uint64_t result = "CNJ";
        break;
      default:
        switch(a1)
        {
          case 256:
            uint64_t result = "DevicePresenceDetection";
            break;
          case 257:
            uint64_t result = "AudioBox";
            break;
          case 258:
            uint64_t result = "SIMTransfer";
            break;
          case 259:
            uint64_t result = "ProximityScreenOnLeechScan";
            break;
          case 260:
            uint64_t result = "MacMigrate";
            break;
          case 263:
            uint64_t result = "HIDUARTService";
            break;
          case 264:
            uint64_t result = "AccessibilitySwitchControlPairing";
            break;
          case 265:
            uint64_t result = "BaseBandFastConnect";
            break;
          case 266:
            uint64_t result = "SafetyAlerts";
            break;
          case 267:
            uint64_t result = "LECarPlay";
            break;
          case 268:
            uint64_t result = "TCCBluetooth";
            break;
          case 269:
            uint64_t result = "AOPBufferLeech";
            break;
          default:
            return "?";
        }
        break;
    }
  }
  return result;
}

id sub_100056E24(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) _deviceFound:a2];
}

id sub_100056E30(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) _deviceLost:a2];
}

void sub_100056E3C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (dword_100141708 <= 90 && (dword_100141708 != -1 || _LogCategory_Initialize())) {
LABEL_7:
    }
      LogPrintF();
  }
  else if (dword_100141708 <= 30 && (dword_100141708 != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_7;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
}

id sub_1000575BC()
{
  if (qword_100142D08 != -1) {
    dispatch_once(&qword_100142D08, &stru_100122D68);
  }
  int v0 = (void *)qword_100142D00;

  return v0;
}

Class sub_10005791C()
{
  if (qword_100142CF0 != -1) {
    dispatch_once(&qword_100142CF0, &stru_100122D48);
  }
  Class result = objc_getClass("CBDiscovery");
  qword_100142CE8 = (uint64_t)result;
  off_100141778 = (uint64_t (*)())sub_100057980;
  return result;
}

id sub_100057980()
{
  return (id)qword_100142CE8;
}

void sub_10005798C(id a1)
{
  qword_100142CF8 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/CoreBluetooth.framework/CoreBluetooth", 2);
}

void sub_1000579B8(id a1)
{
  uint64_t v1 = LogCategoryCopyOSLogHandle();
  CFDictionaryRef v2 = (void *)qword_100142D00;
  qword_100142D00 = v1;
}

void sub_100057EF8(uint64_t a1, void *a2)
{
  CFDictionaryRef v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = (id)objc_opt_new();
  [v2 addMappingForDevice:v3 endpointID:v4];
}

id sub_100057F6C(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) updateMappingForDevice:a2];
}

id sub_100057F78(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) removeDevice:a2];
}

id sub_100057F84(uint64_t a1)
{
  return _[*(id *)(a1 + 32) removeAllDevices];
}

void sub_10005A668(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  id v5 = a3;
  if (v13)
  {
    if (!v5) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v12 = RPErrorF();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

  if (v5) {
LABEL_3:
  }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
LABEL_4:
  id v6 = objc_alloc_init((Class)RPIdentity);
  long long v7 = [v13 publicKey];
  long long v8 = [v7 data];
  [v6 setEdPKData:v8];

  long long v9 = [v13 privateKey];
  long long v10 = [v9 data];
  [v6 setEdSKData:v10];

  uint64_t v11 = [v13 identifier];
  [v6 setIdentifier:v11];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10005A89C(uint64_t a1)
{
  CFDictionaryRef v2 = (void (**)(void))objc_retainBlock(*(id *)(*(void *)(a1 + 32) + 40));
  id v3 = v2;
  if (v2)
  {
    long long v7 = v2;
    if (dword_100141860 <= 30)
    {
      if (dword_100141860 != -1 || (int v5 = _LogCategory_Initialize(), v3 = v7, v5))
      {
        id v4 = [*(id *)(a1 + 40) userID];
        id v6 = [*(id *)(a1 + 48) name];
        LogPrintF();

        id v3 = v7;
      }
    }
    v3[2](v3);
    id v3 = v7;
  }
}

void sub_10005AA5C(uint64_t a1)
{
  CFDictionaryRef v2 = (void (**)(id, void *, void *))objc_retainBlock(*(id *)(*(void *)(a1 + 32) + 48));
  if (v2)
  {
    long long v9 = v2;
    if (dword_100141860 <= 30 && (dword_100141860 != -1 || _LogCategory_Initialize()))
    {
      id v3 = [*(id *)(a1 + 40) name];
      [*(id *)(a1 + 48) siriEndpointIdentifier];
      long long v8 = v7 = v3;
      LogPrintF();
    }
    id v4 = [*(id *)(a1 + 48) siriEndpointIdentifier:v7, v8];
    int v5 = [v4 UUIDString];
    id v6 = [*(id *)(a1 + 40) name];
    v9[2](v9, v5, v6);

    CFDictionaryRef v2 = v9;
  }
}

Class sub_10005AC98()
{
  if (qword_100142D20 != -1) {
    dispatch_once(&qword_100142D20, &stru_100122DD8);
  }
  Class result = objc_getClass("HMHomeManagerConfiguration");
  qword_100142D18 = (uint64_t)result;
  off_1001418D0 = (uint64_t (*)())sub_10005ACFC;
  return result;
}

id sub_10005ACFC()
{
  return (id)qword_100142D18;
}

void sub_10005AD08(id a1)
{
  qword_100142D28 = (uint64_t)dlopen("/System/Library/Frameworks/HomeKit.framework/HomeKit", 2);
}

Class sub_10005AD34()
{
  if (qword_100142D20 != -1) {
    dispatch_once(&qword_100142D20, &stru_100122DD8);
  }
  Class result = objc_getClass("HMHomeManager");
  qword_100142D30 = (uint64_t)result;
  off_1001418D8 = (uint64_t (*)())sub_10005AD98;
  return result;
}

id sub_10005AD98()
{
  return (id)qword_100142D30;
}

id sub_10005AE7C(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _activate];
}

id sub_10005B048(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _invalidate];
}

void sub_10005B5F0(id a1)
{
  uint64_t v1 = objc_alloc_init(RPNearbyInvitationDaemon);
  CFDictionaryRef v2 = (void *)qword_100142D38;
  qword_100142D38 = (uint64_t)v1;
}

id sub_10005BC68(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) _clientBLENearbyActionDiscoveryDeviceFound:a2];
}

id sub_10005BC74(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) _clientBLENearbyActionDiscoveryDeviceLost:a2];
}

id sub_10005BC80(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) _clientBLENearbyActionDiscoveryDeviceFound:a2];
}

void sub_10005BC8C(id a1)
{
  if (dword_1001419A0 <= 30 && (dword_1001419A0 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

void sub_10005BD00(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    id v7 = v3;
    if (dword_1001419A0 <= 90 && (dword_1001419A0 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
      [*(id *)(a1 + 32) _clientBLENearbyActionDiscoveryEnsureStopped:v7];
    }
    else
    {
      [*(id *)(a1 + 32) _clientBLENearbyActionDiscoveryEnsureStopped:v6];
    }
    goto LABEL_10;
  }
  if (dword_1001419A0 <= 30)
  {
    id v7 = 0;
    if (dword_1001419A0 != -1 || (int v5 = _LogCategory_Initialize(), v4 = 0, v5))
    {
      LogPrintF();
LABEL_10:
      id v4 = v7;
    }
  }
}

id sub_10005C6C0(uint64_t a1)
{
  CFDictionaryRef v2 = *(void **)(*(void *)(a1 + 32) + 192);
  if (v2)
  {
    id v3 = v2;
    dispatch_source_cancel(v3);
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = *(void **)(v4 + 192);
    *(void *)(v4 + 192) = 0;
  }
  if (dword_1001419A0 <= 50 && (dword_1001419A0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 112);

  return [v6 setScanRate:20];
}

id sub_10005C8F8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _clientBLENearbyActionEnableDupeFilter];
}

void sub_10005CD6C(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (v6)
  {
    if (dword_1001419A0 <= 90 && (dword_1001419A0 != -1 || _LogCategory_Initialize()))
    {
      id v4 = v6;
      LogPrintF();
    }
    [*(id *)(a1 + 32) _clientBLENearbyActionAdvertiserEnsureStopped:v4];
  }
  else if (dword_1001419A0 <= 30 && (dword_1001419A0 != -1 || _LogCategory_Initialize()))
  {
    id v3 = [*(id *)(a1 + 40) daemonDevice];
    int v5 = [v3 bleTargetData];
    LogPrintF();

    [*(id *)(a1 + 32) _clientBLENearbyActionAdvertiserStartTimer:v5];
  }
  else
  {
    [*(id *)(a1 + 32) _clientBLENearbyActionAdvertiserStartTimer:v4];
  }
}

void sub_10005D058(uint64_t a1)
{
  CFDictionaryRef v2 = *(void **)(*(void *)(a1 + 32) + 208);
  if (v2)
  {
    id v3 = v2;
    dispatch_source_cancel(v3);
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = *(void **)(v4 + 208);
    *(void *)(v4 + 20_Block_object_dispose(&STACK[0x578], 8) = 0;
  }
  id v10 = [*(id *)(a1 + 32) _idleSessionConnection];
  id v6 = [v10 activatedSession];
  unsigned int v7 = [v6 waitingToConnect];

  if (v7)
  {
    if (dword_1001419A0 <= 50 && (dword_1001419A0 != -1 || _LogCategory_Initialize()))
    {
      long long v9 = [v10 activatedSession];
      LogPrintF();
    }
    long long v8 = RPErrorF();
    [v10 sessionActivatedWithError:v8];
    [*(id *)(a1 + 32) _update];
  }
}

void sub_10005D344(uint64_t a1, void *a2, uint64_t a3)
{
  id v9 = a2;
  int v5 = [[*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:];
  if (v5)
  {
    if (dword_1001419A0 <= 30 && (dword_1001419A0 != -1 || _LogCategory_Initialize()))
    {
      CFStringRef v6 = @"NO";
      if (a3) {
        CFStringRef v6 = @"YES";
      }
      id v7 = v9;
      CFStringRef v8 = v6;
      LogPrintF();
    }
    [v5 setInBubble:a3 v7 v8];
    if (a3) {
      [v5 setWasTriggered:1];
    }
    if ([v5 inBubble])
    {
      [*(id *)(a1 + 32) _clientReportFoundDevice:v5];
    }
    else if (([v5 inBubble] & 1) == 0 {
           && ![*(id *)(*(void *)(a1 + 32) + 168) count])
    }
    {
      [*(id *)(a1 + 32) _clientReportLostDevice:v5];
    }
    [*(id *)(a1 + 32) _update];
  }
}

void sub_10005D48C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (v3)
  {
    id v7 = v3;
    if (dword_1001419A0 <= 90 && (dword_1001419A0 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
      [*(id *)(a1 + 32) _clientBLENearbyActionDiscoveryEnsureStopped:v7];
    }
    else
    {
      [*(id *)(a1 + 32) _clientBLENearbyActionDiscoveryEnsureStopped:v6];
    }
    goto LABEL_10;
  }
  if (dword_1001419A0 <= 30)
  {
    id v7 = 0;
    if (dword_1001419A0 != -1 || (int v5 = _LogCategory_Initialize(), v4 = 0, v5))
    {
      LogPrintF();
LABEL_10:
      uint64_t v4 = v7;
    }
  }
}

id sub_10005DC78(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) _clientBLEServerHandleConnectionStarted:a2];
}

void sub_10005DC84(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (v3)
  {
    id v9 = v3;
    if (dword_1001419A0 <= 90 && (dword_1001419A0 != -1 || _LogCategory_Initialize()))
    {
      id v8 = v9;
      LogPrintF();
    }
    [*(id *)(*(void *)(a1 + 32) + 160) invalidate:v8];
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void **)(v5 + 160);
    *(void *)(v5 + 160) = 0;

    goto LABEL_10;
  }
  if (dword_1001419A0 <= 30)
  {
    id v9 = 0;
    if (dword_1001419A0 != -1 || (v7 = _LogCategory_Initialize(), uint64_t v4 = 0, v7))
    {
      [*(id *)(*(void *)(a1 + 32) + 160) listeningPSM];
      LogPrintF();
LABEL_10:
      uint64_t v4 = v9;
    }
  }
}

void sub_10005E180(uint64_t a1, void *a2)
{
  if (a2)
  {
    CFDictionaryRef v2 = *(void **)(a1 + 32);
    id v3 = a2;
    id v6 = [v2 client];
    uint64_t v4 = [v6 xpcCnx];
    uint64_t v5 = [v4 remoteObjectProxyWithErrorHandler:&stru_100122EB0];
    [v5 nearbyInvitationSessionError:v3];
  }
}

void sub_10005E218(id a1, NSError *a2)
{
  CFDictionaryRef v2 = a2;
  id v3 = v2;
  if (dword_1001419A0 <= 90)
  {
    uint64_t v5 = v2;
    if (dword_1001419A0 != -1 || (v4 = _LogCategory_Initialize(), id v3 = v5, v4))
    {
      LogPrintF();
      id v3 = v5;
    }
  }
}

void sub_10005E2AC(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];
  if (([*(id *)(a1 + 32) invalidationHandled] & 1) == 0)
  {
    [*(id *)(a1 + 40) _clientBLEServerHandleConnectionEnded:*(void *)(a1 + 32)];
    [v2 setNetCnx:0];
  }
}

void sub_10005E318(uint64_t a1, void *a2, void *a3, void *a4)
{
  int v7 = *(void **)(a1 + 32);
  id v8 = a4;
  id v9 = a3;
  id v10 = a2;
  id v11 = [v7 client];
  [*(id *)(a1 + 40) _receivedEventID:v10 event:v9 options:v8 xpcCnx:v11 sessionID:0];
}

void sub_10005E3C0(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = *(void **)(a1 + 32);
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = a2;
  id v14 = [v9 client];
  [*(id *)(a1 + 40) _receivedRequestID:v13 request:v12 options:v11 responseHandler:v10 xpcCnx:v14 sessionID:0];
}

id sub_10005E47C(uint64_t a1, uint64_t a2)
{
  id result = [*(id *)(a1 + 32) invalidationHandled];
  if ((result & 1) == 0)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(a1 + 40);
    return _[v5 _clientBLEServerHandleConnectionStateChange:a2 cnx:v6];
  }
  return result;
}

id sub_10005EAEC(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) _serverBLENearbyInfoDiscoveryDeviceFound:a2];
}

id sub_10005EAF8(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) _serverBLENearbyInfoDiscoveryDeviceLost:a2];
}

id sub_10005EB04(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) _serverBLENearbyInfoDiscoveryDeviceFound:a2];
}

void sub_10005EB10(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = v3;
  if (v3)
  {
    id v7 = v3;
    if (dword_1001419A0 <= 90 && (dword_1001419A0 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
      [*(id *)(a1 + 32) _serverBLENearbyInfoDiscoveryEnsureStopped:v7];
    }
    else
    {
      [*(id *)(a1 + 32) _serverBLENearbyInfoDiscoveryEnsureStopped:v6];
    }
    goto LABEL_10;
  }
  if (dword_1001419A0 <= 30)
  {
    id v7 = 0;
    if (dword_1001419A0 != -1 || (int v5 = _LogCategory_Initialize(), v4 = 0, v5))
    {
      LogPrintF();
LABEL_10:
      int v4 = v7;
    }
  }
}

id sub_10005F2E4(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) _serverBLENearbyActionDiscoveryDeviceFound:a2];
}

void sub_10005F2F0(id a1, SFDevice *a2)
{
  id v2 = a2;
  id v3 = v2;
  if (dword_1001419A0 <= 10)
  {
    int v5 = v2;
    if (dword_1001419A0 != -1 || (v4 = _LogCategory_Initialize(), id v3 = v5, v4))
    {
      LogPrintF();
      id v3 = v5;
    }
  }
}

id sub_10005F384(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) _serverBLENearbyActionDiscoveryDeviceFound:a2];
}

void sub_10005F390(id a1)
{
  if (dword_1001419A0 <= 30 && (dword_1001419A0 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

void sub_10005F404(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = v3;
  if (v3)
  {
    id v7 = v3;
    if (dword_1001419A0 <= 90 && (dword_1001419A0 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
      [*(id *)(a1 + 32) _serverBLENearbyActionDiscoveryEnsureStopped:v7];
    }
    else
    {
      [*(id *)(a1 + 32) _serverBLENearbyActionDiscoveryEnsureStopped:v6];
    }
    goto LABEL_10;
  }
  if (dword_1001419A0 <= 30)
  {
    id v7 = 0;
    if (dword_1001419A0 != -1 || (int v5 = _LogCategory_Initialize(), v4 = 0, v5))
    {
      LogPrintF();
LABEL_10:
      int v4 = v7;
    }
  }
}

void sub_10005FA58(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (!v5)
  {
    if (*(unsigned char *)(a1 + 56))
    {
      if (dword_1001419A0 > 30 || dword_1001419A0 == -1 && !_LogCategory_Initialize()) {
        goto LABEL_17;
      }
      id v3 = *(id *)(a1 + 40);
      uint64_t v4 = *(void *)(a1 + 48);
    }
    else if (dword_1001419A0 > 30 || dword_1001419A0 == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_17;
    }
    LogPrintF();
LABEL_17:
    [*(id *)(a1 + 32) _serverBLENearbyActionAdvertiserRestartTimer:v3, v4];
    goto LABEL_18;
  }
  if (dword_1001419A0 <= 90 && (dword_1001419A0 != -1 || _LogCategory_Initialize()))
  {
    id v3 = v5;
    LogPrintF();
  }
  [*(id *)(a1 + 32) _serverBLENearbyActionAdvertiserEnsureStopped:v3];
LABEL_18:
}

void sub_10005FDC8(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 200);
  if (v2)
  {
    id v3 = v2;
    dispatch_source_cancel(v3);
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 200);
    *(void *)(v4 + 200) = 0;
  }
  if (dword_1001419A0 <= 50 && (dword_1001419A0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [*(id *)(a1 + 32) _serverBLENearbyActionAdvertiserEnsureStopped];
  uint64_t v6 = [*(id *)(a1 + 32) bleDeviceWantingInvitations];

  if (v6)
  {
    id v7 = *(void **)(a1 + 32);
    id v8 = (void *)v7[17];
    id v9 = [v7 bleDeviceWantingInvitations];
    [v8 removeObject:v9];

    id v10 = *(void **)(a1 + 32);
    _[v10 setDevicesWantingInvitations:0];
  }
}

void sub_100060390(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) client];
  [*(id *)(a1 + 40) _bleClientConnectionEnded:*(void *)(a1 + 32)];
  uint64_t v2 = *(void *)(a1 + 48);
  id v3 = [v4 netCnx];
  [v4 sessionEndedWithID:v2 netCnx:v3];

  [v4 setNetCnx:0];
}

void sub_100060418(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = *(void **)(a1 + 32);
  id v8 = a4;
  id v9 = a3;
  id v10 = a2;
  id v11 = [v7 client];
  [*(id *)(a1 + 40) _receivedEventID:v10 event:v9 options:v8 xpcCnx:v11 sessionID:*(void *)(a1 + 48)];
}

void sub_1000604BC(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = *(void **)(a1 + 32);
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = a2;
  id v14 = [v9 client];
  [*(id *)(a1 + 40) _receivedRequestID:v13 request:v12 options:v11 responseHandler:v10 xpcCnx:v14 sessionID:*(void *)(a1 + 48)];
}

id sub_100060574(uint64_t a1, uint64_t a2)
{
  id result = [*(id *)(a1 + 32) invalidationHandled];
  if ((result & 1) == 0)
  {
    [*(id *)(a1 + 40) _bleClientConnectionStateChanged:a2 cnx:*(void *)(a1 + 32) sessionID:*(void *)(a1 + 48)];
    id v5 = *(void **)(a1 + 40);
    return [v5 _update];
  }
  return result;
}

void sub_1000605D4(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = a2;
    id v7 = [v3 client];
    id v5 = [v7 xpcCnx];
    uint64_t v6 = [v5 remoteObjectProxyWithErrorHandler:&stru_100122FF8];
    [v6 nearbyInvitationSessionError:v4 withID:*(void *)(a1 + 40)];
  }
}

void sub_100060674(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  id v3 = v2;
  if (dword_1001419A0 <= 90)
  {
    id v5 = v2;
    if (dword_1001419A0 != -1 || (v4 = _LogCategory_Initialize(), id v3 = v5, v4))
    {
      LogPrintF();
      id v3 = v5;
    }
  }
}

id sub_100060A58(uint64_t a1)
{
  return [*(id *)(a1 + 32) _xpcConnectionInvalidated:*(void *)(a1 + 40)];
}

id sub_100060BD8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _update];
}

void sub_100060DB0(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) xpcCnx];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100060E70;
  v4[3] = &unk_100121908;
  id v5 = *(id *)(a1 + 40);
  id v3 = [v2 remoteObjectProxyWithErrorHandler:v4];
  [v3 nearbyInvitationReceivedEventID:*(void *)(a1 + 40) event:*(void *)(a1 + 48) options:*(void *)(a1 + 56) sessionID:*(void *)(a1 + 64)];
}

void sub_100060E70(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = v2;
  if (dword_1001419A0 <= 90)
  {
    id v5 = v2;
    if (dword_1001419A0 != -1 || (v4 = _LogCategory_Initialize(), id v3 = v5, v4))
    {
      LogPrintF();
      id v3 = v5;
    }
  }
}

void sub_10006106C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) xpcCnx];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100061130;
  v4[3] = &unk_100121908;
  id v5 = *(id *)(a1 + 40);
  id v3 = [v2 remoteObjectProxyWithErrorHandler:v4];
  [v3 nearbyInvitationReceivedRequestID:*(void *)(a1 + 40) request:*(void *)(a1 + 48) options:*(void *)(a1 + 56) responseHandler:*(void *)(a1 + 72) sessionID:*(void *)(a1 + 64)];
}

void sub_100061130(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = v2;
  if (dword_1001419A0 <= 90)
  {
    id v5 = v2;
    if (dword_1001419A0 != -1 || (v4 = _LogCategory_Initialize(), id v3 = v5, v4))
    {
      LogPrintF();
      id v3 = v5;
    }
  }
}

void sub_1000619B4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = v3;
  if (dword_1001419A0 <= 90)
  {
    if (dword_1001419A0 != -1 || (v4 = _LogCategory_Initialize(), id v3 = v6, v4))
    {
      LogPrintF();
      id v3 = v6;
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
    id v3 = v6;
  }
}

void sub_100061DA4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "shouldReportDevice:"))
  {
    int v4 = [*(id *)(*(void *)(a1 + 40) + 80) remoteObjectProxy];
    [v4 nearbyInvitationFoundDevice:v5];
  }
}

void sub_1000623A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  (*(void (**)(uint64_t))(v11 + 16))(v11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000623E4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000623F4(uint64_t a1)
{
}

uint64_t sub_1000623FC(uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 40) + 8) + 40))
  {
    uint64_t v1 = result;
    if (dword_1001419A0 <= 90 && (dword_1001419A0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id result = *(void *)(v1 + 32);
    if (result)
    {
      id v2 = *(uint64_t (**)(void))(result + 16);
      return v2();
    }
  }
  return result;
}

Class sub_100062CB0()
{
  if (qword_100142D60 != -1) {
    dispatch_once(&qword_100142D60, &stru_1001230B0);
  }
  Class result = objc_getClass("SFDeviceDiscovery");
  qword_100142D58 = (uint64_t)result;
  off_100141A10 = (uint64_t (*)())sub_100062D14;
  return result;
}

id sub_100062D14()
{
  return (id)qword_100142D58;
}

void sub_100062D20(id a1)
{
  qword_100142D68 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/Sharing.framework/Sharing", 2);
}

Class sub_100062D4C()
{
  if (qword_100142D60 != -1) {
    dispatch_once(&qword_100142D60, &stru_1001230B0);
  }
  Class result = objc_getClass("SFService");
  qword_100142D70 = (uint64_t)result;
  off_100141A18 = (uint64_t (*)())sub_100062DB0;
  return result;
}

id sub_100062DB0()
{
  return (id)qword_100142D70;
}

id sub_100062DBC()
{
  if (qword_100142D60 != -1) {
    dispatch_once(&qword_100142D60, &stru_1001230B0);
  }
  int v0 = (id *)dlsym((void *)qword_100142D68, "SFServiceIdentifierAcceptedInvitation");
  if (v0) {
    objc_storeStrong((id *)&qword_100142D50, *v0);
  }
  off_100141A20 = (uint64_t (*)())sub_100062E4C;
  uint64_t v1 = (void *)qword_100142D50;

  return v1;
}

id sub_100062E4C()
{
  return (id)qword_100142D50;
}

id sub_100062E58()
{
  if (qword_100142D60 != -1) {
    dispatch_once(&qword_100142D60, &stru_1001230B0);
  }
  int v0 = (id *)dlsym((void *)qword_100142D68, "SFServiceIdentifierHasInvitations");
  if (v0) {
    objc_storeStrong((id *)&qword_100142D48, *v0);
  }
  off_100141A28 = (uint64_t (*)())sub_100062EE8;
  uint64_t v1 = (void *)qword_100142D48;

  return v1;
}

id sub_100062EE8()
{
  return (id)qword_100142D48;
}

void sub_100063784(id a1)
{
}

void sub_100064EE0(id a1)
{
  uint64_t v1 = objc_alloc_init(RPIdentityDaemon);
  id v2 = (void *)qword_100142D88;
  qword_100142D88 = (uint64_t)v1;
}

id sub_100065ED8(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _activate];
}

id sub_10006602C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _update];
}

id sub_100066034(uint64_t a1)
{
  return [*(id *)(a1 + 32) _update];
}

id sub_1000660B0(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _invalidate];
}

void sub_100068FCC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100068FF8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100069008(uint64_t a1)
{
}

void sub_100069010(uint64_t a1, void *a2, unsigned char *a3)
{
  id v11 = a2;
  unsigned int v6 = [*(id *)(a1 + 32) verifyWithIdentity:v11];
  id v7 = v11;
  if (v6)
  {
    id v8 = [v11 contactID];

    id v9 = [v11 accountID];

    unsigned int v10 = [v11 type];
    if (v8 || v10 == 2)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
      *a3 = 1;
    }
    else
    {
      id v7 = v11;
      if (!v9) {
        goto LABEL_8;
      }
      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v11];
    }
    id v7 = v11;
  }
LABEL_8:
}

void sub_100069238(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100069250(void *a1, void *a2)
{
  id v9 = a2;
  unsigned int v3 = [v9 verifySignature:a1[4] data:a1[5] error:0];
  int v4 = v9;
  if (v3)
  {
    id v5 = [v9 accountAltDSID];
    if (!v5)
    {
      unsigned int v6 = +[RPCompanionLinkDaemon sharedCompanionLinkDaemon];
      id v7 = [v6 localDeviceInfo];
      id v5 = [v7 accountAltDSID];
    }
    if (![v5 isEqualToString:a1[6]]) {
      goto LABEL_10;
    }
    if ([v9 type] == 2
      || [v9 type] == 12
      || [v9 type] == 8)
    {
      uint64_t v8 = 0x80000;
    }
    else
    {
      if ([v9 type] != 4) {
        goto LABEL_10;
      }
      uint64_t v8 = 0x4000;
    }
    *(void *)(*(void *)(a1[7] + 8) + 24) |= v8;
LABEL_10:

    int v4 = v9;
  }
}

void sub_100069528(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10006954C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) invalidate];
  if (v6)
  {
    if (dword_100141B60 <= 60 && (dword_100141B60 != -1 || _LogCategory_Initialize()))
    {
      [*(id *)(a1 + 40) contactID];
      id v16 = v5;
      v15 = id v17 = v6;
      LogPrintF();
    }
    id v7 = [*(id *)(a1 + 40) accountID:v15, v16, v17];
    [*(id *)(a1 + 48) setEmailAddress:v7];

    uint64_t v8 = [*(id *)(a1 + 40) accountID];
    [*(id *)(a1 + 48) setPhoneNumber:v8];

    [*(id *)(a1 + 48) setContactIdentifier:0];
    id v9 = objc_alloc_init((Class)off_100141BE8[0]());
    [v9 setDispatchQueue:*(void *)(*(void *)(a1 + 56) + 160)];
    unsigned int v10 = *(void **)(a1 + 48);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000697B4;
    v19[3] = &unk_100123168;
    id v20 = v9;
    id v21 = v10;
    id v11 = *(id *)(a1 + 40);
    uint64_t v12 = *(void *)(a1 + 56);
    id v22 = v11;
    uint64_t v23 = v12;
    long long v18 = *(_OWORD *)(a1 + 64);
    id v13 = (id)v18;
    long long v24 = v18;
    id v14 = v9;
    [v14 findContact:v10 completion:v19];
  }
  else
  {
    if (dword_100141B60 <= 30 && (dword_100141B60 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))(*(void *)(a1 + 64));
  }
}

void sub_1000697B4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) invalidate];
  if (!v6)
  {
    if (dword_100141B60 <= 30 && (dword_100141B60 != -1 || _LogCategory_Initialize()))
    {
      id v7 = [*(id *)(a1 + 48) accountID];
      [v5 contactIdentifier];
      v19 = long long v18 = v7;
      LogPrintF();
    }
    id v11 = +[RPPeopleDaemon sharedPeopleDaemon];
    uint64_t v12 = [*(id *)(a1 + 48) accountID];
    id v13 = [v5 contactIdentifier];
    unsigned __int8 v14 = [v11 updateFriendIdentityWithAppleID:v12 contactID:v13];

    if (v14)
    {
      if (dword_100141B60 > 30 || dword_100141B60 == -1 && !_LogCategory_Initialize())
      {
        char v17 = 1;
        goto LABEL_33;
      }
      uint64_t v15 = [*(id *)(a1 + 48) accountID];
      id v16 = [v5 contactIdentifier];
      LogPrintF();
      char v17 = 1;
    }
    else
    {
      if (dword_100141B60 > 30 || dword_100141B60 == -1 && !_LogCategory_Initialize())
      {
        char v17 = 0;
        goto LABEL_33;
      }
      uint64_t v15 = [*(id *)(a1 + 48) accountID];
      id v16 = [v5 contactIdentifier];
      LogPrintF();
      char v17 = 0;
    }

LABEL_33:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v17;
    (*(void (**)(void, void))(*(void *)(a1 + 64) + 16))(*(void *)(a1 + 64), *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 72) + 8) + 24));
    goto LABEL_34;
  }
  if (dword_100141B60 <= 60 && (dword_100141B60 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v19 = v6;
    uint64_t v20 = *(void *)(a1 + 48);
    long long v18 = *(void **)(a1 + 40);
    LogPrintF();
  }
  uint64_t v9 = *(void *)(a1 + 48);
  uint64_t v8 = *(void **)(a1 + 56);
  id v21 = 0;
  [v8 removeIdentity:v9 error:&v21];
  id v10 = v21;
  if (v10)
  {
    if (dword_100141B60 > 60 || dword_100141B60 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_28;
    }
  }
  else if (dword_100141B60 > 30 || dword_100141B60 == -1 && !_LogCategory_Initialize())
  {
    goto LABEL_28;
  }
  LogPrintF();
LABEL_28:
  *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
  (*(void (**)(void, void))(*(void *)(a1 + 64) + 16))(*(void *)(a1 + 64), *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 72) + 8) + 24));

LABEL_34:
}

id sub_10006A888(uint64_t a1)
{
  if (dword_100141B60 <= 30 && (dword_100141B60 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v2 = *(void **)(a1 + 32);

  return [v2 _loadTemporarySelfIdentity];
}

void sub_10006A9E4(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  [*(id *)(a1 + 32) invalidate];
  if (!v11 || v5)
  {
    if (!v5)
    {
      RPErrorF();
      id v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (dword_100141B60 <= 90 && (dword_100141B60 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
  }
  else
  {
    id v5 = objc_alloc_init((Class)RPIdentity);
    id v6 = [v11 identifier];
    id v7 = [v6 UUIDString];
    [v5 setIdentifier:v7];

    uint64_t v8 = [v11 publicKey];
    [v5 setEdPKData:v8];

    uint64_t v9 = [v11 secretKey];
    [v5 setEdSKData:v9];

    id v10 = [v11 altIRK];
    [v5 setDeviceIRKData:v10];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
  }
}

void sub_10006BC20(uint64_t a1)
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 120);
  id v3 = [v2 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v18;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v18 != v5) {
        objc_enumerationMutation(v2);
      }
      id v7 = *(void **)(*((void *)&v17 + 1) + 8 * v6);
      uint64_t v8 = [v7 identifier];
      uint64_t v9 = [*(id *)(a1 + 40) identifier];
      unsigned __int8 v10 = [v8 isEqual:v9];

      if (v10) {
        break;
      }
      if (v4 == (id)++v6)
      {
        id v4 = [v2 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v4) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v11 = v7;

    if (!v11) {
      goto LABEL_12;
    }
    [*(id *)(a1 + 32) updateSessionPairedIdentity:*(void *)(a1 + 40)];
  }
  else
  {
LABEL_9:

LABEL_12:
    uint64_t v12 = *(void **)(*(void *)(a1 + 32) + 120);
    if (!v12)
    {
      uint64_t v13 = +[NSMutableArray array];
      uint64_t v14 = *(void *)(a1 + 32);
      uint64_t v15 = *(void **)(v14 + 120);
      *(void *)(v14 + 120) = v13;

      uint64_t v12 = *(void **)(*(void *)(a1 + 32) + 120);
    }
    [v12 addObject:*(void *)(a1 + 40)];
    if (dword_100141B60 <= 30 && (dword_100141B60 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v16 = *(void *)(a1 + 40);
      LogPrintF();
    }
    [*(id *)(a1 + 32) _postIdentitiesChangedNotification:v16];
    id v11 = +[RPDaemon sharedDaemon];
    [v11 postDaemonInfoChanges:0x2000];
  }
}

void sub_10006BED0(uint64_t a1)
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 120);
  id v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v14;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v14 != v5) {
        objc_enumerationMutation(v2);
      }
      id v7 = *(void **)(*((void *)&v13 + 1) + 8 * v6);
      uint64_t v8 = [v7 identifier];
      unsigned __int8 v9 = [v8 isEqual:*(void *)(a1 + 40)];

      if (v9) {
        break;
      }
      if (v4 == (id)++v6)
      {
        id v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v4) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v10 = v7;

    if (!v10) {
      return;
    }
    if (dword_100141B60 <= 30 && (dword_100141B60 != -1 || _LogCategory_Initialize()))
    {
      id v12 = v10;
      LogPrintF();
    }
    [*(id *)(*(void *)(a1 + 32) + 120) removeObject:v10, v12];
    [*(id *)(a1 + 32) _postIdentitiesChangedNotification];
    id v11 = +[RPDaemon sharedDaemon];
    [v11 postDaemonInfoChanges:0x2000];
  }
  else
  {
LABEL_9:
    id v10 = v2;
  }
}

void sub_10006C1A8(uint64_t a1)
{
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 120);
  id v3 = [v2 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v19;
LABEL_3:
    uint64_t v5 = 0;
    while (1)
    {
      if (*(void *)v19 != v4) {
        objc_enumerationMutation(v2);
      }
      uint64_t v6 = *(void **)(*((void *)&v18 + 1) + 8 * v5);
      id v7 = [v6 identifier];
      uint64_t v8 = [*(id *)(a1 + 40) identifier];
      unsigned __int8 v9 = [v7 isEqual:v8];

      if (v9) {
        break;
      }
      if (v3 == (id)++v5)
      {
        id v3 = [v2 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v3) {
          goto LABEL_3;
        }
        goto LABEL_28;
      }
    }
    id v3 = v6;

    if (!v3) {
      goto LABEL_29;
    }
    uint64_t v10 = [v3 name];
    if (v10)
    {
      id v11 = (void *)v10;
      int v12 = 0;
    }
    else
    {
      long long v13 = [*(id *)(a1 + 40) name];

      if (!v13)
      {
        int v12 = 0;
LABEL_16:
        long long v14 = [v3 model];
        if (v14)
        {
        }
        else
        {
          long long v15 = [*(id *)(a1 + 40) model];

          if (v15)
          {
            long long v16 = [*(id *)(a1 + 40) model];
            [v3 setModel:v16];

LABEL_22:
            if (dword_100141B60 <= 30 && (dword_100141B60 != -1 || _LogCategory_Initialize()))
            {
              id v17 = v3;
              LogPrintF();
            }
            [*(id *)(a1 + 32) _postIdentitiesChangedNotification:v17];
            id v2 = +[RPDaemon sharedDaemon];
            [v2 postDaemonInfoChanges:0x2000];
            goto LABEL_28;
          }
        }
        if (!v12) {
          goto LABEL_29;
        }
        goto LABEL_22;
      }
      id v11 = [*(id *)(a1 + 40) name];
      [v3 setName:v11];
      int v12 = 1;
    }

    goto LABEL_16;
  }
LABEL_28:

LABEL_29:
}

id sub_10006C4CC(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) identifier];

  if (!v2)
  {
    id v3 = +[NSUUID UUID];
    uint64_t v4 = [v3 UUIDString];
    [*(id *)(a1 + 32) setIdentifier:v4];
  }
  uint64_t v5 = [*(id *)(a1 + 32) idsDeviceID];

  if (!v5)
  {
    uint64_t v6 = [*(id *)(a1 + 32) identifier];
    [*(id *)(a1 + 32) setIdsDeviceID:v6];
  }
  if (![*(id *)(*(void *)(a1 + 40) + 128) count])
  {
LABEL_10:
    long long v14 = *(void **)(*(void *)(a1 + 40) + 128);
    if (!v14)
    {
      uint64_t v15 = +[NSMutableArray array];
      uint64_t v16 = *(void *)(a1 + 40);
      id v17 = *(void **)(v16 + 128);
      *(void *)(v16 + 12_Block_object_dispose(&STACK[0x578], 8) = v15;

      long long v14 = *(void **)(*(void *)(a1 + 40) + 128);
    }
    [v14 addObject:*(void *)(a1 + 32)];
    if (dword_100141B60 > 30 || dword_100141B60 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_22;
    }
LABEL_18:
    uint64_t v21 = *(void *)(a1 + 32);
    LogPrintF();
    goto LABEL_22;
  }
  uint64_t v7 = 0;
  while (1)
  {
    uint64_t v8 = [*(id *)(*(void *)(a1 + 40) + 128) objectAtIndexedSubscript:v7];
    unsigned __int8 v9 = [v8 identifier];
    uint64_t v10 = [*(id *)(a1 + 32) identifier];
    if ([v9 isEqual:v10]) {
      break;
    }
    id v11 = [v8 edPKData];
    int v12 = [*(id *)(a1 + 32) edPKData];
    unsigned __int8 v13 = [v11 isEqual:v12];

    if (v13) {
      goto LABEL_16;
    }

    if (++v7 >= (unint64_t)[*(id *)(*(void *)(a1 + 40) + 128) count]) {
      goto LABEL_10;
    }
  }

LABEL_16:
  [*(id *)(*(void *)(a1 + 40) + 128) setObject:*(void *)(a1 + 32) atIndexedSubscript:v7];
  if (dword_100141B60 <= 30 && (dword_100141B60 != -1 || _LogCategory_Initialize())) {
    goto LABEL_18;
  }
LABEL_22:
  long long v18 = +[RPDaemon sharedDaemon];
  [v18 postDaemonInfoChanges:0x4000];

  long long v19 = *(void **)(a1 + 40);

  return [v19 _postIdentitiesChangedNotification];
}

void *sub_10006CA44(void *result)
{
  if (*(_DWORD *)(result[4] + 8) != -1)
  {
    uint64_t v1 = result;
    if (dword_100141B60 <= 30 && (dword_100141B60 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v2 = (void *)v1[4];
    return [v2 _updateSameAccountIdentities];
  }
  return result;
}

void *sub_10006CAE4(void *result)
{
  if (*(_DWORD *)(result[4] + 12) != -1)
  {
    uint64_t v1 = result;
    if (dword_100141B60 <= 30 && (dword_100141B60 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(id)v1[4] _loadSelfIdentity:0];
    id v2 = (void *)v1[4];
    return [v2 _updateSameAccountIdentities];
  }
  return result;
}

void *sub_10006CB90(void *result)
{
  if (*(_DWORD *)(result[4] + 48) != -1)
  {
    uint64_t v1 = result;
    if (dword_100141B60 <= 30 && (dword_100141B60 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v2 = (void *)v1[4];
    return [v2 _updatePairedDeviceIdentities];
  }
  return result;
}

void sub_10006CE98(id a1)
{
  if (dword_100141B60 <= 30 && (dword_100141B60 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }

  notify_post("com.apple.rapport.identitiesChanged");
}

void sub_10006D0CC(id a1, NSError *a2)
{
  id v2 = a2;
  id v3 = v2;
  if (dword_100141B60 <= 30)
  {
    uint64_t v5 = v2;
    if (dword_100141B60 != -1 || (v4 = _LogCategory_Initialize(), id v3 = v5, v4))
    {
      LogPrintF();
      id v3 = v5;
    }
  }
}

void sub_10006D24C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) invalidate];
  if (v5)
  {
    id v7 = objc_alloc_init((Class)NSMutableArray);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v20 = v5;
    id v8 = v5;
    id v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v10; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v22 != v11) {
            objc_enumerationMutation(v8);
          }
          unsigned __int8 v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          long long v14 = [v13 identifier];
          uint64_t v15 = [v14 UUIDString];

          if (v15)
          {
            uint64_t v16 = [v13 altIRK];
            if (v16)
            {
              id v17 = [objc_alloc((Class)RPIdentity) initWithPairedPeer:v13 type:8];
              if (v17) {
                [v7 addObject:v17];
              }
            }
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v10);
    }

    objc_storeStrong((id *)(*(void *)(a1 + 40) + 40), v7);
    if (dword_100141B60 <= 30 && (dword_100141B60 != -1 || _LogCategory_Initialize()))
    {
      id v19 = [v7 count];
      LogPrintF();
    }
    long long v18 = +[RPDaemon sharedDaemon];
    [v18 postDaemonInfoChanges:256];

    [*(id *)(a1 + 40) _postIdentitiesChangedNotification];
    id v5 = v20;
  }
  else if (dword_100141B60 <= 90 && (dword_100141B60 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

void *sub_10006EF00(void *result)
{
  uint64_t v1 = (void *)result[4];
  if (v1 == *(void **)(result[5] + 152))
  {
    id v2 = result;
    if (v1)
    {
      id v3 = v1;
      dispatch_source_cancel(v3);
      uint64_t v4 = v2[5];
      id v5 = *(void **)(v4 + 152);
      *(void *)(v4 + 152) = 0;
    }
    if (dword_100141B60 <= 30 && (dword_100141B60 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v6 = (void *)v2[5];
    return [v6 _loadTemporarySelfIdentity];
  }
  return result;
}

Class sub_100070310()
{
  if (qword_100142DA8 != -1) {
    dispatch_once(&qword_100142DA8, &stru_100123218);
  }
  Class result = objc_getClass("CBPeripheralManager");
  qword_100142DA0 = (uint64_t)result;
  off_100141BD0[0] = (uint64_t (*)())sub_100070374;
  return result;
}

id sub_100070374()
{
  return (id)qword_100142DA0;
}

void sub_100070380(id a1)
{
  qword_100142DB0 = (uint64_t)dlopen("/System/Library/Frameworks/CoreBluetooth.framework/CoreBluetooth", 2);
}

id sub_1000703AC()
{
  if (qword_100142DA8 != -1) {
    dispatch_once(&qword_100142DA8, &stru_100123218);
  }
  int v0 = (id *)dlsym((void *)qword_100142DB0, "CBManagerNeedsRestrictedStateOperation");
  if (v0) {
    objc_storeStrong((id *)&qword_100142D98, *v0);
  }
  off_100141BD8[0] = (uint64_t (*)())sub_10007043C;
  uint64_t v1 = (void *)qword_100142D98;

  return v1;
}

id sub_10007043C()
{
  return (id)qword_100142D98;
}

Class sub_100070448()
{
  if (qword_100142DC0 != -1) {
    dispatch_once(&qword_100142DC0, &stru_100123238);
  }
  Class result = objc_getClass("SFContactInfo");
  qword_100142DB8 = (uint64_t)result;
  off_100141BE0[0] = (uint64_t (*)())sub_1000704AC;
  return result;
}

id sub_1000704AC()
{
  return (id)qword_100142DB8;
}

void sub_1000704B8(id a1)
{
  qword_100142DC8 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/Sharing.framework/Sharing", 2);
}

Class sub_1000704E4()
{
  if (qword_100142DC0 != -1) {
    dispatch_once(&qword_100142DC0, &stru_100123238);
  }
  Class result = objc_getClass("SFClient");
  qword_100142DD0 = (uint64_t)result;
  off_100141BE8[0] = (uint64_t (*)())sub_100070548;
  return result;
}

id sub_100070548()
{
  return (id)qword_100142DD0;
}

BOOL sub_100070554(uint64_t a1)
{
  return a1 == 1;
}

id sub_1000711E4(void *a1)
{
  id v1 = a1;
  id v2 = objc_opt_new();
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = v1;
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = +[RPTransportServiceMetadata metadataWithDictionary:](RPTransportServiceMetadata, "metadataWithDictionary:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
        if (v8) {
          [v2 addObject:v8];
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  return v2;
}

Class sub_1000716E8()
{
  if (qword_100142DE0 != -1) {
    dispatch_once(&qword_100142DE0, &stru_1001233B0);
  }
  Class result = objc_getClass("NFConnectionHandoverSelect");
  qword_100142DD8 = (uint64_t)result;
  off_100141BF0[0] = (uint64_t (*)())sub_10007174C;
  return result;
}

id sub_10007174C()
{
  return (id)qword_100142DD8;
}

void sub_100071758(id a1)
{
  qword_100142DE8 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/NearField.framework/NearField", 2);
}

Class sub_100071784()
{
  if (qword_100142DE0 != -1) {
    dispatch_once(&qword_100142DE0, &stru_1001233B0);
  }
  Class result = objc_getClass("NFConnectionHandoverRequest");
  qword_100142DF0 = (uint64_t)result;
  off_100141BF8 = (uint64_t (*)())sub_1000717E8;
  return result;
}

id sub_1000717E8()
{
  return (id)qword_100142DF0;
}

void sub_100071A30(os_unfair_lock_s *a1, void *a2)
{
  if (a1)
  {
    id v2 = a1 + 2;
    id v3 = a2;
    os_unfair_lock_lock(v2);
    v3[2](v3);

    os_unfair_lock_unlock(v2);
  }
}

void sub_100071B38(uint64_t a1)
{
}

void sub_100071C34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100071C4C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100071C5C(uint64_t a1)
{
}

void sub_100071C64(uint64_t a1)
{
}

uint64_t sub_100071CEC(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 32) = *(void *)(result + 40);
  return result;
}

void sub_100071DA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100071DBC(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 32);
  return result;
}

void sub_100071F34(uint64_t a1)
{
}

void sub_100072030(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100072048(uint64_t a1)
{
}

uint64_t sub_1000720D0(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 32) = *(void *)(result + 40);
  return result;
}

void sub_100072188(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000721A0(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 32);
  return result;
}

uint64_t sub_100072228(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 40) = *(void *)(result + 40);
  return result;
}

void sub_1000722E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000722F8(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 40);
  return result;
}

uint64_t sub_100072380(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 4_Block_object_dispose(&STACK[0x578], 8) = *(void *)(result + 40);
  return result;
}

void sub_100072438(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100072450(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 48);
  return result;
}

uint64_t sub_1000726D0(uint64_t result)
{
  *(_DWORD *)(*(void *)(result + 32) + 24) = *(_DWORD *)(result + 40);
  return result;
}

void sub_10007278C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000727A4(uint64_t result)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_DWORD *)(*(void *)(result + 32) + 24);
  return result;
}

uint64_t sub_10007282C(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 32) = *(void *)(result + 40);
  return result;
}

void sub_1000728E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000728FC(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 32);
  return result;
}

uint64_t sub_100072988(uint64_t result)
{
  *(_DWORD *)(*(void *)(result + 32) + 2_Block_object_dispose(&STACK[0x578], 8) = *(_DWORD *)(result + 40);
  return result;
}

void sub_100072A44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100072A5C(uint64_t result)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_DWORD *)(*(void *)(result + 32) + 28);
  return result;
}

void sub_100072B0C(uint64_t a1)
{
}

void sub_100072C08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100072C20(uint64_t a1)
{
}

void sub_100072CB8(uint64_t a1)
{
  long long v5 = *(_OWORD *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 56);
  uint64_t v2 = sub_10000E8DC((uint64_t *)&v5);
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 48);
  *(void *)(v3 + 4_Block_object_dispose(&STACK[0x578], 8) = v2;
}

void sub_100072DFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100072E14(uint64_t a1)
{
}

id sub_1000734F4(uint64_t a1, uint64_t a2)
{
  return [_objc_msgSend(*(id *)(a1 + 32), "_handleCommand:responseHandler:", a2);
}

void *sub_10007397C(void *result, int a2)
{
  if (*(unsigned char *)(result[4] + 48))
  {
    uint64_t v3 = result;
    if (dword_100141C70 <= 30 && (dword_100141C70 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    *(_DWORD *)(v3[4] + 44) = a2;
    id v4 = (void *)v3[4];
    return _[v4 _mediaRemoteVolumeControlUpdate];
  }
  return result;
}

void *sub_100073D0C(void *result)
{
  if (*(unsigned char *)(result[4] + 42))
  {
    id v1 = result;
    if (dword_100141C70 <= 30 && (dword_100141C70 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    uint64_t v2 = (void *)v1[4];
    return [v2 _mediaRemoteSupportedCommandsGet];
  }
  return result;
}

void sub_100073E84(uint64_t a1, const __CFArray *a2)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 8));
  *(unsigned char *)(*(void *)(a1 + 32) + 41) = 0;
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 42)) {
    return;
  }
  if (a2) {
    CFIndex Count = CFArrayGetCount(a2);
  }
  else {
    CFIndex Count = 0;
  }
  int v5 = dword_100141C70;
  if (dword_100141C70 <= 9)
  {
    if (dword_100141C70 != -1)
    {
LABEL_8:
      if (v5 == -1 && !_LogCategory_Initialize()) {
        goto LABEL_19;
      }
      goto LABEL_15;
    }
    int v6 = _LogCategory_Initialize();
    int v5 = dword_100141C70;
    if (v6)
    {
      if (dword_100141C70 > 9) {
        goto LABEL_19;
      }
      goto LABEL_8;
    }
  }
  if (v5 > 30 || v5 == -1 && !_LogCategory_Initialize()) {
    goto LABEL_19;
  }
LABEL_15:
  LogPrintF();
LABEL_19:
  if (Count < 1)
  {
    uint64_t v8 = 0;
  }
  else
  {
    CFIndex v7 = 0;
    uint64_t v8 = 0;
    do
    {
      CFArrayGetValueAtIndex(a2, v7);
      if (MRMediaRemoteCommandInfoGetEnabled())
      {
        int Command = MRMediaRemoteCommandInfoGetCommand();
        switch(Command)
        {
          case 0:
            v8 |= 1uLL;
            break;
          case 1:
            v8 |= 2uLL;
            break;
          case 2:
          case 3:
          case 6:
          case 7:
          case 9:
          case 11:
          case 12:
          case 13:
          case 14:
          case 15:
          case 16:
            break;
          case 4:
            v8 |= 4uLL;
            break;
          case 5:
            v8 |= 8uLL;
            break;
          case 8:
            v8 |= 0x10uLL;
            break;
          case 10:
            v8 |= 0x20uLL;
            break;
          case 17:
            v8 |= 0x200uLL;
            break;
          case 18:
            v8 |= 0x400uLL;
            break;
          default:
            uint64_t v10 = v8 | 0x80;
            if (Command != 26) {
              uint64_t v10 = v8;
            }
            if (Command == 25) {
              v8 |= 0x40uLL;
            }
            else {
              uint64_t v8 = v10;
            }
            break;
        }
      }
      ++v7;
    }
    while (Count != v7);
  }
  long long v11 = *(void **)(a1 + 32);

  _[v11 _mediaControlFlagsUpdate:v8 mask:1791];
}

void sub_1000741A8(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(a1 + 32) + 48))
  {
    uint64_t v2 = [*(id *)(a1 + 40) userInfo];
    int Int64Ranged = CFDictionaryGetInt64Ranged();

    if (*(_DWORD *)(*(void *)(a1 + 32) + 44) != Int64Ranged)
    {
      if (dword_100141C70 <= 30 && (dword_100141C70 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      *(_DWORD *)(*(void *)(a1 + 32) + 44) = Int64Ranged;
      id v4 = *(void **)(a1 + 32);
      _[v4 _mediaRemoteVolumeControlUpdate];
    }
  }
}

uint64_t sub_100074A5C(uint64_t a1)
{
  if (dword_100141C70 <= 30 && (dword_100141C70 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 24);
  if (v2)
  {
    uint64_t v3 = v2;
    dispatch_source_cancel(v3);
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = *(void **)(v4 + 24);
    *(void *)(v4 + 24) = 0;
  }
  uint64_t result = MRMediaRemoteSendCommand();
  *(_DWORD *)(*(void *)(a1 + 32) + 16) = 3;
  return result;
}

uint64_t sub_10007516C(uint64_t a1)
{
  if (qword_100142DF8 != -1) {
    dispatch_once(&qword_100142DF8, &stru_1001234F0);
  }
  uint64_t v2 = (uint64_t (*)())dlsym((void *)qword_100142E00, "MACaptionAppearanceGetDisplayType");
  off_100141CE8[0] = v2;

  return ((uint64_t (*)(uint64_t))v2)(a1);
}

void sub_1000751E8(id a1)
{
  qword_100142E00 = (uint64_t)dlopen("/System/Library/Frameworks/MediaAccessibility.framework/MediaAccessibility", 2);
}

uint64_t sub_100075214(uint64_t a1, uint64_t a2)
{
  if (qword_100142DF8 != -1) {
    dispatch_once(&qword_100142DF8, &stru_1001234F0);
  }
  uint64_t v4 = (uint64_t (*)())dlsym((void *)qword_100142E00, "MACaptionAppearanceSetDisplayType");
  off_100141CF0 = v4;

  return ((uint64_t (*)(uint64_t, uint64_t))v4)(a1, a2);
}

Class sub_100075298()
{
  if (qword_100142E10 != -1) {
    dispatch_once(&qword_100142E10, &stru_100123510);
  }
  Class result = objc_getClass("AVSystemController");
  qword_100142E08 = (uint64_t)result;
  off_100141CE0[0] = (uint64_t (*)())sub_1000752FC;
  return result;
}

id sub_1000752FC()
{
  return (id)qword_100142E08;
}

void sub_100075308(id a1)
{
  qword_100142E18 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/MediaExperience.framework/MediaExperience", 2);
}

uint64_t sub_10007573C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10007574C(uint64_t result, uint64_t a2, char a3)
{
  if ((a3 & 2) != 0) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

uint64_t sub_100075764(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100075774(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100075784(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v7 = v3;
    if (dword_100141CF8 <= 90 && (dword_100141CF8 != -1 || _LogCategory_Initialize()))
    {
      id v6 = v7;
      LogPrintF();
    }
    [*(id *)(*(void *)(a1 + 32) + 16) invalidate:v6];
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = *(void **)(v4 + 16);
    *(void *)(v4 + 16) = 0;

    id v3 = v7;
  }
}

void sub_100075BA4(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (dword_100141CF8 <= 30 && (dword_100141CF8 != -1 || _LogCategory_Initialize()))
  {
    id v15 = objc_retainBlock(v7);
    LogPrintF();
  }
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v10 = *(void *)(v8 + 32);
  id v9 = (id *)(v8 + 32);
  if (v10)
  {
    if (dword_100141CF8 <= 90 && (dword_100141CF8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  else
  {
    objc_storeStrong(v9, a2);
    long long v11 = +[RPNWNetworkAgent sharedNetworkAgent];
    long long v12 = [v11 dispatchQueue];
    [*(id *)(*(void *)(a1 + 32) + 32) setDispatchQueue:v12];

    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100075E0C;
    void v18[3] = &unk_100123660;
    id v19 = v6;
    id v13 = *(id *)(a1 + 48);
    uint64_t v20 = *(void *)(a1 + 32);
    id v21 = v13;
    [*(id *)(v20 + 32) setInvalidationHandler:v18];
    long long v14 = [*(id *)(*(void *)(a1 + 32) + 32) invalidationHandler];
    [*(id *)(*(void *)(a1 + 32) + 32) setInterruptionHandler:v14];

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100075EC8;
    void v16[3] = &unk_100121908;
    uint64_t v17 = *(void *)(a1 + 32);
    [*(id *)(v17 + 32) setErrorHandler:v16];
    [*(id *)(a1 + 32) handleConnectionRequest:*(void *)(*(void *)(a1 + 32) + 32) agentClient:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) handleConnectionData:1];
  }
}

void sub_100075E0C(uint64_t a1)
{
  if (dword_100141CF8 <= 30 && (dword_100141CF8 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v4 = [*(id *)(a1 + 32) destinationDevice];
    LogPrintF();
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48));
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(void **)(v2 + 32);
  *(void *)(v2 + 32) = 0;
}

void sub_100075EC8(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (dword_100141CF8 <= 90 && (dword_100141CF8 != -1 || _LogCategory_Initialize()))
  {
    id v3 = v4;
    LogPrintF();
  }
  [*(id *)(*(void *)(a1 + 32) + 32) invalidate:v3];
}

void sub_100075F70(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if (dword_100141CF8 <= 30 && (dword_100141CF8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v6 = *(void **)(*(void *)(a1 + 32) + 32);
  if (v6)
  {
    [v6 invalidate];
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void **)(v7 + 32);
    *(void *)(v7 + 32) = 0;
  }
}

void sub_10007603C(id a1)
{
  if (dword_100141CF8 <= 30 && (dword_100141CF8 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

void sub_1000760B0(uint64_t a1)
{
  if (dword_100141CF8 <= 30 && (dword_100141CF8 != -1 || _LogCategory_Initialize()))
  {
    id v2 = [*(id *)(*(void *)(a1 + 32) + 24) serviceType];
    LogPrintF();
  }
}

void sub_10007615C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v10 = v3;
  if (v3)
  {
    if (dword_100141CF8 <= 90 && (dword_100141CF8 != -1 || _LogCategory_Initialize()))
    {
      id v8 = v10;
      LogPrintF();
    }
    [*(id *)(*(void *)(a1 + 32) + 24) invalidate:v8];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 24);
    *(void *)(v4 + 24) = 0;

    id v3 = v10;
  }
  if (dword_100141CF8 <= 30)
  {
    if (dword_100141CF8 != -1 || (int v6 = _LogCategory_Initialize(), v3 = v10, v6))
    {
      id v9 = [*(id *)(*(void *)(a1 + 32) + 24) serviceType];
      LogPrintF();

      id v3 = v10;
    }
  }
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7)
  {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v10);
    id v3 = v10;
  }
}

void sub_10007657C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (dword_100141CF8 <= 90 && (dword_100141CF8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    (*(void (**)(void, void))(*(void *)(a1 + 72) + 16))(*(void *)(a1 + 72), 0);
  }
  else
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000767D0;
    v15[3] = &unk_100123660;
    id v16 = *(id *)(a1 + 32);
    id v4 = *(id *)(a1 + 80);
    uint64_t v17 = *(void *)(a1 + 40);
    id v18 = v4;
    [*(id *)(v17 + 32) setInvalidationHandler:v15];
    id v5 = [*(id *)(*(void *)(a1 + 40) + 32) invalidationHandler];
    [*(id *)(*(void *)(a1 + 40) + 32) setInterruptionHandler:v5];

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10007687C;
    void v13[3] = &unk_100121908;
    uint64_t v14 = *(void *)(a1 + 40);
    [*(id *)(v14 + 32) setErrorHandler:v13];
    int v6 = *(void **)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v8 = *(void *)(a1 + 56);
    uint64_t v9 = *(void *)(a1 + 64);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100076924;
    v10[3] = &unk_100123720;
    id v11 = *(id *)(a1 + 32);
    id v12 = *(id *)(a1 + 72);
    [v6 sendWithRequestID:@"com.apple.oneapi.nearbyinvitation.connection" data:0 status:0 applicationService:v7 listenerID:v8 connectionID:v9 responseHandler:v10];
  }
}

void sub_1000767D0(uint64_t a1)
{
  if (dword_100141CF8 <= 30 && (dword_100141CF8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48));
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(void **)(v2 + 32);
  *(void *)(v2 + 32) = 0;
}

void sub_10007687C(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (dword_100141CF8 <= 90 && (dword_100141CF8 != -1 || _LogCategory_Initialize()))
  {
    id v3 = v4;
    LogPrintF();
  }
  [*(id *)(*(void *)(a1 + 32) + 32) invalidate:v3];
}

void sub_100076924(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (dword_100141CF8 <= 30 && (dword_100141CF8 != -1 || _LogCategory_Initialize()))
  {
    +[RPNWPeer responseCodeToString:a2];
    LogPrintF();
  }
  if (a2 == 2)
  {
    if (dword_100141CF8 <= 30 && (dword_100141CF8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    (*(void (**)(void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 2);
  }
  else
  {
    (*(void (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0);
  }
}

BOOL sub_100076C30(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (dword_100141CF8 <= 30 && (dword_100141CF8 != -1 || _LogCategory_Initialize()))
  {
    if (*(unsigned char *)(a1 + 32)) {
      id v13 = "SERVER";
    }
    else {
      id v13 = "CLIENT";
    }
    uint64_t v20 = v13;
    LogPrintF();
  }
  uint64_t v14 = [v11 nearbyInvitationConnection:v20];
  id v15 = [v14 framer];

  if (v15)
  {
    id v16 = [v11 nearbyInvitationConnection];
    uint64_t v17 = [v16 framer];
  }
  else
  {
    uint64_t v17 = [v11 listen_framer];
  }
  BOOL v18 = +[RPNWFramer writeDataOnFramer:v17 data:v9];

  return v18;
}

void sub_100076D8C(id a1, RPNWAgentClient *a2, NSUUID *a3, int a4)
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v17 = a2;
  int v6 = a3;
  if (dword_100141CF8 <= 30 && (dword_100141CF8 != -1 || _LogCategory_Initialize()))
  {
    id v15 = v6;
    id v16 = v17;
    uint64_t v14 = +[RPNWNearbyInvitationPeer statusCodeToString:v4];
    LogPrintF();
  }
  uint64_t v7 = [(RPNWAgentClient *)v17 nearbyInvitationConnection];
  if (!v7) {
    goto LABEL_21;
  }
  uint64_t v8 = (void *)v7;
  id v9 = [(RPNWAgentClient *)v17 nearbyInvitationConnection];
  id v10 = [v9 framer];

  if (v10)
  {
    if (v4 == 1)
    {
      uint64_t v11 = 53;
    }
    else
    {
      if (v4 != 4) {
        goto LABEL_16;
      }
      uint64_t v11 = 57;
    }
    id v12 = [(RPNWAgentClient *)v17 nearbyInvitationConnection];
    id v13 = [v12 framer];
    +[RPNWFramer writeErrorOnFramer:v13 error:v11];
  }
  else
  {
LABEL_21:
    if (dword_100141CF8 <= 90 && (dword_100141CF8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
LABEL_16:
}

uint64_t sub_10007700C(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5, void *a6)
{
  id v10 = a2;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = v13;
  if (v11 && v12 && v13)
  {
    if ([*(id *)(a1 + 32) findNearbyInvitationListenerAndCreateConnection:*(void *)(a1 + 40) applicationService:v11 listenerID:v12 connectionID:v13 agentClient:*(void *)(a1 + 48)])uint64_t v15 = 2; {
    else
    }
      uint64_t v15 = 0;
  }
  else
  {
    if (dword_100141CF8 <= 90 && (dword_100141CF8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    uint64_t v15 = 0;
  }

  return v15;
}

void sub_100077584(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = [v7 objectForKeyedSubscript:@"request"];
  if (dword_100141CF8 <= 30 && (dword_100141CF8 != -1 || _LogCategory_Initialize()))
  {
    id v30 = [v10 length];
    uint64_t v32 = *(void *)(a1 + 32);
    LogPrintF();
  }
  id v11 = [v7 objectForKeyedSubscript:@"status" v30, v32];
  id v12 = v11;
  if (v11) {
    id v13 = [v11 intValue];
  }
  else {
    id v13 = 0;
  }
  uint64_t v14 = [v7 objectForKeyedSubscript:@"applicationService"];
  uint64_t v15 = [v8 objectForKeyedSubscript:@"senderID"];
  if (v15)
  {
    id v35 = v9;
    uint64_t v16 = a1;
    id v38 = v8;
    long long v39 = v10;
    uint64_t v17 = [v8 objectForKeyedSubscript:@"senderIDS"];
    if (dword_100141CF8 <= 30 && (dword_100141CF8 != -1 || _LogCategory_Initialize()))
    {
      id v33 = v15;
      uint64_t v34 = v17;
      uint64_t v31 = v14;
      LogPrintF();
    }
    CFStringRef v36 = (void *)v17;
    id v18 = objc_alloc((Class)NSUUID);
    id v19 = [v7 objectForKeyedSubscript:@"connectionID"];
    id v20 = [v18 initWithUUIDString:v19];

    id v21 = objc_alloc((Class)NSUUID);
    long long v22 = [v7 objectForKeyedSubscript:@"listenerID"];
    id v23 = [v21 initWithUUIDString:v22];

    long long v37 = v14;
    long long v24 = v20;
    uint64_t v25 = (*(uint64_t (**)(void, void *, id))(*(void *)(v16 + 40) + 16))(*(void *)(v16 + 40), v39, v13);
    id v26 = 0;
    id v27 = objc_alloc_init((Class)NSMutableDictionary);
    uint64_t v28 = +[NSNumber numberWithUnsignedInt:v25];
    [v27 setObject:v28 forKeyedSubscript:@"response"];
    if (v26)
    {
      id v9 = v35;
      if (dword_100141CF8 <= 30 && (dword_100141CF8 != -1 || _LogCategory_Initialize()))
      {
        uint64_t v31 = v28;
        id v33 = v26;
        LogPrintF();
      }
      [v27 setObject:v26 forKeyedSubscript:@"listenerID" withObjects:v31, v33, v34];
      id v8 = v38;
    }
    else
    {
      id v8 = v38;
      id v9 = v35;
      if (dword_100141CF8 <= 30 && (dword_100141CF8 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
    }
    (*((void (**)(id, id, void, void))v9 + 2))(v9, v27, 0, 0);

    id v10 = v39;
    uint64_t v14 = v37;
  }
  else
  {
    if (dword_100141CF8 <= 90 && (dword_100141CF8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    uint64_t v29 = RPErrorF();
    (*((void (**)(id, void, void, void *))v9 + 2))(v9, 0, 0, v29);
  }
}

void sub_100077E1C(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v20 = a2;
  id v7 = a3;
  id v9 = a4;
  if (v9)
  {
    if (dword_100141CF8 > 90 || dword_100141CF8 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_13;
    }
    goto LABEL_4;
  }
  if (!v20)
  {
    if (dword_100141CF8 > 90 || dword_100141CF8 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_13;
    }
LABEL_4:
    id v10 = [*(id *)(a1 + 32) destinationDevice];
    id v11 = [v10 name];
    LogPrintF();

LABEL_13:
    (*(void (**)(void, uint64_t, void, uint64_t))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), 3, 0, v8);
    goto LABEL_16;
  }
  id v12 = [v20 objectForKeyedSubscript:@"response"];
  id v13 = [v12 intValue];

  uint64_t v17 = [v20 objectForKeyedSubscript:@"listenerID"];
  if (dword_100141CF8 <= 30 && (dword_100141CF8 != -1 || _LogCategory_Initialize()))
  {
    id v18 = [*(id *)(a1 + 32) destinationDevice];
    id v19 = [v18 name];
    +[RPNWNearbyInvitationPeer responseCodeToString:v13];
    LogPrintF();
  }
  (*(void (**)(void, id, void *, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), v13, v17, v14, v15, v16);

LABEL_16:
}

uint64_t sub_100078168(uint64_t a1, void *a2, int a3, void *a4, void *a5, void *a6)
{
  id v11 = a2;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = v14;
  if (v12 && v14)
  {
    uint64_t v16 = +[RPNWAgentClient findAgentClientFromConnectionID:v14];
    if (v16)
    {
      if (v11)
      {
        if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))()) {
          uint64_t v17 = 2;
        }
        else {
          uint64_t v17 = 0;
        }
        goto LABEL_23;
      }
      if (a3)
      {
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        uint64_t v17 = 2;
LABEL_23:

        goto LABEL_24;
      }
      if (dword_100141CF8 > 90 || dword_100141CF8 == -1 && !_LogCategory_Initialize())
      {
LABEL_22:
        uint64_t v17 = 0;
        goto LABEL_23;
      }
    }
    else if (dword_100141CF8 > 90 || dword_100141CF8 == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_22;
    }
    LogPrintF();
    goto LABEL_22;
  }
  if (dword_100141CF8 <= 90 && (dword_100141CF8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  uint64_t v17 = 0;
LABEL_24:

  return v17;
}

uint64_t sub_1000784A8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100078604(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (dword_100141CF8 <= 30 && (dword_100141CF8 != -1 || _LogCategory_Initialize()))
  {
    +[RPNWNearbyInvitationPeer responseCodeToString:a2];
    LogPrintF();
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, a2);
  }
}

void sub_1000787C8(id a1)
{
  if (CFPrefs_GetInt64())
  {
    id v1 = objc_alloc_init(RPMetrics);
    uint64_t v2 = (void *)qword_100142E20;
    qword_100142E20 = (uint64_t)v1;

    [(id)qword_100142E20 activate];
  }
}

id sub_1000789D8(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _reportMetrics];
}

id sub_100078A5C(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _activate];
}

void sub_100078AE8(id a1)
{
  if (dword_100141D68 <= 30 && (dword_100141D68 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

void sub_100078BF4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];

  id v3 = *(void **)(*(void *)(a1 + 32) + 32);
  if (v2)
  {
    uint64_t v4 = [v3 objectForKeyedSubscript:*(void *)(a1 + 40)];
    uint64_t v5 = (char *)[v4 unsignedIntegerValue];

    id v6 = +[NSNumber numberWithUnsignedInteger:v5 + 1];
    [*(id *)(*(void *)(a1 + 32) + 32) setObject:v6 forKeyedSubscript:*(void *)(a1 + 40)];
  }
  else
  {
    [v3 setObject:&off_10012B2D0 forKeyedSubscript:*(void *)(a1 + 40)];
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 24) = 1;
}

void sub_100078D68(uint64_t a1)
{
  id v7 = [objc_alloc((Class)NSString) initWithFormat:@"%d,%d,%@", *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49), *(void *)(a1 + 32)];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 40) + 48) objectForKeyedSubscript:];

  id v3 = *(void **)(*(void *)(a1 + 40) + 48);
  if (v2)
  {
    uint64_t v4 = [v3 objectForKeyedSubscript:v7];
    uint64_t v5 = (char *)[v4 unsignedIntegerValue];

    id v6 = +[NSNumber numberWithUnsignedInteger:v5 + 1];
    [*(id *)(*(void *)(a1 + 40) + 48) setObject:v6 forKeyedSubscript:v7];
  }
  else
  {
    [v3 setObject:&off_10012B2D0 forKeyedSubscript:v7];
  }
  *(unsigned char *)(*(void *)(a1 + 40) + 24) = 1;
}

id sub_100078FE4(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _logReceivedMessageType:*(unsigned int *)(a1 + 96) identifier:*(void *)(a1 + 40) options:*(void *)(a1 + 48) appID:*(void *)(a1 + 56) timeBegin:*(void *)(a1 + 80) timeEnd:*(void *)(a1 + 88) bytesAdded:*(double *)(a1 + 64) messagesAdded:*(double *)(a1 + 72)];
}

void sub_10007971C(id a1)
{
  qword_100142E38 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/PowerLog.framework/PowerLog", 2);
}

uint64_t sub_100079748(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (qword_100142E30 != -1) {
    dispatch_once(&qword_100142E30, &stru_100123968);
  }
  uint64_t v8 = (uint64_t (*)())dlsym((void *)qword_100142E38, "PLLogRegisteredEvent");
  off_100141DD8 = v8;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v8)(a1, a2, a3, a4);
}

void sub_100079838(id a1)
{
  id v1 = objc_alloc_init(RPWiFiP2PTransaction);
  uint64_t v2 = (void *)qword_100142E48;
  qword_100142E48 = (uint64_t)v1;
}

void sub_1000799D4(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Unwind_Resume(a1);
}

void sub_100079A04(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  id v3 = *(void **)(*(void *)(a1 + 32) + 8);
  if (!v3)
  {
    uint64_t v4 = +[NSMutableSet set];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 8);
    *(void *)(v5 + _Block_object_dispose(&STACK[0x578], 8) = v4;

    id v3 = *(void **)(*(void *)(a1 + 32) + 8);
  }
  [v3 addObject:*(void *)(a1 + 40)];
  objc_sync_exit(v2);

  if (dword_100141DE0 <= 30 && (dword_100141DE0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
}

void sub_100079AE0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void *sub_100079AF4(void *result, uint64_t a2)
{
  if (a2)
  {
    id v2 = result;
    if (dword_100141DE0 <= 90 && (dword_100141DE0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    uint64_t v3 = v2[5];
    uint64_t v4 = *(void **)(v2[4] + 8);
    return [v4 removeObject:v3];
  }
  return result;
}

void sub_100079DB0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

Class sub_100079DD8()
{
  if (qword_100142E58 != -1) {
    dispatch_once(&qword_100142E58, &stru_1001239D0);
  }
  Class result = objc_getClass("WiFiP2PSPITransactionRequestor");
  qword_100142E50 = (uint64_t)result;
  off_100141E50 = (uint64_t (*)())sub_100079E3C;
  return result;
}

id sub_100079E3C()
{
  return (id)qword_100142E50;
}

void sub_100079E48(id a1)
{
  qword_100142E60 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/WiFiPeerToPeer.framework/WiFiPeerToPeer", 2);
}

id sub_10007B1F8(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) _deviceFound:a2];
}

id sub_10007B204(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) _deviceLost:a2];
}

void sub_10007B210(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (dword_100141EC8 <= 90 && (dword_100141EC8 != -1 || _LogCategory_Initialize())) {
LABEL_7:
    }
      LogPrintF();
  }
  else if (dword_100141EC8 <= 30 && (dword_100141EC8 != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_7;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
}

Class sub_10007B8A4()
{
  if (qword_100142E78 != -1) {
    dispatch_once(&qword_100142E78, &stru_1001239F0);
  }
  Class result = objc_getClass("CBDiscovery");
  qword_100142E70 = (uint64_t)result;
  off_100141F38 = (uint64_t (*)())sub_10007B908;
  return result;
}

id sub_10007B908()
{
  return (id)qword_100142E70;
}

void sub_10007B914(id a1)
{
  qword_100142E80 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/CoreBluetooth.framework/CoreBluetooth", 2);
}

id sub_10007C638(uint64_t a1)
{
  if (dword_100141F40 <= 30 && (dword_100141F40 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v4 = 10;
    LogPrintF();
  }
  [*(id *)(a1 + 32) _stopPollingCoolDownTimer:v4];
  id v2 = *(void **)(a1 + 32);

  return [v2 _updatePolling];
}

void sub_10007C8B0(uint64_t a1)
{
  if (dword_100141F40 <= 30 && (dword_100141F40 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [*(id *)(a1 + 32) _stopConnectToReceiverTimer];
  id v2 = [*(id *)(a1 + 32) currentTransaction];
  id v3 = [v2 role];

  if (v3 != (id)1)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    [v4 _stopInitiator];
  }
}

id sub_10007CAEC(uint64_t a1)
{
  if (dword_100141F40 <= 30 && (dword_100141F40 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v2 = *(void **)(a1 + 32);

  return [v2 _stopInitiator];
}

void sub_10007CCAC(uint64_t a1)
{
  if (dword_100141F40 <= 30 && (dword_100141F40 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v4 = 0x3FE6666666666666;
    LogPrintF();
  }
  [*(id *)(a1 + 32) _stopBecomeInitiatorTimer:v4];
  id v2 = [*(id *)(a1 + 32) currentTransaction];

  if (!v2)
  {
    id v3 = *(void **)(a1 + 32);
    [v3 _startInitiator];
  }
}

void sub_10007E160(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ([*(id *)(a1 + 32) _didReceiveAuthenticationResponseWithResult:a2 error:a3])
  {
    uint64_t v4 = [*(id *)(a1 + 32) currentTransaction];
    uint64_t v5 = [v4 remoteAuthenticationMessage];
    id v6 = [v5 payload];
    id v7 = [v6 type];

    if (v7)
    {
      uint64_t v8 = [*(id *)(a1 + 32) dataSource];
      id v9 = [v8 transactionController:*(void *)(a1 + 32) requestMessageForType:2];

      if (v9)
      {
        id v10 = [*(id *)(a1 + 32) currentTransaction];
        [v10 setLocalValidationMessage:v9];

        if (dword_100141F40 <= 30 && (dword_100141F40 != -1 || _LogCategory_Initialize()))
        {
          id v19 = v9;
          LogPrintF();
        }
        id v11 = *(void **)(a1 + 40);
        id v12 = [v9 connectionHandoverRequest:v19];
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_10007E478;
        v21[3] = &unk_100123A18;
        v21[4] = *(void *)(a1 + 32);
        [v11 sendHandoverRequest:v12 responseHandler:v21];
      }
      else
      {
        if (dword_100141F40 <= 90 && (dword_100141F40 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        id v18 = +[NSError errorWithDomain:@"RPNFCTransactionControllerErrorDomain" code:2 userInfo:0];
        [*(id *)(a1 + 32) _finishCurrentTransactionWithError:v18];
      }
    }
    else
    {
      if (dword_100141F40 <= 30 && (dword_100141F40 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      id v13 = *(void **)(a1 + 32);
      id v14 = [v13 currentTransaction];
      uint64_t v15 = [v14 remoteAuthenticationMessage];
      uint64_t v16 = [v15 applicationLabel];
      id v20 = [v13 _createTapEventForApplicationLabel:v16];

      uint64_t v17 = [*(id *)(a1 + 32) currentTransaction];
      [v17 setTapEvent:v20];

      [*(id *)(a1 + 32) _finishCurrentTransactionWithError:0];
    }
  }
}

id sub_10007E478(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _[*(id *)(a1 + 32) _didReceiveValidationResponseWithResult:a2 error:a3];
}

void sub_10007EDEC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v10 = v3;
  if (v3)
  {
    if (dword_100141F40 <= 90 && ((id v4 = v3, dword_100141F40 != -1) || (v7 = _LogCategory_Initialize(), id v4 = v10, v7)))
    {
      id v9 = v4;
      LogPrintF();
      [*(id *)(a1 + 32) _finishCurrentTransactionWithError:v10, v9];
    }
    else
    {
      [*(id *)(a1 + 32) _finishCurrentTransactionWithError:v10, v8];
    }
  }
  else
  {
    uint64_t v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    if (*(unsigned char *)(a1 + 48)) {
      [v5 _didReceiveAuthenticationMessage:v6];
    }
    else {
      [v5 _didReceiveValidationMessage:v6];
    }
  }
}

void sub_10007F3B8(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (v5)
  {
    if (dword_100141F40 <= 90 && (dword_100141F40 != -1 || _LogCategory_Initialize()))
    {
LABEL_7:
      uint64_t v6 = [*(id *)(a1 + 32) URL];
      LogPrintF();
    }
  }
  else if (dword_100141F40 <= 30 && (dword_100141F40 != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_7;
  }
}

Class sub_10007F6D0()
{
  if (qword_100142E90 != -1) {
    dispatch_once(&qword_100142E90, &stru_100123A88);
  }
  Class result = objc_getClass("NFConnectionHandoverInitiator");
  qword_100142E88 = (uint64_t)result;
  off_100141FB0 = (uint64_t (*)())sub_10007F734;
  return result;
}

id sub_10007F734()
{
  return (id)qword_100142E88;
}

void sub_10007F740(id a1)
{
  qword_100142E98 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/NearField.framework/NearField", 2);
}

Class sub_10007F76C()
{
  if (qword_100142E90 != -1) {
    dispatch_once(&qword_100142E90, &stru_100123A88);
  }
  Class result = objc_getClass("NFConnectionHandoverReceiver");
  qword_100142EA0 = (uint64_t)result;
  off_100141FB8 = (uint64_t (*)())sub_10007F7D0;
  return result;
}

id sub_10007F7D0()
{
  return (id)qword_100142EA0;
}

Class sub_10007F7DC()
{
  if (qword_100142EB0 != -1) {
    dispatch_once(&qword_100142EB0, &stru_100123AA8);
  }
  Class result = objc_getClass("LSApplicationWorkspace");
  qword_100142EA8 = (uint64_t)result;
  off_100141FC0 = (uint64_t (*)())sub_10007F840;
  return result;
}

id sub_10007F840()
{
  return (id)qword_100142EA8;
}

void sub_10007F84C(id a1)
{
  qword_100142EB8 = (uint64_t)dlopen("/System/Library/Frameworks/MobileCoreServices.framework/MobileCoreServices", 2);
}

void sub_10007F974(uint64_t a1)
{
  uint64_t v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472;
  uint64_t v8 = sub_10007FA7C;
  id v9 = &unk_100121F48;
  id v10 = 0;
  id v11 = *(id *)(a1 + 40);
  id v2 = objc_retainBlock(&v6);
  id v3 = *(void **)(a1 + 32);
  if (v3[2] && v3[4])
  {
    uint64_t v4 = [v3 _createAndRunSession:v6, v7, v8, v9, v10];
  }
  else
  {
    uint64_t v4 = RPErrorF();
  }
  id v5 = (void *)v4;
  ((void (*)(void ***))v2[2])(v2);
}

void sub_10007FA5C(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_10007FA7C(uint64_t a1)
{
  if (*(void *)(a1 + 32)
    && dword_100142088 <= 90
    && (dword_100142088 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

void sub_10007FB98(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 56);
  if (v2)
  {
    *(void *)(v1 + 56) = 0;
    id v6 = v2;

    [v6 invalidate];
    [v6 setDelegate:0];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 48);
    *(void *)(v4 + 4_Block_object_dispose(&STACK[0x578], 8) = 0;
  }
}

void sub_10007FCBC(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) bleDevice];
  if (v2)
  {
    id v14 = v2;
    id v3 = [v2 advertisementFields];
    unsigned __int8 Int64Ranged = CFDictionaryGetInt64Ranged();

    id v5 = [*(id *)(a1 + 32) model];
    if (!v5)
    {
      if ([*(id *)(a1 + 32) deviceModelCode] == 5)
      {
        unsigned int v6 = [*(id *)(a1 + 32) deviceModelCode];
        uint64_t v7 = "Unknown";
        switch(v6)
        {
          case 0u:
            break;
          case 1u:
            uint64_t v7 = "D22ish";
            break;
          case 2u:
            uint64_t v7 = "SEish";
            break;
          case 3u:
            uint64_t v7 = "J3XXish";
            break;
          case 4u:
            uint64_t v7 = "N112ish";
            break;
          case 5u:
            uint64_t v7 = "B520ish";
            break;
          case 6u:
            uint64_t v7 = "B620ish";
            break;
          case 7u:
            uint64_t v7 = "J255ish";
            break;
          default:
            uint64_t v7 = "?";
            break;
        }
        id v5 = +[NSString stringWithUTF8String:v7];
      }
      else
      {
        id v5 = 0;
      }
    }
    id v8 = objc_alloc(off_1001420F8());
    double v9 = (double)(uint64_t)[v14 rssi];
    id v10 = [v14 identifier];
    id v11 = [v10 UUIDString];
    id v12 = [v8 initWithRSSI:v11 identifier:v5 model:Int64Ranged channel:v9 machContinuousTimeSeconds:(double)mach_continuous_time()];

    id v13 = [*(id *)(*(void *)(a1 + 40) + 56) devicePresenceNotifier];
    [v13 notifyBluetoothSample:v12];

    id v2 = v14;
  }
}

Class sub_100080648()
{
  if (qword_100142EC8 != -1) {
    dispatch_once(&qword_100142EC8, &stru_100123AF0);
  }
  Class result = objc_getClass("NIBluetoothSample");
  qword_100142EC0 = (uint64_t)result;
  off_1001420F8 = (uint64_t (*)())sub_1000806AC;
  return result;
}

id sub_1000806AC()
{
  return (id)qword_100142EC0;
}

void sub_1000806B8(id a1)
{
  qword_100142ED0 = (uint64_t)dlopen("/System/Library/Frameworks/NearbyInteraction.framework/NearbyInteraction", 2);
}

Class sub_1000806E4()
{
  if (qword_100142EC8 != -1) {
    dispatch_once(&qword_100142EC8, &stru_100123AF0);
  }
  Class result = objc_getClass("NIRegionPredicate");
  qword_100142ED8 = (uint64_t)result;
  off_100142100 = (uint64_t (*)())sub_100080748;
  return result;
}

id sub_100080748()
{
  return (id)qword_100142ED8;
}

Class sub_100080754()
{
  if (qword_100142EC8 != -1) {
    dispatch_once(&qword_100142EC8, &stru_100123AF0);
  }
  Class result = objc_getClass("NIDevicePresenceConfiguration");
  qword_100142EE0 = (uint64_t)result;
  off_100142108 = (uint64_t (*)())sub_1000807B8;
  return result;
}

id sub_1000807B8()
{
  return (id)qword_100142EE0;
}

Class sub_1000807C4()
{
  if (qword_100142EC8 != -1) {
    dispatch_once(&qword_100142EC8, &stru_100123AF0);
  }
  Class result = objc_getClass("NISession");
  qword_100142EE8 = (uint64_t)result;
  off_100142110 = (uint64_t (*)())sub_100080828;
  return result;
}

id sub_100080828()
{
  return (id)qword_100142EE8;
}

void sub_100080E08(uint64_t a1, void *a2)
{
  id v8 = a2;
  if (dword_1001421D8 <= 30 && (dword_1001421D8 != -1 || _LogCategory_Initialize()))
  {
    id v3 = +[RPNWNetworkAgent getLogInfo];
    id v4 = *(id *)(a1 + 32);
    id v5 = objc_alloc_init((Class)NSMutableString);
    [v5 appendFormat:@"%p", v4];

    LogPrintF();
  }
  unsigned int v6 = *(void **)(a1 + 32);
  uint64_t v7 = objc_opt_new();
  [v6 addMappingForDevice:v8 endpointID:v7];
}

void sub_100080F28(uint64_t a1, void *a2)
{
  id v9 = a2;
  if (dword_1001421D8 <= 30 && (dword_1001421D8 != -1 || _LogCategory_Initialize()))
  {
    id v3 = +[RPNWNetworkAgent getLogInfo];
    id v4 = *(id *)(a1 + 32);
    id v5 = objc_alloc_init((Class)NSMutableString);
    [v5 appendFormat:@"%p", v4];

    id v7 = v5;
    id v8 = v9;
    unsigned int v6 = v3;
    LogPrintF();
  }
  [*(id *)(a1 + 32) updateMappingForDevice:v9, v6, v7, v8];
}

void sub_10008102C(uint64_t a1, void *a2)
{
  id v9 = a2;
  if (dword_1001421D8 <= 30 && (dword_1001421D8 != -1 || _LogCategory_Initialize()))
  {
    id v3 = +[RPNWNetworkAgent getLogInfo];
    id v4 = *(id *)(a1 + 32);
    id v5 = objc_alloc_init((Class)NSMutableString);
    [v5 appendFormat:@"%p", v4];

    id v7 = v5;
    id v8 = v9;
    unsigned int v6 = v3;
    LogPrintF();
  }
  [*(id *)(a1 + 32) removeDevice:v9, v6, v7, v8];
}

id sub_100081130(uint64_t a1)
{
  return _[*(id *)(a1 + 32) removeAllDevices];
}

void sub_100081384(id a1)
{
  uint64_t v1 = objc_alloc_init(RPNWNetworkAgent);
  id v2 = (void *)qword_100142EF0;
  qword_100142EF0 = (uint64_t)v1;
}

id sub_100081634(uint64_t a1)
{
  if (dword_100142248 <= 30 && (dword_100142248 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v2 = *(void **)(a1 + 32);

  return [v2 prefsChanged];
}

id sub_10008172C(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _invalidate];
}

uint64_t sub_100082438(uint64_t a1, uint64_t a2)
{
  id v3 = +[NSString stringWithCString:a2 encoding:1];
  [*(id *)(a1 + 32) addObject:v3];

  return 1;
}

int sub_1000825A0(id a1, NSData *a2, NSNumber *a3, RPCompanionLinkDevice *a4, int a5, NSString *a6, NSData *a7, id *a8, id *a9, NSUUID *a10, BOOL a11, NSUUID *a12, id *a13)
{
  uint64_t v17 = a2;
  id v18 = a3;
  id v19 = a4;
  id v20 = a6;
  id v21 = a7;
  long long v22 = a10;
  id v23 = a12;
  *a13 = 0;
  if (v19 && v20)
  {
    if (dword_100142248 <= 40 && (dword_100142248 != -1 || _LogCategory_Initialize()))
    {
      [(RPCompanionLinkDevice *)v19 name];
      id v30 = v29 = v20;
      LogPrintF();
    }
    long long v24 = +[RPNWAgentClient findListenerAgentClientFromApplicationServiceName:](RPNWAgentClient, "findListenerAgentClientFromApplicationServiceName:", v20, v29, v30);
    if (v24)
    {
      uint64_t v25 = +[RPNWListener findListenerForAgentClient:v24 sender:v19 browseRequest:1];
      id v26 = v25;
      if (v25)
      {
        *a13 = [v25 mappingID];
      }

      int v27 = 2 * (*a13 != 0);
    }
    else
    {
      int v27 = 0;
    }
  }
  else
  {
    if (dword_100142248 <= 90 && (dword_100142248 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    int v27 = 0;
  }

  return v27;
}

uint64_t sub_10008278C(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, void *a6, void *a7, void *a8, void *a9, void *a10, uint64_t a11, void *a12)
{
  id v17 = a2;
  id v18 = a3;
  id v19 = a4;
  id v20 = a6;
  id v21 = a7;
  id v22 = a10;
  id v23 = a12;
  if (v19 && v20 && v21)
  {
    id v46 = a8;
    if (dword_100142248 <= 40 && (dword_100142248 != -1 || _LogCategory_Initialize()))
    {
      id v39 = v20;
      id v41 = v19;
      LogPrintF();
    }
    uint64_t v25 = +[RPNWAgentClient findListenerAgentClientFromApplicationServiceName:](RPNWAgentClient, "findListenerAgentClientFromApplicationServiceName:", v20, v39, v41);
    id v26 = v25;
    if (v25)
    {
      id v44 = v18;
      id v45 = v17;
      id v27 = [v25 agentClientID];
      *a9 = v27;
      id v28 = [v27 UUIDString];
      uint64_t v29 = (const char *)[v28 cStringUsingEncoding:4];

      nw_endpoint_t bonjour_service = nw_endpoint_create_bonjour_service(v29, "_asquic._udp", "local");
      id v48 = v21;
      uint64_t v31 = +[NSArray arrayWithObjects:&v48 count:1];
      nw_endpoint_set_public_keys();

      uint64_t v32 = [v19 idsDeviceIdentifier];

      if (v32)
      {
        if (dword_100142248 <= 40 && (dword_100142248 != -1 || _LogCategory_Initialize()))
        {
          [v19 idsDeviceIdentifier];
          id v42 = v20;
          v40 = id v43 = v19;
          LogPrintF();
        }
        [v19 idsDeviceIdentifier:v40, v42, v43];
        id v33 = objc_claimAutoreleasedReturnValue();
        [v33 UTF8String];
        nw_endpoint_set_device_id();
      }
      uint64_t v34 = *(void **)(a1 + 32);
      id v35 = [v26 browseClient];
      *id v46 = [v34 _localPublicKeyForAgentClient:v35];

      CFStringRef v36 = (void *)nw_array_create();
      nw_array_append();
      long long v37 = [v26 browseResponse];
      ((void (**)(void, void *))v37)[2](v37, v36);

      if (*v46) {
        uint64_t v24 = 2 * (*a9 != 0);
      }
      else {
        uint64_t v24 = 0;
      }
      id v18 = v44;
      id v17 = v45;
    }
    else
    {
      uint64_t v24 = 0;
    }
  }
  else
  {
    if (dword_100142248 <= 90 && (dword_100142248 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    uint64_t v24 = 0;
  }

  return v24;
}

id sub_100082B30(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, void *a6, void *a7, uint64_t a8, uint64_t a9, void *a10, char a11, void *a12)
{
  id v17 = a2;
  id v18 = a3;
  id v19 = a4;
  id v20 = a6;
  id v21 = a7;
  id v22 = a10;
  id v23 = a12;
  uint64_t v24 = v23;
  if (v19 && v20 && v22 && v23)
  {
    uint64_t v25 = +[RPNWListener findListenerForID:v22 applicationService:v20 fromPeer:v19];
    if (!v25 && a11)
    {
      uint64_t v25 = +[RPNWListener addDeviceToApplicationServiceMapping:v20 device:v19 completion:0];
      [v25 setAutomapped:1];
    }
    id v26 = [*(id *)(*(void *)(a1 + 32) + 72) findListenerAndCreateConnection:v19 version:v18 applicationService:v20 listenerID:v22 connectionID:v24];
  }
  else
  {
    if (dword_100142248 <= 90 && (dword_100142248 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v26 = 0;
  }

  return v26;
}

uint64_t sub_100082CC0(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) setListen_framer:v3];
  if (dword_100142248 <= 30 && (dword_100142248 != -1 || _LogCategory_Initialize()))
  {
    id v5 = [*(id *)(a1 + 32) listen_framer];
    LogPrintF();
  }
  cleanup_handler[0] = _NSConcreteStackBlock;
  cleanup_handler[1] = 3221225472;
  cleanup_handler[2] = sub_100082DD8;
  cleanup_handler[3] = &unk_100123BC8;
  id v7 = *(id *)(a1 + 32);
  nw_framer_set_cleanup_handler(v3, cleanup_handler);

  return 1;
}

void sub_100082DD8(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (dword_100142248 <= 30 && (dword_100142248 != -1 || _LogCategory_Initialize()))
  {
    id v3 = v4;
    LogPrintF();
  }
  [*(id *)(a1 + 32) setListen_framer:0, v3];
}

void sub_100083780(uint64_t a1, int a2, void *a3)
{
  id v14 = a3;
  if ((a2 - 1) > 1)
  {
    if (dword_100142248 <= 90 && (dword_100142248 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v12 = [*(id *)(a1 + 32) framer];
    +[RPNWFramer writeErrorOnFramer:v12 error:61];
    goto LABEL_23;
  }
  if (dword_100142248 <= 30 && (dword_100142248 != -1 || _LogCategory_Initialize()))
  {
    id v5 = [*(id *)(a1 + 32) peer];
    unsigned int v6 = [v5 destinationDevice];
    id v13 = [v6 name];
    LogPrintF();
  }
  id v7 = [*(id *)(a1 + 32) peer:v13];
  [v7 handleConnectionData:0];

  id v8 = [*(id *)(a1 + 40) type];
  if (a2 == 2 && v8 == (id)4)
  {
    if (dword_100142248 <= 30 && (dword_100142248 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [*(id *)(a1 + 32) setIsConnected:1];
    id v12 = [*(id *)(a1 + 32) framer];
    +[RPNWFramer startConnection:v12];
LABEL_23:

    goto LABEL_24;
  }
  if ([*(id *)(a1 + 40) type] == (id)3)
  {
    id v9 = [*(id *)(a1 + 32) version];
    [v9 doubleValue];
    double v11 = v10;

    if (v11 >= 2.0)
    {
      if (dword_100142248 <= 30 && (dword_100142248 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      [*(id *)(a1 + 32) sendStatusUpdate:5];
    }
  }
LABEL_24:
}

void sub_100083A30(uint64_t a1)
{
  if (dword_100142248 <= 90 && (dword_100142248 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v2 = [*(id *)(a1 + 32) framer];
  +[RPNWFramer writeErrorOnFramer:v2 error:50];
}

uint64_t sub_100083AE4(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) setFramer:v3];
  if (dword_100142248 <= 30 && (dword_100142248 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  void v7[2] = sub_100083C64;
  v7[3] = &unk_100123C40;
  id v8 = *(id *)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100084078;
  v5[3] = &unk_100121158;
  id v6 = *(id *)(a1 + 32);
  +[RPNWFramer setupDaemonFramer:v3 receiveHandler:v7 closeHandler:v5];

  return 2;
}

void sub_100083C64(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  if (dword_100142248 <= 10 && (dword_100142248 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v21 = a3;
    uint64_t v23 = a4;
    LogPrintF();
  }
  id v8 = [*(id *)(a1 + 32) outgoingBuffer:v21, v23];

  if (!v8)
  {
    id v9 = +[NSMutableData dataWithCapacity:0x4000];
    [*(id *)(a1 + 32) setOutgoingBuffer:v9];
  }
  double v10 = [*(id *)(a1 + 32) outgoingBuffer];
  [v10 appendBytes:a2 length:a3];

  double v11 = [*(id *)(a1 + 32) outgoingBuffer];
  unint64_t v12 = (unint64_t)[v11 length];

  if (v12 >> 9 > 0x1E || a4 == 0)
  {
    id v14 = [*(id *)(a1 + 32) outgoingBuffer];
    [*(id *)(a1 + 32) setOutgoingBuffer:0];
    if (dword_100142248 <= 10 && (dword_100142248 != -1 || _LogCategory_Initialize()))
    {
      id v15 = [v14 length];
      uint64_t v16 = [*(id *)(a1 + 32) peer];
      id v17 = [v16 destinationDevice];
      [v17 name];
      v24 = id v22 = v15;
      LogPrintF();
    }
    id v18 = [*(id *)(a1 + 32) peer:v22, v24];
    uint64_t v19 = *(void *)(a1 + 40);
    id v20 = [*(id *)(a1 + 32) connectionUUID];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100083F68;
    v26[3] = &unk_100121630;
    id v27 = *(id *)(a1 + 32);
    [v18 sendDataForConnection:v14 applicationService:v19 connectionID:v20 responseHandler:v26];
  }
  else if (dword_100142248 <= 10 && (dword_100142248 != -1 || _LogCategory_Initialize()))
  {
    id v25 = [*(id *)(a1 + 32) outgoingBuffer];
    [v25 length];
    LogPrintF();
  }
}

void sub_100083F68(uint64_t a1, uint64_t a2)
{
  if (dword_100142248 <= 30 && (dword_100142248 != -1 || _LogCategory_Initialize()))
  {
    id v4 = +[RPNWPeer responseCodeToString:a2];
    LogPrintF();
  }
  if (a2 == 3 || !a2)
  {
    id v5 = [*(id *)(a1 + 32) framer];
    +[RPNWFramer writeErrorOnFramer:error:](RPNWFramer, "writeErrorOnFramer:error:", v4);
  }
}

id sub_100084078(uint64_t a1)
{
  if (dword_100142248 <= 30 && (dword_100142248 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [*(id *)(a1 + 32) sendStatusUpdate:4];
  id v2 = *(void **)(a1 + 32);

  return [v2 setIsConnected:0];
}

void sub_100084834(uint64_t a1, int a2, void *a3)
{
  id v10 = a3;
  if (a2 != 2)
  {
    if (dword_100142248 <= 90 && (dword_100142248 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v8 = [*(id *)(a1 + 32) framer];
    +[RPNWFramer writeErrorOnFramer:v8 error:61];
    goto LABEL_21;
  }
  if (dword_100142248 <= 30 && (dword_100142248 != -1 || _LogCategory_Initialize()))
  {
    id v5 = [*(id *)(a1 + 32) peer];
    id v6 = [v5 destinationDevice];
    id v9 = [v6 name];
    LogPrintF();
  }
  id v7 = [*(id *)(a1 + 32) peer:v9];
  [v7 handleConnectionData:0];

  if ([*(id *)(a1 + 40) type] == (id)4)
  {
    if (dword_100142248 <= 30 && (dword_100142248 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [*(id *)(a1 + 32) setIsConnected:1];
    id v8 = [*(id *)(a1 + 32) framer];
    +[RPNWFramer startConnection:v8];
LABEL_21:

    goto LABEL_22;
  }
  if ([*(id *)(a1 + 40) type] == (id)3)
  {
    if (dword_100142248 <= 30 && (dword_100142248 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [*(id *)(a1 + 32) sendStatusUpdate:5];
  }
LABEL_22:
}

void sub_100084AA8(uint64_t a1)
{
  if (dword_100142248 <= 90 && (dword_100142248 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v2 = [*(id *)(a1 + 32) framer];
  +[RPNWFramer writeErrorOnFramer:v2 error:50];
}

uint64_t sub_100084B5C(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) setFramer:v3];
  if (dword_100142248 <= 30 && (dword_100142248 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  void v7[2] = sub_100084CDC;
  v7[3] = &unk_100123C40;
  id v8 = *(id *)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100084F70;
  v5[3] = &unk_100121158;
  id v6 = *(id *)(a1 + 32);
  +[RPNWFramer setupDaemonFramer:v3 receiveHandler:v7 closeHandler:v5];

  return 2;
}

void sub_100084CDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = +[NSData dataWithBytes:a2 length:a3];
  if (dword_100142248 <= 30 && (dword_100142248 != -1 || _LogCategory_Initialize()))
  {
    id v5 = [v4 length];
    id v6 = [*(id *)(a1 + 32) peer];
    id v7 = [v6 destinationDevice];
    [v7 name];
    v12 = id v11 = v5;
    LogPrintF();
  }
  id v8 = [*(id *)(a1 + 32) peer:v11, v12];
  uint64_t v9 = *(void *)(a1 + 40);
  id v10 = [*(id *)(a1 + 32) connectionUUID];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100084E60;
  void v13[3] = &unk_100121630;
  id v14 = *(id *)(a1 + 32);
  [v8 sendDataForConnection:v4 applicationService:v9 connectionID:v10 responseHandler:v13];
}

void sub_100084E60(uint64_t a1, uint64_t a2)
{
  if (dword_100142248 <= 30 && (dword_100142248 != -1 || _LogCategory_Initialize()))
  {
    id v4 = +[RPNWPeer responseCodeToString:a2];
    LogPrintF();
  }
  if (a2 == 3 || !a2)
  {
    id v5 = [*(id *)(a1 + 32) framer];
    +[RPNWFramer writeErrorOnFramer:error:](RPNWFramer, "writeErrorOnFramer:error:", v4);
  }
}

id sub_100084F70(uint64_t a1)
{
  return [*(id *)(a1 + 32) setIsConnected:0];
}

void sub_100085638(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (dword_100142248 <= 30 && (dword_100142248 != -1 || _LogCategory_Initialize()))
  {
    id v19 = v5;
    LogPrintF();
  }
  id v7 = (void *)nw_agent_client_copy_browse_descriptor();
  if (v7 && nw_browse_descriptor_get_type() == 2)
  {
    id v8 = (void *)nw_agent_client_copy_parameters();
    if (v8)
    {
      if (dword_100142248 <= 30 && (dword_100142248 != -1 || _LogCategory_Initialize()))
      {
        id v19 = v8;
        LogPrintF();
      }
      uint64_t v9 = +[RPNWAgentClient addAgentClient];
      if (v9)
      {
        id v10 = [*(id *)(a1 + 32) _quicProtocolOptionsFromParameters:v8];
        BOOL v21 = v10 != 0;

        uint64_t pid = nw_parameters_get_pid();
        unint64_t v12 = [*(id *)(a1 + 32) getPersonaFromParameters:v8];
        if (dword_100142248 <= 30 && (dword_100142248 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        uint64_t v13 = pid;
        if (nw_browse_descriptor_get_invitation_scope())
        {
          int v14 = _os_feature_enabled_impl();
          char v15 = v14;
          if (v14) {
            uint64_t v16 = 0;
          }
          else {
            uint64_t v16 = v12;
          }
          id v20 = v16;
        }
        else
        {
          char v15 = 0;
          id v20 = v12;
        }
        id v17 = *(void **)(a1 + 32);
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        v22[2] = sub_100085A40;
        v22[3] = &unk_100123C90;
        id v23 = v9;
        id v24 = v5;
        BOOL v30 = v21;
        int v29 = v13;
        id v25 = v7;
        id v26 = v12;
        uint64_t v27 = *(void *)(a1 + 32);
        id v28 = v6;
        char v31 = v15;
        id v18 = v12;
        [v17 executeAgentLogicInPersona:v20 pid:v13 handlerDescription:@"Browse Request" handler:v22];
      }
      else if (dword_100142248 <= 90 && (dword_100142248 != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else if (dword_100142248 <= 90 && (dword_100142248 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else if (dword_100142248 <= 30 && (dword_100142248 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

id sub_100085A40(uint64_t a1)
{
  HIDWORD(v7) = *(_DWORD *)(a1 + 80);
  BYTE2(v7) = 0;
  BYTE1(v7) = *(unsigned char *)(a1 + 84);
  LOBYTE(v7) = 0;
  [*(id *)(a1 + 32) updateAgentClientInfo:0 browseResponse:0 listener:0 bundleID:0 advertiseDescriptor:0 browseDescriptor:0 isFlowHandler:0 isUsingQUIC:0 isTCP:0 agentClientPID:0 persona:v7];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(a1 + 64);
  uint64_t v4 = *(void *)(a1 + 72);
  uint64_t v5 = *(unsigned __int8 *)(a1 + 85);

  return _[v3 discoverDevices:v2 response:v4 nearbyInvitation:v5];
}

void sub_100085AC0(id a1, OS_nw_agent_client *a2)
{
  uint64_t v2 = a2;
  uint64_t v5 = v2;
  if (dword_100142248 <= 30)
  {
    if (dword_100142248 != -1 || (v3 = _LogCategory_Initialize(), uint64_t v2 = v5, v3))
    {
      uint64_t v4 = v2;
      LogPrintF();
      uint64_t v2 = v5;
    }
  }
  +[RPNWAgentClient removeAgentClient:isFlowHandler:](RPNWAgentClient, "removeAgentClient:isFlowHandler:", v2, 0, v4);
}

void sub_100085CB8(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = *(NSObject **)(*(void *)(a1 + 32) + 80);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  void v14[2] = sub_100085DBC;
  v14[3] = &unk_100123D20;
  int v20 = a2;
  id v15 = v8;
  id v16 = v7;
  id v10 = *(id *)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 32);
  id v17 = v10;
  uint64_t v18 = v11;
  id v19 = *(id *)(a1 + 48);
  id v12 = v7;
  id v13 = v8;
  dispatch_async(v9, v14);
}

void sub_100085DBC(uint64_t a1)
{
  uint64_t v2 = (void *)nw_array_create();
  if (*(_DWORD *)(a1 + 72) == 2)
  {
    id v3 = [*(id *)(a1 + 32) UUIDString];
    uint64_t v4 = (const char *)[v3 cStringUsingEncoding:4];

    nw_endpoint_t bonjour_service = nw_endpoint_create_bonjour_service(v4, "_asquic._udp", "local");
    uint64_t v19 = *(void *)(a1 + 40);
    id v6 = +[NSArray arrayWithObjects:&v19 count:1];
    nw_endpoint_set_public_keys();

    if (dword_100142248 <= 40 && (dword_100142248 != -1 || _LogCategory_Initialize()))
    {
      id v13 = +[RPNWNetworkAgent getLogInfo];
      LogPrintF();
    }
    nw_array_append();
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v8 = [*(id *)(*(void *)(a1 + 56) + 48) objectForKeyedSubscript:*(void *)(a1 + 64)];
    id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v10; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          (*(void (**)(void, void *))(*(void *)(*((void *)&v14 + 1) + 8 * i) + 16))(*(void *)(*((void *)&v14 + 1) + 8 * i), v2);
        }
        id v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v10);
    }
  }
  else
  {
    if (dword_100142248 <= 90 && (dword_100142248 != -1 || _LogCategory_Initialize()))
    {
      id v7 = +[RPNWNetworkAgent getLogInfo];
      +[RPNWPeer responseCodeToString:*(unsigned int *)(a1 + 72)];
      LogPrintF();
    }
    nw_endpoint_t bonjour_service = (void *)nw_error_create_error_with_inferred_domain();
    nw_agent_send_error_response();
  }

  [*(id *)(*(void *)(a1 + 56) + 48) setObject:0 forKeyedSubscript:*(void *)(a1 + 64)];
  [*(id *)(*(void *)(a1 + 56) + 56) removeObject:*(void *)(a1 + 64)];
}

void sub_1000861B4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 80));
  if (dword_100142248 <= 40 && (dword_100142248 != -1 || _LogCategory_Initialize()))
  {
    id v28 = v5;
    LogPrintF();
  }
  id v7 = (void *)nw_agent_client_copy_endpoint();
  if (v7)
  {
    if (dword_100142248 <= 40 && (dword_100142248 != -1 || _LogCategory_Initialize()))
    {
      id v28 = v5;
      id v29 = v7;
      LogPrintF();
    }
    v37[0] = 0;
    v37[1] = 0;
    nw_endpoint_get_service_identifier();
    id v8 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:v37];
    if ([*(id *)(*(void *)(a1 + 32) + 56) containsObject:v8])
    {
      if (dword_100142248 <= 30 && (dword_100142248 != -1 || _LogCategory_Initialize()))
      {
        id v28 = *(id *)(*(void *)(a1 + 32) + 56);
        id v29 = v5;
        LogPrintF();
      }
      id v9 = [[*(id *)(*(void *)(a1 + 32) + 48) objectForKeyedSubscript:v8, v28, v29];
      if (v9)
      {
        error_with_inferred_domain = [*(id *)(*(void *)(a1 + 32) + 48) objectForKeyedSubscript:v8];
        id v12 = objc_retainBlock(v6);
        [error_with_inferred_domain addObject:v12];

LABEL_58:
        goto LABEL_59;
      }
      if (dword_100142248 > 90 || dword_100142248 == -1 && !_LogCategory_Initialize())
      {
LABEL_43:
        error_with_inferred_domain = (void *)nw_error_create_error_with_inferred_domain();
        nw_agent_send_error_response();
        goto LABEL_58;
      }
    }
    else
    {
      id v9 = +[RPNWEndpoint findEndpoint:v8];
      if (v9)
      {
        error_with_inferred_domain = [*(id *)(a1 + 32) _localPublicKeyForAgentClient:v5];
        if (error_with_inferred_domain)
        {
          uint64_t v11 = (void *)nw_agent_client_copy_parameters();
          if (v11)
          {
            if (dword_100142248 <= 40 && (dword_100142248 != -1 || _LogCategory_Initialize()))
            {
              id v28 = v11;
              LogPrintF();
            }
            id v30 = [*(id *)(a1 + 32) convertConnectionParametersToControlFlags:v11, v28, v29];
            id v13 = *(void **)(*(void *)(a1 + 32) + 56);
            if (!v13)
            {
              id v14 = objc_alloc_init((Class)NSMutableSet);
              uint64_t v15 = *(void *)(a1 + 32);
              long long v16 = *(void **)(v15 + 56);
              *(void *)(v15 + 56) = v14;

              id v13 = *(void **)(*(void *)(a1 + 32) + 56);
            }
            [v13 addObject:v8];
            long long v17 = *(void **)(*(void *)(a1 + 32) + 48);
            if (!v17)
            {
              id v18 = objc_alloc_init((Class)NSMutableDictionary);
              uint64_t v19 = *(void *)(a1 + 32);
              int v20 = *(void **)(v19 + 48);
              *(void *)(v19 + 4_Block_object_dispose(&STACK[0x578], 8) = v18;

              long long v17 = *(void **)(*(void *)(a1 + 32) + 48);
            }
            BOOL v21 = [v17 objectForKeyedSubscript:v8];

            if (!v21)
            {
              id v22 = objc_alloc_init((Class)NSMutableSet);
              [*(id *)(*(void *)(a1 + 32) + 48) setObject:v22 forKeyedSubscript:v8];
            }
            id v23 = [*(id *)(*(void *)(a1 + 32) + 48) objectForKeyedSubscript:v8];
            id v24 = objc_retainBlock(v6);
            [v23 addObject:v24];

            uint64_t pid = nw_parameters_get_pid();
            id v26 = [*(id *)(a1 + 32) getPersonaFromParameters:v11];
            uint64_t v27 = *(void **)(a1 + 32);
            v31[0] = _NSConcreteStackBlock;
            v31[1] = 3221225472;
            v31[2] = sub_100086880;
            v31[3] = &unk_100123D70;
            v31[4] = v27;
            id v32 = v8;
            id v33 = v9;
            id v36 = v30;
            uint64_t v34 = error_with_inferred_domain;
            id v35 = v5;
            [v27 executeAgentLogicInPersona:v26 pid:pid handlerDescription:@"Resolve Request" handler:v31];
          }
          else
          {
            if (dword_100142248 <= 90 && (dword_100142248 != -1 || _LogCategory_Initialize())) {
              LogPrintF();
            }
            id v26 = (void *)nw_error_create_error_with_inferred_domain();
            nw_agent_send_error_response();
          }
        }
        else
        {
          if (dword_100142248 <= 90 && (dword_100142248 != -1 || _LogCategory_Initialize())) {
            LogPrintF();
          }
          uint64_t v11 = (void *)nw_error_create_error_with_inferred_domain();
          nw_agent_send_error_response();
        }

        goto LABEL_58;
      }
      if (dword_100142248 > 90 || dword_100142248 == -1 && !_LogCategory_Initialize()) {
        goto LABEL_43;
      }
    }
    LogPrintF();
    goto LABEL_43;
  }
  if (dword_100142248 <= 90 && (dword_100142248 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v8 = (id)nw_error_create_error_with_inferred_domain();
  nw_agent_send_error_response();
LABEL_59:
}

id sub_100086880(uint64_t a1)
{
  return _[*(id *)(a1 + 32) resolveRequest:*(void *)(a1 + 40) existingEndpoint:*(void *)(a1 + 48) controlFlags:*(void *)(a1 + 72) clientPublicKey:*(void *)(a1 + 56) client:*(void *)(a1 + 64)];
}

void sub_100086894(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 80));
  if (dword_100142248 <= 30 && (dword_100142248 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  uint64_t v4 = (void *)nw_agent_client_copy_endpoint();
  if (v4)
  {
    if (dword_100142248 <= 30 && (dword_100142248 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    v17[0] = 0;
    v17[1] = 0;
    nw_endpoint_get_service_identifier();
    id error_with_inferred_domain = [objc_alloc((Class)NSUUID) initWithUUIDBytes:v17];
    id v6 = (void *)nw_array_create();
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v7 = [*(id *)(*(void *)(a1 + 32) + 48) objectForKeyedSubscript:error_with_inferred_domain];
    id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          (*(void (**)(void, void *))(*(void *)(*((void *)&v12 + 1) + 8 * i) + 16))(*(void *)(*((void *)&v12 + 1) + 8 * i), v6);
        }
        id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }

    [*(id *)(*(void *)(a1 + 32) + 48) setObject:0 forKeyedSubscript:error_with_inferred_domain];
    [*(id *)(*(void *)(a1 + 32) + 56) removeObject:error_with_inferred_domain];
  }
  else
  {
    if (dword_100142248 <= 90 && (dword_100142248 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id error_with_inferred_domain = (id)nw_error_create_error_with_inferred_domain();
    nw_agent_send_error_response();
  }
}

void sub_100086E90(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (!v3)
  {
    id v7 = 0;
    [*(id *)(a1 + 32) setNearbyInvitationServer:*(void *)(a1 + 40)];
    goto LABEL_6;
  }
  if (dword_100142248 <= 90)
  {
    id v7 = v3;
    if (dword_100142248 != -1 || (int v5 = _LogCategory_Initialize(), v4 = v7, v5))
    {
      id v6 = +[RPNWNetworkAgent getLogInfo];
      LogPrintF();

LABEL_6:
      uint64_t v4 = v7;
    }
  }
}

void sub_100086F60(uint64_t a1)
{
  if (dword_100142248 <= 90 && (dword_100142248 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v4 = +[RPNWNetworkAgent getLogInfo];
    LogPrintF();
  }
  uint64_t v2 = [*(id *)(a1 + 32) nearbyInvitationConnection:v4];
  if (v2)
  {
    id v5 = v2;
    id v3 = [v2 framer];
    +[RPNWFramer writeErrorOnFramer:v3 error:57];

    [*(id *)(a1 + 40) setNearbyInvitationSession:0];
    uint64_t v2 = v5;
  }
}

void sub_10008716C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (dword_100142248 <= 30 && (dword_100142248 != -1 || _LogCategory_Initialize()))
  {
    id v21 = v5;
    LogPrintF();
  }
  id v7 = [[*(id *)(a1 + 32) _applicationServiceAdvertiseDescriptorForClient:v5, v21];
  if (v7)
  {
    id v8 = (void *)nw_agent_client_copy_parameters();
    if (v8)
    {
      if (dword_100142248 <= 30 && (dword_100142248 != -1 || _LogCategory_Initialize()))
      {
        id v22 = v8;
        LogPrintF();
      }
      id v9 = [*(id *)(a1 + 32) _isTCPTransport:v8, v22];
      uint64_t v10 = +[RPNWAgentClient findAgentClient:v5 tryPort:1 isTCP:v9 isFlowHandler:0];
      if (v10
        || (+[RPNWAgentClient addAgentClient],
            (uint64_t v10 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        id v25 = (void *)v10;
        id v29 = v6;
        uint64_t v11 = [*(id *)(a1 + 32) _quicProtocolOptionsFromParameters:v8];
        BOOL v28 = v11 != 0;

        uint64_t pid = nw_parameters_get_pid();
        long long v13 = +[RPNWUtils getBundleIDForPID:pid];
        id v26 = [*(id *)(a1 + 32) getPersonaFromParameters:v8];
        if (dword_100142248 <= 30 && (dword_100142248 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        uint64_t v27 = pid;
        int invitation_route = nw_advertise_descriptor_get_invitation_route();
        int invitation_scope = nw_advertise_descriptor_get_invitation_scope();
        int v16 = 0;
        if (invitation_route && invitation_scope) {
          int v16 = _os_feature_enabled_impl();
        }
        if (dword_100142248 <= 30 && (dword_100142248 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        if (v16) {
          long long v17 = 0;
        }
        else {
          long long v17 = v26;
        }
        id v23 = v17;
        id v24 = *(void **)(a1 + 32);
        v30[0] = _NSConcreteStackBlock;
        v30[1] = 3221225472;
        v30[2] = sub_1000875F4;
        v30[3] = &unk_100123DC0;
        id v31 = v25;
        id v32 = v5;
        id v6 = v29;
        id v37 = v29;
        id v33 = v13;
        BOOL v39 = v28;
        char v40 = (char)v9;
        int v38 = v27;
        id v34 = v7;
        id v35 = v26;
        uint64_t v36 = *(void *)(a1 + 32);
        char v41 = v16;
        id v18 = v26;
        id v19 = v13;
        id v20 = v25;
        [v24 executeAgentLogicInPersona:v23 pid:v27 handlerDescription:@"Listen Request" handler:v30];

        goto LABEL_31;
      }
      if (dword_100142248 > 90 || dword_100142248 == -1 && !_LogCategory_Initialize())
      {
LABEL_31:

        goto LABEL_32;
      }
    }
    else if (dword_100142248 > 90 || dword_100142248 == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_31;
    }
    LogPrintF();
    goto LABEL_31;
  }
LABEL_32:
}

id sub_1000875F4(uint64_t a1)
{
  HIDWORD(v6) = *(_DWORD *)(a1 + 88);
  *(_WORD *)((char *)&v6 + 1) = *(_WORD *)(a1 + 92);
  LOBYTE(v6) = 0;
  [*(id *)(a1 + 32) updateAgentClientInfo:*(void *)(a1 + 40) browseResponse:*(void *)(a1 + 80) listener:0 browseDescriptor:*(void *)(a1 + 48) advertiseDescriptor:*(void *)(a1 + 56) isFlowHandler:0 isUsingQUIC:0 isTCP:v6 agentClientPID:*(void *)(a1 + 64) persona:0];
  uint64_t v2 = *(void **)(a1 + 72);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 94);

  return _[v2 createListener:v3 nearbyInvitation:v4];
}

void sub_10008766C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = v3;
  if (dword_100142248 <= 30)
  {
    if (dword_100142248 != -1 || (v4 = _LogCategory_Initialize(), id v3 = v7, v4))
    {
      id v6 = v3;
      LogPrintF();
      id v3 = v7;
    }
  }
  id v5 = [*(id *)(a1 + 32) _applicationServiceAdvertiseDescriptorForClient:v3, v6];
  if (v5) {
    +[RPNWAgentClient removeAgentClient:v7 isFlowHandler:0];
  }
}

void sub_100087930(id a1, OS_nw_agent_client *a2)
{
  int v4 = a2;
  if (dword_100142248 <= 30 && (dword_100142248 != -1 || _LogCategory_Initialize()))
  {
    id v3 = (void *)nw_agent_client_copy_endpoint();
    uint64_t v2 = v4;
    LogPrintF();
  }
  +[RPNWAgentClient removeAgentClient:isFlowHandler:](RPNWAgentClient, "removeAgentClient:isFlowHandler:", v4, 1, v2, v3);
}

void sub_100087A90(id a1, OS_nw_agent_client *a2, id a3)
{
  id v5 = a2;
  id v4 = a3;
  if (dword_100142248 <= 30 && (dword_100142248 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
}

void sub_100087B38(id a1, OS_nw_agent_client *a2)
{
  uint64_t v2 = a2;
  id v3 = v2;
  if (dword_100142248 <= 30)
  {
    id v5 = v2;
    if (dword_100142248 != -1 || (v4 = _LogCategory_Initialize(), id v3 = v5, v4))
    {
      LogPrintF();
      id v3 = v5;
    }
  }
}

uint64_t sub_100088294(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000882A4(uint64_t a1)
{
}

void sub_1000882AC(uint64_t a1, void *a2)
{
  int v4 = a2;
  id v5 = v4;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    id v7 = v4;
    BOOL is_quic = nw_protocol_options_is_quic(v4);
    id v5 = v7;
    if (is_quic)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
      id v5 = v7;
    }
  }
}

void sub_100088434(id a1)
{
  id v1 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v2 = (void *)qword_100142F00;
  qword_100142F00 = (uint64_t)v1;
}

id sub_100088A2C(uint64_t a1)
{
  if (dword_1001422B8 <= 30 && (dword_1001422B8 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v2 = [*(id *)(a1 + 32) destinationDevice];
    [v2 name];
    v6 = CFStringRef v5 = @"com.apple.oneapi.data";
    LogPrintF();
  }
  [*(id *)(a1 + 32) deregisterRequestID:@"com.apple.oneapi.data" v5, v6];
  id v3 = *(void **)(a1 + 32);

  return [v3 invalidate];
}

void sub_100088E0C(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = v2;
  if (dword_1001422B8 <= 90)
  {
    id v5 = v2;
    if (dword_1001422B8 != -1 || (v4 = _LogCategory_Initialize(), id v3 = v5, v4))
    {
      LogPrintF();
      id v3 = v5;
    }
  }
}

uint64_t sub_100088EB4()
{
  if (dword_1001422B8 <= 90)
  {
    if (dword_1001422B8 != -1) {
      return LogPrintF();
    }
    uint64_t result = _LogCategory_Initialize();
    if (result) {
      return LogPrintF();
    }
  }
  return result;
}

void sub_100089E74(uint64_t a1, void *a2)
{
  id v26 = a2;
  uint64_t v4 = *(void *)(a1 + 40) & 0x380000103C00;
  int v5 = v4 == 0;
  id v6 = [v26 model];
  if (v6)
  {
    id v7 = [v26 model];
    unsigned int v8 = [v7 containsString:@"?"];

    if (v4) {
      int v5 = v8 ^ 1;
    }
    else {
      int v5 = 1;
    }
  }

  int v9 = *(_DWORD *)(a1 + 48);
  if (v9 == -1) {
    goto LABEL_42;
  }
  int v10 = *(_DWORD *)(a1 + 48);
  if (v9)
  {
    uint64_t v11 = [v26 model];
    if ([v11 containsString:@"iPhone"])
    {
      unsigned int v12 = 1;
LABEL_39:

      goto LABEL_40;
    }
    id v25 = v11;
    int v10 = *(_DWORD *)(a1 + 48);
  }
  LOBYTE(v13) = v10;
  long long v14 = v26;
  if ((v10 & 2) == 0)
  {
LABEL_14:
    LOBYTE(v16) = v13;
    if ((v13 & 4) != 0)
    {
      long long v17 = [v14 model];
      if ([v17 containsString:@"Mac"])
      {
        unsigned int v12 = 1;
LABEL_35:

LABEL_36:
        long long v15 = v24;
        if ((v10 & 2) == 0) {
          goto LABEL_38;
        }
        goto LABEL_37;
      }
      id v23 = v17;
      int v16 = *(_DWORD *)(a1 + 48);
      long long v14 = v26;
    }
    LOBYTE(v1_Block_object_dispose(&STACK[0x578], 8) = v16;
    if ((v16 & 8) != 0)
    {
      id v2 = [v14 model];
      if ([v2 containsString:@"Watch"])
      {
        unsigned int v12 = 1;
LABEL_33:

LABEL_34:
        long long v17 = v23;
        if ((v13 & 4) == 0) {
          goto LABEL_36;
        }
        goto LABEL_35;
      }
      int v18 = *(_DWORD *)(a1 + 48);
      long long v14 = v26;
    }
    if ((v18 & 0x10) != 0)
    {
      id v19 = [v14 model];
      if ([v19 containsString:@"AppleTV"])
      {

        unsigned int v12 = 1;
        goto LABEL_32;
      }
      if ((*(unsigned char *)(a1 + 48) & 0x20) == 0)
      {
        unsigned int v12 = 0;
LABEL_31:

LABEL_32:
        if ((v16 & 8) == 0) {
          goto LABEL_34;
        }
        goto LABEL_33;
      }
      id v22 = v19;
      long long v14 = v26;
    }
    else if ((v18 & 0x20) == 0)
    {
      unsigned int v12 = 0;
      goto LABEL_32;
    }
    [v14 model];
    v21 = id v20 = v2;
    unsigned int v12 = [v21 containsString:@"AudioAccessory"];

    id v2 = v20;
    id v19 = v22;
    if ((v18 & 0x10) == 0) {
      goto LABEL_32;
    }
    goto LABEL_31;
  }
  long long v15 = [v26 model];
  if (([v15 containsString:@"iPad"] & 1) == 0)
  {
    id v24 = v15;
    int v13 = *(_DWORD *)(a1 + 48);
    long long v14 = v26;
    goto LABEL_14;
  }
  unsigned int v12 = 1;
LABEL_37:

LABEL_38:
  uint64_t v11 = v25;
  if (v9) {
    goto LABEL_39;
  }
LABEL_40:
  if (!v5 || v12) {
LABEL_42:
  }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10008A0EC(uint64_t result, uint64_t a2, char a3)
{
  if ((a3 & 2) != 0) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

uint64_t sub_10008A104(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10008A114(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (v3)
  {
    id v6 = v3;
    if (dword_100142328 <= 90 && (dword_100142328 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    goto LABEL_10;
  }
  if (dword_100142328 <= 30)
  {
    id v6 = 0;
    if (dword_100142328 != -1 || (int v5 = _LogCategory_Initialize(), v4 = 0, v5))
    {
      LogPrintF();
LABEL_10:
      uint64_t v4 = v6;
    }
  }
}

void sub_10008A4D4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (!v3)
  {
LABEL_10:
    int v5 = *(void **)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10008A688;
    v10[3] = &unk_100123FE0;
    uint64_t v7 = *(void *)(a1 + 56);
    id v8 = *(id *)(a1 + 64);
    void v10[4] = *(void *)(a1 + 40);
    id v11 = v8;
    LOBYTE(v9) = 0;
    [v5 sendWithRequestID:@"com.apple.oneapi.resolve" data:0 status:0 applicationService:v6 clientPublicKey:v7 listenerID:0 automapListener:v9 connectionID:0 responseHandler:v10];

    goto LABEL_13;
  }
  if ([v3 code] == (id)-6721)
  {
    if (dword_100142328 <= 30 && (dword_100142328 != -1 || _LogCategory_Initialize()))
    {
      int v9 = v4;
      LogPrintF();
    }
    goto LABEL_10;
  }
  if (dword_100142328 <= 90 && (dword_100142328 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  (*(void (**)(void, void))(*(void *)(a1 + 64) + 16))(*(void *)(a1 + 64), 0);
  [*(id *)(a1 + 40) invalidate];
LABEL_13:
}

id sub_10008A688(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = *(void **)(a1 + 32);

  return [v2 invalidate];
}

void sub_10008A830(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v12 = a3;
  id v9 = a4;
  id v10 = a5;
  if (dword_100142328 <= 30 && (dword_100142328 != -1 || _LogCategory_Initialize()))
  {
    +[RPNWPeer responseCodeToString:a2];
    LogPrintF();
  }
  if ((a2 - 1) > 1) {
    uint64_t v11 = 0;
  }
  else {
    uint64_t v11 = a2;
  }
  (*(void (**)(void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v11);
}

void sub_10008AB94(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (!v3 || [v3 code] == (id)-6721)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10008ADE4;
    v8[3] = &unk_100123660;
    id v9 = *(id *)(a1 + 32);
    id v5 = *(id *)(a1 + 80);
    id v10 = *(id *)(a1 + 40);
    id v11 = v5;
    [v10 setInvalidationHandler:v8];
    uint64_t v6 = [*(id *)(a1 + 40) invalidationHandler];
    [*(id *)(a1 + 40) setInterruptionHandler:v6];

    uint64_t v7 = [*(id *)(a1 + 40) invalidationHandler];
    [*(id *)(a1 + 40) setDisconnectHandler:v7];

    if (v4)
    {
      if (dword_100142328 > 30)
      {
LABEL_15:
        [*(id *)(a1 + 40) connectToOneAPIPeer:*(void *)(a1 + 32) inboundConnection:*(unsigned __int8 *)(a1 + 88) applicationService:*(void *)(a1 + 48) listenerID:*(void *)(a1 + 56) automapListener:*(unsigned __int8 *)(a1 + 89) connectionID:*(void *)(a1 + 64) connectHandler:*(void *)(a1 + 72)];

        goto LABEL_18;
      }
      if (dword_100142328 != -1 || _LogCategory_Initialize()) {
        LogPrintF();
      }
    }
    if (dword_100142328 <= 30 && (dword_100142328 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    goto LABEL_15;
  }
  if (dword_100142328 <= 90 && (dword_100142328 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  (*(void (**)(void, void))(*(void *)(a1 + 72) + 16))(*(void *)(a1 + 72), 0);
LABEL_18:
}

id sub_10008ADE4(uint64_t a1)
{
  if (dword_100142328 <= 30 && (dword_100142328 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48));
  [*(id *)(a1 + 40) setInvalidationHandler:0];
  [*(id *)(a1 + 40) setInterruptionHandler:0];
  id v2 = *(void **)(a1 + 40);

  return [v2 setDisconnectHandler:0];
}

void sub_10008B520(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = v5;
  if ((a2 - 1) <= 1 && dword_100142328 <= 30)
  {
    id v10 = v5;
    if (dword_100142328 != -1 || (v8 = _LogCategory_Initialize(), uint64_t v6 = v10, v8))
    {
      uint64_t v7 = [*(id *)(a1 + 32) peer];
      id v9 = [v7 destinationDevice];
      LogPrintF();

      uint64_t v6 = v10;
    }
  }
}

void sub_10008B5F4(id a1)
{
  if (dword_100142328 <= 90 && (dword_100142328 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

BOOL sub_10008B6DC(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (dword_100142328 <= 30 && (dword_100142328 != -1 || _LogCategory_Initialize()))
  {
    if (*(unsigned char *)(a1 + 32)) {
      int v13 = "SERVER";
    }
    else {
      int v13 = "CLIENT";
    }
    id v20 = v13;
    LogPrintF();
  }
  long long v14 = [v11 connection:v20];
  long long v15 = [v14 framer];

  if (v15)
  {
    int v16 = [v11 connection];
    long long v17 = [v16 framer];
  }
  else
  {
    long long v17 = [v11 listen_framer];
  }
  BOOL v18 = +[RPNWFramer writeDataOnFramer:v17 data:v9];

  return v18;
}

void sub_10008B838(id a1, RPNWAgentClient *a2, NSUUID *a3, int a4)
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v6 = a2;
  uint64_t v7 = a3;
  if (dword_100142328 <= 40 && (dword_100142328 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v27 = +[RPNWPeer statusCodeToString:v4];
    id v29 = v7;
    LogPrintF();
  }
  uint64_t v8 = [(RPNWAgentClient *)v6 connection];
  if (!v8) {
    goto LABEL_30;
  }
  id v9 = (void *)v8;
  id v10 = [(RPNWAgentClient *)v6 connection];
  id v11 = [v10 framer];

  if (v11)
  {
    int v12 = v4 - 1;
    uint64_t v13 = 53;
    switch(v12)
    {
      case 0:
        goto LABEL_18;
      case 2:
        long long v14 = [(RPNWAgentClient *)v6 connection];
        if (dword_100142328 <= 30 && (dword_100142328 != -1 || _LogCategory_Initialize()))
        {
          long long v15 = [v14 peer];
          [v15 destinationDevice];
          id v30 = v28 = v14;
          LogPrintF();
        }
        id v31 = [v14 peer:v28, v30];
        id v20 = [v14 peer];
        id v21 = [v20 destinationDevice];
        id v22 = [v14 inbound];
        id v23 = [v14 applicationService];
        id v24 = [v14 endpointUUID];
        id v25 = [v14 connectionUUID];
        v32[0] = _NSConcreteStackBlock;
        v32[1] = 3221225472;
        v32[2] = sub_10008BC74;
        v32[3] = &unk_100123C18;
        id v33 = v14;
        id v34 = v6;
        id v18 = v14;
        [v31 connectToOneAPIPeer:v21 inboundConnection:v22 applicationService:v23 listenerID:v24 automapListener:0 connectionID:v25 connectHandler:v32];

        goto LABEL_26;
      case 3:
        uint64_t v13 = 57;
        goto LABEL_18;
      case 4:
        id v18 = [(RPNWAgentClient *)v6 connection];
        if (dword_100142328 <= 30 && (dword_100142328 != -1 || _LogCategory_Initialize()))
        {
          id v19 = [v18 peer];
          [v19 destinationDevice];
          id v30 = v28 = v18;
          LogPrintF();
        }
        [v18 setIsConnected:1 v28, v30];
        id v26 = [v18 framer];
        +[RPNWFramer startConnection:v26];

LABEL_26:
        break;
      default:
        uint64_t v13 = 50;
LABEL_18:
        int v16 = [(RPNWAgentClient *)v6 connection];
        long long v17 = [v16 framer];
        +[RPNWFramer writeErrorOnFramer:v17 error:v13];

        break;
    }
  }
  else
  {
LABEL_30:
    if (dword_100142328 <= 90 && (dword_100142328 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
}

void sub_10008BC74(uint64_t a1, int a2, void *a3)
{
  id v10 = a3;
  if ((a2 - 1) > 1)
  {
    if (dword_100142328 <= 90 && (dword_100142328 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    uint64_t v8 = [*(id *)(a1 + 32) framer];
    +[RPNWFramer writeErrorOnFramer:v8 error:61];
    goto LABEL_18;
  }
  if (dword_100142328 <= 30 && (dword_100142328 != -1 || _LogCategory_Initialize()))
  {
    id v5 = [*(id *)(a1 + 32) peer];
    id v9 = [v5 destinationDevice];
    LogPrintF();
  }
  uint64_t v6 = [*(id *)(a1 + 32) peer:v9];
  [v6 handleConnectionData:0];

  id v7 = [*(id *)(a1 + 40) type];
  if (a2 == 2 && v7 == (id)4)
  {
    if (dword_100142328 <= 30 && (dword_100142328 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [*(id *)(a1 + 32) setIsConnected:1];
    uint64_t v8 = [*(id *)(a1 + 32) framer];
    +[RPNWFramer startConnection:v8];
LABEL_18:
  }
}

void sub_10008C5EC(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = [v7 objectForKeyedSubscript:@"request"];
  if (dword_100142328 <= 30 && (dword_100142328 != -1 || _LogCategory_Initialize()))
  {
    id v11 = +[RPNWNetworkAgent getLogInfo];
    id v46 = [v10 length];
    uint64_t v49 = *(void *)(a1 + 32);
    id v43 = v11;
    LogPrintF();
  }
  int v12 = [v7 objectForKeyedSubscript:@"status" v43, v46, v49];
  uint64_t v13 = v12;
  uint64_t v57 = a1;
  if (v12) {
    unsigned int v14 = [v12 intValue];
  }
  else {
    unsigned int v14 = 0;
  }
  long long v15 = [v7 objectForKeyedSubscript:@"version"];
  int v16 = [v7 objectForKeyedSubscript:@"applicationService"];
  long long v17 = [v7 objectForKeyedSubscript:@"clientPublicKey"];
  id v18 = [v8 objectForKeyedSubscript:@"senderID"];
  if (v18)
  {
    unsigned int v52 = v14;
    id v55 = v8;
    id v19 = [v8 objectForKeyedSubscript:@"senderIDS"];
    if (dword_100142328 <= 30 && (dword_100142328 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v47 = v18;
      int v50 = v19;
      id v44 = v16;
      LogPrintF();
    }
    v59 = v17;
    id v20 = +[RPCompanionLinkDaemon sharedCompanionLinkDaemon];
    uint64_t v21 = [v20 findServerClientFromID:v18 senderIDS:v19];

    v62 = (void *)v21;
    if (!v21 && dword_100142328 <= 30 && (dword_100142328 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    v61 = [v7 objectForKeyedSubscript:@"connectionID"];
    v60 = [v7 objectForKeyedSubscript:@"listenerID"];
    id v23 = [v7 objectForKeyedSubscript:@"automapListener"];
    unsigned __int8 v24 = [v23 BOOLValue];

    v56 = v16;
    if (dword_100142328 <= 30 && (dword_100142328 != -1 || _LogCategory_Initialize()))
    {
      v53 = [v62 name];
      id v25 = v18;
      id v26 = v19;
      uint64_t v27 = v13;
      id v28 = v9;
      id v29 = v15;
      id v30 = v10;
      id v31 = v62;
      id v32 = objc_alloc_init((Class)NSMutableString);
      [v32 appendFormat:@"%p", v31];

      id v10 = v30;
      long long v15 = v29;
      id v9 = v28;
      uint64_t v13 = v27;
      id v19 = v26;
      id v18 = v25;
      id v51 = v25;
      LogPrintF();
    }
    uint64_t v33 = *(void *)(v57 + 40);
    id v63 = 0;
    id v64 = 0;
    LOBYTE(v51) = v24;
    id v45 = &v63;
    id v48 = v60;
    v58 = v10;
    uint64_t v54 = v15;
    uint64_t v34 = (*(uint64_t (**)(uint64_t, void *, void *, void *, void))(v33 + 16))(v33, v10, v15, v62, v52);
    id v35 = v64;
    id v36 = v63;
    id v37 = 0;
    id v38 = objc_alloc_init((Class)NSMutableDictionary);
    BOOL v39 = +[NSNumber numberWithUnsignedInt:v34];
    [v38 setObject:v39 forKeyedSubscript:@"response"];
    if (v37)
    {
      if (dword_100142328 <= 30 && (dword_100142328 != -1 || _LogCategory_Initialize()))
      {
        id v45 = v39;
        id v48 = v37;
        LogPrintF();
      }
      CFStringRef v40 = @"listenerID";
      char v41 = v38;
      id v42 = v37;
    }
    else
    {
      if (!v35 || !v36)
      {
        if (dword_100142328 <= 30 && (dword_100142328 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        goto LABEL_44;
      }
      if (dword_100142328 <= 30 && (dword_100142328 != -1 || _LogCategory_Initialize()))
      {
        id v48 = [v35 length];
        id v51 = v36;
        id v45 = v39;
        LogPrintF();
      }
      [v38 setObject:v35 forKeyedSubscript:@"serverPublicKey" withObject:v45 withObject:v48 withObject:v51];
      CFStringRef v40 = @"bonjourServiceID";
      char v41 = v38;
      id v42 = v36;
    }
    [v41 setObject:v42 forKeyedSubscript:v40];
LABEL_44:
    (*((void (**)(id, id, void, void))v9 + 2))(v9, v38, 0, 0);

    long long v15 = v54;
    id v8 = v55;
    int v16 = v56;
    id v10 = v58;
    long long v17 = v59;
    goto LABEL_45;
  }
  if (dword_100142328 <= 90 && (dword_100142328 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v22 = RPErrorF();
  (*((void (**)(id, void, void, void *))v9 + 2))(v9, 0, 0, v22);

LABEL_45:
}

void sub_10008D0E0(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v21 = a2;
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    if (dword_100142328 > 90 || dword_100142328 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_13;
    }
    goto LABEL_4;
  }
  if (!v21)
  {
    if (dword_100142328 > 90 || dword_100142328 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_13;
    }
LABEL_4:
    id v9 = [*(id *)(a1 + 32) destinationDevice];
    id v10 = [v9 name];
    LogPrintF();

LABEL_13:
    (*(void (**)(void, uint64_t, void, void))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), 3, 0, 0);
    goto LABEL_16;
  }
  id v11 = [v21 objectForKeyedSubscript:@"response"];
  id v12 = [v11 intValue];

  uint64_t v13 = [v21 objectForKeyedSubscript:@"serverPublicKey"];
  unsigned int v14 = [v21 objectForKeyedSubscript:@"bonjourServiceID"];
  id v18 = [v21 objectForKeyedSubscript:@"listenerID"];
  if (dword_100142328 <= 30 && (dword_100142328 != -1 || _LogCategory_Initialize()))
  {
    id v20 = [*(id *)(a1 + 32) destinationDevice];
    id v19 = [v20 name];
    +[RPNWPeer responseCodeToString:v12];
    [v13 length];
    LogPrintF();
  }
  (*(void (**)(void, id, void *, void *, void *, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), v12, v13, v14, v18, v15, v16, v17);

LABEL_16:
}

uint64_t sub_10008D490(uint64_t a1, void *a2, void *a3, void *a4, int a5, void *a6, void *a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *a12)
{
  id v18 = a2;
  id v19 = a3;
  id v20 = a4;
  id v21 = a6;
  id v22 = a7;
  id v23 = a10;
  id v24 = a12;
  id v25 = v24;
  if (v21 && v24)
  {
    id v26 = +[RPNWAgentClient findAgentClientFromConnectionID:v24];
    if (v26)
    {
      if (v18)
      {
        if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))()) {
          uint64_t v27 = 2;
        }
        else {
          uint64_t v27 = 0;
        }
        goto LABEL_23;
      }
      if (a5)
      {
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        uint64_t v27 = 2;
LABEL_23:

        goto LABEL_24;
      }
      if (dword_100142328 > 90 || dword_100142328 == -1 && !_LogCategory_Initialize())
      {
LABEL_22:
        uint64_t v27 = 0;
        goto LABEL_23;
      }
    }
    else if (dword_100142328 > 90 || dword_100142328 == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_22;
    }
    LogPrintF();
    goto LABEL_22;
  }
  if (dword_100142328 <= 90 && (dword_100142328 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  uint64_t v27 = 0;
LABEL_24:

  return v27;
}

uint64_t sub_10008D790(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10008D8F0(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v12 = a3;
  id v9 = a4;
  id v10 = a5;
  if (dword_100142328 <= 30 && (dword_100142328 != -1 || _LogCategory_Initialize()))
  {
    +[RPNWPeer responseCodeToString:a2];
    LogPrintF();
  }
  uint64_t v11 = *(void *)(a1 + 32);
  if (v11) {
    (*(void (**)(uint64_t, uint64_t))(v11 + 16))(v11, a2);
  }
}

void sub_10008DB1C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (dword_100142398 <= 90 && (dword_100142398 != -1 || _LogCategory_Initialize())) {
LABEL_7:
    }
      LogPrintF();
  }
  else if (dword_100142398 <= 30 && (dword_100142398 != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_7;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
}

const char *sub_10008DD9C(unsigned int a1)
{
  if (a1 > 0x58) {
    return "?";
  }
  else {
    return (&off_100124198)[(char)a1];
  }
}

Class sub_10008E080()
{
  if (qword_100142F18 != -1) {
    dispatch_once(&qword_100142F18, &stru_100124178);
  }
  Class result = objc_getClass("CBAdvertiser");
  qword_100142F10 = (uint64_t)result;
  off_100142408 = (uint64_t (*)())sub_10008E0E4;
  return result;
}

id sub_10008E0E4()
{
  return (id)qword_100142F10;
}

void sub_10008E0F0(id a1)
{
  qword_100142F20 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/CoreBluetooth.framework/CoreBluetooth", 2);
}

void sub_10008E1E8(id a1)
{
  id v1 = objc_alloc_init(RPPeopleDaemon);
  id v2 = (void *)qword_100142F28;
  qword_100142F28 = (uint64_t)v1;
}

void sub_10008EA98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a68, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10008EB10(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10008EB20(uint64_t a1)
{
}

void sub_10008EB28(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  id obj = *(id *)(v1 + 40);
  id v2 = CUDescriptionWithLevel();
  NSAppendPrintF();
  objc_storeStrong((id *)(v1 + 40), obj);
}

void sub_10008EB94(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  id obj = *(id *)(v1 + 40);
  id v2 = CUDescriptionWithLevel();
  NSAppendPrintF();
  objc_storeStrong((id *)(v1 + 40), obj);
}

void sub_10008EC00(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  id obj = *(id *)(v1 + 40);
  id v2 = CUDescriptionWithLevel();
  NSAppendPrintF();
  objc_storeStrong((id *)(v1 + 40), obj);
}

id sub_10008ECE0(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _activate];
}

id sub_10008EF94(uint64_t a1)
{
  id result = (id)*(unsigned int *)(*(void *)(a1 + 32) + 8);
  if (result != -1)
  {
    uint64_t state64 = 0;
    notify_get_state((int)result, &state64);
    *(_DWORD *)(*(void *)(a1 + 32) + 12) = state64;
    if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize()))
    {
      int v3 = *(_DWORD *)(*(void *)(a1 + 32) + 12);
      if ((v3 - 1) > 2) {
        uint64_t v4 = "?";
      }
      else {
        uint64_t v4 = (&off_100124920)[v3 - 1];
      }
      id v5 = v4;
      uint64_t v6 = *(unsigned int *)(*(void *)(a1 + 32) + 12);
      LogPrintF();
    }
    [*(id *)(a1 + 32) _update:v5, v6];
    return [*(id *)(a1 + 32) _rangingResponderUpdateForAirDropChange];
  }
  return result;
}

id sub_10008F074(uint64_t a1)
{
  return [*(id *)(a1 + 32) _update];
}

id sub_10008F07C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _primaryAppleID:1];
}

id sub_10008F0A4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _update];
}

id sub_10008F0AC(uint64_t a1)
{
  return [*(id *)(a1 + 32) _update];
}

id sub_10008F128(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _invalidate];
}

void sub_10008F5A4(id a1, NSString *a2, RPIdentity *a3, BOOL *a4)
{
  uint64_t v4 = a3;
  [(RPIdentity *)v4 setDateRequested:0];
  id v5 = +[RPIdentityDaemon sharedIdentityDaemon];
  [v5 saveIdentity:v4 error:0];
}

void sub_10008FF3C(id a1, NSString *a2, RPIdentity *a3, BOOL *a4)
{
  id v7 = a3;
  uint64_t v4 = [(RPIdentity *)v7 dateRemoved];

  if (!v4)
  {
    id v5 = [(RPIdentity *)v7 dateRequested];

    if (v5)
    {
      [(RPIdentity *)v7 setDateRequested:0];
      uint64_t v6 = +[RPIdentityDaemon sharedIdentityDaemon];
      [v6 saveIdentity:v7 error:0];
    }
  }
}

void sub_10008FFD8(id a1, NSString *a2, RPIdentity *a3, BOOL *a4)
{
  id v7 = a3;
  uint64_t v4 = [(RPIdentity *)v7 dateRemoved];

  if (!v4)
  {
    id v5 = [(RPIdentity *)v7 dateRequested];

    if (v5)
    {
      [(RPIdentity *)v7 setDateRequested:0];
      uint64_t v6 = +[RPIdentityDaemon sharedIdentityDaemon];
      [v6 saveIdentity:v7 error:0];
    }
  }
}

void sub_100090450(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  (*(void (**)(void))(a4 + 16))();
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *sub_1000904A8(void *result)
{
  if (*(void *)(*(void *)(result[5] + 8) + 40))
  {
    uint64_t v1 = result;
    if (dword_100142410 <= 90)
    {
      if (dword_100142410 != -1 || (id result = (void *)_LogCategory_Initialize(), result)) {
        id result = (void *)LogPrintF();
      }
    }
    if (v1[6])
    {
      id result = *(id *)(*(void *)(v1[5] + 8) + 40);
      *(void *)v1[6] = result;
    }
  }
  return result;
}

void sub_100091784(id a1, NSString *a2, RPIdentity *a3, BOOL *a4)
{
  uint64_t v4 = a3;
  [(RPIdentity *)v4 setDateRequested:0];
  id v5 = +[RPIdentityDaemon sharedIdentityDaemon];
  [v5 saveIdentity:v4 error:0];
}

void sub_1000917F0(id a1, NSString *a2, RPIdentity *a3, BOOL *a4)
{
  uint64_t v4 = a3;
  [(RPIdentity *)v4 setDateRequested:0];
  id v5 = +[RPIdentityDaemon sharedIdentityDaemon];
  [v5 saveIdentity:v4 error:0];
}

_DWORD *sub_100092270(uint64_t a1, uint64_t a2)
{
  id result = *(_DWORD **)(a1 + 32);
  if (result[8] == *(_DWORD *)(a1 + 40)) {
    return [result _daemonDeviceFound:a2];
  }
  return result;
}

_DWORD *sub_100092294(uint64_t a1, uint64_t a2)
{
  id result = *(_DWORD **)(a1 + 32);
  if (result[8] == *(_DWORD *)(a1 + 40)) {
    return _[result _daemonDeviceLost:a2];
  }
  return result;
}

_DWORD *sub_1000922B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id result = *(_DWORD **)(a1 + 32);
  if (result[8] == *(_DWORD *)(a1 + 40)) {
    return _[result _daemonDeviceChanged:a2 changes:a3];
  }
  return result;
}

uint64_t sub_1000922E0(uint64_t result)
{
  if (*(_DWORD *)(*(void *)(result + 32) + 32) == *(_DWORD *)(result + 40) && dword_100142410 <= 60)
  {
    if (dword_100142410 != -1) {
      return LogPrintF();
    }
    id result = _LogCategory_Initialize();
    if (result) {
      return LogPrintF();
    }
  }
  return result;
}

uint64_t sub_100092378()
{
  if (dword_100142410 <= 30)
  {
    if (dword_100142410 != -1) {
      return LogPrintF();
    }
    uint64_t result = _LogCategory_Initialize();
    if (result) {
      return LogPrintF();
    }
  }
  return result;
}

id sub_1000923F8(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 480);
  if (v2)
  {
    int v3 = v2;
    dispatch_source_cancel(v3);
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 480);
    *(void *)(v4 + 480) = 0;
  }
  uint64_t v6 = *(void **)(a1 + 32);

  return [v6 _update];
}

void sub_100092458(id a1, NSError *a2)
{
  id v2 = a2;
  int v3 = v2;
  if (v2)
  {
    if (dword_100142410 <= 90)
    {
      uint64_t v6 = v2;
      if (dword_100142410 != -1 || (v4 = _LogCategory_Initialize(), int v3 = v6, v4))
      {
LABEL_7:
        LogPrintF();
        int v3 = v6;
      }
    }
  }
  else if (dword_100142410 <= 30)
  {
    uint64_t v6 = 0;
    if (dword_100142410 != -1) {
      goto LABEL_7;
    }
    int v5 = _LogCategory_Initialize();
    int v3 = 0;
    if (v5) {
      goto LABEL_7;
    }
  }
}

void sub_100093050(uint64_t a1)
{
  [*(id *)(a1 + 32) _update];
  id v1 = +[RPDaemon sharedDaemon];
  [v1 postDaemonInfoChanges:1024];
}

id sub_1000930A4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _update];
}

id sub_1000930AC(uint64_t a1)
{
  return [*(id *)(a1 + 32) _update];
}

id sub_1000930B4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _update];
}

void sub_1000930BC(uint64_t a1)
{
  [*(id *)(a1 + 32) _update];
  id v1 = +[RPDaemon sharedDaemon];
  [v1 postDaemonInfoChanges:1024];
}

void sub_1000938F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
}

void sub_100093938(id a1, NSString *a2, RPIdentity *a3, BOOL *a4)
{
}

void sub_100093944(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  if (([v8 present] & 1) == 0)
  {
    int v4 = [v8 dateRemoved];

    if (!v4)
    {
      int v5 = +[NSDate date];
      [v8 setDateRemoved:v5];

      if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize()))
      {
        id v7 = v8;
        LogPrintF();
      }
      uint64_t v6 = +[RPIdentityDaemon sharedIdentityDaemon];
      [v6 saveIdentity:v8 error:0];

      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    }
  }
}

void sub_10009437C(void *a1, void *a2, void *a3)
{
  id v9 = a2;
  int v5 = [a3 accountID];
  unsigned int v6 = [v5 isEqualToString:a1[4]];

  if (v6)
  {
    if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v8 = a1[5];
      LogPrintF();
    }
    id v7 = +[RPIdentityDaemon sharedIdentityDaemon];
    [v7 removeIdentity:a1[5] error:0];

    [*(id *)(a1[6] + 120) setObject:0 forKeyedSubscript:v9];
  }
}

void sub_100094764(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v35 - 208), 8);
  _Block_object_dispose((const void *)(v35 - 176), 8);
  _Block_object_dispose((const void *)(v35 - 144), 8);
  _Block_object_dispose((const void *)(v35 - 112), 8);
  _Block_object_dispose((const void *)(v35 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1000947CC(uint64_t a1, void *a2, void *a3)
{
  id v17 = a2;
  id v5 = a3;
  unsigned int v6 = [v5 dateRemoved];

  if (!v6)
  {
    id v7 = [v5 dateRequested];
    if (!v7) {
      goto LABEL_32;
    }
    uint64_t v8 = [v5 dateAcknowledged];
    [v7 timeIntervalSinceNow];
    double v10 = -v9;
    uint32_t v11 = arc4random() % 0x3F481 + 1468800;
    if (v8)
    {
      if (v10 >= (double)v11)
      {
        if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        uint64_t v12 = *(void *)(a1 + 56);
LABEL_30:
        ++*(_DWORD *)(*(void *)(v12 + 8) + 24);
LABEL_31:

LABEL_32:
        uint64_t v8 = objc_alloc_init(RPCloudMessageContext);
        uint64_t v13 = [*(id *)(a1 + 40) _primaryAppleID:0];
        [(RPCloudMessageContext *)v8 setSendersKnownAlias:v13];

        *(_DWORD *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 30;
        if ([*(id *)(a1 + 40) _sendCloudIdentityFrameType:32 destinationID:v17 flags:0 msgCtx:v8])
        {
          unsigned int v14 = +[NSDate date];
          [v5 setDateRequested:v14];

          uint64_t v15 = +[RPIdentityDaemon sharedIdentityDaemon];
          [v15 saveIdentity:v5 error:0];

          uint64_t v16 = *(void *)(a1 + 96);
        }
        else
        {
          uint64_t v16 = *(void *)(a1 + 88);
        }
LABEL_37:
        ++*(_DWORD *)(*(void *)(v16 + 8) + 24);

        goto LABEL_38;
      }
    }
    else if (v10 >= (double)v11)
    {
      if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      uint64_t v12 = *(void *)(a1 + 64);
      goto LABEL_30;
    }
    if (!*(unsigned char *)(a1 + 104))
    {
      if (dword_100142410 <= 10 && (dword_100142410 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      uint64_t v16 = *(void *)(a1 + 72);
      goto LABEL_37;
    }
    if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    goto LABEL_31;
  }
  if (dword_100142410 <= 10 && (dword_100142410 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
LABEL_38:
}

void sub_100095610(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_10009562C(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  unsigned int v6 = [a3 model];
  if (v6)
  {
    id v8 = v6;
    BOOL v7 = GestaltProductTypeStringToDeviceClass() == 7;
    unsigned int v6 = v8;
    if (v7)
    {
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) |= 4uLL;
      *a4 = 1;
    }
  }
}

id sub_100095800(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateFriendPrivacy];
}

void *sub_100095808(void *result)
{
  if (*(_DWORD *)(result[4] + 368) != -1)
  {
    uint64_t v1 = result;
    if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v2 = *(void **)(v1[4] + 360);
    return [v2 trigger];
  }
  return result;
}

void *sub_100095F0C(void *result)
{
  if (*(_DWORD *)(result[4] + 204) != -1)
  {
    uint64_t v1 = result;
    if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    *(unsigned char *)(v1[4] + 201) = 1;
    id v2 = (void *)v1[4];
    return [v2 _friendsUpdateSuggestedIfNeeded];
  }
  return result;
}

void *sub_100095FB8(void *result)
{
  if (result[4] == *(void *)(result[5] + 208))
  {
    uint64_t v1 = result;
    if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(id)v1[5] prefsChanged];
    *(unsigned char *)(v1[5] + 201) = 1;
    id v2 = (void *)v1[5];
    return [v2 _friendsUpdateSuggestedIfNeeded];
  }
  return result;
}

void sub_10009606C(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v6 = a3;
  *(unsigned char *)(*(void *)(a1 + 32) + 200) = 0;
  [*(id *)(a1 + 40) invalidate];
  if (v6)
  {
    if (dword_100142410 <= 90 && (dword_100142410 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  else
  {
    if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize()))
    {
      [v7 count];
      LogPrintF();
    }
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 192), a2);
    *(unsigned char *)(*(void *)(a1 + 32) + 276) = 1;
    [*(id *)(a1 + 32) _updateFriendIdentities];
  }
}

void sub_1000974D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,char a62)
{
}

void sub_100097544(uint64_t a1, uint64_t a2, void *a3)
{
  id v9 = a3;
  unsigned __int8 v4 = [v9 userAdded];
  id v5 = v9;
  if ((v4 & 1) == 0)
  {
    id v6 = [v9 dateAdded];
    double v7 = *(double *)(a1 + 32);
    [v6 timeIntervalSinceReferenceDate];
    if (vabdd_f64(v7, v8) >= 86400.0) {
      [v9 setPresent:0];
    }

    id v5 = v9;
  }
}

void sub_1000975D8(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  if (([v8 present] & 1) == 0)
  {
    unsigned __int8 v4 = [v8 dateRemoved];

    if (!v4)
    {
      id v5 = +[NSDate date];
      [v8 setDateRemoved:v5];

      if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize()))
      {
        id v7 = v8;
        LogPrintF();
      }
      id v6 = +[RPIdentityDaemon sharedIdentityDaemon];
      [v6 saveIdentity:v8 error:0];

      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    }
  }
}

void sub_10009827C(uint64_t a1, uint64_t a2, void *a3)
{
  unsigned __int8 v4 = [a3 contactID];
  if (v4)
  {
    id v5 = v4;
    [*(id *)(a1 + 32) addObject:v4];
    unsigned __int8 v4 = v5;
  }
}

void sub_1000982DC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  *(unsigned char *)(*(void *)(a1 + 32) + 176) = 0;
  [*(id *)(a1 + 40) invalidate];
  id v9 = v5;
  if (!v9 || v6)
  {
    if (dword_100142410 <= 90 && (dword_100142410 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  else if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize()))
  {
    id v8 = [v9 count];
    LogPrintF();
    [*(id *)(a1 + 32) _updateFriendPrivacyResults:v9, v8];
  }
  else
  {
    [*(id *)(a1 + 32) _updateFriendPrivacyResults:v9, v7];
  }
}

void sub_10009887C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

void sub_1000988AC(void *a1, void *a2, void *a3, unsigned char *a4)
{
  id v11 = a2;
  id v8 = a3;
  id v9 = [v8 contactID];
  unsigned int v10 = [v9 isEqual:a1[4]];

  if (v10)
  {
    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a3);
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a2);
    *a4 = 1;
  }
}

void sub_100099094(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53)
{
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose(&a41, 8);
  _Block_object_dispose(&a45, 8);
  _Block_object_dispose(&a49, 8);
  _Block_object_dispose(&a53, 8);
  _Block_object_dispose((const void *)(v53 - 240), 8);
  _Block_object_dispose((const void *)(v53 - 208), 8);
  _Block_object_dispose((const void *)(v53 - 176), 8);
  _Block_object_dispose((const void *)(v53 - 144), 8);
  _Block_object_dispose((const void *)(v53 - 112), 8);
  _Block_object_dispose((const void *)(v53 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_10009912C(uint64_t a1, void *a2, void *a3)
{
  id v24 = a2;
  id v5 = a3;
  id v6 = [v5 dateRemoved];

  if (v6)
  {
    if (dword_100142410 <= 10 && (dword_100142410 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    uint64_t v7 = *(void *)(a1 + 40);
LABEL_17:
    ++*(_DWORD *)(*(void *)(v7 + 8) + 24);
    goto LABEL_18;
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    if (dword_100142410 <= 10 && (dword_100142410 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    uint64_t v7 = *(void *)(a1 + 56);
    goto LABEL_17;
  }
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 384))
  {
    if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize()))
    {
      unint64_t v22 = (unint64_t)v5;
      LogPrintF();
    }
    [v5 setDateRequested:0, v22];
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  }
  id v8 = [v5 dateRequested];
  id v9 = v8;
  if (!v8) {
    goto LABEL_49;
  }
  [v8 timeIntervalSinceNow];
  double v11 = -v10;
  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 312);
  uint64_t v13 = [v5 dateAcknowledged];
  unsigned int v14 = (RPCloudMessageContext *)v13;
  if (v12 <= 0)
  {
    if (dword_100142410 > 10 || dword_100142410 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_43;
    }
LABEL_36:
    LogPrintF();
LABEL_43:
    uint64_t v15 = *(void *)(a1 + 72);
    goto LABEL_58;
  }
  if (!v13)
  {
    if (v11 >= (double)(arc4random() % 0x3F481 + 1468800))
    {
      if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize()))
      {
        unint64_t v22 = (unint64_t)v11;
        id v23 = v5;
        LogPrintF();
      }
      uint64_t v16 = *(void *)(a1 + 88);
      goto LABEL_48;
    }
LABEL_34:
    if (dword_100142410 > 10 || dword_100142410 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_43;
    }
    goto LABEL_36;
  }
  if (*(void *)(*(void *)(a1 + 32) + 312) > (uint64_t)v11) {
    goto LABEL_34;
  }
  if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize()))
  {
    unint64_t v22 = (unint64_t)v11;
    id v23 = v5;
    LogPrintF();
  }
  uint64_t v16 = *(void *)(a1 + 80);
LABEL_48:
  ++*(_DWORD *)(*(void *)(v16 + 8) + 24);

LABEL_49:
  id v17 = [v5 sendersKnownAlias:v22, v23];

  if (!v17)
  {
    [v5 setDateRequested:0];
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 120) + 8) + 24);
    goto LABEL_53;
  }
  unsigned int v14 = objc_alloc_init(RPCloudMessageContext);
  id v18 = [v5 sendersKnownAlias];
  [(RPCloudMessageContext *)v14 setSendersKnownAlias:v18];

  [(RPCloudMessageContext *)v14 setNonWakingRequest:1];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = 30;
  if ([*(id *)(a1 + 32) _sendCloudIdentityFrameType:64 destinationID:v24 flags:1 msgCtx:v14])
  {
    id v19 = +[NSDate date];
    [v5 setDateRequested:v19];

    ++*(_DWORD *)(*(void *)(a1 + 32) + 232);
    *(unsigned char *)(*(void *)(a1 + 32) + 385) = 1;
    id v20 = +[RPIdentityDaemon sharedIdentityDaemon];
    [v20 saveIdentity:v5 error:0];

    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 112) + 8) + 24);
LABEL_53:
    if (*(unsigned char *)(a1 + 128))
    {
      uint64_t v21 = *(void *)(*(void *)(a1 + 48) + 8);
      if (!*(unsigned char *)(v21 + 24) && *(int *)(*(void *)(*(void *)(a1 + 112) + 8) + 24) >= 64) {
        *(unsigned char *)(v21 + 24) = 1;
      }
    }
    goto LABEL_59;
  }
  uint64_t v15 = *(void *)(a1 + 104);
LABEL_58:
  ++*(_DWORD *)(*(void *)(v15 + 8) + 24);

LABEL_59:
LABEL_18:
}

void sub_100099E28(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  [*(id *)(a1 + 32) invalidate];
  if (v5)
  {
    ++*(_DWORD *)(*(void *)(a1 + 40) + 244);
    ++*(_DWORD *)(*(void *)(a1 + 40) + 256);
    *(unsigned char *)(*(void *)(a1 + 40) + 385) = 1;
    if (dword_100142410 <= 60 && (dword_100142410 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  else
  {
    if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v10 = *(void *)(a1 + 48);
      uint64_t v11 = *(void *)(a1 + 56);
      LogPrintF();
    }
    ++*(_DWORD *)(*(void *)(a1 + 40) + 260);
    *(unsigned char *)(*(void *)(a1 + 40) + 385) = 1;
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v6 = *(void *)(a1 + 56);
    id v8 = *(void **)(a1 + 40);
    id v9 = [v12 contactIdentifier:v10, v11];
    [v8 _updateIdentityType:6 idsDeviceID:v6 appleID:v7 contactID:v9 msg:*(void *)(a1 + 64)];

    [*(id *)(a1 + 72) setNonWakingRequest:1];
    [*(id *)(a1 + 40) _sendCloudIdentityFrameType:65 destinationID:*(void *)(a1 + 80) flags:1 msgCtx:*(void *)(a1 + 72)];
  }
}

void sub_10009A324(uint64_t a1, void *a2, void *a3)
{
  id v16 = a2;
  id v5 = a3;
  [*(id *)(a1 + 32) invalidate];
  if (v5)
  {
    if (dword_100142410 <= 60 && (dword_100142410 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  else
  {
    if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v13 = *(void *)(a1 + 40);
      uint64_t v15 = *(void *)(a1 + 48);
      LogPrintF();
    }
    uint64_t v6 = [*(id *)(a1 + 56) objectForKeyedSubscript:*(void *)(a1 + 40), v13, v15];
    if (v6)
    {
      uint64_t v7 = +[NSDate date];
      [v6 setDateAcknowledged:v7];

      id v8 = +[RPIdentityDaemon sharedIdentityDaemon];
      [v8 saveIdentity:v6 error:0];
    }
    else if (dword_100142410 <= 60 && (dword_100142410 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v14 = *(void *)(a1 + 40);
      LogPrintF();
    }
    id v9 = *(void **)(a1 + 64);
    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 48);
    id v12 = [v16 contactIdentifier:v14];
    [v9 _updateIdentityType:6 idsDeviceID:v10 appleID:v11 contactID:v12 msg:*(void *)(a1 + 72)];
  }
}

void sub_10009A870(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  [*(id *)(a1 + 32) invalidate];
  if (v5)
  {
    if (dword_100142410 <= 60 && (dword_100142410 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  else
  {
    if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v10 = *(void *)(a1 + 40);
      uint64_t v11 = *(void *)(a1 + 48);
      LogPrintF();
    }
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v6 = *(void **)(a1 + 56);
    uint64_t v8 = *(void *)(a1 + 40);
    id v9 = [v12 contactIdentifier:v10, v11];
    [v6 _updateIdentityType:6 idsDeviceID:v7 appleID:v8 contactID:v9 msg:*(void *)(a1 + 64)];
  }
}

void *sub_10009AC18(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t result = *(void **)(a1 + 40);
  if (v3 == result[53]) {
    return _[result _rangingBLEActionScannerDeviceFound:a2];
  }
  return result;
}

void *sub_10009AC34(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t result = *(void **)(a1 + 40);
  if (v3 == result[53]) {
    return _[result _rangingBLEActionScannerDeviceLost:a2];
  }
  return result;
}

void *sub_10009AC50(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t result = *(void **)(a1 + 40);
  if (v3 == result[53]) {
    return _[result _rangingBLEActionScannerDeviceFound:a2];
  }
  return result;
}

void sub_10009AC6C(uint64_t a1, void *a2)
{
  id v3 = a2;
  unsigned __int8 v4 = v3;
  if (*(void *)(a1 + 32) == *(void *)(*(void *)(a1 + 40) + 424))
  {
    if (v3)
    {
      id v9 = v3;
      if (dword_100142410 <= 90 && (dword_100142410 != -1 || _LogCategory_Initialize()))
      {
        id v8 = v9;
        LogPrintF();
      }
      [*(id *)(*(void *)(a1 + 40) + 424) invalidate:v8];
      uint64_t v5 = *(void *)(a1 + 40);
      uint64_t v6 = *(void **)(v5 + 424);
      *(void *)(v5 + 424) = 0;

      goto LABEL_11;
    }
    if (dword_100142410 <= 30)
    {
      id v9 = 0;
      if (dword_100142410 != -1 || (v7 = _LogCategory_Initialize(), unsigned __int8 v4 = 0, v7))
      {
        LogPrintF();
LABEL_11:
        unsigned __int8 v4 = v9;
      }
    }
  }
}

void *sub_10009B318(void *result)
{
  if (result[4] == *(void *)(result[5] + 400))
  {
    uint64_t v1 = result;
    if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v2 = *(void **)(v1[5] + 400);
    if (v2)
    {
      id v3 = v2;
      dispatch_source_cancel(v3);
      uint64_t v4 = v1[5];
      uint64_t v5 = *(void **)(v4 + 400);
      *(void *)(v4 + 400) = 0;
    }
    uint64_t result = [*(id *)(v1[5] + 424) scanRate];
    if (result != (void *)20)
    {
      uint64_t v6 = *(void **)(v1[5] + 424);
      return [v6 setScanRate:20];
    }
  }
  return result;
}

void *sub_10009B660(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t result = *(void **)(a1 + 40);
  if (v4 == result[55]) {
    return _[result _rangingInitiatorHandlePeer:a2 measurement:a3];
  }
  return result;
}

id sub_10009B680(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _rangingInitiatorStatusChanged];
}

void sub_10009B688(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3 && *(void *)(a1 + 32) == *(void *)(*(void *)(a1 + 40) + 392))
  {
    id v7 = v3;
    if (dword_100142410 <= 90 && (dword_100142410 != -1 || _LogCategory_Initialize()))
    {
      id v6 = v7;
      LogPrintF();
    }
    [*(id *)(*(void *)(a1 + 40) + 392) invalidate:v6];
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void **)(v4 + 392);
    *(void *)(v4 + 392) = 0;

    id v3 = v7;
  }
}

void sub_10009B92C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10009B944(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v8 = a3;
  id v7 = [v8 bleDeviceAddress];
  if ([v7 isEqual:*(void *)(a1 + 32)])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    *a4 = 1;
  }
}

void sub_10009BCE0(uint64_t a1, uint64_t a2, void *a3)
{
  id v9 = a3;
  uint64_t v4 = [v9 bleDevice];
  uint64_t v5 = [v4 advertisementFields];
  CFDataGetTypeID();
  id v6 = CFDictionaryGetTypedValue();

  if (v6)
  {
    id v7 = objc_alloc_init((Class)CURangingPeer);
    [v7 setDeviceAddress:v6];
    id v8 = [v9 model];
    [v7 setDeviceModel:v8];

    [*(id *)(a1 + 32) addObject:v7];
  }
}

id sub_10009DB74(uint64_t a1)
{
  return [*(id *)(a1 + 32) _xpcConnectionInvalidated:*(void *)(a1 + 40)];
}

id sub_10009F2D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) clientDeviceFound:a3 report:0];
}

Class sub_10009F564()
{
  if (qword_100142F40 != -1) {
    dispatch_once(&qword_100142F40, &stru_100124868);
  }
  Class result = objc_getClass("MSDKDemoState");
  qword_100142F38 = (uint64_t)result;
  off_100142480 = (uint64_t (*)())sub_10009F5C8;
  return result;
}

id sub_10009F5C8()
{
  return (id)qword_100142F38;
}

void sub_10009F5D4(id a1)
{
  qword_100142F48 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/MobileStoreDemoKit.framework/MobileStoreDemoKit", 2);
}

Class sub_10009F600()
{
  if (qword_100142F58 != -1) {
    dispatch_once(&qword_100142F58, &stru_100124888);
  }
  Class result = objc_getClass("SFDeviceDiscovery");
  qword_100142F50 = (uint64_t)result;
  off_100142488 = (uint64_t (*)())sub_10009F664;
  return result;
}

id sub_10009F664()
{
  return (id)qword_100142F50;
}

void sub_10009F670(id a1)
{
  qword_100142F60 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/Sharing.framework/Sharing", 2);
}

Class sub_10009F69C()
{
  if (qword_100142F58 != -1) {
    dispatch_once(&qword_100142F58, &stru_100124888);
  }
  Class result = objc_getClass("SFClient");
  qword_100142F68 = (uint64_t)result;
  off_100142490 = (uint64_t (*)())sub_10009F700;
  return result;
}

id sub_10009F700()
{
  return (id)qword_100142F68;
}

Class sub_10009F70C()
{
  if (qword_100142F58 != -1) {
    dispatch_once(&qword_100142F58, &stru_100124888);
  }
  Class result = objc_getClass("SFPeopleSuggesterParams");
  qword_100142F70 = (uint64_t)result;
  off_100142498 = (uint64_t (*)())sub_10009F770;
  return result;
}

id sub_10009F770()
{
  return (id)qword_100142F70;
}

Class sub_10009F77C()
{
  if (qword_100142F58 != -1) {
    dispatch_once(&qword_100142F58, &stru_100124888);
  }
  Class result = objc_getClass("SFContactInfo");
  qword_100142F78 = (uint64_t)result;
  off_1001424A0 = (uint64_t (*)())sub_10009F7E0;
  return result;
}

id sub_10009F7E0()
{
  return (id)qword_100142F78;
}

Class sub_10009F7EC()
{
  if (qword_100142F58 != -1) {
    dispatch_once(&qword_100142F58, &stru_100124888);
  }
  Class result = objc_getClass("SFService");
  qword_100142F80 = (uint64_t)result;
  off_1001424A8 = (uint64_t (*)())sub_10009F850;
  return result;
}

id sub_10009F850()
{
  return (id)qword_100142F80;
}

void sub_10009F8B0(id a1)
{
  uint64_t v1 = objc_alloc_init(RPPrivateDaemon);
  id v2 = (void *)qword_100142F88;
  qword_100142F88 = (uint64_t)v1;
}

id sub_10009FC74(uint64_t a1)
{
  if (dword_100142570 <= 30 && (dword_100142570 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v2 = *(void **)(a1 + 32);
  if (!v2[3])
  {
    id v3 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.rapport.private-discovery"];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 24);
    *(void *)(v4 + 24) = v3;

    [*(id *)(*(void *)(a1 + 32) + 24) setDelegate:];
    [*(id *)(*(void *)(a1 + 32) + 24) _setQueue:*(void *)(*(void *)(a1 + 32) + 32)];
    [*(id *)(*(void *)(a1 + 32) + 24) resume];
    id v2 = *(void **)(a1 + 32);
  }

  return [v2 prefsChanged];
}

id sub_10009FDC4(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _invalidate];
}

void sub_1000A0878(void *a1)
{
  id v6 = objc_alloc_init(RPPrivateXPCConnection);
  [(RPPrivateXPCConnection *)v6 setDaemon:a1[4]];
  [(RPPrivateXPCConnection *)v6 setDirect:1];
  [(RPPrivateXPCConnection *)v6 setDispatchQueue:*(void *)(a1[4] + 32)];
  [(RPPrivateXPCConnection *)v6 setEntitled:1];
  id v2 = *(void **)(a1[4] + 16);
  if (!v2)
  {
    id v3 = objc_alloc_init((Class)NSMutableSet);
    uint64_t v4 = a1[4];
    uint64_t v5 = *(void **)(v4 + 16);
    *(void *)(v4 + 16) = v3;

    id v2 = *(void **)(a1[4] + 16);
  }
  [v2 addObject:v6];
  [(RPPrivateXPCConnection *)v6 xpcPrivateAdvertiserActivate:a1[5] completion:a1[6]];
}

void sub_1000A09FC(uint64_t a1)
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 16);
  id v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v4; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        id v8 = [v7 activatedAdvertiser:v11];
        id v9 = *(void **)(a1 + 40);

        if (v8 == v9)
        {
          id v10 = v7;

          if (v10) {
            [*(id *)(a1 + 32) _xpcConnectionInvalidated:v10];
          }
          goto LABEL_12;
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }

  id v10 = 0;
LABEL_12:
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_1000A0C1C(void *a1)
{
  id v6 = objc_alloc_init(RPPrivateXPCConnection);
  [(RPPrivateXPCConnection *)v6 setDaemon:a1[4]];
  [(RPPrivateXPCConnection *)v6 setDirect:1];
  [(RPPrivateXPCConnection *)v6 setDispatchQueue:*(void *)(a1[4] + 32)];
  [(RPPrivateXPCConnection *)v6 setEntitled:1];
  id v2 = *(void **)(a1[4] + 16);
  if (!v2)
  {
    id v3 = objc_alloc_init((Class)NSMutableSet);
    uint64_t v4 = a1[4];
    uint64_t v5 = *(void **)(v4 + 16);
    *(void *)(v4 + 16) = v3;

    id v2 = *(void **)(a1[4] + 16);
  }
  [v2 addObject:v6];
  [(RPPrivateXPCConnection *)v6 xpcPrivateDiscoveryActivate:a1[5] completion:a1[6]];
}

void sub_1000A0DA0(uint64_t a1)
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 16);
  id v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v4; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        id v8 = [v7 activatedDiscovery:v11];
        id v9 = *(void **)(a1 + 40);

        if (v8 == v9)
        {
          id v10 = v7;

          if (v10) {
            [*(id *)(a1 + 32) _xpcConnectionInvalidated:v10];
          }
          goto LABEL_12;
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }

  id v10 = 0;
LABEL_12:
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

id sub_1000A10C8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _xpcConnectionInvalidated:*(void *)(a1 + 40)];
}

void sub_1000A2A94(_Unwind_Exception *a1)
{
}

uint64_t sub_1000A2B54(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000A2B64(uint64_t a1)
{
}

void sub_1000A2B6C(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  id obj = *(id *)(v1 + 40);
  id v2 = CUDescriptionWithLevel();
  NSAppendPrintF();
  objc_storeStrong((id *)(v1 + 40), obj);
}

void sub_1000A2BD8(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  id obj = *(id *)(v2 + 40);
  id v3 = a2;
  id v4 = CUDescriptionWithLevel();
  NSAppendPrintF();

  objc_storeStrong((id *)(v2 + 40), obj);
}

void sub_1000A2C60(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  id obj = *(id *)(v6 + 40);
  id v7 = a2;
  id v9 = CUDescriptionWithLevel();
  NSAppendPrintF();

  objc_storeStrong((id *)(v6 + 40), obj);
  if ((int)++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) >= 11)
  {
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
    id v10 = *(id *)(v8 + 40);
    NSAppendPrintF();
    objc_storeStrong((id *)(v8 + 40), v10);
    *a4 = 1;
  }
}

void sub_1000A2D54(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = [v5 event];
  uint64_t v8 = [v7 objectForKeyedSubscript:@"type"];
  id v9 = [v7 objectForKeyedSubscript:@"serviceType"];
  uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
  id obj = *(id *)(v10 + 40);
  [v5 state];

  NSAppendPrintF();
  objc_storeStrong((id *)(v10 + 40), obj);
}

void sub_1000A2E3C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = [v5 event];
  uint64_t v8 = [v7 objectForKeyedSubscript:@"type"];
  id v9 = [v7 objectForKeyedSubscript:@"serviceType"];
  uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
  id obj = *(id *)(v10 + 40);
  [v5 state];

  NSAppendPrintF();
  objc_storeStrong((id *)(v10 + 40), obj);
}

id sub_1000A2F98(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _activate];
}

id sub_1000A31F0(uint64_t a1)
{
  return [*(id *)(a1 + 32) _update];
}

id sub_1000A31F8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _update];
}

id sub_1000A3200(uint64_t a1)
{
  return [*(id *)(a1 + 32) _update];
}

id sub_1000A327C(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _invalidate];
}

void sub_1000A4BD0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = *(unsigned __int8 *)(a1 + 40);
  if (v7 != [v6 state])
  {
    uint64_t v8 = *(void **)(a1 + 32);
    id v19 = 0;
    id v9 = [v8 _acquireRBSAssertionForEntry:v6 error:&v19];
    id v10 = v19;
    if (!v10)
    {
      [v6 setState:*(unsigned __int8 *)(a1 + 40)];
      id v11 = [v5 unsignedLongLongValue];
      if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
      {
        id v14 = v11;
        uint64_t v15 = *(unsigned __int8 *)(a1 + 40);
        LogPrintF();
      }
      [v6 handler:v14, v15];
      long long v12 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        if (*(unsigned char *)(a1 + 40)) {
          uint64_t v13 = 6;
        }
        else {
          uint64_t v13 = 5;
        }
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472;
        v16[2] = sub_1000A4D80;
        void v16[3] = &unk_100124A00;
        id v18 = v11;
        id v17 = v9;
        ((void (**)(void, uint64_t, void, void *))v12)[2](v12, v13, 0, v16);
      }
    }
  }
}

void sub_1000A4D80(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v6 = *(void **)(a1 + 32);
  if (v6) {
    [v6 invalidate];
  }
}

void sub_1000A5184(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  uint64_t v5 = [*(id *)(a1 + 32) showPasswordHandler];
  id v6 = (void *)v5;
  if (v5) {
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, a2, v7);
  }
}

void sub_1000A51FC(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) hidePasswordHandler];
  if (v3)
  {
    id v4 = v3;
    v3[2](v3, a2);
    id v3 = (void (**)(void, void))v4;
  }
}

void sub_1000A525C(uint64_t a1, uint64_t a2)
{
  if (!a2)
  {
    id v3 = [*(id *)(a1 + 40) peerDeviceInfo];
    uint64_t v4 = [v3 verifiedIdentity];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 320);
    *(void *)(v5 + 320) = v4;

    if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
}

_DWORD *sub_1000A5A6C(uint64_t a1, uint64_t a2)
{
  Class result = *(_DWORD **)(a1 + 32);
  if (result[14] == *(_DWORD *)(a1 + 40)) {
    return _[result _clientBLEDiscoveryDeviceFound:a2];
  }
  return result;
}

_DWORD *sub_1000A5A90(uint64_t a1, uint64_t a2)
{
  Class result = *(_DWORD **)(a1 + 32);
  if (result[14] == *(_DWORD *)(a1 + 40)) {
    return _[result _clientBLEDiscoveryDeviceLost:a2];
  }
  return result;
}

_DWORD *sub_1000A5AB4(uint64_t a1, uint64_t a2)
{
  Class result = *(_DWORD **)(a1 + 32);
  if (result[14] == *(_DWORD *)(a1 + 40)) {
    return _[result _clientBLEDiscoveryDeviceFound:a2];
  }
  return result;
}

uint64_t sub_1000A5AD8(uint64_t result)
{
  if (*(_DWORD *)(*(void *)(result + 32) + 56) == *(_DWORD *)(result + 40) && dword_1001426A0 <= 30)
  {
    if (dword_1001426A0 != -1) {
      return LogPrintF();
    }
    Class result = _LogCategory_Initialize();
    if (result) {
      return LogPrintF();
    }
  }
  return result;
}

void sub_1000A5B70(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (v3)
  {
    id v9 = v3;
    if (dword_1001426A0 <= 90 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
    {
      id v8 = v9;
      LogPrintF();
    }
    [*(id *)(*(void *)(a1 + 32) + 48) invalidate:v8];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 48);
    *(void *)(v5 + 4_Block_object_dispose(&STACK[0x380], 8) = 0;

    goto LABEL_10;
  }
  if (dword_1001426A0 <= 30)
  {
    id v9 = 0;
    if (dword_1001426A0 != -1 || (v7 = _LogCategory_Initialize(), uint64_t v4 = 0, v7))
    {
      LogPrintF();
LABEL_10:
      uint64_t v4 = v9;
    }
  }
}

void sub_1000A5DA0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (v3)
  {
    if (dword_1001426A0 <= 90)
    {
      id v7 = v3;
      if (dword_1001426A0 != -1 || (int v6 = _LogCategory_Initialize(), v4 = v7, v6))
      {
        unsigned int v5 = *(_DWORD *)(a1 + 32);
        if (v5 < 0x20000)
        {
          switch(v5)
          {
            case 0x10000u:
            case 0x10001u:
            case 0x10002u:
            case 0x10003u:
            case 0x10004u:
            case 0x10005u:
            case 0x10006u:
            case 0x10007u:
            case 0x10008u:
            case 0x10009u:
            case 0x1000Au:
            case 0x1000Bu:
            case 0x1000Cu:
            case 0x1000Du:
            case 0x1000Eu:
            case 0x1000Fu:
            case 0x10010u:
            case 0x10011u:
            case 0x10012u:
            case 0x10013u:
            case 0x10014u:
            case 0x10015u:
            case 0x10016u:
            case 0x10017u:
            case 0x10018u:
            case 0x10019u:
              break;
            default:
              JUMPOUT(0);
          }
        }
        LogPrintF();
        uint64_t v4 = v7;
      }
    }
  }
}

id sub_1000A71C0()
{
  if (qword_100142FC0 != -1) {
    dispatch_once(&qword_100142FC0, &stru_100124EA8);
  }
  int v0 = (void *)qword_100142FB8;

  return v0;
}

void sub_1000A794C(uint64_t a1, void *a2)
{
  id v8 = a2;
  if (v8)
  {
    if (dword_1001426A0 <= 90 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
    {
      id v7 = v8;
      LogPrintF();
    }
    [*(id *)(*(void *)(a1 + 32) + 96) invalidate:v7];
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 96);
    *(void *)(v3 + 96) = 0;
    goto LABEL_13;
  }
  if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  unsigned int v5 = *(void **)(*(void *)(a1 + 32) + 104);
  if (v5)
  {
    id v6 = v5;
    uint64_t v4 = +[RPMetrics sharedMetrics];
    [v4 logNeedsAWDLAdvertisementClient:v6 actionType:50 bluetoothType:15];

LABEL_13:
  }
}

void sub_1000A7F4C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v3)
  {
    id v11 = v3;
    [*(id *)(v4 + 64) invalidate];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 64);
    *(void *)(v5 + 64) = 0;
  }
  else
  {
    id v7 = *(void **)(v4 + 72);
    if (!v7) {
      goto LABEL_6;
    }
    id v11 = 0;
    id v8 = *(void **)(v4 + 80);
    id v9 = v7;
    id v10 = [v8 nearbyActionV2Type];
    id v6 = +[RPMetrics sharedMetrics];
    [v6 logNeedsAWDLAdvertisementClient:v9 actionType:v10 bluetoothType:21];
  }
  id v3 = v11;
LABEL_6:
}

void *sub_1000A8AA0(uint64_t a1, uint64_t a2)
{
  Class result = *(void **)(a1 + 32);
  if (result[21]) {
    return [result _clientBonjourFoundDevice:a2 reevaluate:0];
  }
  return result;
}

void sub_1000A8ABC(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2[21])
  {
    id v4 = a2;
    [v2 _clientBonjourLostDevice:v4];
    [*(id *)(a1 + 32) _clientBonjourLostUnresolvedDevice:v4];
  }
}

void *sub_1000A8B34(uint64_t a1, uint64_t a2)
{
  Class result = *(void **)(a1 + 32);
  if (result[21]) {
    return [result _clientBonjourFoundDevice:a2 reevaluate:0];
  }
  return result;
}

id sub_1000A97E4(uint64_t a1)
{
  dispatch_source_cancel(*(dispatch_source_t *)(*(void *)(a1 + 32) + 520));
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 520);
  *(void *)(v2 + 520) = 0;

  id result = [*(id *)(*(void *)(a1 + 32) + 512) count];
  if (result)
  {
    uint64_t v5 = *(void **)(a1 + 32);
    return _[v5 _processPendingLostDevices];
  }
  return result;
}

void *sub_1000AA354(uint64_t a1, uint64_t a2)
{
  id result = *(void **)(a1 + 32);
  if (result[22]) {
    return _[result _clientBonjourAWDLBrowserFoundDevice:a2];
  }
  return result;
}

void *sub_1000AA36C(uint64_t a1, uint64_t a2)
{
  id result = *(void **)(a1 + 32);
  if (result[22]) {
    return _[result _clientBonjourAWDLBrowserLostDevice:a2];
  }
  return result;
}

void *sub_1000AA384(uint64_t a1, uint64_t a2)
{
  id result = *(void **)(a1 + 32);
  if (result[22]) {
    return _[result _clientBonjourAWDLBrowserFoundDevice:a2];
  }
  return result;
}

void sub_1000AB898(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      LogPrintF();
      [*(id *)(a1 + 40) invalidate:v7, v3];
    }
    else
    {
      [*(id *)(a1 + 40) invalidate:v6 withCompletionHandler:v8];
    }
  }
  else
  {
    id v4 = *(void **)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000ABA18;
    v9[3] = &unk_100122F88;
    v9[4] = *(void *)(a1 + 32);
    void v9[5] = v4;
    char v10 = *(unsigned char *)(a1 + 64);
    v9[6] = *(void *)(a1 + 56);
    [v4 sendEventID:@"_rdNeedsAWDL" event:v5 options:0 completion:v9];
    if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
}

void sub_1000ABA18(uint64_t a1, void *a2)
{
  id v9 = a2;
  if (v9)
  {
    if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      id v8 = v9;
      LogPrintF();
    }
  }
  else if (*(unsigned char *)(a1 + 56))
  {
    id v3 = *(void **)(*(void *)(a1 + 48) + 392);
    if (!v3)
    {
      uint64_t v4 = +[NSMutableSet set];
      uint64_t v5 = *(void *)(a1 + 48);
      uint64_t v6 = *(void **)(v5 + 392);
      *(void *)(v5 + 392) = v4;

      id v3 = *(void **)(*(void *)(a1 + 48) + 392);
    }
    [v3 addObject:*(void *)(a1 + 32)];
  }
  [*(id *)(a1 + 40) invalidate:v7, v8];
}

_DWORD *sub_1000AC174(uint64_t a1, uint64_t a2)
{
  id result = *(_DWORD **)(a1 + 32);
  if (result[30] == *(_DWORD *)(a1 + 40)) {
    return _[result _serverBLENeedsAWDLScannerDeviceFound:a2];
  }
  return result;
}

_DWORD *sub_1000AC198(uint64_t a1, uint64_t a2)
{
  id result = *(_DWORD **)(a1 + 32);
  if (result[30] == *(_DWORD *)(a1 + 40)) {
    return _[result _serverBLENeedsAWDLScannerDeviceLost:a2];
  }
  return result;
}

_DWORD *sub_1000AC1BC(uint64_t a1, uint64_t a2)
{
  id result = *(_DWORD **)(a1 + 32);
  if (result[30] == *(_DWORD *)(a1 + 40)) {
    return _[result _serverBLENeedsAWDLScannerDeviceFound:a2];
  }
  return result;
}

void sub_1000AC1E0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (v3)
  {
    id v9 = v3;
    if (dword_1001426A0 <= 90 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
    {
      id v8 = v9;
      LogPrintF();
    }
    [*(id *)(*(void *)(a1 + 32) + 112) invalidate:v8];
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void **)(v5 + 112);
    *(void *)(v5 + 112) = 0;

    goto LABEL_10;
  }
  if (dword_1001426A0 <= 30)
  {
    id v9 = 0;
    if (dword_1001426A0 != -1 || (v7 = _LogCategory_Initialize(), uint64_t v4 = 0, v7))
    {
      LogPrintF();
LABEL_10:
      uint64_t v4 = v9;
    }
  }
}

void sub_1000AC9E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 88);
  if (v5)
  {
    id v9 = [v5 dispatchQueue];

    if (v9)
    {
      char v10 = *(void **)(*(void *)(a1 + 32) + 88);
      _[v10 updateUseCase:a2 bleScanRate:a3 bleScanRateScreenOff:a4];
    }
  }
}

id sub_1000ACA78(uint64_t a1)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 592));
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 _update];
}

void sub_1000ACAB8(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (v3)
  {
    id v6 = v3;
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 592));
    [*(id *)(a1 + 32) _serverBLENearbyActionV2DiscoveryEnsureStopped];
LABEL_3:
    uint64_t v4 = v6;
    goto LABEL_8;
  }
  if (dword_1001426A0 <= 30)
  {
    id v6 = 0;
    if (dword_1001426A0 != -1 || (int v5 = _LogCategory_Initialize(), v4 = 0, v5))
    {
      LogPrintF();
      goto LABEL_3;
    }
  }
LABEL_8:
}

void sub_1000AD8C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_1000AD8E0(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id result = [a3 linkType];
  if (result == 4)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

void sub_1000ADB84(id a1, CUTCPConnection *a2)
{
}

void *sub_1000ADB90(uint64_t a1, uint64_t a2)
{
  id result = *(void **)(a1 + 32);
  if (result[56]) {
    return [result _serverTCPHandleConnectionStarted:a2];
  }
  return result;
}

void sub_1000ADBA8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = *(id *)(*(void *)(a1 + 32) + 224);
  id v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (!v8)
  {
    char v10 = v7;
LABEL_17:

    goto LABEL_18;
  }
  id v9 = v8;
  char v10 = 0;
  uint64_t v11 = *(void *)v19;
  do
  {
    for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
    {
      if (*(void *)v19 != v11) {
        objc_enumerationMutation(v7);
      }
      uint64_t v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
      id v14 = [v13 tcpConnection];

      if (v14 == v5)
      {
        id v15 = v13;

        char v10 = v15;
      }
    }
    id v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  }
  while (v9);

  if (v10)
  {
    if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
      [*(id *)(*(void *)(a1 + 32) + 224) removeObject:v10 v5, v6, (void)v18];
    }
    else
    {
      [*(id *)(*(void *)(a1 + 32) + 224) removeObject:v10, v16, v17, (void)v18];
    }
    goto LABEL_17;
  }
LABEL_18:
}

void sub_1000ADEE4(id a1, NSNumber *a2, RPConnection *a3, BOOL *a4)
{
}

void sub_1000AE218(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 440) setObject:0 forKeyedSubscript:*(void *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 48) client];
  [v2 sessionEndedWithID:*(void *)(a1 + 40) netCnx:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) _update];
}

void sub_1000AE284(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v13 = a2;
  id v7 = a3;
  id v8 = a4;
  id v9 = [*(id *)(a1 + 32) client];
  char v10 = v9;
  if (v9)
  {
    [v9 _receivedEventID:v13 event:v7 options:v8 sessionID:*(void *)(a1 + 40)];
  }
  else
  {
    uint64_t v11 = objc_alloc_init(RPReceivedMessageEntry);
    [(RPReceivedMessageEntry *)v11 setEventID:v13];
    [(RPReceivedMessageEntry *)v11 setEvent:v7];
    [(RPReceivedMessageEntry *)v11 setOptions:v8];
    [(RPReceivedMessageEntry *)v11 setSessionID:*(void *)(a1 + 40)];
    long long v12 = [*(id *)(a1 + 32) receivedMessages];
    [v12 addObject:v11];
  }
}

void sub_1000AE388(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v16 = a2;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  long long v12 = [*(id *)(a1 + 32) client];
  id v13 = v12;
  if (v12)
  {
    [v12 _receivedRequestID:v16 request:v9 options:v10 responseHandler:v11 sessionID:*(void *)(a1 + 40)];
  }
  else
  {
    id v14 = objc_alloc_init(RPReceivedMessageEntry);
    [(RPReceivedMessageEntry *)v14 setRequestID:v16];
    [(RPReceivedMessageEntry *)v14 setRequest:v9];
    [(RPReceivedMessageEntry *)v14 setOptions:v10];
    [(RPReceivedMessageEntry *)v14 setResponseHandler:v11];
    id v15 = [*(id *)(a1 + 32) receivedMessages];
    [v15 addObject:v14];
  }
}

id sub_1000AE4A0(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) _serverHandleSessionStartWithID:*(void *)(a1 + 40) netCnx:*(void *)(a1 + 48) completion:a2];
  id v3 = *(void **)(a1 + 32);

  return [v3 _update];
}

void sub_1000AE4E4(uint64_t a1, int a2)
{
  unsigned int v4 = [*(id *)(a1 + 32) passwordType];
  if (a2 == 1 && v4 == 10 && *(void *)(*(void *)(a1 + 40) + 320))
  {
    if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v5 = [*(id *)(a1 + 40) _findMatchingDeviceWithIdentifier:*(void *)(*(void *)(a1 + 40) + 320)];
    if (v5)
    {
      id v9 = v5;
      id v6 = [v5 cameraCapabilities];

      id v5 = v9;
      if (v6)
      {
        [*(id *)(a1 + 40) _changeDiscoverySessionStateForDevice:*(void *)(*(void *)(a1 + 40) + 320) startReason:1];
        uint64_t v7 = *(void *)(a1 + 40);
        id v8 = *(void **)(v7 + 320);
        *(void *)(v7 + 320) = 0;

        id v5 = v9;
      }
    }
  }
}

void sub_1000AEDD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
}

uint64_t (**sub_1000AEE38(void *a1))(id, void)
{
  id result = (uint64_t (**)(id, void))a1[6];
  if (result) {
    id result = (uint64_t (**)(id, void))result[2](result, a1[4]);
  }
  if (a1[4])
  {
    id v3 = (void *)a1[5];
    return (uint64_t (**)(id, void))[v3 invalidate];
  }
  return result;
}

void sub_1000AEE98(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
  {
    [*(id *)(a1 + 32) token];
    LogPrintF();
  }
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 40) + 592));
  id v6 = *(void **)(a1 + 48);
  if (v6) {
    [v6 invalidate];
  }
}

void sub_1000AEF60(uint64_t a1, void *a2)
{
  id v3 = a2;
  unsigned int v4 = *(void **)(a1 + 32);
  id v6 = v3;
  if (v4)
  {
    [v4 invalidate];
    id v3 = v6;
  }
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5)
  {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
    id v3 = v6;
  }
}

void sub_1000AF0E4(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  unsigned int v4 = [v7 idsIdentifier];

  if (v4)
  {
    uint64_t v5 = *(void **)(a1 + 32);
    id v6 = [v7 idsIdentifier];
    [v5 addObject:v6];
  }
}

void sub_1000AF160(uint64_t a1, uint64_t a2, void *a3)
{
  unsigned int v4 = [a3 peerDeviceInfo];
  id v6 = [v4 identifier];

  uint64_t v5 = v6;
  if (v6)
  {
    [*(id *)(a1 + 32) addObject:v6];
    uint64_t v5 = v6;
  }
}

void sub_1000AF3E4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
    {
      id v8 = v3;
      LogPrintF();
    }
    [*(id *)(a1 + 32) invalidate:v8];
    uint64_t v6 = *(void *)(a1 + 40);
    id v7 = *(void **)(v6 + 416);
    *(void *)(v6 + 416) = 0;
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void **)(v4 + 416);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000AF4F0;
    v9[3] = &unk_100122C00;
    v9[4] = v4;
    [v5 registerEventID:@"_rdNeedsAWDL" options:0 handler:v9];
  }
}

void sub_1000AF4F0(uint64_t a1, void *a2)
{
  id v3 = *(NSObject **)(*(void *)(a1 + 32) + 592);
  id v4 = a2;
  dispatch_assert_queue_V2(v3);
  [*(id *)(a1 + 32) _serverReceivedNeedsAWDLEvent:v4];
}

void sub_1000AF7D0(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 400);
  if (v2)
  {
    id v3 = v2;
    dispatch_source_cancel(v3);
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 400);
    *(void *)(v4 + 400) = 0;
  }
  if (*(void *)(*(void *)(a1 + 32) + 384))
  {
    if (dword_1001426A0 <= 90 && (dword_1001426A0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void **)(v6 + 384);
    *(void *)(v6 + 384) = 0;

    id v8 = *(void **)(a1 + 32);
    [v8 _update];
  }
}

id sub_1000AF9EC(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _btAddressChanged];
}

id sub_1000AF9F4(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _btAddressChanged];
}

void sub_1000B09FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  (*(void (**)(uint64_t))(v13 + 16))(v13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000B0A40(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    if (dword_1001426A0 <= 90 && (dword_1001426A0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    uint64_t v2 = *(void *)(a1 + 40);
    if (*(unsigned char *)(v2 + 152))
    {
      *(unsigned char *)(v2 + 152) = 0;
      [*(id *)(a1 + 40) _update];
      uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
      uint64_t v4 = *(void **)(v3 + 40);
      *(void *)(v3 + 40) = 0;
    }
  }
  uint64_t v5 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v5();
}

id sub_1000B0F5C(uint64_t a1)
{
  [*(id *)(a1 + 32) clearCameraCapabilitiesRefetchTimer];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);

  return [v2 _requestCameraCapabilitiesForDevice:v3];
}

void sub_1000B16AC(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  if (v4 == *(void **)(*(void *)(a1 + 40) + 248))
  {
    if (v3)
    {
      if (dword_1001426A0 <= 90 && (dword_1001426A0 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      uint64_t v6 = *(void *)(a1 + 40);
      id v7 = *(void **)(v6 + 248);
      *(void *)(v6 + 24_Block_object_dispose(&STACK[0x380], 8) = 0;

      [*(id *)(a1 + 32) invalidate];
    }
    else
    {
      uint64_t v5 = [v4 dispatchQueue];
      dispatch_assert_queue_V2(v5);

      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_1000B18EC;
      v12[3] = &unk_100124C38;
      long long v13 = *(_OWORD *)(a1 + 32);
      [(id)v13 registerEventID:@"_camCapUpdate" options:0 handler:v12];
      if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1000B1A28;
      v10[3] = &unk_100124C60;
      long long v11 = *(_OWORD *)(a1 + 32);
      [(id)v11 registerRequestID:@"_ccConfirmResp" options:0 handler:v10];
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_1000B1B9C;
      v8[3] = &unk_100124C38;
      long long v9 = *(_OWORD *)(a1 + 32);
      [(id)v9 registerEventID:@"_ccExit" options:0 handler:v8];
    }
  }
}

void sub_1000B18EC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 40);
  if (*(void *)(a1 + 32) == *(void *)(v6 + 248))
  {
    id v14 = v5;
    id v7 = *(NSObject **)(v6 + 592);
    id v8 = a3;
    dispatch_assert_queue_V2(v7);
    long long v9 = [v8 objectForKeyedSubscript:@"senderIDS"];

    id v10 = [*(id *)(a1 + 40) _findMatchingDeviceWithIdentifier:v9];
    long long v11 = v10;
    if (v10)
    {
      long long v12 = *(void **)(a1 + 40);
      long long v13 = [v10 cameraCapabilities];
      [v12 _receivedCameraCapabilitiesMessage:v14 fromDevice:v11 isFirstUpdate:v13 == 0];
    }
    else if (dword_1001426A0 <= 90 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    id v5 = v14;
  }
}

void sub_1000B1A28(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  uint64_t v8 = *(void *)(a1 + 40);
  if (*(void *)(a1 + 32) == *(void *)(v8 + 248))
  {
    id v15 = v7;
    long long v9 = *(NSObject **)(v8 + 592);
    id v10 = a4;
    id v11 = a3;
    dispatch_assert_queue_V2(v9);
    (*((void (**)(id, void, void, void))v10 + 2))(v10, 0, 0, 0);

    long long v12 = [v11 objectForKeyedSubscript:@"senderIDS"];

    if (v12)
    {
      long long v13 = [*(id *)(*(void *)(a1 + 40) + 528) objectForKeyedSubscript:v12];
      id v14 = v13;
      if (v13)
      {
        [v13 invalidate];
        [*(id *)(*(void *)(a1 + 40) + 528) setObject:0 forKeyedSubscript:v12];
      }

      [*(id *)(a1 + 40) _handleConfirmationResult:v15 fromDevice:v12];
    }
    else if (dword_1001426A0 <= 90 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    id v7 = v15;
  }
}

void sub_1000B1B9C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 40);
  if (*(void *)(a1 + 32) == *(void *)(v6 + 248))
  {
    id v10 = v5;
    id v7 = *(NSObject **)(v6 + 592);
    id v8 = a3;
    dispatch_assert_queue_V2(v7);
    long long v9 = [v8 objectForKeyedSubscript:@"senderIDS"];

    if (v9)
    {
      [*(id *)(a1 + 40) _receivedCameraExitEvent:v10 from:v9];
    }
    else if (dword_1001426A0 <= 90 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    id v5 = v10;
  }
}

void sub_1000B203C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    id v5 = +[NSDictionary dictionary];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000B2398;
    v15[3] = &unk_100124C88;
    long long v9 = *(void **)(a1 + 32);
    id v8 = *(void **)(a1 + 40);
    void v15[4] = *(void *)(a1 + 48);
    v15[5] = v9;
    id v10 = v8;
    uint64_t v11 = *(void *)(a1 + 56);
    id v16 = v10;
    uint64_t v17 = v11;
    [v9 sendRequestID:@"_camCap" request:v5 options:0 responseHandler:v15];

    goto LABEL_32;
  }
  [*(id *)(a1 + 32) invalidate];
  [*(id *)(a1 + 40) setCameraCapabilityRequestIsActive:0];
  uint64_t v4 = +[RPIdentityDaemon sharedIdentityDaemon];
  id v5 = [v4 identitiesOfType:13 error:0];

  if ([v3 code] == (id)-6727)
  {
    uint64_t v6 = [*(id *)(a1 + 48) _findMatchingDeviceWithIdentifier:*(void *)(a1 + 56)];

    int v7 = dword_1001426A0;
    if (v6)
    {
      if (dword_1001426A0 > 30)
      {
        int v13 = 1;
        uint64_t v14 = 5;
        goto LABEL_26;
      }
      if (dword_1001426A0 != -1 || _LogCategory_Initialize()) {
        LogPrintF();
      }
      int v13 = 1;
      uint64_t v14 = 5;
      goto LABEL_25;
    }
    if (dword_1001426A0 <= 30)
    {
      if (dword_1001426A0 != -1 || _LogCategory_Initialize())
      {
        long long v12 = [*(id *)(a1 + 48) _findMatchingDeviceWithIdentifier:*(void *)(a1 + 56)];
        LogPrintF();
      }
LABEL_24:
      uint64_t v14 = 0;
      int v13 = 0;
      goto LABEL_25;
    }
    goto LABEL_18;
  }
  if (((unint64_t)[*(id *)(a1 + 40) statusFlags] & 0x2000000000) != 0
    && ![v5 count])
  {
    int v7 = dword_1001426A0;
    if (dword_1001426A0 <= 30)
    {
      if (dword_1001426A0 != -1 || _LogCategory_Initialize())
      {
        [*(id *)(a1 + 40) statusFlags];
        LogPrintF();
      }
      goto LABEL_24;
    }
LABEL_18:
    uint64_t v14 = 0;
    int v13 = 0;
    goto LABEL_26;
  }
  uint64_t v14 = 0;
  int v13 = 1;
LABEL_25:
  int v7 = dword_1001426A0;
LABEL_26:
  if (v7 <= 90 && (v7 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (v13) {
    [*(id *)(a1 + 48) _scheduleCameraCapabilitiesRequest:*(void *)(a1 + 40) interval:v14];
  }
LABEL_32:
}

void sub_1000B2398(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v12 = a2;
  id v6 = a4;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 592));
  [*(id *)(a1 + 40) invalidate];
  [*(id *)(a1 + 48) setCameraCapabilityRequestIsActive:0];
  if (v6)
  {
    if (dword_1001426A0 <= 90 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
    {
      id v11 = v6;
      LogPrintF();
    }
    [*(id *)(a1 + 32) _scheduleCameraCapabilitiesRequest:*(void *)(a1 + 48) interval:0];
  }
  else
  {
    int v7 = [*(id *)(a1 + 32) _findMatchingDeviceWithIdentifier:*(void *)(a1 + 56)];
    id v8 = v7;
    if (v7)
    {
      long long v9 = *(void **)(a1 + 32);
      id v10 = [v7 cameraCapabilities];
      [v9 _receivedCameraCapabilitiesMessage:v12 fromDevice:v8 isFirstUpdate:v10 == 0];
    }
    else if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

void sub_1000B2808(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v5 = v3;
    [*(id *)(a1 + 32) invalidate];
    [*(id *)(*(void *)(a1 + 40) + 256) setObject:0 forKeyedSubscript:*(void *)(a1 + 48)];
    id v3 = v5;
    if (dword_1001426A0 <= 90)
    {
      if (dword_1001426A0 != -1 || (v4 = _LogCategory_Initialize(), id v3 = v5, v4))
      {
        LogPrintF();
        id v3 = v5;
      }
    }
  }
}

void sub_1000B28CC(uint64_t a1, void *a2)
{
  id v7 = a2;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 592));
  --*(void *)(*(void *)(a1 + 32) + 264);
  id v3 = *(void **)(a1 + 32);
  if (!v3[33]) {
    [v3 _clearCameraCapabilitiesUpdateCache];
  }
  int v4 = v7;
  if (v7)
  {
    id v5 = [*(id *)(*(void *)(a1 + 32) + 256) objectForKeyedSubscript:*(void *)(a1 + 40)];
    if (v5)
    {
      [*(id *)(*(void *)(a1 + 32) + 256) setObject:0 forKeyedSubscript:*(void *)(a1 + 40)];
      [v5 invalidate];
    }
    if (dword_1001426A0 <= 90 && (dword_1001426A0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }

    goto LABEL_14;
  }
  if (dword_1001426A0 <= 30)
  {
    if (dword_1001426A0 != -1 || (int v6 = _LogCategory_Initialize(), v4 = 0, v6))
    {
      LogPrintF();
LABEL_14:
      int v4 = v7;
    }
  }
}

void sub_1000B2BB0(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(a1 + 32) + 240))
  {
    if (dword_1001426A0 <= 40 && (dword_1001426A0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v2 = *(id *)(*(void *)(a1 + 32) + 232);
    [*(id *)(a1 + 32) _updateCameraCapabilities];
    id v3 = *(void **)(*(void *)(a1 + 32) + 232);
    id v4 = v2;
    id v5 = v3;
    if (v4 != v5)
    {
      int v6 = v5;
      if ((v4 == 0) != (v5 != 0))
      {
        unsigned __int8 v7 = [v4 isEqual:v5];

        if (v7) {
          goto LABEL_24;
        }
      }
      else
      {
      }
      if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      id v8 = +[RPCloudDaemon sharedCloudDaemon];
      long long v9 = [v8 idsDeviceArray];

      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      id v10 = v9;
      id v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v16;
        do
        {
          for (uint64_t i = 0; i != v12; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v16 != v13) {
              objc_enumerationMutation(v10);
            }
            [*(id *)(a1 + 32) _sendCameraCapabilitiesUpdateEventForDevice:*(void *)(*((void *)&v15 + 1) + 8 * i) :v15];
          }
          id v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
        }
        while (v12);
      }

      goto LABEL_24;
    }

LABEL_24:
    [*(id *)(a1 + 32) _postNotificationForWombatActivity:3, v15];
  }
}

void sub_1000B30F4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  if (v4 == *(void **)(*(void *)(a1 + 40) + 280))
  {
    if (v3)
    {
      if (dword_1001426A0 <= 90 && (dword_1001426A0 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      uint64_t v6 = *(void *)(a1 + 40);
      unsigned __int8 v7 = *(void **)(v6 + 280);
      *(void *)(v6 + 280) = 0;

      [*(id *)(a1 + 32) invalidate];
    }
    else
    {
      id v5 = [v4 dispatchQueue];
      dispatch_assert_queue_V2(v5);

      if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1000B32E0;
      v10[3] = &unk_100124C60;
      long long v11 = *(_OWORD *)(a1 + 32);
      [(id)v11 registerRequestID:@"_camCap" options:0 handler:v10];
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_1000B3434;
      v8[3] = &unk_100124C38;
      long long v9 = *(_OWORD *)(a1 + 32);
      [(id)v9 registerEventID:@"_ccExit" options:0 handler:v8];
    }
  }
}

void sub_1000B32E0(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (*(void *)(a1 + 32) == *(void *)(*(void *)(a1 + 40) + 280))
  {
    id v5 = a4;
    if (CFDictionaryGetInt64()
      && (GestaltGetDeviceClass() == 1 || GestaltGetDeviceClass() == 3))
    {
      [*(id *)(a1 + 40) _postNotificationForWombatActivity:3];
    }
    if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
    {
      id v6 = [*(id *)(*(void *)(a1 + 40) + 232) count];
      LogPrintF();
    }
    id v7 = +[NSDictionary dictionaryWithObject:*(void *)(*(void *)(a1 + 40) + 232), @"_cCap", v6 forKey];
    (*((void (**)(id, id, void, void))v5 + 2))(v5, v7, 0, 0);
  }
}

void sub_1000B3434(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if (*(void *)(a1 + 32) == *(void *)(*(void *)(a1 + 40) + 280))
  {
    id v7 = v5;
    id v6 = [a3 objectForKeyedSubscript:@"senderIDS"];
    if (v6)
    {
      [*(id *)(a1 + 40) _receivedCameraExitEvent:v7 from:v6];
    }
    else if (dword_1001426A0 <= 90 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    id v5 = v7;
  }
}

id sub_1000B37DC(uint64_t a1)
{
  id result = (id)*(unsigned int *)(*(void *)(a1 + 32) + 464);
  if (result != -1)
  {
    uint64_t state64 = 0;
    id result = (id)notify_get_state((int)result, &state64);
    uint64_t v3 = *(void *)(a1 + 32);
    if (*(_DWORD *)(v3 + 468) != state64)
    {
      *(_DWORD *)(v3 + 46_Block_object_dispose(&STACK[0x380], 8) = state64;
      if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
      {
        uint64_t v4 = *(int *)(*(void *)(a1 + 32) + 468);
        if (v4 > 3) {
          id v5 = "?";
        }
        else {
          id v5 = (&off_100124F58)[v4];
        }
        id v8 = v5;
        uint64_t v9 = *(int *)(*(void *)(a1 + 32) + 468);
        LogPrintF();
      }
      id v6 = *(unsigned int **)(a1 + 32);
      uint64_t v7 = v6[117];
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1000B390C;
      v10[3] = &unk_100124A98;
      void v10[4] = v6;
      return [v6 _bluetoothUseCaseFromWombatState:v7 resultBlock:v10, v8, v9];
    }
  }
  return result;
}

void sub_1000B390C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v5 = *(void **)(*(void *)(a1 + 32) + 88);
  if (v5)
  {
    uint64_t v9 = [v5 dispatchQueue];

    if (v9)
    {
      id v10 = *(void **)(*(void *)(a1 + 32) + 88);
      _[v10 updateUseCase:a2 bleScanRate:a3 bleScanRateScreenOff:a4];
    }
  }
}

void sub_1000B39A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v5 = *(void **)(*(void *)(a1 + 32) + 88);
  if (v5)
  {
    uint64_t v9 = [v5 dispatchQueue];

    if (v9)
    {
      id v10 = *(void **)(*(void *)(a1 + 32) + 88);
      _[v10 updateUseCase:a2 bleScanRate:a3 bleScanRateScreenOff:a4];
    }
  }
}

id sub_1000B3C88(uint64_t a1)
{
  if (dword_1001426A0 <= 20 && (dword_1001426A0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v2 = *(unsigned int **)(a1 + 32);
  uint64_t v3 = v2[117];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000B3D58;
  v5[3] = &unk_100124A98;
  void v5[4] = v2;
  return [v2 _bluetoothUseCaseFromWombatState:v3 resultBlock:v5];
}

void sub_1000B3D58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v5 = *(void **)(*(void *)(a1 + 32) + 88);
  if (v5)
  {
    uint64_t v9 = [v5 dispatchQueue];

    if (v9)
    {
      id v10 = *(void **)(*(void *)(a1 + 32) + 88);
      _[v10 updateUseCase:a2 bleScanRate:a3 bleScanRateScreenOff:a4];
    }
  }
}

void sub_1000B3ECC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v5 = *(void **)(*(void *)(a1 + 32) + 88);
  if (v5)
  {
    uint64_t v9 = [v5 dispatchQueue];

    if (v9)
    {
      id v10 = *(void **)(*(void *)(a1 + 32) + 88);
      _[v10 updateUseCase:a2 bleScanRate:a3 bleScanRateScreenOff:a4];
    }
  }
}

id sub_1000B44E8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _xpcConnectionInvalidated:*(void *)(a1 + 40)];
}

void sub_1000B4868(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *sub_1000B4888(void *result, void *a2, uint64_t a3, unsigned char *a4)
{
  if (result[4] == a3)
  {
    id v5 = result;
    id result = [a2 unsignedIntValue];
    *(_DWORD *)(*(void *)(v5[5] + 8) + 24) = result;
    *a4 = 1;
  }
  return result;
}

uint64_t sub_1000B4B50(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [v4 accountAltDSID];
  if (v5
    && (id v6 = (void *)v5,
        [*(id *)(a1 + 32) accountAltDSID],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7))
  {
    id v8 = [v4 accountAltDSID];
    uint64_t v9 = [*(id *)(a1 + 32) accountAltDSID];
  }
  else
  {
    id v8 = [v4 accountID];
    uint64_t v9 = [*(id *)(a1 + 32) accountID];
  }
  id v10 = (void *)v9;
  id v11 = v8;
  id v12 = v10;
  if (v11 == v12)
  {
  }
  else
  {
    uint64_t v13 = v12;
    if ((v11 == 0) == (v12 != 0))
    {

LABEL_12:
      uint64_t v15 = 0;
      goto LABEL_13;
    }
    unsigned __int8 v14 = [v11 isEqual:v12];

    if ((v14 & 1) == 0) {
      goto LABEL_12;
    }
  }
  uint64_t v15 = 1;
LABEL_13:

  return v15;
}

id sub_1000B4D48(uint64_t a1)
{
  return [*(id *)(a1 + 32) isEqualToDevice:];
}

void sub_1000B4E5C(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 328);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000B4EFC;
  v4[3] = &unk_100124DA0;
  id v3 = *(id *)(a1 + 40);
  void v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  char v6 = *(unsigned char *)(a1 + 48);
  [v2 enumerateKeysAndObjectsUsingBlock:v4];
}

void sub_1000B4EFC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))())
  {
    uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 600);
    if (!v7
      || ([v6 identifier],
          id v8 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v9 = [v7 isEqualToString:v8],
          v8,
          (v9 & 1) == 0))
    {
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_1000B5170;
      v28[3] = &unk_100124D78;
      char v31 = *(unsigned char *)(a1 + 48);
      id v10 = v5;
      uint64_t v11 = *(void *)(a1 + 32);
      id v29 = v10;
      uint64_t v30 = v11;
      id v12 = objc_retainBlock(v28);
      uint64_t v13 = *(void **)(*(void *)(a1 + 32) + 528);
      if (!v13)
      {
        id v14 = objc_alloc_init((Class)NSMutableDictionary);
        uint64_t v15 = *(void *)(a1 + 32);
        long long v16 = *(void **)(v15 + 528);
        *(void *)(v15 + 52_Block_object_dispose(&STACK[0x380], 8) = v14;

        uint64_t v13 = *(void **)(*(void *)(a1 + 32) + 528);
      }
      uint64_t v17 = [v13 objectForKeyedSubscript:v10];
      if (v17)
      {
        id v18 = (id)v17;
        ((void (*)(void *, uint64_t))v12[2])(v12, v17);
      }
      else
      {
        id v19 = objc_alloc_init((Class)RPCompanionLinkClient);
        id v20 = objc_alloc_init((Class)RPCompanionLinkDevice);
        [v20 setIdentifier:v10];
        [v19 setDispatchQueue:*(void *)(*(void *)(a1 + 32) + 592)];
        [v19 setDestinationDevice:v20];
        [v19 setControlFlags:6];
        [v19 setServiceType:@"com.apple.devicediscoveryui.rapportwake"];
        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472;
        v23[2] = sub_1000B5460;
        v23[3] = &unk_1001223A8;
        id v18 = v19;
        uint64_t v21 = *(void *)(a1 + 32);
        id v24 = v18;
        uint64_t v25 = v21;
        id v22 = v10;
        id v26 = v22;
        uint64_t v27 = v12;
        [v18 activateWithCompletion:v23];
        [*(id *)(*(void *)(a1 + 32) + 528) setObject:v18 forKeyedSubscript:v22];
      }
    }
  }
}

void sub_1000B5170(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(unsigned __int8 *)(a1 + 48);
  if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
  {
    id v5 = "confirm-dedicated";
    if (!v4) {
      id v5 = "confirm";
    }
    uint64_t v11 = v5;
    uint64_t v12 = *(void *)(a1 + 32);
    LogPrintF();
  }
  id v6 = [[*(id *)(*(void *)(a1 + 40) + 536) UUIDString:v11, v12];
  if (v4) {
    uint64_t v7 = 3;
  }
  else {
    uint64_t v7 = 1;
  }
  id v8 = +[NSNumber numberWithUnsignedInteger:v7];
  unsigned __int8 v9 = +[NSDictionary dictionaryWithObjectsAndKeys:v6, @"sesID", v8, @"actionType", 0];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000B5324;
  void v13[3] = &unk_100124D50;
  id v14 = *(id *)(a1 + 32);
  id v15 = v3;
  uint64_t v16 = *(void *)(a1 + 40);
  id v10 = v3;
  [v10 sendRequestID:@"_ccConfirmStart" request:v9 options:0 responseHandler:v13];
}

void sub_1000B5324(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v11 = a2;
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    if (dword_1001426A0 > 90) {
      goto LABEL_10;
    }
    if (dword_1001426A0 != -1 || _LogCategory_Initialize())
    {
      id v9 = *(id *)(a1 + 32);
      id v10 = v8;
      LogPrintF();
    }
  }
  if (dword_1001426A0 <= 40 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
  {
    id v9 = v11;
    id v10 = *(id *)(a1 + 32);
    LogPrintF();
  }
LABEL_10:
  [*(id *)(a1 + 40) invalidate:v9, v10];
  [*(id *)(*(void *)(a1 + 48) + 528) setObject:0 forKeyedSubscript:*(void *)(a1 + 32)];
}

void sub_1000B5460(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    [*(id *)(a1 + 32) invalidate];
    [*(id *)(*(void *)(a1 + 40) + 528) setObject:0 forKeyedSubscript:*(void *)(a1 + 48)];
    if (dword_1001426A0 <= 90 && (dword_1001426A0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void sub_1000B5B48(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v12 = "cancel";
    id v13 = v5;
    LogPrintF();
  }
  id v7 = [[*(id *)(*(void *)(a1 + 32) + 536) UUIDString:v12, v13];
  id v8 = +[NSNumber numberWithUnsignedInteger:2];
  id v9 = +[NSDictionary dictionaryWithObjectsAndKeys:v7, @"sesID", v8, @"actionType", 0];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  void v14[2] = sub_1000B5CE4;
  v14[3] = &unk_100124DF0;
  id v15 = v6;
  id v16 = v5;
  id v10 = v5;
  id v11 = v6;
  [v11 sendRequestID:@"_ccConfirmStart" request:v9 options:0 responseHandler:v14];
}

void sub_1000B5CE4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v8 = a4;
  [*(id *)(a1 + 32) invalidate];
  id v5 = v8;
  if (v8)
  {
    if (dword_1001426A0 <= 90)
    {
      if (dword_1001426A0 != -1 || (v6 = _LogCategory_Initialize(), id v5 = v8, v6))
      {
LABEL_7:
        LogPrintF();
        id v5 = v8;
      }
    }
  }
  else if (dword_1001426A0 <= 30)
  {
    if (dword_1001426A0 != -1) {
      goto LABEL_7;
    }
    int v7 = _LogCategory_Initialize();
    id v5 = 0;
    if (v7) {
      goto LABEL_7;
    }
  }
}

void sub_1000B60F0(void *a1, void *a2)
{
  id v3 = a2;
  int v4 = (void *)a1[4];
  if (v3)
  {
    [v4 invalidate];
    if (dword_1001426A0 <= 90 && (dword_1001426A0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  else
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000B61F4;
    v6[3] = &unk_100124CD8;
    uint64_t v5 = a1[6];
    v6[4] = a1[7];
    void v6[5] = v4;
    v6[6] = a1[5];
    [v4 sendEventID:@"_ccExit" event:v5 options:0 completion:v6];
  }
}

void sub_1000B61F4(uint64_t a1, void *a2)
{
  id v6 = a2;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 592));
  [*(id *)(a1 + 40) invalidate];
  id v3 = v6;
  if (v6)
  {
    if (dword_1001426A0 <= 90)
    {
      if (dword_1001426A0 != -1 || (v4 = _LogCategory_Initialize(), id v3 = v6, v4))
      {
LABEL_7:
        LogPrintF();
        id v3 = v6;
      }
    }
  }
  else if (dword_1001426A0 <= 30)
  {
    if (dword_1001426A0 != -1) {
      goto LABEL_7;
    }
    int v5 = _LogCategory_Initialize();
    id v3 = 0;
    if (v5) {
      goto LABEL_7;
    }
  }
}

id sub_1000B687C(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 336);
  if (v2)
  {
    id v3 = v2;
    dispatch_source_cancel(v3);
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = *(void **)(v4 + 336);
    *(void *)(v4 + 336) = 0;
  }
  if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v6 = *(void **)(a1 + 32);

  return [v6 _changeDiscoverySessionStateForDevice:0 startReason:0];
}

void sub_1000B6A78(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 344);
  if (v2)
  {
    id v3 = v2;
    dispatch_source_cancel(v3);
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = *(void **)(v4 + 344);
    *(void *)(v4 + 344) = 0;
  }
  id v6 = *(void **)(a1 + 32);
  if (v6[75])
  {
    int v7 = [v6 _findMatchingDeviceWithIdentifier:];
    id v10 = v7;
    if (!v7 || (unsigned __int8 v8 = [v7 inDiscoverySession], v9 = v10, (v8 & 1) == 0))
    {
      if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      [*(id *)(a1 + 32) _changeDiscoverySessionStateForDevice:0 startReason:0];
      id v9 = v10;
    }
  }
}

void sub_1000B7170(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v4 = [v5 client];
  LODWORD(a1) = [v4 isEqual:*(void *)(a1 + 32)];

  if (a1) {
    [v5 invalidate];
  }
}

id sub_1000B7844(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) _authCompletion:a2];
}

id sub_1000B7850(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _[*(id *)(a1 + 32) _promptForPasswordWithFlags:a2 throttleSeconds:a3];
}

id sub_1000B7860(uint64_t a1)
{
  return [*(id *)(a1 + 32) sessionEndedWithID:*(void *)(a1 + 40) netCnx:*(void *)(a1 + 48)];
}

id sub_1000B7870(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) _receivedEventID:a2 event:a3 options:a4 sessionID:*(void *)(a1 + 40)];
}

id sub_1000B7888(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [*(id *)(a1 + 32) _receivedRequestID:a2 request:a3 options:a4 responseHandler:a5 sessionID:*(void *)(a1 + 40)];
}

id sub_1000B78A4(uint64_t a1, int a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) pairingInfo];

  if (!v4)
  {
    if (a2 != 1) {
      return [*(id *)(*(void *)(a1 + 40) + 56) _update];
    }
LABEL_14:
    id v8 = [*(id *)(a1 + 48) linkType];
    uint64_t v9 = *(void *)(a1 + 40);
    if (*(void *)(v9 + 40))
    {
      id v10 = v8;
      id v11 = [*(id *)(v9 + 80) remoteObjectProxy];
      uint64_t v12 = +[NSNumber numberWithInt:v10];
      [v11 remoteDisplayUpdateDataLinkType:v12];
    }
    id v13 = sub_1000A71C0();
    id v14 = sub_1000A71C0();
    os_signpost_id_t v15 = os_signpost_id_make_with_pointer(v14, *(const void **)(a1 + 40));

    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      *(_WORD *)uint64_t v17 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_EVENT, v15, "RPConnectionStateReady", "RPConnectionStateReady", v17, 2u);
    }

    return [*(id *)(*(void *)(a1 + 40) + 56) _update];
  }
  if (a2)
  {
    if (a2 != 1) {
      return [*(id *)(*(void *)(a1 + 40) + 56) _update];
    }
    if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v5 = *(void **)(*(void *)(a1 + 40) + 56);
    id v6 = [*(id *)(a1 + 48) peerDeviceInfo];
    int v7 = [v6 verifiedIdentity];
    [v5 _changeDiscoverySessionStateForDevice:v7 startReason:1];

    goto LABEL_14;
  }
  [*(id *)(a1 + 32) setNeedsAWDL:0];
  if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  return [*(id *)(*(void *)(a1 + 40) + 56) _update];
}

void sub_1000B8080(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = v3;
  if (dword_1001426A0 <= 90)
  {
    if (dword_1001426A0 != -1 || (v4 = _LogCategory_Initialize(), id v3 = v6, v4))
    {
      LogPrintF();
      id v3 = v6;
    }
  }
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5)
  {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
    id v3 = v6;
  }
}

void sub_1000B8140(void *a1, void *a2)
{
  id v3 = a2;
  id v10 = v3;
  if (v3)
  {
    int v4 = v3;
    if (dword_1001426A0 <= 90)
    {
      if (dword_1001426A0 != -1 || (int v5 = _LogCategory_Initialize(), v4 = v10, v5))
      {
        LogPrintF();
LABEL_14:
        int v4 = v10;
      }
    }
  }
  else
  {
    if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v8 = a1[4];
      uint64_t v9 = a1[5];
      LogPrintF();
    }
    if (GestaltGetDeviceClass() == 1
      || (DeviceClass = GestaltGetDeviceClass(), int v4 = 0, DeviceClass == 3))
    {
      [*(id *)(a1[6] + 56) _postNotificationForWombatActivity:1, v8, v9];
      goto LABEL_14;
    }
  }
  uint64_t v7 = a1[7];
  if (v7)
  {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v10);
    int v4 = v10;
  }
}

void sub_1000B8724(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (dword_1001426A0 <= 90 && (dword_1001426A0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
}

void sub_1000B87E0(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (dword_1001426A0 <= 90 && (dword_1001426A0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
}

void sub_1000B8D90(uint64_t a1)
{
  id v2 = [(Class)off_1001427F8[0]() defaultWorkspace];
  uint64_t v3 = *(void *)(a1 + 32);
  id v6 = 0;
  unsigned __int8 v4 = [v2 openSensitiveURL:v3 withOptions:0 error:&v6];
  id v5 = v6;

  if ((v4 & 1) == 0 && dword_1001426A0 <= 90 && (dword_1001426A0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
}

void sub_1000B8ED4(uint64_t a1)
{
  SInt32 error = 0;
  id v2 = objc_opt_new();
  uint64_t v3 = off_100142808(@"CC_DISABLED_HEADER");
  [v2 setObject:v3 forKeyedSubscript:kCFUserNotificationAlertHeaderKey];

  unsigned __int8 v4 = off_100142808(@"CC_DISABLED_CANCEL");
  [v2 setObject:v4 forKeyedSubscript:kCFUserNotificationAlternateButtonTitleKey];

  id v5 = off_100142808(@"CC_DISABLED_SETTINGS");
  [v2 setObject:v5 forKeyedSubscript:kCFUserNotificationDefaultButtonTitleKey];

  id v6 = off_100142808(@"CC_DISABLED_MESSAGE");
  [v2 setObject:v6 forKeyedSubscript:kCFUserNotificationAlertMessageKey];

  uint64_t v7 = CFUserNotificationCreate(0, 0.0, 1uLL, &error, (CFDictionaryRef)v2);
  if (error)
  {
    if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  else
  {
    uint64_t v8 = v7;
    CFOptionFlags responseFlags = 0;
    CFUserNotificationReceiveResponse(v7, 0.0, &responseFlags);
    if ((responseFlags & 3) == 0) {
      [*(id *)(a1 + 32) _handleContinuityCameraDisabledAlertResponse];
    }
    CFRelease(v8);
  }
}

void sub_1000B93A0(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "shouldReportDevice:"))
  {
    unsigned __int8 v4 = [*(id *)(*(void *)(a1 + 40) + 80) remoteObjectProxy];
    [v4 remoteDisplayFoundDevice:v5];
  }
}

id sub_1000B964C(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 56) _deliverBufferedConnectionsToServer:];
}

void sub_1000B9F58(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1000B9F98(uint64_t result)
{
  if (*(void *)(result + 32))
  {
    uint64_t v1 = result;
    if (dword_1001426A0 <= 90 && (dword_1001426A0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id result = *(void *)(v1 + 40);
    if (result)
    {
      id v2 = *(uint64_t (**)(void))(result + 16);
      return v2();
    }
  }
  return result;
}

Class sub_1000BB128()
{
  if (qword_100142FA8 != -1) {
    dispatch_once(&qword_100142FA8, &stru_100124E88);
  }
  Class result = objc_getClass("SFDeviceDiscovery");
  qword_100142FA0 = (uint64_t)result;
  off_100142710[0] = (uint64_t (*)())sub_1000BB18C;
  return result;
}

id sub_1000BB18C()
{
  return (id)qword_100142FA0;
}

void sub_1000BB198(id a1)
{
  qword_100142FB0 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/Sharing.framework/Sharing", 2);
}

void sub_1000BB1C4(id a1)
{
  uint64_t v1 = LogCategoryCopyOSLogHandle();
  id v2 = (void *)qword_100142FB8;
  qword_100142FB8 = v1;
}

Class sub_1000BB200()
{
  if (qword_100142FA8 != -1) {
    dispatch_once(&qword_100142FA8, &stru_100124E88);
  }
  Class result = objc_getClass("SFService");
  qword_100142FC8 = (uint64_t)result;
  off_100142718[0] = (uint64_t (*)())sub_1000BB264;
  return result;
}

id sub_1000BB264()
{
  return (id)qword_100142FC8;
}

id sub_1000BB270()
{
  if (qword_100142FA8 != -1) {
    dispatch_once(&qword_100142FA8, &stru_100124E88);
  }
  int v0 = (id *)dlsym((void *)qword_100142FB0, "SFServiceIdentifierRemoteDisplay");
  if (v0) {
    objc_storeStrong((id *)&qword_100142F98, *v0);
  }
  off_100142720 = (uint64_t (*)())sub_1000BB300;
  uint64_t v1 = (void *)qword_100142F98;

  return v1;
}

id sub_1000BB300()
{
  return (id)qword_100142F98;
}

uint64_t sub_1000BB30C()
{
  if (qword_100142FD0 != -1) {
    dispatch_once(&qword_100142FD0, &stru_100124EC8);
  }
  int v0 = (uint64_t (*)())dlsym((void *)qword_100142FD8, "FigContinuityCaptureGetUserPreferenceDisabled");
  off_100142800[0] = v0;

  return v0();
}

void sub_1000BB374(id a1)
{
  qword_100142FD8 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/CMCapture.framework/CMCapture", 2);
}

Class sub_1000BB3A0()
{
  if (qword_100142FA8 != -1) {
    dispatch_once(&qword_100142FA8, &stru_100124E88);
  }
  Class result = objc_getClass("SFAuthenticationManager");
  qword_100142FE0 = (uint64_t)result;
  off_100142730 = (uint64_t (*)())sub_1000BB404;
  return result;
}

id sub_1000BB404()
{
  return (id)qword_100142FE0;
}

Class sub_1000BB410()
{
  if (qword_100142FF0 != -1) {
    dispatch_once(&qword_100142FF0, &stru_100124EE8);
  }
  Class result = objc_getClass("LSApplicationWorkspace");
  qword_100142FE8 = (uint64_t)result;
  off_1001427F8[0] = (uint64_t (*)())sub_1000BB474;
  return result;
}

id sub_1000BB474()
{
  return (id)qword_100142FE8;
}

void sub_1000BB480(id a1)
{
  qword_100142FF8 = (uint64_t)dlopen("/System/Library/Frameworks/MobileCoreServices.framework/MobileCoreServices", 2);
}

id sub_1000BB4AC(void *a1)
{
  uint64_t v1 = qword_100143000;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&qword_100143000, &stru_100124F08);
  }
  off_100142808 = (uint64_t (*)())dlsym((void *)qword_100143008, "RPUILocalizedString");
  uint64_t v3 = ((void (*)(id))off_100142808)(v2);

  return v3;
}

void sub_1000BB540(id a1)
{
  qword_100143008 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/RapportUI.framework/RapportUI", 2);
}

void sub_1000BB5C0(id a1)
{
  uint64_t v1 = objc_alloc_init(RPStatusDaemon);
  id v2 = (void *)qword_100143010;
  qword_100143010 = (uint64_t)v1;
}

id sub_1000BB994(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _activate];
}

void sub_1000BBB10(id a1, NSDictionary *a2, NSDictionary *a3)
{
  id v5 = a2;
  unsigned __int8 v4 = a3;
  if (dword_100142810 <= 20 && (dword_100142810 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
}

id sub_1000BBC2C(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _invalidate];
}

id sub_1000BC26C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _xpcConnectionInvalidated:*(void *)(a1 + 40)];
}

id sub_1000BD098(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) _handleSiriAudio:a2];
}

void sub_1000BD0A4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v10 = a2;
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v7 objectForKey:@"senderID"];
  if ([v9 length]) {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), v9);
  }
  [*(id *)(a1 + 32) _handleSiriStart:v10 options:v7 responseHandler:v8];
}

id sub_1000BD15C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _[*(id *)(a1 + 32) _handleSiriStop:a2 options:a3 responseHandler:a4];
}

id sub_1000BD170(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _[*(id *)(a1 + 32) _handleSiriStartWhileRecording:a2 options:a3 responseHandler:a4];
}

uint64_t sub_1000BDFC8()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_1000BF1CC(v0, qword_100143028);
  sub_1000BEE78(v0, (uint64_t)qword_100143028);
  return Logger.init(subsystem:category:)();
}

uint64_t sub_1000BE048()
{
  return swift_allocObject();
}

void sub_1000BE058(uint64_t a1, unint64_t a2)
{
  if (a2)
  {
    uint64_t v4 = qword_100143020;
    swift_bridgeObjectRetain();
    if (v4 != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    sub_1000BEE78(v5, (uint64_t)qword_100143028);
    swift_bridgeObjectRetain();
    id v6 = Logger.logObject.getter();
    os_log_type_t v7 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v6, v7))
    {
      id v8 = (uint8_t *)swift_slowAlloc();
      uint64_t v13 = swift_slowAlloc();
      *(_DWORD *)id v8 = 136315138;
      swift_bridgeObjectRetain();
      sub_1000BE550(a1, a2, &v13);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "Test log: RPSwiftMemoryTest_enum.associatedValue(%s)", v8, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
  else
  {
    if (qword_100143020 != -1) {
      swift_once();
    }
    uint64_t v9 = type metadata accessor for Logger();
    sub_1000BEE78(v9, (uint64_t)qword_100143028);
    oslog = Logger.logObject.getter();
    os_log_type_t v10 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(oslog, v10))
    {
      id v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, oslog, v10, "Test log: RPSwiftMemoryTest_enum.empty", v11, 2u);
      swift_slowDealloc();
    }
  }
}

uint64_t sub_1000BE2E8()
{
  uint64_t v0 = swift_allocObject();
  swift_defaultActor_initialize();
  return v0;
}

id RPSwiftMemoryTest_objCClass.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

id RPSwiftMemoryTest_objCClass.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return [super init];
}

id RPSwiftMemoryTest_objCClass.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return [super dealloc];
}

uint64_t sub_1000BE408()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

void sub_1000BE418()
{
}

void sub_1000BE424(const char *a1)
{
  if (qword_100143020 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_1000BEE78(v2, (uint64_t)qword_100143028);
  oslog = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(oslog, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, oslog, v3, a1, v4, 2u);
    swift_slowDealloc();
  }
}

uint64_t sub_1000BE514()
{
  swift_defaultActor_destroy();

  return _swift_defaultActor_deallocate(v0);
}

uint64_t sub_1000BE544()
{
  return v0;
}

uint64_t sub_1000BE550(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1000BE624(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1000BF128((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_1000BF128((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_1000BF0D8((uint64_t)v12);
  return v7;
}

uint64_t sub_1000BE624(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            UnsafeMutableRawBufferPointer.subscript.setter();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_1000BE7E0(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = _StringObject.sharedUTF8.getter();
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
LABEL_17:
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_1000BE7E0(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_1000BE878(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1000BEA58(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1000BEA58(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_1000BE878(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_1000BE9F0(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = _StringGuts.copyUTF8(into:)();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
LABEL_10:
      uint64_t v2 = String.UTF8View._foreignCount()();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_1000BE9F0(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  sub_1000BF184(&qword_100142B78);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1000BEA58(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_1000BF184(&qword_100142B78);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void _s8rapportd27RPSwiftMemoryTest_objCClassC10performLogyyF_0()
{
  if (qword_100143020 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  sub_1000BEE78(v0, (uint64_t)qword_100143028);
  id v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v1, v2))
  {
    unint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Test log: RPSwiftMemoryTest_objCClass", v3, 2u);
    swift_slowDealloc();
  }

  unint64_t v4 = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    unint64_t v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Test log: RPSwiftMemoryTest_swiftClass", v6, 2u);
    swift_slowDealloc();
  }

  int64_t v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    int64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)int64_t v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "Test log: RPSwiftMemoryTest_struct", v9, 2u);
    swift_slowDealloc();
  }

  uint64_t v10 = Logger.logObject.getter();
  os_log_type_t v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "Test log: RPSwiftMemoryTest_enum.empty", v12, 2u);
    swift_slowDealloc();
  }

  sub_1000BE058(1953719636, 0xE400000000000000);
  type metadata accessor for RPSwiftMemoryTest_actor();
  swift_allocObject();
  swift_defaultActor_initialize();
  oslog = Logger.logObject.getter();
  os_log_type_t v13 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(oslog, v13))
  {
    id v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, oslog, v13, "Test log: RPSwiftMemoryTest_actor", v14, 2u);
    swift_slowDealloc();
  }
  swift_release();
}

uint64_t sub_1000BEE78(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t type metadata accessor for RPSwiftMemoryTest_objCClass()
{
  return self;
}

uint64_t type metadata accessor for RPSwiftMemoryTest_swiftClass()
{
  return self;
}

ValueMetadata *type metadata accessor for RPSwiftMemoryTest_struct()
{
  return &type metadata for RPSwiftMemoryTest_struct;
}

void *initializeBufferWithCopyOfBuffer for RPSwiftMemoryTest_enum(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for RPSwiftMemoryTest_enum()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for RPSwiftMemoryTest_enum(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for RPSwiftMemoryTest_enum(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for RPSwiftMemoryTest_enum(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for RPSwiftMemoryTest_enum(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  if ((v3 + 1) >= 2) {
    return v3;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for RPSwiftMemoryTest_enum(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)__n128 result = 0;
    *(void *)(result + _Block_object_dispose(&STACK[0x380], 8) = 0;
    *(_DWORD *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + _Block_object_dispose(&STACK[0x380], 8) = a2;
    }
  }
  return result;
}

uint64_t sub_1000BF068(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_1000BF084(void *result, int a2)
{
  if (a2 < 0)
  {
    *__n128 result = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else if (a2)
  {
    result[1] = (a2 - 1);
  }
  return result;
}

ValueMetadata *type metadata accessor for RPSwiftMemoryTest_enum()
{
  return &type metadata for RPSwiftMemoryTest_enum;
}

uint64_t type metadata accessor for RPSwiftMemoryTest_actor()
{
  return self;
}

uint64_t sub_1000BF0D8(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_1000BF128(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1000BF184(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t *sub_1000BF1CC(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

void sub_1000BF234()
{
  sub_100042E34();
  v1[0] = 67109120;
  v1[1] = v0;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Validated magic value: 0x%x", (uint8_t *)v1, 8u);
}

void sub_1000BF2B4()
{
  sub_100042E34();
  v1[0] = 67109120;
  v1[1] = v0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Magic value does not match: 0x%x", (uint8_t *)v1, 8u);
}

void sub_1000BF334()
{
  *(_WORD *)int v0 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Connection not validated yet", v0, 2u);
}

void sub_1000BF37C(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(*(void *)(*(void *)a1 + 8) + 33);
  v2[0] = 67109120;
  v2[1] = v1;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Received error code=%u", (uint8_t *)v2, 8u);
}

void sub_1000BF408(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(*(void *)a1 + 8) + 40);
  int v2 = 134217984;
  uint64_t v3 = v1;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Received data, length=%zu, passing through", (uint8_t *)&v2, 0xCu);
}

void sub_1000BF494(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)a1 + 8);
  int v2 = *(unsigned __int8 *)(v1 + 32);
  uint64_t v3 = *(void *)(v1 + 40);
  v4[0] = 67109376;
  v4[1] = v2;
  __int16 v5 = 2048;
  uint64_t v6 = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Got a message header, type=%d, length=%zu", (uint8_t *)v4, 0x12u);
}

void sub_1000BF530(uint64_t a1)
{
  int v1 = 134217984;
  uint64_t v2 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Writing data (%zu bytes) on framer", (uint8_t *)&v1, 0xCu);
}

void sub_1000BF5B0(uint64_t a1)
{
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Stop handler called for framer=%@, sending CLOSE to daemon", (uint8_t *)&v1, 0xCu);
}

uint64_t Logger.logObject.getter()
{
  return Logger.logObject.getter();
}

uint64_t Logger.init(subsystem:category:)()
{
  return Logger.init(subsystem:category:)();
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

uint64_t static os_log_type_t.default.getter()
{
  return static os_log_type_t.default.getter();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t ASPrintF()
{
  return _ASPrintF();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
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

CFTypeID CFDataGetTypeID(void)
{
  return _CFDataGetTypeID();
}

uint64_t CFDictionaryGetCFDataOfLength()
{
  return _CFDictionaryGetCFDataOfLength();
}

uint64_t CFDictionaryGetData()
{
  return _CFDictionaryGetData();
}

uint64_t CFDictionaryGetDouble()
{
  return _CFDictionaryGetDouble();
}

uint64_t CFDictionaryGetHardwareAddress()
{
  return _CFDictionaryGetHardwareAddress();
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

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

uint64_t CFGetInt64()
{
  return _CFGetInt64();
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return _CFPreferencesAppSynchronize(applicationID);
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

uint64_t CFPrefs_RemoveValue()
{
  return _CFPrefs_RemoveValue();
}

uint64_t CFPrefs_SetDouble()
{
  return _CFPrefs_SetDouble();
}

uint64_t CFPrefs_SetValue()
{
  return _CFPrefs_SetValue();
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return _CFUserNotificationCreate(allocator, timeout, flags, error, dictionary);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return _CFUserNotificationReceiveResponse(userNotification, timeout, responseFlags);
}

uint64_t CUDescriptionWithLevel()
{
  return _CUDescriptionWithLevel();
}

uint64_t CUDispatchTimerSet()
{
  return _CUDispatchTimerSet();
}

uint64_t CUDispatchTimerSetEx()
{
  return _CUDispatchTimerSetEx();
}

uint64_t CUMainQueue()
{
  return _CUMainQueue();
}

uint64_t CUMetricsLog()
{
  return _CUMetricsLog();
}

uint64_t CUNormalizeEmailAddress()
{
  return _CUNormalizeEmailAddress();
}

uint64_t CUNormalizePhoneNumber()
{
  return _CUNormalizePhoneNumber();
}

uint64_t CUPrintNSError()
{
  return _CUPrintNSError();
}

uint64_t CUStateDumpWithObject()
{
  return _CUStateDumpWithObject();
}

uint64_t CreateUsableInterfaceList()
{
  return _CreateUsableInterfaceList();
}

uint64_t CryptoHKDF()
{
  return _CryptoHKDF();
}

uint64_t DeviceOSVersionAtOrLater()
{
  return _DeviceOSVersionAtOrLater();
}

uint64_t DeviceOSVersionAtOrLaterEx()
{
  return _DeviceOSVersionAtOrLaterEx();
}

uint64_t FatalErrorF()
{
  return _FatalErrorF();
}

uint64_t GestaltCopyAnswer()
{
  return _GestaltCopyAnswer();
}

uint64_t GestaltGetBoolean()
{
  return _GestaltGetBoolean();
}

uint64_t GestaltGetDeviceClass()
{
  return _GestaltGetDeviceClass();
}

uint64_t GestaltProductTypeStringToDeviceClass()
{
  return _GestaltProductTypeStringToDeviceClass();
}

uint64_t IDSCopyIDForDevice()
{
  return _IDSCopyIDForDevice();
}

uint64_t IDSCopyIDForEmailAddress()
{
  return _IDSCopyIDForEmailAddress();
}

uint64_t IDSCopyIDForPhoneNumber()
{
  return _IDSCopyIDForPhoneNumber();
}

uint64_t IDSCopyLocalDeviceUniqueID()
{
  return _IDSCopyLocalDeviceUniqueID();
}

uint64_t IDSCopyRawAddressForDestination()
{
  return _IDSCopyRawAddressForDestination();
}

uint64_t IMCanonicalizeFormattedString()
{
  return _IMCanonicalizeFormattedString();
}

uint64_t IOHIDEventAppendEvent()
{
  return _IOHIDEventAppendEvent();
}

uint64_t IOHIDEventCreate()
{
  return _IOHIDEventCreate();
}

uint64_t IOHIDEventCreateKeyboardEvent()
{
  return _IOHIDEventCreateKeyboardEvent();
}

uint64_t IOHIDEventCreateVendorDefinedEvent()
{
  return _IOHIDEventCreateVendorDefinedEvent();
}

uint64_t IOHIDEventGetTimeStamp()
{
  return _IOHIDEventGetTimeStamp();
}

uint64_t IOHIDEventSetDoubleValue()
{
  return _IOHIDEventSetDoubleValue();
}

uint64_t IOHIDEventSetEventFlags()
{
  return _IOHIDEventSetEventFlags();
}

uint64_t IOHIDEventSetIntegerValue()
{
  return _IOHIDEventSetIntegerValue();
}

uint64_t IOHIDEventSetSenderID()
{
  return _IOHIDEventSetSenderID();
}

uint64_t IOHIDEventSystemClientCreate()
{
  return _IOHIDEventSystemClientCreate();
}

uint64_t IOHIDEventSystemClientDispatchEvent()
{
  return _IOHIDEventSystemClientDispatchEvent();
}

void IOHIDUserDeviceActivate(IOHIDUserDeviceRef device)
{
}

uint64_t IOHIDUserDeviceCopyService()
{
  return _IOHIDUserDeviceCopyService();
}

uint64_t IOHIDUserDeviceCreate()
{
  return _IOHIDUserDeviceCreate();
}

IOReturn IOHIDUserDeviceHandleReportWithTimeStamp(IOHIDUserDeviceRef device, uint64_t timestamp, const uint8_t *report, CFIndex reportLength)
{
  return _IOHIDUserDeviceHandleReportWithTimeStamp(device, timestamp, report, reportLength);
}

void IOHIDUserDeviceSetDispatchQueue(IOHIDUserDeviceRef device, dispatch_queue_t queue)
{
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

IOReturn IOPMAssertionCreateWithProperties(CFDictionaryRef AssertionProperties, IOPMAssertionID *AssertionID)
{
  return _IOPMAssertionCreateWithProperties(AssertionProperties, AssertionID);
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  return _IOPMAssertionRelease(AssertionID);
}

kern_return_t IORegistryEntryGetChildEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *child)
{
  return _IORegistryEntryGetChildEntry(entry, plane, child);
}

kern_return_t IORegistryEntryGetRegistryEntryID(io_registry_entry_t entry, uint64_t *entryID)
{
  return _IORegistryEntryGetRegistryEntryID(entry, entryID);
}

uint64_t IsAppleInternalBuild()
{
  return _IsAppleInternalBuild();
}

uint64_t LogCategoryCopyOSLogHandle()
{
  return _LogCategoryCopyOSLogHandle();
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

uint64_t LogShow()
{
  return _LogShow();
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

uint64_t MRAVEndpointGetLocalEndpoint()
{
  return _MRAVEndpointGetLocalEndpoint();
}

uint64_t MRAVEndpointGetVolumeControlCapabilities()
{
  return _MRAVEndpointGetVolumeControlCapabilities();
}

uint64_t MRMediaRemoteCommandInfoGetCommand()
{
  return _MRMediaRemoteCommandInfoGetCommand();
}

uint64_t MRMediaRemoteCommandInfoGetEnabled()
{
  return _MRMediaRemoteCommandInfoGetEnabled();
}

uint64_t MRMediaRemoteGetDeviceInfo()
{
  return _MRMediaRemoteGetDeviceInfo();
}

uint64_t MRMediaRemoteGetLocalOrigin()
{
  return _MRMediaRemoteGetLocalOrigin();
}

uint64_t MRMediaRemoteGetSupportedCommands()
{
  return _MRMediaRemoteGetSupportedCommands();
}

uint64_t MRMediaRemoteSendCommand()
{
  return _MRMediaRemoteSendCommand();
}

uint64_t MRMediaRemoteSetWantsSupportedCommandsChangedNotifications()
{
  return _MRMediaRemoteSetWantsSupportedCommandsChangedNotifications();
}

uint64_t MRPairedDeviceCopyIdentifier()
{
  return _MRPairedDeviceCopyIdentifier();
}

uint64_t NADyFF4UGjtVGBmEW6h()
{
  return _NADyFF4UGjtVGBmEW6h();
}

uint64_t NEVirtualInterfaceAddAddress()
{
  return _NEVirtualInterfaceAddAddress();
}

uint64_t NEVirtualInterfaceCopyName()
{
  return _NEVirtualInterfaceCopyName();
}

uint64_t NEVirtualInterfaceCreate()
{
  return _NEVirtualInterfaceCreate();
}

uint64_t NEVirtualInterfaceSetRankNever()
{
  return _NEVirtualInterfaceSetRankNever();
}

uint64_t NEVirtualInterfaceSetReadAutomatically()
{
  return _NEVirtualInterfaceSetReadAutomatically();
}

uint64_t NEVirtualInterfaceUpdateAdHocService()
{
  return _NEVirtualInterfaceUpdateAdHocService();
}

uint64_t NSAppendPrintF()
{
  return _NSAppendPrintF();
}

uint64_t NSDecodeNSArrayOfClassIfPresent()
{
  return _NSDecodeNSArrayOfClassIfPresent();
}

uint64_t NSDecodeNSDictionaryOfClassesIfPresent()
{
  return _NSDecodeNSDictionaryOfClassesIfPresent();
}

uint64_t NSDecodeObjectIfPresent()
{
  return _NSDecodeObjectIfPresent();
}

uint64_t NSDecodeSInt64RangedIfPresent()
{
  return _NSDecodeSInt64RangedIfPresent();
}

uint64_t NSDecodeStandardContainerIfPresent()
{
  return _NSDecodeStandardContainerIfPresent();
}

uint64_t NSDictionaryGetNSArrayOfClass()
{
  return _NSDictionaryGetNSArrayOfClass();
}

uint64_t NSDictionaryGetNSNumber()
{
  return _NSDictionaryGetNSNumber();
}

uint64_t NSDictionaryGetNSUUID()
{
  return _NSDictionaryGetNSUUID();
}

uint64_t NSErrorNestedV()
{
  return _NSErrorNestedV();
}

uint64_t NSErrorV()
{
  return _NSErrorV();
}

uint64_t NSPrintF()
{
  return _NSPrintF();
}

uint64_t NSRandomData()
{
  return _NSRandomData();
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return _NSSelectorFromString(aSelectorName);
}

uint64_t NSStringFromBOOL()
{
  return _NSStringFromBOOL();
}

uint64_t NSStringFromRBSTaskState()
{
  return _NSStringFromRBSTaskState();
}

uint64_t NanosecondsToUpTicks()
{
  return _NanosecondsToUpTicks();
}

uint64_t OPACKDecodeBytes()
{
  return _OPACKDecodeBytes();
}

uint64_t OPACKEncoderCreateData()
{
  return _OPACKEncoderCreateData();
}

uint64_t RPNearFieldTransactionStateDescription()
{
  return _RPNearFieldTransactionStateDescription();
}

uint64_t RandomBytes()
{
  return _RandomBytes();
}

uint64_t ReleaseUsableInterfaceList()
{
  return _ReleaseUsableInterfaceList();
}

uint64_t SecondsToUpTicks()
{
  return _SecondsToUpTicks();
}

uint64_t SipHash()
{
  return _SipHash();
}

uint64_t SocketGetInterfaceInfo()
{
  return _SocketGetInterfaceInfo();
}

uint64_t SourceVersionToCString()
{
  return _SourceVersionToCString();
}

uint64_t TN6sBSnEP2()
{
  return _TN6sBSnEP2();
}

uint64_t TextToSourceVersion()
{
  return _TextToSourceVersion();
}

uint64_t UpTicksToMilliseconds()
{
  return _UpTicksToMilliseconds();
}

uint64_t UpTicksToSeconds()
{
  return _UpTicksToSeconds();
}

uint64_t UpTicksToSecondsF()
{
  return _UpTicksToSecondsF();
}

uint64_t WiFiCopyCurrentNetworkInfoEx()
{
  return _WiFiCopyCurrentNetworkInfoEx();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return __CFXPCCreateCFObjectFromXPCObject();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return __CFXPCCreateXPCObjectFromCFObject();
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

uint64_t __memcpy_chk()
{
  return ___memcpy_chk();
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

uint32_t arc4random(void)
{
  return _arc4random();
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return _arc4random_uniform(__upper_bound);
}

uint64_t cced25519_make_key_pair_compat()
{
  return _cced25519_make_key_pair_compat();
}

uint64_t chacha20_all_96x32()
{
  return _chacha20_all_96x32();
}

size_t confstr(int a1, char *a2, size_t a3)
{
  return _confstr(a1, a2, a3);
}

void dispatch_activate(dispatch_object_t object)
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
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

void exit(int a1)
{
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

void free(void *a1)
{
}

uid_t geteuid(void)
{
  return _geteuid();
}

int gethostuuid(uuid_t a1, const timespec *a2)
{
  return _gethostuuid(a1, a2);
}

pid_t getpid(void)
{
  return _getpid();
}

unsigned int if_nametoindex(const char *a1)
{
  return _if_nametoindex(a1);
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return _inet_ntop(a1, a2, a3, a4);
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

uint64_t mach_continuous_time(void)
{
  return _mach_continuous_time();
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
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

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return _notify_get_state(token, state64);
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return _notify_register_check(name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return _notify_set_state(token, state64);
}

uint64_t nw_activity_activate()
{
  return _nw_activity_activate();
}

uint64_t nw_activity_complete_with_reason()
{
  return _nw_activity_complete_with_reason();
}

uint64_t nw_activity_complete_with_reason_and_underlying_error_string()
{
  return _nw_activity_complete_with_reason_and_underlying_error_string();
}

uint64_t nw_activity_create()
{
  return _nw_activity_create();
}

uint64_t nw_activity_create_from_token()
{
  return _nw_activity_create_from_token();
}

uint64_t nw_activity_get_token()
{
  return _nw_activity_get_token();
}

uint64_t nw_activity_is_activated()
{
  return _nw_activity_is_activated();
}

uint64_t nw_activity_set_parent_activity()
{
  return _nw_activity_set_parent_activity();
}

uint64_t nw_activity_submit_metrics()
{
  return _nw_activity_submit_metrics();
}

const char *__cdecl nw_advertise_descriptor_get_application_service_name(nw_advertise_descriptor_t advertise_descriptor)
{
  return _nw_advertise_descriptor_get_application_service_name(advertise_descriptor);
}

uint64_t nw_advertise_descriptor_get_invitation_route()
{
  return _nw_advertise_descriptor_get_invitation_route();
}

uint64_t nw_advertise_descriptor_get_invitation_scope()
{
  return _nw_advertise_descriptor_get_invitation_scope();
}

uint64_t nw_advertise_descriptor_get_type()
{
  return _nw_advertise_descriptor_get_type();
}

uint64_t nw_agent_add_resolve_handlers()
{
  return _nw_agent_add_resolve_handlers();
}

uint64_t nw_agent_add_to_interface()
{
  return _nw_agent_add_to_interface();
}

uint64_t nw_agent_change_state()
{
  return _nw_agent_change_state();
}

uint64_t nw_agent_client_copy_advertise_descriptor()
{
  return _nw_agent_client_copy_advertise_descriptor();
}

uint64_t nw_agent_client_copy_browse_descriptor()
{
  return _nw_agent_client_copy_browse_descriptor();
}

uint64_t nw_agent_client_copy_endpoint()
{
  return _nw_agent_client_copy_endpoint();
}

uint64_t nw_agent_client_copy_parameters()
{
  return _nw_agent_client_copy_parameters();
}

uint64_t nw_agent_client_copy_path()
{
  return _nw_agent_client_copy_path();
}

uint64_t nw_agent_create()
{
  return _nw_agent_create();
}

uint64_t nw_agent_get_uuid()
{
  return _nw_agent_get_uuid();
}

uint64_t nw_agent_send_error_response()
{
  return _nw_agent_send_error_response();
}

uint64_t nw_agent_set_assert_handlers()
{
  return _nw_agent_set_assert_handlers();
}

uint64_t nw_agent_set_browse_handlers()
{
  return _nw_agent_set_browse_handlers();
}

uint64_t nw_agent_set_flow_handlers()
{
  return _nw_agent_set_flow_handlers();
}

uint64_t nw_application_id_get_persona()
{
  return _nw_application_id_get_persona();
}

uint64_t nw_array_append()
{
  return _nw_array_append();
}

uint64_t nw_array_create()
{
  return _nw_array_create();
}

uint64_t nw_array_get_count()
{
  return _nw_array_get_count();
}

uint64_t nw_browse_descriptor_enumerate_device_filters()
{
  return _nw_browse_descriptor_enumerate_device_filters();
}

const char *__cdecl nw_browse_descriptor_get_application_service_name(nw_browse_descriptor_t descriptor)
{
  return _nw_browse_descriptor_get_application_service_name(descriptor);
}

uint64_t nw_browse_descriptor_get_browse_scope()
{
  return _nw_browse_descriptor_get_browse_scope();
}

uint64_t nw_browse_descriptor_get_device_types()
{
  return _nw_browse_descriptor_get_device_types();
}

uint64_t nw_browse_descriptor_get_invitation_scope()
{
  return _nw_browse_descriptor_get_invitation_scope();
}

uint64_t nw_browse_descriptor_get_type()
{
  return _nw_browse_descriptor_get_type();
}

uint64_t nw_endpoint_create_application_service()
{
  return _nw_endpoint_create_application_service();
}

nw_endpoint_t nw_endpoint_create_bonjour_service(const char *name, const char *type, const char *domain)
{
  return _nw_endpoint_create_bonjour_service(name, type, domain);
}

uint64_t nw_endpoint_get_apple_service_apple_id()
{
  return _nw_endpoint_get_apple_service_apple_id();
}

uint16_t nw_endpoint_get_port(nw_endpoint_t endpoint)
{
  return _nw_endpoint_get_port(endpoint);
}

uint64_t nw_endpoint_get_service_identifier()
{
  return _nw_endpoint_get_service_identifier();
}

nw_endpoint_type_t nw_endpoint_get_type(nw_endpoint_t endpoint)
{
  return _nw_endpoint_get_type(endpoint);
}

uint64_t nw_endpoint_set_agent_identifier()
{
  return _nw_endpoint_set_agent_identifier();
}

uint64_t nw_endpoint_set_contact_id()
{
  return _nw_endpoint_set_contact_id();
}

uint64_t nw_endpoint_set_device_color()
{
  return _nw_endpoint_set_device_color();
}

uint64_t nw_endpoint_set_device_id()
{
  return _nw_endpoint_set_device_id();
}

uint64_t nw_endpoint_set_device_model()
{
  return _nw_endpoint_set_device_model();
}

uint64_t nw_endpoint_set_device_name()
{
  return _nw_endpoint_set_device_name();
}

uint64_t nw_endpoint_set_public_keys()
{
  return _nw_endpoint_set_public_keys();
}

uint64_t nw_endpoint_set_txt_record()
{
  return _nw_endpoint_set_txt_record();
}

uint64_t nw_error_create_error_with_inferred_domain()
{
  return _nw_error_create_error_with_inferred_domain();
}

void nw_framer_async(nw_framer_t framer, nw_framer_block_t async_block)
{
}

uint64_t nw_framer_connection_state_copy_object_value()
{
  return _nw_framer_connection_state_copy_object_value();
}

uint64_t nw_framer_connection_state_set_object_value()
{
  return _nw_framer_connection_state_set_object_value();
}

nw_protocol_definition_t nw_framer_create_definition(const char *identifier, uint32_t flags, nw_framer_start_handler_t start_handler)
{
  return _nw_framer_create_definition(identifier, flags, start_handler);
}

nw_protocol_options_t nw_framer_create_options(nw_protocol_definition_t framer_definition)
{
  return _nw_framer_create_options(framer_definition);
}

BOOL nw_framer_deliver_input_no_copy(nw_framer_t framer, size_t input_length, nw_framer_message_t message, BOOL is_complete)
{
  return _nw_framer_deliver_input_no_copy(framer, input_length, message, is_complete);
}

void nw_framer_mark_failed_with_error(nw_framer_t framer, int error_code)
{
}

void nw_framer_mark_ready(nw_framer_t framer)
{
}

nw_framer_message_t nw_framer_message_create(nw_framer_t framer)
{
  return _nw_framer_message_create(framer);
}

uint64_t nw_framer_options_set_peer_protocol_definition()
{
  return _nw_framer_options_set_peer_protocol_definition();
}

BOOL nw_framer_parse_input(nw_framer_t framer, size_t minimum_incomplete_length, size_t maximum_length, uint8_t *temp_buffer, nw_framer_parse_completion_t parse)
{
  return _nw_framer_parse_input(framer, minimum_incomplete_length, maximum_length, temp_buffer, parse);
}

void nw_framer_set_cleanup_handler(nw_framer_t framer, nw_framer_cleanup_handler_t cleanup_handler)
{
}

void nw_framer_set_input_handler(nw_framer_t framer, nw_framer_input_handler_t input_handler)
{
}

void nw_framer_set_output_handler(nw_framer_t framer, nw_framer_output_handler_t output_handler)
{
}

void nw_framer_set_stop_handler(nw_framer_t framer, nw_framer_stop_handler_t stop_handler)
{
}

void nw_framer_write_output(nw_framer_t framer, const uint8_t *output_buffer, size_t output_length)
{
}

BOOL nw_framer_write_output_no_copy(nw_framer_t framer, size_t output_length)
{
  return _nw_framer_write_output_no_copy(framer, output_length);
}

uint64_t nw_interface_create_with_name()
{
  return _nw_interface_create_with_name();
}

uint64_t nw_parameters_copy_application_id()
{
  return _nw_parameters_copy_application_id();
}

nw_protocol_stack_t nw_parameters_copy_default_protocol_stack(nw_parameters_t parameters)
{
  return _nw_parameters_copy_default_protocol_stack(parameters);
}

nw_endpoint_t nw_parameters_copy_local_endpoint(nw_parameters_t parameters)
{
  return _nw_parameters_copy_local_endpoint(parameters);
}

uint64_t nw_parameters_copy_preferred_interface_subtypes()
{
  return _nw_parameters_copy_preferred_interface_subtypes();
}

uint64_t nw_parameters_copy_prohibited_interface_subtypes()
{
  return _nw_parameters_copy_prohibited_interface_subtypes();
}

uint64_t nw_parameters_copy_prohibited_interface_types()
{
  return _nw_parameters_copy_prohibited_interface_types();
}

uint64_t nw_parameters_get_include_ble()
{
  return _nw_parameters_get_include_ble();
}

uint64_t nw_parameters_get_include_screen_off_devices()
{
  return _nw_parameters_get_include_screen_off_devices();
}

uint64_t nw_parameters_get_next_hop_required_interface_subtype()
{
  return _nw_parameters_get_next_hop_required_interface_subtype();
}

uint64_t nw_parameters_get_next_hop_required_interface_type()
{
  return _nw_parameters_get_next_hop_required_interface_type();
}

uint64_t nw_parameters_get_pid()
{
  return _nw_parameters_get_pid();
}

nw_endpoint_t nw_path_copy_effective_local_endpoint(nw_path_t path)
{
  return _nw_path_copy_effective_local_endpoint(path);
}

uint64_t nw_path_is_listener()
{
  return _nw_path_is_listener();
}

nw_protocol_definition_t nw_protocol_copy_tcp_definition(void)
{
  return _nw_protocol_copy_tcp_definition();
}

BOOL nw_protocol_options_is_quic(nw_protocol_options_t options)
{
  return _nw_protocol_options_is_quic(options);
}

uint64_t nw_protocol_stack_includes_protocol()
{
  return _nw_protocol_stack_includes_protocol();
}

void nw_protocol_stack_iterate_application_protocols(nw_protocol_stack_t stack, nw_protocol_stack_iterate_protocols_block_t iterate_block)
{
}

uint64_t nw_quic_options_copy_local_public_key()
{
  return _nw_quic_options_copy_local_public_key();
}

nw_txt_record_t nw_txt_record_create_dictionary(void)
{
  return _nw_txt_record_create_dictionary();
}

BOOL nw_txt_record_set_key(nw_txt_record_t txt_record, const char *key, const uint8_t *value, size_t value_len)
{
  return _nw_txt_record_set_key(txt_record, key, value, value_len);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
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

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
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

uint64_t self
{
  return _self;
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

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return _os_signpost_enabled(log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return _os_signpost_id_make_with_pointer(log, ptr);
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_content()
{
  return _os_variant_has_internal_content();
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return _proc_pidinfo(pid, flavor, arg, buffer, buffersize);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
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

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return _swift_bridgeObjectRelease_n();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_defaultActor_destroy()
{
  return _swift_defaultActor_destroy();
}

uint64_t swift_defaultActor_initialize()
{
  return _swift_defaultActor_initialize();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

int uuid_is_null(const uuid_t uu)
{
  return _uuid_is_null(uu);
}

uint64_t wInTP56r94EFs9NAAi()
{
  return _wInTP56r94EFs9NAAi();
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return _xpc_array_get_count(xarray);
}

uint64_t xpc_array_get_uint64(xpc_object_t xarray, size_t index)
{
  return _xpc_array_get_uint64(xarray, index);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

uint64_t xpc_event_publisher_activate()
{
  return _xpc_event_publisher_activate();
}

uint64_t xpc_event_publisher_create()
{
  return _xpc_event_publisher_create();
}

uint64_t xpc_event_publisher_fire()
{
  return _xpc_event_publisher_fire();
}

uint64_t xpc_event_publisher_fire_with_reply()
{
  return _xpc_event_publisher_fire_with_reply();
}

uint64_t xpc_event_publisher_set_error_handler()
{
  return _xpc_event_publisher_set_error_handler();
}

uint64_t xpc_event_publisher_set_handler()
{
  return _xpc_event_publisher_set_handler();
}

uint64_t xpc_event_publisher_set_subscriber_keepalive()
{
  return _xpc_event_publisher_set_subscriber_keepalive();
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

id objc_msgSend_JSONObjectWithData_options_error_(void *a1, const char *a2, ...)
{
  return [a1 JSONObjectWithData:x0 options:x1 error:x2];
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return _[a1 URL];
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return [a1 URLWithString:];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return _[a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _[a1 UUIDString];
}

id objc_msgSend__AWDLBonjourTransportServiceMetadata(void *a1, const char *a2, ...)
{
  return _[a1 _AWDLBonjourTransportServiceMetadata];
}

id objc_msgSend__FZIDType(void *a1, const char *a2, ...)
{
  return _[a1 _FZIDType];
}

id objc_msgSend__acquireRBSAssertionForEntry_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_acquireRBSAssertionForEntry:error:");
}

id objc_msgSend__activateScreenSaverWithResponseHandler_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_activateScreenSaverWithResponseHandler:");
}

id objc_msgSend__activeDeviceAdded_cnx_(void *a1, const char *a2, ...)
{
  return [_activeDeviceAdded:cnx:];
}

id objc_msgSend__activeDeviceChanged_changes_(void *a1, const char *a2, ...)
{
  return [_activeDeviceChanged:changes];
}

id objc_msgSend__activeDeviceChangedForConnection_bonjourDevice_(void *a1, const char *a2, ...)
{
  return [_activeDeviceChangedForConnection:bonjourDevice:];
}

id objc_msgSend__activeDeviceRemoved_cnx_(void *a1, const char *a2, ...)
{
  return [a1 _activeDeviceRemoved:cnx];
}

id objc_msgSend__addApplicationPID_(void *a1, const char *a2, ...)
{
  return [a1 _addApplicationPID:];
}

id objc_msgSend__addProxyIdentifier_toDictionary_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_addProxyIdentifier:toDictionary:");
}

id objc_msgSend__airPlayLeaderStateUncached(void *a1, const char *a2, ...)
{
  return _[a1 _airPlayLeaderStateUncached];
}

id objc_msgSend__allowMessageForRegistrationOptions_cnx_(void *a1, const char *a2, ...)
{
  return [a1 _allowMessageForRegistrationOptions:cnx];
}

id objc_msgSend__allowStreamRequest_xpcCnx_rpCnx_(void *a1, const char *a2, ...)
{
  return [a1 _allowStreamRequest:xpcCnx:rpCnx:];
}

id objc_msgSend__appearsToBeEmail(void *a1, const char *a2, ...)
{
  return _[a1 _appearsToBeEmail];
}

id objc_msgSend__appearsToBePhoneNumber(void *a1, const char *a2, ...)
{
  return _[a1 _appearsToBePhoneNumber];
}

id objc_msgSend__applicationServiceAdvertiseDescriptorForClient_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_applicationServiceAdvertiseDescriptorForClient:");
}

id objc_msgSend__authTagWithSelfIdentity_data_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_authTagWithSelfIdentity:data:");
}

id objc_msgSend__beginTransactionForRole_(void *a1, const char *a2, ...)
{
  return [a1 _beginTransactionForRole:];
}

id objc_msgSend__bestGuessURI(void *a1, const char *a2, ...)
{
  return _[a1 _bestGuessURI];
}

id objc_msgSend__bleClientConnectionEnded_(void *a1, const char *a2, ...)
{
  return [a1 _bleClientConnectionEnded:];
}

id objc_msgSend__bleClientConnectionStateChanged_cnx_sessionID_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_bleClientConnectionStateChanged:cnx:sessionID:")];
}

id objc_msgSend__bleDiscoveryEnsureStarted_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_bleDiscoveryEnsureStarted:)];
}

id objc_msgSend__bleDiscoveryTriggerEnhancedDiscovery_useCase_(void *a1, const char *a2, ...)
{
  return [a1 _bleDiscoveryTriggerEnhancedDiscovery:useCase:];
}

id objc_msgSend__bleServerEnsureStarted(void *a1, const char *a2, ...)
{
  return _[a1 _bleServerEnsureStarted];
}

id objc_msgSend__bleServerEnsureStopped(void *a1, const char *a2, ...)
{
  return _[a1 _bleServerEnsureStopped];
}

id objc_msgSend__bluetoothUseCaseFromWombatState_resultBlock_(void *a1, const char *a2, ...)
{
  return [a1 _bluetoothUseCaseFromWombatState:x0 resultBlock:x1];
}

id objc_msgSend__btAddressMonitorEnsureStarted(void *a1, const char *a2, ...)
{
  return _[a1 _btAddressMonitorEnsureStarted];
}

id objc_msgSend__btAddressMonitorEnsureStopped(void *a1, const char *a2, ...)
{
  return _[a1 _btAddressMonitorEnsureStopped];
}

id objc_msgSend__btPipeEnsureStarted(void *a1, const char *a2, ...)
{
  return _[a1 _btPipeEnsureStarted];
}

id objc_msgSend__btPipeEnsureStopped(void *a1, const char *a2, ...)
{
  return _[a1 _btPipeEnsureStopped];
}

id objc_msgSend__btPipeSetup_withPriority_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_btPipeSetup:withPriority:");
}

id objc_msgSend__btPipeSyncKeysIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 _btPipeSyncKeysIfNeeded];
}

id objc_msgSend__btPipeTearDown_(void *a1, const char *a2, ...)
{
  return [a1 _btPipeTearDown:];
}

id objc_msgSend__bufferCloudMessage_frameType_msgCtx_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_bufferCloudMessage:frameType:msgCtx:");
}

id objc_msgSend__changeDiscoverySessionStateForDevice_startReason_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_changeDiscoverySessionStateForDevice:startReason:");
}

id objc_msgSend__checkForProxyOrLocalDestinations_eventID_event_options_completion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_checkForProxyOrLocalDestinations:eventID:event:options:completion:");
}

id objc_msgSend__checkRSSIThresholdForDevice_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_checkRSSIThresholdForDevice:");
}

id objc_msgSend__clearCameraCapabilitiesUpdateCache(void *a1, const char *a2, ...)
{
  return _[a1 _clearCameraCapabilitiesUpdateCache];
}

id objc_msgSend__clearConfirmationClientCache(void *a1, const char *a2, ...)
{
  return _[a1 _clearConfirmationClientCache];
}

id objc_msgSend__clearCurrentTransaction(void *a1, const char *a2, ...)
{
  return _[a1 _clearCurrentTransaction];
}

id objc_msgSend__clientAWDLPairingSessionWithDevice_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_clientAWDLPairingSessionWithDevice:");
}

id objc_msgSend__clientBLEActionDiscoveryEnsureStarted(void *a1, const char *a2, ...)
{
  return _[a1 _clientBLEActionDiscoveryEnsureStarted];
}

id objc_msgSend__clientBLEActionDiscoveryEnsureStopped(void *a1, const char *a2, ...)
{
  return _[a1 _clientBLEActionDiscoveryEnsureStopped];
}

id objc_msgSend__clientBLEActionDiscoveryShouldRun(void *a1, const char *a2, ...)
{
  return _[a1 _clientBLEActionDiscoveryShouldRun];
}

id objc_msgSend__clientBLEDiscoveryDeviceLost_force_deviceFlags_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_clientBLEDiscoveryDeviceLost:force:deviceFlags:");
}

id objc_msgSend__clientBLEDiscoveryEnsureStarted(void *a1, const char *a2, ...)
{
  return _[a1 _clientBLEDiscoveryEnsureStarted];
}

id objc_msgSend__clientBLEDiscoveryEnsureStopped(void *a1, const char *a2, ...)
{
  return _[a1 _clientBLEDiscoveryEnsureStopped];
}

id objc_msgSend__clientBLEDiscoveryShouldRun(void *a1, const char *a2, ...)
{
  return _[a1 _clientBLEDiscoveryShouldRun];
}

id objc_msgSend__clientBLEFamilyDeviceReportChanges(void *a1, const char *a2, ...)
{
  return _[a1 _clientBLEFamilyDeviceReportChanges];
}

id objc_msgSend__clientBLENearbyActionAdvertiserEnsureStopped(void *a1, const char *a2, ...)
{
  return _[a1 _clientBLENearbyActionAdvertiserEnsureStopped];
}

id objc_msgSend__clientBLENearbyActionAdvertiserShouldRun(void *a1, const char *a2, ...)
{
  return _[a1 _clientBLENearbyActionAdvertiserShouldRun];
}

id objc_msgSend__clientBLENearbyActionAdvertiserStartTimer(void *a1, const char *a2, ...)
{
  return _[a1 _clientBLENearbyActionAdvertiserStartTimer];
}

id objc_msgSend__clientBLENearbyActionDisableDupeFilter(void *a1, const char *a2, ...)
{
  return _[a1 _clientBLENearbyActionDisableDupeFilter];
}

id objc_msgSend__clientBLENearbyActionDiscoveryEnsureStarted(void *a1, const char *a2, ...)
{
  return _[a1 _clientBLENearbyActionDiscoveryEnsureStarted];
}

id objc_msgSend__clientBLENearbyActionDiscoveryEnsureStopped(void *a1, const char *a2, ...)
{
  return _[a1 _clientBLENearbyActionDiscoveryEnsureStopped];
}

id objc_msgSend__clientBLENearbyActionDiscoveryScanRateStartTimer(void *a1, const char *a2, ...)
{
  return _[a1 _clientBLENearbyActionDiscoveryScanRateStartTimer];
}

id objc_msgSend__clientBLENearbyActionDiscoveryShouldRun(void *a1, const char *a2, ...)
{
  return _[a1 _clientBLENearbyActionDiscoveryShouldRun];
}

id objc_msgSend__clientBLENearbyActionEnableDupeFilter(void *a1, const char *a2, ...)
{
  return _[a1 _clientBLENearbyActionEnableDupeFilter];
}

id objc_msgSend__clientBLENearbyActionV2AdvertiserEnsureStarted(void *a1, const char *a2, ...)
{
  return _[a1 _clientBLENearbyActionV2AdvertiserEnsureStarted];
}

id objc_msgSend__clientBLENearbyActionV2AdvertiserEnsureStopped(void *a1, const char *a2, ...)
{
  return _[a1 _clientBLENearbyActionV2AdvertiserEnsureStopped];
}

id objc_msgSend__clientBLENearbyActionV2AdvertiserRestart(void *a1, const char *a2, ...)
{
  return _[a1 _clientBLENearbyActionV2AdvertiserRestart];
}

id objc_msgSend__clientBLENearbyActionV2AdvertiserShouldRun(void *a1, const char *a2, ...)
{
  return _[a1 _clientBLENearbyActionV2AdvertiserShouldRun];
}

id objc_msgSend__clientBLENearbyActionV2AdvertiserUpdate(void *a1, const char *a2, ...)
{
  return _[a1 _clientBLENearbyActionV2AdvertiserUpdate];
}

id objc_msgSend__clientBLENeedsAWDLAdvertiserEnsureStarted(void *a1, const char *a2, ...)
{
  return _[a1 _clientBLENeedsAWDLAdvertiserEnsureStarted];
}

id objc_msgSend__clientBLENeedsAWDLAdvertiserEnsureStopped(void *a1, const char *a2, ...)
{
  return _[a1 _clientBLENeedsAWDLAdvertiserEnsureStopped];
}

id objc_msgSend__clientBLENeedsAWDLAdvertiserShouldRun(void *a1, const char *a2, ...)
{
  return _[a1 _clientBLENeedsAWDLAdvertiserShouldRun];
}

id objc_msgSend__clientBLENeedsCLinkAdvertiserEnsureStarted(void *a1, const char *a2, ...)
{
  return _[a1 _clientBLENeedsCLinkAdvertiserEnsureStarted];
}

id objc_msgSend__clientBLENeedsCLinkAdvertiserEnsureStopped(void *a1, const char *a2, ...)
{
  return _[a1 _clientBLENeedsCLinkAdvertiserEnsureStopped];
}

id objc_msgSend__clientBLENeedsCLinkAdvertiserRestart(void *a1, const char *a2, ...)
{
  return _[a1 _clientBLENeedsCLinkAdvertiserRestart];
}

id objc_msgSend__clientBLENeedsCLinkAdvertiserShouldRun(void *a1, const char *a2, ...)
{
  return _[a1 _clientBLENeedsCLinkAdvertiserShouldRun];
}

id objc_msgSend__clientBLENeedsCLinkAdvertiserUpdate(void *a1, const char *a2, ...)
{
  return _[a1 _clientBLENeedsCLinkAdvertiserUpdate];
}

id objc_msgSend__clientBLENeedsCLinkTargetDevice(void *a1, const char *a2, ...)
{
  return _[a1 _clientBLENeedsCLinkTargetDevice];
}

id objc_msgSend__clientBLEServerEnsureStarted(void *a1, const char *a2, ...)
{
  return _[a1 _clientBLEServerEnsureStarted];
}

id objc_msgSend__clientBLEServerEnsureStopped(void *a1, const char *a2, ...)
{
  return _[a1 _clientBLEServerEnsureStopped];
}

id objc_msgSend__clientBLEServerHandleConnectionEnded_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_clientBLEServerHandleConnectionEnded:");
}

id objc_msgSend__clientBLEServerShouldRun(void *a1, const char *a2, ...)
{
  return _[a1 _clientBLEServerShouldRun];
}

id objc_msgSend__clientBLETriggerEnhancedDiscovery_useCase_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_clientBLETriggerEnhancedDiscovery:useCase:error:")];
}

id objc_msgSend__clientBonjourAWDLBrowserEnsureStarted(void *a1, const char *a2, ...)
{
  return _[a1 _clientBonjourAWDLBrowserEnsureStarted];
}

id objc_msgSend__clientBonjourAWDLBrowserEnsureStopped(void *a1, const char *a2, ...)
{
  return _[a1 _clientBonjourAWDLBrowserEnsureStopped];
}

id objc_msgSend__clientBonjourAWDLBrowserShouldRun(void *a1, const char *a2, ...)
{
  return _[a1 _clientBonjourAWDLBrowserShouldRun];
}

id objc_msgSend__clientBonjourCheckFoundPairedDevice_publicID_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_clientBonjourCheckFoundPairedDevice:publicID:")];
}

id objc_msgSend__clientBonjourCheckLostPairedDevice_publicID_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_clientBonjourCheckLostPairedDevice:publicID:")];
}

id objc_msgSend__clientBonjourEnsureStarted(void *a1, const char *a2, ...)
{
  return _[a1 _clientBonjourEnsureStarted];
}

id objc_msgSend__clientBonjourEnsureStopped(void *a1, const char *a2, ...)
{
  return _[a1 _clientBonjourEnsureStopped];
}

id objc_msgSend__clientBonjourFoundDevice_reevaluate_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_clientBonjourFoundDevice:reevaluate:");
}

id objc_msgSend__clientBonjourFoundUnauthDevice_isAWDLDevice_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_clientBonjourFoundUnauthDevice:isAWDLDevice:");
}

id objc_msgSend__clientBonjourFoundUnresolvedDevice_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_clientBonjourFoundUnresolvedDevice:");
}

id objc_msgSend__clientBonjourLostDevice_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_clientBonjourLostDevice:");
}

id objc_msgSend__clientBonjourLostUnauthDevice_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_clientBonjourLostUnauthDevice:");
}

id objc_msgSend__clientBonjourLostUnresolvedDevice_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_clientBonjourLostUnresolvedDevice:");
}

id objc_msgSend__clientBonjourReconfirmDevice_reason_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_clientBonjourReconfirmDevice:reason:");
}

id objc_msgSend__clientBonjourReevaluateAllDevices(void *a1, const char *a2, ...)
{
  return _[a1 _clientBonjourReevaluateAllDevices];
}

id objc_msgSend__clientBonjourReevaluateDevices(void *a1, const char *a2, ...)
{
  return _[a1 _clientBonjourReevaluateDevices];
}

id objc_msgSend__clientBonjourReevaluateUnauthDevices(void *a1, const char *a2, ...)
{
  return _[a1 _clientBonjourReevaluateUnauthDevices];
}

id objc_msgSend__clientConnectionEnded_uniqueID_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_clientConnectionEnded:uniqueID:");
}

id objc_msgSend__clientConnectionEndedUnauth_publicID_(void *a1, const char *a2, ...)
{
  return [a1 _clientConnectionEndedUnauth:publicID:];
}

id objc_msgSend__clientConnectionStart_controlFlags_uniqueID_identity_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_clientConnectionStart:controlFlags:uniqueID:identity:");
}

id objc_msgSend__clientConnectionStartOnDemand_xpcCnx_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_clientConnectionStartOnDemand:xpcCnx:error:");
}

id objc_msgSend__clientConnectionStartUnauth_client_publicID_xpcCnx_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_clientConnectionStartUnauth:client:publicID:xpcCnx:error:");
}

id objc_msgSend__clientCreateConnection_xpcCnx_error_(void *a1, const char *a2, ...)
{
  return [a1 _clientCreateConnection:xpcCnx:error:];
}

id objc_msgSend__clientEnsureStarted(void *a1, const char *a2, ...)
{
  return _[a1 _clientEnsureStarted];
}

id objc_msgSend__clientEnsureStopped(void *a1, const char *a2, ...)
{
  return _[a1 _clientEnsureStopped];
}

id objc_msgSend__clientLostAllDevices(void *a1, const char *a2, ...)
{
  return _[a1 _clientLostAllDevices];
}

id objc_msgSend__clientOnDemandAWDLDiscoveryStartForXPC_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_clientOnDemandAWDLDiscoveryStartForXPC:");
}

id objc_msgSend__clientOnDemandConnectionEnded_uniqueID_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_clientOnDemandConnectionEnded:uniqueID:")];
}

id objc_msgSend__clientOnDemandDiscoveryStart_xpcCnx_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_clientOnDemandDiscoveryStart:xpcCnx:");
}

id objc_msgSend__clientProximityEstimatorEnsureStarted(void *a1, const char *a2, ...)
{
  return _[a1 _clientProximityEstimatorEnsureStarted];
}

id objc_msgSend__clientProximityEstimatorEnsureStopped(void *a1, const char *a2, ...)
{
  return _[a1 _clientProximityEstimatorEnsureStopped];
}

id objc_msgSend__clientProximityEstimatorShouldRun(void *a1, const char *a2, ...)
{
  return _[a1 _clientProximityEstimatorShouldRun];
}

id objc_msgSend__clientPurgeUnauthAWDLDevices(void *a1, const char *a2, ...)
{
  return _[a1 _clientPurgeUnauthAWDLDevices];
}

id objc_msgSend__clientReportChangedDevice_changes_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_clientReportChangedDevice:changes:");
}

id objc_msgSend__clientReportFoundDevice_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_clientReportFoundDevice:");
}

id objc_msgSend__clientReportLostDevice_(void *a1, const char *a2, ...)
{
  return [a1 _clientReportLostDevice:];
}

id objc_msgSend__clientSendActivityLevelOverWiFiIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _clientSendActivityLevelOverWiFiIfNecessary];
}

id objc_msgSend__clientSendNeedsAWDLOverWiFi_(void *a1, const char *a2, ...)
{
  return [a1 _clientSendNeedsAWDLOverWiFi:];
}

id objc_msgSend__clientShouldConnectOverBonjour_device_identities_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_clientShouldConnectOverBonjour:device:identities:");
}

id objc_msgSend__clientShouldFindNonSameAccountDevices(void *a1, const char *a2, ...)
{
  return _[a1 _clientShouldFindNonSameAccountDevices];
}

id objc_msgSend__clientUINoteProcessPending(void *a1, const char *a2, ...)
{
  return _[a1 _clientUINoteProcessPending];
}

id objc_msgSend__clientUINoteStart_(void *a1, const char *a2, ...)
{
  return [a1 _clientUINoteStart:];
}

id objc_msgSend__configureConnectionForPairing_(void *a1, const char *a2, ...)
{
  return [a1 _configureConnectionForPairing:];
}

id objc_msgSend__connectionConfigureCommon_(void *a1, const char *a2, ...)
{
  return [a1 _connectionConfigureCommon:];
}

id objc_msgSend__connectionHasActiveSessions_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_connectionHasActiveSessions:");
}

id objc_msgSend__connectionStateChanged_cnx_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_connectionStateChanged:cnx:");
}

id objc_msgSend__contextCollectorDevice(void *a1, const char *a2, ...)
{
  return _[a1 _contextCollectorDevice];
}

id objc_msgSend__controlFlagsToNearbyActionType_(void *a1, const char *a2, ...)
{
  return [a1 _controlFlagsToNearbyActionType:];
}

id objc_msgSend__convertToLegacyApplicationLabelIfNeeded_forVersion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_convertToLegacyApplicationLabelIfNeeded:forVersion:");
}

id objc_msgSend__convertToUpdatedApplicationLabelIfNeeded_forVersion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_convertToUpdatedApplicationLabelIfNeeded:forVersion:");
}

id objc_msgSend__createAndRunSession(void *a1, const char *a2, ...)
{
  return _[a1 _createAndRunSession];
}

id objc_msgSend__createAuthenticationPayload(void *a1, const char *a2, ...)
{
  return _[a1 _createAuthenticationPayload];
}

id objc_msgSend__createDestinationIdentifierMaps(void *a1, const char *a2, ...)
{
  return _[a1 _createDestinationIdentifierMaps];
}

id objc_msgSend__createOneShotTimerWithInterval_completionHandler_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_createOneShotTimerWithInterval:completionHandler:");
}

id objc_msgSend__createRequestEntryForXid_requestID_options_responseHandler_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_createRequestEntryForXid:requestID:options:responseHandler:");
}

id objc_msgSend__createTapEventForApplicationLabel_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_createTapEventForApplicationLabel:");
}

id objc_msgSend__createValidationPayload(void *a1, const char *a2, ...)
{
  return _[a1 _createValidationPayload];
}

id objc_msgSend__daemonDevice_updatedMeasurement_(void *a1, const char *a2, ...)
{
  return [a1 _daemonDevice:updatedMeasurement:];
}

id objc_msgSend__daemonDeviceFound_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_daemonDeviceFound:");
}

id objc_msgSend__deliverEventID_event_options_unauth_cnx_outError_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_deliverEventID:event:options:unauth:cnx:outError:");
}

id objc_msgSend__destinationID_matchesCnx_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_destinationID:matchesCnx:");
}

id objc_msgSend__destinationID_matchesProxyDeviceOnCnx_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_destinationID:matchesProxyDeviceOnCnx:");
}

id objc_msgSend__deviceSupportsLaguna_(void *a1, const char *a2, ...)
{
  return [a1 _deviceSupportsLaguna:];
}

id objc_msgSend__devicesForClient_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_devicesForClient:");
}

id objc_msgSend__didReceiveAuthenticationMessage_(void *a1, const char *a2, ...)
{
  return [a1 _didReceiveAuthenticationMessage:];
}

id objc_msgSend__didReceiveAuthenticationResponseWithResult_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_didReceiveAuthenticationResponseWithResult:error:");
}

id objc_msgSend__didReceiveValidationMessage_(void *a1, const char *a2, ...)
{
  return [a1 _didReceiveValidationMessage:];
}

id objc_msgSend__disconnectRemovedSharedHomeDevices(void *a1, const char *a2, ...)
{
  return _[a1 _disconnectRemovedSharedHomeDevices];
}

id objc_msgSend__disconnectUnauthConnections(void *a1, const char *a2, ...)
{
  return _[a1 _disconnectUnauthConnections];
}

id objc_msgSend__disconnectUnpairedDevices(void *a1, const char *a2, ...)
{
  return _[a1 _disconnectUnpairedDevices];
}

id objc_msgSend__discoveriCloudDevicesOnly(void *a1, const char *a2, ...)
{
  return _[a1 _discoveriCloudDevicesOnly];
}

id objc_msgSend__discoveryEnsureStarted(void *a1, const char *a2, ...)
{
  return _[a1 _discoveryEnsureStarted];
}

id objc_msgSend__discoveryEnsureStopped(void *a1, const char *a2, ...)
{
  return _[a1 _discoveryEnsureStopped];
}

id objc_msgSend__discoveryNonceOrRotate_(void *a1, const char *a2, ...)
{
  return [a1 _discoveryNonceOrRotate:];
}

id objc_msgSend__duetSyncEnsureStarted(void *a1, const char *a2, ...)
{
  return _[a1 _duetSyncEnsureStarted];
}

id objc_msgSend__duetSyncEnsureStopped(void *a1, const char *a2, ...)
{
  return _[a1 _duetSyncEnsureStopped];
}

id objc_msgSend__ensureStopped(void *a1, const char *a2, ...)
{
  return _[a1 _ensureStopped];
}

id objc_msgSend__entitledAndReturnError_(void *a1, const char *a2, ...)
{
  return [a1 _entitledAndReturnError:];
}

id objc_msgSend__entitledAndReturnError_error_(void *a1, const char *a2, ...)
{
  return [a1 _entitledAndReturnError:error:];
}

id objc_msgSend__entitledForLabel_error_(void *a1, const char *a2, ...)
{
  return [a1 _entitledForLabel:x0 error:x1];
}

id objc_msgSend__enumerateIdentitiesWithFlag_usingBlock_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_enumerateIdentitiesWithFlag:usingBlock:");
}

id objc_msgSend__eventForHomeHubDevice_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_eventForHomeHubDevice:");
}

id objc_msgSend__existingProxyDeviceUpdated_event_isLocal_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_existingProxyDeviceUpdated:event:isLocal:");
}

id objc_msgSend__exportedInterface(void *a1, const char *a2, ...)
{
  return _[a1 _exportedInterface];
}

id objc_msgSend__familyEnsureStarted(void *a1, const char *a2, ...)
{
  return _[a1 _familyEnsureStarted];
}

id objc_msgSend__familyEnsureStopped(void *a1, const char *a2, ...)
{
  return _[a1 _familyEnsureStopped];
}

id objc_msgSend__fetchSameAccountIdentities(void *a1, const char *a2, ...)
{
  return _[a1 _fetchSameAccountIdentities];
}

id objc_msgSend__filterHomeKitUserIdentifiers_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_filterHomeKitUserIdentifiers:");
}

id objc_msgSend__findDeviceWithDevice_deviceMap_matchedIdentifier_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_findDeviceWithDevice:deviceMap:matchedIdentifier:");
}

id objc_msgSend__findExistingActiveDevice_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_findExistingActiveDevice:");
}

id objc_msgSend__findMatchingAWDLBonjourDevice_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_findMatchingAWDLBonjourDevice:");
}

id objc_msgSend__findMatchingDevice_inDeviceDictionary_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_findMatchingDevice:inDeviceDictionary:");
}

id objc_msgSend__findMatchingDeviceWithIdentifier_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_findMatchingDeviceWithIdentifier:");
}

id objc_msgSend__findWiFiConnectionByID_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_findWiFiConnectionByID:");
}

id objc_msgSend__finishCurrentTransactionWithError_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_finishCurrentTransactionWithError:");
}

id objc_msgSend__flagsForVersion_(void *a1, const char *a2, ...)
{
  return [a1 _flagsForVersion:];
}

id objc_msgSend__forEachConnectionWithHandler_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_forEachConnectionWithHandler:");
}

id objc_msgSend__forEachMatchingDestinationID_handler_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_forEachMatchingDestinationID:handler:");
}

id objc_msgSend__forEachUniqueMatchingDestinationID_handler_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_forEachUniqueMatchingDestinationID:handler:");
}

id objc_msgSend__friendsEnsureStarted(void *a1, const char *a2, ...)
{
  return _[a1 _friendsEnsureStarted];
}

id objc_msgSend__friendsEnsureStopped(void *a1, const char *a2, ...)
{
  return _[a1 _friendsEnsureStopped];
}

id objc_msgSend__friendsUpdateSuggestedIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 _friendsUpdateSuggestedIfNeeded];
}

id objc_msgSend__getAltDSID(void *a1, const char *a2, ...)
{
  return _[a1 _getAltDSID];
}

id objc_msgSend__getAppleID(void *a1, const char *a2, ...)
{
  return _[a1 _getAppleID];
}

id objc_msgSend__handleConfirmationResult_fromDevice_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_handleConfirmationResult:fromDevice:");
}

id objc_msgSend__handleContinuityCameraDisabledAlertResponse(void *a1, const char *a2, ...)
{
  return _[a1 _handleContinuityCameraDisabledAlertResponse];
}

id objc_msgSend__handleGameControllerAuxEvent_pressed_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_handleGameControllerAuxEvent:pressed:");
}

id objc_msgSend__handleGetVolume_responseHandler_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_handleGetVolume:responseHandler:");
}

id objc_msgSend__handleMediaCaptionGet_responseHandler_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_handleMediaCaptionGet:responseHandler:")];
}

id objc_msgSend__handleMediaCaptionSet_responseHandler_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_handleMediaCaptionSet:responseHandler:");
}

id objc_msgSend__handleMovementCommand_endCommand_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_handleMovementCommand:endCommand:");
}

id objc_msgSend__handleSelectWithButtonState_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_handleSelectWithButtonState:");
}

id objc_msgSend__handleServerActivation_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_handleServerActivation:");
}

id objc_msgSend__handleSetVolume_responseHandler_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_handleSetVolume:responseHandler:")];
}

id objc_msgSend__handleSiriStart_options_responseHandler_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_handleSiriStart:options:responseHandler:");
}

id objc_msgSend__handleSkipByRequest_responseHandler_(void *a1, const char *a2, ...)
{
  return [a1 _handleSkipByRequest:x0 responseHandler:x1];
}

id objc_msgSend__haveActiveClientConnectionsOnAWDL(void *a1, const char *a2, ...)
{
  return _[a1 _haveActiveClientConnectionsOnAWDL];
}

id objc_msgSend__haveActiveServerConnectionsOnAWDL(void *a1, const char *a2, ...)
{
  return _[a1 _haveActiveServerConnectionsOnAWDL];
}

id objc_msgSend__hidEnsureStarted(void *a1, const char *a2, ...)
{
  return _[a1 _hidEnsureStarted];
}

id objc_msgSend__hidEnsureStopped(void *a1, const char *a2, ...)
{
  return _[a1 _hidEnsureStopped];
}

id objc_msgSend__homeHubDeviceAdded_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_homeHubDeviceAdded:");
}

id objc_msgSend__homeHubDeviceRemoved_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_homeHubDeviceRemoved:");
}

id objc_msgSend__homeKitAuthMatchForBonjourDevice_(void *a1, const char *a2, ...)
{
  return [a1 _homeKitAuthMatchForBonjourDevice:];
}

id objc_msgSend__homeKitDecryptRotatingIDForBonjourDevice_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_homeKitDecryptRotatingIDForBonjourDevice:");
}

id objc_msgSend__homeKitEnsureStarted(void *a1, const char *a2, ...)
{
  return _[a1 _homeKitEnsureStarted];
}

id objc_msgSend__homeKitEnsureStopped(void *a1, const char *a2, ...)
{
  return _[a1 _homeKitEnsureStopped];
}

id objc_msgSend__homeKitGetPairingIdentities(void *a1, const char *a2, ...)
{
  return _[a1 _homeKitGetPairingIdentities];
}

id objc_msgSend__homeKitGetUserInfo_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_homeKitGetUserInfo:");
}

id objc_msgSend__homeKitSelfAccessoryMediaSystemUpdated_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_homeKitSelfAccessoryMediaSystemUpdated:");
}

id objc_msgSend__homeKitUpdateInfo_(void *a1, const char *a2, ...)
{
  return [a1 _homeKitUpdateInfo:];
}

id objc_msgSend__homeKitUpdateUserIdentifiers(void *a1, const char *a2, ...)
{
  return _[a1 _homeKitUpdateUserIdentifiers];
}

id objc_msgSend__identitiesOfType_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_identitiesOfType:error:")];
}

id objc_msgSend__identityForNFCDeviceDiscovery(void *a1, const char *a2, ...)
{
  return _[a1 _identityForNFCDeviceDiscovery];
}

id objc_msgSend__idleSessionConnection(void *a1, const char *a2, ...)
{
  return _[a1 _idleSessionConnection];
}

id objc_msgSend__idsAccountWithURI_senderID_(void *a1, const char *a2, ...)
{
  return [a1 _idsAccountWithURI:x0 senderID:x1];
}

id objc_msgSend__idsEnsureStopped(void *a1, const char *a2, ...)
{
  return _[a1 _idsEnsureStopped];
}

id objc_msgSend__idsURIWithID_(void *a1, const char *a2, ...)
{
  return [a1 _idsURIWithID:];
}

id objc_msgSend__initWithNWActivity_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_initWithNWActivity:");
}

id objc_msgSend__injectKeyboardEventUsagePage_usageCode_buttonState_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_injectKeyboardEventUsagePage:usageCode:buttonState:");
}

id objc_msgSend__interestReceived_cnx_(void *a1, const char *a2, ...)
{
  return [a1 _interestReceived:cnx];
}

id objc_msgSend__interestRemoveForCnx_(void *a1, const char *a2, ...)
{
  return [a1 _interestRemoveForCnx:];
}

id objc_msgSend__invalidateConnectionInList_listDescription_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_invalidateConnectionInList:listDescription:");
}

id objc_msgSend__invalidated(void *a1, const char *a2, ...)
{
  return _[a1 _invalidated];
}

id objc_msgSend__irkMetricsSetup(void *a1, const char *a2, ...)
{
  return _[a1 _irkMetricsSetup];
}

id objc_msgSend__isTCPTransport_(void *a1, const char *a2, ...)
{
  return [a1 _isTCPTransport:];
}

id objc_msgSend__legacyApplicationLabels(void *a1, const char *a2, ...)
{
  return _[a1 _legacyApplicationLabels];
}

id objc_msgSend__loadSelfIdentity_(void *a1, const char *a2, ...)
{
  return [a1 _loadSelfIdentity:];
}

id objc_msgSend__loadTemporarySelfIdentity(void *a1, const char *a2, ...)
{
  return _[a1 _loadTemporarySelfIdentity];
}

id objc_msgSend__localDeviceCleanup(void *a1, const char *a2, ...)
{
  return _[a1 _localDeviceCleanup];
}

id objc_msgSend__localDeviceUpdate(void *a1, const char *a2, ...)
{
  return _[a1 _localDeviceUpdate];
}

id objc_msgSend__localMediaAccessControlSetting(void *a1, const char *a2, ...)
{
  return _[a1 _localMediaAccessControlSetting];
}

id objc_msgSend__localPublicKeyForAgentClient_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_localPublicKeyForAgentClient:");
}

id objc_msgSend__mediaControlEnsureStarted(void *a1, const char *a2, ...)
{
  return _[a1 _mediaControlEnsureStarted];
}

id objc_msgSend__mediaControlEnsureStopped(void *a1, const char *a2, ...)
{
  return _[a1 _mediaControlEnsureStopped];
}

id objc_msgSend__mediaRemoteIDGet(void *a1, const char *a2, ...)
{
  return _[a1 _mediaRemoteIDGet];
}

id objc_msgSend__mediaRemoteSupportedCommandsGet(void *a1, const char *a2, ...)
{
  return _[a1 _mediaRemoteSupportedCommandsGet];
}

id objc_msgSend__mediaRouteIDGet(void *a1, const char *a2, ...)
{
  return _[a1 _mediaRouteIDGet];
}

id objc_msgSend__metricsDictionary(void *a1, const char *a2, ...)
{
  return _[a1 _metricsDictionary];
}

id objc_msgSend__metricsSubmissionSetup(void *a1, const char *a2, ...)
{
  return _[a1 _metricsSubmissionSetup];
}

id objc_msgSend__miscEnsureStarted(void *a1, const char *a2, ...)
{
  return _[a1 _miscEnsureStarted];
}

id objc_msgSend__miscEnsureStopped(void *a1, const char *a2, ...)
{
  return _[a1 _miscEnsureStopped];
}

id objc_msgSend__nearbyActionDeviceActionTypes(void *a1, const char *a2, ...)
{
  return _[a1 _nearbyActionDeviceActionTypes];
}

id objc_msgSend__needToHoldPowerAssertion(void *a1, const char *a2, ...)
{
  return _[a1 _needToHoldPowerAssertion];
}

id objc_msgSend__onenessEnabled(void *a1, const char *a2, ...)
{
  return _[a1 _onenessEnabled];
}

id objc_msgSend__payloadForType_(void *a1, const char *a2, ...)
{
  return [a1 _payloadForType:];
}

id objc_msgSend__personalDeviceUpdate(void *a1, const char *a2, ...)
{
  return _[a1 _personalDeviceUpdate];
}

id objc_msgSend__postIdentitiesChangedNotification(void *a1, const char *a2, ...)
{
  return _[a1 _postIdentitiesChangedNotification];
}

id objc_msgSend__postNotificationForWombatActivity_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_postNotificationForWombatActivity:");
}

id objc_msgSend__powerAssertionEnsureHeld(void *a1, const char *a2, ...)
{
  return _[a1 _powerAssertionEnsureHeld];
}

id objc_msgSend__powerAssertionEnsureReleased(void *a1, const char *a2, ...)
{
  return _[a1 _powerAssertionEnsureReleased];
}

id objc_msgSend__prefsChanged(void *a1, const char *a2, ...)
{
  return _[a1 _prefsChanged];
}

id objc_msgSend__primaryAppleID_(void *a1, const char *a2, ...)
{
  return [a1 _primaryAppleID:];
}

id objc_msgSend__processBufferedCloudMessages(void *a1, const char *a2, ...)
{
  return _[a1 _processBufferedCloudMessages];
}

id objc_msgSend__processDiscoverySessionStateChangeForDevice_startReason_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_processDiscoverySessionStateChangeForDevice:startReason:");
}

id objc_msgSend__proxyDevice_isEqualTo_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_proxyDevice:isEqualTo:");
}

id objc_msgSend__proxyDevice_loopbackRequestID_request_options_responseHandler_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_proxyDevice:loopbackRequestID:request:options:responseHandler:");
}

id objc_msgSend__proxyDevice_receivedRequestID_request_options_responseHandler_cnx_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_proxyDevice:receivedRequestID:request:options:responseHandler:cnx:");
}

id objc_msgSend__proxyDeviceAdd_options_eventID_deviceInfo_cnx_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_proxyDeviceAdd:options:eventID:deviceInfo:cnx:");
}

id objc_msgSend__proxyDeviceListUpdated_content_options_cnx_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_proxyDeviceListUpdated:content:options:cnx:")];
}

id objc_msgSend__proxyDeviceRemove_options_cnx_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_proxyDeviceRemove:options:cnx:");
}

id objc_msgSend__pruneFamilyDevices(void *a1, const char *a2, ...)
{
  return _[a1 _pruneFamilyDevices];
}

id objc_msgSend__pruneFriendAccounts_(void *a1, const char *a2, ...)
{
  return [a1 _pruneFriendAccounts:];
}

id objc_msgSend__pruneFriendDevices(void *a1, const char *a2, ...)
{
  return _[a1 _pruneFriendDevices];
}

id objc_msgSend__pruneFriends_(void *a1, const char *a2, ...)
{
  return [a1 _pruneFriends:];
}

id objc_msgSend__quicProtocolOptionsFromParameters_(void *a1, const char *a2, ...)
{
  return [a1 _quicProtocolOptionsFromParameters:];
}

id objc_msgSend__rangingBLEActionScannerBurst(void *a1, const char *a2, ...)
{
  return _[a1 _rangingBLEActionScannerBurst];
}

id objc_msgSend__rangingInitiatorEnsureStarted(void *a1, const char *a2, ...)
{
  return _[a1 _rangingInitiatorEnsureStarted];
}

id objc_msgSend__rangingInitiatorEnsureStopped(void *a1, const char *a2, ...)
{
  return _[a1 _rangingInitiatorEnsureStopped];
}

id objc_msgSend__rangingRemoveDevice_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_rangingRemoveDevice:");
}

id objc_msgSend__rangingResponderEnsureStopped(void *a1, const char *a2, ...)
{
  return _[a1 _rangingResponderEnsureStopped];
}

id objc_msgSend__rangingResponderUpdate(void *a1, const char *a2, ...)
{
  return _[a1 _rangingResponderUpdate];
}

id objc_msgSend__rangingResponderUpdateForAirDropChange(void *a1, const char *a2, ...)
{
  return _[a1 _rangingResponderUpdateForAirDropChange];
}

id objc_msgSend__rangingUpdateForDevice_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_rangingUpdateForDevice:");
}

id objc_msgSend__reachabilityEnsureStarted(void *a1, const char *a2, ...)
{
  return _[a1 _reachabilityEnsureStarted];
}

id objc_msgSend__reachabilityEnsureStopped(void *a1, const char *a2, ...)
{
  return _[a1 _reachabilityEnsureStopped];
}

id objc_msgSend__receivedCameraCapabilitiesMessage_fromDevice_isFirstUpdate_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_receivedCameraCapabilitiesMessage:fromDevice:isFirstUpdate:");
}

id objc_msgSend__receivedCameraExitEvent_from_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_receivedCameraExitEvent:from:");
}

id objc_msgSend__receivedEventID_event_options_sessionID_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_receivedEventID:event:options:sessionID:");
}

id objc_msgSend__receivedEventID_event_options_unauth_cnx_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_receivedEventID:event:options:unauth:cnx:");
}

id objc_msgSend__receivedEventID_event_options_xpcCnx_sessionID_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_receivedEventID:event:options:xpcCnx:sessionID:");
}

id objc_msgSend__receivedEventID_onXPCCnx_event_options_unauth_rpCnx_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_receivedEventID:onXPCCnx:event:options:unauth:rpCnx:");
}

id objc_msgSend__receivedFamilyIdentityFrameType_ptr_length_msgCtx_(void *a1, const char *a2, ...)
{
  return [a1 _receivedFamilyIdentityFrameType:ptr:length:msgCtx:];
}

id objc_msgSend__receivedFriendIdentityFrameType_ptr_length_msgCtx_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_receivedFriendIdentityFrameType:ptr:length:msgCtx:");
}

id objc_msgSend__receivedRequestID_onXPCCnx_request_options_responseHandler_unauth_rpCnx_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_receivedRequestID:onXPCCnx:request:options:responseHandler:unauth:rpCnx:");
}

id objc_msgSend__receivedRequestID_request_options_responseHandler_sessionID_(void *a1, const char *a2, ...)
{
  return [a1 _receivedRequestID:request:options:responseHandler:sessionID:];
}

id objc_msgSend__receivedRequestID_request_options_responseHandler_unauth_cnx_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_receivedRequestID:request:options:responseHandler:unauth:cnx:");
}

id objc_msgSend__receivedRequestID_request_options_responseHandler_xpcCnx_sessionID_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_receivedRequestID:request:options:responseHandler:xpcCnx:sessionID:");
}

id objc_msgSend__receivedWatchIdentityFrameType_ptr_length_fromID_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_receivedWatchIdentityFrameType:ptr:length:fromID:");
}

id objc_msgSend__receivedWatchIdentityRequest_fromIDSDevice_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_receivedWatchIdentityRequest:fromIDSDevice:");
}

id objc_msgSend__receivedWatchIdentityResponse_fromIDSDevice_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_receivedWatchIdentityResponse:fromIDSDevice:");
}

id objc_msgSend__regenerateSelfIdentity_(void *a1, const char *a2, ...)
{
  return [a1 _regenerateSelfIdentity:];
}

id objc_msgSend__registerConnectionRequestID_options_handler_(void *a1, const char *a2, ...)
{
  return [a1 _registerConnectionRequestID:x0 options:x1 handler:x2];
}

id objc_msgSend__registerForCameraCapabilitiesRequest(void *a1, const char *a2, ...)
{
  return _[a1 _registerForCameraCapabilitiesRequest];
}

id objc_msgSend__registerForWombatStateNotifications(void *a1, const char *a2, ...)
{
  return _[a1 _registerForWombatStateNotifications];
}

id objc_msgSend__releasePowerAssertion(void *a1, const char *a2, ...)
{
  return _[a1 _releasePowerAssertion];
}

id objc_msgSend__remoteObjectInterface(void *a1, const char *a2, ...)
{
  return _[a1 _remoteObjectInterface];
}

id objc_msgSend__remoteObjectProxy(void *a1, const char *a2, ...)
{
  return _[a1 _remoteObjectProxy];
}

id objc_msgSend__removeApplicationPID_(void *a1, const char *a2, ...)
{
  return [a1 _removeApplicationPID:];
}

id objc_msgSend__removeSameAccountIdentityWithIDSIdentifier_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_removeSameAccountIdentityWithIDSIdentifier:error:");
}

id objc_msgSend__removeSelfIdentityPublicWithPrivateIdentity_(void *a1, const char *a2, ...)
{
  return [a1 _removeSelfIdentityPublicWithPrivateIdentity:];
}

id objc_msgSend__reportXPCMatchingDiscoveryCLink(void *a1, const char *a2, ...)
{
  return _[a1 _reportXPCMatchingDiscoveryCLink];
}

id objc_msgSend__reportXPCMatchingDiscoveryCompanionAuthenticationDevice_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_reportXPCMatchingDiscoveryCompanionAuthenticationDevice:");
}

id objc_msgSend__reportXPCMatchingDiscoveryUINoteDevice_(void *a1, const char *a2, ...)
{
  return [a1 _reportXPCMatchingDiscoveryUINoteDevice:];
}

id objc_msgSend__requestCameraCapabilitiesForDevice_(void *a1, const char *a2, ...)
{
  return [a1 _requestCameraCapabilitiesForDevice:];
}

id objc_msgSend__requestConfirmationFromDevice_forDedicated_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_requestConfirmationFromDevice:forDedicated:");
}

id objc_msgSend__requestConfirmationFromDevicesMatching_forDedicated_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_requestConfirmationFromDevicesMatching:forDedicated:");
}

id objc_msgSend__requestConfirmationFromPerson_forDedicated_(void *a1, const char *a2, ...)
{
  return [a1 _requestConfirmationFromPerson:forDedicated:];
}

id objc_msgSend__requestMessageMetadata(void *a1, const char *a2, ...)
{
  return _[a1 _requestMessageMetadata];
}

id objc_msgSend__resetFriends(void *a1, const char *a2, ...)
{
  return _[a1 _resetFriends];
}

id objc_msgSend__rssiThresholdForApplicationService_(void *a1, const char *a2, ...)
{
  return [a1 _rssiThresholdForApplicationService:];
}

id objc_msgSend__saveSelfIdentityPrivate_(void *a1, const char *a2, ...)
{
  return [a1 _saveSelfIdentityPrivate:];
}

id objc_msgSend__saveSelfIdentityPublicWithPrivateIdentity_force_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_saveSelfIdentityPublicWithPrivateIdentity:force:");
}

id objc_msgSend__scheduleCameraCapabilitiesRequest_interval_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_scheduleCameraCapabilitiesRequest:interval:");
}

id objc_msgSend__schedulePendingLostBLEDeviceTimer(void *a1, const char *a2, ...)
{
  return _[a1 _schedulePendingLostBLEDeviceTimer];
}

id objc_msgSend__schedulePendingLostDeviceTimer(void *a1, const char *a2, ...)
{
  return _[a1 _schedulePendingLostDeviceTimer];
}

id objc_msgSend__schedulePendingLostNeedsCLinkDeviceTimer(void *a1, const char *a2, ...)
{
  return _[a1 _schedulePendingLostNeedsCLinkDeviceTimer];
}

id objc_msgSend__selfIdentity(void *a1, const char *a2, ...)
{
  return _[a1 _selfIdentity];
}

id objc_msgSend__sendCameraCapabilitiesUpdateEventForDevice_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_sendCameraCapabilitiesUpdateEventForDevice:");
}

id objc_msgSend__sendCloudIdentityFrameType_destinationID_flags_msgCtx_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_sendCloudIdentityFrameType:destinationID:flags:msgCtx:");
}

id objc_msgSend__sendConfirmationCancelToAllDevices(void *a1, const char *a2, ...)
{
  return _[a1 _sendConfirmationCancelToAllDevices];
}

id objc_msgSend__sendDiscoverySessionExitWithReason_(void *a1, const char *a2, ...)
{
  return [a1 _sendDiscoverySessionExitWithReason:];
}

id objc_msgSend__sendProxyDeviceUpdateToPeer_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_sendProxyDeviceUpdateToPeer:");
}

id objc_msgSend__serverBLEClientConnectionShouldStart(void *a1, const char *a2, ...)
{
  return _[a1 _serverBLEClientConnectionShouldStart];
}

id objc_msgSend__serverBLEDiscoveryEnsureStarted(void *a1, const char *a2, ...)
{
  return _[a1 _serverBLEDiscoveryEnsureStarted];
}

id objc_msgSend__serverBLEDiscoveryEnsureStopped(void *a1, const char *a2, ...)
{
  return _[a1 _serverBLEDiscoveryEnsureStopped];
}

id objc_msgSend__serverBLEDiscoveryShouldStart(void *a1, const char *a2, ...)
{
  return _[a1 _serverBLEDiscoveryShouldStart];
}

id objc_msgSend__serverBLENearbyActionAdvertiserEnsureStarted(void *a1, const char *a2, ...)
{
  return _[a1 _serverBLENearbyActionAdvertiserEnsureStarted];
}

id objc_msgSend__serverBLENearbyActionAdvertiserEnsureStopped(void *a1, const char *a2, ...)
{
  return _[a1 _serverBLENearbyActionAdvertiserEnsureStopped];
}

id objc_msgSend__serverBLENearbyActionAdvertiserRestartTimer(void *a1, const char *a2, ...)
{
  return _[a1 _serverBLENearbyActionAdvertiserRestartTimer];
}

id objc_msgSend__serverBLENearbyActionAdvertiserShouldRun(void *a1, const char *a2, ...)
{
  return _[a1 _serverBLENearbyActionAdvertiserShouldRun];
}

id objc_msgSend__serverBLENearbyActionDiscoveryEnsureStarted(void *a1, const char *a2, ...)
{
  return _[a1 _serverBLENearbyActionDiscoveryEnsureStarted];
}

id objc_msgSend__serverBLENearbyActionDiscoveryEnsureStopped(void *a1, const char *a2, ...)
{
  return _[a1 _serverBLENearbyActionDiscoveryEnsureStopped];
}

id objc_msgSend__serverBLENearbyActionDiscoveryShouldRun(void *a1, const char *a2, ...)
{
  return _[a1 _serverBLENearbyActionDiscoveryShouldRun];
}

id objc_msgSend__serverBLENearbyActionV2DiscoveryEnsureStarted(void *a1, const char *a2, ...)
{
  return _[a1 _serverBLENearbyActionV2DiscoveryEnsureStarted];
}

id objc_msgSend__serverBLENearbyActionV2DiscoveryEnsureStopped(void *a1, const char *a2, ...)
{
  return _[a1 _serverBLENearbyActionV2DiscoveryEnsureStopped];
}

id objc_msgSend__serverBLENearbyActionV2DiscoveryShouldRun(void *a1, const char *a2, ...)
{
  return _[a1 _serverBLENearbyActionV2DiscoveryShouldRun];
}

id objc_msgSend__serverBLENearbyInfoDiscoveryEnsureStarted(void *a1, const char *a2, ...)
{
  return _[a1 _serverBLENearbyInfoDiscoveryEnsureStarted];
}

id objc_msgSend__serverBLENearbyInfoDiscoveryEnsureStopped(void *a1, const char *a2, ...)
{
  return _[a1 _serverBLENearbyInfoDiscoveryEnsureStopped];
}

id objc_msgSend__serverBLENearbyInfoDiscoveryShouldRun(void *a1, const char *a2, ...)
{
  return _[a1 _serverBLENearbyInfoDiscoveryShouldRun];
}

id objc_msgSend__serverBLENeedsAWDLScannerEnsureStarted(void *a1, const char *a2, ...)
{
  return _[a1 _serverBLENeedsAWDLScannerEnsureStarted];
}

id objc_msgSend__serverBLENeedsAWDLScannerEnsureStopped(void *a1, const char *a2, ...)
{
  return _[a1 _serverBLENeedsAWDLScannerEnsureStopped];
}

id objc_msgSend__serverBLENeedsAWDLScannerScreenOff(void *a1, const char *a2, ...)
{
  return _[a1 _serverBLENeedsAWDLScannerScreenOff];
}

id objc_msgSend__serverBLENeedsCLinkScannerEnsureStarted(void *a1, const char *a2, ...)
{
  return _[a1 _serverBLENeedsCLinkScannerEnsureStarted];
}

id objc_msgSend__serverBLENeedsCLinkScannerEnsureStopped(void *a1, const char *a2, ...)
{
  return _[a1 _serverBLENeedsCLinkScannerEnsureStopped];
}

id objc_msgSend__serverBLENeedsCLinkScannerScreenOff(void *a1, const char *a2, ...)
{
  return _[a1 _serverBLENeedsCLinkScannerScreenOff];
}

id objc_msgSend__serverBTAddressMonitorEnsureStarted(void *a1, const char *a2, ...)
{
  return _[a1 _serverBTAddressMonitorEnsureStarted];
}

id objc_msgSend__serverBTAddressMonitorEnsureStopped(void *a1, const char *a2, ...)
{
  return _[a1 _serverBTAddressMonitorEnsureStopped];
}

id objc_msgSend__serverBonjourAWDLAdvertiserEnsureStarted(void *a1, const char *a2, ...)
{
  return _[a1 _serverBonjourAWDLAdvertiserEnsureStarted];
}

id objc_msgSend__serverBonjourAWDLAdvertiserEnsureStopped(void *a1, const char *a2, ...)
{
  return _[a1 _serverBonjourAWDLAdvertiserEnsureStopped];
}

id objc_msgSend__serverBonjourAWDLAdvertiserShouldRun(void *a1, const char *a2, ...)
{
  return _[a1 _serverBonjourAWDLAdvertiserShouldRun];
}

id objc_msgSend__serverBonjourAWDLAdvertiserUpdateTXT(void *a1, const char *a2, ...)
{
  return _[a1 _serverBonjourAWDLAdvertiserUpdateTXT];
}

id objc_msgSend__serverBonjourAWDLNeeded(void *a1, const char *a2, ...)
{
  return _[a1 _serverBonjourAWDLNeeded];
}

id objc_msgSend__serverBonjourAWDLShouldRun(void *a1, const char *a2, ...)
{
  return _[a1 _serverBonjourAWDLShouldRun];
}

id objc_msgSend__serverBonjourAuthTagString(void *a1, const char *a2, ...)
{
  return _[a1 _serverBonjourAuthTagString];
}

id objc_msgSend__serverBonjourAuthTagStringWithData_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_serverBonjourAuthTagStringWithData:");
}

id objc_msgSend__serverBonjourEnsureStarted(void *a1, const char *a2, ...)
{
  return _[a1 _serverBonjourEnsureStarted];
}

id objc_msgSend__serverBonjourEnsureStopped(void *a1, const char *a2, ...)
{
  return _[a1 _serverBonjourEnsureStopped];
}

id objc_msgSend__serverBonjourShouldRun(void *a1, const char *a2, ...)
{
  return _[a1 _serverBonjourShouldRun];
}

id objc_msgSend__serverBonjourTempAuthTagStringWithData_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_serverBonjourTempAuthTagStringWithData:");
}

id objc_msgSend__serverBonjourUpdateTXT(void *a1, const char *a2, ...)
{
  return _[a1 _serverBonjourUpdateTXT];
}

id objc_msgSend__serverDirectLinkInterfaceIndex(void *a1, const char *a2, ...)
{
  return _[a1 _serverDirectLinkInterfaceIndex];
}

id objc_msgSend__serverEnsureStarted(void *a1, const char *a2, ...)
{
  return _[a1 _serverEnsureStarted];
}

id objc_msgSend__serverEnsureStopped(void *a1, const char *a2, ...)
{
  return _[a1 _serverEnsureStopped];
}

id objc_msgSend__serverHandleSessionStartWithID_netCnx_completion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_serverHandleSessionStartWithID:netCnx:completion:");
}

id objc_msgSend__serverNearbyActionV2DiscoveryEnsureStarted(void *a1, const char *a2, ...)
{
  return _[a1 _serverNearbyActionV2DiscoveryEnsureStarted];
}

id objc_msgSend__serverNearbyActionV2DiscoveryEnsureStopped(void *a1, const char *a2, ...)
{
  return _[a1 _serverNearbyActionV2DiscoveryEnsureStopped];
}

id objc_msgSend__serverNearbyActionV2DiscoveryShouldRun(void *a1, const char *a2, ...)
{
  return _[a1 _serverNearbyActionV2DiscoveryShouldRun];
}

id objc_msgSend__serverNearbyInfoV2DeviceFound_deviceFlags_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_serverNearbyInfoV2DeviceFound:deviceFlags:");
}

id objc_msgSend__serverNearbyInfoV2DeviceLost_idsIdentifier_force_deviceFlags_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_serverNearbyInfoV2DeviceLost:idsIdentifier:force:deviceFlags:");
}

id objc_msgSend__serverNearbyInfoV2DiscoveryEnsureStarted(void *a1, const char *a2, ...)
{
  return _[a1 _serverNearbyInfoV2DiscoveryEnsureStarted];
}

id objc_msgSend__serverNearbyInfoV2DiscoveryEnsureStopped(void *a1, const char *a2, ...)
{
  return _[a1 _serverNearbyInfoV2DiscoveryEnsureStopped];
}

id objc_msgSend__serverNearbyInfoV2DiscoveryShouldRun(void *a1, const char *a2, ...)
{
  return _[a1 _serverNearbyInfoV2DiscoveryShouldRun];
}

id objc_msgSend__serverReceivedNeedsAWDLEvent_(void *a1, const char *a2, ...)
{
  return [a1 _serverReceivedNeedsAWDLEvent:];
}

id objc_msgSend__serverReceivedNeedsAWDLEvent_event_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_serverReceivedNeedsAWDLEvent:event:");
}

id objc_msgSend__serverShouldAdvertiseIdentifiableInfoWhenUnpairedForAirPlayWithLinkType_(void *a1, const char *a2, ...)
{
  return [a1 _serverShouldAdvertiseIdentifiableInfoWhenUnpairedForAirPlayWithLinkType:];
}

id objc_msgSend__serverTCPEnsureStarted(void *a1, const char *a2, ...)
{
  return _[a1 _serverTCPEnsureStarted];
}

id objc_msgSend__serverTCPEnsureStopped(void *a1, const char *a2, ...)
{
  return _[a1 _serverTCPEnsureStopped];
}

id objc_msgSend__serverTCPHandleConnectionEnded_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_serverTCPHandleConnectionEnded:");
}

id objc_msgSend__serverTCPHandleConnectionStarted_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_serverTCPHandleConnectionStarted:");
}

id objc_msgSend__serverTCPHasActiveConnections(void *a1, const char *a2, ...)
{
  return _[a1 _serverTCPHasActiveConnections];
}

id objc_msgSend__serverTCPRemoveConnectionsWithIdentifier_exceptConnection_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_serverTCPRemoveConnectionsWithIdentifier:exceptConnection:");
}

id objc_msgSend__sessionHandlePeerDisconnect_(void *a1, const char *a2, ...)
{
  return [a1 _sessionHandlePeerDisconnect:];
}

id objc_msgSend__sessionsActiveOnConnection_xpcConnection_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_sessionsActiveOnConnection:xpcConnection:");
}

id objc_msgSend__setQueue_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_setQueue:");
}

id objc_msgSend__setupHIDGCDeviceWithOptions_andReturnError_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_setupHIDGCDeviceWithOptions:andReturnError:");
}

id objc_msgSend__setupHIDGCSenderIDIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 _setupHIDGCSenderIDIfNeeded];
}

id objc_msgSend__setupHIDSenderIDIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 _setupHIDSenderIDIfNeeded];
}

id objc_msgSend__setupHIDTouchDeviceAndReturnError_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_setupHIDTouchDeviceAndReturnError:");
}

id objc_msgSend__setupHome(void *a1, const char *a2, ...)
{
  return _[a1 _setupHome];
}

id objc_msgSend__shouldReceiveActivityLevelOverWiFi_(void *a1, const char *a2, ...)
{
  return [a1 _shouldReceiveActivityLevelOverWiFi:];
}

id objc_msgSend__shouldSendActivityLevelOverWiFi(void *a1, const char *a2, ...)
{
  return _[a1 _shouldSendActivityLevelOverWiFi];
}

id objc_msgSend__shouldThrottleFriendSyncing(void *a1, const char *a2, ...)
{
  return _[a1 _shouldThrottleFriendSyncing];
}

id objc_msgSend__showContinuityCameraDisabledAlert(void *a1, const char *a2, ...)
{
  return _[a1 _showContinuityCameraDisabledAlert];
}

id objc_msgSend__signatureWithSelfIdentity_data_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_signatureWithSelfIdentity:data:");
}

id objc_msgSend__siriEnsureStarted(void *a1, const char *a2, ...)
{
  return _[a1 _siriEnsureStarted];
}

id objc_msgSend__siriEnsureStopped(void *a1, const char *a2, ...)
{
  return _[a1 _siriEnsureStopped];
}

id objc_msgSend__sleepSystemWithResponseHandler_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_sleepSystemWithResponseHandler:");
}

id objc_msgSend__startBecomeInitiatorTimer(void *a1, const char *a2, ...)
{
  return _[a1 _startBecomeInitiatorTimer];
}

id objc_msgSend__startDiscoverySessionExpirationTimer(void *a1, const char *a2, ...)
{
  return _[a1 _startDiscoverySessionExpirationTimer];
}

id objc_msgSend__startInSessionDeviceLostTimer(void *a1, const char *a2, ...)
{
  return _[a1 _startInSessionDeviceLostTimer];
}

id objc_msgSend__startInitiator(void *a1, const char *a2, ...)
{
  return _[a1 _startInitiator];
}

id objc_msgSend__startInitiatorLimitTimer(void *a1, const char *a2, ...)
{
  return _[a1 _startInitiatorLimitTimer];
}

id objc_msgSend__startObservingOnenessEnabledState(void *a1, const char *a2, ...)
{
  return _[a1 _startObservingOnenessEnabledState];
}

id objc_msgSend__startPairingServerWithPassword_completion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_startPairingServerWithPassword:completion:");
}

id objc_msgSend__startPollingCoolDownTimer(void *a1, const char *a2, ...)
{
  return _[a1 _startPollingCoolDownTimer];
}

id objc_msgSend__startReceiver(void *a1, const char *a2, ...)
{
  return _[a1 _startReceiver];
}

id objc_msgSend__startTransactionControllerIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 _startTransactionControllerIfNeeded];
}

id objc_msgSend__stationaryDevice(void *a1, const char *a2, ...)
{
  return _[a1 _stationaryDevice];
}

id objc_msgSend__stereoDeviceUpdate_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_stereoDeviceUpdate:");
}

id objc_msgSend__stopBecomeInitiatorTimer(void *a1, const char *a2, ...)
{
  return _[a1 _stopBecomeInitiatorTimer];
}

id objc_msgSend__stopConnectToReceiverTimer(void *a1, const char *a2, ...)
{
  return _[a1 _stopConnectToReceiverTimer];
}

id objc_msgSend__stopInitiator(void *a1, const char *a2, ...)
{
  return _[a1 _stopInitiator];
}

id objc_msgSend__stopInitiatorLimitTimer(void *a1, const char *a2, ...)
{
  return _[a1 _stopInitiatorLimitTimer];
}

id objc_msgSend__stopObservingOnenessEnabledState(void *a1, const char *a2, ...)
{
  return _[a1 _stopObservingOnenessEnabledState];
}

id objc_msgSend__stopPollingCoolDownTimer(void *a1, const char *a2, ...)
{
  return _[a1 _stopPollingCoolDownTimer];
}

id objc_msgSend__stopReceiver(void *a1, const char *a2, ...)
{
  return _[a1 _stopReceiver];
}

id objc_msgSend__stopTimers(void *a1, const char *a2, ...)
{
  return _[a1 _stopTimers];
}

id objc_msgSend__stopTransactionControllerIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 _stopTransactionControllerIfNeeded];
}

id objc_msgSend__stripFZIDPrefix(void *a1, const char *a2, ...)
{
  return _[a1 _stripFZIDPrefix];
}

id objc_msgSend__supportsApplicationLabel_(void *a1, const char *a2, ...)
{
  return [a1 _supportsApplicationLabel:];
}

id objc_msgSend__transportServiceMetadataWithServiceType_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_transportServiceMetadataWithServiceType:");
}

id objc_msgSend__triggerKeychainRefetch(void *a1, const char *a2, ...)
{
  return _[a1 _triggerKeychainRefetch];
}

id objc_msgSend__unregisterWombatStateNotifications(void *a1, const char *a2, ...)
{
  return _[a1 _unregisterWombatStateNotifications];
}

id objc_msgSend__update(void *a1, const char *a2, ...)
{
  return _[a1 _update];
}

id objc_msgSend__updateAssertions(void *a1, const char *a2, ...)
{
  return _[a1 _updateAssertions];
}

id objc_msgSend__updateCameraCapabilities(void *a1, const char *a2, ...)
{
  return _[a1 _updateCameraCapabilities];
}

id objc_msgSend__updateErrorFlags(void *a1, const char *a2, ...)
{
  return _[a1 _updateErrorFlags];
}

id objc_msgSend__updateFamilyAccounts(void *a1, const char *a2, ...)
{
  return _[a1 _updateFamilyAccounts];
}

id objc_msgSend__updateFamilyDevices(void *a1, const char *a2, ...)
{
  return _[a1 _updateFamilyDevices];
}

id objc_msgSend__updateFamilyIdentities(void *a1, const char *a2, ...)
{
  return _[a1 _updateFamilyIdentities];
}

id objc_msgSend__updateFamilyIdentityWithFamilyMember_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_updateFamilyIdentityWithFamilyMember:");
}

id objc_msgSend__updateFamilyNotification(void *a1, const char *a2, ...)
{
  return _[a1 _updateFamilyNotification];
}

id objc_msgSend__updateFamilySyncing(void *a1, const char *a2, ...)
{
  return _[a1 _updateFamilySyncing];
}

id objc_msgSend__updateForXPCClientChange(void *a1, const char *a2, ...)
{
  return _[a1 _updateForXPCClientChange];
}

id objc_msgSend__updateForXPCServerChange(void *a1, const char *a2, ...)
{
  return _[a1 _updateForXPCServerChange];
}

id objc_msgSend__updateFriendAccounts(void *a1, const char *a2, ...)
{
  return _[a1 _updateFriendAccounts];
}

id objc_msgSend__updateFriendDevices(void *a1, const char *a2, ...)
{
  return _[a1 _updateFriendDevices];
}

id objc_msgSend__updateFriendIdentities(void *a1, const char *a2, ...)
{
  return _[a1 _updateFriendIdentities];
}

id objc_msgSend__updateFriendIdentityWithAppleID_contactID_sendersKnownAlias_userAdded_updateDateRequested_suggestedContactIDs_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_updateFriendIdentityWithAppleID:contactID:sendersKnownAlias:userAdded:updateDateRequested:suggestedContactIDs:");
}

id objc_msgSend__updateFriendPrivacy(void *a1, const char *a2, ...)
{
  return _[a1 _updateFriendPrivacy];
}

id objc_msgSend__updateFriendPrivacyResults_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_updateFriendPrivacyResults:");
}

id objc_msgSend__updateFriendSyncing(void *a1, const char *a2, ...)
{
  return _[a1 _updateFriendSyncing];
}

id objc_msgSend__updateIdentityType_idsDeviceID_appleID_contactID_msg_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_updateIdentityType:idsDeviceID:appleID:contactID:msg:");
}

id objc_msgSend__updateNearFieldDiscoveryPref(void *a1, const char *a2, ...)
{
  return _[a1 _updateNearFieldDiscoveryPref];
}

id objc_msgSend__updateOptionsWithProcessInfo_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_updateOptionsWithProcessInfo:");
}

id objc_msgSend__updatePairedDeviceIdentities(void *a1, const char *a2, ...)
{
  return _[a1 _updatePairedDeviceIdentities];
}

id objc_msgSend__updatePersonalRequestsStateForHomeHubDevices(void *a1, const char *a2, ...)
{
  return _[a1 _updatePersonalRequestsStateForHomeHubDevices];
}

id objc_msgSend__updatePolling(void *a1, const char *a2, ...)
{
  return _[a1 _updatePolling];
}

id objc_msgSend__updateRBSProcessMonitor(void *a1, const char *a2, ...)
{
  return _[a1 _updateRBSProcessMonitor];
}

id objc_msgSend__updateSameAccountIdentities(void *a1, const char *a2, ...)
{
  return _[a1 _updateSameAccountIdentities];
}

id objc_msgSend__updateSelfIdentityPrivate_create_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_updateSelfIdentityPrivate:create:");
}

id objc_msgSend__updateSelfIdentityPublic_privateIdentity_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_updateSelfIdentityPublic:privateIdentity:");
}

id objc_msgSend__updateXPCMatchingDiscovery(void *a1, const char *a2, ...)
{
  return _[a1 _updateXPCMatchingDiscovery];
}

id objc_msgSend__wakeSystemWithResponseHandler_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_wakeSystemWithResponseHandler:");
}

id objc_msgSend__xpcConnectionInvalidated_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_xpcConnectionInvalidated:");
}

id objc_msgSend__xpcConnections_withControlFlags_(void *a1, const char *a2, ...)
{
  return [a1 _xpcConnections:withControlFlags:];
}

id objc_msgSend__xpcPublisherAddToken_event_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_xpcPublisherAddToken:event:");
}

id objc_msgSend__xpcPublisherRemoveToken_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_xpcPublisherRemoveToken:");
}

id objc_msgSend__xpcPublisherStateChangedForToken_state_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_xpcPublisherStateChangedForToken:state:");
}

id objc_msgSend__xpcPublisherTriggeredToken_payload_responseHandler_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_xpcPublisherTriggeredToken:payload:responseHandler:")];
}

id objc_msgSend_accessories(void *a1, const char *a2, ...)
{
  return _[a1 accessories];
}

id objc_msgSend_accessory(void *a1, const char *a2, ...)
{
  return _[a1 accessory];
}

id objc_msgSend_accessoryWithSiriEndpointIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 accessoryWithSiriEndpointIdentifier:];
}

id objc_msgSend_accountAltDSID(void *a1, const char *a2, ...)
{
  return _[a1 accountAltDSID];
}

id objc_msgSend_accountID(void *a1, const char *a2, ...)
{
  return _[a1 accountID];
}

id objc_msgSend_accounts(void *a1, const char *a2, ...)
{
  return _[a1 accounts];
}

id objc_msgSend_acquireWithError_(void *a1, const char *a2, ...)
{
  return [a1 acquireWithError:];
}

id objc_msgSend_actionV2Devices(void *a1, const char *a2, ...)
{
  return _[a1 actionV2Devices];
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return _[a1 activate];
}

id objc_msgSend_activateAndReturnError_(void *a1, const char *a2, ...)
{
  return [a1 activateAndReturnError:];
}

id objc_msgSend_activateDirectAndReturnError_(void *a1, const char *a2, ...)
{
  return [a1 activateDirectAndReturnError:];
}

id objc_msgSend_activateForClient_(void *a1, const char *a2, ...)
{
  return [a1 activateForClient:];
}

id objc_msgSend_activateWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 activateWithCompletion:];
}

id objc_msgSend_activatedAdvertiser(void *a1, const char *a2, ...)
{
  return _[a1 activatedAdvertiser];
}

id objc_msgSend_activatedDiscovery(void *a1, const char *a2, ...)
{
  return _[a1 activatedDiscovery];
}

id objc_msgSend_activatedServer(void *a1, const char *a2, ...)
{
  return _[a1 activatedServer];
}

id objc_msgSend_activatedSession(void *a1, const char *a2, ...)
{
  return _[a1 activatedSession];
}

id objc_msgSend_activeNetCnx(void *a1, const char *a2, ...)
{
  return _[a1 activeNetCnx];
}

id objc_msgSend_activeServers(void *a1, const char *a2, ...)
{
  return _[a1 activeServers];
}

id objc_msgSend_activityFromToken_(void *a1, const char *a2, ...)
{
  return [a1 activityFromToken:];
}

id objc_msgSend_activityLevel(void *a1, const char *a2, ...)
{
  return _[a1 activityLevel];
}

id objc_msgSend_adHocPairingIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 adHocPairingIdentifier];
}

id objc_msgSend_addAgentClient(void *a1, const char *a2, ...)
{
  return _[a1 addAgentClient];
}

id objc_msgSend_addConnection_(void *a1, const char *a2, ...)
{
  return [a1 addConnection:];
}

id objc_msgSend_addDeviceToApplicationServiceMapping_device_completion_(void *a1, const char *a2, ...)
{
  return [a1 addDeviceToApplicationServiceMapping:device:completion:];
}

id objc_msgSend_addDiscoveryType_(void *a1, const char *a2, ...)
{
  return [a1 addDiscoveryType:];
}

id objc_msgSend_addEndpointMapping_endpointID_applicationService_discoverySessionID_(void *a1, const char *a2, ...)
{
  return [a1 addEndpointMapping:endpointID:applicationService:discoverySessionID:];
}

id objc_msgSend_addEndpointMapping_endpointID_applicationService_discoverySessionID_shouldAutomapListener_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "addEndpointMapping:endpointID:applicationService:discoverySessionID:shouldAutomapListener:");
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return [a1 addEntriesFromDictionary:];
}

id objc_msgSend_addInUseProcess_(void *a1, const char *a2, ...)
{
  return [a1 addInUseProcess:];
}

id objc_msgSend_addIncomingConnection_(void *a1, const char *a2, ...)
{
  return [a1 addIncomingConnection:];
}

id objc_msgSend_addListenerAgentClient_(void *a1, const char *a2, ...)
{
  return [a1 addListenerAgentClient:];
}

id objc_msgSend_addMappingForDevice_endpointID_(void *a1, const char *a2, ...)
{
  return [a1 addMappingForDevice:endpointID:];
}

id objc_msgSend_addNeedsAWDLPeer_(void *a1, const char *a2, ...)
{
  return [a1 addNeedsAWDLPeer:];
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return [a1 addObject:];
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return [a1 addObjectsFromArray:];
}

id objc_msgSend_addObserver_forKeyPath_options_context_(void *a1, const char *a2, ...)
{
  return [a1 addObserver:forKeyPath:options:context:];
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return [a1 addObserver:x0 selector:x1 name:x2 object:x3];
}

id objc_msgSend_addOrUpdateAdHocPairedIdentity_(void *a1, const char *a2, ...)
{
  return [a1 addOrUpdateAdHocPairedIdentity:];
}

id objc_msgSend_addOrUpdateAdHocPairedIdentity_error_(void *a1, const char *a2, ...)
{
  return [a1 addOrUpdateAdHocPairedIdentity:error];
}

id objc_msgSend_addOrUpdateIdentity_error_(void *a1, const char *a2, ...)
{
  return [a1 addOrUpdateIdentity:error:];
}

id objc_msgSend_addOrUpdateOrReAddItem_logCategory_logLabel_error_(void *a1, const char *a2, ...)
{
  return [a1 addOrUpdateOrReAddItem:logCategory:logLabel:error:];
}

id objc_msgSend_addPolicy_(void *a1, const char *a2, ...)
{
  return [a1 addPolicy:];
}

id objc_msgSend_addSample_(void *a1, const char *a2, ...)
{
  return [a1 addSample:];
}

id objc_msgSend_addSelfIdentityInfoToMessage_flags_(void *a1, const char *a2, ...)
{
  return [a1 addSelfIdentityInfoToMessage:flags:];
}

id objc_msgSend_addSession_(void *a1, const char *a2, ...)
{
  return [a1 addSession:];
}

id objc_msgSend_addXPCMatchingToken_event_handler_(void *a1, const char *a2, ...)
{
  return [a1 addXPCMatchingToken:event:handler:];
}

id objc_msgSend_advertiseDescriptor(void *a1, const char *a2, ...)
{
  return _[a1 advertiseDescriptor];
}

id objc_msgSend_advertiseDeviceName(void *a1, const char *a2, ...)
{
  return _[a1 advertiseDeviceName];
}

id objc_msgSend_advertisementData(void *a1, const char *a2, ...)
{
  return _[a1 advertisementData];
}

id objc_msgSend_advertisementFields(void *a1, const char *a2, ...)
{
  return _[a1 advertisementFields];
}

id objc_msgSend_advertisingAddressDataNonConnectable(void *a1, const char *a2, ...)
{
  return _[a1 advertisingAddressDataNonConnectable];
}

id objc_msgSend_ageOutEndpointMapping_(void *a1, const char *a2, ...)
{
  return [a1 ageOutEndpointMapping:];
}

id objc_msgSend_ageOutListenerTimer(void *a1, const char *a2, ...)
{
  return _[a1 ageOutListenerTimer];
}

id objc_msgSend_ageOutTimeout(void *a1, const char *a2, ...)
{
  return _[a1 ageOutTimeout];
}

id objc_msgSend_agentClient(void *a1, const char *a2, ...)
{
  return _[a1 agentClient];
}

id objc_msgSend_agentClientID(void *a1, const char *a2, ...)
{
  return _[a1 agentClientID];
}

id objc_msgSend_aliasStrings(void *a1, const char *a2, ...)
{
  return _[a1 aliasStrings];
}

id objc_msgSend_allInterfaces(void *a1, const char *a2, ...)
{
  return _[a1 allInterfaces];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _[a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _[a1 allObjects];
}

id objc_msgSend_allUsedSendersKnownAliases(void *a1, const char *a2, ...)
{
  return _[a1 allUsedSendersKnownAliases];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return _[a1 allValues];
}

id objc_msgSend_allowedMACAddresses(void *a1, const char *a2, ...)
{
  return _[a1 allowedMACAddresses];
}

id objc_msgSend_altIRK(void *a1, const char *a2, ...)
{
  return _[a1 altIRK];
}

id objc_msgSend_angelAssertionName(void *a1, const char *a2, ...)
{
  return _[a1 angelAssertionName];
}

id objc_msgSend_angelJobLabel(void *a1, const char *a2, ...)
{
  return _[a1 angelJobLabel];
}

id objc_msgSend_appID(void *a1, const char *a2, ...)
{
  return _[a1 appID];
}

id objc_msgSend_appSignIn(void *a1, const char *a2, ...)
{
  return _[a1 appSignIn];
}

id objc_msgSend_appendBytes_length_(void *a1, const char *a2, ...)
{
  return [a1 appendBytes:x0 length:x1];
}

id objc_msgSend_appendData_(void *a1, const char *a2, ...)
{
  return [a1 appendData:];
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return [a1 appendFormat:];
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return [a1 appendString:];
}

id objc_msgSend_appleID(void *a1, const char *a2, ...)
{
  return _[a1 appleID];
}

id objc_msgSend_applicationLabel(void *a1, const char *a2, ...)
{
  return _[a1 applicationLabel];
}

id objc_msgSend_applicationService(void *a1, const char *a2, ...)
{
  return _[a1 applicationService];
}

id objc_msgSend_apply(void *a1, const char *a2, ...)
{
  return _[a1 apply];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayWithArray_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithArray:];
}

id objc_msgSend_arrayWithObject_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithObject:];
}

id objc_msgSend_arrayWithObjects_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithObjects:];
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithObjects:];
}

id objc_msgSend_assertions(void *a1, const char *a2, ...)
{
  return _[a1 assertions];
}

id objc_msgSend_assistantAccessControlForHome_(void *a1, const char *a2, ...)
{
  return [a1 assistantAccessControlForHome:];
}

id objc_msgSend_attributeWithDomain_name_(void *a1, const char *a2, ...)
{
  return [a1 attributeWithDomain:name:];
}

id objc_msgSend_authTagForData_type_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "authTagForData:type:error:");
}

id objc_msgSend_automapped(void *a1, const char *a2, ...)
{
  return _[a1 automapped];
}

id objc_msgSend_awdlGuestDiscoveryTimeout(void *a1, const char *a2, ...)
{
  return _[a1 awdlGuestDiscoveryTimeout];
}

id objc_msgSend_becomeInitiatorTimer(void *a1, const char *a2, ...)
{
  return _[a1 becomeInitiatorTimer];
}

id objc_msgSend_beginTransaction_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 beginTransaction:completionHandler:];
}

id objc_msgSend_bleAdvertisementData(void *a1, const char *a2, ...)
{
  return _[a1 bleAdvertisementData];
}

id objc_msgSend_bleClientUseCase(void *a1, const char *a2, ...)
{
  return _[a1 bleClientUseCase];
}

id objc_msgSend_bleDevice(void *a1, const char *a2, ...)
{
  return _[a1 bleDevice];
}

id objc_msgSend_bleDeviceAcceptedInvitations(void *a1, const char *a2, ...)
{
  return _[a1 bleDeviceAcceptedInvitations];
}

id objc_msgSend_bleDeviceAddress(void *a1, const char *a2, ...)
{
  return _[a1 bleDeviceAddress];
}

id objc_msgSend_bleDeviceWantingInvitations(void *a1, const char *a2, ...)
{
  return _[a1 bleDeviceWantingInvitations];
}

id objc_msgSend_blePeerIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 blePeerIdentifier];
}

id objc_msgSend_bleScanRate(void *a1, const char *a2, ...)
{
  return _[a1 bleScanRate];
}

id objc_msgSend_bleScanRateScreenOff(void *a1, const char *a2, ...)
{
  return _[a1 bleScanRateScreenOff];
}

id objc_msgSend_bleScreenOffRescanInterval(void *a1, const char *a2, ...)
{
  return _[a1 bleScreenOffRescanInterval];
}

id objc_msgSend_bleScreenOffScanRate(void *a1, const char *a2, ...)
{
  return _[a1 bleScreenOffScanRate];
}

id objc_msgSend_bleTargetData(void *a1, const char *a2, ...)
{
  return _[a1 bleTargetData];
}

id objc_msgSend_bluetoothAddressData(void *a1, const char *a2, ...)
{
  return _[a1 bluetoothAddressData];
}

id objc_msgSend_bonjourDevice(void *a1, const char *a2, ...)
{
  return _[a1 bonjourDevice];
}

id objc_msgSend_bonjourListenerUUID(void *a1, const char *a2, ...)
{
  return _[a1 bonjourListenerUUID];
}

id objc_msgSend_bonjourPeerDevice(void *a1, const char *a2, ...)
{
  return _[a1 bonjourPeerDevice];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_browseClient(void *a1, const char *a2, ...)
{
  return _[a1 browseClient];
}

id objc_msgSend_browseDescriptor(void *a1, const char *a2, ...)
{
  return _[a1 browseDescriptor];
}

id objc_msgSend_browseInvitationScope(void *a1, const char *a2, ...)
{
  return _[a1 browseInvitationScope];
}

id objc_msgSend_browseResponse(void *a1, const char *a2, ...)
{
  return _[a1 browseResponse];
}

id objc_msgSend_browseSession(void *a1, const char *a2, ...)
{
  return _[a1 browseSession];
}

id objc_msgSend_btAddress(void *a1, const char *a2, ...)
{
  return _[a1 btAddress];
}

id objc_msgSend_btAddressData(void *a1, const char *a2, ...)
{
  return _[a1 btAddressData];
}

id objc_msgSend_btIRKData(void *a1, const char *a2, ...)
{
  return _[a1 btIRKData];
}

id objc_msgSend_btPipe(void *a1, const char *a2, ...)
{
  return _[a1 btPipe];
}

id objc_msgSend_btPipeHighPriority(void *a1, const char *a2, ...)
{
  return _[a1 btPipeHighPriority];
}

id objc_msgSend_bundleIdentifiersForMachOUUIDs_error_(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifiersForMachOUUIDs:error:];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return _[a1 bytes];
}

id objc_msgSend_cStringUsingEncoding_(void *a1, const char *a2, ...)
{
  return [a1 cStringUsingEncoding:];
}

id objc_msgSend_cameraCapabilities(void *a1, const char *a2, ...)
{
  return _[a1 cameraCapabilities];
}

id objc_msgSend_cameraCapabilitiesRefetchTimer(void *a1, const char *a2, ...)
{
  return _[a1 cameraCapabilitiesRefetchTimer];
}

id objc_msgSend_cameraCapabilityRequestIsActive(void *a1, const char *a2, ...)
{
  return _[a1 cameraCapabilityRequestIsActive];
}

id objc_msgSend_canDecode128bit(void *a1, const char *a2, ...)
{
  return _[a1 canDecode128bit];
}

id objc_msgSend_canSend(void *a1, const char *a2, ...)
{
  return _[a1 canSend];
}

id objc_msgSend_caseInsensitiveCompare_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "caseInsensitiveCompare:");
}

id objc_msgSend_cbDevice(void *a1, const char *a2, ...)
{
  return _[a1 cbDevice];
}

id objc_msgSend_chFieldType(void *a1, const char *a2, ...)
{
  return _[a1 chFieldType];
}

id objc_msgSend_changeFlags(void *a1, const char *a2, ...)
{
  return _[a1 changeFlags];
}

id objc_msgSend_changed(void *a1, const char *a2, ...)
{
  return _[a1 changed];
}

id objc_msgSend_clearCameraCapabilitiesRefetchTimer(void *a1, const char *a2, ...)
{
  return _[a1 clearCameraCapabilitiesRefetchTimer];
}

id objc_msgSend_client(void *a1, const char *a2, ...)
{
  return _[a1 client];
}

id objc_msgSend_clientDevice_updatedMeasurement_(void *a1, const char *a2, ...)
{
  return [a1 clientDevice:updatedMeasurement:];
}

id objc_msgSend_clientDeviceChanged_changes_(void *a1, const char *a2, ...)
{
  return [a1 clientDeviceChanged:changes];
}

id objc_msgSend_clientDeviceFound_report_(void *a1, const char *a2, ...)
{
  return [a1 clientDeviceFound:report];
}

id objc_msgSend_clientDeviceLost_(void *a1, const char *a2, ...)
{
  return [a1 clientDeviceLost:];
}

id objc_msgSend_clientID(void *a1, const char *a2, ...)
{
  return _[a1 clientID];
}

id objc_msgSend_clientMode(void *a1, const char *a2, ...)
{
  return _[a1 clientMode];
}

id objc_msgSend_clientNetCnx(void *a1, const char *a2, ...)
{
  return _[a1 clientNetCnx];
}

id objc_msgSend_clientPeopleStatusChanged_(void *a1, const char *a2, ...)
{
  return [a1 clientPeopleStatusChanged:];
}

id objc_msgSend_cloudServiceID(void *a1, const char *a2, ...)
{
  return _[a1 cloudServiceID];
}

id objc_msgSend_cnx(void *a1, const char *a2, ...)
{
  return _[a1 cnx];
}

id objc_msgSend_cnxHandler(void *a1, const char *a2, ...)
{
  return _[a1 cnxHandler];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _[a1 code];
}

id objc_msgSend_companionLinkAuthCompleted_(void *a1, const char *a2, ...)
{
  return [a1 companionLinkAuthCompleted:];
}

id objc_msgSend_companionLinkChangedDevice_changes_(void *a1, const char *a2, ...)
{
  return [a1 companionLinkChangedDevice:changes:];
}

id objc_msgSend_companionLinkFoundDevice_(void *a1, const char *a2, ...)
{
  return [a1 companionLinkFoundDevice:];
}

id objc_msgSend_companionLinkHandleDisconnect(void *a1, const char *a2, ...)
{
  return _[a1 companionLinkHandleDisconnect];
}

id objc_msgSend_companionLinkLocalDeviceUpdated_(void *a1, const char *a2, ...)
{
  return [a1 companionLinkLocalDeviceUpdated:];
}

id objc_msgSend_companionLinkLostDevice_(void *a1, const char *a2, ...)
{
  return [a1 companionLinkLostDevice:];
}

id objc_msgSend_companionLinkPromptForPasswordType_flags_throttleSeconds_(void *a1, const char *a2, ...)
{
  return [a1 companionLinkPromptForPasswordType:x0 flags:x1 throttleSeconds:x2];
}

id objc_msgSend_companionLinkReceivedEventID_event_options_(void *a1, const char *a2, ...)
{
  return [a1 companionLinkReceivedEventID:x0 event:x1 options:x2];
}

id objc_msgSend_companionLinkReceivedRequestID_request_options_responseHandler_(void *a1, const char *a2, ...)
{
  return [a1 companionLinkReceivedRequestID:x0 request:x1 options:x2 responseHandler:x3];
}

id objc_msgSend_companionLinkRemoveLocalDeviceAsContextCollector_(void *a1, const char *a2, ...)
{
  return [a1 companionLinkRemoveLocalDeviceAsContextCollector];
}

id objc_msgSend_companionLinkUpdateClientState_(void *a1, const char *a2, ...)
{
  return [a1 companionLinkUpdateClientState:];
}

id objc_msgSend_companionLinkUpdateErrorFlags_(void *a1, const char *a2, ...)
{
  return [a1 companionLinkUpdateErrorFlags:];
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return [a1 compare:];
}

id objc_msgSend_compareWithDeviceIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 compareWithDeviceIdentifier:];
}

id objc_msgSend_compareWithRPIdentity_(void *a1, const char *a2, ...)
{
  return [a1 compareWithRPIdentity:];
}

id objc_msgSend_components(void *a1, const char *a2, ...)
{
  return _[a1 components];
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return [a1 componentsSeparatedByString:];
}

id objc_msgSend_connectToOneAPIPeer_inboundConnection_applicationService_listenerID_automapListener_connectionID_connectHandler_(void *a1, const char *a2, ...)
{
  return [a1 connectToOneAPIPeer:inboundConnection:applicationService:listenerID:automapListener:connectionID:connectHandler:];
}

id objc_msgSend_connectToPeer_inboundConnection_applicationService_listenerID_connectionID_connectHandler_disconnectHandler_(void *a1, const char *a2, ...)
{
  return [a1 connectToPeer:x0 inboundConnection:x1 applicationService:x2 listenerID:x3 connectionID:x4 connectHandler:x5 disconnectHandler:x6];
}

id objc_msgSend_connectToPeer_inboundConnection_controlFlags_applicationService_listenerID_automapListener_connectionID_connectHandler_lostHandler_(void *a1, const char *a2, ...)
{
  return [a1 connectToPeer:x0 inboundConnection:x1 controlFlags:x2 applicationService:x3 listenerID:x4 automapListener:x5 connectionID:x6 connectHandler:x7 lostHandler:x8];
}

id objc_msgSend_connectToReceiverTimer(void *a1, const char *a2, ...)
{
  return _[a1 connectToReceiverTimer];
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return _[a1 connection];
}

id objc_msgSend_connectionDate(void *a1, const char *a2, ...)
{
  return _[a1 connectionDate];
}

id objc_msgSend_connectionHandoverRequest(void *a1, const char *a2, ...)
{
  return _[a1 connectionHandoverRequest];
}

id objc_msgSend_connectionHandoverSelect(void *a1, const char *a2, ...)
{
  return _[a1 connectionHandoverSelect];
}

id objc_msgSend_connectionInvalidated(void *a1, const char *a2, ...)
{
  return _[a1 connectionInvalidated];
}

id objc_msgSend_connectionInvalidatedCore(void *a1, const char *a2, ...)
{
  return _[a1 connectionInvalidatedCore];
}

id objc_msgSend_connectionUUID(void *a1, const char *a2, ...)
{
  return _[a1 connectionUUID];
}

id objc_msgSend_contactID(void *a1, const char *a2, ...)
{
  return _[a1 contactID];
}

id objc_msgSend_contactIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 contactIdentifier];
}

id objc_msgSend_containsInUseProcess_(void *a1, const char *a2, ...)
{
  return [a1 containsInUseProcess:];
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return [a1 containsObject:];
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return [a1 containsString:];
}

id objc_msgSend_containsValueForKey_(void *a1, const char *a2, ...)
{
  return [a1 containsValueForKey:];
}

id objc_msgSend_continuityCaptureCameraCapabilities(void *a1, const char *a2, ...)
{
  return _[a1 continuityCaptureCameraCapabilities];
}

id objc_msgSend_controlCodeToString_(void *a1, const char *a2, ...)
{
  return [a1 controlCodeToString:];
}

id objc_msgSend_controlFlags(void *a1, const char *a2, ...)
{
  return _[a1 controlFlags];
}

id objc_msgSend_controlObject_(void *a1, const char *a2, ...)
{
  return [a1 controlObject:];
}

id objc_msgSend_convertBrowseParamsToControlFlags_(void *a1, const char *a2, ...)
{
  return [a1 convertBrowseParamsToControlFlags:];
}

id objc_msgSend_convertBrowseScopeToControlFlags_(void *a1, const char *a2, ...)
{
  return [a1 convertBrowseScopeToControlFlags:];
}

id objc_msgSend_convertConnectionParametersToControlFlags_(void *a1, const char *a2, ...)
{
  return [a1 convertConnectionParametersToControlFlags:];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_copyItemMatchingItem_flags_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "copyItemMatchingItem:flags:error:");
}

id objc_msgSend_copyItemsMatchingItem_flags_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "copyItemsMatchingItem:flags:error:");
}

id objc_msgSend_copyMyAppleIDAndReturnError_(void *a1, const char *a2, ...)
{
  return [a1 copyMyAppleIDAndReturnError:];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return [a1 countByEnumeratingWithState:x0 objects:x1 count:x2];
}

id objc_msgSend_countForObject_(void *a1, const char *a2, ...)
{
  return [a1 countForObject:];
}

id objc_msgSend_createAuthenticationPayloadWithPkData_bonjourListenerUUID_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "createAuthenticationPayloadWithPkData:bonjourListenerUUID:");
}

id objc_msgSend_createBrowseAgent(void *a1, const char *a2, ...)
{
  return _[a1 createBrowseAgent];
}

id objc_msgSend_createConnectionFramer_assign_local_remote_incomingConnection_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "createConnectionFramer:assign:local:remote:incomingConnection:");
}

id objc_msgSend_createDeviceToEndpointMappingForDeviceID_endpointUUID_error_(void *a1, const char *a2, ...)
{
  return [a1 createDeviceToEndpointMappingForDeviceID:endpointUUID:error:];
}

id objc_msgSend_createListenerFramer_(void *a1, const char *a2, ...)
{
  return [a1 createListenerFramer:];
}

id objc_msgSend_createNWEndpointForEndpoint_agentID_applicationService_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "createNWEndpointForEndpoint:agentID:applicationService:");
}

id objc_msgSend_createNWEndpointWithID_agentID_applicationService_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "createNWEndpointWithID:agentID:applicationService:");
}

id objc_msgSend_createNearbyInvitationConnectionFramer_assign_local_remote_incomingConnection_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "createNearbyInvitationConnectionFramer:assign:local:remote:incomingConnection:");
}

id objc_msgSend_createNetworkAgent(void *a1, const char *a2, ...)
{
  return _[a1 createNetworkAgent];
}

id objc_msgSend_createRapportServer(void *a1, const char *a2, ...)
{
  return _[a1 createRapportServer];
}

id objc_msgSend_createRequestMessageWithApplicationLabel_payload_(void *a1, const char *a2, ...)
{
  return [a1 createRequestMessageWithApplicationLabel:payload:];
}

id objc_msgSend_createResponseWithApplicationLabel_payload_forRequestMessage_(void *a1, const char *a2, ...)
{
  return [a1 createResponseWithApplicationLabel:payload:forRequestMessage:];
}

id objc_msgSend_createTapEventWithApplicationLabel_singleBandAWDLModeRequested_pkData_bonjourListenerUUID_identity_isUnsupportedApplicationLabel_flags_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "createTapEventWithApplicationLabel:singleBandAWDLModeRequested:pkData:bonjourListenerUUID:identity:isUnsupportedApplicationLabel:flags:");
}

id objc_msgSend_createValidationPayloadWithKnownIdentity_supportsApplicationLabel_(void *a1, const char *a2, ...)
{
  return [a1 createValidationPayloadWithKnownIdentity:supportsApplicationLabel:];
}

id objc_msgSend_cuValueForEntitlementNoCache_(void *a1, const char *a2, ...)
{
  return [a1 cuValueForEntitlementNoCache:];
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return _[a1 currentCalendar];
}

id objc_msgSend_currentContext(void *a1, const char *a2, ...)
{
  return _[a1 currentContext];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return _[a1 currentHandler];
}

id objc_msgSend_currentHome(void *a1, const char *a2, ...)
{
  return _[a1 currentHome];
}

id objc_msgSend_currentPreferredPollingType(void *a1, const char *a2, ...)
{
  return _[a1 currentPreferredPollingType];
}

id objc_msgSend_currentRemoteDevicesForDestinations_service_listenerID_queue_completionBlock_(void *a1, const char *a2, ...)
{
  return [a1 currentRemoteDevicesForDestinations:x0 service:x1 listenerID:x2 queue:x3 completionBlock:x4];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return _[a1 currentRunLoop];
}

id objc_msgSend_currentState(void *a1, const char *a2, ...)
{
  return _[a1 currentState];
}

id objc_msgSend_currentTransaction(void *a1, const char *a2, ...)
{
  return _[a1 currentTransaction];
}

id objc_msgSend_currentUser(void *a1, const char *a2, ...)
{
  return _[a1 currentUser];
}

id objc_msgSend_currentUserPairingIdentityForHomeContainingAccessoryWithUniqueIdentifier_completionHandler_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "currentUserPairingIdentityForHomeContainingAccessoryWithUniqueIdentifier:completionHandler:")
}

id objc_msgSend_customEntitlement_(void *a1, const char *a2, ...)
{
  return [a1 customEntitlement:];
}

id objc_msgSend_daemonDevice(void *a1, const char *a2, ...)
{
  return _[a1 daemonDevice];
}

id objc_msgSend_daemonInfoChanged_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "daemonInfoChanged:");
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return _[a1 data];
}

id objc_msgSend_dataSource(void *a1, const char *a2, ...)
{
  return _[a1 dataSource];
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return [a1 dataWithBytes:];
}

id objc_msgSend_dataWithCapacity_(void *a1, const char *a2, ...)
{
  return [a1 dataWithCapacity:];
}

id objc_msgSend_dataWithJSONObject_options_error_(void *a1, const char *a2, ...)
{
  return [a1 dataWithJSONObject:x0 options:x1 error:x2];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_dateAcknowledged(void *a1, const char *a2, ...)
{
  return _[a1 dateAcknowledged];
}

id objc_msgSend_dateAdded(void *a1, const char *a2, ...)
{
  return _[a1 dateAdded];
}

id objc_msgSend_dateByAddingUnit_value_toDate_options_(void *a1, const char *a2, ...)
{
  return [a1 dateByAddingUnit:value:toDate:options:];
}

id objc_msgSend_dateRemoved(void *a1, const char *a2, ...)
{
  return _[a1 dateRemoved];
}

id objc_msgSend_dateRequested(void *a1, const char *a2, ...)
{
  return _[a1 dateRequested];
}

id objc_msgSend_dateWithTimeIntervalSinceNow_(void *a1, const char *a2, ...)
{
  return [a1 dateWithTimeIntervalSinceNow:];
}

id objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(void *a1, const char *a2, ...)
{
  return [a1 dateWithTimeIntervalSinceReferenceDate:];
}

id objc_msgSend_decodeBoolForKey_(void *a1, const char *a2, ...)
{
  return [a1 decodeBoolForKey:];
}

id objc_msgSend_decodeInt64ForKey_(void *a1, const char *a2, ...)
{
  return [a1 decodeInt64ForKey:];
}

id objc_msgSend_decodeIntegerForKey_(void *a1, const char *a2, ...)
{
  return [a1 decodeIntegerForKey:];
}

id objc_msgSend_decryptedActivityLevel(void *a1, const char *a2, ...)
{
  return _[a1 decryptedActivityLevel];
}

id objc_msgSend_dedicatedDevice(void *a1, const char *a2, ...)
{
  return _[a1 dedicatedDevice];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return _[a1 defaultWorkspace];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _[a1 delegate];
}

id objc_msgSend_deregisterEventID_(void *a1, const char *a2, ...)
{
  return [a1 deregisterEventID:];
}

id objc_msgSend_deregisterRequestID_(void *a1, const char *a2, ...)
{
  return [a1 deregisterRequestID:];
}

id objc_msgSend_deregisteredEventID_(void *a1, const char *a2, ...)
{
  return [a1 deregisteredEventID:];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _[a1 description];
}

id objc_msgSend_descriptionWithLevel_(void *a1, const char *a2, ...)
{
  return [a1 descriptionWithLevel:];
}

id objc_msgSend_destination(void *a1, const char *a2, ...)
{
  return _[a1 destination];
}

id objc_msgSend_destinationDevice(void *a1, const char *a2, ...)
{
  return _[a1 destinationDevice];
}

id objc_msgSend_detailedDescription(void *a1, const char *a2, ...)
{
  return _[a1 detailedDescription];
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return _[a1 device];
}

id objc_msgSend_deviceActionType(void *a1, const char *a2, ...)
{
  return _[a1 deviceActionType];
}

id objc_msgSend_deviceAddress(void *a1, const char *a2, ...)
{
  return _[a1 deviceAddress];
}

id objc_msgSend_deviceClassCode(void *a1, const char *a2, ...)
{
  return _[a1 deviceClassCode];
}

id objc_msgSend_deviceColor(void *a1, const char *a2, ...)
{
  return _[a1 deviceColor];
}

id objc_msgSend_deviceConfirmedIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 deviceConfirmedIdentifier];
}

id objc_msgSend_deviceFilter(void *a1, const char *a2, ...)
{
  return _[a1 deviceFilter];
}

id objc_msgSend_deviceFlags(void *a1, const char *a2, ...)
{
  return _[a1 deviceFlags];
}

id objc_msgSend_deviceIRKData(void *a1, const char *a2, ...)
{
  return _[a1 deviceIRKData];
}

id objc_msgSend_deviceIdentifer(void *a1, const char *a2, ...)
{
  return _[a1 deviceIdentifer];
}

id objc_msgSend_deviceInfo(void *a1, const char *a2, ...)
{
  return _[a1 deviceInfo];
}

id objc_msgSend_deviceModelCode(void *a1, const char *a2, ...)
{
  return _[a1 deviceModelCode];
}

id objc_msgSend_deviceName(void *a1, const char *a2, ...)
{
  return _[a1 deviceName];
}

id objc_msgSend_devicePresenceNotifier(void *a1, const char *a2, ...)
{
  return _[a1 devicePresenceNotifier];
}

id objc_msgSend_devicePresencePreset(void *a1, const char *a2, ...)
{
  return _[a1 devicePresencePreset];
}

id objc_msgSend_deviceType(void *a1, const char *a2, ...)
{
  return _[a1 deviceType];
}

id objc_msgSend_deviceUniqueID(void *a1, const char *a2, ...)
{
  return _[a1 deviceUniqueID];
}

id objc_msgSend_devices(void *a1, const char *a2, ...)
{
  return _[a1 devices];
}

id objc_msgSend_diagnosticCommand_params_(void *a1, const char *a2, ...)
{
  return [a1 diagnosticCommand:params:];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return _[a1 dictionaryRepresentation];
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithDictionary:];
}

id objc_msgSend_dictionaryWithObject_forKey_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithObject:forKey:];
}

id objc_msgSend_dictionaryWithObjects_forKeys_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithObjects:forKeys:];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithObjects:forKeys:count:];
}

id objc_msgSend_dictionaryWithObjectsAndKeys_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithObjectsAndKeys:];
}

id objc_msgSend_didBeginTransaction_(void *a1, const char *a2, ...)
{
  return [a1 didBeginTransaction:];
}

id objc_msgSend_didChangeStateForTransaction_(void *a1, const char *a2, ...)
{
  return [a1 didChangeStateForTransaction:];
}

id objc_msgSend_didDetectDeviceNearbyWithInitiatorRole_(void *a1, const char *a2, ...)
{
  return [a1 didDetectDeviceNearbyWithInitiatorRole:];
}

id objc_msgSend_didUpdateTransaction_(void *a1, const char *a2, ...)
{
  return [a1 didUpdateTransaction:];
}

id objc_msgSend_direct(void *a1, const char *a2, ...)
{
  return _[a1 direct];
}

id objc_msgSend_disabled(void *a1, const char *a2, ...)
{
  return _[a1 disabled];
}

id objc_msgSend_disabledUntilTicks(void *a1, const char *a2, ...)
{
  return _[a1 disabledUntilTicks];
}

id objc_msgSend_discoveryFlags(void *a1, const char *a2, ...)
{
  return _[a1 discoveryFlags];
}

id objc_msgSend_discoveryMode(void *a1, const char *a2, ...)
{
  return _[a1 discoveryMode];
}

id objc_msgSend_discoveryTimer(void *a1, const char *a2, ...)
{
  return _[a1 discoveryTimer];
}

id objc_msgSend_dispatchQueue(void *a1, const char *a2, ...)
{
  return _[a1 dispatchQueue];
}

id objc_msgSend_distance(void *a1, const char *a2, ...)
{
  return _[a1 distance];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return _[a1 domain];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _[a1 doubleValue];
}

id objc_msgSend_duetSync(void *a1, const char *a2, ...)
{
  return _[a1 duetSync];
}

id objc_msgSend_earlierDate_(void *a1, const char *a2, ...)
{
  return [a1 earlierDate:];
}

id objc_msgSend_edPKData(void *a1, const char *a2, ...)
{
  return _[a1 edPKData];
}

id objc_msgSend_edSKData(void *a1, const char *a2, ...)
{
  return _[a1 edSKData];
}

id objc_msgSend_effectiveIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 effectiveIdentifier];
}

id objc_msgSend_enabled(void *a1, const char *a2, ...)
{
  return _[a1 enabled];
}

id objc_msgSend_encodeBool_forKey_(void *a1, const char *a2, ...)
{
  return [a1 encodeBool:forKey:];
}

id objc_msgSend_encodeInt64_forKey_(void *a1, const char *a2, ...)
{
  return [a1 encodeInt64:forKey:];
}

id objc_msgSend_encodeInteger_forKey_(void *a1, const char *a2, ...)
{
  return [a1 encodeInteger:x0 forKey:x1];
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return [a1 encodeObject:forKey:];
}

id objc_msgSend_encodeSensitiveProperties(void *a1, const char *a2, ...)
{
  return _[a1 encodeSensitiveProperties];
}

id objc_msgSend_endTransaction_(void *a1, const char *a2, ...)
{
  return [a1 endTransaction:];
}

id objc_msgSend_endpointUUID(void *a1, const char *a2, ...)
{
  return _[a1 endpointUUID];
}

id objc_msgSend_endpoints(void *a1, const char *a2, ...)
{
  return _[a1 endpoints];
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return [a1 enumerateKeysAndObjectsUsingBlock:];
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return [a1 enumerateObjectsUsingBlock:];
}

id objc_msgSend_errorFlags(void *a1, const char *a2, ...)
{
  return _[a1 errorFlags];
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return [a1 errorWithDomain:code:userInfo:];
}

id objc_msgSend_event(void *a1, const char *a2, ...)
{
  return _[a1 event];
}

id objc_msgSend_eventID(void *a1, const char *a2, ...)
{
  return _[a1 eventID];
}

id objc_msgSend_eventSize(void *a1, const char *a2, ...)
{
  return _[a1 eventSize];
}

id objc_msgSend_executeAgentLogicInPersona_pid_handlerDescription_handler_(void *a1, const char *a2, ...)
{
  return [a1 executeAgentLogicInPersona:pid:handlerDescription:handler:];
}

id objc_msgSend_failWithError_(void *a1, const char *a2, ...)
{
  return [a1 failWithError:];
}

id objc_msgSend_failedToConnect(void *a1, const char *a2, ...)
{
  return _[a1 failedToConnect];
}

id objc_msgSend_familyEndpointData(void *a1, const char *a2, ...)
{
  return _[a1 familyEndpointData];
}

id objc_msgSend_familyMembers(void *a1, const char *a2, ...)
{
  return _[a1 familyMembers];
}

id objc_msgSend_featureFlags(void *a1, const char *a2, ...)
{
  return _[a1 featureFlags];
}

id objc_msgSend_featureFlagsForIdentityMatchingIDSDeviceIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 featureFlagsForIdentityMatchingIDSDeviceIdentifier:];
}

id objc_msgSend_findAgentClient_tryPort_isTCP_isFlowHandler_(void *a1, const char *a2, ...)
{
  return [a1 findAgentClient:x0 tryPort:x1 isTCP:x2 isFlowHandler:x3];
}

id objc_msgSend_findAgentClientFromConnectionID_(void *a1, const char *a2, ...)
{
  return [a1 findAgentClientFromConnectionID:];
}

id objc_msgSend_findAgentClientPort_(void *a1, const char *a2, ...)
{
  return [a1 findAgentClientPort:];
}

id objc_msgSend_findAuthAWDLPairingModeDeviceForIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 findAuthAWDLPairingModeDeviceForIdentifier:];
}

id objc_msgSend_findConnectedDeviceForIdentifier_controlFlags_cnx_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "findConnectedDeviceForIdentifier:controlFlags:cnx:");
}

id objc_msgSend_findContact_completion_(void *a1, const char *a2, ...)
{
  return [a1 findContact:x0 completion:x1];
}

id objc_msgSend_findDeviceFromID_(void *a1, const char *a2, ...)
{
  return [a1 findDeviceFromID:];
}

id objc_msgSend_findEndpoint_(void *a1, const char *a2, ...)
{
  return [a1 findEndpoint:];
}

id objc_msgSend_findListenerAgentClientFromApplicationServiceName_(void *a1, const char *a2, ...)
{
  return [a1 findListenerAgentClientFromApplicationServiceName:];
}

id objc_msgSend_findListenerAndCreateConnection_version_applicationService_listenerID_connectionID_(void *a1, const char *a2, ...)
{
  return [a1 findListenerAndCreateConnection:version:applicationService:listenerID:connectionID:];
}

id objc_msgSend_findListenerForAgentClient_sender_browseRequest_(void *a1, const char *a2, ...)
{
  return [a1 findListenerForAgentClient:sender:browseRequest:];
}

id objc_msgSend_findListenerForID_applicationService_fromPeer_(void *a1, const char *a2, ...)
{
  return [a1 findListenerForID:x0 applicationService:x1 fromPeer:x2];
}

id objc_msgSend_findNearbyInvitationListenerAndCreateConnection_applicationService_listenerID_connectionID_agentClient_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "findNearbyInvitationListenerAndCreateConnection:applicationService:listenerID:connectionID:agentClient:");
}

id objc_msgSend_findServerClientFromID_senderIDS_(void *a1, const char *a2, ...)
{
  return [a1 findServerClientFromID:senderIDS:];
}

id objc_msgSend_findUnauthDeviceForIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 findUnauthDeviceForIdentifier:];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_firstUnlocked(void *a1, const char *a2, ...)
{
  return _[a1 firstUnlocked];
}

id objc_msgSend_flags(void *a1, const char *a2, ...)
{
  return _[a1 flags];
}

id objc_msgSend_flowAssignHandler(void *a1, const char *a2, ...)
{
  return _[a1 flowAssignHandler];
}

id objc_msgSend_flowClient(void *a1, const char *a2, ...)
{
  return _[a1 flowClient];
}

id objc_msgSend_frameType(void *a1, const char *a2, ...)
{
  return _[a1 frameType];
}

id objc_msgSend_framer(void *a1, const char *a2, ...)
{
  return _[a1 framer];
}

id objc_msgSend_fromID(void *a1, const char *a2, ...)
{
  return _[a1 fromID];
}

id objc_msgSend_getBundleIDForPID_(void *a1, const char *a2, ...)
{
  return [a1 getBundleIDForPID:];
}

id objc_msgSend_getConnectionWithID_(void *a1, const char *a2, ...)
{
  return [a1 getConnectionWithID:];
}

id objc_msgSend_getDeviceClass(void *a1, const char *a2, ...)
{
  return _[a1 getDeviceClass];
}

id objc_msgSend_getDiscoveryDeviceTypesDescription_(void *a1, const char *a2, ...)
{
  return [a1 getDiscoveryDeviceTypesDescription:];
}

id objc_msgSend_getFamilyDeviceIdentities(void *a1, const char *a2, ...)
{
  return _[a1 getFamilyDeviceIdentities];
}

id objc_msgSend_getFamilyURIs(void *a1, const char *a2, ...)
{
  return _[a1 getFamilyURIs];
}

id objc_msgSend_getFriendDeviceIdentities(void *a1, const char *a2, ...)
{
  return _[a1 getFriendDeviceIdentities];
}

id objc_msgSend_getLogInfo(void *a1, const char *a2, ...)
{
  return _[a1 getLogInfo];
}

id objc_msgSend_getNonConnectableIdentity(void *a1, const char *a2, ...)
{
  return _[a1 getNonConnectableIdentity];
}

id objc_msgSend_getPairedPeersWithOptions_completion_(void *a1, const char *a2, ...)
{
  return [a1 getPairedPeersWithOptions:x0 completion:x1];
}

id objc_msgSend_getPairingIdentityFromHomeWithAccessory_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 getPairingIdentityFromHomeWithAccessory:completionHandler:];
}

id objc_msgSend_getPairingIdentityWithOptions_completion_(void *a1, const char *a2, ...)
{
  return [a1 getPairingIdentityWithOptions:completion:];
}

id objc_msgSend_getPeopleSuggestions_completion_(void *a1, const char *a2, ...)
{
  return [a1 getPeopleSuggestions:x0];
}

id objc_msgSend_getPersonaFromParameters_(void *a1, const char *a2, ...)
{
  return [a1 getPersonaFromParameters:];
}

id objc_msgSend_getTypeDescription(void *a1, const char *a2, ...)
{
  return _[a1 getTypeDescription];
}

id objc_msgSend_getUUIDBytes_(void *a1, const char *a2, ...)
{
  return [a1 getUUIDBytes:];
}

id objc_msgSend_getValue_(void *a1, const char *a2, ...)
{
  return [a1 getValue:];
}

id objc_msgSend_getVolume_forCategory_(void *a1, const char *a2, ...)
{
  return [a1 getVolume:forCategory:];
}

id objc_msgSend_handleConnectionData_(void *a1, const char *a2, ...)
{
  return [a1 handleConnectionData:];
}

id objc_msgSend_handleConnectionRequest_agentClient_(void *a1, const char *a2, ...)
{
  return [a1 handleConnectionRequest:agentClient:];
}

id objc_msgSend_handleDisconnect(void *a1, const char *a2, ...)
{
  return _[a1 handleDisconnect];
}

id objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "handleFailureInMethod:object:file:lineNumber:description:");
}

id objc_msgSend_handleForIdentifier_error_(void *a1, const char *a2, ...)
{
  return [a1 handleForIdentifier:error:];
}

id objc_msgSend_handler(void *a1, const char *a2, ...)
{
  return _[a1 handler];
}

id objc_msgSend_handles(void *a1, const char *a2, ...)
{
  return _[a1 handles];
}

id objc_msgSend_hasCurrentTransaction(void *a1, const char *a2, ...)
{
  return _[a1 hasCurrentTransaction];
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return [a1 hasPrefix:];
}

id objc_msgSend_hasTriggeredConnection(void *a1, const char *a2, ...)
{
  return _[a1 hasTriggeredConnection];
}

id objc_msgSend_hidePasswordHandler(void *a1, const char *a2, ...)
{
  return _[a1 hidePasswordHandler];
}

id objc_msgSend_home(void *a1, const char *a2, ...)
{
  return _[a1 home];
}

id objc_msgSend_homeAccessControlForUser_(void *a1, const char *a2, ...)
{
  return [a1 homeAccessControlForUser:];
}

id objc_msgSend_homeHubDeviceForLaunchInstanceID_(void *a1, const char *a2, ...)
{
  return [a1 homeHubDeviceForLaunchInstanceID:];
}

id objc_msgSend_homeHubDeviceWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 homeHubDeviceWithIdentifier:];
}

id objc_msgSend_homeKitIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 homeKitIdentifier];
}

id objc_msgSend_homeKitIdentity(void *a1, const char *a2, ...)
{
  return _[a1 homeKitIdentity];
}

id objc_msgSend_homeKitIdentityUpdated(void *a1, const char *a2, ...)
{
  return _[a1 homeKitIdentityUpdated];
}

id objc_msgSend_homeKitUserIdentifiers(void *a1, const char *a2, ...)
{
  return _[a1 homeKitUserIdentifiers];
}

id objc_msgSend_homePodVariant(void *a1, const char *a2, ...)
{
  return _[a1 homePodVariant];
}

id objc_msgSend_homes(void *a1, const char *a2, ...)
{
  return _[a1 homes];
}

id objc_msgSend_hotspotInfo(void *a1, const char *a2, ...)
{
  return _[a1 hotspotInfo];
}

id objc_msgSend_idInfoForDestinations_service_infoTypes_options_listenerID_queue_completionBlock_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "idInfoForDestinations:service:infoTypes:options:listenerID:queue:completionBlock:");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_identifierWithPid_(void *a1, const char *a2, ...)
{
  return [a1 identifierWithPid:];
}

id objc_msgSend_identitiesOfType_error_(void *a1, const char *a2, ...)
{
  return [a1 identitiesOfType:error:];
}

id objc_msgSend_identityForAngelJobLabel_(void *a1, const char *a2, ...)
{
  return [a1 identityForAngelJobLabel:];
}

id objc_msgSend_identityOfSelfAndReturnError_(void *a1, const char *a2, ...)
{
  return [a1 identityOfSelfAndReturnError:];
}

id objc_msgSend_identityOfTemporarySelfAndReturnError_(void *a1, const char *a2, ...)
{
  return [a1 identityOfTemporarySelfAndReturnError:];
}

id objc_msgSend_identityResolved(void *a1, const char *a2, ...)
{
  return _[a1 identityResolved];
}

id objc_msgSend_identityVerified(void *a1, const char *a2, ...)
{
  return _[a1 identityVerified];
}

id objc_msgSend_idsCorrelationIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 idsCorrelationIdentifier];
}

id objc_msgSend_idsDeviceArray(void *a1, const char *a2, ...)
{
  return _[a1 idsDeviceArray];
}

id objc_msgSend_idsDeviceForBluetoothUUID_(void *a1, const char *a2, ...)
{
  return [a1 idsDeviceForBluetoothUUID:];
}

id objc_msgSend_idsDeviceID(void *a1, const char *a2, ...)
{
  return _[a1 idsDeviceID];
}

id objc_msgSend_idsDeviceIDSelf(void *a1, const char *a2, ...)
{
  return _[a1 idsDeviceIDSelf];
}

id objc_msgSend_idsDeviceIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 idsDeviceIdentifier];
}

id objc_msgSend_idsDeviceMap(void *a1, const char *a2, ...)
{
  return _[a1 idsDeviceMap];
}

id objc_msgSend_idsFamilyEndpointMap(void *a1, const char *a2, ...)
{
  return _[a1 idsFamilyEndpointMap];
}

id objc_msgSend_idsFamilyEndpointQueryWithCompletion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "idsFamilyEndpointQueryWithCompletion:");
}

id objc_msgSend_idsHandheldCount(void *a1, const char *a2, ...)
{
  return _[a1 idsHandheldCount];
}

id objc_msgSend_idsHasAppleTV(void *a1, const char *a2, ...)
{
  return _[a1 idsHasAppleTV];
}

id objc_msgSend_idsHasHomePod(void *a1, const char *a2, ...)
{
  return _[a1 idsHasHomePod];
}

id objc_msgSend_idsHasMac(void *a1, const char *a2, ...)
{
  return _[a1 idsHasMac];
}

id objc_msgSend_idsHasRealityDevice(void *a1, const char *a2, ...)
{
  return _[a1 idsHasRealityDevice];
}

id objc_msgSend_idsHasWatch(void *a1, const char *a2, ...)
{
  return _[a1 idsHasWatch];
}

id objc_msgSend_idsHasiPad(void *a1, const char *a2, ...)
{
  return _[a1 idsHasiPad];
}

id objc_msgSend_idsIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 idsIdentifier];
}

id objc_msgSend_idsIsSignedIn(void *a1, const char *a2, ...)
{
  return _[a1 idsIsSignedIn];
}

id objc_msgSend_idsPersonalDeviceIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 idsPersonalDeviceIdentifier];
}

id objc_msgSend_inBubble(void *a1, const char *a2, ...)
{
  return _[a1 inBubble];
}

id objc_msgSend_inDiscoverySession(void *a1, const char *a2, ...)
{
  return _[a1 inDiscoverySession];
}

id objc_msgSend_inUseProcessesToString(void *a1, const char *a2, ...)
{
  return _[a1 inUseProcessesToString];
}

id objc_msgSend_inbound(void *a1, const char *a2, ...)
{
  return _[a1 inbound];
}

id objc_msgSend_incomingConnections(void *a1, const char *a2, ...)
{
  return _[a1 incomingConnections];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return _[a1 init];
}

id objc_msgSend_initWithArray_(void *a1, const char *a2, ...)
{
  return [a1 initWithArray:];
}

id objc_msgSend_initWithBytes_length_(void *a1, const char *a2, ...)
{
  return [a1 initWithBytes:length:];
}

id objc_msgSend_initWithBytes_objCType_(void *a1, const char *a2, ...)
{
  return [a1 initWithBytes:x0 objCType:x1];
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return [a1 initWithCapacity:];
}

id objc_msgSend_initWithConnection_dispatchQueue_(void *a1, const char *a2, ...)
{
  return [a1 initWithConnection:a2 dispatchQueue:a3];
}

id objc_msgSend_initWithDaemon_xpcCnx_(void *a1, const char *a2, ...)
{
  return [a1 initWithDaemon:x0 xpcCnx:x1];
}

id objc_msgSend_initWithDaemon_xpcConnection_(void *a1, const char *a2, ...)
{
  return [a1 initWithDaemon:x0 xpcConnection:x1];
}

id objc_msgSend_initWithDelegate_queue_options_(void *a1, const char *a2, ...)
{
  return [a1 initWithDelegate:x0 queue:x1 options:x2];
}

id objc_msgSend_initWithDevice_applicationService_endpointID_discoverySessionID_(void *a1, const char *a2, ...)
{
  return [a1 initWithDevice:x0 applicationService:x1 endpointID:x2 discoverySessionID:x3];
}

id objc_msgSend_initWithDevice_applicationService_endpointID_discoverySessionID_shouldAutomapListener_(void *a1, const char *a2, ...)
{
  return [a1 initWithDevice:x0 applicationService:x1 endpointID:x2 discoverySessionID:x3 shouldAutomapListener:x4];
}

id objc_msgSend_initWithDictionary_(void *a1, const char *a2, ...)
{
  return [a1 initWithDictionary:];
}

id objc_msgSend_initWithDispatchQueue_(void *a1, const char *a2, ...)
{
  return [a1 initWithDispatchQueue:];
}

id objc_msgSend_initWithExplanation_target_attributes_(void *a1, const char *a2, ...)
{
  return [a1 initWithExplanation:x0 target:x1 attributes:x2];
}

id objc_msgSend_initWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 initWithFormat:];
}

id objc_msgSend_initWithHomeMangerConfiguration_(void *a1, const char *a2, ...)
{
  return [a1 initWithHomeMangerConfiguration:];
}

id objc_msgSend_initWithIdentifier_applicationLabel_pkData_bonjourListenerUUID_isSameAccount_contactID_accountID_forceSingleBandAWDLMode_knownIdentity_isUnsupportedApplicationLabel_flags_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "initWithIdentifier:applicationLabel:pkData:bonjourListenerUUID:isSameAccount:contactID:accountID:forceSingleBandAWDLMode:knownIdentity:isUnsupportedApplicationLabel:flags:");
}

id objc_msgSend_initWithInnerBoundary_outerBoundary_error_(void *a1, const char *a2, ...)
{
  return [a1 initWithInnerBoundary:x0 outerBoundary:x1 error:x2];
}

id objc_msgSend_initWithKeyOptions_valueOptions_capacity_(void *a1, const char *a2, ...)
{
  return [a1 initWithKeyOptions:valueOptions:capacity:];
}

id objc_msgSend_initWithKeychainDictionaryRepresentation_(void *a1, const char *a2, ...)
{
  return [a1 initWithKeychainDictionaryRepresentation:];
}

id objc_msgSend_initWithKnownIdentity_supportsApplicationLabel_(void *a1, const char *a2, ...)
{
  return [a1 initWithKnownIdentity:supportsApplicationLabel:];
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return [a1 initWithMachServiceName:];
}

id objc_msgSend_initWithMetadata_applicationLabel_payload_version_(void *a1, const char *a2, ...)
{
  return [a1 initWithMetadata:x0 applicationLabel:x1 payload:x2 version:x3];
}

id objc_msgSend_initWithName_devicePresencePreset_(void *a1, const char *a2, ...)
{
  return [a1 initWithName:x0 devicePresencePreset:x1];
}

id objc_msgSend_initWithObjects_(void *a1, const char *a2, ...)
{
  return [a1 initWithObjects:];
}

id objc_msgSend_initWithOptions_cachePolicy_(void *a1, const char *a2, ...)
{
  return [a1 initWithOptions:cachePolicy:];
}

id objc_msgSend_initWithOrder_result_conditions_(void *a1, const char *a2, ...)
{
  return [a1 initWithOrder:x0 result:x1 conditions:x2];
}

id objc_msgSend_initWithPairedPeer_type_(void *a1, const char *a2, ...)
{
  return [a1 initWithPairedPeer:type:];
}

id objc_msgSend_initWithPeer_session_inbound_internal_applicationService_connectionID_endpointID_(void *a1, const char *a2, ...)
{
  return [a1 initWithPeer:x0 session:x1 inbound:x2 internal:x3 applicationService:x4 connectionID:x5 endpointID:x6];
}

id objc_msgSend_initWithPeer_version_inbound_internal_applicationService_connectionID_endpointID_(void *a1, const char *a2, ...)
{
  return [a1 initWithPeer:x0 version:x1 inbound:x2 internal:x3 applicationService:x4 connectionID:x5 endpointID:x6];
}

id objc_msgSend_initWithPreferredPollingType_dispatchQueue_(void *a1, const char *a2, ...)
{
  return [a1 initWithPreferredPollingType:x0 dispatchQueue:x1];
}

id objc_msgSend_initWithQueue_(void *a1, const char *a2, ...)
{
  return [a1 initWithQueue:];
}

id objc_msgSend_initWithRSSI_identifier_model_channel_machContinuousTimeSeconds_(void *a1, const char *a2, ...)
{
  return [a1 initWithRSSI:x0 identifier:x1 model:x2 channel:x3 machContinuousTimeSeconds:x4];
}

id objc_msgSend_initWithRole_(void *a1, const char *a2, ...)
{
  return [a1 initWithRole:];
}

id objc_msgSend_initWithService_(void *a1, const char *a2, ...)
{
  return [a1 initWithService:];
}

id objc_msgSend_initWithSet_(void *a1, const char *a2, ...)
{
  return [a1 initWithSet:];
}

id objc_msgSend_initWithSingleBandModeRequired_(void *a1, const char *a2, ...)
{
  return [a1 initWithSingleBandModeRequired:];
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return [a1 initWithString:x0];
}

id objc_msgSend_initWithSuiteName_(void *a1, const char *a2, ...)
{
  return [a1 initWithSuiteName:];
}

id objc_msgSend_initWithTimeIntervalSinceReferenceDate_(void *a1, const char *a2, ...)
{
  return [a1 initWithTimeIntervalSinceReferenceDate:];
}

id objc_msgSend_initWithTimeStamp_pkData_bonjourListenerUUID_selfIdentity_(void *a1, const char *a2, ...)
{
  return [a1 initWithTimeStamp:x0 pkData:x1 bonjourListenerUUID:x2 selfIdentity:x3];
}

id objc_msgSend_initWithType_(void *a1, const char *a2, ...)
{
  return [a1 initWithType:];
}

id objc_msgSend_initWithUUIDBytes_(void *a1, const char *a2, ...)
{
  return [a1 initWithUUIDBytes:];
}

id objc_msgSend_initWithUUIDString_(void *a1, const char *a2, ...)
{
  return [a1 initWithUUIDString:];
}

id objc_msgSend_initWithVersion_applicationLabel_serivceList_userInfo_(void *a1, const char *a2, ...)
{
  return [a1 initWithVersion:x0 applicationLabel:x1 serivceList:x2 userInfo:x3];
}

id objc_msgSend_initiator(void *a1, const char *a2, ...)
{
  return _[a1 initiator];
}

id objc_msgSend_initiatorLimitTimer(void *a1, const char *a2, ...)
{
  return _[a1 initiatorLimitTimer];
}

id objc_msgSend_initiatorState(void *a1, const char *a2, ...)
{
  return _[a1 initiatorState];
}

id objc_msgSend_initiatorWithDelegate_callbackQueue_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "initiatorWithDelegate:callbackQueue:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _[a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_interestDeregisterEventID_peerIdentifier_owner_(void *a1, const char *a2, ...)
{
  return [a1 interestDeregisterEventID:peerIdentifier:owner:];
}

id objc_msgSend_interestRegisterEventID_peerIdentifier_owner_(void *a1, const char *a2, ...)
{
  return [a1 interestRegisterEventID:x0 peerIdentifier:x1 owner:x2];
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return [a1 interfaceWithProtocol:];
}

id objc_msgSend_internal(void *a1, const char *a2, ...)
{
  return _[a1 internal];
}

id objc_msgSend_internalAuthFlags(void *a1, const char *a2, ...)
{
  return _[a1 internalAuthFlags];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _[a1 invalidate];
}

id objc_msgSend_invalidateForClient_(void *a1, const char *a2, ...)
{
  return [a1 invalidateForClient:];
}

id objc_msgSend_invalidateTransaction_(void *a1, const char *a2, ...)
{
  return [a1 invalidateTransaction:];
}

id objc_msgSend_invalidateTransactionWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 invalidateTransactionWithIdentifier:];
}

id objc_msgSend_invalidateTransactionWithIdentifier_context_(void *a1, const char *a2, ...)
{
  return [a1 invalidateTransactionWithIdentifier:x0 context:x1];
}

id objc_msgSend_invalidateWithError_(void *a1, const char *a2, ...)
{
  return [a1 invalidateWithError:];
}

id objc_msgSend_invalidationHandled(void *a1, const char *a2, ...)
{
  return _[a1 invalidationHandled];
}

id objc_msgSend_invalidationHandler(void *a1, const char *a2, ...)
{
  return _[a1 invalidationHandler];
}

id objc_msgSend_ipAddress(void *a1, const char *a2, ...)
{
  return _[a1 ipAddress];
}

id objc_msgSend_isActive(void *a1, const char *a2, ...)
{
  return _[a1 isActive];
}

id objc_msgSend_isApplication(void *a1, const char *a2, ...)
{
  return _[a1 isApplication];
}

id objc_msgSend_isBLEDeviceReplaced(void *a1, const char *a2, ...)
{
  return _[a1 isBLEDeviceReplaced];
}

id objc_msgSend_isConnected(void *a1, const char *a2, ...)
{
  return _[a1 isConnected];
}

id objc_msgSend_isContactValidForIdentity_completionBlock_(void *a1, const char *a2, ...)
{
  return [a1 isContactValidForIdentity:x0 completionBlock:x1];
}

id objc_msgSend_isDeviceEnrolledWithDeKOTA_(void *a1, const char *a2, ...)
{
  return [a1 isDeviceEnrolledWithDeKOTA:];
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isEnabled];
}

id objc_msgSend_isEnabledForType_(void *a1, const char *a2, ...)
{
  return [a1 isEnabledForType:];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return [a1 isEqual:];
}

id objc_msgSend_isEqualToDevice_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToDevice:];
}

id objc_msgSend_isEqualToDeviceBasic_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToDeviceBasic:];
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToString:];
}

id objc_msgSend_isKnownIdentity(void *a1, const char *a2, ...)
{
  return _[a1 isKnownIdentity];
}

id objc_msgSend_isMe(void *a1, const char *a2, ...)
{
  return _[a1 isMe];
}

id objc_msgSend_isNearbyActionV2AdvertiserActive(void *a1, const char *a2, ...)
{
  return _[a1 isNearbyActionV2AdvertiserActive];
}

id objc_msgSend_isOwner(void *a1, const char *a2, ...)
{
  return _[a1 isOwner];
}

id objc_msgSend_isPersonal(void *a1, const char *a2, ...)
{
  return _[a1 isPersonal];
}

id objc_msgSend_isRunning(void *a1, const char *a2, ...)
{
  return _[a1 isRunning];
}

id objc_msgSend_isSingleBandModeRequired(void *a1, const char *a2, ...)
{
  return _[a1 isSingleBandModeRequired];
}

id objc_msgSend_isTCP(void *a1, const char *a2, ...)
{
  return _[a1 isTCP];
}

id objc_msgSend_isUsingQUIC(void *a1, const char *a2, ...)
{
  return _[a1 isUsingQUIC];
}

id objc_msgSend_isValidTimeStamp(void *a1, const char *a2, ...)
{
  return _[a1 isValidTimeStamp];
}

id objc_msgSend_isValidTimeStampSince_(void *a1, const char *a2, ...)
{
  return [a1 isValidTimeStampSince:];
}

id objc_msgSend_keychainDictionaryRepresentation(void *a1, const char *a2, ...)
{
  return _[a1 keychainDictionaryRepresentation];
}

id objc_msgSend_keychainStateString(void *a1, const char *a2, ...)
{
  return _[a1 keychainStateString];
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return _[a1 label];
}

id objc_msgSend_languageChangePending(void *a1, const char *a2, ...)
{
  return _[a1 languageChangePending];
}

id objc_msgSend_launchInstanceID(void *a1, const char *a2, ...)
{
  return _[a1 launchInstanceID];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_linkType(void *a1, const char *a2, ...)
{
  return _[a1 linkType];
}

id objc_msgSend_listAgentClients_(void *a1, const char *a2, ...)
{
  return [a1 listAgentClients:];
}

id objc_msgSend_listAllowedApplicationServices_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "listAllowedApplicationServices:");
}

id objc_msgSend_listConnections_(void *a1, const char *a2, ...)
{
  return [a1 listConnections:];
}

id objc_msgSend_listEndpoints_(void *a1, const char *a2, ...)
{
  return [a1 listEndpoints:];
}

id objc_msgSend_listEndpointsForDiscoverySession_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "listEndpointsForDiscoverySession:");
}

id objc_msgSend_listen_framer(void *a1, const char *a2, ...)
{
  return [a1 listen_framer];
}

id objc_msgSend_listenerNotifications(void *a1, const char *a2, ...)
{
  return _[a1 listenerNotifications];
}

id objc_msgSend_listeningPSM(void *a1, const char *a2, ...)
{
  return _[a1 listeningPSM];
}

id objc_msgSend_listeningPort(void *a1, const char *a2, ...)
{
  return _[a1 listeningPort];
}

id objc_msgSend_loadFamilyDeviceIdentitiesWithError_(void *a1, const char *a2, ...)
{
  return [a1 loadFamilyDeviceIdentitiesWithError:];
}

id objc_msgSend_loadFriendDeviceIdentitiesWithError_(void *a1, const char *a2, ...)
{
  return [a1 loadFriendDeviceIdentitiesWithError:];
}

id objc_msgSend_localDeviceInfo(void *a1, const char *a2, ...)
{
  return _[a1 localDeviceInfo];
}

id objc_msgSend_localDeviceUpdated(void *a1, const char *a2, ...)
{
  return _[a1 localDeviceUpdated];
}

id objc_msgSend_localEndpoint(void *a1, const char *a2, ...)
{
  return _[a1 localEndpoint];
}

id objc_msgSend_localValidationMessage(void *a1, const char *a2, ...)
{
  return _[a1 localValidationMessage];
}

id objc_msgSend_localeWithLocaleIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 localeWithLocaleIdentifier:];
}

id objc_msgSend_lockSessionToCurrentProcess(void *a1, const char *a2, ...)
{
  return _[a1 lockSessionToCurrentProcess];
}

id objc_msgSend_logAWDLBrowseClient_(void *a1, const char *a2, ...)
{
  return [a1 logAWDLBrowseClient:];
}

id objc_msgSend_logNeedsAWDLAdvertisementClient_actionType_bluetoothType_(void *a1, const char *a2, ...)
{
  return [a1 logNeedsAWDLAdvertisementClient:actionType:bluetoothType:];
}

id objc_msgSend_logReceivedMessageType_identifier_options_appID_ctx_(void *a1, const char *a2, ...)
{
  return [a1 logReceivedMessageType:x0 identifier:x1 options:x2 appID:x3 ctx:x4];
}

id objc_msgSend_loginID(void *a1, const char *a2, ...)
{
  return _[a1 loginID];
}

id objc_msgSend_longDescription(void *a1, const char *a2, ...)
{
  return _[a1 longDescription];
}

id objc_msgSend_manateeAvailable(void *a1, const char *a2, ...)
{
  return _[a1 manateeAvailable];
}

id objc_msgSend_mappingID(void *a1, const char *a2, ...)
{
  return _[a1 mappingID];
}

id objc_msgSend_markConnectionAsTriggered_(void *a1, const char *a2, ...)
{
  return [a1 markConnectionAsTriggered:];
}

id objc_msgSend_meDeviceFMFDeviceID(void *a1, const char *a2, ...)
{
  return _[a1 meDeviceFMFDeviceID];
}

id objc_msgSend_meDeviceIDSDeviceID(void *a1, const char *a2, ...)
{
  return _[a1 meDeviceIDSDeviceID];
}

id objc_msgSend_meDeviceIsMe(void *a1, const char *a2, ...)
{
  return _[a1 meDeviceIsMe];
}

id objc_msgSend_meDeviceName(void *a1, const char *a2, ...)
{
  return _[a1 meDeviceName];
}

id objc_msgSend_meDeviceValid(void *a1, const char *a2, ...)
{
  return _[a1 meDeviceValid];
}

id objc_msgSend_mediaProfile(void *a1, const char *a2, ...)
{
  return _[a1 mediaProfile];
}

id objc_msgSend_mediaRemoteID(void *a1, const char *a2, ...)
{
  return _[a1 mediaRemoteID];
}

id objc_msgSend_mediaRemoteIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 mediaRemoteIdentifier];
}

id objc_msgSend_mediaRouteID(void *a1, const char *a2, ...)
{
  return _[a1 mediaRouteID];
}

id objc_msgSend_mediaRouteIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 mediaRouteIdentifier];
}

id objc_msgSend_mediaSystemIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 mediaSystemIdentifier];
}

id objc_msgSend_mediaSystemIdentifierEffective(void *a1, const char *a2, ...)
{
  return _[a1 mediaSystemIdentifierEffective];
}

id objc_msgSend_mediaSystemName(void *a1, const char *a2, ...)
{
  return _[a1 mediaSystemName];
}

id objc_msgSend_mediaSystemRole(void *a1, const char *a2, ...)
{
  return _[a1 mediaSystemRole];
}

id objc_msgSend_mediaSystemRoleEffective(void *a1, const char *a2, ...)
{
  return _[a1 mediaSystemRoleEffective];
}

id objc_msgSend_mediaSystemState(void *a1, const char *a2, ...)
{
  return _[a1 mediaSystemState];
}

id objc_msgSend_message(void *a1, const char *a2, ...)
{
  return _[a1 message];
}

id objc_msgSend_messageSize(void *a1, const char *a2, ...)
{
  return _[a1 messageSize];
}

id objc_msgSend_messageType(void *a1, const char *a2, ...)
{
  return _[a1 messageType];
}

id objc_msgSend_messageWithConnectionHandoverRequest_(void *a1, const char *a2, ...)
{
  return [a1 messageWithConnectionHandoverRequest:];
}

id objc_msgSend_messageWithConnectionHandoverSelect_(void *a1, const char *a2, ...)
{
  return [a1 messageWithConnectionHandoverSelect:];
}

id objc_msgSend_messageWithMetadata_applicationLabel_payload_version_(void *a1, const char *a2, ...)
{
  return [a1 messageWithMetadata:x0 applicationLabel:x1 payload:x2 version:x3];
}

id objc_msgSend_metadata(void *a1, const char *a2, ...)
{
  return _[a1 metadata];
}

id objc_msgSend_metadataWithDictionary_(void *a1, const char *a2, ...)
{
  return [a1 metadataWithDictionary:];
}

id objc_msgSend_metricsUsingToken_(void *a1, const char *a2, ...)
{
  return [a1 metricsUsingToken:];
}

id objc_msgSend_minusSet_(void *a1, const char *a2, ...)
{
  return [a1 minusSet:];
}

id objc_msgSend_model(void *a1, const char *a2, ...)
{
  return _[a1 model];
}

id objc_msgSend_modelIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 modelIdentifier];
}

id objc_msgSend_monitorWithConfiguration_(void *a1, const char *a2, ...)
{
  return [a1 monitorWithConfiguration:];
}

id objc_msgSend_msgCtx(void *a1, const char *a2, ...)
{
  return _[a1 msgCtx];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_nearFieldController(void *a1, const char *a2, ...)
{
  return _[a1 nearFieldController];
}

id objc_msgSend_nearbyActionV2Type(void *a1, const char *a2, ...)
{
  return _[a1 nearbyActionV2Type];
}

id objc_msgSend_nearbyInfoV2TempAuthTagData(void *a1, const char *a2, ...)
{
  return _[a1 nearbyInfoV2TempAuthTagData];
}

id objc_msgSend_nearbyInvitationChangedDevice_changes_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "nearbyInvitationChangedDevice:changes:");
}

id objc_msgSend_nearbyInvitationConnection(void *a1, const char *a2, ...)
{
  return _[a1 nearbyInvitationConnection];
}

id objc_msgSend_nearbyInvitationFoundDevice_(void *a1, const char *a2, ...)
{
  return [a1 nearbyInvitationFoundDevice:];
}

id objc_msgSend_nearbyInvitationLostDevice_(void *a1, const char *a2, ...)
{
  return [a1 nearbyInvitationLostDevice:];
}

id objc_msgSend_nearbyInvitationReceivedEventID_event_options_sessionID_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "nearbyInvitationReceivedEventID:event:options:sessionID:");
}

id objc_msgSend_nearbyInvitationReceivedRequestID_request_options_responseHandler_sessionID_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "nearbyInvitationReceivedRequestID:request:options:responseHandler:sessionID:");
}

id objc_msgSend_nearbyInvitationSession(void *a1, const char *a2, ...)
{
  return _[a1 nearbyInvitationSession];
}

id objc_msgSend_nearbyInvitationSessionEndedWithID_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "nearbyInvitationSessionEndedWithID:");
}

id objc_msgSend_nearbyInvitationSessionError_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "nearbyInvitationSessionError:");
}

id objc_msgSend_nearbyInvitationSessionError_withID_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "nearbyInvitationSessionError:withID:");
}

id objc_msgSend_nearbyInvitationStartServerSessionID_device_completion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "nearbyInvitationStartServerSessionID:device:completion:");
}

id objc_msgSend_needsAWDL(void *a1, const char *a2, ...)
{
  return _[a1 needsAWDL];
}

id objc_msgSend_needsCLink(void *a1, const char *a2, ...)
{
  return _[a1 needsCLink];
}

id objc_msgSend_needsNearbyActionV2(void *a1, const char *a2, ...)
{
  return _[a1 needsNearbyActionV2];
}

id objc_msgSend_netAgentUUID_(void *a1, const char *a2, ...)
{
  return [a1 netAgentUUID:];
}

id objc_msgSend_netCnx(void *a1, const char *a2, ...)
{
  return _[a1 netCnx];
}

id objc_msgSend_netConnectionStartWithDevice_session_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "netConnectionStartWithDevice:session:error:");
}

id objc_msgSend_netFlags(void *a1, const char *a2, ...)
{
  return _[a1 netFlags];
}

id objc_msgSend_networkAgentID(void *a1, const char *a2, ...)
{
  return _[a1 networkAgentID];
}

id objc_msgSend_nonWakingRequest(void *a1, const char *a2, ...)
{
  return _[a1 nonWakingRequest];
}

id objc_msgSend_notifyBluetoothSample_(void *a1, const char *a2, ...)
{
  return [a1 notifyBluetoothSample:];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return _[a1 now];
}

id objc_msgSend_nsuuid(void *a1, const char *a2, ...)
{
  return _[a1 nsuuid];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return _[a1 null];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return [a1 numberWithBool:x0];
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return [a1 numberWithDouble:];
}

id objc_msgSend_numberWithFloat_(void *a1, const char *a2, ...)
{
  return [a1 numberWithFloat:];
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return [a1 numberWithInt:];
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return [a1 numberWithInteger:];
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedInt:];
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedInteger:];
}

id objc_msgSend_numberWithUnsignedLong_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedLong:];
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedLongLong:];
}

id objc_msgSend_nwActivity(void *a1, const char *a2, ...)
{
  return _[a1 nwActivity];
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 objectAtIndex:];
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 objectAtIndexedSubscript:];
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return [a1 objectForKey:];
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 objectForKeyedSubscript:];
}

id objc_msgSend_openApplication_withOptions_completion_(void *a1, const char *a2, ...)
{
  return [a1 openApplication:withOptions:completion:];
}

id objc_msgSend_openSensitiveURL_withOptions_error_(void *a1, const char *a2, ...)
{
  return [a1 openSensitiveURL:x0 withOptions:x1 error:x2];
}

id objc_msgSend_openURL_configuration_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 openURL:x0 configuration:x1 completionHandler:x2];
}

id objc_msgSend_openURL_withOptions_error_(void *a1, const char *a2, ...)
{
  return [a1 openURL:x0 withOptions:x1 error:x2];
}

id objc_msgSend_operatingSystemVersion(void *a1, const char *a2, ...)
{
  return _[a1 operatingSystemVersion];
}

id objc_msgSend_operatingSystemVersionForSelf(void *a1, const char *a2, ...)
{
  return _[a1 operatingSystemVersionForSelf];
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return _[a1 options];
}

id objc_msgSend_optionsWithDictionary_(void *a1, const char *a2, ...)
{
  return [a1 optionsWithDictionary:];
}

id objc_msgSend_outgoingBuffer(void *a1, const char *a2, ...)
{
  return _[a1 outgoingBuffer];
}

id objc_msgSend_overrideScreenOff(void *a1, const char *a2, ...)
{
  return _[a1 overrideScreenOff];
}

id objc_msgSend_overrideScreenOffRescanInterval(void *a1, const char *a2, ...)
{
  return _[a1 overrideScreenOffRescanInterval];
}

id objc_msgSend_pairSetupACL(void *a1, const char *a2, ...)
{
  return _[a1 pairSetupACL];
}

id objc_msgSend_pairVerifyAuthType(void *a1, const char *a2, ...)
{
  return _[a1 pairVerifyAuthType];
}

id objc_msgSend_pairingInfo(void *a1, const char *a2, ...)
{
  return _[a1 pairingInfo];
}

id objc_msgSend_password(void *a1, const char *a2, ...)
{
  return _[a1 password];
}

id objc_msgSend_passwordType(void *a1, const char *a2, ...)
{
  return _[a1 passwordType];
}

id objc_msgSend_passwordTypeActual(void *a1, const char *a2, ...)
{
  return _[a1 passwordTypeActual];
}

id objc_msgSend_payload(void *a1, const char *a2, ...)
{
  return _[a1 payload];
}

id objc_msgSend_peer(void *a1, const char *a2, ...)
{
  return _[a1 peer];
}

id objc_msgSend_peerDeviceInfo(void *a1, const char *a2, ...)
{
  return _[a1 peerDeviceInfo];
}

id objc_msgSend_peerDeviceModel(void *a1, const char *a2, ...)
{
  return _[a1 peerDeviceModel];
}

id objc_msgSend_peerDevices(void *a1, const char *a2, ...)
{
  return _[a1 peerDevices];
}

id objc_msgSend_peerHostState(void *a1, const char *a2, ...)
{
  return _[a1 peerHostState];
}

id objc_msgSend_peerID(void *a1, const char *a2, ...)
{
  return _[a1 peerID];
}

id objc_msgSend_peerIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 peerIdentifier];
}

id objc_msgSend_peerOSVersion(void *a1, const char *a2, ...)
{
  return _[a1 peerOSVersion];
}

id objc_msgSend_pendingInitiator(void *a1, const char *a2, ...)
{
  return _[a1 pendingInitiator];
}

id objc_msgSend_pendingReceiver(void *a1, const char *a2, ...)
{
  return _[a1 pendingReceiver];
}

id objc_msgSend_performLog(void *a1, const char *a2, ...)
{
  return _[a1 performLog];
}

id objc_msgSend_personalDeviceState(void *a1, const char *a2, ...)
{
  return _[a1 personalDeviceState];
}

id objc_msgSend_personalRequestsState(void *a1, const char *a2, ...)
{
  return _[a1 personalRequestsState];
}

id objc_msgSend_personalRequestsStateForAccessory_(void *a1, const char *a2, ...)
{
  return [a1 personalRequestsStateForAccessory:];
}

id objc_msgSend_pid(void *a1, const char *a2, ...)
{
  return _[a1 pid];
}

id objc_msgSend_pkData(void *a1, const char *a2, ...)
{
  return _[a1 pkData];
}

id objc_msgSend_pollingCoolDownTimer(void *a1, const char *a2, ...)
{
  return _[a1 pollingCoolDownTimer];
}

id objc_msgSend_port(void *a1, const char *a2, ...)
{
  return _[a1 port];
}

id objc_msgSend_postDaemonInfoChanges_(void *a1, const char *a2, ...)
{
  return [a1 postDaemonInfoChanges:];
}

id objc_msgSend_powerAssertionID(void *a1, const char *a2, ...)
{
  return _[a1 powerAssertionID];
}

id objc_msgSend_powerUnlimited(void *a1, const char *a2, ...)
{
  return _[a1 powerUnlimited];
}

id objc_msgSend_predicateMatchingIdentifiers_(void *a1, const char *a2, ...)
{
  return [a1 predicateMatchingIdentifiers:];
}

id objc_msgSend_preferredPollingType(void *a1, const char *a2, ...)
{
  return _[a1 preferredPollingType];
}

id objc_msgSend_prefsChanged(void *a1, const char *a2, ...)
{
  return _[a1 prefsChanged];
}

id objc_msgSend_present(void *a1, const char *a2, ...)
{
  return _[a1 present];
}

id objc_msgSend_previousState(void *a1, const char *a2, ...)
{
  return _[a1 previousState];
}

id objc_msgSend_primaryAppleID(void *a1, const char *a2, ...)
{
  return _[a1 primaryAppleID];
}

id objc_msgSend_primaryAppleIDIsHSA2(void *a1, const char *a2, ...)
{
  return _[a1 primaryAppleIDIsHSA2];
}

id objc_msgSend_priority(void *a1, const char *a2, ...)
{
  return _[a1 priority];
}

id objc_msgSend_privateKey(void *a1, const char *a2, ...)
{
  return _[a1 privateKey];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 processIdentifier];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return _[a1 processInfo];
}

id objc_msgSend_processSendsUsingConnection_(void *a1, const char *a2, ...)
{
  return [a1 processSendsUsingConnection:];
}

id objc_msgSend_productVersion(void *a1, const char *a2, ...)
{
  return _[a1 productVersion];
}

id objc_msgSend_provider(void *a1, const char *a2, ...)
{
  return _[a1 provider];
}

id objc_msgSend_proxyDevices(void *a1, const char *a2, ...)
{
  return _[a1 proxyDevices];
}

id objc_msgSend_publicIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 publicIdentifier];
}

id objc_msgSend_publicKey(void *a1, const char *a2, ...)
{
  return _[a1 publicKey];
}

id objc_msgSend_queryDeviceToApplicationServiceMapping_device_completion_(void *a1, const char *a2, ...)
{
  return [a1 queryDeviceToApplicationServiceMapping:device completion:completion];
}

id objc_msgSend_queryItemWithName_value_(void *a1, const char *a2, ...)
{
  return [a1 queryItemWithName:value:];
}

id objc_msgSend_raise_format_(void *a1, const char *a2, ...)
{
  return [a1 raise:];
}

id objc_msgSend_rangeOfString_(void *a1, const char *a2, ...)
{
  return [a1 rangeOfString:];
}

id objc_msgSend_rangeOfString_options_(void *a1, const char *a2, ...)
{
  return [a1 rangeOfString:options:];
}

id objc_msgSend_rapportIRK(void *a1, const char *a2, ...)
{
  return _[a1 rapportIRK];
}

id objc_msgSend_rapportIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 rapportIdentifier];
}

id objc_msgSend_rbsPID(void *a1, const char *a2, ...)
{
  return _[a1 rbsPID];
}

id objc_msgSend_reactivateCalled(void *a1, const char *a2, ...)
{
  return _[a1 reactivateCalled];
}

id objc_msgSend_receiveDataForConnection_statusHandler_(void *a1, const char *a2, ...)
{
  return [a1 receiveDataForConnection:statusHandler:];
}

id objc_msgSend_receiveWithRequestID_receiveHandler_(void *a1, const char *a2, ...)
{
  return [a1 receiveWithRequestID:receiveHandler:];
}

id objc_msgSend_receivedEventID_event_options_(void *a1, const char *a2, ...)
{
  return [a1 receivedEventID:event:options:];
}

id objc_msgSend_receivedFamilyIdentityRequest_msgCtx_(void *a1, const char *a2, ...)
{
  return [a1 receivedFamilyIdentityRequest:msgCtx];
}

id objc_msgSend_receivedFamilyIdentityResponse_msgCtx_(void *a1, const char *a2, ...)
{
  return [a1 receivedFamilyIdentityResponse:msgCtx:];
}

id objc_msgSend_receivedFamilyIdentityUpdate_msgCtx_(void *a1, const char *a2, ...)
{
  return [a1 receivedFamilyIdentityUpdate:msgCtx:];
}

id objc_msgSend_receivedFriendIdentityRequest_msgCtx_(void *a1, const char *a2, ...)
{
  return [a1 receivedFriendIdentityRequest:msgCtx];
}

id objc_msgSend_receivedFriendIdentityResponse_msgCtx_(void *a1, const char *a2, ...)
{
  return [a1 receivedFriendIdentityResponse:msgCtx];
}

id objc_msgSend_receivedFriendIdentityUpdate_msgCtx_(void *a1, const char *a2, ...)
{
  return [a1 receivedFriendIdentityUpdate:msgCtx];
}

id objc_msgSend_receivedMessages(void *a1, const char *a2, ...)
{
  return _[a1 receivedMessages];
}

id objc_msgSend_receivedRequestID_request_options_responseHandler_(void *a1, const char *a2, ...)
{
  return [a1 receivedRequestID:request:options:responseHandler:];
}

id objc_msgSend_receivedSiriAudioEvent_(void *a1, const char *a2, ...)
{
  return [a1 receivedSiriAudioEvent:];
}

id objc_msgSend_receiver(void *a1, const char *a2, ...)
{
  return _[a1 receiver];
}

id objc_msgSend_receiverState(void *a1, const char *a2, ...)
{
  return _[a1 receiverState];
}

id objc_msgSend_receiverWithDelegate_callbackQueue_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "receiverWithDelegate:callbackQueue:");
}

id objc_msgSend_reconfirm(void *a1, const char *a2, ...)
{
  return _[a1 reconfirm];
}

id objc_msgSend_refreshIDInfo(void *a1, const char *a2, ...)
{
  return _[a1 refreshIDInfo];
}

id objc_msgSend_regenerateSelfIdentity_(void *a1, const char *a2, ...)
{
  return [a1 regenerateSelfIdentity:];
}

id objc_msgSend_regenerateTemporarySelfIdentity(void *a1, const char *a2, ...)
{
  return _[a1 regenerateTemporarySelfIdentity];
}

id objc_msgSend_registerEventID_options_handler_(void *a1, const char *a2, ...)
{
  return [a1 registerEventID:options:handler:];
}

id objc_msgSend_registerRequestID_options_handler_(void *a1, const char *a2, ...)
{
  return [a1 registerRequestID:options:handler:];
}

id objc_msgSend_registeredEventID_(void *a1, const char *a2, ...)
{
  return [a1 registeredEventID:];
}

id objc_msgSend_registeredEvents(void *a1, const char *a2, ...)
{
  return _[a1 registeredEvents];
}

id objc_msgSend_registeredRequests(void *a1, const char *a2, ...)
{
  return _[a1 registeredRequests];
}

id objc_msgSend_remoteAuthenticationMessage(void *a1, const char *a2, ...)
{
  return _[a1 remoteAuthenticationMessage];
}

id objc_msgSend_remoteDisplayAuthCompleted_(void *a1, const char *a2, ...)
{
  return [a1 remoteDisplayAuthCompleted:];
}

id objc_msgSend_remoteDisplayChangedDevice_changes_(void *a1, const char *a2, ...)
{
  return [a1 remoteDisplayChangedDevice:changes];
}

id objc_msgSend_remoteDisplayDedicatedDeviceChanged_(void *a1, const char *a2, ...)
{
  return [a1 remoteDisplayDedicatedDeviceChanged:];
}

id objc_msgSend_remoteDisplayDeviceSelected_(void *a1, const char *a2, ...)
{
  return [a1 remoteDisplayDeviceSelected:];
}

id objc_msgSend_remoteDisplayFoundDevice_(void *a1, const char *a2, ...)
{
  return [a1 remoteDisplayFoundDevice:];
}

id objc_msgSend_remoteDisplayHidePasswordWithFlags_(void *a1, const char *a2, ...)
{
  return [a1 remoteDisplayHidePasswordWithFlags:];
}

id objc_msgSend_remoteDisplayLostDevice_(void *a1, const char *a2, ...)
{
  return [a1 remoteDisplayLostDevice:];
}

id objc_msgSend_remoteDisplayNotifyDiscoverySessionState_forDevice_startReason_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "remoteDisplayNotifyDiscoverySessionState:forDevice:startReason:");
}

id objc_msgSend_remoteDisplayPersonDeclined(void *a1, const char *a2, ...)
{
  return _[a1 remoteDisplayPersonDeclined];
}

id objc_msgSend_remoteDisplayPromptForPasswordWithFlags_throttleSeconds_(void *a1, const char *a2, ...)
{
  return [a1 remoteDisplayPromptForPasswordWithFlags:x0 throttleSeconds:x1];
}

id objc_msgSend_remoteDisplayReceivedEventID_event_options_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "remoteDisplayReceivedEventID:event:options:");
}

id objc_msgSend_remoteDisplayReceivedEventID_event_options_sessionID_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "remoteDisplayReceivedEventID:event:options:sessionID:");
}

id objc_msgSend_remoteDisplayReceivedRequestID_request_options_responseHandler_(void *a1, const char *a2, ...)
{
  return [a1 remoteDisplayReceivedRequestID:x0 request:x1 options:x2 responseHandler:x3];
}

id objc_msgSend_remoteDisplayReceivedRequestID_request_options_responseHandler_sessionID_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "remoteDisplayReceivedRequestID:request:options:responseHandler:sessionID:");
}

id objc_msgSend_remoteDisplaySessionEndedWithID_(void *a1, const char *a2, ...)
{
  return [a1 remoteDisplaySessionEndedWithID:];
}

id objc_msgSend_remoteDisplaySessionError_(void *a1, const char *a2, ...)
{
  return [a1 remoteDisplaySessionError:];
}

id objc_msgSend_remoteDisplayShowPassword_flags_(void *a1, const char *a2, ...)
{
  return [a1 remoteDisplayShowPassword:flags:];
}

id objc_msgSend_remoteDisplayStartServerSessionID_device_linkType_completion_(void *a1, const char *a2, ...)
{
  return [a1 remoteDisplayStartServerSessionID:x0 device:x1 linkType:x2 completion:x3];
}

id objc_msgSend_remoteDisplayUpdateDataLinkType_(void *a1, const char *a2, ...)
{
  return [a1 remoteDisplayUpdateDataLinkType];
}

id objc_msgSend_remoteDisplayUpdateErrorFlags_(void *a1, const char *a2, ...)
{
  return [a1 remoteDisplayUpdateErrorFlags:];
}

id objc_msgSend_remoteIdentity(void *a1, const char *a2, ...)
{
  return _[a1 remoteIdentity];
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return _[a1 remoteObjectProxy];
}

id objc_msgSend_remoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return [a1 remoteObjectProxyWithErrorHandler:];
}

id objc_msgSend_remoteValidationMessage(void *a1, const char *a2, ...)
{
  return _[a1 remoteValidationMessage];
}

id objc_msgSend_removeAgentClient_isFlowHandler_(void *a1, const char *a2, ...)
{
  return [a1 removeAgentClient:isFlowHandler:];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _[a1 removeAllObjects];
}

id objc_msgSend_removeBonjourDevice_(void *a1, const char *a2, ...)
{
  return [a1 removeBonjourDevice:];
}

id objc_msgSend_removeCBDevice_(void *a1, const char *a2, ...)
{
  return [a1 removeCBDevice:];
}

id objc_msgSend_removeConnection_(void *a1, const char *a2, ...)
{
  return [a1 removeConnection:];
}

id objc_msgSend_removeDelegate_(void *a1, const char *a2, ...)
{
  return [a1 removeDelegate:];
}

id objc_msgSend_removeDevice_(void *a1, const char *a2, ...)
{
  return [a1 removeDevice:];
}

id objc_msgSend_removeDiscoverySession_(void *a1, const char *a2, ...)
{
  return [a1 removeDiscoverySession:];
}

id objc_msgSend_removeDiscoverySession_lastEntry_(void *a1, const char *a2, ...)
{
  return [a1 removeDiscoverySession:lastEntry:];
}

id objc_msgSend_removeDiscoverySessionFromAllEndpoints_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "removeDiscoverySessionFromAllEndpoints:");
}

id objc_msgSend_removeEndpointMapping_discoverySessionID_(void *a1, const char *a2, ...)
{
  return [a1 removeEndpointMapping:discoverySessionID:];
}

id objc_msgSend_removeEndpointMapping_discoverySessionID_immediate_(void *a1, const char *a2, ...)
{
  return [a1 removeEndpointMapping:discoverySessionID:immediate:];
}

id objc_msgSend_removeIdentity_error_(void *a1, const char *a2, ...)
{
  return [a1 removeIdentity:error:];
}

id objc_msgSend_removeItemMatchingItem_error_(void *a1, const char *a2, ...)
{
  return [a1 removeItemMatchingItem:error:];
}

id objc_msgSend_removeListenerForApplicationService_(void *a1, const char *a2, ...)
{
  return [a1 removeListenerForApplicationService:];
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return [a1 removeObject:];
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 removeObjectAtIndex:];
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return [a1 removeObjectForKey:];
}

id objc_msgSend_removeObjectsForKeys_(void *a1, const char *a2, ...)
{
  return [a1 removeObjectsForKeys:];
}

id objc_msgSend_removeObjectsInArray_(void *a1, const char *a2, ...)
{
  return [a1 removeObjectsInArray:];
}

id objc_msgSend_removeObserver_forKeyPath_context_(void *a1, const char *a2, ...)
{
  return [a1 removeObserver:forKeyPath:context:];
}

id objc_msgSend_removeObserver_name_object_(void *a1, const char *a2, ...)
{
  return [a1 removeObserver:name:object:];
}

id objc_msgSend_removeRPDevice_(void *a1, const char *a2, ...)
{
  return [a1 removeRPDevice:];
}

id objc_msgSend_removeSFDevice_(void *a1, const char *a2, ...)
{
  return [a1 removeSFDevice:];
}

id objc_msgSend_removeSessionPairedIdentityWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 removeSessionPairedIdentityWithIdentifier:];
}

id objc_msgSend_removeTriggeredConnection(void *a1, const char *a2, ...)
{
  return _[a1 removeTriggeredConnection];
}

id objc_msgSend_removeXPCMatchingToken_(void *a1, const char *a2, ...)
{
  return [a1 removeXPCMatchingToken:];
}

id objc_msgSend_replyTime(void *a1, const char *a2, ...)
{
  return _[a1 replyTime];
}

id objc_msgSend_reportChangedDevice_changes_(void *a1, const char *a2, ...)
{
  return [a1 reportChangedDevice:changes:];
}

id objc_msgSend_reportFoundDevice_outReason_(void *a1, const char *a2, ...)
{
  return [a1 reportFoundDevice:outReason:];
}

id objc_msgSend_reportLostDevice_(void *a1, const char *a2, ...)
{
  return [a1 reportLostDevice:];
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return _[a1 request];
}

id objc_msgSend_requestID(void *a1, const char *a2, ...)
{
  return _[a1 requestID];
}

id objc_msgSend_requestSize(void *a1, const char *a2, ...)
{
  return _[a1 requestSize];
}

id objc_msgSend_requiredAgentDomain_agentType_(void *a1, const char *a2, ...)
{
  return [a1 requiredAgentDomain:agentType:];
}

id objc_msgSend_resetHomeKitUserIdentifiers(void *a1, const char *a2, ...)
{
  return _[a1 resetHomeKitUserIdentifiers];
}

id objc_msgSend_resolvableAccessories(void *a1, const char *a2, ...)
{
  return _[a1 resolvableAccessories];
}

id objc_msgSend_resolvableAccessoriesUpdated_(void *a1, const char *a2, ...)
{
  return [a1 resolvableAccessoriesUpdated:];
}

id objc_msgSend_resolveIdentitiesForBonjourDevice_typeFlags_(void *a1, const char *a2, ...)
{
  return [a1 resolveIdentitiesForBonjourDevice:typeFlags:];
}

id objc_msgSend_resolveIdentityForBonjourDevice_typeFlags_(void *a1, const char *a2, ...)
{
  return [a1 resolveIdentityForBonjourDevice:typeFlags:];
}

id objc_msgSend_resolveIdentityForNearFieldMessagePayload_(void *a1, const char *a2, ...)
{
  return [a1 resolveIdentityForNearFieldMessagePayload:];
}

id objc_msgSend_resolveIdentityForTempAuthTagData_bluetoothAddressData_(void *a1, const char *a2, ...)
{
  return [a1 resolveIdentityForTempAuthTagData:x0 bluetoothAddressData:x1];
}

id objc_msgSend_resolvePeer_controlFlags_applicationService_clientPublicKey_resolveHandler_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "resolvePeer:controlFlags:applicationService:clientPublicKey:resolveHandler:");
}

id objc_msgSend_responseCodeToString_(void *a1, const char *a2, ...)
{
  return [a1 responseCodeToString:];
}

id objc_msgSend_responseHandler(void *a1, const char *a2, ...)
{
  return _[a1 responseHandler];
}

id objc_msgSend_responseSize(void *a1, const char *a2, ...)
{
  return _[a1 responseSize];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _[a1 resume];
}

id objc_msgSend_role(void *a1, const char *a2, ...)
{
  return _[a1 role];
}

id objc_msgSend_roleBroadcastInBackground(void *a1, const char *a2, ...)
{
  return _[a1 roleBroadcastInBackground];
}

id objc_msgSend_room(void *a1, const char *a2, ...)
{
  return _[a1 room];
}

id objc_msgSend_roomName(void *a1, const char *a2, ...)
{
  return _[a1 roomName];
}

id objc_msgSend_rotatingIdentifierData(void *a1, const char *a2, ...)
{
  return _[a1 rotatingIdentifierData];
}

id objc_msgSend_rpHomeKitManager(void *a1, const char *a2, ...)
{
  return _[a1 rpHomeKitManager];
}

id objc_msgSend_rpcFetchAndProcessChanges_reply_(void *a1, const char *a2, ...)
{
  return [a1 rpcFetchAndProcessChanges:reply:];
}

id objc_msgSend_rssi(void *a1, const char *a2, ...)
{
  return _[a1 rssi];
}

id objc_msgSend_rssiThreshold(void *a1, const char *a2, ...)
{
  return _[a1 rssiThreshold];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return _[a1 run];
}

id objc_msgSend_runWithConfiguration_(void *a1, const char *a2, ...)
{
  return [a1 runWithConfiguration:];
}

id objc_msgSend_saveDedicatedDevice_(void *a1, const char *a2, ...)
{
  return [a1 saveDedicatedDevice:];
}

id objc_msgSend_saveIdentity_error_(void *a1, const char *a2, ...)
{
  return [a1 saveIdentity:error];
}

id objc_msgSend_saveIdentityWithIDSDeviceID_message_error_(void *a1, const char *a2, ...)
{
  return [a1 saveIdentityWithIDSDeviceID:message:error:];
}

id objc_msgSend_scanRate(void *a1, const char *a2, ...)
{
  return _[a1 scanRate];
}

id objc_msgSend_screenLocked(void *a1, const char *a2, ...)
{
  return _[a1 screenLocked];
}

id objc_msgSend_screenOn(void *a1, const char *a2, ...)
{
  return _[a1 screenOn];
}

id objc_msgSend_secretKey(void *a1, const char *a2, ...)
{
  return _[a1 secretKey];
}

id objc_msgSend_seenBySession_(void *a1, const char *a2, ...)
{
  return [a1 seenBySession:];
}

id objc_msgSend_selfAccessory(void *a1, const char *a2, ...)
{
  return _[a1 selfAccessory];
}

id objc_msgSend_selfAccessoryMediaAccessFlags(void *a1, const char *a2, ...)
{
  return _[a1 selfAccessoryMediaAccessFlags];
}

id objc_msgSend_selfAccessoryMediaAccessPassword(void *a1, const char *a2, ...)
{
  return _[a1 selfAccessoryMediaAccessPassword];
}

id objc_msgSend_selfAccessoryMediaSystem(void *a1, const char *a2, ...)
{
  return _[a1 selfAccessoryMediaSystem];
}

id objc_msgSend_selfAccessoryMediaSystemRole(void *a1, const char *a2, ...)
{
  return _[a1 selfAccessoryMediaSystemRole];
}

id objc_msgSend_selfAccessorySiriEnabled(void *a1, const char *a2, ...)
{
  return _[a1 selfAccessorySiriEnabled];
}

id objc_msgSend_sendData_fromAccount_toDestinations_priority_options_identifier_error_(void *a1, const char *a2, ...)
{
  return [a1 sendData:x0 fromAccount:x1 toDestinations:x2 priority:x3 options:x4 identifier:x5 error:x6];
}

id objc_msgSend_sendData_toDestinations_priority_options_identifier_error_(void *a1, const char *a2, ...)
{
  return [a1 sendData:x0 toDestinations:x1 priority:x2 options:x3 identifier:x4 error:x5];
}

id objc_msgSend_sendDataForConnection_applicationService_connectionID_responseHandler_(void *a1, const char *a2, ...)
{
  return [a1 sendDataForConnection:x0 applicationService:x1 connectionID:x2 responseHandler:x3];
}

id objc_msgSend_sendEncryptedEventID_data_xid_options_completion_(void *a1, const char *a2, ...)
{
  return [a1 sendEncryptedEventID:x0 data:x1 xid:x2 options:x3 completion:x4];
}

id objc_msgSend_sendEncryptedEventID_event_options_completion_(void *a1, const char *a2, ...)
{
  return [a1 sendEncryptedEventID:x0 event:x1 options:x2 completion:x3];
}

id objc_msgSend_sendEncryptedRequestID_request_xpcID_options_responseHandler_(void *a1, const char *a2, ...)
{
  return [a1 sendEncryptedRequestID:x0 request:x1 xpcID:x2 options:x3 responseHandler:x4];
}

id objc_msgSend_sendEventID_event_destinationID_options_completion_(void *a1, const char *a2, ...)
{
  return [a1 sendEventID:event:destinationID:options:completion:];
}

id objc_msgSend_sendEventID_event_options_completion_(void *a1, const char *a2, ...)
{
  return [a1 sendEventID:event:options:completion:];
}

id objc_msgSend_sendHandoverRequest_responseHandler_(void *a1, const char *a2, ...)
{
  return [a1 sendHandoverRequest:responseHandler:];
}

id objc_msgSend_sendHandoverSelect_delay_completionHandler_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "sendHandoverSelect:delay:completionHandler:");
}

id objc_msgSend_sendHandoverSelect_error_(void *a1, const char *a2, ...)
{
  return [a1 sendHandoverSelect:error:];
}

id objc_msgSend_sendIDSMessage_cloudServiceID_frameType_destinationDevice_sendFlags_msgCtx_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "sendIDSMessage:cloudServiceID:frameType:destinationDevice:sendFlags:msgCtx:error:");
}

id objc_msgSend_sendIDSMessage_cloudServiceID_frameType_destinationID_sendFlags_msgCtx_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "sendIDSMessage:cloudServiceID:frameType:destinationID:sendFlags:msgCtx:error:");
}

id objc_msgSend_sendReachabilityProbe_(void *a1, const char *a2, ...)
{
  return [a1 sendReachabilityProbe:];
}

id objc_msgSend_sendRequestID_request_destinationID_options_responseHandler_(void *a1, const char *a2, ...)
{
  return [a1 sendRequestID:x0 request:x1 destinationID:x2 options:x3 responseHandler:x4];
}

id objc_msgSend_sendRequestID_request_destinationID_xpcID_options_responseHandler_(void *a1, const char *a2, ...)
{
  return [a1 sendRequestID:x0 request:x1 destinationID:x2 xpcID:x3 options:x4 responseHandler:x5];
}

id objc_msgSend_sendRequestID_request_options_responseHandler_(void *a1, const char *a2, ...)
{
  return [a1 sendRequestID:x0 request:x1 options:x2 responseHandler:x3];
}

id objc_msgSend_sendSampleForDevice_(void *a1, const char *a2, ...)
{
  return [a1 sendSampleForDevice:];
}

id objc_msgSend_sendStatusUpdate_(void *a1, const char *a2, ...)
{
  return [a1 sendStatusUpdate:];
}

id objc_msgSend_sendStatusUpdateForConnection_connectionID_status_responseHandler_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "sendStatusUpdateForConnection:connectionID:status:responseHandler:");
}

id objc_msgSend_sendTicks(void *a1, const char *a2, ...)
{
  return _[a1 sendTicks];
}

id objc_msgSend_sendWithRequestID_data_status_applicationService_clientPublicKey_listenerID_automapListener_connectionID_responseHandler_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "sendWithRequestID:data:status:applicationService:clientPublicKey:listenerID:automapListener:connectionID:responseHandler:");
}

id objc_msgSend_sendWithRequestID_data_status_applicationService_listenerID_connectionID_responseHandler_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "sendWithRequestID:data:status:applicationService:listenerID:connectionID:responseHandler:");
}

id objc_msgSend_senderCorrelationIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 senderCorrelationIdentifier];
}

id objc_msgSend_sendersKnownAlias(void *a1, const char *a2, ...)
{
  return _[a1 sendersKnownAlias];
}

id objc_msgSend_server(void *a1, const char *a2, ...)
{
  return _[a1 server];
}

id objc_msgSend_serverNetCnxs(void *a1, const char *a2, ...)
{
  return _[a1 serverNetCnxs];
}

id objc_msgSend_serversChangedState(void *a1, const char *a2, ...)
{
  return _[a1 serversChangedState];
}

id objc_msgSend_serviceType(void *a1, const char *a2, ...)
{
  return _[a1 serviceType];
}

id objc_msgSend_serviceTypes(void *a1, const char *a2, ...)
{
  return _[a1 serviceTypes];
}

id objc_msgSend_serviceWithDefaultShellEndpoint(void *a1, const char *a2, ...)
{
  return _[a1 serviceWithDefaultShellEndpoint];
}

id objc_msgSend_session(void *a1, const char *a2, ...)
{
  return _[a1 session];
}

id objc_msgSend_sessionActivatedWithError_(void *a1, const char *a2, ...)
{
  return [a1 sessionActivatedWithError:];
}

id objc_msgSend_sessionEndedWithID_netCnx_(void *a1, const char *a2, ...)
{
  return [a1 sessionEndedWithID:netCnx:];
}

id objc_msgSend_sessionID(void *a1, const char *a2, ...)
{
  return _[a1 sessionID];
}

id objc_msgSend_sessionPairingIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 sessionPairingIdentifier];
}

id objc_msgSend_sessionStartSend_session_xpcID_destinationID_completion_(void *a1, const char *a2, ...)
{
  return [a1 sessionStartSend:x0 session:x1 xpcID:x2 destinationID:x3 completion:x4];
}

id objc_msgSend_sessionStartWithID_netCnx_completion_(void *a1, const char *a2, ...)
{
  return [a1 sessionStartWithID:netCnx:completion:];
}

id objc_msgSend_sessionStopSend_session_xpcID_completion_(void *a1, const char *a2, ...)
{
  return [a1 sessionStopSend:session:xpcID:completion:];
}

id objc_msgSend_sessionStopped_(void *a1, const char *a2, ...)
{
  return [a1 sessionStopped:];
}

id objc_msgSend_sessions(void *a1, const char *a2, ...)
{
  return _[a1 sessions];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _[a1 set];
}

id objc_msgSend_setAccessGroup_(void *a1, const char *a2, ...)
{
  return [a1 setAccessGroup:];
}

id objc_msgSend_setAccessibleType_(void *a1, const char *a2, ...)
{
  return [a1 setAccessibleType:];
}

id objc_msgSend_setAccountAltDSID_(void *a1, const char *a2, ...)
{
  return [a1 setAccountAltDSID:];
}

id objc_msgSend_setAccountID_(void *a1, const char *a2, ...)
{
  return [a1 setAccountID:];
}

id objc_msgSend_setActionHandler_(void *a1, const char *a2, ...)
{
  return [a1 setActionHandler:];
}

id objc_msgSend_setActiveServers_(void *a1, const char *a2, ...)
{
  return [a1 setActiveServers:];
}

id objc_msgSend_setActivityLevel_(void *a1, const char *a2, ...)
{
  return [a1 setActivityLevel:];
}

id objc_msgSend_setAdvertiseFlags_(void *a1, const char *a2, ...)
{
  return [a1 setAdvertiseFlags:];
}

id objc_msgSend_setAdvertiseRate_(void *a1, const char *a2, ...)
{
  return [a1 setAdvertiseRate:];
}

id objc_msgSend_setAgeOutListenerTimer_(void *a1, const char *a2, ...)
{
  return [a1 setAgeOutListenerTimer:];
}

id objc_msgSend_setAgeOutTimeout_(void *a1, const char *a2, ...)
{
  return [a1 setAgeOutTimeout:];
}

id objc_msgSend_setAgentClient_(void *a1, const char *a2, ...)
{
  return [a1 setAgentClient:];
}

id objc_msgSend_setAgentClientID_(void *a1, const char *a2, ...)
{
  return [a1 setAgentClientID:];
}

id objc_msgSend_setAgentUUID_(void *a1, const char *a2, ...)
{
  return [a1 setAgentUUID:];
}

id objc_msgSend_setAllUsedSendersKnownAliases_(void *a1, const char *a2, ...)
{
  return [a1 setAllUsedSendersKnownAliases:];
}

id objc_msgSend_setAllowedDevices_(void *a1, const char *a2, ...)
{
  return [a1 setAllowedDevices:];
}

id objc_msgSend_setAllowedMACAddresses_(void *a1, const char *a2, ...)
{
  return [a1 setAllowedMACAddresses:];
}

id objc_msgSend_setAltIRK_(void *a1, const char *a2, ...)
{
  return [a1 setAltIRK:];
}

id objc_msgSend_setAngelAssertionName_(void *a1, const char *a2, ...)
{
  return [a1 setAngelAssertionName:];
}

id objc_msgSend_setAngelJobLabel_(void *a1, const char *a2, ...)
{
  return [a1 setAngelJobLabel:];
}

id objc_msgSend_setAppID_(void *a1, const char *a2, ...)
{
  return [a1 setAppID:];
}

id objc_msgSend_setAppSignIn_(void *a1, const char *a2, ...)
{
  return [a1 setAppSignIn:];
}

id objc_msgSend_setAppleID_(void *a1, const char *a2, ...)
{
  return [a1 setAppleID:];
}

id objc_msgSend_setApplicationService_(void *a1, const char *a2, ...)
{
  return [a1 setApplicationService:];
}

id objc_msgSend_setAuthCompletionHandler_(void *a1, const char *a2, ...)
{
  return [a1 setAuthCompletionHandler:];
}

id objc_msgSend_setAutoMapping_(void *a1, const char *a2, ...)
{
  return [a1 setAutoMapping:];
}

id objc_msgSend_setAutomapped_(void *a1, const char *a2, ...)
{
  return [a1 setAutomapped:];
}

id objc_msgSend_setBecomeInitiatorTimer_(void *a1, const char *a2, ...)
{
  return [a1 setBecomeInitiatorTimer:];
}

id objc_msgSend_setBleClientUseCase_(void *a1, const char *a2, ...)
{
  return [a1 setBleClientUseCase:];
}

id objc_msgSend_setBleConnection_(void *a1, const char *a2, ...)
{
  return [a1 setBleConnection:];
}

id objc_msgSend_setBleConnectionPSM_(void *a1, const char *a2, ...)
{
  return [a1 setBleConnectionPSM:];
}

id objc_msgSend_setBleDeviceAcceptedInvitations_(void *a1, const char *a2, ...)
{
  return [a1 setBleDeviceAcceptedInvitations:];
}

id objc_msgSend_setBleDeviceWantingInvitations_(void *a1, const char *a2, ...)
{
  return [a1 setBleDeviceWantingInvitations:];
}

id objc_msgSend_setBlePeerIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setBlePeerIdentifier:];
}

id objc_msgSend_setBleRSSIThresholdHint_(void *a1, const char *a2, ...)
{
  return [a1 setBleRSSIThresholdHint:];
}

id objc_msgSend_setBleScanRate_(void *a1, const char *a2, ...)
{
  return [a1 setBleScanRate:];
}

id objc_msgSend_setBleScanRateScreenOff_(void *a1, const char *a2, ...)
{
  return [a1 setBleScanRateScreenOff:];
}

id objc_msgSend_setBleScreenOffRescanInterval_(void *a1, const char *a2, ...)
{
  return [a1 setBleScreenOffRescanInterval:];
}

id objc_msgSend_setBleScreenOffScanRate_(void *a1, const char *a2, ...)
{
  return [a1 setBleScreenOffScanRate:];
}

id objc_msgSend_setBluetoothAddressChangedHandler_(void *a1, const char *a2, ...)
{
  return [a1 setBluetoothAddressChangedHandler:];
}

id objc_msgSend_setBodyArguments_(void *a1, const char *a2, ...)
{
  return [a1 setBodyArguments:];
}

id objc_msgSend_setBodyKey_(void *a1, const char *a2, ...)
{
  return [a1 setBodyKey:];
}

id objc_msgSend_setBonjourDevice_(void *a1, const char *a2, ...)
{
  return [a1 setBonjourDevice:];
}

id objc_msgSend_setBonjourPeerDevice_(void *a1, const char *a2, ...)
{
  return [a1 setBonjourPeerDevice:];
}

id objc_msgSend_setBrowseClient_(void *a1, const char *a2, ...)
{
  return [a1 setBrowseClient:];
}

id objc_msgSend_setBrowseFlags_(void *a1, const char *a2, ...)
{
  return [a1 setBrowseFlags:];
}

id objc_msgSend_setBrowseResponse_(void *a1, const char *a2, ...)
{
  return [a1 setBrowseResponse:];
}

id objc_msgSend_setBrowseSession_(void *a1, const char *a2, ...)
{
  return [a1 setBrowseSession:];
}

id objc_msgSend_setBtAddress_(void *a1, const char *a2, ...)
{
  return [a1 setBtAddress:];
}

id objc_msgSend_setBtIRKData_(void *a1, const char *a2, ...)
{
  return [a1 setBtIRKData:];
}

id objc_msgSend_setBtPipe_(void *a1, const char *a2, ...)
{
  return [a1 setBtPipe:];
}

id objc_msgSend_setBtPipeHighPriority_(void *a1, const char *a2, ...)
{
  return [a1 setBtPipeHighPriority:];
}

id objc_msgSend_setBundleID_(void *a1, const char *a2, ...)
{
  return [a1 setBundleID:];
}

id objc_msgSend_setCameraCapabilities_(void *a1, const char *a2, ...)
{
  return [a1 setCameraCapabilities:];
}

id objc_msgSend_setCameraCapabilitiesRefetchTimer_(void *a1, const char *a2, ...)
{
  return [a1 setCameraCapabilitiesRefetchTimer:];
}

id objc_msgSend_setCameraCapabilityRequestIsActive_(void *a1, const char *a2, ...)
{
  return [a1 setCameraCapabilityRequestIsActive:];
}

id objc_msgSend_setCategoryID_(void *a1, const char *a2, ...)
{
  return [a1 setCategoryID:];
}

id objc_msgSend_setChangeFlags_(void *a1, const char *a2, ...)
{
  return [a1 setChangeFlags:];
}

id objc_msgSend_setChanged_(void *a1, const char *a2, ...)
{
  return [a1 setChanged:];
}

id objc_msgSend_setChannel_(void *a1, const char *a2, ...)
{
  return [a1 setChannel:];
}

id objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(void *a1, const char *a2, ...)
{
  return [a1 setClass:forSelector:argumentIndex:ofReply:];
}

id objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(void *a1, const char *a2, ...)
{
  return [a1 setClasses:forSelector:argumentIndex:ofReply:];
}

id objc_msgSend_setClient_(void *a1, const char *a2, ...)
{
  return [a1 setClient:];
}

id objc_msgSend_setClientBundleID_(void *a1, const char *a2, ...)
{
  return [a1 setClientBundleID:];
}

id objc_msgSend_setCloudDaemon_(void *a1, const char *a2, ...)
{
  return [a1 setCloudDaemon:];
}

id objc_msgSend_setCloudServiceID_(void *a1, const char *a2, ...)
{
  return [a1 setCloudServiceID:];
}

id objc_msgSend_setCnx_(void *a1, const char *a2, ...)
{
  return [a1 setCnx:];
}

id objc_msgSend_setCnxHandler_(void *a1, const char *a2, ...)
{
  return [a1 setCnxHandler:];
}

id objc_msgSend_setConfigurePairingHandler_(void *a1, const char *a2, ...)
{
  return [a1 setConfigurePairingHandler:];
}

id objc_msgSend_setConnectToReceiverTimer_(void *a1, const char *a2, ...)
{
  return [a1 setConnectToReceiverTimer:];
}

id objc_msgSend_setConnection_(void *a1, const char *a2, ...)
{
  return [a1 setConnection:];
}

id objc_msgSend_setConnectionEndedHandler_(void *a1, const char *a2, ...)
{
  return [a1 setConnectionEndedHandler:];
}

id objc_msgSend_setConnectionPrepareHandler_(void *a1, const char *a2, ...)
{
  return [a1 setConnectionPrepareHandler:];
}

id objc_msgSend_setConnectionStartedHandler_(void *a1, const char *a2, ...)
{
  return [a1 setConnectionStartedHandler:];
}

id objc_msgSend_setConnectionUUID_(void *a1, const char *a2, ...)
{
  return [a1 setConnectionUUID:];
}

id objc_msgSend_setContactID_(void *a1, const char *a2, ...)
{
  return [a1 setContactID:];
}

id objc_msgSend_setContactIDs_(void *a1, const char *a2, ...)
{
  return [a1 setContactIDs:];
}

id objc_msgSend_setContactIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setContactIdentifier:];
}

id objc_msgSend_setControlFlags_(void *a1, const char *a2, ...)
{
  return [a1 setControlFlags:];
}

id objc_msgSend_setCopyIdentityHandler_(void *a1, const char *a2, ...)
{
  return [a1 setCopyIdentityHandler:];
}

id objc_msgSend_setCurrentContext_(void *a1, const char *a2, ...)
{
  return [a1 setCurrentContext:];
}

id objc_msgSend_setCurrentHome_(void *a1, const char *a2, ...)
{
  return [a1 setCurrentHome:];
}

id objc_msgSend_setCurrentPreferredPollingType_(void *a1, const char *a2, ...)
{
  return [a1 setCurrentPreferredPollingType:];
}

id objc_msgSend_setCurrentTransaction_(void *a1, const char *a2, ...)
{
  return [a1 setCurrentTransaction:];
}

id objc_msgSend_setCurrentUser_(void *a1, const char *a2, ...)
{
  return [a1 setCurrentUser:];
}

id objc_msgSend_setDaemon_(void *a1, const char *a2, ...)
{
  return [a1 setDaemon:];
}

id objc_msgSend_setDaemonDevice_(void *a1, const char *a2, ...)
{
  return [a1 setDaemonDevice:];
}

id objc_msgSend_setDataSource_(void *a1, const char *a2, ...)
{
  return [a1 setDataSource:];
}

id objc_msgSend_setDateAcknowledged_(void *a1, const char *a2, ...)
{
  return [a1 setDateAcknowledged:];
}

id objc_msgSend_setDateAdded_(void *a1, const char *a2, ...)
{
  return [a1 setDateAdded:];
}

id objc_msgSend_setDateFormat_(void *a1, const char *a2, ...)
{
  return [a1 setDateFormat:];
}

id objc_msgSend_setDateRemoved_(void *a1, const char *a2, ...)
{
  return [a1 setDateRemoved:];
}

id objc_msgSend_setDateRequested_(void *a1, const char *a2, ...)
{
  return [a1 setDateRequested:];
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setDelegate:];
}

id objc_msgSend_setDelegateQueue_(void *a1, const char *a2, ...)
{
  return [a1 setDelegateQueue:];
}

id objc_msgSend_setDestination_(void *a1, const char *a2, ...)
{
  return [a1 setDestination:];
}

id objc_msgSend_setDestinationDevice_(void *a1, const char *a2, ...)
{
  return [a1 setDestinationDevice:];
}

id objc_msgSend_setDestinationString_(void *a1, const char *a2, ...)
{
  return [a1 setDestinationString:];
}

id objc_msgSend_setDevice_(void *a1, const char *a2, ...)
{
  return [a1 setDevice:];
}

id objc_msgSend_setDeviceActionType_(void *a1, const char *a2, ...)
{
  return [a1 setDeviceActionType:];
}

id objc_msgSend_setDeviceAddress_(void *a1, const char *a2, ...)
{
  return [a1 setDeviceAddress:];
}

id objc_msgSend_setDeviceChangedHandler_(void *a1, const char *a2, ...)
{
  return [a1 setDeviceChangedHandler:];
}

id objc_msgSend_setDeviceColor_(void *a1, const char *a2, ...)
{
  return [a1 setDeviceColor:];
}

id objc_msgSend_setDeviceConfirmedIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setDeviceConfirmedIdentifier:];
}

id objc_msgSend_setDeviceFilter_(void *a1, const char *a2, ...)
{
  return [a1 setDeviceFilter:];
}

id objc_msgSend_setDeviceFlags_(void *a1, const char *a2, ...)
{
  return [a1 setDeviceFlags:];
}

id objc_msgSend_setDeviceFoundHandler_(void *a1, const char *a2, ...)
{
  return [a1 setDeviceFoundHandler:];
}

id objc_msgSend_setDeviceIRKData_(void *a1, const char *a2, ...)
{
  return [a1 setDeviceIRKData:];
}

id objc_msgSend_setDeviceInfoChangedHandler_(void *a1, const char *a2, ...)
{
  return [a1 setDeviceInfoChangedHandler:];
}

id objc_msgSend_setDeviceLostHandler_(void *a1, const char *a2, ...)
{
  return [a1 setDeviceLostHandler:];
}

id objc_msgSend_setDeviceModel_(void *a1, const char *a2, ...)
{
  return [a1 setDeviceModel:];
}

id objc_msgSend_setDeviceName_(void *a1, const char *a2, ...)
{
  return [a1 setDeviceName:];
}

id objc_msgSend_setDeviceRegionChangedHandler_(void *a1, const char *a2, ...)
{
  return [a1 setDeviceRegionChangedHandler:];
}

id objc_msgSend_setDirect_(void *a1, const char *a2, ...)
{
  return [a1 setDirect:];
}

id objc_msgSend_setDisconnectHandler_(void *a1, const char *a2, ...)
{
  return [a1 setDisconnectHandler:];
}

id objc_msgSend_setDiscoveryFlags_(void *a1, const char *a2, ...)
{
  return [a1 setDiscoveryFlags:];
}

id objc_msgSend_setDiscoveryTimer_(void *a1, const char *a2, ...)
{
  return [a1 setDiscoveryTimer:];
}

id objc_msgSend_setDiscoveryType_(void *a1, const char *a2, ...)
{
  return [a1 setDiscoveryType:];
}

id objc_msgSend_setDispatchQueue_(void *a1, const char *a2, ...)
{
  return [a1 setDispatchQueue:];
}

id objc_msgSend_setDomain_(void *a1, const char *a2, ...)
{
  return [a1 setDomain:];
}

id objc_msgSend_setEdPKData_(void *a1, const char *a2, ...)
{
  return [a1 setEdPKData:];
}

id objc_msgSend_setEdSKData_(void *a1, const char *a2, ...)
{
  return [a1 setEdSKData:];
}

id objc_msgSend_setEmailAddress_(void *a1, const char *a2, ...)
{
  return [a1 setEmailAddress:];
}

id objc_msgSend_setEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setEnabled:];
}

id objc_msgSend_setEncodeSensitiveProperties_(void *a1, const char *a2, ...)
{
  return [a1 setEncodeSensitiveProperties:];
}

id objc_msgSend_setEndpointUUID_(void *a1, const char *a2, ...)
{
  return [a1 setEndpointUUID:];
}

id objc_msgSend_setEntitled_(void *a1, const char *a2, ...)
{
  return [a1 setEntitled:];
}

id objc_msgSend_setError_(void *a1, const char *a2, ...)
{
  return [a1 setError:];
}

id objc_msgSend_setErrorFlags_(void *a1, const char *a2, ...)
{
  return [a1 setErrorFlags:];
}

id objc_msgSend_setErrorHandler_(void *a1, const char *a2, ...)
{
  return [a1 setErrorHandler:];
}

id objc_msgSend_setEvent_(void *a1, const char *a2, ...)
{
  return [a1 setEvent:];
}

id objc_msgSend_setEventID_(void *a1, const char *a2, ...)
{
  return [a1 setEventID:];
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return [a1 setExportedInterface:];
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return [a1 setExportedObject:];
}

id objc_msgSend_setFailedToConnect_(void *a1, const char *a2, ...)
{
  return [a1 setFailedToConnect:];
}

id objc_msgSend_setFamilyUpdatedHandler_(void *a1, const char *a2, ...)
{
  return [a1 setFamilyUpdatedHandler:];
}

id objc_msgSend_setFeatureFlags_(void *a1, const char *a2, ...)
{
  return [a1 setFeatureFlags:];
}

id objc_msgSend_setFirstUnlockHandler_(void *a1, const char *a2, ...)
{
  return [a1 setFirstUnlockHandler:];
}

id objc_msgSend_setFlags_(void *a1, const char *a2, ...)
{
  return [a1 setFlags:];
}

id objc_msgSend_setFlowAssignHandler_(void *a1, const char *a2, ...)
{
  return [a1 setFlowAssignHandler:];
}

id objc_msgSend_setFlowClient_(void *a1, const char *a2, ...)
{
  return [a1 setFlowClient:];
}

id objc_msgSend_setFrameType_(void *a1, const char *a2, ...)
{
  return [a1 setFrameType:];
}

id objc_msgSend_setFramer_(void *a1, const char *a2, ...)
{
  return [a1 setFramer:];
}

id objc_msgSend_setFromID_(void *a1, const char *a2, ...)
{
  return [a1 setFromID:];
}

id objc_msgSend_setHandler_(void *a1, const char *a2, ...)
{
  return [a1 setHandler:];
}

id objc_msgSend_setHidePasswordHandler_(void *a1, const char *a2, ...)
{
  return [a1 setHidePasswordHandler:];
}

id objc_msgSend_setHomeKitIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setHomeKitIdentifier:];
}

id objc_msgSend_setHomeKitIdentity_(void *a1, const char *a2, ...)
{
  return [a1 setHomeKitIdentity:];
}

id objc_msgSend_setHomeKitManager_(void *a1, const char *a2, ...)
{
  return [a1 setHomeKitManager:];
}

id objc_msgSend_setHomeKitUserIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setHomeKitUserIdentifier:];
}

id objc_msgSend_setHomeKitUserIdentifierHandler_(void *a1, const char *a2, ...)
{
  return [a1 setHomeKitUserIdentifierHandler:];
}

id objc_msgSend_setHomeKitUserIdentifiers_(void *a1, const char *a2, ...)
{
  return [a1 setHomeKitUserIdentifiers:];
}

id objc_msgSend_setHost_(void *a1, const char *a2, ...)
{
  return [a1 setHost:];
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setIdentifier:];
}

id objc_msgSend_setIdentifierOverride_(void *a1, const char *a2, ...)
{
  return [a1 setIdentifierOverride:];
}

id objc_msgSend_setIdentityDaemon_(void *a1, const char *a2, ...)
{
  return [a1 setIdentityDaemon:];
}

id objc_msgSend_setIdentityResolved_(void *a1, const char *a2, ...)
{
  return [a1 setIdentityResolved:];
}

id objc_msgSend_setIdsCorrelationIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setIdsCorrelationIdentifier:];
}

id objc_msgSend_setIdsDevice_(void *a1, const char *a2, ...)
{
  return [a1 setIdsDevice:];
}

id objc_msgSend_setIdsDeviceID_(void *a1, const char *a2, ...)
{
  return [a1 setIdsDeviceID:];
}

id objc_msgSend_setIdsDeviceIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setIdsDeviceIdentifier:];
}

id objc_msgSend_setIdsPersonalDeviceIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setIdsPersonalDeviceIdentifier:];
}

id objc_msgSend_setInBubble_(void *a1, const char *a2, ...)
{
  return [a1 setInBubble:];
}

id objc_msgSend_setInbound_(void *a1, const char *a2, ...)
{
  return [a1 setInbound:];
}

id objc_msgSend_setInitiatorLimitTimer_(void *a1, const char *a2, ...)
{
  return [a1 setInitiatorLimitTimer:];
}

id objc_msgSend_setInitiatorState_(void *a1, const char *a2, ...)
{
  return [a1 setInitiatorState:];
}

id objc_msgSend_setInnerPresencePreset_(void *a1, const char *a2, ...)
{
  return [a1 setInnerPresencePreset:];
}

id objc_msgSend_setInnerRegionName_(void *a1, const char *a2, ...)
{
  return [a1 setInnerRegionName:];
}

id objc_msgSend_setInterfaceAddress_(void *a1, const char *a2, ...)
{
  return [a1 setInterfaceAddress:];
}

id objc_msgSend_setInterfaceIndex_(void *a1, const char *a2, ...)
{
  return [a1 setInterfaceIndex:];
}

id objc_msgSend_setInterfaceName_(void *a1, const char *a2, ...)
{
  return [a1 setInterfaceName:];
}

id objc_msgSend_setInternal_(void *a1, const char *a2, ...)
{
  return [a1 setInternal:];
}

id objc_msgSend_setInterruptionHandler_(void *a1, const char *a2, ...)
{
  return [a1 setInterruptionHandler:];
}

id objc_msgSend_setInvalidationHandled_(void *a1, const char *a2, ...)
{
  return [a1 setInvalidationHandled:];
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return [a1 setInvalidationHandler:];
}

id objc_msgSend_setInvisible_(void *a1, const char *a2, ...)
{
  return [a1 setInvisible:];
}

id objc_msgSend_setIsActive_(void *a1, const char *a2, ...)
{
  return [a1 setIsActive:];
}

id objc_msgSend_setIsBLEDeviceReplaced_(void *a1, const char *a2, ...)
{
  return [a1 setIsBLEDeviceReplaced:];
}

id objc_msgSend_setIsConnected_(void *a1, const char *a2, ...)
{
  return [a1 setIsConnected:];
}

id objc_msgSend_setIsRunning_(void *a1, const char *a2, ...)
{
  return [a1 setIsRunning:];
}

id objc_msgSend_setKeepAliveSeconds_(void *a1, const char *a2, ...)
{
  return [a1 setKeepAliveSeconds:];
}

id objc_msgSend_setLabel_(void *a1, const char *a2, ...)
{
  return [a1 setLabel:];
}

id objc_msgSend_setLinkType_(void *a1, const char *a2, ...)
{
  return [a1 setLinkType:];
}

id objc_msgSend_setListenPSM_(void *a1, const char *a2, ...)
{
  return [a1 setListenPSM:];
}

id objc_msgSend_setListen_framer_(void *a1, const char *a2, ...)
{
  return [a1 setListen_framer:];
}

id objc_msgSend_setListeningPort_(void *a1, const char *a2, ...)
{
  return [a1 setListeningPort:];
}

id objc_msgSend_setLocalAuthenticationMessage_(void *a1, const char *a2, ...)
{
  return [a1 setLocalAuthenticationMessage:];
}

id objc_msgSend_setLocalDeviceInfo_(void *a1, const char *a2, ...)
{
  return [a1 setLocalDeviceInfo:];
}

id objc_msgSend_setLocalDeviceUpdated_(void *a1, const char *a2, ...)
{
  return [a1 setLocalDeviceUpdated:];
}

id objc_msgSend_setLocalEndpoint_(void *a1, const char *a2, ...)
{
  return [a1 setLocalEndpoint:];
}

id objc_msgSend_setLocalValidationMessage_(void *a1, const char *a2, ...)
{
  return [a1 setLocalValidationMessage:];
}

id objc_msgSend_setLocale_(void *a1, const char *a2, ...)
{
  return [a1 setLocale:];
}

id objc_msgSend_setManateeChangedHandler_(void *a1, const char *a2, ...)
{
  return [a1 setManateeChangedHandler:];
}

id objc_msgSend_setMappingID_(void *a1, const char *a2, ...)
{
  return [a1 setMappingID:];
}

id objc_msgSend_setMaxConnectionCount_(void *a1, const char *a2, ...)
{
  return [a1 setMaxConnectionCount:];
}

id objc_msgSend_setMaxDelay_(void *a1, const char *a2, ...)
{
  return [a1 setMaxDelay:];
}

id objc_msgSend_setMaxPeople_(void *a1, const char *a2, ...)
{
  return [a1 setMaxPeople:];
}

id objc_msgSend_setMeDeviceChangedHandler_(void *a1, const char *a2, ...)
{
  return [a1 setMeDeviceChangedHandler:];
}

id objc_msgSend_setMeasurementHandlerEx_(void *a1, const char *a2, ...)
{
  return [a1 setMeasurementHandlerEx:];
}

id objc_msgSend_setMediaRemoteID_(void *a1, const char *a2, ...)
{
  return [a1 setMediaRemoteID:];
}

id objc_msgSend_setMediaRemoteIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setMediaRemoteIdentifier:];
}

id objc_msgSend_setMediaRouteID_(void *a1, const char *a2, ...)
{
  return [a1 setMediaRouteID:];
}

id objc_msgSend_setMediaRouteIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setMediaRouteIdentifier:];
}

id objc_msgSend_setMediaSystemIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setMediaSystemIdentifier:];
}

id objc_msgSend_setMediaSystemIdentifierEffective_(void *a1, const char *a2, ...)
{
  return [a1 setMediaSystemIdentifierEffective:];
}

id objc_msgSend_setMediaSystemName_(void *a1, const char *a2, ...)
{
  return [a1 setMediaSystemName:];
}

id objc_msgSend_setMediaSystemRole_(void *a1, const char *a2, ...)
{
  return [a1 setMediaSystemRole:];
}

id objc_msgSend_setMediaSystemRoleEffective_(void *a1, const char *a2, ...)
{
  return [a1 setMediaSystemRoleEffective:];
}

id objc_msgSend_setMediaSystemState_(void *a1, const char *a2, ...)
{
  return [a1 setMediaSystemState:];
}

id objc_msgSend_setMessage_(void *a1, const char *a2, ...)
{
  return [a1 setMessage:];
}

id objc_msgSend_setMessageType_(void *a1, const char *a2, ...)
{
  return [a1 setMessageType:];
}

id objc_msgSend_setMessenger_(void *a1, const char *a2, ...)
{
  return [a1 setMessenger:];
}

id objc_msgSend_setMetadata_(void *a1, const char *a2, ...)
{
  return [a1 setMetadata:];
}

id objc_msgSend_setMinDelay_(void *a1, const char *a2, ...)
{
  return [a1 setMinDelay:];
}

id objc_msgSend_setModel_(void *a1, const char *a2, ...)
{
  return [a1 setModel:];
}

id objc_msgSend_setMsgCtx_(void *a1, const char *a2, ...)
{
  return [a1 setMsgCtx:];
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return [a1 setName:];
}

id objc_msgSend_setNearFieldController_(void *a1, const char *a2, ...)
{
  return [a1 setNearFieldController:];
}

id objc_msgSend_setNearbyActionType_(void *a1, const char *a2, ...)
{
  return [a1 setNearbyActionType:];
}

id objc_msgSend_setNearbyActionV2Flags_(void *a1, const char *a2, ...)
{
  return [a1 setNearbyActionV2Flags:];
}

id objc_msgSend_setNearbyActionV2TargetData_(void *a1, const char *a2, ...)
{
  return [a1 setNearbyActionV2TargetData:];
}

id objc_msgSend_setNearbyActionV2Type_(void *a1, const char *a2, ...)
{
  return [a1 setNearbyActionV2Type:];
}

id objc_msgSend_setNearbyInvitationConnection_(void *a1, const char *a2, ...)
{
  return [a1 setNearbyInvitationConnection:];
}

id objc_msgSend_setNearbyInvitationServer_(void *a1, const char *a2, ...)
{
  return [a1 setNearbyInvitationServer:];
}

id objc_msgSend_setNearbyInvitationSession_(void *a1, const char *a2, ...)
{
  return [a1 setNearbyInvitationSession:];
}

id objc_msgSend_setNeedsAWDL_(void *a1, const char *a2, ...)
{
  return [a1 setNeedsAWDL:];
}

id objc_msgSend_setNeedsCLink_(void *a1, const char *a2, ...)
{
  return [a1 setNeedsCLink:];
}

id objc_msgSend_setNeedsKeyboard_(void *a1, const char *a2, ...)
{
  return [a1 setNeedsKeyboard:];
}

id objc_msgSend_setNeedsNearbyActionV2_(void *a1, const char *a2, ...)
{
  return [a1 setNeedsNearbyActionV2:];
}

id objc_msgSend_setNetCnx_(void *a1, const char *a2, ...)
{
  return [a1 setNetCnx:];
}

id objc_msgSend_setNetFlagsChangedHandler_(void *a1, const char *a2, ...)
{
  return [a1 setNetFlagsChangedHandler:];
}

id objc_msgSend_setNetLinkManager_(void *a1, const char *a2, ...)
{
  return [a1 setNetLinkManager:];
}

id objc_msgSend_setNonWakingRequest_(void *a1, const char *a2, ...)
{
  return [a1 setNonWakingRequest:];
}

id objc_msgSend_setObject_atIndexedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 setObject:atIndexedSubscript:];
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setObject:forKey:];
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 setObject:forKeyedSubscript:];
}

id objc_msgSend_setOperatingSystemVersion_(void *a1, const char *a2, ...)
{
  return [a1 setOperatingSystemVersion:];
}

id objc_msgSend_setOptions_(void *a1, const char *a2, ...)
{
  return [a1 setOptions:];
}

id objc_msgSend_setOuterRegionName_(void *a1, const char *a2, ...)
{
  return [a1 setOuterRegionName:];
}

id objc_msgSend_setOutgoingBuffer_(void *a1, const char *a2, ...)
{
  return [a1 setOutgoingBuffer:];
}

id objc_msgSend_setOverrideScreenOff_(void *a1, const char *a2, ...)
{
  return [a1 setOverrideScreenOff:];
}

id objc_msgSend_setOverrideScreenOffRescanInterval_(void *a1, const char *a2, ...)
{
  return [a1 setOverrideScreenOffRescanInterval:];
}

id objc_msgSend_setPairSetupACL_(void *a1, const char *a2, ...)
{
  return [a1 setPairSetupACL:];
}

id objc_msgSend_setPairSetupDisabled_(void *a1, const char *a2, ...)
{
  return [a1 setPairSetupDisabled:];
}

id objc_msgSend_setPairVerifyCompletion_(void *a1, const char *a2, ...)
{
  return [a1 setPairVerifyCompletion:];
}

id objc_msgSend_setPassword_(void *a1, const char *a2, ...)
{
  return [a1 setPassword:];
}

id objc_msgSend_setPasswordType_(void *a1, const char *a2, ...)
{
  return [a1 setPasswordType:];
}

id objc_msgSend_setPeer_(void *a1, const char *a2, ...)
{
  return [a1 setPeer:];
}

id objc_msgSend_setPeerHostStateChangedHandler_(void *a1, const char *a2, ...)
{
  return [a1 setPeerHostStateChangedHandler:];
}

id objc_msgSend_setPeerID_(void *a1, const char *a2, ...)
{
  return [a1 setPeerID:];
}

id objc_msgSend_setPeerIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setPeerIdentifier:];
}

id objc_msgSend_setPeerUpdatedHandler_(void *a1, const char *a2, ...)
{
  return [a1 setPeerUpdatedHandler:];
}

id objc_msgSend_setPeers_(void *a1, const char *a2, ...)
{
  return [a1 setPeers:];
}

id objc_msgSend_setPendingInitiator_(void *a1, const char *a2, ...)
{
  return [a1 setPendingInitiator:];
}

id objc_msgSend_setPendingReceiver_(void *a1, const char *a2, ...)
{
  return [a1 setPendingReceiver:];
}

id objc_msgSend_setPersistentIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setPersistentIdentifier:];
}

id objc_msgSend_setPersonal_(void *a1, const char *a2, ...)
{
  return [a1 setPersonal:];
}

id objc_msgSend_setPersonalDeviceState_(void *a1, const char *a2, ...)
{
  return [a1 setPersonalDeviceState:];
}

id objc_msgSend_setPersonalRequestsState_(void *a1, const char *a2, ...)
{
  return [a1 setPersonalRequestsState:];
}

id objc_msgSend_setPersonalRequestsStateChangedHandler_(void *a1, const char *a2, ...)
{
  return [a1 setPersonalRequestsStateChangedHandler:];
}

id objc_msgSend_setPhoneNumber_(void *a1, const char *a2, ...)
{
  return [a1 setPhoneNumber:];
}

id objc_msgSend_setPid_(void *a1, const char *a2, ...)
{
  return [a1 setPid:];
}

id objc_msgSend_setPollingCoolDownTimer_(void *a1, const char *a2, ...)
{
  return [a1 setPollingCoolDownTimer:];
}

id objc_msgSend_setPort_(void *a1, const char *a2, ...)
{
  return [a1 setPort:];
}

id objc_msgSend_setPowerAssertionID_(void *a1, const char *a2, ...)
{
  return [a1 setPowerAssertionID:];
}

id objc_msgSend_setPowerUnlimitedChangedHandler_(void *a1, const char *a2, ...)
{
  return [a1 setPowerUnlimitedChangedHandler:];
}

id objc_msgSend_setPredicates_(void *a1, const char *a2, ...)
{
  return [a1 setPredicates:];
}

id objc_msgSend_setPreferredIdentityType_(void *a1, const char *a2, ...)
{
  return [a1 setPreferredIdentityType:];
}

id objc_msgSend_setPreferredPollingType_(void *a1, const char *a2, ...)
{
  return [a1 setPreferredPollingType:];
}

id objc_msgSend_setPresent_(void *a1, const char *a2, ...)
{
  return [a1 setPresent:];
}

id objc_msgSend_setPrimaryAppleIDChangedHandler_(void *a1, const char *a2, ...)
{
  return [a1 setPrimaryAppleIDChangedHandler:];
}

id objc_msgSend_setPriority_(void *a1, const char *a2, ...)
{
  return [a1 setPriority:];
}

id objc_msgSend_setPromptForPasswordHandler_(void *a1, const char *a2, ...)
{
  return [a1 setPromptForPasswordHandler:];
}

id objc_msgSend_setProxyDeviceUpdateHandler_(void *a1, const char *a2, ...)
{
  return [a1 setProxyDeviceUpdateHandler:];
}

id objc_msgSend_setProxyDevices_(void *a1, const char *a2, ...)
{
  return [a1 setProxyDevices:];
}

id objc_msgSend_setPublicIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setPublicIdentifier:];
}

id objc_msgSend_setPublicKey_(void *a1, const char *a2, ...)
{
  return [a1 setPublicKey:];
}

id objc_msgSend_setPurpose_(void *a1, const char *a2, ...)
{
  return [a1 setPurpose:];
}

id objc_msgSend_setQueryItems_(void *a1, const char *a2, ...)
{
  return [a1 setQueryItems:];
}

id objc_msgSend_setRawRSSI_(void *a1, const char *a2, ...)
{
  return [a1 setRawRSSI:];
}

id objc_msgSend_setReadErrorHandler_(void *a1, const char *a2, ...)
{
  return [a1 setReadErrorHandler:];
}

id objc_msgSend_setReceivedEventHandler_(void *a1, const char *a2, ...)
{
  return [a1 setReceivedEventHandler:];
}

id objc_msgSend_setReceivedRequestHandler_(void *a1, const char *a2, ...)
{
  return [a1 setReceivedRequestHandler:];
}

id objc_msgSend_setReceiverState_(void *a1, const char *a2, ...)
{
  return [a1 setReceiverState:];
}

id objc_msgSend_setRelativeLocation_(void *a1, const char *a2, ...)
{
  return [a1 setRelativeLocation:];
}

id objc_msgSend_setRemoteAuthenticationMessage_(void *a1, const char *a2, ...)
{
  return [a1 setRemoteAuthenticationMessage:];
}

id objc_msgSend_setRemoteIdentity_(void *a1, const char *a2, ...)
{
  return [a1 setRemoteIdentity:];
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return [a1 setRemoteObjectInterface:];
}

id objc_msgSend_setRemoteValidationMessage_(void *a1, const char *a2, ...)
{
  return [a1 setRemoteValidationMessage:];
}

id objc_msgSend_setRequest_(void *a1, const char *a2, ...)
{
  return [a1 setRequest:];
}

id objc_msgSend_setRequestID_(void *a1, const char *a2, ...)
{
  return [a1 setRequestID:];
}

id objc_msgSend_setResolvableAccessoriesChangedHandler_(void *a1, const char *a2, ...)
{
  return [a1 setResolvableAccessoriesChangedHandler:];
}

id objc_msgSend_setResponseHandler_(void *a1, const char *a2, ...)
{
  return [a1 setResponseHandler:];
}

id objc_msgSend_setRole_(void *a1, const char *a2, ...)
{
  return [a1 setRole:];
}

id objc_msgSend_setRoomName_(void *a1, const char *a2, ...)
{
  return [a1 setRoomName:];
}

id objc_msgSend_setRoomUpdatedHandler_(void *a1, const char *a2, ...)
{
  return [a1 setRoomUpdatedHandler:];
}

id objc_msgSend_setRotatingIdentifierChangedHandler_(void *a1, const char *a2, ...)
{
  return [a1 setRotatingIdentifierChangedHandler:];
}

id objc_msgSend_setRssiChangeDetection_(void *a1, const char *a2, ...)
{
  return [a1 setRssiChangeDetection:];
}

id objc_msgSend_setRssiThreshold_(void *a1, const char *a2, ...)
{
  return [a1 setRssiThreshold:];
}

id objc_msgSend_setScanRate_(void *a1, const char *a2, ...)
{
  return [a1 setScanRate:];
}

id objc_msgSend_setScheme_(void *a1, const char *a2, ...)
{
  return [a1 setScheme:];
}

id objc_msgSend_setScreenLockedChangedHandler_(void *a1, const char *a2, ...)
{
  return [a1 setScreenLockedChangedHandler:];
}

id objc_msgSend_setScreenOnChangedHandler_(void *a1, const char *a2, ...)
{
  return [a1 setScreenOnChangedHandler:];
}

id objc_msgSend_setSecretKey_(void *a1, const char *a2, ...)
{
  return [a1 setSecretKey:];
}

id objc_msgSend_setSelfAccessoryMediaAccessUpdatedHandler_(void *a1, const char *a2, ...)
{
  return [a1 setSelfAccessoryMediaAccessUpdatedHandler:];
}

id objc_msgSend_setSelfAccessoryMediaSystemUpdatedHandler_(void *a1, const char *a2, ...)
{
  return [a1 setSelfAccessoryMediaSystemUpdatedHandler:];
}

id objc_msgSend_setSelfAccessorySiriAccessUpdatedHandler_(void *a1, const char *a2, ...)
{
  return [a1 setSelfAccessorySiriAccessUpdatedHandler:];
}

id objc_msgSend_setSelfAccessoryUpdatedHandler_(void *a1, const char *a2, ...)
{
  return [a1 setSelfAccessoryUpdatedHandler:];
}

id objc_msgSend_setSendInterestEventHandler_(void *a1, const char *a2, ...)
{
  return [a1 setSendInterestEventHandler:];
}

id objc_msgSend_setSendTicks_(void *a1, const char *a2, ...)
{
  return [a1 setSendTicks:];
}

id objc_msgSend_setSendersKnownAlias_(void *a1, const char *a2, ...)
{
  return [a1 setSendersKnownAlias:];
}

id objc_msgSend_setServer_(void *a1, const char *a2, ...)
{
  return [a1 setServer:];
}

id objc_msgSend_setServerNetCnxs_(void *a1, const char *a2, ...)
{
  return [a1 setServerNetCnxs:];
}

id objc_msgSend_setServersChangedState_(void *a1, const char *a2, ...)
{
  return [a1 setServersChangedState:];
}

id objc_msgSend_setServiceType_(void *a1, const char *a2, ...)
{
  return [a1 setServiceType:];
}

id objc_msgSend_setServiceTypes_(void *a1, const char *a2, ...)
{
  return [a1 setServiceTypes:];
}

id objc_msgSend_setSessionEndedHandler_(void *a1, const char *a2, ...)
{
  return [a1 setSessionEndedHandler:];
}

id objc_msgSend_setSessionID_(void *a1, const char *a2, ...)
{
  return [a1 setSessionID:];
}

id objc_msgSend_setSessionStartHandler_(void *a1, const char *a2, ...)
{
  return [a1 setSessionStartHandler:];
}

id objc_msgSend_setSessions_(void *a1, const char *a2, ...)
{
  return [a1 setSessions:];
}

id objc_msgSend_setShouldAutomapListener_(void *a1, const char *a2, ...)
{
  return [a1 setShouldAutomapListener:];
}

id objc_msgSend_setShowPasswordHandler_(void *a1, const char *a2, ...)
{
  return [a1 setShowPasswordHandler:];
}

id objc_msgSend_setSiriInfo_(void *a1, const char *a2, ...)
{
  return [a1 setSiriInfo:];
}

id objc_msgSend_setSourceVersion_(void *a1, const char *a2, ...)
{
  return [a1 setSourceVersion:];
}

id objc_msgSend_setStartTicks_(void *a1, const char *a2, ...)
{
  return [a1 setStartTicks:];
}

id objc_msgSend_setState_(void *a1, const char *a2, ...)
{
  return [a1 setState:];
}

id objc_msgSend_setStateChangedHandler_(void *a1, const char *a2, ...)
{
  return [a1 setStateChangedHandler:];
}

id objc_msgSend_setStateDescriptor_(void *a1, const char *a2, ...)
{
  return [a1 setStateDescriptor:];
}

id objc_msgSend_setStatusChangedHandler_(void *a1, const char *a2, ...)
{
  return [a1 setStatusChangedHandler:];
}

id objc_msgSend_setStatusFlags_(void *a1, const char *a2, ...)
{
  return [a1 setStatusFlags:];
}

id objc_msgSend_setSyncType_(void *a1, const char *a2, ...)
{
  return [a1 setSyncType:];
}

id objc_msgSend_setSystemNameChangedHandler_(void *a1, const char *a2, ...)
{
  return [a1 setSystemNameChangedHandler:];
}

id objc_msgSend_setTapEvent_(void *a1, const char *a2, ...)
{
  return [a1 setTapEvent:];
}

id objc_msgSend_setTargetAuthTag_(void *a1, const char *a2, ...)
{
  return [a1 setTargetAuthTag:];
}

id objc_msgSend_setTargetData_(void *a1, const char *a2, ...)
{
  return [a1 setTargetData:];
}

id objc_msgSend_setTcpConnection_(void *a1, const char *a2, ...)
{
  return [a1 setTcpConnection:];
}

id objc_msgSend_setTimeZone_(void *a1, const char *a2, ...)
{
  return [a1 setTimeZone:];
}

id objc_msgSend_setTimer_(void *a1, const char *a2, ...)
{
  return [a1 setTimer:];
}

id objc_msgSend_setTitleKey_(void *a1, const char *a2, ...)
{
  return [a1 setTitleKey:];
}

id objc_msgSend_setToID_(void *a1, const char *a2, ...)
{
  return [a1 setToID:];
}

id objc_msgSend_setToken_(void *a1, const char *a2, ...)
{
  return [a1 setToken:];
}

id objc_msgSend_setTrackPeers_(void *a1, const char *a2, ...)
{
  return [a1 setTrackPeers:];
}

id objc_msgSend_setTransactionChangedHandler_(void *a1, const char *a2, ...)
{
  return [a1 setTransactionChangedHandler:];
}

id objc_msgSend_setTriggerEnhancedDiscovery_(void *a1, const char *a2, ...)
{
  return [a1 setTriggerEnhancedDiscovery:];
}

id objc_msgSend_setTxtDictionary_(void *a1, const char *a2, ...)
{
  return [a1 setTxtDictionary:];
}

id objc_msgSend_setType_(void *a1, const char *a2, ...)
{
  return [a1 setType:];
}

id objc_msgSend_setUiTriggered_(void *a1, const char *a2, ...)
{
  return [a1 setUiTriggered:];
}

id objc_msgSend_setUpdateHandler_(void *a1, const char *a2, ...)
{
  return [a1 setUpdateHandler:];
}

id objc_msgSend_setUseCase_(void *a1, const char *a2, ...)
{
  return [a1 setUseCase:];
}

id objc_msgSend_setUserAdded_(void *a1, const char *a2, ...)
{
  return [a1 setUserAdded:];
}

id objc_msgSend_setUsingNearbyActionV2_(void *a1, const char *a2, ...)
{
  return [a1 setUsingNearbyActionV2:];
}

id objc_msgSend_setUsingOnDemandConnection_(void *a1, const char *a2, ...)
{
  return [a1 setUsingOnDemandConnection:];
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setValue:forKey:];
}

id objc_msgSend_setValues_(void *a1, const char *a2, ...)
{
  return [a1 setValues:];
}

id objc_msgSend_setVersion_(void *a1, const char *a2, ...)
{
  return [a1 setVersion:];
}

id objc_msgSend_setViewHint_(void *a1, const char *a2, ...)
{
  return [a1 setViewHint:];
}

id objc_msgSend_setVolumeTo_forCategory_(void *a1, const char *a2, ...)
{
  return [a1 setVolumeTo:forCategory:];
}

id objc_msgSend_setWaitingToConnect_(void *a1, const char *a2, ...)
{
  return [a1 setWaitingToConnect:];
}

id objc_msgSend_setWasTriggered_(void *a1, const char *a2, ...)
{
  return [a1 setWasTriggered:];
}

id objc_msgSend_setWifiStateChangedHandler_(void *a1, const char *a2, ...)
{
  return [a1 setWifiStateChangedHandler:];
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return [a1 setWithObject:];
}

id objc_msgSend_setXpcCnx_(void *a1, const char *a2, ...)
{
  return [a1 setXpcCnx:];
}

id objc_msgSend_setXpcID_(void *a1, const char *a2, ...)
{
  return [a1 setXpcID:];
}

id objc_msgSend_setupAssertHandlers_(void *a1, const char *a2, ...)
{
  return [a1 setupAssertHandlers:];
}

id objc_msgSend_setupBrowseHandlers(void *a1, const char *a2, ...)
{
  return _[a1 setupBrowseHandlers];
}

id objc_msgSend_setupDaemonFramer_receiveHandler_closeHandler_(void *a1, const char *a2, ...)
{
  return [a1 setupDaemonFramer:x0 receiveHandler:x1 closeHandler:x2];
}

id objc_msgSend_setupFlowHandlers(void *a1, const char *a2, ...)
{
  return _[a1 setupFlowHandlers];
}

id objc_msgSend_setupListenHandlers(void *a1, const char *a2, ...)
{
  return _[a1 setupListenHandlers];
}

id objc_msgSend_setupPolicyWithQueue_browseAgent_(void *a1, const char *a2, ...)
{
  return [a1 setupPolicyWithQueue:browseAgent:];
}

id objc_msgSend_setupResolveHandlers(void *a1, const char *a2, ...)
{
  return _[a1 setupResolveHandlers];
}

id objc_msgSend_shared(void *a1, const char *a2, ...)
{
  return _[a1 shared];
}

id objc_msgSend_sharedAVSystemController(void *a1, const char *a2, ...)
{
  return _[a1 sharedAVSystemController];
}

id objc_msgSend_sharedCloudDaemon(void *a1, const char *a2, ...)
{
  return _[a1 sharedCloudDaemon];
}

id objc_msgSend_sharedCompanionLinkDaemon(void *a1, const char *a2, ...)
{
  return _[a1 sharedCompanionLinkDaemon];
}

id objc_msgSend_sharedDaemon(void *a1, const char *a2, ...)
{
  return _[a1 sharedDaemon];
}

id objc_msgSend_sharedIdentityDaemon(void *a1, const char *a2, ...)
{
  return _[a1 sharedIdentityDaemon];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_sharedInvitationDaemon(void *a1, const char *a2, ...)
{
  return _[a1 sharedInvitationDaemon];
}

id objc_msgSend_sharedMetrics(void *a1, const char *a2, ...)
{
  return _[a1 sharedMetrics];
}

id objc_msgSend_sharedMetricsNoCreate(void *a1, const char *a2, ...)
{
  return _[a1 sharedMetricsNoCreate];
}

id objc_msgSend_sharedNearFieldDaemon(void *a1, const char *a2, ...)
{
  return _[a1 sharedNearFieldDaemon];
}

id objc_msgSend_sharedNetworkAgent(void *a1, const char *a2, ...)
{
  return _[a1 sharedNetworkAgent];
}

id objc_msgSend_sharedPeopleDaemon(void *a1, const char *a2, ...)
{
  return _[a1 sharedPeopleDaemon];
}

id objc_msgSend_sharedPrivateDaemon(void *a1, const char *a2, ...)
{
  return _[a1 sharedPrivateDaemon];
}

id objc_msgSend_sharedStatusDaemon(void *a1, const char *a2, ...)
{
  return _[a1 sharedStatusDaemon];
}

id objc_msgSend_shortDescription(void *a1, const char *a2, ...)
{
  return _[a1 shortDescription];
}

id objc_msgSend_shouldAutomapListener(void *a1, const char *a2, ...)
{
  return _[a1 shouldAutomapListener];
}

id objc_msgSend_shouldReportDevice_(void *a1, const char *a2, ...)
{
  return [a1 shouldReportDevice:];
}

id objc_msgSend_shouldReportDevice_toXPCConnectionWithLaunchInstanceID_outReason_(void *a1, const char *a2, ...)
{
  return [a1 shouldReportDevice:x0 toXPCConnectionWithLaunchInstanceID:x1 outReason:x2];
}

id objc_msgSend_showPasswordHandler(void *a1, const char *a2, ...)
{
  return _[a1 showPasswordHandler];
}

id objc_msgSend_sigTermPending(void *a1, const char *a2, ...)
{
  return _[a1 sigTermPending];
}

id objc_msgSend_signData_error_(void *a1, const char *a2, ...)
{
  return [a1 signData:error];
}

id objc_msgSend_siriEndpointIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 siriEndpointIdentifier];
}

id objc_msgSend_siriEndpointProfile(void *a1, const char *a2, ...)
{
  return _[a1 siriEndpointProfile];
}

id objc_msgSend_siriInfo(void *a1, const char *a2, ...)
{
  return _[a1 siriInfo];
}

id objc_msgSend_sourceVersion(void *a1, const char *a2, ...)
{
  return _[a1 sourceVersion];
}

id objc_msgSend_speakText_flags_completion_(void *a1, const char *a2, ...)
{
  return [a1 speakText:x0 flags:x1 completion:x2];
}

id objc_msgSend_stableIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 stableIdentifier];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return _[a1 start];
}

id objc_msgSend_startAgeOutTimer(void *a1, const char *a2, ...)
{
  return _[a1 startAgeOutTimer];
}

id objc_msgSend_startConnection_(void *a1, const char *a2, ...)
{
  return [a1 startConnection:];
}

id objc_msgSend_startDiscovery_applicationService_controlFlags_deviceFilter_connectedHandler_updateHandler_lostHandler_invalidationHandler_(void *a1, const char *a2, ...)
{
  return [a1 startDiscovery:x0 applicationService:x1 controlFlags:x2 deviceFilter:x3 connectedHandler:x4 updateHandler:x5 lostHandler:x6 invalidationHandler:x7];
}

id objc_msgSend_startDiscovery_controlFlags_deviceFilter_(void *a1, const char *a2, ...)
{
  return [a1 startDiscovery:x0 controlFlags:x1 deviceFilter:x2];
}

id objc_msgSend_startDiscovery_deviceTypes_controlFlags_deviceFilter_agentUUID_applicationService_(void *a1, const char *a2, ...)
{
  return [a1 startDiscovery:x0 deviceTypes:x1 controlFlags:x2 deviceFilter:x3 agentUUID:x4 applicationService:x5];
}

id objc_msgSend_startDiscovery_foundHandler_updateHandler_lostHandler_invalidationHandler_(void *a1, const char *a2, ...)
{
  return [a1 startDiscovery:x0 foundHandler:x1 updateHandler:x2 lostHandler:x3 invalidationHandler:x4];
}

id objc_msgSend_startListenerMappingTimeout_(void *a1, const char *a2, ...)
{
  return [a1 startListenerMappingTimeout:];
}

id objc_msgSend_startNearbyInvitationDiscovery_agentUUID_applicationService_(void *a1, const char *a2, ...)
{
  return [a1 startNearbyInvitationDiscovery:x0 agentUUID:x1 applicationService:x2];
}

id objc_msgSend_startObservingForAuthenticationStateChanges_queue_(void *a1, const char *a2, ...)
{
  return [a1 startObservingForAuthenticationStateChanges:queue:];
}

id objc_msgSend_startOfDayForDate_(void *a1, const char *a2, ...)
{
  return [a1 startOfDayForDate:x0];
}

id objc_msgSend_startServer_withCompletion_disconnectHandler_(void *a1, const char *a2, ...)
{
  return [a1 startServer:withCompletion:disconnectHandler:];
}

id objc_msgSend_startTicks(void *a1, const char *a2, ...)
{
  return _[a1 startTicks];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return _[a1 state];
}

id objc_msgSend_statusCodeToString_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "statusCodeToString:");
}

id objc_msgSend_statusFlags(void *a1, const char *a2, ...)
{
  return _[a1 statusFlags];
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return _[a1 stop];
}

id objc_msgSend_stopAgentClient(void *a1, const char *a2, ...)
{
  return _[a1 stopAgentClient];
}

id objc_msgSend_stopAllOutgoingConnectionsNotForPeer_(void *a1, const char *a2, ...)
{
  return [a1 stopAllOutgoingConnectionsNotForPeer:];
}

id objc_msgSend_stopDiscovery(void *a1, const char *a2, ...)
{
  return _[a1 stopDiscovery];
}

id objc_msgSend_stopObservingForAuthenticationStateChanges(void *a1, const char *a2, ...)
{
  return _[a1 stopObservingForAuthenticationStateChanges];
}

id objc_msgSend_stopServer(void *a1, const char *a2, ...)
{
  return _[a1 stopServer];
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return [a1 stringByAppendingString:];
}

id objc_msgSend_stringFromDate_(void *a1, const char *a2, ...)
{
  return [a1 stringFromDate:];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return _[a1 stringValue];
}

id objc_msgSend_stringWithCString_encoding_(void *a1, const char *a2, ...)
{
  return [a1 stringWithCString:];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 stringWithFormat:];
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return [a1 stringWithUTF8String:];
}

id objc_msgSend_subscriber(void *a1, const char *a2, ...)
{
  return _[a1 subscriber];
}

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return [a1 substringFromIndex:];
}

id objc_msgSend_substringToIndex_(void *a1, const char *a2, ...)
{
  return [a1 substringToIndex:];
}

id objc_msgSend_substringWithRange_(void *a1, const char *a2, ...)
{
  return [a1 substringWithRange:];
}

id objc_msgSend_supportedApplicationLabels(void *a1, const char *a2, ...)
{
  return _[a1 supportedApplicationLabels];
}

id objc_msgSend_supportsApplePay(void *a1, const char *a2, ...)
{
  return _[a1 supportsApplePay];
}

id objc_msgSend_supportsApplicationLabel(void *a1, const char *a2, ...)
{
  return _[a1 supportsApplicationLabel];
}

id objc_msgSend_supportsDataTransfer(void *a1, const char *a2, ...)
{
  return _[a1 supportsDataTransfer];
}

id objc_msgSend_systemName(void *a1, const char *a2, ...)
{
  return _[a1 systemName];
}

id objc_msgSend_tapEvent(void *a1, const char *a2, ...)
{
  return _[a1 tapEvent];
}

id objc_msgSend_targetAuthTag(void *a1, const char *a2, ...)
{
  return _[a1 targetAuthTag];
}

id objc_msgSend_targetData(void *a1, const char *a2, ...)
{
  return _[a1 targetData];
}

id objc_msgSend_targetWithProcessIdentity_(void *a1, const char *a2, ...)
{
  return [a1 targetWithProcessIdentity:];
}

id objc_msgSend_taskState(void *a1, const char *a2, ...)
{
  return _[a1 taskState];
}

id objc_msgSend_tcpConnection(void *a1, const char *a2, ...)
{
  return _[a1 tcpConnection];
}

id objc_msgSend_tcpListeningPort(void *a1, const char *a2, ...)
{
  return _[a1 tcpListeningPort];
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceDate:];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceNow];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_timeZoneForSecondsFromGMT_(void *a1, const char *a2, ...)
{
  return [a1 timeZoneForSecondsFromGMT:x0];
}

id objc_msgSend_timer(void *a1, const char *a2, ...)
{
  return _[a1 timer];
}

id objc_msgSend_toID(void *a1, const char *a2, ...)
{
  return _[a1 toID];
}

id objc_msgSend_token(void *a1, const char *a2, ...)
{
  return _[a1 token];
}

id objc_msgSend_trackPeers(void *a1, const char *a2, ...)
{
  return _[a1 trackPeers];
}

id objc_msgSend_transactionChangedHandler(void *a1, const char *a2, ...)
{
  return _[a1 transactionChangedHandler];
}

id objc_msgSend_transactionController(void *a1, const char *a2, ...)
{
  return _[a1 transactionController];
}

id objc_msgSend_transactionController_didBeginTransaction_(void *a1, const char *a2, ...)
{
  return [a1 transactionController:didBeginTransaction:];
}

id objc_msgSend_transactionController_didDetectDeviceNearbyWithInitiatorRole_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "transactionController:didDetectDeviceNearbyWithInitiatorRole:");
}

id objc_msgSend_transactionController_didFinishTransaction_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "transactionController:didFinishTransaction:error:");
}

id objc_msgSend_transactionController_requestMessageForType_(void *a1, const char *a2, ...)
{
  return [a1 transactionController:requestMessageForType:];
}

id objc_msgSend_transactionController_responseMessageForRequestMessage_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "transactionController:responseMessageForRequestMessage:");
}

id objc_msgSend_transactionController_tapEventForApplicationLabel_singleBandAWDLModeRequested_pkData_bonjourListenerUUID_identity_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "transactionController:tapEventForApplicationLabel:singleBandAWDLModeRequested:pkData:bonjourListenerUUID:identity:");
}

id objc_msgSend_transportServiceList(void *a1, const char *a2, ...)
{
  return _[a1 transportServiceList];
}

id objc_msgSend_transportServicesMetadata(void *a1, const char *a2, ...)
{
  return _[a1 transportServicesMetadata];
}

id objc_msgSend_transportServicesMetadataDictionaryRepresentation(void *a1, const char *a2, ...)
{
  return _[a1 transportServicesMetadataDictionaryRepresentation];
}

id objc_msgSend_trigger(void *a1, const char *a2, ...)
{
  return _[a1 trigger];
}

id objc_msgSend_triggerEnhancedDiscovery(void *a1, const char *a2, ...)
{
  return _[a1 triggerEnhancedDiscovery];
}

id objc_msgSend_triggerEnhancedDiscovery_useCase_completion_(void *a1, const char *a2, ...)
{
  return [a1 triggerEnhancedDiscovery:useCase completion:completion];
}

id objc_msgSend_triggerEnhancedDiscoveryForReason_useCase_error_(void *a1, const char *a2, ...)
{
  return [a1 triggerEnhancedDiscoveryForReason:useCase:error:];
}

id objc_msgSend_tryPassword_(void *a1, const char *a2, ...)
{
  return [a1 tryPassword:];
}

id objc_msgSend_txtDictionary(void *a1, const char *a2, ...)
{
  return _[a1 txtDictionary];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return _[a1 type];
}

id objc_msgSend_uiTriggered(void *a1, const char *a2, ...)
{
  return _[a1 uiTriggered];
}

id objc_msgSend_uid_(void *a1, const char *a2, ...)
{
  return [a1 uid:];
}

id objc_msgSend_uniqueID(void *a1, const char *a2, ...)
{
  return _[a1 uniqueID];
}

id objc_msgSend_uniqueIDOverride(void *a1, const char *a2, ...)
{
  return _[a1 uniqueIDOverride];
}

id objc_msgSend_uniqueIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 uniqueIdentifier];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedLongLongValue];
}

id objc_msgSend_updateAgentClientInfo_browseResponse_listener_bundleID_advertiseDescriptor_browseDescriptor_isFlowHandler_isUsingQUIC_isTCP_agentClientPID_persona_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "updateAgentClientInfo:browseResponse:listener:bundleID:advertiseDescriptor:browseDescriptor:isFlowHandler:isUsingQUIC:isTCP:agentClientPID:persona:");
}

id objc_msgSend_updateConfiguration_(void *a1, const char *a2, ...)
{
  return [a1 updateConfiguration:];
}

id objc_msgSend_updateEndpointMapping_discoverySessionID_(void *a1, const char *a2, ...)
{
  return [a1 updateEndpointMapping:discoverySessionID:];
}

id objc_msgSend_updateErrorFlags_(void *a1, const char *a2, ...)
{
  return [a1 updateErrorFlags:];
}

id objc_msgSend_updateFriendIdentityWithAppleID_contactID_(void *a1, const char *a2, ...)
{
  return [a1 updateFriendIdentityWithAppleID:contactID:];
}

id objc_msgSend_updateMappingForDevice_(void *a1, const char *a2, ...)
{
  return [a1 updateMappingForDevice:];
}

id objc_msgSend_updateOptions_withNWActivityMetrics_(void *a1, const char *a2, ...)
{
  return [a1 updateOptions:withNWActivityMetrics:];
}

id objc_msgSend_updateSessionPairedIdentity_(void *a1, const char *a2, ...)
{
  return [a1 updateSessionPairedIdentity:];
}

id objc_msgSend_updateSharedTVIdentities(void *a1, const char *a2, ...)
{
  return _[a1 updateSharedTVIdentities];
}

id objc_msgSend_updateTrustStatusFlagsWithIdentity_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "updateTrustStatusFlagsWithIdentity:");
}

id objc_msgSend_updateWithBonjourDevice_(void *a1, const char *a2, ...)
{
  return [a1 updateWithBonjourDevice:];
}

id objc_msgSend_updateWithCBDevice_(void *a1, const char *a2, ...)
{
  return [a1 updateWithCBDevice:];
}

id objc_msgSend_updateWithEndpoint_(void *a1, const char *a2, ...)
{
  return [a1 updateWithEndpoint:];
}

id objc_msgSend_updateWithFamilyEndpoint_(void *a1, const char *a2, ...)
{
  return [a1 updateWithFamilyEndpoint:];
}

id objc_msgSend_updateWithIdentity_(void *a1, const char *a2, ...)
{
  return [a1 updateWithIdentity:];
}

id objc_msgSend_updateWithKeychainItem_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "updateWithKeychainItem:error:");
}

id objc_msgSend_updateWithRPDevice_(void *a1, const char *a2, ...)
{
  return [a1 updateWithRPDevice:];
}

id objc_msgSend_updateWithRPIdentity_revisionUpdate_error_(void *a1, const char *a2, ...)
{
  return [a1 updateWithRPIdentity:x0 revisionUpdate:x1 error:x2];
}

id objc_msgSend_updateWithRPMessage_error_(void *a1, const char *a2, ...)
{
  return [a1 updateWithRPMessage:error:];
}

id objc_msgSend_updateWithSFDevice_(void *a1, const char *a2, ...)
{
  return [a1 updateWithSFDevice:];
}

id objc_msgSend_updateWithSFDevice_changes_(void *a1, const char *a2, ...)
{
  return [a1 updateWithSFDevice:changes:];
}

id objc_msgSend_useCase(void *a1, const char *a2, ...)
{
  return _[a1 useCase];
}

id objc_msgSend_userAdded(void *a1, const char *a2, ...)
{
  return _[a1 userAdded];
}

id objc_msgSend_userID(void *a1, const char *a2, ...)
{
  return _[a1 userID];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _[a1 userInfo];
}

id objc_msgSend_users(void *a1, const char *a2, ...)
{
  return _[a1 users];
}

id objc_msgSend_usingNearbyActionV2(void *a1, const char *a2, ...)
{
  return _[a1 usingNearbyActionV2];
}

id objc_msgSend_usingOnDemandConnection(void *a1, const char *a2, ...)
{
  return _[a1 usingOnDemandConnection];
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return [a1 valueForEntitlement:];
}

id objc_msgSend_verifiedIdentity(void *a1, const char *a2, ...)
{
  return _[a1 verifiedIdentity];
}

id objc_msgSend_verifyAuthTag_data_type_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "verifyAuthTag:data:type:error:");
}

id objc_msgSend_verifyAuthTagPtr_authTagLen_dataPtr_dataLen_type_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "verifyAuthTagPtr:authTagLen:dataPtr:dataLen:type:error:");
}

id objc_msgSend_verifySignature_data_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "verifySignature:data:error:");
}

id objc_msgSend_verifyWithIdentity_(void *a1, const char *a2, ...)
{
  return [a1 verifyWithIdentity:];
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return _[a1 version];
}

id objc_msgSend_viewHint(void *a1, const char *a2, ...)
{
  return _[a1 viewHint];
}

id objc_msgSend_waitingToConnect(void *a1, const char *a2, ...)
{
  return _[a1 waitingToConnect];
}

id objc_msgSend_wakeOnWirelessEnabled(void *a1, const char *a2, ...)
{
  return _[a1 wakeOnWirelessEnabled];
}

id objc_msgSend_wifiFlags(void *a1, const char *a2, ...)
{
  return _[a1 wifiFlags];
}

id objc_msgSend_wifiState(void *a1, const char *a2, ...)
{
  return _[a1 wifiState];
}

id objc_msgSend_writeControlOnFramer_type_error_(void *a1, const char *a2, ...)
{
  return [a1 writeControlOnFramer:type:error:];
}

id objc_msgSend_writeDataOnFramer_data_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "writeDataOnFramer:data:");
}

id objc_msgSend_writeErrorOnFramer_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "writeErrorOnFramer:error:");
}

id objc_msgSend_xpcCnx(void *a1, const char *a2, ...)
{
  return _[a1 xpcCnx];
}

id objc_msgSend_xpcConnectionInvalidated(void *a1, const char *a2, ...)
{
  return _[a1 xpcConnectionInvalidated];
}

id objc_msgSend_xpcPeopleStatusChanged_(void *a1, const char *a2, ...)
{
  return [a1 xpcPeopleStatusChanged:];
}

id objc_msgSend_xpcPersonChanged_changes_(void *a1, const char *a2, ...)
{
  return [a1 xpcPersonChanged:changes];
}

id objc_msgSend_xpcPersonFound_(void *a1, const char *a2, ...)
{
  return [a1 xpcPersonFound:];
}

id objc_msgSend_xpcPersonID_deviceID_updatedMeasurement_(void *a1, const char *a2, ...)
{
  return [a1 xpcPersonID:deviceID:updatedMeasurement:];
}

id objc_msgSend_xpcPersonLost_(void *a1, const char *a2, ...)
{
  return [a1 xpcPersonLost:];
}

id objc_msgSend_xpcPrivateAdvertiserActivate_completion_(void *a1, const char *a2, ...)
{
  return [a1 xpcPrivateAdvertiserActivate:completion:];
}

id objc_msgSend_xpcPrivateDiscoveryActivate_completion_(void *a1, const char *a2, ...)
{
  return [a1 xpcPrivateDiscoveryActivate:completion:];
}

id objc_msgSend_xpcServerHidePassword_(void *a1, const char *a2, ...)
{
  return [a1 xpcServerHidePassword:];
}

id objc_msgSend_xpcServerShowPassword_flags_(void *a1, const char *a2, ...)
{
  return [a1 xpcServerShowPassword:flags:];
}