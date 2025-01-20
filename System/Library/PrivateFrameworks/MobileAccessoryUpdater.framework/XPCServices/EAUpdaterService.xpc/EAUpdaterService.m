uint64_t UARPStringDynamicAssetsFilepath()
{
  if (qword_10002F8F0 != -1) {
    dispatch_once(&qword_10002F8F0, &stru_100024C90);
  }
  return qword_10002F8E8;
}

void sub_100003600(id a1)
{
  qword_10002F8E8 = +[NSString stringWithFormat:@"%@/%@", InternalStorageDirectoryPath(), @"dynamicassets"];
}

uint64_t UARPStringSupplementalAssetsFilepath()
{
  if (qword_10002F900 != -1) {
    dispatch_once(&qword_10002F900, &stru_100024CB0);
  }
  return qword_10002F8F8;
}

void sub_100003698(id a1)
{
  qword_10002F8F8 = +[NSString stringWithFormat:@"%@/%@", InternalStorageDirectoryPath(), @"supplementalassets"];
}

uint64_t UARPStringTempFilesFilepath()
{
  if (qword_10002F910 != -1) {
    dispatch_once(&qword_10002F910, &stru_100024CD0);
  }
  return qword_10002F908;
}

void sub_100003730(id a1)
{
  qword_10002F908 = +[NSString stringWithFormat:@"%@/%@", InternalStorageDirectoryPath(), @"tmpfiles"];
}

uint64_t UARPStringPcapFilesFilepath()
{
  if (qword_10002F920 != -1) {
    dispatch_once(&qword_10002F920, &stru_100024CF0);
  }
  return qword_10002F918;
}

void sub_1000037C8(id a1)
{
  qword_10002F918 = +[NSString pathWithComponents:](NSString, "pathWithComponents:", +[NSArray arrayWithObjects:InternalStorageDirectoryPath(), @"pcapfiles", 0]);
}

id UARPPayloadHashAlgorithmStringToValue(void *a1)
{
  if ([a1 caseInsensitiveCompare:@"SHA-256"])
  {
    if ([a1 caseInsensitiveCompare:@"SHA-384"])
    {
      if ([a1 caseInsensitiveCompare:@"SHA-512"]) {
        uint64_t v2 = 0;
      }
      else {
        uint64_t v2 = 3;
      }
    }
    else
    {
      uint64_t v2 = 2;
    }
  }
  else
  {
    uint64_t v2 = 1;
  }
  return +[NSNumber numberWithUnsignedShort:v2];
}

uint64_t UARPStringTmapDirectoryPath()
{
  if (qword_10002F930 != -1) {
    dispatch_once(&qword_10002F930, &stru_100024E70);
  }
  return qword_10002F928;
}

void sub_10000390C(id a1)
{
  qword_10002F928 = +[NSString stringWithFormat:@"%@/%@", InternalStorageDirectoryPath(), @"tmap"];
}

uint64_t UARPStringTmapDatabaseFilePath()
{
  if (qword_10002F940 != -1) {
    dispatch_once(&qword_10002F940, &stru_100024E90);
  }
  return qword_10002F938;
}

void sub_1000039A4(id a1)
{
  if (qword_10002F930 != -1) {
    dispatch_once(&qword_10002F930, &stru_100024E70);
  }
  qword_10002F938 = +[NSString stringWithFormat:@"%@/%@", qword_10002F928, @"tmapdatabase"];
}

uint64_t UARPStringTapToRadarFilePath()
{
  if (qword_10002F950 != -1) {
    dispatch_once(&qword_10002F950, &stru_100024EB8);
  }
  return qword_10002F948;
}

void sub_100003A68(id a1)
{
  qword_10002F948 = +[NSString stringWithFormat:@"%@/%@", InternalStorageDirectoryPath(), @"taptoradar"];
}

uint64_t UARPStringLogsDirectoryFilePath()
{
  if (qword_10002F960 != -1) {
    dispatch_once(&qword_10002F960, &stru_100024EE0);
  }
  return qword_10002F958;
}

void sub_100003B00(id a1)
{
  if (qword_10002F950 != -1) {
    dispatch_once(&qword_10002F950, &stru_100024EB8);
  }
  qword_10002F958 = +[NSString stringWithFormat:@"%@/%@", qword_10002F948, @"logs"];
}

uint64_t UARPStringCrashAnalyticsDirectoryFilePath()
{
  if (qword_10002F970 != -1) {
    dispatch_once(&qword_10002F970, &stru_100024F08);
  }
  return qword_10002F968;
}

void sub_100003BC4(id a1)
{
  if (qword_10002F950 != -1) {
    dispatch_once(&qword_10002F950, &stru_100024EB8);
  }
  qword_10002F968 = +[NSString stringWithFormat:@"%@/%@", qword_10002F948, @"crsh"];
}

uint64_t UARPStringCmapDirectoryPath()
{
  if (qword_10002F980 != -1) {
    dispatch_once(&qword_10002F980, &stru_100024FE8);
  }
  return qword_10002F978;
}

void sub_100003C88(id a1)
{
  qword_10002F978 = +[NSString stringWithFormat:@"%@/%@", InternalStorageDirectoryPath(), @"cmap"];
}

uint64_t UARPStringCmapDatabaseFilePath()
{
  if (qword_10002F990 != -1) {
    dispatch_once(&qword_10002F990, &stru_100025008);
  }
  return qword_10002F988;
}

void sub_100003D20(id a1)
{
  if (qword_10002F980 != -1) {
    dispatch_once(&qword_10002F980, &stru_100024FE8);
  }
  qword_10002F988 = +[NSString stringWithFormat:@"%@/%@", qword_10002F978, @"cmapdatabase"];
}

uint64_t UARPStringSysdiagnoseDirectoryFilePath()
{
  if (qword_10002F9A0 != -1) {
    dispatch_once(&qword_10002F9A0, &stru_100025038);
  }
  return qword_10002F998;
}

void sub_100003DE4(id a1)
{
  qword_10002F998 = +[NSString stringWithFormat:@"%@/%@", InternalStorageDirectoryPath(), @"sysdiagnose"];
}

uint64_t UARPStringPifMetricsFilePath()
{
  if (qword_10002F9B0 != -1) {
    dispatch_once(&qword_10002F9B0, &stru_100025060);
  }
  return qword_10002F9A8;
}

void sub_100003E7C(id a1)
{
  if (qword_10002F9A0 != -1) {
    dispatch_once(&qword_10002F9A0, &stru_100025038);
  }
  qword_10002F9A8 = +[NSString stringWithFormat:@"%@/%@", qword_10002F998, @"com.apple.Bluetooth.AccessoryCase.pif_daily"];
}

void sub_100004018(uint64_t a1)
{
}

void sub_100004404(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_10000460C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000462C(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (CFPreferencesGetAppBooleanValue(@"simulateCoreSpeechNotRespoding", @"com.apple.UARPUpdaterServiceLegacyAudio", 0))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Simulating CoreSpeech not responding", buf, 2u);
    }
  }
  else
  {
    if (v7 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v7;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Download Model %@", buf, 0xCu);
    }
    if (v8 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v8;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Fallback Model %@", buf, 0xCu);
    }
    uint64_t v10 = *(void *)(a1 + 32);
    v11 = *(NSObject **)(v10 + 16);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100004840;
    v12[3] = &unk_1000250B0;
    v12[4] = v10;
    id v13 = v7;
    id v14 = v8;
    id v15 = v9;
    dispatch_async(v11, v12);
  }
}

void sub_100004840(void *a1)
{
  uint64_t v2 = *(void **)(a1[4] + 8);
  if (v2)
  {
    uint64_t v3 = a1[5];
    uint64_t v4 = a1[6];
    uint64_t v5 = a1[7];
    [v2 setHSModel:v3 fallbackModel:v4 error:v5];
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    id v7 = "-[HSModel scheduleCoreSpeechTask:minorVersion:downloadedModels:preinstalledModels:]_block_invoke";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s: delegate is nil", (uint8_t *)&v6, 0xCu);
  }
}

void sub_10000496C(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("CSVoiceTriggerRTModel");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_10002F9B8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    sub_100013FD4();
    sub_1000049C4();
  }
}

void sub_1000049C4()
{
  v1[0] = 0;
  if (!qword_10002F9C0)
  {
    v1[1] = _NSConcreteStackBlock;
    v1[2] = 3221225472;
    v1[3] = sub_100004AC0;
    v1[4] = &unk_100025138;
    v1[5] = v1;
    long long v2 = off_100025120;
    uint64_t v3 = 0;
    qword_10002F9C0 = _sl_dlopen();
  }
  v0 = (void *)v1[0];
  if (!qword_10002F9C0)
  {
    v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t sub_100004AC0()
{
  uint64_t result = _sl_dlopen();
  qword_10002F9C0 = result;
  return result;
}

Class sub_100004B34(uint64_t a1)
{
  sub_1000049C4();
  Class result = objc_getClass("CSCoreSpeechServices");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_10002F9C8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (iAUPServer *)sub_100013FFC();
    return (Class)[(iAUPServer *)v3 initInstanceWithByteEscape:v5];
  }
  return result;
}

void sub_1000074BC(id *a1)
{
  if (a1[4]) {
    long long v2 = "valid";
  }
  else {
    long long v2 = "nil";
  }
  if (a1[5]) {
    uint64_t v3 = "valid";
  }
  else {
    uint64_t v3 = "nil";
  }
  NSLog(@"%s(): newModel=%s fallbackModel=%s error=%@\n", "-[iAUPServer setHSModel:fallbackModel:error:]_block_invoke", v2, v3, a1[6]);
  SEL v4 = a1[7];
  if (v4[4] != 5)
  {
    NSLog(@"[HS Callback] Invalid State=%s\n", objc_msgSend(v4, "serverStateString:"));
    goto LABEL_53;
  }
  if (a1[6]) {
    goto LABEL_9;
  }
  id v5 = a1[4];
  BOOL v6 = v5
    && [v5 modelData]
    && [a1[4] modelHash]
    && [a1[4] modelLocale] != 0;
  id v7 = a1[5];
  BOOL v8 = v7 && [v7 modelHash] && objc_msgSend(a1[5], "modelLocale") != 0;
  BOOL v34 = v8;
  BOOL v32 = v6;
  if (v6)
  {
    id v9 = objc_msgSend(objc_msgSend(a1[4], "modelHash"), "lengthOfBytesUsingEncoding:", 1);
    id v10 = objc_msgSend(objc_msgSend(a1[4], "modelLocale"), "lengthOfBytesUsingEncoding:", 1);
    id v33 = objc_msgSend(objc_msgSend(a1[4], "modelData"), "length");
    *((void *)a1[7] + 4) = -[FirmwareBundle initWithData:hashData:signatureData:certData:]([FirmwareBundle alloc], "initWithData:hashData:signatureData:certData:", [a1[4] modelData], objc_msgSend(a1[4], "digest"), objc_msgSend(a1[4], "signature"), objc_msgSend(a1[4], "certificate"));
    v11 = (void *)*((void *)a1[7] + 4);
    if (!v11)
    {
      NSLog(@"[HS Callback] Failed to create firmware bundle\n", v30);
      goto LABEL_9;
    }
    size_t v35 = (size_t)v10;
    size_t v36 = (size_t)v9;
    uint64_t v12 = (v9 + v10 + 4);
    if ([v11 firmwareImage]) {
      id v13 = "valid";
    }
    else {
      id v13 = "nil";
    }
    v31 = v13;
    id v14 = [*((id *)a1[7] + 4) firmwareImageSize];
    if ([*((id *)a1[7] + 4) hash]) {
      id v15 = "valid";
    }
    else {
      id v15 = "nil";
    }
    if ([*((id *)a1[7] + 4) signature]) {
      v16 = "valid";
    }
    else {
      v16 = "nil";
    }
    if ([*((id *)a1[7] + 4) certificate]) {
      id v17 = "valid";
    }
    else {
      id v17 = "nil";
    }
    NSLog(@"FimrwareBundle created [image=%s imageSize=%d hash=%s signature=%s cert=%s productID=%d baseAddress=%d]\n", v31, v14, v15, v16, v17, [*((id *)a1[7] + 4) productIDCode], objc_msgSend(*((id *)a1[7] + 4), "firmwareImageBaseAddress"));
    if (!v34) {
      goto LABEL_35;
    }
  }
  else
  {
    size_t v35 = 0;
    size_t v36 = 0;
    id v33 = 0;
    uint64_t v12 = 2;
    if (!v8)
    {
LABEL_35:
      id v18 = 0;
      id v19 = 0;
      id v20 = 0;
      goto LABEL_38;
    }
  }
  id v18 = objc_msgSend(objc_msgSend(a1[5], "modelHash"), "lengthOfBytesUsingEncoding:", 1);
  id v19 = objc_msgSend(objc_msgSend(a1[5], "modelLocale"), "lengthOfBytesUsingEncoding:", 1);
  id v20 = objc_msgSend(objc_msgSend(a1[5], "modelData"), "length");
  uint64_t v12 = (v18 + v19 + v12 + 2);
LABEL_38:
  if ([a1[4] modelData]) {
    v21 = "valid";
  }
  else {
    v21 = "nil";
  }
  NSLog(@"%s(): newModel=[data[%lu]=%s locale[%lu]=%@ hash[%lu]=%@]\n", "-[iAUPServer setHSModel:fallbackModel:error:]_block_invoke", v33, v21, v35, [a1[4] modelLocale], v36, objc_msgSend(a1[4], "modelHash"));
  if ([a1[5] modelData]) {
    v22 = "valid";
  }
  else {
    v22 = "nil";
  }
  NSLog(@"%s(): fbModel=[data[%lu]=%s locale[%lu]=%@ hash[%lu]=%@]\n", "-[iAUPServer setHSModel:fallbackModel:error:]_block_invoke", v20, v22, v19, [a1[5] modelLocale], v18, objc_msgSend(a1[5], "modelHash"));
  NSLog(@"%s(): returnPayloadSize=%d\n", "-[iAUPServer setHSModel:fallbackModel:error:]_block_invoke", v12);
  v23 = malloc_type_calloc(v12, 1uLL, 0x97229F3EuLL);
  if (!v23)
  {
    NSLog(@"[HS Callback] Error allocating return payload buf size=%d\n", v12);
LABEL_9:
    [a1[7] setServerState:3];
    __int16 v37 = 0;
    objc_msgSend(a1[7], "sendCommand:payload:payload_length:", 99, &v37, 2);
    objc_msgSend(*((id *)a1[7] + 1), "handleSessionError:message:", objc_msgSend(a1[6], "code"), @"Failed to retrieve HS Asset Info");
    goto LABEL_53;
  }
  v24 = v23;
  unsigned char *v23 = 0;
  unsigned int v25 = 2;
  if (v34) {
    char v26 = 2;
  }
  else {
    char v26 = 0;
  }
  v23[1] = v26 | v32;
  if (v32)
  {
    v23[2] = v35;
    memcpy(v23 + 3, objc_msgSend(objc_msgSend(a1[4], "modelLocale"), "cStringUsingEncoding:", 1), v35);
    v24[(v35 + 3)] = v36;
    memcpy(&v24[(v35 + 4)], objc_msgSend(objc_msgSend(a1[4], "modelHash"), "cStringUsingEncoding:", 1), v36);
    unsigned int v25 = v35 + 4 + v36;
  }
  if (v34)
  {
    uint64_t v27 = v25 + 1;
    v24[v25] = (_BYTE)v19;
    memcpy(&v24[v27], objc_msgSend(objc_msgSend(a1[5], "modelLocale"), "cStringUsingEncoding:", 1), (size_t)v19);
    int v28 = v27 + v19;
    uint64_t v29 = (v27 + v19 + 1);
    v24[v28] = (_BYTE)v18;
    memcpy(&v24[v29], objc_msgSend(objc_msgSend(a1[5], "modelHash"), "cStringUsingEncoding:", 1), (size_t)v18);
    LOWORD(v25) = v29 + (_WORD)v18;
  }
  objc_msgSend(a1[7], "sendCommand:payload:payload_length:", 97, v24, (unsigned __int16)v25);
  [a1[7] setServerState:6];
  free(v24);
LABEL_53:

  *((void *)a1[7] + 5) = 0;
}

void sub_100007D70(id a1)
{
  qword_10002F9D0 = objc_alloc_init(AUDeveloperSettingsDatabase);
}

void sub_100009154(id a1)
{
}

void sub_100009570(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100009688(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100009818(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_10000A12C(uint64_t a1, void *a2)
{
  id result = [a2 attributes];
  if (result)
  {
    SEL v4 = result;
    id result = [result objectForKey:@"FirmwareVersionMajor"];
    if (result)
    {
      id v5 = [result unsignedLongLongValue];
      id result = [v4 objectForKey:@"FirmwareVersionMinor"];
      if (result)
      {
        id v6 = [result unsignedLongLongValue];
        id result = [v4 objectForKey:@"FirmwareVersionRelease"];
        if (result)
        {
          id v7 = [result unsignedLongLongValue];
          id result = [v4 objectForKey:@"FormatVersion"];
          if (result)
          {
            id v8 = [result unsignedLongLongValue];
            [*(id *)(a1 + 32) log:5, @"%s %@", "-[EAFirmwareUpdater queryPredicate]_block_invoke", objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"Applying predicate: ((majorVersion > %llu) ||                                ((majorVersion == %llu) && ((minorVersion > %llu) || ((minorVersion == %llu) && (releaseVersion > %llu))))) &&                                (formatVersion == %d))", *(void *)(*(void *)(a1 + 32) + 152), *(void *)(*(void *)(a1 + 32) + 152), *(void *)(*(void *)(a1 + 32) + 160), *(void *)(*(void *)(a1 + 32) + 160), *(void *)(*(void *)(a1 + 32) + 168), 1 format]);
            id result = 0;
            if ((unint64_t)v8 <= *(void *)(a1 + 40))
            {
              id v9 = *(void **)(a1 + 32);
              id v10 = (id)v9[19];
              if (v5 > v10) {
                return (id)1;
              }
              if (v5 == v10)
              {
                id v11 = (id)v9[20];
                if (v6 > v11 || v6 == v11 && (unint64_t)v7 > v9[21]) {
                  return (id)1;
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

NSError *sub_10000A648(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10 = [objc_alloc((Class)NSString) initWithFormat:a3 arguments:&a9];
  id v11 = +[NSMutableDictionary dictionaryWithCapacity:1];
  if (v10)
  {
    NSLog(@"%@", v10);
    [(NSMutableDictionary *)v11 setObject:v10 forKey:NSLocalizedDescriptionKey];
  }
  return +[NSError errorWithDomain:@"com.apple.MobileAccessoryUpdater.EAFirmwareUpdater" code:a2 userInfo:v11];
}

id sub_10000B870(uint64_t a1)
{
  return [*(id *)(a1 + 32) closeSession];
}

id sub_10000BCA8(uint64_t a1)
{
  [*(id *)(a1 + 32) log:5, @"%s %@", "-[EAFirmwareUpdater personalizationResponse:error:]_block_invoke", objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"(%@): personalizationResponse Error from FUD = %@, responseData = %@", objc_msgSend(*(id *)(a1 + 32), "protocolString"), *(void *)(a1 + 40), *(void *)(a1 + 48)) format];
  [*(id *)(a1 + 32) closeSession];
  CFStringRef v3 = @"Event";
  CFStringRef v4 = @"com.apple.fud.updateFailed";
  return objc_msgSend(*(id *)(a1 + 32), "updateComplete:error:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v4, &v3, 1), *(void *)(a1 + 40));
}

id sub_10000BEA4(uint64_t a1)
{
  return [*(id *)(a1 + 32) closeSession];
}

unsigned char *sub_10000C2D0(uint64_t a1)
{
  long long v2 = [*(id *)(a1 + 32) openSession];
  if (v2)
  {
    CFStringRef v4 = v2;
    goto LABEL_8;
  }
  id result = *(unsigned char **)(a1 + 32);
  if (!result[466])
  {
    id result = objc_msgSend(objc_msgSend(result, "protocolString"), "isEqualToString:", objc_msgSend(*(id *)(a1 + 32), "appProtocol"));
    if (result)
    {
      if ([*(id *)(a1 + 32) skipDFUMode]) {
        return [*(id *)(a1 + 32) log:5, @"%s %@", "-[EAFirmwareUpdater applyFirmware:progress:update:personalization:]_block_invoke", objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"Skipping DFU mode as requested for %@", objc_msgSend(*(id *)(a1 + 32), "protocolString")) format];
      }
      [*(id *)(a1 + 32) startReconnectTimer:1];
      BYTE4(v5) = -65;
      LODWORD(v5) = 1073807486;
      [*(id *)(a1 + 32) log:5, @"%s %@", "-[EAFirmwareUpdater applyFirmware:progress:update:personalization:]_block_invoke", objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"Sending COMMAND_SetBootloaderEntry to %@", objc_msgSend(*(id *)(a1 + 32), "protocolString")), v5 format];
      id result = objc_msgSend(*(id *)(a1 + 32), "writeData:", +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v5, 5));
      if (result)
      {
        CFStringRef v4 = result;
        [*(id *)(a1 + 32) log:5, @"%s %@", "-[EAFirmwareUpdater applyFirmware:progress:update:personalization:]_block_invoke", objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"Error writing data to %@ NSError=%@", objc_msgSend(*(id *)(a1 + 32), "protocolString"), result) format];
        [*(id *)(a1 + 32) stopReconnectTimer];
LABEL_8:
        CFStringRef v6 = @"Event";
        CFStringRef v7 = @"com.apple.fud.updateFailed";
        return objc_msgSend(*(id *)(a1 + 32), "updateComplete:error:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1), v4);
      }
    }
  }
  return result;
}

id sub_10000D15C(uint64_t a1)
{
  return [*(id *)(a1 + 32) closeSession];
}

void sub_10000D428(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_10000D440(uint64_t a1)
{
  return [*(id *)(a1 + 32) closeSession];
}

id sub_10000D604(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleInputData];
}

id sub_10000D60C(uint64_t a1)
{
  return [*(id *)(a1 + 32) flushOutput];
}

void sub_10000DC84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_10000DCA0(uint64_t a1, uint64_t a2)
{
}

void sub_10000DCB0(uint64_t a1)
{
}

id sub_10000DCBC(uint64_t a1)
{
  [*(id *)(a1 + 32) setAccessory:*(void *)(a1 + 40)];
  long long v2 = *(void **)(a1 + 32);
  return [v2 openSession];
}

void *sub_10000DCF8(void *result)
{
  if (*(unsigned char *)(result[4] + 448))
  {
    uint64_t v1 = result;
    CFStringRef v2 = @"Event";
    CFStringRef v3 = @"com.apple.fud.updateCompleted";
    *(void *)(*(void *)(result[5] + 8) + 40) = +[NSDictionary dictionaryWithObjects:&v3 forKeys:&v2 count:1];
    return [(id)v1[4] updateComplete:*(void *)(*(void *)(v1[5] + 8) + 40) error:0];
  }
  return result;
}

void sub_10000DFAC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_10000DFC0(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) connectionID];
  id v3 = objc_msgSend(objc_msgSend(*(id *)(a1 + 40), "accessory"), "connectionID");
  CFStringRef v4 = *(void **)(a1 + 40);
  id v5 = [*(id *)(a1 + 32) connectionID];
  id v6 = [*(id *)(a1 + 40) accessory];
  if (v2 == v3)
  {
    uint64_t v20 = (uint64_t)v5;
    [v4 log:5 format:@"disconnection for acc connectionID %u matches current accessory %@"];
    [*(id *)(a1 + 40) setAccessory:0];
    CFStringRef v7 = *(unsigned int **)(a1 + 40);
    uint64_t v8 = v7[113];
    if (v8 == 3)
    {
      v7[113] = 0;
      [*(id *)(a1 + 40) log:5, @"Accessory did not reconnect after staging complete %@", objc_msgSend(*(id *)(a1 + 32), "protocolStrings") format];
      CFStringRef v21 = @"Event";
      CFStringRef v22 = @"com.apple.fud.updateCompleted";
      id v18 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
      id v17 = *(void **)(a1 + 40);
      v16 = 0;
    }
    else
    {
      if (v8)
      {
        [v7 log:5, @"Waiting for acc to reconnect in mode %d - %@", v8, objc_msgSend(*(id *)(a1 + 32), "protocolStrings") format];
        return [*(id *)(*(void *)(a1 + 40) + 432) accessoryDisconnected];
      }
      CFStringRef v23 = @"Event";
      CFStringRef v24 = @"com.apple.fud.updateInterrupted";
      id v9 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
      id v10 = *(void **)(a1 + 40);
      v16 = sub_10000A648(0, 20, @"Device unexpectedly disconnected", v11, v12, v13, v14, v15, v20);
      id v17 = v10;
      id v18 = v9;
    }
    [v17 updateComplete:v18 error:v16];
  }
  else
  {
    [v4 log:5, @"disconnection for acc connectionID %u does not apply, currently updating %@", v5, v6 format];
  }
  return [*(id *)(*(void *)(a1 + 40) + 432) accessoryDisconnected];
}

uint64_t AUSandboxPlatformInitWithBundleIdentifier(NSObject *a1)
{
  if (a1) {
    uint64_t v1 = a1;
  }
  else {
    uint64_t v1 = &_os_log_default;
  }
  bzero(v3, 0x400uLL);
  if ((_set_user_dir_suffix() & 1) == 0)
  {
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
      sub_1000142C0();
    }
    return 1;
  }
  if (!confstr(65537, v3, 0x400uLL))
  {
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
      sub_100014240();
    }
    return 1;
  }
  return 0;
}

void sub_10000E58C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

const char *AUDeveloperSettingsAccessoryFusingTypeToString(unint64_t a1)
{
  if (a1 > 3) {
    return "unrecognized";
  }
  else {
    return off_100025410[a1];
  }
}

uint64_t AUDeveloperSettingsAccessoryFusingStringToType(void *a1)
{
  if (objc_msgSend(a1, "isEqualToString:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Dev")))return 0; {
  if (objc_msgSend(a1, "isEqualToString:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Prod")))return 1;
  }
  if (objc_msgSend(a1, "isEqualToString:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Unfused")))return 2; {
  if (objc_msgSend(a1, "isEqualToString:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Pending")))return 3;
  }
  return 4;
}

const char *AUDeveloperSettingsURLTypeToString(unint64_t a1)
{
  if (a1 > 6) {
    return "unrecognized";
  }
  else {
    return off_100025430[a1];
  }
}

uint64_t AUDeveloperSettingsURLStringToType(void *a1)
{
  if (objc_msgSend(a1, "isEqualToString:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Livability")))return 0; {
  if (objc_msgSend(a1, "isEqualToString:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Internal Seed")))return 1;
  }
  if (objc_msgSend(a1, "isEqualToString:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Customer")))return 2; {
  if (objc_msgSend(a1, "isEqualToString:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Public Seed")))return 3;
  }
  if (objc_msgSend(a1, "isEqualToString:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Basejumper")))return 4; {
  if (objc_msgSend(a1, "isEqualToString:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Custom Basejumper")))return 5;
  }
  if (objc_msgSend(a1, "isEqualToString:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Mesu Staging")))return 6; {
  return 7;
  }
}

id getInfoForAccessory(uint64_t a1)
{
  id v2 = objc_msgSend(+[AUDeveloperSettingsDatabase sharedDatabase](AUDeveloperSettingsDatabase, "sharedDatabase"), "accessoriesDictionary");
  return [v2 objectForKeyedSubscript:a1];
}

BOOL configuredToDefaultAssetLocationForAccessory(void *a1)
{
  BOOL v2 = (AUDeveloperSettingsAccessoryFusingStringToType([a1 objectForKeyedSubscript:@"fusing"]) & 5) != 0;
  return AUDeveloperSettingsURLStringToType([a1 objectForKeyedSubscript:@"assetLocation"]) == 2 * v2;
}

__CFString *getURLForAssetURLType(uint64_t a1)
{
  id result = 0;
  switch(a1)
  {
    case 0:
      id v3 = kAUAssetLocationTypeMobileAssetServerLivabilityStr;
      goto LABEL_6;
    case 2:
      id v3 = &kAUAssetLocationTypeMobileAssetServerMesuStr;
      goto LABEL_6;
    case 4:
    case 5:
      id v3 = kAUAssetLocationTypeMobileAssetServerBasejumperStr;
      goto LABEL_6;
    case 6:
      id v3 = kAUAssetLocationTypeMobileAssetServerMesuStagingStr;
LABEL_6:
      id result = *v3;
      break;
    default:
      return result;
  }
  return result;
}

id cleanupPersonalizedUpdateAvailable(uint64_t a1)
{
  id v2 = objc_msgSend(objc_msgSend(objc_msgSend(+[AUDeveloperSettingsDatabase sharedDatabase](AUDeveloperSettingsDatabase, "sharedDatabase"), "accessoriesDictionary"), "objectForKey:", a1), "mutableCopy");
  [v2 setObject:0 forKeyedSubscript:@"downloadedVersion"];
  [v2 setObject:0 forKeyedSubscript:@"personalizationRequired"];
  id v3 = +[AUDeveloperSettingsDatabase sharedDatabase];
  CFStringRef v4 = +[NSDictionary dictionaryWithDictionary:v2];
  return [v3 addAccessoryWithSerialNumber:a1 info:v4];
}

NSArray *findPartnerSerialNumbersInDatabase(uint64_t a1)
{
  id v2 = +[NSMutableArray array];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000FC9C;
  v4[3] = &unk_1000253F0;
  v4[4] = a1;
  v4[5] = v2;
  objc_msgSend(objc_msgSend(+[AUDeveloperSettingsDatabase sharedDatabase](AUDeveloperSettingsDatabase, "sharedDatabase"), "accessoriesDictionary"), "enumerateKeysAndObjectsUsingBlock:", v4);
  return +[NSArray arrayWithArray:v2];
}

id sub_10000FC9C(uint64_t a1, void *a2, void *a3)
{
  id v5 = [a3 objectForKeyedSubscript:@"partnerSerialNumbers"];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id result = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (result)
  {
    id v7 = result;
    uint64_t v8 = *(void *)v11;
    while (2)
    {
      id v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        if ([*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) isEqualToString:*(void *)(a1 + 32)]&& (objc_msgSend(a2, "isEqualToString:", *(void *)(a1 + 32)) & 1) == 0)
        {
          return [*(id *)(a1 + 40) addObject:a2];
        }
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id result = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      id v7 = result;
      if (result) {
        continue;
      }
      break;
    }
  }
  return result;
}

void *findPartnerSerialNumberForAccessory(void *a1)
{
  PartnerSerialNumbersInDatabase = (NSArray *)[a1 partnerSerialNumbers];
  if (![(NSArray *)PartnerSerialNumbersInDatabase count]) {
    PartnerSerialNumbersInDatabase = findPartnerSerialNumbersInDatabase((uint64_t)[a1 serialNumber]);
  }
  id v3 = [a1 hwFusingType];
  id v4 = +[AUDeveloperSettingsDatabase sharedDatabase];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(NSArray *)PartnerSerialNumbersInDatabase countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (!v5) {
    return 0;
  }
  id v6 = v5;
  uint64_t v7 = *(void *)v14;
LABEL_5:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v14 != v7) {
      objc_enumerationMutation(PartnerSerialNumbersInDatabase);
    }
    id v9 = *(void **)(*((void *)&v13 + 1) + 8 * v8);
    id v10 = objc_msgSend(objc_msgSend(objc_msgSend(v4, "accessoriesDictionary"), "objectForKey:", v9), "objectForKey:", @"fusing");
    if (v10)
    {
      long long v11 = v10;
      if ((objc_msgSend(v9, "isEqualToString:", objc_msgSend(a1, "serialNumber")) & 1) == 0
        && (![v11 caseInsensitiveCompare:v3]
         || ([v3 isEqualToString:@"prod"] & 1) == 0
         && [v11 caseInsensitiveCompare:@"prod"]))
      {
        return v9;
      }
    }
    if (v6 == (id)++v8)
    {
      id v6 = [(NSArray *)PartnerSerialNumbersInDatabase countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        goto LABEL_5;
      }
      return 0;
    }
  }
}

id getAccessoryDatabaseKeyForAccessoryID(void *a1)
{
  if (!objc_msgSend(+[UARPSupportedAccessory findByAppleModelNumber:](UARPSupportedAccessory, "findByAppleModelNumber:", objc_msgSend(a1, "modelNumber")), "supportsInternalSettings"))return 0; {
  id result = [a1 serialNumber];
  }
  if (result)
  {
    id v3 = +[AUDeveloperSettingsDatabase sharedDatabase];
    if (objc_msgSend(objc_msgSend(v3, "accessoriesDictionary"), "objectForKey:", objc_msgSend(a1, "serialNumber")))
    {
      return [a1 serialNumber];
    }
    else
    {
      PartnerSerialNumberForAccessory = findPartnerSerialNumberForAccessory(a1);
      if (objc_msgSend(objc_msgSend(v3, "accessoriesDictionary"), "objectForKey:", PartnerSerialNumberForAccessory)) {
        return PartnerSerialNumberForAccessory;
      }
      else {
        return 0;
      }
    }
  }
  return result;
}

id isOTAUpdateDisabledForAccessoryID(void *a1)
{
  id AccessoryDatabaseKeyForAccessoryID = getAccessoryDatabaseKeyForAccessoryID(a1);
  if (!AccessoryDatabaseKeyForAccessoryID) {
    return 0;
  }
  id v2 = objc_msgSend(objc_msgSend(+[AUDeveloperSettingsDatabase sharedDatabase](AUDeveloperSettingsDatabase, "sharedDatabase"), "accessoriesDictionary"), "objectForKey:", AccessoryDatabaseKeyForAccessoryID);
  if (!v2) {
    return 0;
  }
  id v3 = [v2 objectForKeyedSubscript:@"isOTADisabled"];
  return [v3 BOOLValue];
}

id dropboxFileUpdateForAccessoryID(void *a1, uint64_t a2)
{
  id result = getAccessoryDatabaseKeyForAccessoryID(a1);
  if (result)
  {
    id v4 = result;
    id v5 = +[AUDeveloperSettingsDatabase sharedDatabase];
    id result = objc_msgSend(objc_msgSend(v5, "accessoriesDictionary"), "objectForKey:", v4);
    if (result)
    {
      id v6 = +[NSMutableDictionary dictionaryWithDictionary:result];
      [(NSMutableDictionary *)v6 setObject:a2 forKeyedSubscript:@"dropboxVersion"];
      uint64_t v7 = +[NSDictionary dictionaryWithDictionary:v6];
      return [v5 addAccessoryWithSerialNumber:v4 info:v7];
    }
  }
  return result;
}

id updateReachabilityForAccessoryID(void *a1, uint64_t a2)
{
  id v4 = +[AUDeveloperSettingsDatabase sharedDatabase];
  if (a1)
  {
    id result = getAccessoryDatabaseKeyForAccessoryID(a1);
    if (result)
    {
      id v6 = result;
      id v7 = +[AUDeveloperSettingsDatabase sharedDatabase];
      id result = objc_msgSend(objc_msgSend(v7, "accessoriesDictionary"), "objectForKey:", v6);
      if (result)
      {
        uint64_t v8 = +[NSMutableDictionary dictionaryWithDictionary:result];
        [(NSMutableDictionary *)v8 setObject:+[NSNumber numberWithBool:a2] forKeyedSubscript:@"accessoryReachable"];
        id v9 = +[NSDictionary dictionaryWithDictionary:v8];
        return [v7 addAccessoryWithSerialNumber:v6 info:v9];
      }
    }
  }
  else
  {
    id v10 = v4;
    id v11 = objc_msgSend(objc_msgSend(v4, "accessoriesDictionary"), "allKeys");
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id result = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (result)
    {
      id v12 = result;
      uint64_t v13 = *(void *)v19;
      do
      {
        long long v14 = 0;
        do
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v11);
          }
          uint64_t v15 = *(void *)(*((void *)&v18 + 1) + 8 * (void)v14);
          id v16 = objc_msgSend(objc_msgSend(v10, "accessoriesDictionary"), "objectForKey:", v15);
          if (v16)
          {
            id v17 = +[NSMutableDictionary dictionaryWithDictionary:v16];
            [(NSMutableDictionary *)v17 setObject:+[NSNumber numberWithBool:a2] forKeyedSubscript:@"accessoryReachable"];
            objc_msgSend(v10, "addAccessoryWithSerialNumber:info:", v15, +[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", v17));
          }
          long long v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        id result = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
        id v12 = result;
      }
      while (result);
    }
  }
  return result;
}

id copyPlistDeviceEntryFromDeviceClass(void *a1)
{
  id v2 = +[NSBundle mainBundle];
  if (v2)
  {
    id v3 = v2;
    id v4 = (const void *)MGCopyAnswer();
    if (![(id)(id)CFMakeCollectable(v4) BOOLValue]) {
      goto LABEL_11;
    }
    if ([a1 containsString:@"com.apple.UARP."]) {
      CFStringRef v5 = @"/AppleInternal/usr/local/misc/SupportedAccessories-iAUPLegacyAudio.plist";
    }
    else {
      CFStringRef v5 = @"/AppleInternal/usr/local/misc/SupportedAccessories-iAUP.plist";
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v11 = v5;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Use Alternate Accessory List from %@", buf, 0xCu);
    }
    id v6 = [+[NSDictionary dictionaryWithContentsOfURL:](NSDictionary, "dictionaryWithContentsOfURL:", +[NSURL fileURLWithPath:v5]) objectForKeyedSubscript:@"MobileAccessoryUpdaterProperties"];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v11 = v5;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Loaded Alternate Accessory List from %@", buf, 0xCu);
    }
    if (!v6)
    {
LABEL_11:
      id v6 = [(NSBundle *)v3 objectForInfoDictionaryKey:@"MobileAccessoryUpdaterProperties"];
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Loaded Native iAUP Accessory List", buf, 2u);
      }
    }
    id v2 = (NSBundle *)[v6 objectForKey:@"MatchingDevices"];
    if (v2)
    {
      id v7 = [(NSBundle *)v2 filteredArrayUsingPredicate:+[NSPredicate predicateWithFormat:@"DeviceClass = %@", a1]];
      if (v7 && (uint64_t v8 = v7, [v7 count]))
      {
        id v2 = (NSBundle *)[v8 objectAtIndexedSubscript:0];
      }
      else
      {
        NSLog(@"huh? deviceClass %@ not found", a1);
        id v2 = 0;
      }
    }
  }
  return [(NSBundle *)v2 copy];
}

id isSkipDFUModeInBundleInfoPlist(id result)
{
  if (result)
  {
    id v1 = [result objectForKey:@"skipDFUMode"];
    return [v1 BOOLValue];
  }
  return result;
}

id isByteEscapingDisabledInBundleInfoPlist(id result)
{
  if (result)
  {
    id v1 = [result objectForKey:@"disableByteEscaping"];
    return [v1 BOOLValue];
  }
  return result;
}

id isSkipReconnectBundleInfoPlist(id result)
{
  if (result)
  {
    id v1 = [result objectForKey:@"skipReconnect"];
    return [v1 BOOLValue];
  }
  return result;
}

id isSkipMinimumFirmwareVersionCheckInOptions(id result)
{
  if (result)
  {
    id v1 = [result objectForKey:@"skipMinimumFirmwareVersionCheck"];
    return [v1 BOOLValue];
  }
  return result;
}

void sub_100011880(id a1)
{
  id v1 = "$SIDEBUILD_PARENT_TRAIN";
  if (!-[NSString isEqualToString:](+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s", "$SIDEBUILD_PARENT_TRAIN"), "isEqualToString:", &stru_1000294D0)&& !-[NSString isEqualToString:](+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s", "$SIDEBUILD_PARENT_TRAIN"), "isEqualToString:", @"$SIDEBUILD_PARENT_TRAIN")|| (id v1 = "CrystalC", !-[NSString isEqualToString:](+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s", "CrystalC"), "isEqualToString:",
           &stru_1000294D0))
    && ![+[NSString stringWithFormat:@"%s", "CrystalC"] isEqualToString:@"$RC_RELEASE"])
  {
    qword_10002F9E8 = (uint64_t)v1;
  }
}

int64_t sub_100011FE0(id a1, NSURL *a2, NSURL *a3)
{
  uint64_t v6 = 0;
  [(NSURL *)a2 getResourceValue:&v6 forKey:NSURLLocalizedNameKey error:0];
  id v5 = 0;
  [(NSURL *)a3 getResourceValue:&v5 forKey:NSURLLocalizedNameKey error:0];
  return (int64_t)[v5 compare:v6];
}

id sub_100012600(uint64_t a1, void *a2)
{
  id v4 = +[NSMutableDictionary dictionary];
  uint64_t v5 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v5 + 72))
  {
    objc_msgSend(v4, "setObject:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1), @"SilentUpdateNoUI");
    uint64_t v5 = *(void *)(a1 + 32);
  }
  if ([*(id *)(v5 + 16) currentFirmwareVersionOnAcc]) {
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "currentFirmwareVersionOnAcc"), @"existingFWVersionOnAccessory");
  }
  if (a2)
  {
    CFStringRef v6 = (const __CFString *)objc_msgSend(objc_msgSend(a2, "userInfo"), "objectForKey:", NSLocalizedDescriptionKey);
    if (v6) {
      CFStringRef v7 = v6;
    }
    else {
      CFStringRef v7 = @"GeneralError";
    }
    [v4 setObject:v7 forKey:@"error"];
    [v4 setObject:@"FailureStateFind" forKey:@"failureState"];
  }
  else if ([*(id *)(*(void *)(a1 + 32) + 16) assetAvailable])
  {
    if ([*(id *)(*(void *)(a1 + 32) + 16) firmwareVersionAvailable]) {
      objc_msgSend(v4, "setObject:forKey:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "firmwareVersionAvailable"), @"newFWVersion");
    }
    if (*(unsigned char *)(a1 + 48))
    {
      uint64_t v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@%@", @"/var/run/fud/seed/", [*(id *)(*(void *)(a1 + 32) + 16) modelNumber]);
      [*(id *)(*(void *)(a1 + 32) + 8) log:7, @"%s: Consent Required for updating %@", "-[EAAccessoryUpdater findFirmwareWithOptions:remote:]_block_invoke", *(void *)(*(void *)(a1 + 32) + 24) format];
      objc_msgSend(v4, "setValue:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0), @"SilentUpdateNoUI");
      objc_msgSend(v4, "setValue:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1), @"SeedConsentRequired");
      [v4 setValue:*(void *)(a1 + 40) forKey:@"AccessoryName"];
      [v4 setValue:v8 forKey:@"SeedUpdateDeclinedPath"];
      if ([*(id *)(*(void *)(a1 + 32) + 16) serialNumber]) {
        objc_msgSend(v4, "setValue:forKey:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "serialNumber"), @"SerialNumber");
      }
    }
  }
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(void **)(v9 + 8);
  id v11 = [*(id *)(v9 + 16) assetAvailable];
  if ([*(id *)(*(void *)(a1 + 32) + 16) assetAvailable]) {
    uint64_t v12 = [*(id *)(*(void *)(a1 + 32) + 16) assetDownloaded] ^ 1;
  }
  else {
    uint64_t v12 = 0;
  }
  return [v10 didFind:a2 == 0 info:v4 updateAvailable:v11 needsDownload:v12 error:a2];
}

void sub_1000129E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100012A00(uint64_t a1, uint64_t a2)
{
}

void sub_100012A10(uint64_t a1)
{
}

id sub_100012A1C(uint64_t a1, void *a2)
{
  if (a2)
  {
    CFStringRef v4 = (const __CFString *)objc_msgSend(objc_msgSend(a2, "userInfo"), "objectForKey:", NSLocalizedDescriptionKey);
    v9[0] = @"failureState";
    v9[1] = @"error";
    CFStringRef v5 = @"GeneralError";
    if (v4) {
      CFStringRef v5 = v4;
    }
    v10[0] = @"FailureStateDownload";
    v10[1] = v5;
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
    if (*(unsigned char *)(a1 + 48)) {
      [*(id *)(*(void *)(a1 + 32) + 16) purgeAsset];
    }
  }
  else if (*(unsigned char *)(*(void *)(a1 + 32) + 72))
  {
    CFStringRef v7 = @"SilentUpdateNoUI";
    uint64_t v8 = +[NSNumber numberWithBool:1];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  }
  return [*(id *)(*(void *)(a1 + 32) + 8) didDownload:a2 == 0 info:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) error:a2];
}

id sub_100012DB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ([*(id *)(a1 + 32) consentRequired]) {
    [*(id *)(*(void *)(a1 + 32) + 16) purgeAsset];
  }
  CFStringRef v6 = *(void **)(*(void *)(a1 + 32) + 8);
  return [v6 didApply:a3 == 0 info:a2 error:a3];
}

id sub_100012E24(uint64_t a1, double a2)
{
  id result = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "log:format:", 7, @"Update Progress: %f", *(void *)&a2);
  uint64_t v5 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v5 + 48) || !*(unsigned char *)(v5 + 72))
  {
    CFStringRef v6 = *(void **)(v5 + 8);
    return [v6 progress:a2];
  }
  return result;
}

id sub_100012EB4(uint64_t a1, void *a2)
{
  [*(id *)(*(void *)(a1 + 32) + 8) log:7, @"Update info: %@", a2 format];
  id v4 = [a2 objectForKey:@"Event"];
  CFStringRef v5 = @"com.apple.fud.updateStarted";
  if (([v4 isEqualToString:@"com.apple.fud.updateStarted"] & 1) != 0
    || (CFStringRef v5 = @"com.apple.fud.updateResumed",
        id result = [v4 isEqualToString:@"com.apple.fud.updateResumed"],
        result))
  {
    CFStringRef v7 = *(void **)(*(void *)(a1 + 32) + 8);
    return [v7 reportAnalytics:v5 info:a2];
  }
  return result;
}

id sub_100012F78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return [*(id *)(*(void *)(a1 + 32) + 8) log:3, @"%s: Error:%@ to get create FudPersonalizationRequest for %@", "-[EAAccessoryUpdater applyFirmwareWithOptions:]_block_invoke_4", *(void *)(*(void *)(a1 + 32) + 24) format];
  }
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 8);
  if (!a2) {
    return [v4 log:3, @"%s: Error: FudPersonalizationRequest = NULL for %@", "-[EAAccessoryUpdater applyFirmwareWithOptions:]_block_invoke_4", *(void *)(v3 + 24) format];
  }
  return [v4 personalizationRequest:a2];
}

void sub_100013218(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

id sub_100013230(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  id result = objc_msgSend(*(id *)(a1 + 32), "isEqual:", +[NSURL URLWithString:](NSURL, "URLWithString:", a2));
  if (result)
  {
    id result = [*(id *)(*(void *)(a1 + 40) + 8) log:7, @"%s: Pointing to Seed Location for %@, need to prompt for Consent", "-[EAAccessoryUpdater consentRequired]_block_invoke", *(void *)(*(void *)(a1 + 40) + 24) format];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    *a3 = 1;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
  return result;
}

id generateSHA256HashForDataAtLocationAsData(uint64_t a1, uint64_t a2)
{
  return generateHashForDataAtLocationAsData(a1, 10, a2);
}

id generateHashForDataAtLocationAsData(uint64_t a1, int a2, uint64_t a3)
{
  CFStringRef v5 = +[NSFileHandle fileHandleForReadingFromURL:a1 error:a3];
  id result = 0;
  if (a2 && v5)
  {
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    CCDigestInit();
    do
    {
      id v8 = -[NSFileHandle uarpReadDataUpToLength:error:](v5, "uarpReadDataUpToLength:error:", 0x4000, a3, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26,
             v27,
             v28,
             v29,
             v30,
             v31,
             v32,
             v33,
             v34,
             v35,
             v36,
             v37,
             v38,
             v39,
             v40,
             (void)v41);
      [v8 bytes];
      [v8 length];
      CCDigestUpdate();
      unint64_t v9 = (unint64_t)[v8 length];
    }
    while (v9 >> 14);
    uint64_t OutputSize = CCDigestGetOutputSize();
    id v11 = (char *)&v12 - ((__chkstk_darwin() + 15) & 0xFFFFFFFFFFFFFFF0);
    CCDigestFinal();
    if ([(NSFileHandle *)v5 uarpCloseAndReturnError:a3]) {
      return [objc_alloc((Class)NSData) initWithBytes:v11 length:OutputSize];
    }
    else {
      return 0;
    }
  }
  return result;
}

id generateSHA256HashForDataAtLocation(uint64_t a1, uint64_t a2)
{
  return generateHashForDataAtLocation(a1, 10, a2);
}

id generateHashForDataAtLocation(uint64_t a1, int a2, uint64_t a3)
{
  id HashForDataAtLocationAsData = generateHashForDataAtLocationAsData(a1, a2, a3);
  if (!HashForDataAtLocationAsData) {
    return 0;
  }
  id v4 = HashForDataAtLocationAsData;
  CFStringRef v5 = (unsigned __int8 *)[HashForDataAtLocationAsData bytes];
  id v6 = objc_alloc_init((Class)NSMutableString);
  if ([v4 length])
  {
    unint64_t v7 = 0;
    do
      objc_msgSend(v6, "appendFormat:", @"%02x", v5[v7++]);
    while (v7 < (unint64_t)[v4 length]);
  }
  return v6;
}

id generateBase64HashForDataAtLocation(uint64_t a1, int a2, uint64_t a3)
{
  id result = generateHashForDataAtLocationAsData(a1, a2, a3);
  if (result)
  {
    return [result base64EncodedStringWithOptions:0];
  }
  return result;
}

CFStringRef MapPreferenceSuiteToString(uint64_t a1)
{
  CFStringRef v1 = @"com.apple.accessoryupdaterd";
  if (a1) {
    CFStringRef v1 = 0;
  }
  if (a1 == 1) {
    return @"com.apple.AUDeveloperSettings";
  }
  else {
    return v1;
  }
}

void sub_100013C98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100013CB0(uint64_t a1, uint64_t a2)
{
}

void sub_100013CC0(uint64_t a1)
{
}

uint64_t sub_100013CCC(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 40) = a2;
  return result;
}

int main(int argc, const char **argv, const char **envp)
{
  return +[AUServiceManager startServiceInSandbox];
}

id sub_100013DD4(uint64_t a1)
{
  id result = [objc_allocWithZone(*(Class *)(a1 + 32)) init];
  qword_10002F9F0 = (uint64_t)result;
  return result;
}

void sub_100013E14(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000143D4((uint64_t)a2);
  }
}

uint64_t sub_100013FD4()
{
  uint64_t v0 = abort_report_np();
  return sub_100013FFC(v0);
}

uint64_t sub_100013FFC()
{
  uint64_t v0 = abort_report_np();
  return sub_100014024(v0);
}

void sub_100014024(uint64_t a1, NSObject *a2)
{
  int v2 = 136315650;
  uint64_t v3 = "-[AUDeveloperSettingsDatabase setAccessoriesDictionary:]";
  __int16 v4 = 2112;
  CFStringRef v5 = @"accessories";
  __int16 v6 = 2112;
  uint64_t v7 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%s: seting %@:%@", (uint8_t *)&v2, 0x20u);
}

void sub_1000140C0()
{
  v1[0] = 136315394;
  sub_1000085A0();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "%s: dictionary = %@", (uint8_t *)v1, 0x16u);
}

void sub_100014140()
{
  v1[0] = 136315394;
  sub_1000085A0();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s: received unknown object = %@", (uint8_t *)v1, 0x16u);
}

void sub_1000141C0()
{
  v1[0] = 136315394;
  sub_1000085A0();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "%s: dictionary = %@", (uint8_t *)v1, 0x16u);
}

void sub_100014240()
{
  __error();
  sub_10000E58C((void *)&_mh_execute_header, v0, v1, "failed to initialize temporary directory: %d", v2, v3, v4, v5, 0);
}

void sub_1000142C0()
{
  __error();
  sub_10000E58C((void *)&_mh_execute_header, v0, v1, "failed to set temporary directory suffix: %d", v2, v3, v4, v5, 0);
}

void sub_100014340(uint64_t a1)
{
  int v1 = 136315394;
  uint64_t v2 = "-[FirmwareBundle initWithURL:hashData:signatureData:certData:]";
  __int16 v3 = 2112;
  uint64_t v4 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s: Invalid firmwareURL %@", (uint8_t *)&v1, 0x16u);
}

void sub_1000143D4(uint64_t a1)
{
  int v1 = 136315394;
  uint64_t v2 = "-[AUHelperInstance remoteObject]_block_invoke";
  __int16 v3 = 2112;
  uint64_t v4 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s: Failed to get remote object: %@", (uint8_t *)&v1, 0x16u);
}

void sub_100014468()
{
  int v0 = 136315138;
  int v1 = "+[AUHelperInstance xpcConnectionToHelper]";
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s: Failed to get xpc connection", (uint8_t *)&v0, 0xCu);
}

uint64_t CCDigestFinal()
{
  return _CCDigestFinal();
}

uint64_t CCDigestGetOutputSize()
{
  return _CCDigestGetOutputSize();
}

uint64_t CCDigestInit()
{
  return _CCDigestInit();
}

uint64_t CCDigestUpdate()
{
  return _CCDigestUpdate();
}

CFTypeRef CFMakeCollectable(CFTypeRef cf)
{
  return _CFMakeCollectable(cf);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppBooleanValue(key, applicationID, keyExistsAndHasValidFormat);
}

uint64_t InternalStorageDirectoryPath()
{
  return _InternalStorageDirectoryPath();
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

void NSLog(NSString *format, ...)
{
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
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

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint64_t abort_report_np()
{
  return _abort_report_np();
}

void bzero(void *a1, size_t a2)
{
}

uint64_t ccdigest_init()
{
  return _ccdigest_init();
}

uint64_t ccdigest_update()
{
  return _ccdigest_update();
}

uint64_t ccsha256_di()
{
  return _ccsha256_di();
}

size_t confstr(int a1, char *a2, size_t a3)
{
  return _confstr(a1, a2, a3);
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void free(void *a1)
{
}

uid_t getuid(void)
{
  return _getuid();
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return _memset(__b, __c, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
}

uint64_t metadataTLVGetNext()
{
  return _metadataTLVGetNext();
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
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

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t parseSuperBinaryAndPayloadHeaders()
{
  return _parseSuperBinaryAndPayloadHeaders();
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return _pthread_mutex_destroy(a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return _pthread_mutex_init(a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return _pthread_mutex_lock(a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return _pthread_mutex_unlock(a1);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return _sscanf(a1, a2);
}

uint64_t updateSuperBinaryPayload()
{
  return _updateSuperBinaryPayload();
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_accessoriesDictionary(void *a1, const char *a2, ...)
{
  return [a1 accessoriesDictionary];
}

id objc_msgSend_accessory(void *a1, const char *a2, ...)
{
  return [a1 accessory];
}

id objc_msgSend_accessoryDisconnected(void *a1, const char *a2, ...)
{
  return [a1 accessoryDisconnected];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allowConditionalDownloadOnCellular(void *a1, const char *a2, ...)
{
  return [a1 allowConditionalDownloadOnCellular];
}

id objc_msgSend_appProtocol(void *a1, const char *a2, ...)
{
  return [a1 appProtocol];
}

id objc_msgSend_applyCompletion(void *a1, const char *a2, ...)
{
  return [a1 applyCompletion];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_asset(void *a1, const char *a2, ...)
{
  return [a1 asset];
}

id objc_msgSend_assetAvailable(void *a1, const char *a2, ...)
{
  return [a1 assetAvailable];
}

id objc_msgSend_assetDownloaded(void *a1, const char *a2, ...)
{
  return [a1 assetDownloaded];
}

id objc_msgSend_assetLocation(void *a1, const char *a2, ...)
{
  return [a1 assetLocation];
}

id objc_msgSend_attributes(void *a1, const char *a2, ...)
{
  return [a1 attributes];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bootloaderProtocol(void *a1, const char *a2, ...)
{
  return [a1 bootloaderProtocol];
}

id objc_msgSend_buildManifest(void *a1, const char *a2, ...)
{
  return [a1 buildManifest];
}

id objc_msgSend_bundlePath(void *a1, const char *a2, ...)
{
  return [a1 bundlePath];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_calculateHash(void *a1, const char *a2, ...)
{
  return [a1 calculateHash];
}

id objc_msgSend_certificate(void *a1, const char *a2, ...)
{
  return [a1 certificate];
}

id objc_msgSend_close(void *a1, const char *a2, ...)
{
  return [a1 close];
}

id objc_msgSend_closeSession(void *a1, const char *a2, ...)
{
  return [a1 closeSession];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_connectedAccessories(void *a1, const char *a2, ...)
{
  return [a1 connectedAccessories];
}

id objc_msgSend_connectionID(void *a1, const char *a2, ...)
{
  return [a1 connectionID];
}

id objc_msgSend_consentRequired(void *a1, const char *a2, ...)
{
  return [a1 consentRequired];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentFirmwareVersionOnAcc(void *a1, const char *a2, ...)
{
  return [a1 currentFirmwareVersionOnAcc];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultBundlePath(void *a1, const char *a2, ...)
{
  return [a1 defaultBundlePath];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_deploymentAllowed(void *a1, const char *a2, ...)
{
  return [a1 deploymentAllowed];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_digest(void *a1, const char *a2, ...)
{
  return [a1 digest];
}

id objc_msgSend_doneWithAsset(void *a1, const char *a2, ...)
{
  return [a1 doneWithAsset];
}

id objc_msgSend_filePathURL(void *a1, const char *a2, ...)
{
  return [a1 filePathURL];
}

id objc_msgSend_fileSize(void *a1, const char *a2, ...)
{
  return [a1 fileSize];
}

id objc_msgSend_findAccessory(void *a1, const char *a2, ...)
{
  return [a1 findAccessory];
}

id objc_msgSend_firmwareBundle(void *a1, const char *a2, ...)
{
  return [a1 firmwareBundle];
}

id objc_msgSend_firmwareBundleFilename(void *a1, const char *a2, ...)
{
  return [a1 firmwareBundleFilename];
}

id objc_msgSend_firmwareBundleURL(void *a1, const char *a2, ...)
{
  return [a1 firmwareBundleURL];
}

id objc_msgSend_firmwareImage(void *a1, const char *a2, ...)
{
  return [a1 firmwareImage];
}

id objc_msgSend_firmwareImageBaseAddress(void *a1, const char *a2, ...)
{
  return [a1 firmwareImageBaseAddress];
}

id objc_msgSend_firmwareImageSize(void *a1, const char *a2, ...)
{
  return [a1 firmwareImageSize];
}

id objc_msgSend_firmwareLocalURL(void *a1, const char *a2, ...)
{
  return [a1 firmwareLocalURL];
}

id objc_msgSend_firmwareRevision(void *a1, const char *a2, ...)
{
  return [a1 firmwareRevision];
}

id objc_msgSend_firmwareRevisionActive(void *a1, const char *a2, ...)
{
  return [a1 firmwareRevisionActive];
}

id objc_msgSend_firmwareRevisionPending(void *a1, const char *a2, ...)
{
  return [a1 firmwareRevisionPending];
}

id objc_msgSend_firmwareVersionAvailable(void *a1, const char *a2, ...)
{
  return [a1 firmwareVersionAvailable];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_forceSilentUpdate(void *a1, const char *a2, ...)
{
  return [a1 forceSilentUpdate];
}

id objc_msgSend_getLocalFileUrl(void *a1, const char *a2, ...)
{
  return [a1 getLocalFileUrl];
}

id objc_msgSend_getNumberOfBytesDownloadedInCurrentSession(void *a1, const char *a2, ...)
{
  return [a1 getNumberOfBytesDownloadedInCurrentSession];
}

id objc_msgSend_getPersonalizationID(void *a1, const char *a2, ...)
{
  return [a1 getPersonalizationID];
}

id objc_msgSend_getWhitelistedPersonalizationFields(void *a1, const char *a2, ...)
{
  return [a1 getWhitelistedPersonalizationFields];
}

id objc_msgSend_hasBytesAvailable(void *a1, const char *a2, ...)
{
  return [a1 hasBytesAvailable];
}

id objc_msgSend_hasSpaceAvailable(void *a1, const char *a2, ...)
{
  return [a1 hasSpaceAvailable];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_hwFusingType(void *a1, const char *a2, ...)
{
  return [a1 hwFusingType];
}

id objc_msgSend_iAUPVersion(void *a1, const char *a2, ...)
{
  return [a1 iAUPVersion];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_inputStream(void *a1, const char *a2, ...)
{
  return [a1 inputStream];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isAtEnd(void *a1, const char *a2, ...)
{
  return [a1 isAtEnd];
}

id objc_msgSend_isMultiAssetSession(void *a1, const char *a2, ...)
{
  return [a1 isMultiAssetSession];
}

id objc_msgSend_isRestartRequired(void *a1, const char *a2, ...)
{
  return [a1 isRestartRequired];
}

id objc_msgSend_isRoamingEnabled(void *a1, const char *a2, ...)
{
  return [a1 isRoamingEnabled];
}

id objc_msgSend_isSecurityModeSet(void *a1, const char *a2, ...)
{
  return [a1 isSecurityModeSet];
}

id objc_msgSend_isSleepWakeRequired(void *a1, const char *a2, ...)
{
  return [a1 isSleepWakeRequired];
}

id objc_msgSend_isUrgentUpdate(void *a1, const char *a2, ...)
{
  return [a1 isUrgentUpdate];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_loadFirmwareImage(void *a1, const char *a2, ...)
{
  return [a1 loadFirmwareImage];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return [a1 mainRunLoop];
}

id objc_msgSend_migrateExistingDefaults(void *a1, const char *a2, ...)
{
  return [a1 migrateExistingDefaults];
}

id objc_msgSend_modelData(void *a1, const char *a2, ...)
{
  return [a1 modelData];
}

id objc_msgSend_modelHash(void *a1, const char *a2, ...)
{
  return [a1 modelHash];
}

id objc_msgSend_modelLocale(void *a1, const char *a2, ...)
{
  return [a1 modelLocale];
}

id objc_msgSend_modelNumber(void *a1, const char *a2, ...)
{
  return [a1 modelNumber];
}

id objc_msgSend_multiAssetAppProtocol(void *a1, const char *a2, ...)
{
  return [a1 multiAssetAppProtocol];
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

id objc_msgSend_nonceHash(void *a1, const char *a2, ...)
{
  return [a1 nonceHash];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_open(void *a1, const char *a2, ...)
{
  return [a1 open];
}

id objc_msgSend_openSession(void *a1, const char *a2, ...)
{
  return [a1 openSession];
}

id objc_msgSend_outputStream(void *a1, const char *a2, ...)
{
  return [a1 outputStream];
}

id objc_msgSend_overrideProtocol(void *a1, const char *a2, ...)
{
  return [a1 overrideProtocol];
}

id objc_msgSend_overrideUpdaterOptions(void *a1, const char *a2, ...)
{
  return [a1 overrideUpdaterOptions];
}

id objc_msgSend_parserState(void *a1, const char *a2, ...)
{
  return [a1 parserState];
}

id objc_msgSend_partnerSerialNumbers(void *a1, const char *a2, ...)
{
  return [a1 partnerSerialNumbers];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return [a1 pathExtension];
}

id objc_msgSend_personalizationComplete(void *a1, const char *a2, ...)
{
  return [a1 personalizationComplete];
}

id objc_msgSend_processInTelegram(void *a1, const char *a2, ...)
{
  return [a1 processInTelegram];
}

id objc_msgSend_productIDCode(void *a1, const char *a2, ...)
{
  return [a1 productIDCode];
}

id objc_msgSend_productionMode(void *a1, const char *a2, ...)
{
  return [a1 productionMode];
}

id objc_msgSend_protocolDetails(void *a1, const char *a2, ...)
{
  return [a1 protocolDetails];
}

id objc_msgSend_protocolString(void *a1, const char *a2, ...)
{
  return [a1 protocolString];
}

id objc_msgSend_protocolStrings(void *a1, const char *a2, ...)
{
  return [a1 protocolStrings];
}

id objc_msgSend_purgeAsset(void *a1, const char *a2, ...)
{
  return [a1 purgeAsset];
}

id objc_msgSend_registerForLocalNotifications(void *a1, const char *a2, ...)
{
  return [a1 registerForLocalNotifications];
}

id objc_msgSend_remoteObject(void *a1, const char *a2, ...)
{
  return [a1 remoteObject];
}

id objc_msgSend_remoteObjectInterface(void *a1, const char *a2, ...)
{
  return [a1 remoteObjectInterface];
}

id objc_msgSend_requestPrefix(void *a1, const char *a2, ...)
{
  return [a1 requestPrefix];
}

id objc_msgSend_resetParser(void *a1, const char *a2, ...)
{
  return [a1 resetParser];
}

id objc_msgSend_resourcePath(void *a1, const char *a2, ...)
{
  return [a1 resourcePath];
}

id objc_msgSend_responseFormat(void *a1, const char *a2, ...)
{
  return [a1 responseFormat];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_securityMode(void *a1, const char *a2, ...)
{
  return [a1 securityMode];
}

id objc_msgSend_seedParticipationDictionary(void *a1, const char *a2, ...)
{
  return [a1 seedParticipationDictionary];
}

id objc_msgSend_serialNumber(void *a1, const char *a2, ...)
{
  return [a1 serialNumber];
}

id objc_msgSend_serverState(void *a1, const char *a2, ...)
{
  return [a1 serverState];
}

id objc_msgSend_setSeedParticipationStatusAndContinue(void *a1, const char *a2, ...)
{
  return [a1 setSeedParticipationStatusAndContinue];
}

id objc_msgSend_sharedAccessoryManager(void *a1, const char *a2, ...)
{
  return [a1 sharedAccessoryManager];
}

id objc_msgSend_sharedDatabase(void *a1, const char *a2, ...)
{
  return [a1 sharedDatabase];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_signature(void *a1, const char *a2, ...)
{
  return [a1 signature];
}

id objc_msgSend_skipDFUMode(void *a1, const char *a2, ...)
{
  return [a1 skipDFUMode];
}

id objc_msgSend_stopReconnectTimer(void *a1, const char *a2, ...)
{
  return [a1 stopReconnectTimer];
}

id objc_msgSend_stringByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingPathExtension];
}

id objc_msgSend_supportsInternalSettings(void *a1, const char *a2, ...)
{
  return [a1 supportsInternalSettings];
}

id objc_msgSend_trainName(void *a1, const char *a2, ...)
{
  return [a1 trainName];
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

id objc_msgSend_updateRequiresPersonalization(void *a1, const char *a2, ...)
{
  return [a1 updateRequiresPersonalization];
}

id objc_msgSend_updateRequiresSuperBinary(void *a1, const char *a2, ...)
{
  return [a1 updateRequiresSuperBinary];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_xpcConnectionToHelper(void *a1, const char *a2, ...)
{
  return [a1 xpcConnectionToHelper];
}