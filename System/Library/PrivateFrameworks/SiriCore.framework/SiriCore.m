void sub_21CBFAFF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *SiriCoreSQLiteQueryCreateParametrizedAndCommaSeparatedString(unint64_t a1)
{
  if (a1 >= 0x11)
  {
    v3 = (char *)malloc_type_malloc(3 * a1 - 2, 0x210D532EuLL);
    bzero(v3, 3 * a1 - 2);
    unint64_t v4 = a1 - 1;
    v5 = v3;
    do
    {
      *(_WORD *)v5 = 11327;
      v5[2] = 32;
      v5 += 3;
      --v4;
    }
    while (v4);
    char *v5 = 63;
    v2 = (__CFString *)[[NSString alloc] initWithBytesNoCopy:v3 length:3 * a1 - 2 encoding:1 freeWhenDone:1];
  }
  else
  {
    v2 = off_26443A790[a1];
  }

  return v2;
}

id initWRM_iRATInterface()
{
  if (initWRM_iRATInterface_sOnce != -1) {
    dispatch_once(&initWRM_iRATInterface_sOnce, &__block_literal_global_132);
  }
  v0 = (void *)classWRM_iRATInterface;

  return v0;
}

Class __initWRM_iRATInterface_block_invoke()
{
  if (WirelessCoexManagerLibrary_sOnce != -1) {
    dispatch_once(&WirelessCoexManagerLibrary_sOnce, &__block_literal_global_38);
  }
  Class result = objc_getClass("WRM_iRATInterface");
  classWRM_iRATInterface = (uint64_t)result;
  if (!result) {
    __assert_rtn("initWRM_iRATInterface_block_invoke", "SiriCoreLinkRecommendationInfo.m", 15, "classWRM_iRATInterface");
  }
  getWRM_iRATInterfaceClass = WRM_iRATInterfaceFunction;
  return result;
}

id WRM_iRATInterfaceFunction()
{
  return (id)classWRM_iRATInterface;
}

void *__WirelessCoexManagerLibrary_block_invoke()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/WirelessCoexManager.framework/WirelessCoexManager", 2);
  WirelessCoexManagerLibrary_sLib = (uint64_t)result;
  return result;
}

void sub_21CBFDACC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
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

void sub_21CBFE2B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21CBFFE4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

SiriCoreConnectionTCPInfoMetrics *SiriCoreConnectionTCPInfoMetricsCreate(void *a1, uint64_t a2)
{
  id v26 = a1;
  if (v26)
  {
    if (a2) {
      goto LABEL_3;
    }
  }
  else
  {
    v9 = [MEMORY[0x263F08690] currentHandler];
    v10 = objc_msgSend(NSString, "stringWithUTF8String:", "SiriCoreConnectionTCPInfoMetrics *SiriCoreConnectionTCPInfoMetricsCreate(NSString *__strong, const struct tcp_info *)");
    [v9 handleFailureInFunction:v10, @"SiriCoreConnectionMetrics.m", 35, @"Invalid parameter not satisfying: %@", @"interfaceName != nil" file lineNumber description];

    if (a2) {
      goto LABEL_3;
    }
  }
  v11 = [MEMORY[0x263F08690] currentHandler];
  v12 = objc_msgSend(NSString, "stringWithUTF8String:", "SiriCoreConnectionTCPInfoMetrics *SiriCoreConnectionTCPInfoMetricsCreate(NSString *__strong, const struct tcp_info *)");
  [v11 handleFailureInFunction:v12, @"SiriCoreConnectionMetrics.m", 36, @"Invalid parameter not satisfying: %@", @"tcpInfo != NULL" file lineNumber description];

LABEL_3:
  v21 = [SiriCoreConnectionTCPInfoMetrics alloc];
  v25 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a2 + 20)];
  v23 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a2 + 24)];
  v20 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a2 + 28)];
  v19 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a2 + 32)];
  v18 = [NSNumber numberWithUnsignedLongLong:*(void *)(a2 + 68)];
  v24 = [NSNumber numberWithUnsignedLongLong:*(void *)(a2 + 76)];
  v16 = [NSNumber numberWithUnsignedLongLong:*(void *)(a2 + 84)];
  v15 = [NSNumber numberWithUnsignedLongLong:*(void *)(a2 + 92)];
  v14 = [NSNumber numberWithUnsignedLongLong:*(void *)(a2 + 100)];
  v17 = [NSNumber numberWithUnsignedLongLong:*(void *)(a2 + 108)];
  v13 = [NSNumber numberWithUnsignedLongLong:*(void *)(a2 + 116)];
  v3 = [NSNumber numberWithUnsignedLongLong:*(void *)(a2 + 124)];
  unint64_t v4 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a2 + 64)];
  v5 = [NSNumber numberWithUnsignedLongLong:*(void *)(a2 + 132)];
  v6 = [NSNumber numberWithUnsignedChar:*(unsigned __int8 *)(a2 + 140)];
  v7 = [NSNumber numberWithUnsignedShort:(*(unsigned __int16 *)(a2 + 244) >> 4) & 1];
  v22 = -[SiriCoreConnectionTCPInfoMetrics initWithInterfaceName:rttCurrent:rttSmoothed:rttVariance:rttBest:packetsSent:bytesSent:bytesRetransmitted:bytesUnacked:packetsReceived:bytesReceived:duplicateBytesReceived:outOfOrderBytesReceived:sendBufferBytes:sendBandwidth:synRetransmits:tfoSynDataAcked:](v21, "initWithInterfaceName:rttCurrent:rttSmoothed:rttVariance:rttBest:packetsSent:bytesSent:bytesRetransmitted:bytesUnacked:packetsReceived:bytesReceived:duplicateBytesReceived:outOfOrderBytesReceived:sendBufferBytes:sendBandwidth:synRetransmits:tfoSynDataAcked:", v26, v25, v23, v20, v19, v18, v24, v16, v15, v14, v17, v13, v3, v4, v5,
          v6,
          v7);

  return v22;
}

void __SiriCoreDispatchDataCreateFromImmutableCFData_block_invoke(uint64_t a1)
{
}

void sub_21CC08070(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t _SiriCoreSiriConnectionMethodGetNextSupported(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  id v6 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  uint64_t v7 = *MEMORY[0x263F65188];
  while (1)
  {
    v8 = [NSNumber numberWithInteger:a1];
    [v6 addObject:v8];

    if (a1 == 3)
    {
      a1 = 4;
      if ([v5 isEqualToString:v7] & (a3 ^ 1)) {
        goto LABEL_12;
      }
      goto LABEL_8;
    }
    if (a1 == 2)
    {
      a1 = 0;
      goto LABEL_12;
    }
    if (a1 == 4) {
      break;
    }
    a1 = 3;
    if (a3) {
      goto LABEL_12;
    }
LABEL_8:
    v9 = [NSNumber numberWithInteger:a1];
    char v10 = [v6 containsObject:v9];

    if (v10) {
      goto LABEL_12;
    }
  }
  a1 = 2;
LABEL_12:
  v11 = [NSNumber numberWithInteger:a1];
  int v12 = [v6 containsObject:v11];

  if (v12) {
    a1 = 0;
  }

  return a1;
}

void sub_21CC0CDBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 128), 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

id SiriCoreGetConnectionNetworkPathReport(void *a1, void *a2)
{
  id v2 = 0;
  if (a1 && a2)
  {
    unint64_t v4 = (objc_class *)MEMORY[0x263EFF9A0];
    id v5 = a2;
    id v6 = a1;
    id v2 = objc_alloc_init(v4);
    uint64_t v7 = [NSNumber numberWithUnsignedInt:nw_path_get_status(v5)];
    [v2 setObject:v7 forKey:@"connectionPreparingPathStatus"];

    id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
    enumerate_block[0] = MEMORY[0x263EF8330];
    enumerate_block[1] = 3221225472;
    enumerate_block[2] = __SiriCoreGetConnectionNetworkPathReport_block_invoke;
    enumerate_block[3] = &unk_26443A6D8;
    id v9 = v8;
    id v25 = v9;
    nw_path_enumerate_interfaces(v5, enumerate_block);
    [v2 setObject:v9 forKey:@"connectionPreparingPathInterfaces"];
    char v10 = [NSNumber numberWithBool:nw_path_is_expensive(v5)];
    [v2 setObject:v10 forKey:@"connectionPreparingPathIsExpensive"];

    uint64_t v11 = [NSNumber numberWithBool:nw_path_is_constrained(v5)];
    [v2 setObject:v11 forKey:@"connectionPreparingPathIsConstrained"];

    int v12 = [NSNumber numberWithBool:nw_path_has_ipv4(v5)];
    [v2 setObject:v12 forKey:@"connectionPreparingPathHasIpv4"];

    uint64_t v13 = [NSNumber numberWithBool:nw_path_has_ipv6(v5)];
    [v2 setObject:v13 forKey:@"connectionPreparingPathHasIpv6"];

    v14 = [NSNumber numberWithBool:nw_path_has_dns(v5)];
    [v2 setObject:v14 forKey:@"connectionPreparingPathHasDNS"];

    id v15 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v19 = MEMORY[0x263EF8330];
    uint64_t v20 = 3221225472;
    v21 = __SiriCoreGetConnectionNetworkPathReport_block_invoke_2;
    v22 = &unk_26443A700;
    id v16 = v15;
    id v23 = v16;
    nw_path_enumerate_gateways(v5, &v19);

    objc_msgSend(v2, "setObject:forKey:", v16, @"connectionPreparingPathGateways", v19, v20, v21, v22);
    uint64_t v17 = _getConnectionDescription(v6);

    if (v17) {
      [v2 setObject:v17 forKey:@"connectionInfo"];
    }
  }

  return v2;
}

uint64_t __SiriCoreGetConnectionNetworkPathReport_block_invoke(uint64_t a1, void *a2)
{
  v3 = a2;
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v5 = [NSNumber numberWithUnsignedInt:nw_interface_get_type(v3)];
    [v4 setObject:v5 forKey:@"type"];

    name = nw_interface_get_name(v3);
    if (name)
    {
      uint64_t v7 = [NSString stringWithUTF8String:name];
      if (v7) {
        [v4 setObject:v7 forKey:@"name"];
      }
    }
    id v8 = [NSNumber numberWithUnsignedInt:nw_interface_get_index(v3)];
    [v4 setObject:v8 forKey:@"index"];

    if (v4)
    {
      [*(id *)(a1 + 32) addObject:v4];
    }
  }

  return 1;
}

uint64_t __SiriCoreGetConnectionNetworkPathReport_block_invoke_2(uint64_t a1, void *a2)
{
  v3 = _getEndpointInfo(a2);
  if (v3) {
    [*(id *)(a1 + 32) addObject:v3];
  }

  return 1;
}

id _getConnectionDescription(NSObject *a1)
{
  v1 = nw_connection_copy_description(a1);
  if (v1)
  {
    id v2 = v1;
    v3 = [NSString stringWithUTF8String:v1];
    free(v2);
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

id _getEndpointInfo(void *a1)
{
  v1 = a1;
  if (v1)
  {
    id v2 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    uint64_t type = nw_endpoint_get_type(v1);
    id v4 = [NSNumber numberWithUnsignedInt:type];
    [v2 setObject:v4 forKey:@"type"];

    if ((type - 1) <= 1)
    {
      id v5 = nw_endpoint_copy_port_string(v1);
      if (v5)
      {
        id v6 = v5;
        uint64_t v7 = [NSString stringWithUTF8String:v5];
        [v2 setObject:v7 forKey:@"port"];
        free(v6);
      }
    }
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

id SiriCoreGetConnectionReadyReport(void *a1, void *a2)
{
  id v2 = 0;
  if (a1 && a2)
  {
    id v4 = (objc_class *)MEMORY[0x263EFF9A0];
    id v5 = a2;
    id v6 = a1;
    id v2 = objc_alloc_init(v4);
    uint64_t duration_milliseconds = nw_establishment_report_get_duration_milliseconds(v5);
    uint64_t attempt_started_after_milliseconds = nw_establishment_report_get_attempt_started_after_milliseconds(v5);
    uint64_t previous_attempt_count = nw_establishment_report_get_previous_attempt_count(v5);
    char v10 = [NSNumber numberWithUnsignedLongLong:duration_milliseconds];
    [v2 setObject:v10 forKey:@"connectionEstablishmentDuration"];

    uint64_t v11 = [NSNumber numberWithUnsignedLongLong:attempt_started_after_milliseconds];
    [v2 setObject:v11 forKey:@"connectionEstablishmentAttemptDelay"];

    int v12 = [NSNumber numberWithUnsignedInt:previous_attempt_count];
    [v2 setObject:v12 forKey:@"connectionEstablishmentPreviousAttemptCount"];

    id v13 = objc_alloc_init(MEMORY[0x263EFF980]);
    enumerate_block[0] = MEMORY[0x263EF8330];
    enumerate_block[1] = 3221225472;
    enumerate_block[2] = __SiriCoreGetConnectionReadyReport_block_invoke;
    enumerate_block[3] = &unk_26443A728;
    id v14 = v13;
    id v30 = v14;
    nw_establishment_report_enumerate_protocols(v5, enumerate_block);
    [v2 setObject:v14 forKey:@"connectionEstablishmentProtocols"];
    id v15 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v24 = MEMORY[0x263EF8330];
    uint64_t v25 = 3221225472;
    id v26 = __SiriCoreGetConnectionReadyReport_block_invoke_2;
    v27 = &unk_26443A750;
    id v16 = v15;
    id v28 = v16;
    nw_establishment_report_enumerate_resolutions(v5, &v24);
    objc_msgSend(v2, "setObject:forKey:", v16, @"connectionEstablishmentResolution", v24, v25, v26, v27);
    id v17 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v18 = &unk_26CD90A98;
    if (nw_establishment_report_get_proxy_configured(v5)) {
      uint64_t v19 = &unk_26CD90A80;
    }
    else {
      uint64_t v19 = &unk_26CD90A98;
    }
    if (nw_establishment_report_get_used_proxy(v5)) {
      v18 = &unk_26CD90A80;
    }
    [v17 setObject:v19 forKey:@"proxyConfigured"];
    [v17 setObject:v18 forKey:@"usingConfiguredProxy"];
    nw_endpoint_t v20 = nw_establishment_report_copy_proxy_endpoint(v5);

    if (v20)
    {
      v21 = _getEndpointInfo(v20);
      if (v21) {
        [v17 setObject:v21 forKey:@"proxyEndpoint"];
      }
    }
    [v2 setObject:v17 forKey:@"connectionEstablishmentProxyConfiguration"];
    v22 = _getConnectionDescription(v6);

    if (v22) {
      [v2 setObject:v22 forKey:@"connectionInfo"];
    }
  }

  return v2;
}

uint64_t __SiriCoreGetConnectionReadyReport_block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = (objc_class *)MEMORY[0x263EFF9A0];
  id v8 = a2;
  id v9 = objc_alloc_init(v7);
  char v10 = [v8 description];

  if (v10) {
    [v9 setObject:v10 forKey:@"protocol"];
  }
  uint64_t v11 = [NSNumber numberWithUnsignedLongLong:a3];
  [v9 setObject:v11 forKey:@"handShakeDuration"];

  int v12 = [NSNumber numberWithUnsignedLongLong:a4];
  [v9 setObject:v12 forKey:@"handShakeRTT"];

  [*(id *)(a1 + 32) addObject:v9];
  return 1;
}

uint64_t __SiriCoreGetConnectionReadyReport_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6)
{
  id v11 = a6;
  int v12 = (objc_class *)MEMORY[0x263EFF9A0];
  id v13 = a5;
  id v14 = objc_alloc_init(v12);
  id v15 = [NSNumber numberWithUnsignedInt:a2];
  [v14 setObject:v15 forKey:@"resolutionSource"];

  id v16 = [NSNumber numberWithUnsignedInt:a4];
  [v14 setObject:v16 forKey:@"endpointCount"];

  id v17 = [NSNumber numberWithUnsignedLongLong:a3];
  [v14 setObject:v17 forKey:@"duration"];

  v18 = _getEndpointInfo(v13);

  if (v18) {
    [v14 setObject:v18 forKey:@"successfulEndpoint"];
  }
  uint64_t v19 = _getEndpointInfo(v11);
  if (v19) {
    [v14 setObject:v19 forKey:@"preferredEndpoint"];
  }
  [*(id *)(a1 + 32) addObject:v14];

  return 1;
}

id SiriCoreSQLiteQueryCreateColumnDefinition(void *a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v1 = a1;
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  v3 = [v1 name];
  id v4 = v3;
  if (v3)
  {
    id v5 = objc_msgSend(v3, "siriCoreSQLiteValue_escapedString:", 0);
    [v2 addObject:v5];
  }
  uint64_t v6 = [v1 type];
  if (v6) {
    [v2 addObject:v6];
  }
  v21 = (void *)v6;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v7 = [v1 constraints];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v7);
        }
        int v12 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        id v13 = [v12 name];
        if (v13)
        {
          [v2 addObject:@"CONSTRAINT"];
          id v14 = objc_msgSend(v13, "siriCoreSQLiteValue_escapedString:", 0);
          [v2 addObject:v14];
        }
        switch([v12 type])
        {
          case 1:
            [v2 addObject:@"PRIMARY KEY"];
            if ([v12 options])
            {
              id v15 = v2;
              id v16 = @"AUTOINCREMENT";
              goto LABEL_17;
            }
            break;
          case 2:
            id v15 = v2;
            id v16 = @"NOT NULL";
            goto LABEL_17;
          case 3:
            id v15 = v2;
            id v16 = @"UNIQUE";
LABEL_17:
            [v15 addObject:v16];
            break;
          case 4:
            [v2 addObject:@"DEFAULT"];
            id v17 = [v12 value];
            v18 = objc_msgSend(v17, "siriCoreSQLiteValue_escapedString:", 0);
            [v2 addObject:v18];

            break;
          default:
            break;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v9);
  }

  if ([v2 count])
  {
    uint64_t v19 = [v2 componentsJoinedByString:@" "];
  }
  else
  {
    uint64_t v19 = 0;
  }

  return v19;
}

__CFString *SiriCoreSQLiteQueryCreateEscapedAndCommaSeparatedString(void *a1, uint64_t a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a1;
  uint64_t v4 = [v3 count];
  if (v4)
  {
    if (v4 == 1)
    {
      id v5 = [v3 objectAtIndex:0];
      uint64_t v6 = objc_msgSend(v5, "siriCoreSQLiteValue_escapedString:", a2);
    }
    else
    {
      id v5 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v4];
      long long v15 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v8 = v3;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v16;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v16 != v11) {
              objc_enumerationMutation(v8);
            }
            id v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "siriCoreSQLiteValue_escapedString:", a2, (void)v15);
            [v5 addObject:v13];
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
        }
        while (v10);
      }

      uint64_t v6 = [v5 componentsJoinedByString:@", "];
    }
    uint64_t v7 = (__CFString *)v6;
  }
  else
  {
    uint64_t v7 = &stru_26CD85388;
  }

  return v7;
}

id SiriCoreSQLiteQueryCreateCriterionExpression(void *a1)
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  id v1 = a1;
  id v2 = [v1 columnName];
  id v3 = [v1 value];
  switch([v1 comparisonOperator])
  {
    case 1:
      id v4 = [NSString alloc];
      id v5 = objc_msgSend(v2, "siriCoreSQLiteValue_escapedString:", 1);
      uint64_t v6 = objc_msgSend(v3, "siriCoreSQLiteValue_escapedString:", 0);
      uint64_t v7 = [v4 initWithFormat:@"%@ == %@", v5, v6];
      goto LABEL_8;
    case 2:
      id v8 = [NSString alloc];
      id v5 = objc_msgSend(v2, "siriCoreSQLiteValue_escapedString:", 1);
      uint64_t v6 = objc_msgSend(v3, "siriCoreSQLiteValue_escapedString:", 0);
      uint64_t v7 = [v8 initWithFormat:@"%@ > %@", v5, v6];
      goto LABEL_8;
    case 3:
      id v9 = [NSString alloc];
      id v5 = objc_msgSend(v2, "siriCoreSQLiteValue_escapedString:", 1);
      uint64_t v6 = objc_msgSend(v3, "siriCoreSQLiteValue_escapedString:", 0);
      uint64_t v7 = [v9 initWithFormat:@"%@ >= %@", v5, v6];
      goto LABEL_8;
    case 4:
      id v10 = [NSString alloc];
      id v5 = objc_msgSend(v2, "siriCoreSQLiteValue_escapedString:", 1);
      uint64_t v6 = objc_msgSend(v3, "siriCoreSQLiteValue_escapedString:", 0);
      uint64_t v7 = [v10 initWithFormat:@"%@ < %@", v5, v6];
      goto LABEL_8;
    case 5:
      id v11 = [NSString alloc];
      id v5 = objc_msgSend(v2, "siriCoreSQLiteValue_escapedString:", 1);
      uint64_t v6 = objc_msgSend(v3, "siriCoreSQLiteValue_escapedString:", 0);
      uint64_t v7 = [v11 initWithFormat:@"%@ <= %@", v5, v6];
      goto LABEL_8;
    case 6:
      id v12 = [NSString alloc];
      id v5 = objc_msgSend(v2, "siriCoreSQLiteValue_escapedString:", 1);
      uint64_t v6 = objc_msgSend(v3, "siriCoreSQLiteValue_escapedString:", 0);
      uint64_t v7 = [v12 initWithFormat:@"%@ != %@", v5, v6];
LABEL_8:
      id v13 = (void *)v7;

      if (!v13) {
        goto LABEL_10;
      }
      id v14 = v13;
      break;
    default:
LABEL_10:
      long long v15 = [v1 values];
      long long v16 = [v1 subcriteria];
      switch([v1 logicalOperator])
      {
        case 1:
          v51 = v15;
          v52 = v3;
          v53 = v2;
          uint64_t v17 = [v16 count];
          long long v18 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v17];
          long long v62 = 0u;
          long long v63 = 0u;
          long long v64 = 0u;
          long long v65 = 0u;
          v56 = v16;
          id v19 = v16;
          uint64_t v20 = [v19 countByEnumeratingWithState:&v62 objects:v67 count:16];
          if (v20)
          {
            uint64_t v21 = v20;
            uint64_t v22 = *(void *)v63;
            do
            {
              for (uint64_t i = 0; i != v21; ++i)
              {
                if (*(void *)v63 != v22) {
                  objc_enumerationMutation(v19);
                }
                long long v24 = SiriCoreSQLiteQueryCreateCriterionExpression(*(void *)(*((void *)&v62 + 1) + 8 * i));
                if (v24)
                {
                  long long v25 = (void *)[[NSString alloc] initWithFormat:@"(%@)", v24];
                  [v18 addObject:v25];
                }
              }
              uint64_t v21 = [v19 countByEnumeratingWithState:&v62 objects:v67 count:16];
            }
            while (v21);
          }

          if (![v18 count]) {
            goto LABEL_55;
          }
          id v26 = @" AND ";
          goto LABEL_54;
        case 2:
          id v54 = [NSString alloc];
          long long v18 = objc_msgSend(v2, "siriCoreSQLiteValue_escapedString:", 1);
          uint64_t v27 = [v15 firstObject];
          id v28 = objc_msgSend(v27, "siriCoreSQLiteValue_escapedString:", 0);
          [v15 lastObject];
          v29 = v57 = v16;
          id v30 = objc_msgSend(v29, "siriCoreSQLiteValue_escapedString:", 0);
          uint64_t v31 = [v54 initWithFormat:@"%@ BETWEEN %@ AND %@", v18, v28, v30];
          goto LABEL_30;
        case 3:
          id v32 = [NSString alloc];
          long long v18 = objc_msgSend(v2, "siriCoreSQLiteValue_escapedString:", 1);
          uint64_t v27 = SiriCoreSQLiteQueryCreateEscapedAndCommaSeparatedString(v15, 0);
          uint64_t v33 = [v32 initWithFormat:@"%@ IN (%@)", v18, v27];
          goto LABEL_33;
        case 4:
          id v34 = [NSString alloc];
          long long v18 = objc_msgSend(v2, "siriCoreSQLiteValue_escapedString:", 1);
          uint64_t v27 = objc_msgSend(v3, "siriCoreSQLiteValue_escapedString:", 0);
          uint64_t v33 = [v34 initWithFormat:@"%@ IS %@", v18, v27];
          goto LABEL_33;
        case 5:
          id v35 = [NSString alloc];
          long long v18 = objc_msgSend(v2, "siriCoreSQLiteValue_escapedString:", 1);
          uint64_t v27 = objc_msgSend(v3, "siriCoreSQLiteValue_escapedString:", 0);
          uint64_t v33 = [v35 initWithFormat:@"%@ IS NOT %@", v18, v27];
          goto LABEL_33;
        case 6:
          id v36 = [NSString alloc];
          long long v18 = objc_msgSend(v2, "siriCoreSQLiteValue_escapedString:", 1);
          uint64_t v37 = [v36 initWithFormat:@"%@ ISNULL", v18];
          goto LABEL_42;
        case 7:
          id v38 = [NSString alloc];
          long long v18 = objc_msgSend(v2, "siriCoreSQLiteValue_escapedString:", 1);
          uint64_t v27 = objc_msgSend(v3, "siriCoreSQLiteValue_escapedString:", 0);
          uint64_t v33 = [v38 initWithFormat:@"%@ LIKE %@", v18, v27];
          goto LABEL_33;
        case 8:
          id v55 = [NSString alloc];
          long long v18 = objc_msgSend(v2, "siriCoreSQLiteValue_escapedString:", 1);
          uint64_t v27 = [v15 firstObject];
          id v28 = objc_msgSend(v27, "siriCoreSQLiteValue_escapedString:", 0);
          [v15 lastObject];
          v29 = v57 = v16;
          id v30 = objc_msgSend(v29, "siriCoreSQLiteValue_escapedString:", 0);
          uint64_t v31 = [v55 initWithFormat:@"%@ NOT BETWEEN %@ AND %@", v18, v28, v30];
LABEL_30:
          id v14 = (id)v31;

          long long v16 = v57;
          goto LABEL_34;
        case 9:
          id v39 = [NSString alloc];
          long long v18 = objc_msgSend(v2, "siriCoreSQLiteValue_escapedString:", 1);
          uint64_t v27 = SiriCoreSQLiteQueryCreateEscapedAndCommaSeparatedString(v15, 0);
          uint64_t v33 = [v39 initWithFormat:@"%@ NOT IN (%@)", v18, v27];
          goto LABEL_33;
        case 10:
          id v40 = [NSString alloc];
          long long v18 = objc_msgSend(v2, "siriCoreSQLiteValue_escapedString:", 1);
          uint64_t v27 = objc_msgSend(v3, "siriCoreSQLiteValue_escapedString:", 0);
          uint64_t v33 = [v40 initWithFormat:@"%@ NOT LIKE %@", v18, v27];
LABEL_33:
          id v14 = (id)v33;
LABEL_34:

          goto LABEL_35;
        case 11:
          id v42 = [NSString alloc];
          long long v18 = objc_msgSend(v2, "siriCoreSQLiteValue_escapedString:", 1);
          uint64_t v37 = [v42 initWithFormat:@"%@ NOTNULL", v18];
LABEL_42:
          id v14 = (id)v37;
          goto LABEL_35;
        case 12:
          v51 = v15;
          v52 = v3;
          v53 = v2;
          uint64_t v43 = [v16 count];
          long long v18 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v43];
          long long v58 = 0u;
          long long v59 = 0u;
          long long v60 = 0u;
          long long v61 = 0u;
          v56 = v16;
          id v44 = v16;
          uint64_t v45 = [v44 countByEnumeratingWithState:&v58 objects:v66 count:16];
          if (v45)
          {
            uint64_t v46 = v45;
            uint64_t v47 = *(void *)v59;
            do
            {
              for (uint64_t j = 0; j != v46; ++j)
              {
                if (*(void *)v59 != v47) {
                  objc_enumerationMutation(v44);
                }
                v49 = SiriCoreSQLiteQueryCreateCriterionExpression(*(void *)(*((void *)&v58 + 1) + 8 * j));
                if (v49)
                {
                  v50 = (void *)[[NSString alloc] initWithFormat:@"(%@)", v49];
                  [v18 addObject:v50];
                }
              }
              uint64_t v46 = [v44 countByEnumeratingWithState:&v58 objects:v66 count:16];
            }
            while (v46);
          }

          if ([v18 count])
          {
            id v26 = @" OR ";
LABEL_54:
            id v14 = [v18 componentsJoinedByString:v26];
          }
          else
          {
LABEL_55:
            id v14 = 0;
          }
          id v3 = v52;
          id v2 = v53;
          long long v15 = v51;
          long long v16 = v56;
LABEL_35:

          if (v14) {
            id v14 = v14;
          }
          break;
        default:
          id v14 = 0;
          break;
      }

      break;
  }

  return v14;
}

id SiriCoreSQLiteQueryCreateOrderExpression(void *a1)
{
  id v1 = a1;
  id v2 = v1;
  if (!v1)
  {
    id v8 = 0;
    goto LABEL_13;
  }
  id v3 = [v1 columnNames];
  if ([v3 count])
  {
    uint64_t v4 = [v2 mode];
    switch(v4)
    {
      case 2:
        id v9 = [NSString alloc];
        uint64_t v6 = SiriCoreSQLiteQueryCreateEscapedAndCommaSeparatedString(v3, 1);
        uint64_t v7 = [v9 initWithFormat:@"ORDER BY %@ DESC", v6];
        goto LABEL_11;
      case 1:
        id v10 = [NSString alloc];
        uint64_t v6 = SiriCoreSQLiteQueryCreateEscapedAndCommaSeparatedString(v3, 1);
        uint64_t v7 = [v10 initWithFormat:@"ORDER BY %@ ASC", v6];
        goto LABEL_11;
      case 0:
        id v5 = [NSString alloc];
        uint64_t v6 = SiriCoreSQLiteQueryCreateEscapedAndCommaSeparatedString(v3, 1);
        uint64_t v7 = [v5 initWithFormat:@"ORDER BY %@", v6];
LABEL_11:
        id v8 = (void *)v7;

        goto LABEL_12;
    }
  }
  id v8 = 0;
LABEL_12:

LABEL_13:

  return v8;
}

id SiriCoreSQLiteQueryCreateRangeExpression(void *a1)
{
  id v1 = a1;
  id v2 = v1;
  if (v1)
  {
    uint64_t v3 = [v1 offset];
    id v4 = [NSString alloc];
    uint64_t v5 = [v2 limit];
    if (v3) {
      uint64_t v6 = objc_msgSend(v4, "initWithFormat:", @"LIMIT %tu OFFSET %tu", v5, v3);
    }
    else {
      uint64_t v6 = objc_msgSend(v4, "initWithFormat:", @"LIMIT %tu", v5, v9);
    }
    uint64_t v7 = (void *)v6;
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

uint64_t __Block_byref_object_copy__1683(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1684(uint64_t a1)
{
}

uint64_t _RouteHostStringIsAcceptable(void *a1)
{
  id v1 = a1;
  id v2 = v1;
  if (v1 && ([v1 hasSuffix:@"apple.com"] & 1) == 0) {
    uint64_t v3 = [v2 hasPrefix:@"17."];
  }
  else {
    uint64_t v3 = 1;
  }

  return v3;
}

uint64_t __Block_byref_object_copy__2390(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2391(uint64_t a1)
{
}

id initWRM_iRATInterface_2578()
{
  if (initWRM_iRATInterface_sOnce_2579 != -1) {
    dispatch_once(&initWRM_iRATInterface_sOnce_2579, &__block_literal_global_298);
  }
  v0 = (void *)classWRM_iRATInterface_2580;

  return v0;
}

Class __initWRM_iRATInterface_block_invoke_2582()
{
  if (WirelessCoexManagerLibrary_sOnce_2583 != -1) {
    dispatch_once(&WirelessCoexManagerLibrary_sOnce_2583, &__block_literal_global_301);
  }
  Class result = objc_getClass("WRM_iRATInterface");
  classWRM_iRATInterface_2580 = (uint64_t)result;
  getWRM_iRATInterfaceClass_2574 = WRM_iRATInterfaceFunction_2585;
  return result;
}

id WRM_iRATInterfaceFunction_2585()
{
  return (id)classWRM_iRATInterface_2580;
}

void *__WirelessCoexManagerLibrary_block_invoke_2587()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/WirelessCoexManager.framework/WirelessCoexManager", 2);
  WirelessCoexManagerLibrary_sLib_2588 = (uint64_t)result;
  return result;
}

void sub_21CC1EBC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
  _Block_object_dispose(&a41, 8);
  _Block_object_dispose(&a45, 8);
  _Block_object_dispose((const void *)(v45 - 160), 8);
  _Block_object_dispose((const void *)(v45 - 240), 8);
  _Block_object_dispose((const void *)(v45 - 208), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2589(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2590(uint64_t a1)
{
}

void sub_21CC203D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void SiriCoreNetworkQuality(BOOL *a1, uint64_t a2)
{
  if (a1)
  {
    if (a2)
    {
      if (a2 == 2)
      {
        uint64_t v3 = +[SiriCoreNetworkManager sharedInstance];
        uint64_t v4 = [v3 anyNetworkQuality];
      }
      else
      {
        uint64_t v3 = +[SiriCoreNetworkManager sharedInstance];
        uint64_t v4 = [v3 cellularNetworkQuality];
      }
    }
    else
    {
      uint64_t v3 = +[SiriCoreNetworkManager sharedInstance];
      uint64_t v4 = [v3 wifiNetworkQuality];
    }
    uint64_t v5 = v4;

    if (v5) {
      *a1 = v5 != 2;
    }
  }
}

__CFString *SiriCoreConnectionTechnologyGetDescription(uint64_t a1)
{
  if (a1 > 2999)
  {
    switch(a1)
    {
      case 3000:
      case 3006:
        Class result = @"MPTCP";
        break;
      case 3001:
        Class result = @"LedBelly";
        break;
      case 3002:
        Class result = @"IDS";
        break;
      case 3003:
        Class result = @"POP";
        break;
      case 3004:
        Class result = @"Florence";
        break;
      case 3005:
        Class result = @"Local";
        break;
      default:
LABEL_8:
        Class result = @"Unknown";
        break;
    }
  }
  else
  {
    uint64_t v1 = a1 - 2000;
    Class result = @"UTRAN";
    switch(v1)
    {
      case 0:
        Class result = @"WWAN";
        break;
      case 1:
        return result;
      case 2:
        Class result = @"2G CDMA1x";
        break;
      case 3:
        Class result = @"LTE";
        break;
      case 4:
        Class result = @"2G GPRS";
        break;
      case 5:
        Class result = @"2G Edge";
        break;
      case 6:
        Class result = @"3G WCDMA";
        break;
      case 7:
        Class result = @"3G HSDPA";
        break;
      case 8:
        Class result = @"3G HSUPA";
        break;
      case 9:
        Class result = @"3G EVDORev0";
        break;
      case 10:
        Class result = @"3G EVDORevA";
        break;
      case 11:
        Class result = @"CDMA EVDORevB";
        break;
      case 12:
        Class result = @"HRPD";
        break;
      case 13:
        Class result = @"5G NRNSA";
        break;
      case 14:
        Class result = @"5G NR";
        break;
      default:
        if (@"UTRAN" != (__CFString *)1000) {
          goto LABEL_8;
        }
        Class result = @"Wi-Fi";
        break;
    }
  }
  return result;
}

id SiriCoreSQLiteDatabaseCreateSQLiteAPIErrorFromResultCode(int a1, uint64_t a2)
{
  if (a1)
  {
    uint64_t v4 = sqlite3_errstr(a1);
    if (v4)
    {
      uint64_t v5 = (void *)[[NSString alloc] initWithUTF8String:v4];
      id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      id v7 = v6;
      if (v5)
      {
        [v6 setObject:v5 forKey:*MEMORY[0x263F08320]];
      }
    }
    else
    {
      id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    }
    uint64_t v9 = [NSNumber numberWithInt:a2];
    [v7 setObject:v9 forKey:@"SiriCoreSQLiteAPIErrorExtendedCode"];

    id v10 = (void *)MEMORY[0x263F087E8];
    id v11 = (void *)[v7 copy];
    id v8 = [v10 errorWithDomain:@"SiriCoreSQLiteAPIErrorDomain" code:a1 userInfo:v11];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

BOOL SiriCoreSQLiteDatabaseIsErrorUnrecoverable(void *a1)
{
  id v1 = a1;
  id v2 = [v1 domain];
  if (![v2 isEqualToString:@"SiriCoreSQLiteDatabaseErrorDomain"]) {
    goto LABEL_10;
  }
  uint64_t v3 = [v1 code];

  if (v3 != 2)
  {
    BOOL v9 = 0;
    goto LABEL_13;
  }
  uint64_t v4 = [v1 userInfo];
  id v2 = [v4 objectForKey:*MEMORY[0x263F08608]];

  uint64_t v5 = [v2 domain];
  int v6 = [v5 isEqualToString:@"SiriCoreSQLiteAPIErrorDomain"];

  if (v6)
  {
    uint64_t v7 = [v2 code];
    BOOL v9 = v7 == 11 || v7 == 26;
  }
  else
  {
LABEL_10:
    BOOL v9 = 0;
  }

LABEL_13:
  return v9;
}

void sub_21CC22988(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

uint64_t __Block_byref_object_copy__2930(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2931(uint64_t a1)
{
}

void sub_21CC22F30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

id _SiriCoreSQLiteApplyIndexToQuery(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (v3 && [v3 length])
  {
    uint64_t v5 = [v4 stringByAppendingFormat:@" INDEXED BY %@", v3];

    id v4 = (id)v5;
  }

  return v4;
}

void sub_21CC26AD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21CC29040(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 120));
  _Unwind_Resume(a1);
}

__CFString *SiriCoreUUIDStringCreate()
{
  CFUUIDRef v0 = CFUUIDCreate(0);
  id v1 = (__CFString *)CFUUIDCreateString(0, v0);
  if (v0) {
    CFRelease(v0);
  }

  return v1;
}

id SiriCoreUserAgentStringCreate(void *a1)
{
  id v1 = a1;
  id v2 = AFProductType();
  uint64_t v3 = NSString;
  id v4 = AFDeviceName();
  if (v1)
  {
    uint64_t v5 = [v1 stringByAppendingString:v2];
  }
  else
  {
    uint64_t v5 = v2;
  }
  int v6 = AFProductName();
  uint64_t v7 = AFProductVersion();
  id v8 = AFBuildVersion();
  objc_msgSend(v3, "stringWithFormat:", @"Assistant(%@/%@; %@/%@/%@) Ace/%@",
    v4,
    v5,
    v6,
    v7,
    v8,
  BOOL v9 = *MEMORY[0x263F65100]);

  if (v1) {

  }
  return v9;
}

id productTypeFromUserAgentString(void *a1)
{
  id v1 = (void *)MEMORY[0x263F08708];
  id v2 = a1;
  uint64_t v3 = [v1 characterSetWithCharactersInString:@"(/;)"];
  id v4 = [v2 componentsSeparatedByCharactersInSet:v3];

  if ((unint64_t)[v4 count] >= 3)
  {
    uint64_t v5 = [v4 objectAtIndex:2];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

void sub_21CC2C35C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3941(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3942(uint64_t a1)
{
}

id _SiriCoreSharedResourcesDirectory()
{
  if (_SiriCoreSharedResourcesDirectory_once != -1) {
    dispatch_once(&_SiriCoreSharedResourcesDirectory_once, &__block_literal_global_4027);
  }
  CFUUIDRef v0 = (void *)_SiriCoreSharedResourcesDirectory_sUserSupportDirectoryPath;

  return v0;
}

uint64_t AFAnalyticsContextCreateWithError()
{
  return MEMORY[0x270F0EBF8]();
}

uint64_t AFAnalyticsContextsMerge()
{
  return MEMORY[0x270F0EC10]();
}

uint64_t AFAnalyticsEventTypeGetName()
{
  return MEMORY[0x270F0EC20]();
}

uint64_t AFBuildVersion()
{
  return MEMORY[0x270F0EC50]();
}

uint64_t AFDeviceName()
{
  return MEMORY[0x270F0EC88]();
}

uint64_t AFDeviceRegionCode()
{
  return MEMORY[0x270F0EC90]();
}

uint64_t AFDeviceSupportsSiriUOD()
{
  return MEMORY[0x270F0ECE8]();
}

uint64_t AFDeviceSupportsWiFiLPASMode()
{
  return MEMORY[0x270F0ED00]();
}

uint64_t AFErrorEnumerate()
{
  return MEMORY[0x270F0ED30]();
}

uint64_t AFHasCellularData()
{
  return MEMORY[0x270F0ED60]();
}

uint64_t AFIsHorseman()
{
  return MEMORY[0x270F0EDC0]();
}

uint64_t AFIsInternalInstall()
{
  return MEMORY[0x270F0EDD0]();
}

uint64_t AFIsNano()
{
  return MEMORY[0x270F0EDE0]();
}

uint64_t AFMachAbsoluteTimeGetTimeInterval()
{
  return MEMORY[0x270F0EE20]();
}

uint64_t AFProductName()
{
  return MEMORY[0x270F0EEE0]();
}

uint64_t AFProductType()
{
  return MEMORY[0x270F0EEE8]();
}

uint64_t AFProductVersion()
{
  return MEMORY[0x270F0EEF0]();
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x270ED7B28](data, *(void *)&len, md);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x270EE4808](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x270EE4820](theData);
}

Boolean CFHTTPMessageAppendBytes(CFHTTPMessageRef message, const UInt8 *newBytes, CFIndex numBytes)
{
  return MEMORY[0x270EE2850](message, newBytes, numBytes);
}

CFDictionaryRef CFHTTPMessageCopyAllHeaderFields(CFHTTPMessageRef message)
{
  return (CFDictionaryRef)MEMORY[0x270EE2858](message);
}

CFDataRef CFHTTPMessageCopyBody(CFHTTPMessageRef message)
{
  return (CFDataRef)MEMORY[0x270EE2860](message);
}

CFStringRef CFHTTPMessageCopyHeaderFieldValue(CFHTTPMessageRef message, CFStringRef headerField)
{
  return (CFStringRef)MEMORY[0x270EE2868](message, headerField);
}

CFDataRef CFHTTPMessageCopySerializedMessage(CFHTTPMessageRef message)
{
  return (CFDataRef)MEMORY[0x270EE2880](message);
}

CFHTTPMessageRef CFHTTPMessageCreateEmpty(CFAllocatorRef alloc, Boolean isRequest)
{
  return (CFHTTPMessageRef)MEMORY[0x270EE2888](alloc, isRequest);
}

CFHTTPMessageRef CFHTTPMessageCreateRequest(CFAllocatorRef alloc, CFStringRef requestMethod, CFURLRef url, CFStringRef httpVersion)
{
  return (CFHTTPMessageRef)MEMORY[0x270EE2890](alloc, requestMethod, url, httpVersion);
}

CFIndex CFHTTPMessageGetResponseStatusCode(CFHTTPMessageRef response)
{
  return MEMORY[0x270EE28A0](response);
}

Boolean CFHTTPMessageIsHeaderComplete(CFHTTPMessageRef message)
{
  return MEMORY[0x270EE28B0](message);
}

void CFHTTPMessageSetHeaderFieldValue(CFHTTPMessageRef message, CFStringRef headerField, CFStringRef value)
{
}

void CFReadStreamSetDispatchQueue(CFReadStreamRef stream, dispatch_queue_t q)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x270EE5470](alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x270EE5488](alloc, uuid);
}

void CFWriteStreamSetDispatchQueue(CFWriteStreamRef stream, dispatch_queue_t q)
{
}

Boolean CFWriteStreamSetProperty(CFWriteStreamRef stream, CFStreamPropertyKey propertyName, CFTypeRef propertyValue)
{
  return MEMORY[0x270EE5578](stream, propertyName, propertyValue);
}

uint64_t CPSharedResourcesDirectory()
{
  return MEMORY[0x270F0CDD0]();
}

void *__cdecl NSMapGet(NSMapTable *table, const void *key)
{
  return (void *)MEMORY[0x270EF2B30](table, key);
}

void NSMapInsert(NSMapTable *table, const void *key, const void *value)
{
}

void NSMapRemove(NSMapTable *table, const void *key)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

uint64_t NetworkServiceProxyEnableInParameters()
{
  return MEMORY[0x270F4DCC8]();
}

uint64_t NetworkServiceProxyIsEnabled()
{
  return MEMORY[0x270F4DCD0]();
}

uint64_t NetworkServiceProxySetServiceNameForConnection()
{
  return MEMORY[0x270F4DCD8]();
}

uint64_t NetworkServiceProxySetServiceNameInParameters()
{
  return MEMORY[0x270F4DCE0]();
}

uint64_t TRIProject_ProjectId_IsValidValue()
{
  return MEMORY[0x270F80720]();
}

uint64_t WiFiDeviceClientCopyCurrentNetwork()
{
  return MEMORY[0x270F4B418]();
}

uint64_t WiFiManagerClientCopyDevices()
{
  return MEMORY[0x270F4B4C8]();
}

uint64_t WiFiManagerClientCreate()
{
  return MEMORY[0x270F4B510]();
}

uint64_t WiFiManagerClientGetPower()
{
  return MEMORY[0x270F4B568]();
}

uint64_t WiFiManagerClientSetType()
{
  return MEMORY[0x270F4B688]();
}

uint64_t WiFiNetworkGetChannel()
{
  return MEMORY[0x270F4B718]();
}

uint64_t WiFiNetworkGetChannelWidthInMHz()
{
  return MEMORY[0x270F4B720]();
}

uint64_t WiFiNetworkGetIntProperty()
{
  return MEMORY[0x270F4B738]();
}

uint64_t WiFiNetworkGetOperatingBand()
{
  return MEMORY[0x270F4B750]();
}

uint64_t WiFiNetworkGetPhyMode()
{
  return MEMORY[0x270F4B760]();
}

uint64_t WiFiNetworkIsCaptive()
{
  return MEMORY[0x270F4B7B0]();
}

uint64_t _AFMemoryPressureConditionGetName()
{
  return MEMORY[0x270F0F010]();
}

uint64_t _AFPreferencesForceOnDeviceOnlyDictationEnabled()
{
  return MEMORY[0x270F0F020]();
}

uint64_t _AFPreferencesGetTuscanyStatus()
{
  return MEMORY[0x270F0F038]();
}

uint64_t _AFPreferencesNetworkStackOverride()
{
  return MEMORY[0x270F0F040]();
}

uint64_t _AFPreferencesShouldUseTFO()
{
  return MEMORY[0x270F0F058]();
}

uint64_t _AFPreferencesShowAllDialogVariantsEnabled()
{
  return MEMORY[0x270F0F060]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CTServerConnectionCreateOnTargetQueue()
{
  return MEMORY[0x270EE87C0]();
}

uint64_t _CTServerConnectionDormancySuspendAssertionCreateWithExpirationCB()
{
  return MEMORY[0x270EE87E0]();
}

uint64_t _CTServerForceFastDormancy()
{
  return MEMORY[0x270EE88D8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x270ED7EE0]();
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

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x270ED85F8](*(void *)&__upper_bound);
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

int deflate(z_streamp strm, int flush)
{
  return MEMORY[0x270F9C698](strm, *(void *)&flush);
}

int deflateEnd(z_streamp strm)
{
  return MEMORY[0x270F9C6A8](strm);
}

int deflateInit_(z_streamp strm, int level, const char *version, int stream_size)
{
  return MEMORY[0x270F9C6B8](strm, *(void *)&level, version, *(void *)&stream_size);
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

BOOL dispatch_data_apply(dispatch_data_t data, dispatch_data_applier_t applier)
{
  return MEMORY[0x270ED92B8](data, applier);
}

dispatch_data_t dispatch_data_create(const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return (dispatch_data_t)MEMORY[0x270ED92D0](buffer, size, queue, destructor);
}

dispatch_data_t dispatch_data_create_concat(dispatch_data_t data1, dispatch_data_t data2)
{
  return (dispatch_data_t)MEMORY[0x270ED92E0](data1, data2);
}

dispatch_data_t dispatch_data_create_subrange(dispatch_data_t data, size_t offset, size_t length)
{
  return (dispatch_data_t)MEMORY[0x270ED92F0](data, offset, length);
}

size_t dispatch_data_get_size(dispatch_data_t data)
{
  return MEMORY[0x270ED9300](data);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
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
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x270ED9468](label, attr, target);
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
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
  return MEMORY[0x270ED95A8](when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x270ED9628](__path, *(void *)&__mode);
}

void free(void *a1)
{
}

int getnameinfo(const sockaddr *a1, socklen_t a2, char *a3, socklen_t a4, char *a5, socklen_t a6, int a7)
{
  return MEMORY[0x270ED9CA8](a1, *(void *)&a2, a3, *(void *)&a4, a5, *(void *)&a6, *(void *)&a7);
}

char *__cdecl if_indextoname(unsigned int a1, char *a2)
{
  return (char *)MEMORY[0x270ED9E70](*(void *)&a1, a2);
}

unsigned int if_nametoindex(const char *a1)
{
  return MEMORY[0x270ED9E80](a1);
}

int inflate(z_streamp strm, int flush)
{
  return MEMORY[0x270F9C730](strm, *(void *)&flush);
}

int inflateEnd(z_streamp strm)
{
  return MEMORY[0x270F9C738](strm);
}

int inflateInit_(z_streamp strm, const char *version, int stream_size)
{
  return MEMORY[0x270F9C748](strm, version, *(void *)&stream_size);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return MEMORY[0x270ED9ED8](*(void *)&a1, a2);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x270ED9F50]();
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

uint64_t nw_activity_complete_with_reason_and_underlying_error()
{
  return MEMORY[0x270EF79B0]();
}

uint64_t nw_activity_create()
{
  return MEMORY[0x270EF79C8]();
}

uint64_t nw_activity_get_label()
{
  return MEMORY[0x270EF7A00]();
}

uint64_t nw_activity_get_token()
{
  return MEMORY[0x270EF7A08]();
}

uint64_t nw_activity_set_parent_activity()
{
  return MEMORY[0x270EF7A28]();
}

uint64_t nw_array_get_count()
{
  return MEMORY[0x270EF7A88]();
}

uint64_t nw_array_get_object_at_index()
{
  return MEMORY[0x270EF7A90]();
}

void nw_connection_access_establishment_report(nw_connection_t connection, dispatch_queue_t queue, nw_establishment_report_access_block_t access_block)
{
}

void nw_connection_cancel(nw_connection_t connection)
{
}

uint64_t nw_connection_copy_attempted_endpoint_array()
{
  return MEMORY[0x270EF7B50]();
}

uint64_t nw_connection_copy_connected_path()
{
  return MEMORY[0x270EF7B60]();
}

uint64_t nw_connection_copy_connected_remote_endpoint()
{
  return MEMORY[0x270EF7B68]();
}

nw_path_t nw_connection_copy_current_path(nw_connection_t connection)
{
  return (nw_path_t)MEMORY[0x270EF7B70](connection);
}

char *__cdecl nw_connection_copy_description(nw_connection_t connection)
{
  return (char *)MEMORY[0x270EF7B78](connection);
}

nw_protocol_metadata_t nw_connection_copy_protocol_metadata(nw_connection_t connection, nw_protocol_definition_t definition)
{
  return (nw_protocol_metadata_t)MEMORY[0x270EF7B90](connection, definition);
}

uint64_t nw_connection_copy_tcp_info()
{
  return MEMORY[0x270EF7BA0]();
}

nw_connection_t nw_connection_create(nw_endpoint_t endpoint, nw_parameters_t parameters)
{
  return (nw_connection_t)MEMORY[0x270EF7BA8](endpoint, parameters);
}

uint64_t nw_connection_end_activity()
{
  return MEMORY[0x270EF7BD0]();
}

uint64_t nw_connection_fillout_tcp_statistics()
{
  return MEMORY[0x270EF7BE0]();
}

uint64_t nw_connection_get_id()
{
  return MEMORY[0x270EF7BF8]();
}

uint64_t nw_connection_multipath_copy_subflow_counts()
{
  return MEMORY[0x270EF7C48]();
}

uint64_t nw_connection_multipath_get_primary_subflow_interface_index()
{
  return MEMORY[0x270EF7C50]();
}

uint64_t nw_connection_multipath_get_subflow_count()
{
  return MEMORY[0x270EF7C58]();
}

void nw_connection_receive(nw_connection_t connection, uint32_t minimum_incomplete_length, uint32_t maximum_length, nw_connection_receive_completion_t completion)
{
}

void nw_connection_send(nw_connection_t connection, dispatch_data_t content, nw_content_context_t context, BOOL is_complete, nw_connection_send_completion_t completion)
{
}

void nw_connection_set_better_path_available_handler(nw_connection_t connection, nw_connection_BOOLean_event_handler_t handler)
{
}

uint64_t nw_connection_set_event_handler()
{
  return MEMORY[0x270EF7CB8]();
}

void nw_connection_set_queue(nw_connection_t connection, dispatch_queue_t queue)
{
}

uint64_t nw_connection_set_read_close_handler()
{
  return MEMORY[0x270EF7CE0]();
}

void nw_connection_set_viability_changed_handler(nw_connection_t connection, nw_connection_BOOLean_event_handler_t handler)
{
}

uint64_t nw_connection_set_write_close_handler()
{
  return MEMORY[0x270EF7D00]();
}

void nw_connection_start(nw_connection_t connection)
{
}

uint64_t nw_connection_start_activity()
{
  return MEMORY[0x270EF7D18]();
}

uint64_t nw_connection_uses_multipath()
{
  return MEMORY[0x270EF7D38]();
}

uint64_t nw_context_create()
{
  return MEMORY[0x270EF7DE0]();
}

uint64_t nw_context_set_isolate_protocol_cache()
{
  return MEMORY[0x270EF7DF8]();
}

uint64_t nw_context_set_isolate_protocol_stack()
{
  return MEMORY[0x270EF7E00]();
}

uint64_t nw_context_set_privacy_level()
{
  return MEMORY[0x270EF7E08]();
}

uint64_t nw_context_set_scheduling_mode()
{
  return MEMORY[0x270EF7E10]();
}

char *__cdecl nw_endpoint_copy_port_string(nw_endpoint_t endpoint)
{
  return (char *)MEMORY[0x270EF7E70](endpoint);
}

nw_endpoint_t nw_endpoint_create_host(const char *hostname, const char *port)
{
  return (nw_endpoint_t)MEMORY[0x270EF7EB0](hostname, port);
}

uint64_t nw_endpoint_get_description()
{
  return MEMORY[0x270EF7F10]();
}

nw_endpoint_type_t nw_endpoint_get_type(nw_endpoint_t endpoint)
{
  return MEMORY[0x270EF7F68](endpoint);
}

uint64_t nw_endpoint_set_alternate_port()
{
  return MEMORY[0x270EF7FA0]();
}

CFErrorRef nw_error_copy_cf_error(nw_error_t error)
{
  return (CFErrorRef)MEMORY[0x270EF7FB8](error);
}

int nw_error_get_error_code(nw_error_t error)
{
  return MEMORY[0x270EF7FD0](error);
}

nw_error_domain_t nw_error_get_error_domain(nw_error_t error)
{
  return MEMORY[0x270EF7FD8](error);
}

nw_endpoint_t nw_establishment_report_copy_proxy_endpoint(nw_establishment_report_t report)
{
  return (nw_endpoint_t)MEMORY[0x270EF7FE0](report);
}

void nw_establishment_report_enumerate_protocols(nw_establishment_report_t report, nw_report_protocol_enumerator_t enumerate_block)
{
}

void nw_establishment_report_enumerate_resolutions(nw_establishment_report_t report, nw_report_resolution_enumerator_t enumerate_block)
{
}

uint64_t nw_establishment_report_get_attempt_started_after_milliseconds(nw_establishment_report_t report)
{
  return MEMORY[0x270EF8008](report);
}

uint64_t nw_establishment_report_get_duration_milliseconds(nw_establishment_report_t report)
{
  return MEMORY[0x270EF8010](report);
}

uint32_t nw_establishment_report_get_previous_attempt_count(nw_establishment_report_t report)
{
  return MEMORY[0x270EF8018](report);
}

BOOL nw_establishment_report_get_proxy_configured(nw_establishment_report_t report)
{
  return MEMORY[0x270EF8020](report);
}

BOOL nw_establishment_report_get_used_proxy(nw_establishment_report_t report)
{
  return MEMORY[0x270EF8028](report);
}

uint32_t nw_interface_get_index(nw_interface_t interface)
{
  return MEMORY[0x270EF8368](interface);
}

const char *__cdecl nw_interface_get_name(nw_interface_t interface)
{
  return (const char *)MEMORY[0x270EF8380](interface);
}

nw_interface_type_t nw_interface_get_type(nw_interface_t interface)
{
  return MEMORY[0x270EF83A0](interface);
}

nw_parameters_t nw_parameters_create_secure_tcp(nw_parameters_configure_protocol_block_t configure_tls, nw_parameters_configure_protocol_block_t configure_tcp)
{
  return (nw_parameters_t)MEMORY[0x270EF8550](configure_tls, configure_tcp);
}

uint64_t nw_parameters_set_context()
{
  return MEMORY[0x270EF8610]();
}

uint64_t nw_parameters_set_data_mode()
{
  return MEMORY[0x270EF8620]();
}

void nw_parameters_set_expired_dns_behavior(nw_parameters_t parameters, nw_parameters_expired_dns_behavior_t expired_dns_behavior)
{
}

uint64_t nw_parameters_set_indefinite()
{
  return MEMORY[0x270EF8670]();
}

uint64_t nw_parameters_set_initial_data_payload()
{
  return MEMORY[0x270EF8678]();
}

void nw_parameters_set_multipath_service(nw_parameters_t parameters, nw_multipath_service_t multipath_service)
{
}

void nw_parameters_set_required_interface_type(nw_parameters_t parameters, nw_interface_type_t interface_type)
{
}

uint64_t nw_parameters_set_source_application()
{
  return MEMORY[0x270EF8748]();
}

uint64_t nw_parameters_set_tfo()
{
  return MEMORY[0x270EF8760]();
}

uint64_t nw_parameters_set_tls_session_id()
{
  return MEMORY[0x270EF8768]();
}

uint64_t nw_parameters_set_traffic_class()
{
  return MEMORY[0x270EF8770]();
}

uint64_t nw_path_copy_interface()
{
  return MEMORY[0x270EF87B8]();
}

uint64_t nw_path_create_evaluator_for_endpoint()
{
  return MEMORY[0x270EF87E8]();
}

void nw_path_enumerate_gateways(nw_path_t path, nw_path_enumerate_gateways_block_t enumerate_block)
{
}

void nw_path_enumerate_interfaces(nw_path_t path, nw_path_enumerate_interfaces_block_t enumerate_block)
{
}

uint64_t nw_path_evaluator_cancel()
{
  return MEMORY[0x270EF8808]();
}

uint64_t nw_path_evaluator_set_update_handler()
{
  return MEMORY[0x270EF8840]();
}

nw_path_status_t nw_path_get_status(nw_path_t path)
{
  return MEMORY[0x270EF8928](path);
}

BOOL nw_path_has_dns(nw_path_t path)
{
  return MEMORY[0x270EF8950](path);
}

BOOL nw_path_has_ipv4(nw_path_t path)
{
  return MEMORY[0x270EF8968](path);
}

BOOL nw_path_has_ipv6(nw_path_t path)
{
  return MEMORY[0x270EF8970](path);
}

BOOL nw_path_is_constrained(nw_path_t path)
{
  return MEMORY[0x270EF8988](path);
}

BOOL nw_path_is_expensive(nw_path_t path)
{
  return MEMORY[0x270EF89B8](path);
}

BOOL nw_path_uses_interface_type(nw_path_t path, nw_interface_type_t interface_type)
{
  return MEMORY[0x270EF8A58](path, *(void *)&interface_type);
}

nw_protocol_definition_t nw_protocol_copy_tls_definition(void)
{
  return (nw_protocol_definition_t)MEMORY[0x270EF8B78]();
}

void nw_tcp_options_set_enable_keepalive(nw_protocol_options_t options, BOOL enable_keepalive)
{
}

void nw_tcp_options_set_keepalive_count(nw_protocol_options_t options, uint32_t keepalive_count)
{
}

void nw_tcp_options_set_keepalive_idle_time(nw_protocol_options_t options, uint32_t keepalive_idle_time)
{
}

void nw_tcp_options_set_keepalive_interval(nw_protocol_options_t options, uint32_t keepalive_interval)
{
}

void nw_tcp_options_set_no_delay(nw_protocol_options_t options, BOOL no_delay)
{
}

void nw_tcp_options_set_retransmit_connection_drop_time(nw_protocol_options_t options, uint32_t retransmit_connection_drop_time)
{
}

sec_protocol_options_t nw_tls_copy_sec_protocol_options(nw_protocol_options_t options)
{
  return (sec_protocol_options_t)MEMORY[0x270EF95D0](options);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
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

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return MEMORY[0x270EDAD78](*(void *)&pid, *(void *)&flavor, arg, buffer, *(void *)&buffersize);
}

tls_protocol_version_t sec_protocol_metadata_get_negotiated_tls_protocol_version(sec_protocol_metadata_t metadata)
{
  return (unsigned __int16)MEMORY[0x270EFDED8](metadata);
}

void sec_protocol_options_add_tls_application_protocol(sec_protocol_options_t options, const char *application_protocol)
{
}

void sec_protocol_options_set_max_tls_protocol_version(sec_protocol_options_t options, tls_protocol_version_t version)
{
}

void sec_protocol_options_set_tls_false_start_enabled(sec_protocol_options_t options, BOOL false_start_enabled)
{
}

void sec_protocol_options_set_tls_resumption_enabled(sec_protocol_options_t options, BOOL resumption_enabled)
{
}

void sec_protocol_options_set_tls_tickets_enabled(sec_protocol_options_t options, BOOL tickets_enabled)
{
}

int socket(int a1, int a2, int a3)
{
  return MEMORY[0x270EDB520](*(void *)&a1, *(void *)&a2, *(void *)&a3);
}

int sqlite3_bind_blob64(sqlite3_stmt *a1, int a2, const void *a3, sqlite3_uint64 a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x270F9B498](a1, *(void *)&a2, a3, a4, a5);
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return MEMORY[0x270F9B4A0](a1, *(void *)&a2, a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return MEMORY[0x270F9B4B0](a1, *(void *)&a2, a3);
}

int sqlite3_bind_null(sqlite3_stmt *a1, int a2)
{
  return MEMORY[0x270F9B4B8](a1, *(void *)&a2);
}

int sqlite3_bind_parameter_count(sqlite3_stmt *a1)
{
  return MEMORY[0x270F9B4C0](a1);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x270F9B4E0](a1, *(void *)&a2, a3, *(void *)&a4, a5);
}

int sqlite3_clear_bindings(sqlite3_stmt *a1)
{
  return MEMORY[0x270F9B550](a1);
}

int sqlite3_close_v2(sqlite3 *a1)
{
  return MEMORY[0x270F9B560](a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x270F9B568](a1, *(void *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x270F9B570](a1, *(void *)&iCol);
}

int sqlite3_column_count(sqlite3_stmt *pStmt)
{
  return MEMORY[0x270F9B580](pStmt);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  MEMORY[0x270F9B590](a1, *(void *)&iCol);
  return result;
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x270F9B5A0](a1, *(void *)&iCol);
}

const char *__cdecl sqlite3_column_name(sqlite3_stmt *a1, int N)
{
  return (const char *)MEMORY[0x270F9B5A8](a1, *(void *)&N);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x270F9B5C0](a1, *(void *)&iCol);
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x270F9B5D0](a1, *(void *)&iCol);
}

const char *__cdecl sqlite3_errstr(int a1)
{
  return (const char *)MEMORY[0x270F9B660](*(void *)&a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x270F9B668](a1, sql, callback, a4, errmsg);
}

int sqlite3_extended_errcode(sqlite3 *db)
{
  return MEMORY[0x270F9B678](db);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x270F9B690](pStmt);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x270F9B710](filename, ppDb, *(void *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x270F9B720](db, zSql, *(void *)&nByte, ppStmt, pzTail);
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return MEMORY[0x270F9B730](pStmt);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x270F9B800](a1);
}

int sqlite3_wal_checkpoint_v2(sqlite3 *db, const char *zDb, int eMode, int *pnLog, int *pnCkpt)
{
  return MEMORY[0x270F9B900](db, zDb, *(void *)&eMode, pnLog, pnCkpt);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x270EDB868](*(void *)&target_task, *(void *)&flavor, task_info_out, task_info_outCnt);
}

int uuid_is_null(const uuid_t uu)
{
  return MEMORY[0x270EDBA28](uu);
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x270EDBF90](bytes, length);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x270EDBFA8](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x270EDBFB8](xdata);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x270EDBFE8](xdict, applier);
}

size_t xpc_dictionary_get_count(xpc_object_t xdict)
{
  return MEMORY[0x270EDC058](xdict);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x270EDC440](xuint);
}