void sub_100002E58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100002E70(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100002E80(uint64_t a1)
{
}

void sub_100002E88(uint64_t a1)
{
}

void sub_100002F30(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v5 = *(void **)(v2 + 16);
  v4 = (id *)(v2 + 16);
  if (v5 != v3) {
    objc_storeStrong(v4, v3);
  }
}

void sub_100003014(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegateToQueue];
  id v4 = v2;
  if (*(void *)(a1 + 40)) {
    v3 = *(void **)(a1 + 40);
  }
  else {
    v3 = &_dispatch_main_q;
  }
  [v2 setObject:v3 forKey:*(void *)(a1 + 48)];
}

void sub_10000310C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegateToQueue];
  [v2 removeObjectForKey:*(void *)(a1 + 40)];
}

void sub_100003238(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100003250(void *a1)
{
  id result = [*(id *)(a1[4] + 32) containsObject:a1[5]];
  if ((result & 1) == 0)
  {
    id result = [*(id *)(a1[4] + 32) addObject:a1[5]];
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
  return result;
}

id sub_100003330(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) removeObject:*(void *)(a1 + 40)];
}

void sub_100003418(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100003430(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(void *)(v1 + 16))
  {
    uint64_t v3 = [*(id *)(v1 + 32) firstObject];
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    v6 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (v6)
    {
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), v6);
      v7 = *(void **)(*(void *)(a1 + 32) + 32);
      uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      [v7 removeObject:v8];
    }
  }
}

void sub_100003690(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 16) isEqualToRequest:*(void *)(a1 + 40)])
  {
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = *(void **)(v2 + 16);
    *(void *)(v2 + 16) = 0;
  }
}

void sub_1000036E8(uint64_t a1)
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = [*(id *)(a1 + 32) delegateToQueue];
  id v2 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v16;
    do
    {
      v5 = 0;
      do
      {
        if (*(void *)v16 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v15 + 1) + 8 * (void)v5);
        v7 = [*(id *)(a1 + 32) delegateToQueue];
        uint64_t v8 = [v7 objectForKey:v6];

        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100003898;
        block[3] = &unk_1000C1258;
        uint64_t v9 = *(void *)(a1 + 32);
        v10 = *(void **)(a1 + 40);
        block[4] = v6;
        block[5] = v9;
        id v13 = v10;
        id v14 = *(id *)(a1 + 48);
        dispatch_async(v8, block);

        v5 = (char *)v5 + 1;
      }
      while (v3 != v5);
      id v3 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v3);
  }
}

uint64_t sub_100003898(void *a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    id v3 = (void *)a1[4];
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    uint64_t v6 = a1[7];
    return (uint64_t)[v3 requestController:v4 didReceiveResponse:v5 forRequest:v6];
  }
  return result;
}

void sub_100003B5C(id a1)
{
  uint64_t v1 = objc_alloc_init(VMAWDReporter);
  id v2 = (void *)qword_1000E0778;
  qword_1000E0778 = (uint64_t)v1;
}

void sub_100003C74(uint64_t a1)
{
  id v2 = [objc_alloc((Class)AWDServerConnection) initWithComponentId:72 andBlockOnConfiguration:1];
  [*(id *)(a1 + 32) setServerConnection:v2];
}

id sub_100003F24(uint64_t a1)
{
  CFStringRef v4 = @"serviceState";
  uint64_t v1 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [*(id *)(a1 + 32) serviceState]);
  uint64_t v5 = v1;
  id v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return v2;
}

id sub_100004180(uint64_t a1)
{
  v7[0] = @"slotID";
  id v2 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 48)];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v8[0] = v2;
  v8[1] = v3;
  v7[1] = @"mcc";
  v7[2] = @"mnc";
  v8[2] = v4;
  uint64_t v5 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];

  return v5;
}

id sub_100004634(uint64_t a1)
{
  CFStringRef v4 = @"duration";
  uint64_t v1 = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 32)];
  uint64_t v5 = v1;
  id v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return v2;
}

id sub_1000048D0(uint64_t a1)
{
  v6[0] = @"accountType";
  id v2 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [*(id *)(a1 + 32) accountType]);
  v6[1] = @"notificationType";
  v7[0] = v2;
  uint64_t v3 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [*(id *)(a1 + 32) notificationType]);
  v7[1] = v3;
  CFStringRef v4 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

void sub_100004A84(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) serverConnection];
  id v4 = [v2 newMetricContainerWithIdentifier:*(unsigned int *)(a1 + 48)];

  if (v4)
  {
    [v4 setMetric:*(void *)(a1 + 40)];
    uint64_t v3 = [*(id *)(a1 + 32) serverConnection];
    [v3 submitMetric:v4];
  }
}

id sub_100004C20(uint64_t a1)
{
  CFStringRef v4 = @"accurate";
  uint64_t v1 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [*(id *)(a1 + 32) accurate]);
  uint64_t v5 = v1;
  id v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return v2;
}

id sub_100004DE8(uint64_t a1)
{
  CFStringRef v4 = @"status";
  uint64_t v1 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [*(id *)(a1 + 32) status]);
  uint64_t v5 = v1;
  id v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return v2;
}

id sub_100004FB0(uint64_t a1)
{
  CFStringRef v4 = @"status";
  uint64_t v1 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [*(id *)(a1 + 32) status]);
  uint64_t v5 = v1;
  id v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return v2;
}

id sub_1000051C0(uint64_t a1)
{
  v6[0] = @"status";
  id v2 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [*(id *)(a1 + 32) status]);
  v6[1] = @"reason";
  v7[0] = v2;
  uint64_t v3 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [*(id *)(a1 + 32) failureReason]);
  v7[1] = v3;
  CFStringRef v4 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

id sub_100005468(uint64_t a1)
{
  v11[0] = *(void *)(a1 + 32);
  v10[0] = @"system_locale";
  v10[1] = @"transcription_successful";
  id v2 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 72)];
  v11[1] = v2;
  v10[2] = @"transcription_failure_reason";
  uint64_t v3 = *(void **)(a1 + 40);
  if (v3) {
    objc_msgSend(*(id *)(a1 + 48), "VMAWDTranscriptionFailureReasonAsString:", (int)objc_msgSend(v3, "intValue"));
  }
  else {
  CFStringRef v4 = +[NSNull null];
  }
  v11[2] = v4;
  v10[3] = @"transcription_asset_locale";
  uint64_t v5 = *(void **)(a1 + 56);
  uint64_t v6 = v5;
  if (!v5)
  {
    uint64_t v6 = +[NSNull null];
  }
  v11[3] = v6;
  v10[4] = @"transcription_confidence";
  if (*(void *)(a1 + 64)) {
    objc_msgSend(*(id *)(a1 + 48), "prepareConfidenceValue:");
  }
  else {
  v7 = +[NSNull null];
  }
  v11[4] = v7;
  uint64_t v8 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:5];

  if (!v5) {
  return v8;
  }
}

int64_t sub_1000059A0(id a1, id a2, id a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 doubleValue];
  double v7 = v6;
  [v5 doubleValue];
  if (v7 >= v8)
  {
    [v4 doubleValue];
    double v11 = v10;
    [v5 doubleValue];
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

id sub_100005A2C(uint64_t a1)
{
  v39[0] = *(void *)(a1 + 32);
  v38[0] = @"system_locale";
  v38[1] = @"transcription_successful";
  v37 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 112)];
  v39[1] = v37;
  v38[2] = @"transcription_failure_reason";
  id v2 = *(void **)(a1 + 40);
  if (v2) {
    objc_msgSend(*(id *)(a1 + 48), "VMAWDTranscriptionFailureReasonAsString:", (int)objc_msgSend(v2, "intValue"));
  }
  else {
  v36 = +[NSNull null];
  }
  v39[2] = v36;
  v38[3] = @"transcription_asset_locale";
  uint64_t v3 = *(void *)(a1 + 56);
  uint64_t v35 = v3;
  if (!v3)
  {
    uint64_t v3 = +[NSNull null];
  }
  uint64_t v24 = v3;
  v39[3] = v3;
  v38[4] = @"transcription_confidence";
  if (*(void *)(a1 + 64)) {
    objc_msgSend(*(id *)(a1 + 48), "prepareConfidenceValue:");
  }
  else {
  v34 = +[NSNull null];
  }
  v39[4] = v34;
  v38[5] = @"language_id_successful";
  v33 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 113)];
  v39[5] = v33;
  v38[6] = @"language_id_failure_reason";
  id v4 = *(void **)(a1 + 72);
  if (v4) {
    objc_msgSend(*(id *)(a1 + 48), "VMLanguageIDFailureReasonAsString:", (int)objc_msgSend(v4, "intValue"));
  }
  else {
  v32 = +[NSNull null];
  }
  v39[6] = v32;
  v38[7] = @"language_id_is_english";
  v31 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 114)];
  v39[7] = v31;
  v38[8] = @"language_id_dominant_locale";
  uint64_t v5 = *(void *)(a1 + 80);
  uint64_t v30 = v5;
  if (!v5)
  {
    uint64_t v5 = +[NSNull null];
  }
  v39[8] = v5;
  v38[9] = @"language_id_dominant_locale_confidence";
  if (*(void *)(a1 + 88)) {
    objc_msgSend(*(id *)(a1 + 48), "prepareConfidenceValue:", v5, v24);
  }
  else {
  v29 = +[NSNull null];
  }
  v39[9] = v29;
  v38[10] = @"language_id_alternative_locale1";
  v28 = [*(id *)(a1 + 96) objectAtIndexedSubscript:1];
  v39[10] = v28;
  v38[11] = @"language_id_alternative_locale1_confidence";
  double v6 = *(void **)(a1 + 48);
  double v7 = *(void **)(a1 + 104);
  v27 = [*(id *)(a1 + 96) objectAtIndexedSubscript:1];
  double v8 = [v7 objectForKeyedSubscript:v27];
  int64_t v9 = [v6 prepareConfidenceValue:v8];
  v39[11] = v9;
  v38[12] = @"language_id_alternative_locale2";
  double v10 = [*(id *)(a1 + 96) objectAtIndexedSubscript:2];
  v39[12] = v10;
  v38[13] = @"language_id_alternative_locale2_confidence";
  double v11 = *(void **)(a1 + 48);
  double v12 = *(void **)(a1 + 104);
  id v13 = [*(id *)(a1 + 96) objectAtIndexedSubscript:2];
  id v14 = [v12 objectForKeyedSubscript:v13];
  long long v15 = [v11 prepareConfidenceValue:v14];
  v39[13] = v15;
  v38[14] = @"language_id_alternative_locale3";
  long long v16 = [*(id *)(a1 + 96) objectAtIndexedSubscript:3];
  v39[14] = v16;
  v38[15] = @"language_id_alternative_locale3_confidence";
  long long v17 = *(void **)(a1 + 48);
  long long v18 = *(void **)(a1 + 104);
  v19 = [*(id *)(a1 + 96) objectAtIndexedSubscript:3];
  v20 = [v18 objectForKeyedSubscript:v19];
  v21 = [v17 prepareConfidenceValue:v20];
  v39[15] = v21;
  id v26 = +[NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:16];

  if (!v30) {
  if (!v35)
  }

  return v26;
}

id sub_100005EB0(uint64_t a1)
{
  v19[0] = *(void *)(a1 + 32);
  v18[0] = @"system_locale";
  v18[1] = @"transcription_successful";
  long long v17 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 96)];
  v19[1] = v17;
  v18[2] = @"transcription_failure_reason";
  id v2 = *(void **)(a1 + 40);
  if (v2) {
    objc_msgSend(*(id *)(a1 + 48), "VMAWDTranscriptionFailureReasonAsString:", (int)objc_msgSend(v2, "intValue"));
  }
  else {
  uint64_t v15 = +[NSNull null];
  }
  v19[2] = v15;
  v18[3] = @"transcription_asset_locale";
  uint64_t v3 = *(void **)(a1 + 56);
  id v4 = v3;
  if (!v3)
  {
    id v4 = +[NSNull null];
  }
  v19[3] = v4;
  v18[4] = @"transcription_confidence";
  if (*(void *)(a1 + 64)) {
    objc_msgSend(*(id *)(a1 + 48), "prepareConfidenceValue:");
  }
  else {
  uint64_t v5 = +[NSNull null];
  }
  v19[4] = v5;
  v18[5] = @"language_id_successful";
  double v6 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 97), v15);
  v19[5] = v6;
  v18[6] = @"language_id_failure_reason";
  double v7 = *(void **)(a1 + 72);
  if (v7) {
    objc_msgSend(*(id *)(a1 + 48), "VMLanguageIDFailureReasonAsString:", (int)objc_msgSend(v7, "intValue"));
  }
  else {
  double v8 = +[NSNull null];
  }
  v19[6] = v8;
  v18[7] = @"language_id_is_english";
  int64_t v9 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 98)];
  v19[7] = v9;
  v18[8] = @"language_id_dominant_locale";
  double v10 = *(void **)(a1 + 80);
  double v11 = v10;
  if (!v10)
  {
    double v11 = +[NSNull null];
  }
  v19[8] = v11;
  v18[9] = @"language_id_dominant_locale_confidence";
  if (*(void *)(a1 + 88)) {
    objc_msgSend(*(id *)(a1 + 48), "prepareConfidenceValue:");
  }
  else {
  double v12 = +[NSNull null];
  }
  v19[9] = v12;
  id v13 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:10];

  if (!v10) {
  if (!v3)
  }

  return v13;
}

void sub_100006364(id a1)
{
  uint64_t v1 = objc_alloc_init(VMABCReporter);
  id v2 = (void *)qword_1000E0788;
  qword_1000E0788 = (uint64_t)v1;
}

void sub_10000647C(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)SDRDiagnosticReporter);
  [*(id *)(a1 + 32) setReporter:v2];
}

void sub_100006638(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = vm_vmd_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    int v7 = 138412802;
    id v8 = v3;
    __int16 v9 = 2112;
    uint64_t v10 = v5;
    __int16 v11 = 2112;
    uint64_t v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "SDRDiagnosticReporter response = %@, subType = %@, description = %@", (uint8_t *)&v7, 0x20u);
  }
}

void sub_100006F88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,void *a32)
{
  _Unwind_Resume(a1);
}

id sub_100007194()
{
  if (qword_1000E07A0 != -1) {
    dispatch_once(&qword_1000E07A0, &stru_1000C14D8);
  }
  v0 = (void *)qword_1000E0798;
  return v0;
}

void sub_100007238(id a1)
{
  os_log_t v1 = os_log_create("com.apple.voicemail", "cb");
  id v2 = (void *)qword_1000E0798;
  qword_1000E0798 = (uint64_t)v1;
}

void sub_100007280()
{
}

void *sub_100007294(uint64_t a1)
{
  uint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *uint64_t result = off_1000C1508;
  result[1] = v3;
  return result;
}

uint64_t sub_1000072DC(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = off_1000C1508;
  a2[1] = v2;
  return result;
}

void sub_100007308(uint64_t a1, uint64_t *a2)
{
  id v4 = sub_100007194();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(**(void **)(a1 + 8) + 8);
    if (*((char *)a2 + 23) >= 0) {
      uint64_t v6 = a2;
    }
    else {
      uint64_t v6 = (uint64_t *)*a2;
    }
    int v7 = 136315650;
    uint64_t v8 = v5;
    __int16 v9 = 2080;
    uint64_t v10 = " ";
    __int16 v11 = 2080;
    uint64_t v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#I %s%s%s", (uint8_t *)&v7, 0x20u);
  }
}

uint64_t sub_1000073F0(uint64_t a1, uint64_t a2)
{
  if (sub_10000743C(a2, (uint64_t)&off_1000C1578)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

_UNKNOWN **sub_100007430()
{
  return &off_1000C1578;
}

BOOL sub_10000743C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a2 + 8);
  if (v2 == v3) {
    return 1;
  }
  if ((v3 & v2) < 0 != __OFSUB__(v2, v3)) {
    return strcmp((const char *)(v2 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL)) == 0;
  }
  return 0;
}

void *sub_10000748C(void *a1)
{
  uint64_t v2 = (void *)a1[3];
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

void sub_100007510(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x20u);
}

void sub_100007558(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void sub_100007744(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000776C(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  if ([*(id *)(a1 + 32) isCancelled])
  {
    *a4 = 1;
    int v7 = vm_vmd_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Operation to sanitize voicemail transcription database was cancelled.", v10, 2u);
    }
  }
  else
  {
    uint64_t v8 = VMStoreRecordGetFlags((uint64_t)v6) & 0xFFFF7DFFLL;
    __int16 v9 = VMStoreRecordGetLabel((uint64_t)v6);
    VMStoreRecordSetFlags(v9, v6, v8);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

BOOL sub_100007BAC(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    while (1)
    {
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
      }
      char v4 = 0;
      unsigned int v5 = 0;
      unint64_t v6 = 0;
      while (1)
      {
        unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
        *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
        v6 |= (unint64_t)(v8 & 0x7F) << v4;
        if ((v8 & 0x80) == 0) {
          goto LABEL_11;
        }
        v4 += 7;
        if (v5++ >= 9)
        {
          unint64_t v6 = 0;
          int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
          goto LABEL_13;
        }
      }
      *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
      int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        unint64_t v6 = 0;
      }
LABEL_13:
      if (v10 || (v6 & 7) == 4) {
        return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
      }
      unint64_t v12 = v6 >> 3;
      if ((v6 >> 3) == 3)
      {
        char v20 = 0;
        unsigned int v21 = 0;
        uint64_t v15 = 0;
        *(unsigned char *)(a1 + 32) |= 1u;
        while (1)
        {
          unint64_t v22 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v22 == -1 || v22 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
            break;
          }
          char v23 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v22);
          *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v22 + 1;
          v15 |= (unint64_t)(v23 & 0x7F) << v20;
          if ((v23 & 0x80) == 0)
          {
            v19 = &OBJC_IVAR___AWDVisualVoicemailTranscriptionStatusChanged__failureReason;
            goto LABEL_47;
          }
          v20 += 7;
          BOOL v18 = v21++ > 8;
          if (v18)
          {
            uint64_t v15 = 0;
            v19 = &OBJC_IVAR___AWDVisualVoicemailTranscriptionStatusChanged__failureReason;
            goto LABEL_49;
          }
        }
        v19 = &OBJC_IVAR___AWDVisualVoicemailTranscriptionStatusChanged__failureReason;
LABEL_46:
        *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
        goto LABEL_47;
      }
      if (v12 == 2) {
        break;
      }
      if (v12 == 1)
      {
        char v13 = 0;
        unsigned int v14 = 0;
        uint64_t v15 = 0;
        *(unsigned char *)(a1 + 32) |= 4u;
        while (1)
        {
          unint64_t v16 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v16 == -1 || v16 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            v19 = &OBJC_IVAR___AWDVisualVoicemailTranscriptionStatusChanged__timestamp;
            goto LABEL_46;
          }
          char v17 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v16);
          *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v16 + 1;
          v15 |= (unint64_t)(v17 & 0x7F) << v13;
          if ((v17 & 0x80) == 0) {
            break;
          }
          v13 += 7;
          BOOL v18 = v14++ > 8;
          if (v18)
          {
            uint64_t v15 = 0;
            v19 = &OBJC_IVAR___AWDVisualVoicemailTranscriptionStatusChanged__timestamp;
            goto LABEL_49;
          }
        }
        v19 = &OBJC_IVAR___AWDVisualVoicemailTranscriptionStatusChanged__timestamp;
        goto LABEL_47;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_50:
      if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
      }
    }
    char v24 = 0;
    unsigned int v25 = 0;
    uint64_t v15 = 0;
    *(unsigned char *)(a1 + 32) |= 2u;
    while (1)
    {
      unint64_t v26 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v26 == -1 || v26 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
      {
        v19 = &OBJC_IVAR___AWDVisualVoicemailTranscriptionStatusChanged__status;
        goto LABEL_46;
      }
      char v27 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v26);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v26 + 1;
      v15 |= (unint64_t)(v27 & 0x7F) << v24;
      if ((v27 & 0x80) == 0) {
        break;
      }
      v24 += 7;
      BOOL v18 = v25++ > 8;
      if (v18)
      {
        uint64_t v15 = 0;
        v19 = &OBJC_IVAR___AWDVisualVoicemailTranscriptionStatusChanged__status;
        goto LABEL_49;
      }
    }
    v19 = &OBJC_IVAR___AWDVisualVoicemailTranscriptionStatusChanged__status;
LABEL_47:
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      uint64_t v15 = 0;
    }
LABEL_49:
    *(void *)(a1 + *v19) = v15;
    goto LABEL_50;
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

void sub_100008B94(uint64_t a1, CMSampleBufferRef sbuf)
{
  CMFormatDescriptionRef FormatDescription = CMSampleBufferGetFormatDescription(sbuf);
  if (!FormatDescription)
  {
    char v8 = +[NSAssertionHandler currentHandler];
    [v8 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"VMSpeechAnalyzerOperation.m" lineNumber:117 description:@"format description error"];
  }
  id v5 = objc_alloc((Class)AVAudioPCMBuffer);
  id v6 = [objc_alloc((Class)AVAudioFormat) initWithCMAudioFormatDescription:FormatDescription];
  id v9 = [v5 initWithPCMFormat:v6 frameCapacity:CMSampleBufferGetNumSamples(sbuf)];

  [v9 setFrameLength:CMSampleBufferGetNumSamples(sbuf)];
  LODWORD(v6) = CMSampleBufferGetNumSamples(sbuf);
  CMSampleBufferCopyPCMDataIntoAudioBufferList(sbuf, 0, (int32_t)v6, (AudioBufferList *)[v9 mutableAudioBufferList]);
  unint64_t v7 = [*(id *)(a1 + 32) speechAnalyzer];
  [v7 addAudio:v9];
}

void sub_100008CC4(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = vm_vmd_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Language ID Submitted Audio. Error? %@", (uint8_t *)&v4, 0xCu);
  }
}

void sub_100008E4C(id a1)
{
  uint64_t v1 = objc_alloc_init(VVMSharedPreferencesObserver);
  uint64_t v2 = (void *)qword_1000E07A8;
  qword_1000E07A8 = (uint64_t)v1;
}

void sub_100009088(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_1000090E4()
{
  if (qword_1000E07C0 != -1) {
    dispatch_once(&qword_1000E07C0, &stru_1000C1690);
  }
  v0 = (void *)qword_1000E07B8;
  return v0;
}

void sub_100009284(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  a9.super_class = (Class)VVMSharedPreferencesObserver;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1000092D0(void *a1)
{
}

void sub_100009410(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100009428(uint64_t a1, int a2, uint64_t a3)
{
  id v5 = sub_1000090E4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315650;
    char v8 = "";
    __int16 v9 = 2080;
    int v10 = "";
    __int16 v11 = 1024;
    int v12 = a2;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#I %s%shandleRadioPreferencesCallback [type %d] received", (uint8_t *)&v7, 0x1Cu);
  }

  if ((a2 & 2) != 0)
  {
    id v6 = +[VVMSharedPreferencesObserver sharedPreferencesObserver];
    [v6 handleRadioPreferencesChanged:a3];
  }
  else
  {
    id v6 = sub_1000090E4();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315394;
      char v8 = "";
      __int16 v9 = 2080;
      int v10 = "";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#I %s%shandleRadioPreferencesCallback: no preference changed", (uint8_t *)&v7, 0x16u);
    }
  }
}

void sub_100009580(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000980C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000099C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100009A98(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_100009CA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100009CD4(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleAirplaneModeChanged:*(unsigned __int8 *)(a1 + 40)];
}

void sub_100009D58(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_100009DD4(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_100009E30(id a1)
{
  os_log_t v1 = os_log_create("com.apple.voicemail", "apm");
  uint64_t v2 = (void *)qword_1000E07B8;
  qword_1000E07B8 = (uint64_t)v1;
}

id sub_100009E74()
{
  if (qword_1000E07D0 != -1) {
    dispatch_once(&qword_1000E07D0, &stru_1000C16B0);
  }
  v0 = (void *)qword_1000E07C8;
  return v0;
}

void sub_100009EC8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.voicemail", "xpc.srv");
  uint64_t v2 = (void *)qword_1000E07C8;
  qword_1000E07C8 = (uint64_t)v1;
}

void *sub_100009F0C()
{
  int v0 = __chkstk_darwin();
  uint64_t v2 = v1;
  if (proc_pidpath(v0, buffer, 0x1000u) < 1) {
    return sub_10000E6A8(v2, "?");
  }
  strlen(buffer);
  return (void *)ctu::basename();
}

void sub_10000A028(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000A438(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13)
{
  _Unwind_Resume(a1);
}

id sub_10000A4EC(uint64_t a1, void *a2)
{
  return [a2 _handleVoicemailStoreSaved];
}

void sub_10000A564(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  int v10 = v9;

  a9.super_class = (Class)VMVoicemailServiceController;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_10000A67C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000A69C(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = vm_vmd_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_10007FC5C();
  }
}

void sub_10000A6F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000A874(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000A8D4(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = vm_vmd_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_10007FCC4();
  }
}

void sub_10000A928(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000A9D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  int v12 = v11;

  _Unwind_Resume(a1);
}

void sub_10000AA00(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = vm_vmd_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_10007FD2C();
  }
}

void sub_10000AA54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000AB10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000AB48(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = vm_vmd_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_10007FD94();
  }
}

void sub_10000AB9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000AC54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000AC7C(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = vm_vmd_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_10007FE40();
  }
}

void sub_10000ACD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000AD88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000ADB4(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = vm_vmd_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_10007FEA8();
  }
}

void sub_10000AE08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000B02C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000B0A0(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = vm_vmd_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_10007FF10();
  }
}

void sub_10000B0F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000B1AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000B1D8(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = vm_vmd_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_10007FF78();
  }
}

void sub_10000B22C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000B320(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000B46C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000B7C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000B904(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000B980(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000BC3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

int64_t sub_10000BCDC(id a1, VMVoicemail *a2, VMVoicemail *a3)
{
  int v4 = a2;
  id v5 = [(VMVoicemail *)a3 date];
  id v6 = [(VMVoicemail *)v4 date];
  id v7 = [v5 compare:v6];

  return (int64_t)v7;
}

void sub_10000BD4C(_Unwind_Exception *a1)
{
  int v4 = v3;

  _Unwind_Resume(a1);
}

void sub_10000BDF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000BE70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000BF48(_Unwind_Exception *a1)
{
  int v4 = v3;

  _Unwind_Resume(a1);
}

void sub_10000C034(_Unwind_Exception *a1)
{
  int v4 = v3;

  _Unwind_Resume(a1);
}

void sub_10000C0C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000C1A0(_Unwind_Exception *a1)
{
  int v4 = v3;

  _Unwind_Resume(a1);
}

void sub_10000C234(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000C388(_Unwind_Exception *a1)
{
  id v6 = v4;

  _Unwind_Resume(a1);
}

void sub_10000C454(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000C4D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000C560(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000C66C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000CBDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000CE04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  int v12 = v11;

  _Unwind_Resume(a1);
}

void sub_10000CEC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000CF70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000D020(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000D0D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000D180(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000D230(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000D2E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  char v13 = v12;

  _Unwind_Resume(a1);
}

void sub_10000D3C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  char v13 = v12;

  _Unwind_Resume(a1);
}

void sub_10000D408(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = vm_vmd_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_1000802CC();
  }
}

void sub_10000D45C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000D4E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000D598(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000D644(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000D6F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  char v13 = v12;

  _Unwind_Resume(a1);
}

void sub_10000D76C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000D7C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000D86C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  int v12 = v11;

  _Unwind_Resume(a1);
}

void sub_10000D8AC(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = vm_vmd_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_100080334();
  }
}

void sub_10000D900(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000D978(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000DA10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000DBA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_10000DC14()
{
}

void sub_10000DC1C(uint64_t a1, uint64_t a2)
{
  id v3 = +[VMVoicemail messageForRecord:a2 forContexts:*(void *)(a1 + 32) andIsoCodes:*(void *)(a1 + 40)];
  if (v3) {
    [*(id *)(a1 + 48) addObject:v3];
  }
}

void sub_10000DC84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000DE3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_10000DEAC()
{
}

void sub_10000DEB4(uint64_t a1, uint64_t a2)
{
  id v3 = +[VMVoicemail messageForRecord:a2 forContexts:*(void *)(a1 + 32) andIsoCodes:*(void *)(a1 + 40)];
  if (v3) {
    [*(id *)(a1 + 48) addObject:v3];
  }
}

void sub_10000DF1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000DFB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000E020(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000E388(void *a1, void *a2)
{
  id v3 = a2;
  int v4 = sub_100009E74();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = a1[4];
    uint64_t v6 = a1[6];
    id v7 = [v3 blockInvocationDescription];
    int v8 = 138412802;
    uint64_t v9 = v5;
    __int16 v10 = 2048;
    uint64_t v11 = v6;
    __int16 v12 = 2112;
    char v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Sending reply for request \"%@\" (conn=%p): %@", (uint8_t *)&v8, 0x20u);
  }
  [v3 setTarget:a1[5]];
  [v3 invoke];
}

void sub_10000E490(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *sub_10000E6A8(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    sub_10000E75C();
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

void sub_10000E75C()
{
}

void sub_10000E774(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_10000E7D0(exception, a1);
}

void sub_10000E7BC(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_10000E7D0(std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  return result;
}

void sub_10000E804(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_10000E844(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

const char *sub_10000EEB4(const __CFAllocator *a1, CFStringRef theString, char *buffer, CFIndex *a4, CFStringEncoding encoding)
{
  uint64_t v7 = buffer;
  CFIndex maxBufLen = 0;
  if (buffer && a4 && *a4 && CFStringGetCString(theString, buffer, *a4, encoding))
  {
    size_t v10 = strlen(v7);
LABEL_12:
    *a4 = v10;
    return v7;
  }
  CFIndex Length = CFStringGetLength(theString);
  v16.location = 0;
  v16.length = Length;
  CFStringGetBytes(theString, v16, encoding, 0, 0, 0, 0, &maxBufLen);
  __int16 v12 = (UInt8 *)CFAllocatorAllocate(a1, maxBufLen + 1, 0);
  if (v12)
  {
    char v13 = (const char *)v12;
    v17.location = 0;
    v17.length = Length;
    CFStringGetBytes(theString, v17, encoding, 0, 0, v12, maxBufLen, &maxBufLen);
    uint64_t v7 = &v13[maxBufLen];
  }
  else
  {
    CFIndex maxBufLen = 0;
    char v13 = v7;
    if (!v7) {
      goto LABEL_10;
    }
  }
  const char *v7 = 0;
  uint64_t v7 = v13;
LABEL_10:
  if (a4)
  {
    size_t v10 = maxBufLen;
    goto LABEL_12;
  }
  return v7;
}

uint64_t sub_10000EFE4(unsigned char *a1, uid_t a2, gid_t a3, mode_t a4)
{
  bzero(v13, 0x400uLL);
  int v8 = *a1;
  if (!*a1) {
    return 0;
  }
  unint64_t v9 = 0;
  size_t v10 = a1 + 1;
  memset(&v12, 0, sizeof(v12));
  while (1)
  {
    v13[v9] = v8;
    if (v8 != 47 || !stat(v13, &v12)) {
      goto LABEL_7;
    }
    if (mkdir(v13, 0x1FFu)) {
      return *__error();
    }
    chown(v13, a2, a3);
    chmod(v13, a4);
LABEL_7:
    uint64_t result = 0;
    if (v9 <= 0x3FD)
    {
      int v8 = v10[v9++];
      if (v8) {
        continue;
      }
    }
    return result;
  }
}

void sub_10000F108()
{
  if (qword_1000E07D8 != -1) {
    dispatch_once(&qword_1000E07D8, &stru_1000C18A8);
  }
}

void sub_10000F130(id a1)
{
  CFIndex v9 = 32;
  CFRetain(@"mobile");
  CFURLRef v1 = (const __CFURL *)CFCopyHomeDirectoryURLForUser();
  if (v1)
  {
    CFURLRef v2 = v1;
    CFStringRef v3 = CFURLCopyFileSystemPath(v1, kCFURLPOSIXPathStyle);
    if (v3)
    {
      CFStringRef v4 = v3;
      qword_1000E07E0 = (uint64_t)sub_10000EEB4(kCFAllocatorDefault, v3, 0, 0, 0x8000100u);
      CFRelease(v4);
    }
    CFRelease(v2);
  }
  size_t v5 = sub_10000EEB4(kCFAllocatorDefault, @"mobile", buffer, &v9, 0x8000100u);
  if (v5)
  {
    uint64_t v6 = (char *)v5;
    uint64_t v7 = getpwnam(v5);
    if (v7)
    {
      int pw_gid = v7->pw_gid;
      dword_1000E07E8 = v7->pw_uid;
      dword_1000E07EC = pw_gid;
    }
    if (v6 != buffer) {
      CFAllocatorDeallocate(kCFAllocatorDefault, v6);
    }
  }
}

uint64_t sub_10000F25C()
{
  if (qword_1000E07D8 != -1) {
    dispatch_once(&qword_1000E07D8, &stru_1000C18A8);
  }
  return qword_1000E07E0;
}

uint64_t sub_10000F2A0()
{
  if (qword_1000E07D8 != -1) {
    dispatch_once(&qword_1000E07D8, &stru_1000C18A8);
  }
  return dword_1000E07E8;
}

uint64_t sub_10000F2E4()
{
  if (qword_1000E07D8 != -1) {
    dispatch_once(&qword_1000E07D8, &stru_1000C18A8);
  }
  return dword_1000E07EC;
}

id sub_10000F758()
{
  if (qword_1000E0808 != -1) {
    dispatch_once(&qword_1000E0808, &stru_1000C18D0);
  }
  int v0 = (void *)qword_1000E0800;
  return v0;
}

void sub_10000FB4C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.voicemail", "imap.co3");
  CFURLRef v2 = (void *)qword_1000E0800;
  qword_1000E0800 = (uint64_t)v1;
}

void sub_10000FB90()
{
  if (!qword_1000E07F8)
  {
    qword_1000E07F8 = (uint64_t)&off_1000C87E8;
  }
}

uint64_t sub_10000FEEC(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

id sub_10000FFE0(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

void sub_10001105C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100011098()
{
  if (qword_1000E0820 != -1) {
    dispatch_once(&qword_1000E0820, &stru_1000C1938);
  }
  int v0 = (void *)qword_1000E0818;
  return v0;
}

void sub_10001115C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  size_t v10 = v9;

  a9.super_class = (Class)IMAPServiceBodyLoadMonitor;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_100011484(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100011668(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100011880(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000119E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100011F60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000126E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100013100(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1000132F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001340C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100013AC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100013DF4(_Unwind_Exception *a1)
{
  CFStringRef v4 = v3;

  _Unwind_Resume(a1);
}

void sub_100013F78(_Unwind_Exception *a1)
{
  CFStringRef v4 = v2;

  _Unwind_Resume(a1);
}

void sub_1000140CC(_Unwind_Exception *a1)
{
  CFStringRef v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1000142A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100014560(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100014684(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10001486C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100014914(id a1)
{
  os_log_t v1 = os_log_create("com.apple.voicemail", "imap.mon");
  CFURLRef v2 = (void *)qword_1000E0818;
  qword_1000E0818 = (uint64_t)v1;
}

uint64_t sub_100014D78(uint64_t a1, uint64_t a2)
{
  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0;
    while (1)
    {
      unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      BOOL v9 = v5++ >= 9;
      if (v9)
      {
        unint64_t v6 = 0;
        int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0;
    }
LABEL_13:
    if (v10 || (v6 & 7) == 4) {
      break;
    }
    switch((v6 >> 3))
    {
      case 1u:
        char v12 = 0;
        unsigned int v13 = 0;
        uint64_t v14 = 0;
        *(unsigned char *)(a1 + 56) |= 1u;
        while (1)
        {
          unint64_t v15 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v15 == -1 || v15 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
            break;
          }
          char v16 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v15);
          *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v15 + 1;
          v14 |= (unint64_t)(v16 & 0x7F) << v12;
          if ((v16 & 0x80) == 0) {
            goto LABEL_53;
          }
          v12 += 7;
          BOOL v9 = v13++ >= 9;
          if (v9)
          {
            uint64_t v14 = 0;
            goto LABEL_55;
          }
        }
        *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_53:
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v14 = 0;
        }
LABEL_55:
        *(void *)(a1 + 8) = v14;
        continue;
      case 2u:
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        *(unsigned char *)(a1 + 56) |= 8u;
        while (2)
        {
          unint64_t v21 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v21 == -1 || v21 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v22 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v21);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v21 + 1;
            v20 |= (unint64_t)(v22 & 0x7F) << v18;
            if (v22 < 0)
            {
              v18 += 7;
              BOOL v9 = v19++ >= 9;
              if (v9)
              {
                uint64_t v20 = 0;
                goto LABEL_59;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v20 = 0;
        }
LABEL_59:
        *(unsigned char *)(a1 + 52) = v20 != 0;
        continue;
      case 3u:
        char v23 = 0;
        unsigned int v24 = 0;
        uint64_t v25 = 0;
        *(unsigned char *)(a1 + 56) |= 4u;
        while (2)
        {
          unint64_t v26 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v26 == -1 || v26 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v27 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v26);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v26 + 1;
            v25 |= (unint64_t)(v27 & 0x7F) << v23;
            if (v27 < 0)
            {
              v23 += 7;
              BOOL v9 = v24++ >= 9;
              if (v9)
              {
                LODWORD(v25) = 0;
                goto LABEL_63;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v25) = 0;
        }
LABEL_63:
        uint64_t v35 = 48;
        goto LABEL_68;
      case 4u:
        uint64_t v28 = PBReaderReadString();
        uint64_t v29 = 32;
        goto LABEL_51;
      case 5u:
        uint64_t v28 = PBReaderReadString();
        uint64_t v29 = 40;
        goto LABEL_51;
      case 6u:
        char v30 = 0;
        unsigned int v31 = 0;
        uint64_t v25 = 0;
        *(unsigned char *)(a1 + 56) |= 2u;
        break;
      case 7u:
        uint64_t v28 = PBReaderReadString();
        uint64_t v29 = 24;
LABEL_51:
        v34 = *(void **)(a1 + v29);
        *(void *)(a1 + v29) = v28;

        continue;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        continue;
    }
    while (1)
    {
      unint64_t v32 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v32 == -1 || v32 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v33 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v32);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v32 + 1;
      v25 |= (unint64_t)(v33 & 0x7F) << v30;
      if ((v33 & 0x80) == 0) {
        goto LABEL_65;
      }
      v30 += 7;
      BOOL v9 = v31++ >= 9;
      if (v9)
      {
        LODWORD(v25) = 0;
        goto LABEL_67;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_65:
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      LODWORD(v25) = 0;
    }
LABEL_67:
    uint64_t v35 = 16;
LABEL_68:
    *(_DWORD *)(a1 + v35) = v25;
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

id sub_100015D90(uint64_t a1)
{
  return [*(id *)(a1 + 32) notifyDelegateGreetingDidChangeByCarrierForAccountUUID:*(void *)(a1 + 40)];
}

void sub_100015E84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100015E9C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100015EAC(uint64_t a1)
{
}

void sub_100015EB4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  char v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = WeakRetained;
}

void sub_100015F94(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  id v3 = *(id *)(a1 + 40);

  if (WeakRetained != v3)
  {
    char v4 = *(void **)(a1 + 40);
    unsigned int v5 = (id *)(*(void *)(a1 + 32) + 16);
    objc_storeWeak(v5, v4);
  }
}

void sub_1000160EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100016104(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  char v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = WeakRetained;
}

void sub_1000161E4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
  id v3 = *(id *)(a1 + 40);

  if (WeakRetained != v3)
  {
    char v4 = *(void **)(a1 + 40);
    unsigned int v5 = (id *)(*(void *)(a1 + 32) + 24);
    objc_storeWeak(v5, v4);
  }
}

void sub_100016364(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001637C(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 40) objectForKeyedSubscript:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  char v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_100016490(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 40) objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = *(void **)(a1 + 48);
  unint64_t v4 = v2;
  unint64_t v5 = v3;
  if (v4 | v5)
  {
    unint64_t v6 = (void *)v5;
    if (v5)
    {
      unsigned __int8 v7 = [(id)v4 isEqual:v5];

      if (v7) {
        return;
      }
    }
    else
    {
    }
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000165C0;
    v10[3] = &unk_1000C11E0;
    char v8 = *(void **)(a1 + 40);
    v10[4] = *(void *)(a1 + 32);
    id v11 = v8;
    id v12 = *(id *)(a1 + 48);
    BOOL v9 = objc_retainBlock(v10);

    if (v9)
    {
      [*(id *)(a1 + 32) notifyDelegateGreetingWillChangeForAccountUUID:*(void *)(a1 + 40)];
      ((void (*)(void *))v9[2])(v9);
      [*(id *)(a1 + 32) notifyDelegateGreetingDidChangeForAccountUUID:*(void *)(a1 + 40)];
    }
  }
}

id sub_1000165C0(void *a1)
{
  return [*(id *)(a1[4] + 40) setObject:a1[6] forKeyedSubscript:a1[5]];
}

id sub_10001679C(uint64_t a1)
{
  return [*(id *)(a1 + 32) greetingDataSource:*(void *)(a1 + 40) greetingWillChangeForAccountUUID:*(void *)(a1 + 48)];
}

id sub_1000168B4(uint64_t a1)
{
  return [*(id *)(a1 + 32) greetingDataSource:*(void *)(a1 + 40) greetingWillChangeForAccountUUID:*(void *)(a1 + 48)];
}

id sub_1000169C4(uint64_t a1)
{
  return [*(id *)(a1 + 32) greetingChangedByCarrier:*(void *)(a1 + 40)];
}

uint64_t sub_100016F98(uint64_t result)
{
  if ((unint64_t)(result - 1) >= 3) {
    return 0;
  }
  return result;
}

void sub_1000174FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100017514(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100017524(uint64_t a1)
{
}

void sub_10001752C(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 48);
  if (!v2)
  {
    uint64_t v3 = +[CTMessageCenter sharedMessageCenter];
    uint64_t v4 = *(void *)(a1 + 32);
    unint64_t v5 = *(void **)(v4 + 48);
    *(void *)(v4 + 48) = v3;

    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 48);
  }
  unint64_t v6 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  objc_storeStrong(v6, v2);
}

void sub_100017D34(uint64_t a1)
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v2 = [*(id *)(a1 + 32) delegateToQueue];
  id v3 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v15;
    do
    {
      unint64_t v6 = 0;
      do
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v14 + 1) + 8 * (void)v6);
        if (objc_opt_respondsToSelector())
        {
          char v8 = [*(id *)(a1 + 32) delegateToQueue];
          BOOL v9 = [v8 objectForKey:v7];

          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_100017EE8;
          block[3] = &unk_1000C11E0;
          uint64_t v10 = *(void *)(a1 + 32);
          id v11 = *(void **)(a1 + 40);
          block[4] = v7;
          block[5] = v10;
          id v13 = v11;
          dispatch_async(v9, block);
        }
        unint64_t v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v4);
  }
}

id sub_100017EE8(uint64_t a1)
{
  return [*(id *)(a1 + 32) greetingManager:*(void *)(a1 + 40) greetingWillChangeForAccountUUID:*(void *)(a1 + 48)];
}

void sub_100017FDC(uint64_t a1)
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v2 = [*(id *)(a1 + 32) delegateToQueue];
  id v3 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v15;
    do
    {
      unint64_t v6 = 0;
      do
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v14 + 1) + 8 * (void)v6);
        if (objc_opt_respondsToSelector())
        {
          char v8 = [*(id *)(a1 + 32) delegateToQueue];
          BOOL v9 = [v8 objectForKey:v7];

          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_100018190;
          block[3] = &unk_1000C11E0;
          uint64_t v10 = *(void *)(a1 + 32);
          id v11 = *(void **)(a1 + 40);
          block[4] = v7;
          block[5] = v10;
          id v13 = v11;
          dispatch_async(v9, block);
        }
        unint64_t v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v4);
  }
}

id sub_100018190(uint64_t a1)
{
  return [*(id *)(a1 + 32) greetingManager:*(void *)(a1 + 40) greetingDidChangeForAccountUUID:*(void *)(a1 + 48)];
}

void sub_100018258(uint64_t a1)
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v2 = [*(id *)(a1 + 32) delegateToQueue];
  id v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v13;
    do
    {
      unint64_t v6 = 0;
      do
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v12 + 1) + 8 * (void)v6);
        if (objc_opt_respondsToSelector())
        {
          char v8 = [*(id *)(a1 + 32) delegateToQueue];
          BOOL v9 = [v8 objectForKey:v7];

          v10[0] = _NSConcreteStackBlock;
          v10[1] = 3221225472;
          v10[2] = sub_10001840C;
          v10[3] = &unk_1000C11B8;
          v10[4] = v7;
          id v11 = *(id *)(a1 + 40);
          dispatch_async(v9, v10);
        }
        unint64_t v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }
}

id sub_10001840C(uint64_t a1)
{
  return [*(id *)(a1 + 32) greetingChangedByCarrier:*(void *)(a1 + 40)];
}

void sub_1000184E0(id a1)
{
  os_log_t v1 = objc_alloc_init(VMSharedProtectionObserver);
  uint64_t v2 = (void *)qword_1000E0828;
  qword_1000E0828 = (uint64_t)v1;
}

void sub_100018768(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100018788(uint64_t a1)
{
  uint64_t v2 = vm_vmd_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unint64_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Device unlocked after boot", v6, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained) {
    *((unsigned char *)WeakRetained + 8) = 1;
  }
  notify_cancel(*(_DWORD *)(a1 + 40));
  uint64_t v5 = +[NSNotificationCenter defaultCenter];
  [v5 postNotificationName:@"kVMDeviceUnlockedNotification" object:0 userInfo:0];
}

uint64_t sub_100018BA4(uint64_t a1, uint64_t a2)
{
  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0;
    while (1)
    {
      unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      BOOL v9 = v5++ >= 9;
      if (v9)
      {
        unint64_t v6 = 0;
        int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0;
    }
LABEL_13:
    if (v10 || (v6 & 7) == 4) {
      break;
    }
    if ((v6 >> 3) == 2)
    {
      char v17 = 0;
      unsigned int v18 = 0;
      uint64_t v19 = 0;
      *(unsigned char *)(a1 + 20) |= 2u;
      while (1)
      {
        unint64_t v20 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v20 == -1 || v20 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v21 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v20);
        *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v20 + 1;
        v19 |= (unint64_t)(v21 & 0x7F) << v17;
        if ((v21 & 0x80) == 0) {
          goto LABEL_40;
        }
        v17 += 7;
        BOOL v9 = v18++ >= 9;
        if (v9)
        {
          uint64_t v19 = 0;
          goto LABEL_42;
        }
      }
      *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_40:
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        uint64_t v19 = 0;
      }
LABEL_42:
      *(unsigned char *)(a1 + 16) = v19 != 0;
    }
    else if ((v6 >> 3) == 1)
    {
      char v12 = 0;
      unsigned int v13 = 0;
      uint64_t v14 = 0;
      *(unsigned char *)(a1 + 20) |= 1u;
      while (1)
      {
        unint64_t v15 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v15 == -1 || v15 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v16 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v15);
        *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v15 + 1;
        v14 |= (unint64_t)(v16 & 0x7F) << v12;
        if ((v16 & 0x80) == 0) {
          goto LABEL_36;
        }
        v12 += 7;
        BOOL v9 = v13++ >= 9;
        if (v9)
        {
          uint64_t v14 = 0;
          goto LABEL_38;
        }
      }
      *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_36:
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        uint64_t v14 = 0;
      }
LABEL_38:
      *(void *)(a1 + 8) = v14;
    }
    else
    {
      uint64_t result = PBReaderSkipValueWithTag();
      if (!result) {
        return result;
      }
    }
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

unint64_t sub_100019990(unint64_t a1)
{
  if (HIDWORD(a1))
  {
    uint64_t v2 = sub_100019A40();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 134217984;
      unint64_t v5 = a1;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "#I *** Unable to cast %llu to uint_32t", (uint8_t *)&v4, 0xCu);
    }
  }
  return a1;
}

id sub_100019A40()
{
  if (qword_1000E0840 != -1) {
    dispatch_once(&qword_1000E0840, &stru_1000C1A20);
  }
  int v0 = (void *)qword_1000E0838;
  return v0;
}

uint64_t sub_100019A94(uint64_t a1)
{
  if (a1 >= 0x80000000)
  {
    uint64_t v2 = sub_100019A40();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 134217984;
      uint64_t v5 = a1;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "#I *** Unable to cast %lld to int_32t", (uint8_t *)&v4, 0xCu);
    }
  }
  return a1;
}

void sub_100019CFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100019E14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100019F6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001A328(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001A7C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_10001A940(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001A9A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001AA84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001AB54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10001AB70(void *a1)
{
  id v1 = a1;
  if ([v1 hasSuffix:@"INBOX"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 hasSuffix:@"Trash"])
  {
    uint64_t v2 = 2;
  }
  else
  {
    id v3 = sub_100019A40();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_1000806B8((uint64_t)v1, v3);
    }

    uint64_t v2 = 0;
  }

  return v2;
}

void sub_10001AC08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001ACCC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001ADA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001AE7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001AFDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10001B024(void *a1, char *a2)
{
  id v3 = a1;
  id v4 = [v3 intValue];
  if (v4)
  {
    char v5 = 0;
    if (!a2) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  unint64_t v6 = (char *)[v3 rangeOfString:@"temp-" options:8];
  if (v6 != (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v9 = [v3 substringFromIndex:&v6[v7]];
    id v4 = [v9 intValue];

    char v5 = 1;
    if (!a2) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  char v5 = 0;
  id v4 = 0;
  if (a2) {
LABEL_6:
  }
    *a2 = v5;
LABEL_7:

  return v4;
}

void sub_10001B0D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001B1A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001B290(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001B9BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_10001BBC8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    uint64_t v2 = [WeakRetained account];
    id v3 = [v2 service];
    [v3 resetCounts];

    id v4 = +[NSNotificationCenter defaultCenter];
    [v4 postNotificationName:@"VMStoreRemovedRecords" object:0];

    id WeakRetained = v5;
  }
}

void sub_10001BC60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10001BD9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001C0E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_10001C27C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10001C6F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

void sub_10001CB60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001CE28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001D0D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001D1A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001D648(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_10001E634(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *a26,uint64_t a27,uint64_t a28,uint64_t a29,void *a30,uint64_t a31,uint64_t a32,uint64_t a33,void *a34,uint64_t a35,uint64_t a36,void *a37,uint64_t a38,void *a39,void *a40)
{
  _Unwind_Resume(a1);
}

BOOL sub_10001E948(uint64_t a1)
{
  if (!a1) {
    return 0;
  }
  uint64_t v1 = CMFItemCreateWithPhoneNumber();
  if (!v1) {
    return 0;
  }
  uint64_t v2 = (const void *)v1;
  BOOL v3 = CMFBlockListIsItemBlocked() != 0;
  CFRelease(v2);
  return v3;
}

void sub_10001EA64(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  BOOL v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained account];
    id v5 = [v4 service];

    [v5 resetCounts];
    unint64_t v6 = sub_100019A40();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [*(id *)(a1 + 32) account];
      uint64_t v8 = *(void *)&v7[OBJC_IVAR___MFAccount_mambaID];
      uint64_t v9 = *(void *)(a1 + 40);
      int v11 = 136315650;
      uint64_t v12 = v8;
      __int16 v13 = 2080;
      uint64_t v14 = " ";
      __int16 v15 = 2112;
      uint64_t v16 = v9;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#I %s%sPosting notification VVServiceRecordsAddedNotification %@", (uint8_t *)&v11, 0x20u);
    }
    int v10 = +[NSNotificationCenter defaultCenter];
    [v10 postNotificationName:@"VVServiceRecordsAddedNotification" object:v5 userInfo:*(void *)(a1 + 40)];
  }
}

void sub_10001EBD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001ECC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001EF3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_10001F0D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001F2D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10001F410(id a1)
{
  os_log_t v1 = os_log_create("com.apple.voicemail", "serv.lib");
  uint64_t v2 = (void *)qword_1000E0838;
  qword_1000E0838 = (uint64_t)v1;
}

void sub_10001F664(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegateToQueue];
  id v4 = v2;
  if (*(void *)(a1 + 40)) {
    BOOL v3 = *(void **)(a1 + 40);
  }
  else {
    BOOL v3 = &_dispatch_main_q;
  }
  [v2 setObject:v3 forKey:*(void *)(a1 + 48)];
}

void sub_10001F75C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegateToQueue];
  [v2 removeObjectForKey:*(void *)(a1 + 40)];
}

BOOL sub_10001F99C(void *a1)
{
  id v1 = a1;
  id v2 = +[NSCharacterSet characterSetWithCharactersInString:@"*#+0123456789"];
  BOOL v3 = [v2 invertedSet];

  id v4 = [v1 rangeOfCharacterFromSet:v3];
  return v4 == (id)0x7FFFFFFFFFFFFFFFLL;
}

__CFString *sub_10001FA20(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (!sub_10001F99C(v3))
  {
    uint64_t v8 = vm_vmd_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v3;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "'%@' is not valid phone number, failing Normalization.", (uint8_t *)&v10, 0xCu);
    }
    String = &stru_1000C35D8;
    goto LABEL_9;
  }
  uint64_t v5 = CFPhoneNumberCreate();
  if (v5)
  {
    unint64_t v6 = (const void *)v5;
    String = (__CFString *)CFPhoneNumberCreateString();
    CFRelease(v6);
    if (String)
    {
      uint64_t v8 = vm_vmd_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 138412802;
        id v11 = v3;
        __int16 v12 = 2112;
        __int16 v13 = String;
        __int16 v14 = 2112;
        id v15 = v4;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Normalized '%@' to '%@' using ISO country code '%@'.", (uint8_t *)&v10, 0x20u);
      }
LABEL_9:

      goto LABEL_11;
    }
  }
  String = &stru_1000C35D8;
LABEL_11:

  return String;
}

id sub_10001FBC4(void *a1, void *a2)
{
  id v2 = sub_10001FA20(a1, a2);
  id v3 = v2;
  if (v2 && [v2 length])
  {
    id v4 = objc_msgSend(v3, "vm_UUIDv5");
  }
  else
  {
    uint64_t v5 = vm_vmd_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100080730(v5);
    }

    id v4 = 0;
  }

  return v4;
}

uint64_t sub_10001FDE0(uint64_t a1, uint64_t a2)
{
  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0;
    while (1)
    {
      unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      BOOL v9 = v5++ >= 9;
      if (v9)
      {
        unint64_t v6 = 0;
        int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0;
    }
LABEL_13:
    if (v10 || (v6 & 7) == 4) {
      break;
    }
    if ((v6 >> 3) == 1)
    {
      char v12 = 0;
      unsigned int v13 = 0;
      uint64_t v14 = 0;
      *(unsigned char *)(a1 + 16) |= 1u;
      while (1)
      {
        unint64_t v15 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v15 == -1 || v15 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v16 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v15);
        *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v15 + 1;
        v14 |= (unint64_t)(v16 & 0x7F) << v12;
        if ((v16 & 0x80) == 0) {
          goto LABEL_28;
        }
        v12 += 7;
        BOOL v9 = v13++ >= 9;
        if (v9)
        {
          uint64_t v14 = 0;
          goto LABEL_30;
        }
      }
      *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_28:
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        uint64_t v14 = 0;
      }
LABEL_30:
      *(void *)(a1 + 8) = v14;
    }
    else
    {
      uint64_t result = PBReaderSkipValueWithTag();
      if (!result) {
        return result;
      }
    }
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

id sub_100020350()
{
  if (qword_1000E0850 != -1) {
    dispatch_once(&qword_1000E0850, &stru_1000C1A40);
  }
  int v0 = (void *)qword_1000E0848;
  return v0;
}

void sub_1000208B0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.voicemail", "imap.vvs.trash");
  id v2 = (void *)qword_1000E0848;
  qword_1000E0848 = (uint64_t)v1;
}

void sub_100020DD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13)
{
  _Unwind_Resume(a1);
}

id sub_100020EE0(id *a1)
{
  return *a1;
}

void sub_100020F98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  int v10 = v9;

  a9.super_class = (Class)IMAPServiceAccount;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_100021110(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002118C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100021200(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000212A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000213C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000214EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100021728(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000217F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100021914(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000219C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100021A1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100021BA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100021E4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002226C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002242C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100022558(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100022898(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100022ED4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *a17)
{
  _Unwind_Resume(a1);
}

void sub_10002353C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_100023CE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *a12, void *a13, uint64_t a14, uint64_t a15, void *a16, void *a17)
{
  _Unwind_Resume(a1);
}

void sub_1000245B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, uint64_t a13, void *a14, void *a15, uint64_t a16, void *a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_100024964(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100024BBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100024D8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100025144(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000252C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000254DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000258C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_1000258E4(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 336) lock];
  id v2 = *(void **)(*(void *)(a1 + 32) + 328);
  if (v2 && [v2 isValid])
  {
    id v3 = +[NSRunLoop currentRunLoop];
    [v3 addTimer:*(void *)(*(void *)(a1 + 32) + 328) forMode:NSDefaultRunLoopMode];
  }
  char v4 = *(void **)(*(void *)(a1 + 32) + 336);
  return [v4 unlock];
}

void sub_100025984(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100025EBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100025FFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000260AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100026120(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000262B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100026480(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100026648(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

ctu::OsLogLogger *sub_100026948(ctu::OsLogLogger **a1, ctu::OsLogLogger *a2)
{
  uint64_t result = *a1;
  *a1 = a2;
  if (result)
  {
    ctu::OsLogLogger::~OsLogLogger(result);
    operator delete();
  }
  return result;
}

uint64_t start()
{
  _set_user_dir_suffix();
  os_log_t v1 = sub_100026CD4();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    BOOL v9 = "";
    __int16 v10 = 2080;
    id v11 = "";
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "#I %s%s------------", (uint8_t *)&v8, 0x16u);
  }

  id v2 = sub_100026CD4();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    BOOL v9 = "";
    __int16 v10 = 2080;
    id v11 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "#I %s%svmd launched", (uint8_t *)&v8, 0x16u);
  }

  id v3 = +[VMDaemon sharedDaemon];
  [v3 start];

  char v4 = sub_100026CD4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    BOOL v9 = "";
    __int16 v10 = 2080;
    id v11 = "";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#I %s%svmd running loop", (uint8_t *)&v8, 0x16u);
  }

  unsigned int v5 = +[NSRunLoop mainRunLoop];
  [v5 run];

  unint64_t v6 = sub_100026CD4();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    BOOL v9 = "";
    __int16 v10 = 2080;
    id v11 = "";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#I %s%svmd run loop returned, exiting...", (uint8_t *)&v8, 0x16u);
  }

  return 0;
}

id sub_100026CD4()
{
  if (qword_1000E0860 != -1) {
    dispatch_once(&qword_1000E0860, &stru_1000C1AB8);
  }
  int v0 = (void *)qword_1000E0858;
  return v0;
}

void sub_100026D28(id a1)
{
  os_log_t v1 = os_log_create("com.apple.voicemail", "main");
  id v2 = (void *)qword_1000E0858;
  qword_1000E0858 = (uint64_t)v1;
}

BOOL sub_100027048(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    while (1)
    {
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
      }
      char v4 = 0;
      unsigned int v5 = 0;
      unint64_t v6 = 0;
      while (1)
      {
        unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
        *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
        v6 |= (unint64_t)(v8 & 0x7F) << v4;
        if ((v8 & 0x80) == 0) {
          goto LABEL_11;
        }
        v4 += 7;
        if (v5++ >= 9)
        {
          unint64_t v6 = 0;
          int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
          goto LABEL_13;
        }
      }
      *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
      int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        unint64_t v6 = 0;
      }
LABEL_13:
      if (v10 || (v6 & 7) == 4) {
        return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
      }
      unint64_t v12 = v6 >> 3;
      if ((v6 >> 3) == 3)
      {
        char v20 = 0;
        unsigned int v21 = 0;
        uint64_t v15 = 0;
        *(unsigned char *)(a1 + 32) |= 1u;
        while (1)
        {
          unint64_t v22 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v22 == -1 || v22 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
            break;
          }
          char v23 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v22);
          *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v22 + 1;
          v15 |= (unint64_t)(v23 & 0x7F) << v20;
          if ((v23 & 0x80) == 0)
          {
            uint64_t v19 = &OBJC_IVAR___AWDVisualVoicemailCustomGreetingUpdated__failureReason;
            goto LABEL_47;
          }
          v20 += 7;
          BOOL v18 = v21++ > 8;
          if (v18)
          {
            uint64_t v15 = 0;
            uint64_t v19 = &OBJC_IVAR___AWDVisualVoicemailCustomGreetingUpdated__failureReason;
            goto LABEL_49;
          }
        }
        uint64_t v19 = &OBJC_IVAR___AWDVisualVoicemailCustomGreetingUpdated__failureReason;
LABEL_46:
        *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
        goto LABEL_47;
      }
      if (v12 == 2) {
        break;
      }
      if (v12 == 1)
      {
        char v13 = 0;
        unsigned int v14 = 0;
        uint64_t v15 = 0;
        *(unsigned char *)(a1 + 32) |= 4u;
        while (1)
        {
          unint64_t v16 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v16 == -1 || v16 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            uint64_t v19 = &OBJC_IVAR___AWDVisualVoicemailCustomGreetingUpdated__timestamp;
            goto LABEL_46;
          }
          char v17 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v16);
          *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v16 + 1;
          v15 |= (unint64_t)(v17 & 0x7F) << v13;
          if ((v17 & 0x80) == 0) {
            break;
          }
          v13 += 7;
          BOOL v18 = v14++ > 8;
          if (v18)
          {
            uint64_t v15 = 0;
            uint64_t v19 = &OBJC_IVAR___AWDVisualVoicemailCustomGreetingUpdated__timestamp;
            goto LABEL_49;
          }
        }
        uint64_t v19 = &OBJC_IVAR___AWDVisualVoicemailCustomGreetingUpdated__timestamp;
        goto LABEL_47;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_50:
      if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
      }
    }
    char v24 = 0;
    unsigned int v25 = 0;
    uint64_t v15 = 0;
    *(unsigned char *)(a1 + 32) |= 2u;
    while (1)
    {
      unint64_t v26 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v26 == -1 || v26 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
      {
        uint64_t v19 = &OBJC_IVAR___AWDVisualVoicemailCustomGreetingUpdated__result;
        goto LABEL_46;
      }
      char v27 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v26);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v26 + 1;
      v15 |= (unint64_t)(v27 & 0x7F) << v24;
      if ((v27 & 0x80) == 0) {
        break;
      }
      v24 += 7;
      BOOL v18 = v25++ > 8;
      if (v18)
      {
        uint64_t v15 = 0;
        uint64_t v19 = &OBJC_IVAR___AWDVisualVoicemailCustomGreetingUpdated__result;
        goto LABEL_49;
      }
    }
    uint64_t v19 = &OBJC_IVAR___AWDVisualVoicemailCustomGreetingUpdated__result;
LABEL_47:
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      uint64_t v15 = 0;
    }
LABEL_49:
    *(void *)(a1 + *v19) = v15;
    goto LABEL_50;
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

BOOL sub_100027A64(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    while (1)
    {
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
      }
      char v4 = 0;
      unsigned int v5 = 0;
      unint64_t v6 = 0;
      while (1)
      {
        unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
        *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
        v6 |= (unint64_t)(v8 & 0x7F) << v4;
        if ((v8 & 0x80) == 0) {
          goto LABEL_11;
        }
        v4 += 7;
        if (v5++ >= 9)
        {
          unint64_t v6 = 0;
          int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
          goto LABEL_13;
        }
      }
      *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
      int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        unint64_t v6 = 0;
      }
LABEL_13:
      if (v10 || (v6 & 7) == 4) {
        return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
      }
      if ((v6 >> 3) == 2) {
        break;
      }
      if ((v6 >> 3) == 1)
      {
        char v12 = 0;
        unsigned int v13 = 0;
        uint64_t v14 = 0;
        *(unsigned char *)(a1 + 24) |= 2u;
        while (1)
        {
          unint64_t v15 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v15 == -1 || v15 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            BOOL v18 = &OBJC_IVAR___AWDVisualVoicemailServiceAccountStateUpdated__timestamp;
            goto LABEL_37;
          }
          char v16 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v15);
          *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v15 + 1;
          v14 |= (unint64_t)(v16 & 0x7F) << v12;
          if ((v16 & 0x80) == 0) {
            break;
          }
          v12 += 7;
          BOOL v17 = v13++ > 8;
          if (v17)
          {
            uint64_t v14 = 0;
            BOOL v18 = &OBJC_IVAR___AWDVisualVoicemailServiceAccountStateUpdated__timestamp;
            goto LABEL_40;
          }
        }
        BOOL v18 = &OBJC_IVAR___AWDVisualVoicemailServiceAccountStateUpdated__timestamp;
LABEL_38:
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v14 = 0;
        }
LABEL_40:
        *(void *)(a1 + *v18) = v14;
        goto LABEL_41;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_41:
      if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
      }
    }
    char v19 = 0;
    unsigned int v20 = 0;
    uint64_t v14 = 0;
    *(unsigned char *)(a1 + 24) |= 1u;
    while (1)
    {
      unint64_t v21 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v21 == -1 || v21 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v22 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v21);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v21 + 1;
      v14 |= (unint64_t)(v22 & 0x7F) << v19;
      if ((v22 & 0x80) == 0)
      {
        BOOL v18 = &OBJC_IVAR___AWDVisualVoicemailServiceAccountStateUpdated__serviceState;
        goto LABEL_38;
      }
      v19 += 7;
      BOOL v17 = v20++ > 8;
      if (v17)
      {
        uint64_t v14 = 0;
        BOOL v18 = &OBJC_IVAR___AWDVisualVoicemailServiceAccountStateUpdated__serviceState;
        goto LABEL_40;
      }
    }
    BOOL v18 = &OBJC_IVAR___AWDVisualVoicemailServiceAccountStateUpdated__serviceState;
LABEL_37:
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
    goto LABEL_38;
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

void sub_10002810C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100028294(id a1)
{
  os_log_t v1 = objc_alloc_init(_VVMFLogInterceptor);
  id v2 = (void *)qword_1000E0868;
  qword_1000E0868 = (uint64_t)v1;
}

void sub_1000284A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_1000284F8()
{
  if (qword_1000E0888 != -1) {
    dispatch_once(&qword_1000E0888, &stru_1000C1B68);
  }
  int v0 = (void *)qword_1000E0880;
  return v0;
}

void sub_100028600(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  int v10 = v9;

  a9.super_class = (Class)_VVMFLogInterceptor;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1000286E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000287F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100028820(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    unsigned int v25 = (uint64_t *)(a1 + 32);
    os_log_t v1 = [*(id *)(a1 + 40) all];
    id v2 = [v1 objectForKey:*(void *)(a1 + 32)];
    v34 = v2;

    if (v2)
    {
      if (v2[3])
      {
        long long v32 = 0u;
        long long v33 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        id obj = v2[3];
        id v3 = [obj countByEnumeratingWithState:&v30 objects:v39 count:16];
        if (v3)
        {
          uint64_t v4 = *(void *)v31;
          unsigned int v5 = &AFOfflineDictationCapable_ptr;
          unint64_t v6 = "w";
          unint64_t v7 = "r";
          do
          {
            for (i = 0; i != v3; i = (char *)i + 1)
            {
              if (*(void *)v31 != v4) {
                objc_enumerationMutation(obj);
              }
              uint64_t v9 = *(void *)(*((void *)&v30 + 1) + 8 * i);
              id v28 = [objc_alloc((Class)v5[448]) initWithData:*(void *)(v9 + 16) encoding:4];
              int v10 = vm_imap_log();
              if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
              {
                id v11 = v3;
                char v12 = v7;
                unsigned int v13 = v5;
                uint64_t v14 = v4;
                unint64_t v15 = v6;
                id v17 = v34[1];
                id v16 = v34[2];
                uint64_t v18 = asString();
                *(_DWORD *)buf = 136315906;
                *(void *)&buf[4] = v17;
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v16;
                *(_WORD *)&buf[22] = 2080;
                v36 = (unsigned char *)v18;
                __int16 v37 = 2112;
                id v38 = v28;
                _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s %@ %s\n%@", buf, 0x2Au);
                unint64_t v6 = v15;
                uint64_t v4 = v14;
                unsigned int v5 = v13;
                unint64_t v7 = v12;
                id v3 = v11;
              }

              if ((unint64_t)(*(void *)(v9 + 8) - 1) >= 2) {
                char v19 = v6;
              }
              else {
                char v19 = v7;
              }
              id v29 = [v5[448] stringWithFormat:@"%@.%s", v34[2], v19];
              *(void *)buf = off_1000C1B98;
              *(void *)&buf[8] = &v34;
              *(void *)&buf[16] = &v29;
              v36 = buf;
              logger::CFTypeRefLogger();
              sub_10000748C(buf);
            }
            id v3 = [obj countByEnumeratingWithState:&v30 objects:v39 count:16];
          }
          while (v3);
        }

        [v34[3] removeAllObjects];
      }
      if (!*(unsigned char *)(a1 + 48)) {
        goto LABEL_27;
      }
      unsigned int v20 = sub_1000284F8();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        id v22 = v34[1];
        id v21 = v34[2];
        *(_DWORD *)buf = 136315394;
        *(void *)&buf[4] = v22;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v21;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "#I %s %@ END RAW DUMP", buf, 0x16u);
      }

      char v23 = [*(id *)(a1 + 40) all];
      [v23 removeObjectForKey:*v25];
    }
    else
    {
      char v23 = sub_1000284F8();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        sub_100080864(v25, v23);
      }
    }

LABEL_27:
    return;
  }
  char v24 = sub_1000284F8();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
    sub_100080820(v24);
  }
}

void sub_100028BD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,void *a28)
{
  _Unwind_Resume(a1);
}

void sub_100028DB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100028DEC(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id v2 = [*(id *)(a1 + 40) all];
    id v3 = [v2 objectForKey:*(void *)(a1 + 32)];

    if (!v3)
    {
      uint64_t v4 = objc_opt_new();
      *(void *)(v4 + 8) = *(void *)(a1 + 64);
      objc_storeStrong((id *)(v4 + 16), *(id *)(a1 + 48));
      unsigned int v5 = [*(id *)(a1 + 40) all];
      [v5 setObject:v4 forKey:*(void *)(a1 + 32)];

      unint64_t v6 = sub_1000284F8();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = *(void *)(v4 + 8);
        uint64_t v8 = *(void *)(v4 + 16);
        int v13 = 136315394;
        uint64_t v14 = v7;
        __int16 v15 = 2112;
        uint64_t v16 = v8;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#I %s %@ START RAW DUMP", (uint8_t *)&v13, 0x16u);
      }

      id v3 = v4;
    }
    Class isa = v3[3].isa;
    if (!isa)
    {
      uint64_t v10 = objc_opt_new();
      Class v11 = v3[3].isa;
      v3[3].Class isa = (Class)v10;

      Class isa = v3[3].isa;
    }
    id v12 = [[NS_data_block alloc] initType:*(void *)(a1 + 72) data:*(void *)(a1 + 56)];
    [(objc_class *)isa addObject:v12];
  }
  else
  {
    id v3 = sub_1000284F8();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_100080820(v3);
    }
  }
}

void sub_100028FA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000290C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100029144()
{
  if (qword_1000E0878 != -1) {
    dispatch_once(&qword_1000E0878, &stru_1000C1B48);
  }
}

void sub_10002916C(id a1)
{
  id v1 = +[_VVMFLogInterceptor sharedInstance];
}

void sub_100029194(id a1)
{
  os_log_t v1 = os_log_create("com.apple.voicemail", "IMAP.raw");
  id v2 = (void *)qword_1000E0880;
  qword_1000E0880 = (uint64_t)v1;
}

void sub_1000291DC()
{
}

__n128 sub_1000291F0(uint64_t a1)
{
  id v2 = (char *)operator new(0x18uLL);
  *(void *)id v2 = off_1000C1B98;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 sub_10002923C(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = off_1000C1B98;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

void sub_10002926C(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = sub_1000284F8();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(**(void **)(a1 + 8) + 8);
    uint64_t v6 = **(void **)(a1 + 16);
    if (*((char *)a2 + 23) >= 0) {
      uint64_t v7 = a2;
    }
    else {
      uint64_t v7 = (uint64_t *)*a2;
    }
    int v8 = 136316162;
    uint64_t v9 = v5;
    __int16 v10 = 2080;
    Class v11 = " ";
    __int16 v12 = 2114;
    uint64_t v13 = v6;
    __int16 v14 = 2080;
    __int16 v15 = " ";
    __int16 v16 = 2080;
    id v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#I %s%s%{public}@%s%s", (uint8_t *)&v8, 0x34u);
  }
}

uint64_t sub_10002936C(uint64_t a1, uint64_t a2)
{
  if (sub_10000743C(a2, (uint64_t)&off_1000C1BF8)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

_UNKNOWN **sub_1000293AC()
{
  return &off_1000C1BF8;
}

id sub_1000293B8(void *a1)
{
  id v1 = a1;
  id v2 = [v1 domain];
  unsigned int v3 = [v2 isEqualToString:MFMessageErrorDomain];

  uint64_t v4 = v1;
  if (v3)
  {
    uint64_t v5 = (char *)[v1 code];
    if ((unint64_t)(v5 - 1028) >= 0x12) {
      uint64_t v6 = 5001;
    }
    else {
      uint64_t v6 = qword_1000A7190[(void)(v5 - 1028)];
    }
    uint64_t v7 = [v1 localizedDescription];
    uint64_t v4 = +[NSError errorWithDomain:kVVErrorDomain code:v6 localizedDescription:v7];
  }
  return v4;
}

void sub_100029498(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000295C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_1000295DC()
{
  if (qword_1000E08A0 != -1) {
    dispatch_once(&qword_1000E08A0, &stru_1000C1C78);
  }
  int v0 = (void *)qword_1000E0898;
  return v0;
}

void sub_10002974C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002987C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100029AA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100029C54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100029CFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100029DA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100029EF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002A134(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  __int16 v10 = v9;

  a9.super_class = (Class)IMAPServiceActivityController;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_10002A324(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002A540(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002A67C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002A758(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 24));

  unsigned int v3 = sub_1000295DC();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (WeakRetained)
  {
    if (v4)
    {
      uint64_t v5 = a1[5];
      uint64_t v6 = *(void *)(a1[4] + 48);
      uint64_t v7 = a1[6];
      int v13 = 136315906;
      uint64_t v14 = v6;
      __int16 v15 = 2080;
      __int16 v16 = " ";
      __int16 v17 = 2112;
      uint64_t v18 = v5;
      __int16 v19 = 2112;
      uint64_t v20 = v7;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#I %s%s[IVM] ACTIVITY: %@ %@", (uint8_t *)&v13, 0x2Au);
    }

    unsigned int v3 = +[NSNotificationCenter defaultCenter];
    uint64_t v8 = a1[5];
    id v9 = objc_loadWeakRetained((id *)(a1[4] + 24));
    [v3 postNotificationName:v8 object:v9 userInfo:a1[6]];
  }
  else if (v4)
  {
    uint64_t v10 = a1[5];
    uint64_t v11 = *(void *)(a1[4] + 48);
    uint64_t v12 = a1[6];
    int v13 = 136315906;
    uint64_t v14 = v11;
    __int16 v15 = 2080;
    __int16 v16 = " ";
    __int16 v17 = 2112;
    uint64_t v18 = v10;
    __int16 v19 = 2112;
    uint64_t v20 = v12;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#W %s%s[IVM] service gone, do NOT _postNotificationName: %@ %@", (uint8_t *)&v13, 0x2Au);
  }
}

void sub_10002A900(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002ACAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002B2FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,void *a21,void *a22)
{
  _Unwind_Resume(a1);
}

void sub_10002B5A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002B754(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002BA0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002BC28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002BC70(id a1)
{
  os_log_t v1 = os_log_create("com.apple.voicemail", "actv.ctr");
  id v2 = (void *)qword_1000E0898;
  qword_1000E0898 = (uint64_t)v1;
}

id sub_10002BF54()
{
  if (qword_1000E08B0 != -1) {
    dispatch_once(&qword_1000E08B0, &stru_1000C1C98);
  }
  int v0 = (void *)qword_1000E08A8;
  return v0;
}

void sub_10002C32C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.voicemail", "imap.svc.store");
  id v2 = (void *)qword_1000E08A8;
  qword_1000E08A8 = (uint64_t)v1;
}

void sub_10002C454(uint64_t a1)
{
  id v2 = objc_alloc_init(VMVoicemailTranscriptionTask);
  uint64_t v3 = *(void *)(a1 + 32);
  BOOL v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = v2;

  id v5 = [*(id *)(a1 + 32) transcriptionController];
  [*(id *)(*(void *)(a1 + 32) + 8) setTranscriptionController:v5];
}

void sub_10002C7BC(uint64_t a1)
{
  id v2 = vm_vmd_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int16 v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Loading transcription service.", v16, 2u);
  }

  if (+[VMTranscriptionService isTranscriptionAvailable])
  {
    uint64_t v3 = +[NSLocale currentLocale];
    BOOL v4 = [v3 languageIdentifier];

    if (!v4)
    {
      uint64_t v6 = vm_vmd_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int16 v16 = 0;
        uint64_t v8 = "System locale is nil.";
        id v9 = v6;
        uint32_t v10 = 2;
        goto LABEL_12;
      }
LABEL_13:

      uint64_t v11 = [VMVoicemailTranscriptionController alloc];
      uint64_t v12 = +[VMConfiguration localeForTranscriptionLanguage];
      int v13 = [(VMVoicemailTranscriptionController *)v11 initWithLocale:v12];

      if (v13)
      {
        [v13 requestDatabaseSanitization];
        [v13 requestAssetModelInstallation];
      }
      objc_msgSend(*(id *)(a1 + 32), "setTranscriptionController:", v13, *(_OWORD *)v16);
      goto LABEL_21;
    }
    unsigned int v5 = [(id)objc_opt_class() isSupportedTranscriptionLanguageCode:v4];
    uint64_t v6 = vm_vmd_log();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v7)
      {
        *(_DWORD *)__int16 v16 = 138412290;
        *(void *)&v16[4] = v4;
        uint64_t v8 = "loadTranscriptionService: Transcription is supported for language %@.";
        id v9 = v6;
        uint32_t v10 = 12;
LABEL_12:
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v8, v16, v10);
        goto LABEL_13;
      }
      goto LABEL_13;
    }
    if (v7)
    {
      *(_DWORD *)__int16 v16 = 138412290;
      *(void *)&v16[4] = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "loadTranscriptionService: Transcription is not supported for language %@.", v16, 0xCu);
    }
  }
  else
  {
    BOOL v4 = vm_vmd_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int16 v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Transcription is not enabled.", v16, 2u);
    }
  }

  int v13 = vm_vmd_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int16 v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Loading transcription service was aborted.", v16, 2u);
  }
LABEL_21:

  uint64_t v14 = +[NSNotificationCenter defaultCenter];
  [v14 addObserver:*(void *)(a1 + 32) selector:"handleNSCurrentLocaleDidChangeNotification:" name:NSCurrentLocaleDidChangeNotification object:0];

  __int16 v15 = +[NSNotificationCenter defaultCenter];
  [v15 addObserver:*(void *)(a1 + 32) selector:"handleAFLanguageCodeDidChangeNotification:" name:AFLanguageCodeDidChangeNotification object:0];
}

id sub_10002CB58(uint64_t a1)
{
  id v2 = vm_vmd_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Unloading transcription service.", v6, 2u);
  }

  uint64_t v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:*(void *)(a1 + 32) name:AFLanguageCodeDidChangeNotification object:0];

  BOOL v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:*(void *)(a1 + 32) name:NSCurrentLocaleDidChangeNotification object:0];

  [*(id *)(a1 + 32) setTranscriptionController:0];
  return [*(id *)(a1 + 32) setTranscriptionTask:0];
}

void sub_10002CDB4(uint64_t a1)
{
  uint64_t v2 = VMStoreCopyRecordWithIdentifier();
  if (v2)
  {
    uint64_t v3 = (const void *)v2;
    BOOL v4 = (void *)VMStoreRecordCopyDataPath();
    int Duration = VMStoreRecordGetDuration((uint64_t)v3);
    if ([v4 length])
    {
      id v6 = +[NSURL fileURLWithPath:v4 isDirectory:0];
      if (v6) {
        BOOL v7 = Duration < 1;
      }
      else {
        BOOL v7 = 1;
      }
      if (!v7)
      {
        v38[0] = _NSConcreteStackBlock;
        v38[1] = 3221225472;
        v38[2] = sub_10002D23C;
        v38[3] = &unk_1000C1CE0;
        v38[4] = *(void *)(a1 + 32);
        int v39 = *(_DWORD *)(a1 + 56);
        id v29 = objc_retainBlock(v38);
        v36[0] = _NSConcreteStackBlock;
        v36[1] = 3221225472;
        v36[2] = sub_10002D39C;
        v36[3] = &unk_1000C1D30;
        v36[4] = *(void *)(a1 + 32);
        int v37 = *(_DWORD *)(a1 + 56);
        uint64_t v8 = objc_retainBlock(v36);
        v30[0] = _NSConcreteStackBlock;
        v30[1] = 3221225472;
        v30[2] = sub_10002DB18;
        v30[3] = &unk_1000C1D80;
        v30[4] = *(void *)(a1 + 32);
        int v35 = *(_DWORD *)(a1 + 56);
        id v6 = v6;
        uint64_t v9 = *(void *)(a1 + 48);
        id v31 = v6;
        uint64_t v34 = v9;
        id v28 = v8;
        id v32 = v28;
        id v33 = *(id *)(a1 + 40);
        uint32_t v10 = objc_retainBlock(v30);
        int Flags = VMStoreRecordGetFlags((uint64_t)v3);
        uint64_t v12 = [*(id *)(a1 + 32) transcriptionController];

        if (v12)
        {
          int v13 = objc_msgSend(*(id *)(a1 + 32), "transcriptionController", v28);
          unsigned int v14 = [v13 isDictationModelInstalled];

          if (v14) {
            uint64_t v15 = Flags & 0xFFFF66FF;
          }
          else {
            uint64_t v15 = Flags & 0xFFFF66FF | 0x8000;
          }
        }
        else
        {
          uint64_t v15 = Flags & 0xFFFEE6FF | 0x10000;
        }
        id v22 = VMStoreRecordGetLabel((uint64_t)v3);
        VMStoreRecordSetFlags(v22, v3, v15);
        VMStoreSave();
        char v23 = [*(id *)(a1 + 32) transcriptionController];

        if (v23)
        {
          char v24 = [*(id *)(a1 + 32) transcriptionController];
          uint64_t v25 = *(void *)(a1 + 48);
          unint64_t v26 = v29;
          [v24 retrieveDictationResultForFileAtURL:v6 queuePriority:v25 duration:v29 transcriptionBeginCallback:v10 completion:(double)Duration];
        }
        else
        {
          char v27 = vm_vmd_log();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v41 = v22;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Transcription service is disabled, not transcribing %@", buf, 0xCu);
          }

          ((void (*)(void *, void, void))v10[2])(v10, 0, 0);
          unint64_t v26 = v29;
        }

LABEL_27:
        CFRelease(v3);

        return;
      }
    }
    else
    {
      id v6 = 0;
    }
    __int16 v19 = vm_vmd_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = VMStoreRecordGetLabel((uint64_t)v3);
      *(_DWORD *)buf = 138412290;
      v41 = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "dataURL is empty or duration is 0, not transcribing %@", buf, 0xCu);
    }
    uint64_t v21 = *(void *)(a1 + 40);
    if (v21) {
      (*(void (**)(uint64_t, void))(v21 + 16))(v21, 0);
    }
    goto LABEL_27;
  }
  __int16 v16 = vm_vmd_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = *(_DWORD *)(a1 + 56);
    *(_DWORD *)buf = 67109120;
    LODWORD(v41) = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Record deleted before processing began for VM with identifier %d", buf, 8u);
  }

  uint64_t v18 = *(void *)(a1 + 40);
  if (v18) {
    (*(void (**)(uint64_t, void))(v18 + 16))(v18, 0);
  }
}

void sub_10002D23C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002D2CC;
  block[3] = &unk_1000C1CB8;
  int v4 = *(_DWORD *)(a1 + 40);
  dispatch_async(v2, block);
}

void sub_10002D2CC()
{
  uint64_t v0 = VMStoreCopyRecordWithIdentifier();
  if (v0)
  {
    os_log_t v1 = (const void *)v0;
    uint64_t v2 = VMStoreRecordGetFlags(v0) & 0xFFFE7DFF | 0x200;
    VMStoreRecordGetLabel((uint64_t)v1);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    VMStoreRecordSetFlags(v4, v1, v2);
    VMStoreSave();
    CFRelease(v1);
  }
  else
  {
    uint64_t v3 = vm_vmd_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Record deleted during transcribe operation, not setting transcribing flag.", buf, 2u);
    }
  }
}

void sub_10002D39C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  BOOL v7 = [*(id *)(a1 + 32) queue];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10002D480;
  v10[3] = &unk_1000C1D08;
  int v13 = *(_DWORD *)(a1 + 40);
  v10[4] = *(void *)(a1 + 32);
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, v10);
}

void sub_10002D480(uint64_t a1)
{
  uint64_t v2 = a1 + 56;
  uint64_t v3 = VMStoreCopyRecordWithIdentifier();
  if (v3)
  {
    id v4 = (const void *)v3;
    uint64_t v67 = v2;
    id v5 = +[NSLocale currentLocale];
    id v6 = [v5 localeIdentifier];

    BOOL v7 = [*(id *)(a1 + 32) transcriptionController];
    id v8 = [v7 getTranscriptionLocaleIdentifier];

    id v9 = objc_alloc_init((Class)NSMutableDictionary);
    uint32_t v10 = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 56)];
    [v9 setObject:v10 forKeyedSubscript:@"vmIdentifier"];

    id v11 = *(void **)(a1 + 32);
    id v12 = (void *)VMStoreRecordCopyTranscriptionPath();
    int v13 = [v11 readDataFromFile:v12];

    if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      [v13 confidence];
      v79 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      objc_msgSend(v9, "setObject:forKeyedSubscript:");
      id v14 = [v13 confidenceRating];
      BOOL v15 = (unint64_t)v14 > 1;
      if ((unint64_t)v14 <= 1) {
        __int16 v16 = &off_1000C8570;
      }
      else {
        __int16 v16 = 0;
      }
    }
    else
    {
      int v17 = vm_vmd_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_1000809C0(v67, v17, v18, v19, v20, v21, v22, v23);
      }

      [v9 setObject:&off_1000C8588 forKeyedSubscript:@"transcriptionConfidence"];
      v79 = 0;
      BOOL v15 = 0;
      __int16 v16 = &off_1000C85A0;
    }
    char v24 = *(void **)(a1 + 40);
    if (v24)
    {
      v73 = v6;
      v74 = v16;
      BOOL v76 = v15;
      v70 = v13;
      v71 = v8;
      v72 = v4;
      uint64_t v25 = [v24 dominantLocale];
      uint64_t v26 = [v25 languageIdentifier];

      char v27 = vm_vmd_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v28 = *(void *)(a1 + 40);
        int v29 = *(_DWORD *)(a1 + 56);
        *(_DWORD *)buf = 138412802;
        uint64_t v86 = v28;
        __int16 v87 = 2112;
        uint64_t v88 = v26;
        __int16 v89 = 1024;
        int v90 = v29;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Language ID result:'%@' Dominant Locale: '%@' for voicemail with identifier %d", buf, 0x1Cu);
      }

      long long v30 = [*(id *)(a1 + 40) detectedLanguageCode];
      id v31 = [v30 isEqualToString:@"en"];

      char v68 = (char)v31;
      id v32 = +[NSNumber numberWithInt:v31];
      [v9 setObject:v32 forKeyedSubscript:@"isEnglish"];

      v78 = v9;
      v69 = v26;
      [v9 setObject:v26 forKeyedSubscript:@"detectedDominantLocale"];
      id v33 = +[NSMutableDictionary dictionary];
      long long v80 = 0u;
      long long v81 = 0u;
      long long v82 = 0u;
      long long v83 = 0u;
      uint64_t v34 = [*(id *)(a1 + 40) alternatives];
      id v35 = [v34 countByEnumeratingWithState:&v80 objects:v84 count:16];
      if (v35)
      {
        id v36 = v35;
        uint64_t v37 = *(void *)v81;
        do
        {
          for (i = 0; i != v36; i = (char *)i + 1)
          {
            if (*(void *)v81 != v37) {
              objc_enumerationMutation(v34);
            }
            int v39 = *(void **)(*((void *)&v80 + 1) + 8 * i);
            [v39 confidence];
            v40 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
            v41 = [v39 locale];
            uint64_t v42 = [v41 localeIdentifier];
            [v33 setObject:v40 forKeyedSubscript:v42];
          }
          id v36 = [v34 countByEnumeratingWithState:&v80 objects:v84 count:16];
        }
        while (v36);
      }

      if ([v33 count]) {
        [v78 setObject:v33 forKeyedSubscript:@"altLocaleDict"];
      }
      v43 = +[VMAWDReporter sharedInstance];
      v44 = [v78 objectForKeyedSubscript:@"altLocaleDict"];
      v45 = v69;
      v46 = [v44 objectForKeyedSubscript:v69];
      v47 = [v78 objectForKeyedSubscript:@"altLocaleDict"];
      LOBYTE(v66) = v68;
      id v6 = v73;
      id v8 = v71;
      [v43 reportVoicemailProcessed:v73 transcriptionSuccess:v76 transcriptionFailureReason:v74 assetLocale:v71 transcriptionConfidence:v79 lidSuccess:1 lidFailureReason:0 isEnglish:v66 dominantLocale:v69 dominantLocaleConfidence:v46 altLocaleDict:v47];

      id v9 = v78;
      id v4 = v72;
      int v13 = v70;
    }
    else
    {
      if (!*(void *)(a1 + 48))
      {
LABEL_30:
        v57 = (void *)VMStoreRecordCopySummarizationPath();
        if (([*(id *)(a1 + 32) writeDataToFile:v57 fileData:v9] & 1) == 0)
        {
          v58 = vm_vmd_log();
          if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR)) {
            sub_1000808E0(v67, v58, v59, v60, v61, v62, v63, v64);
          }
        }
        CFRelease(v4);

        int v48 = 1;
        goto LABEL_35;
      }
      BOOL v77 = v15;
      v75 = v16;
      v49 = +[VMAWDReporter sharedInstance];
      v50 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [*(id *)(a1 + 32) languageIDFailureReasonForError:*(void *)(a1 + 48)]);
      LOBYTE(v66) = 0;
      [v49 reportVoicemailProcessed:v6 transcriptionSuccess:v77 transcriptionFailureReason:v75 assetLocale:v8 transcriptionConfidence:v79 lidSuccess:0 lidFailureReason:v50 isEnglish:v66 dominantLocale:0 dominantLocaleConfidence:0 altLocaleDict:0];

      v45 = vm_vmd_log();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
        sub_100080950(a1 + 48, v45, v51, v52, v53, v54, v55, v56);
      }
    }

    goto LABEL_30;
  }
  id v6 = vm_vmd_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Record deleted during Language ID operation, ignoring LID result.", buf, 2u);
  }
  int v48 = 0;
LABEL_35:

  v65 = vm_vmd_log();
  if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v86) = v48;
    _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "Exiting LID Completion handler. Finished? %d", buf, 8u);
  }
}

void sub_10002DB18(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  BOOL v7 = [*(id *)(a1 + 32) queue];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10002DC3C;
  v13[3] = &unk_1000C1D58;
  int v20 = *(_DWORD *)(a1 + 72);
  id v8 = *(void **)(a1 + 40);
  v13[4] = *(void *)(a1 + 32);
  id v14 = v5;
  id v15 = v6;
  id v9 = v8;
  uint64_t v10 = *(void *)(a1 + 64);
  id v16 = v9;
  uint64_t v19 = v10;
  id v17 = *(id *)(a1 + 48);
  id v18 = *(id *)(a1 + 56);
  id v11 = v6;
  id v12 = v5;
  dispatch_async(v7, v13);
}

uint64_t sub_10002DC3C(uint64_t a1)
{
  uint64_t v2 = a1 + 88;
  uint64_t v3 = VMStoreCopyRecordWithIdentifier();
  if (v3)
  {
    id v4 = (const void *)v3;
    id v5 = VMStoreRecordGetLabel(v3);
    id v6 = +[NSLocale currentLocale];
    BOOL v7 = [v6 localeIdentifier];

    id v8 = [*(id *)(a1 + 32) transcriptionController];
    id v9 = [v8 getTranscriptionLocaleIdentifier];

    if (!*(void *)(a1 + 40))
    {
      if (!*(void *)(a1 + 48))
      {
        id v22 = 0;
LABEL_29:
        uint64_t v51 = +[VMAWDReporter sharedInstance];
        [v51 reportVoicemailTranscriptionAttempted];

        int Flags = VMStoreRecordGetFlags((uint64_t)v4);
        VMStoreRecordSetFlags(v5, v4, Flags & 0xFFFF6DFF | 0x1000);
        VMStoreSave();
        LODWORD(v51) = _os_feature_enabled_impl();
        uint64_t v53 = vm_vmd_log();
        BOOL v54 = os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT);
        if (v51)
        {
          if (v54)
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "processTranscriptForRecordWithIdentifier: Flag languageIDEnabled enabled.", buf, 2u);
          }

          id v55 = [*(id *)(a1 + 32) transcriptionController];
          [v55 retrieveLanguageIDResultForFileAtURL:*(void *)(a1 + 56) queuePriority:*(void *)(a1 + 80) completion:*(void *)(a1 + 64)];
        }
        else
        {
          v71 = v9;
          uint64_t v56 = v7;
          if (v54)
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "VMTranscriptionControllerCompletion: Preparing voicemail metadata", buf, 2u);
          }

          id v55 = objc_alloc_init((Class)NSMutableDictionary);
          v58 = *(void **)(a1 + 40);
          if (v58) {
            [v58 confidence];
          }
          else {
            LODWORD(v57) = -1.0;
          }
          uint64_t v59 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v57, v71);
          [v55 setObject:v59 forKeyedSubscript:@"Transcription Confidence"];

          uint64_t v60 = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 88)];
          [v55 setObject:v60 forKeyedSubscript:@"vmIdentifier"];

          uint64_t v61 = (void *)VMStoreRecordCopySummarizationPath();
          if (([*(id *)(a1 + 32) writeDataToFile:v61 fileData:v55] & 1) == 0)
          {
            uint64_t v62 = vm_vmd_log();
            if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR)) {
              sub_100080A30(v2, v62, v63, v64, v65, v66, v67, v68);
            }
          }
          BOOL v7 = v56;
          id v9 = v72;
        }

        CFRelease(v4);
        goto LABEL_44;
      }
      uint64_t v23 = +[VMAWDReporter sharedInstance];
      objc_msgSend(v23, "reportVoicemailTranscriptionFailedWithReason:", objc_msgSend(*(id *)(a1 + 32), "transcriptionFailureReasonForError:", *(void *)(a1 + 48)));

      char v24 = +[VMAWDReporter sharedInstance];
      uint64_t v25 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [*(id *)(a1 + 32) transcriptionFailureReasonForError:*(void *)(a1 + 48)]);
      [v24 reportVoicemailTranscriptionProcessed:v7 success:0 reason:v25 assetLocale:v9 confidence:0];

      uint64_t v26 = vm_vmd_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        sub_100080AA0(a1 + 48, v26, v27, v28, v29, v30, v31, v32);
      }
      id v22 = 0;
LABEL_28:

      goto LABEL_29;
    }
    uint64_t v10 = vm_vmd_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = *(void **)(a1 + 40);
      [v11 confidence];
      *(_DWORD *)buf = 138412546;
      v75 = v11;
      __int16 v76 = 2048;
      double v77 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Dictation result was: '%@', confidence %f", buf, 0x16u);
    }

    id v13 = [*(id *)(a1 + 40) confidenceRating];
    id v14 = +[VMAWDReporter sharedInstance];
    id v15 = v14;
    if ((unint64_t)v13 < 2)
    {
      [v14 reportVoicemailTranscriptionFailedWithReason:2];

      id v16 = +[VMAWDReporter sharedInstance];
      [*(id *)(a1 + 40) confidence];
      id v17 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      uint64_t v21 = &off_1000C8570;
      id v18 = v16;
      uint64_t v19 = v7;
      uint64_t v20 = 0;
    }
    else
    {
      [v14 reportVoicemailTranscriptionCompleted];

      id v16 = +[VMAWDReporter sharedInstance];
      [*(id *)(a1 + 40) confidence];
      id v17 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      id v18 = v16;
      uint64_t v19 = v7;
      uint64_t v20 = 1;
      uint64_t v21 = 0;
    }
    [v18 reportVoicemailTranscriptionProcessed:v19 success:v20 reason:v21 assetLocale:v9 confidence:v17];

    uint64_t v26 = VMStoreRecordCopyTranscriptionPath();
    if ([v26 length])
    {
      id v33 = +[NSURL fileURLWithPath:v26 isDirectory:0];
      if (v33)
      {
        v70 = v9;
        uint64_t v34 = v7;
        id v35 = [*(id *)(a1 + 40) archivedData];
        id v73 = 0;
        id v22 = [v35 writeToURL:v33 options:268435457 error:&v73];
        id v36 = v73;

        if (v22)
        {
          VMStoreRecordSetFlag(v5, v4, 0x100u);
        }
        else
        {
          v44 = vm_vmd_log();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
            sub_100080B48((uint64_t)v36, v44, v45, v46, v47, v48, v49, v50);
          }
        }
        BOOL v7 = v34;
        id v9 = v70;
        goto LABEL_27;
      }
    }
    else
    {
      id v33 = vm_vmd_log();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
        sub_100080B10(v33, v37, v38, v39, v40, v41, v42, v43);
      }
    }
    id v22 = 0;
LABEL_27:

    goto LABEL_28;
  }
  id v5 = vm_vmd_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Record deleted during transcribe operation, ignoring transcript result.", buf, 2u);
  }
  id v22 = 0;
LABEL_44:

  uint64_t result = *(void *)(a1 + 72);
  if (result) {
    return (*(uint64_t (**)(uint64_t, id))(result + 16))(result, v22);
  }
  return result;
}

void sub_10002E408(uint64_t a1)
{
  id v4 = (id)VMStoreRecordCopyDataPath();
  if ([v4 length])
  {
    uint64_t v2 = +[NSURL fileURLWithPath:v4 isDirectory:0];
    if (v2)
    {
      uint64_t v3 = [*(id *)(a1 + 32) transcriptionController];
      [v3 reportDictationProblemForFileAtURL:v2];
    }
  }
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

void sub_10002E550(uint64_t a1)
{
  uint64_t v2 = vm_vmd_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if (*(unsigned char *)(a1 + 40)) {
      CFStringRef v4 = @"YES";
    }
    else {
      CFStringRef v4 = @"NO";
    }
    int v8 = 138412546;
    CFStringRef v9 = v4;
    __int16 v10 = 2112;
    uint64_t v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Reporting transcription marked accurate (%@) for record %@", (uint8_t *)&v8, 0x16u);
  }

  int Flags = VMStoreRecordGetFlags(*(void *)(a1 + 32));
  id v6 = VMStoreRecordGetLabel(*(void *)(a1 + 32));
  VMStoreRecordSetFlag(v6, *(const void **)(a1 + 32), Flags | 0x800);
  VMStoreSave();
  BOOL v7 = +[VMAWDReporter sharedInstance];
  [v7 reportVoicemailTranscriptionRatedAccurate:*(unsigned __int8 *)(a1 + 40)];

  CFRelease(*(CFTypeRef *)(a1 + 32));
}

id sub_10002E734(uint64_t a1)
{
  uint64_t v2 = vm_vmd_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = objc_opt_class();
    CFStringRef v4 = *(void **)(a1 + 40);
    id v5 = v3;
    id v6 = [v4 name];
    int v8 = 138412546;
    CFStringRef v9 = v3;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%@ is handling <%@>", (uint8_t *)&v8, 0x16u);
  }
  [*(id *)(a1 + 32) unloadTranscriptionService];
  return [*(id *)(a1 + 32) loadTranscriptionService];
}

id sub_10002E8E8(uint64_t a1)
{
  uint64_t v2 = vm_vmd_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = objc_opt_class();
    CFStringRef v4 = *(void **)(a1 + 40);
    id v5 = v3;
    id v6 = [v4 name];
    int v8 = 138412546;
    CFStringRef v9 = v3;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%@ is handling <%@>", (uint8_t *)&v8, 0x16u);
  }
  [*(id *)(a1 + 32) unloadTranscriptionService];
  return [*(id *)(a1 + 32) loadTranscriptionService];
}

void sub_10002F004(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_10002F020(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

id sub_10002F430()
{
  if (qword_1000E08E0 != -1) {
    dispatch_once(&qword_1000E08E0, &stru_1000C1EB8);
  }
  uint64_t v0 = (void *)qword_1000E08D8;
  return v0;
}

id sub_10002F484(uint64_t a1)
{
  return [*(id *)(a1 + 32) loadAllNotifications];
}

id sub_10002F578(uint64_t a1)
{
  id v2 = objc_alloc((Class)NSXPCListener);
  id v3 = [v2 initWithMachServiceName:VMXPCMachServiceName];
  CFStringRef v4 = (void *)qword_1000E08B8;
  qword_1000E08B8 = (uint64_t)v3;

  id v5 = (void *)qword_1000E08B8;
  id v6 = [*(id *)(a1 + 32) queue];
  [v5 _setQueue:v6];

  uint64_t v7 = *(void *)(a1 + 32);
  int v8 = (void *)qword_1000E08B8;
  return [v8 setDelegate:v7];
}

void sub_10002FC58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10002FC7C(id *a1)
{
  id v2 = [a1[4] queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002FD50;
  block[3] = &unk_1000C1E28;
  id v4 = a1[5];
  objc_copyWeak(&v6, a1 + 7);
  id v5 = a1[6];
  dispatch_async(v2, block);

  objc_destroyWeak(&v6);
}

void sub_10002FD50(uint64_t a1)
{
  id v2 = sub_10002F430();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v6 = 136315650;
    uint64_t v7 = "";
    __int16 v8 = 2080;
    uint64_t v9 = "";
    __int16 v10 = 2112;
    uint64_t v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "#I %s%sClient XPC connection %@ interrupted/invalid", (uint8_t *)&v6, 0x20u);
  }

  [*(id *)(a1 + 32) invalidate];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = [WeakRetained clients];
  [v5 removeObject:*(void *)(a1 + 40)];
}

void sub_100031BC4(id a1)
{
  os_log_t v1 = objc_alloc_init(VMDaemon);
  id v2 = (void *)qword_1000E08C8;
  qword_1000E08C8 = (uint64_t)v1;
}

void sub_100031F84(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) voicemailService];
  objc_msgSend(v1, "full_start");
}

void sub_100031FC8(uint64_t a1, void *a2)
{
  id v3 = a2;
  string = xpc_dictionary_get_string(v3, "Name");
  id v5 = xpc_dictionary_get_value(v3, "UserInfo");

  int v6 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  if (string
    && (+[NSString stringWithUTF8String:string],
        (uint64_t v7 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    __int16 v8 = v7;
    [*(id *)(a1 + 32) executeHandlerForNotificationWithName:v7 info:v6];
  }
  else
  {
    __int16 v8 = sub_10002F430();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136316162;
      uint64_t v11 = "";
      __int16 v12 = 2080;
      id v13 = "";
      __int16 v14 = 2112;
      id v15 = (id)objc_opt_class();
      __int16 v16 = 2112;
      uint64_t v17 = 0;
      __int16 v18 = 2112;
      uint64_t v19 = v6;
      id v9 = v15;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#W %s%s%@ event stream handler can't handle notification %@ with user info %@.", (uint8_t *)&v10, 0x34u);
    }
  }
}

void sub_1000321BC(uint64_t a1)
{
  id v2 = sub_10002F430();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v3 = [*(id *)(a1 + 32) locked];
    CFStringRef v4 = @"NO";
    int v6 = 136315650;
    uint64_t v7 = "";
    if (v3) {
      CFStringRef v4 = @"YES";
    }
    __int16 v8 = 2080;
    id v9 = "";
    __int16 v10 = 2112;
    CFStringRef v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "#I %s%svmd daemon locked = %@", (uint8_t *)&v6, 0x20u);
  }

  id v5 = [*(id *)(a1 + 32) voicemailService];
  [v5 startXpc];
}

void sub_10003251C(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) locked];
  unsigned int v3 = *(void **)(a1 + 32);
  if (v2) {
    [v3 telephonyService];
  }
  else {
  id v4 = [v3 voicemailService];
  }
  [v4 executeHandlerForNotificationWithName:*(void *)(a1 + 40) info:*(void *)(a1 + 48)];
}

void sub_1000326E4(uint64_t a1)
{
  unsigned __int8 v8 = 0;
  id v1 = objc_msgSend(*(id *)(a1 + 32), "unlock_if_needed:", &v8);
  if (!v1)
  {
    int v6 = v8;
    unsigned int v2 = sub_10002F430();
    BOOL v7 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (!v7) {
        goto LABEL_11;
      }
      *(_DWORD *)buf = 136315394;
      __int16 v10 = "";
      __int16 v11 = 2080;
      __int16 v12 = "";
      unsigned int v3 = "#I %s%skVMDeviceUnlockedNotification unlocked the daemon";
    }
    else
    {
      if (!v7) {
        goto LABEL_11;
      }
      *(_DWORD *)buf = 136315394;
      __int16 v10 = "";
      __int16 v11 = 2080;
      __int16 v12 = "";
      unsigned int v3 = "#I %s%skVMDeviceUnlockedNotification happened but daemon was already unlocked";
    }
    id v4 = v2;
    uint32_t v5 = 22;
    goto LABEL_10;
  }
  unsigned int v2 = sub_10002F430();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v10 = "";
    __int16 v11 = 2080;
    __int16 v12 = "";
    __int16 v13 = 2112;
    __int16 v14 = v1;
    unsigned int v3 = "#W %s%sUnable to first unlock the device: %@";
    id v4 = v2;
    uint32_t v5 = 32;
LABEL_10:
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, v3, buf, v5);
  }
LABEL_11:
}

void sub_100032930(id a1)
{
  os_log_t v1 = os_log_create("com.apple.voicemail", "main.dmn");
  unsigned int v2 = (void *)qword_1000E08D8;
  qword_1000E08D8 = (uint64_t)v1;
}

id sub_100032AFC()
{
  if (qword_1000E08F0 != -1) {
    dispatch_once(&qword_1000E08F0, &stru_1000C1F80);
  }
  uint64_t v0 = (void *)qword_1000E08E8;
  return v0;
}

void sub_100033AB0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.voicemail", "imap.gre.store");
  unsigned int v2 = (void *)qword_1000E08E8;
  qword_1000E08E8 = (uint64_t)v1;
}

void sub_100033B48(id a1)
{
  os_log_t v1 = objc_alloc_init(VVMSharedCallStatusObserver);
  unsigned int v2 = (void *)qword_1000E08F8;
  qword_1000E08F8 = (uint64_t)v1;
}

void sub_100033EC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100033F40()
{
  if (qword_1000E0910 != -1) {
    dispatch_once(&qword_1000E0910, &stru_1000C1FE8);
  }
  uint64_t v0 = (void *)qword_1000E0908;
  return v0;
}

void sub_1000340BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  a9.super_class = (Class)VVMSharedCallStatusObserver;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_10003440C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003464C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, os_unfair_lock_t lock, void *a10)
{
  os_unfair_lock_unlock(lock);
  _Unwind_Resume(a1);
}

id sub_100034680(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleCallStatusDisconnected:*(void *)(a1 + 40)];
}

void sub_100034700(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_10003477C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1000347D8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.voicemail", "csd");
  unsigned int v2 = (void *)qword_1000E0908;
  qword_1000E0908 = (uint64_t)v1;
}

void sub_100034BAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100034BC4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100034BD4(uint64_t a1)
{
}

void sub_100034BDC(uint64_t a1)
{
}

void sub_100034CD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100034CF0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = WeakRetained;
}

void sub_100034DD0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
  id v3 = *(id *)(a1 + 40);

  if (WeakRetained != v3)
  {
    id v4 = *(void **)(a1 + 40);
    uint32_t v5 = (id *)(*(void *)(a1 + 32) + 24);
    objc_storeWeak(v5, v4);
  }
}

void sub_100034F28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100034F40(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = WeakRetained;
}

void sub_100035020(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
  id v3 = *(id *)(a1 + 40);

  if (WeakRetained != v3)
  {
    id v4 = *(void **)(a1 + 40);
    uint32_t v5 = (id *)(*(void *)(a1 + 32) + 32);
    objc_storeWeak(v5, v4);
  }
}

id sub_100035420(uint64_t a1, void *a2)
{
  id v3 = [a2 UUID];
  id v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

id sub_100035464(uint64_t a1)
{
  return [*(id *)(a1 + 32) setObject:*(void *)(a1 + 40) atIndexedSubscript:*(void *)(a1 + 48)];
}

id sub_100035474(uint64_t a1)
{
  return [*(id *)(a1 + 32) addObject:*(void *)(a1 + 40)];
}

id sub_1000364A8(uint64_t a1)
{
  return [*(id *)(a1 + 32) accountsDidChangeForAccountDataSource:*(void *)(a1 + 40)];
}

void sub_10003658C(id *a1)
{
  unsigned int v2 = [a1[4] queue];
  dispatch_assert_queue_V2(v2);

  id v3 = objc_msgSend(a1[5], "vmd_notification");
  id v4 = vm_vmd_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v54 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "local_voicemailInfoAvailableNotification: %@", buf, 0xCu);
  }

  uint32_t v5 = [v3 name];
  int v6 = sub_100057110();
  unsigned int v7 = [v5 isEqualToString:v6];

  if (v7)
  {
    unsigned __int8 v8 = vm_vmd_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = objc_opt_class();
      *(_DWORD *)buf = 138412546;
      id v54 = v9;
      __int16 v55 = 2112;
      uint64_t v56 = v3;
      id v10 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@ is handling %@ ", buf, 0x16u);
    }
    id v11 = objc_alloc((Class)NSUUID);
    __int16 v12 = [a1[6] labelID];
    id v13 = [v11 initWithUUIDString:v12];

    id v14 = v13;
    uint64_t v15 = [v3 userInfo];
    __int16 v16 = (void *)v15;
    if (v14 && v15)
    {
      [a1[4] accounts];
      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      id v17 = (id)objc_claimAutoreleasedReturnValue();
      id v18 = [v17 countByEnumeratingWithState:&v48 objects:v52 count:16];
      if (v18)
      {
        id v19 = v18;
        uint64_t v20 = *(void *)v49;
        uint64_t v45 = v16;
        while (2)
        {
          for (i = 0; i != v19; i = (char *)i + 1)
          {
            if (*(void *)v49 != v20) {
              objc_enumerationMutation(v17);
            }
            id v22 = *(void **)(*((void *)&v48 + 1) + 8 * i);
            uint64_t v23 = [v22 UUID];
            unsigned int v24 = [v23 isEqual:v14];

            if (v24)
            {
              id v25 = [v22 copy];
              uint64_t v26 = [a1[4] telephonyClient];
              uint64_t v27 = [a1[6] context];
              id v47 = 0;
              uint64_t v28 = [v26 getShortLabel:v27 error:&v47];
              id v29 = v47;
              [v25 setAbbreviatedAccountDescription:v28];

              uint64_t v30 = [a1[6] label];
              [v25 setAccountDescription:v30];

              uint64_t v31 = [a1[4] telephonyClient];
              uint64_t v32 = [a1[6] context];
              id v46 = v29;
              id v33 = [v31 getMobileSubscriberHomeCountryList:v32 error:&v46];
              id v43 = v46;

              uint64_t v34 = [v33 firstObject];
              [v25 setIsoCountryCode:v34];

              id v35 = vm_vmd_log();
              __int16 v16 = v45;
              if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                id v54 = v25;
                __int16 v55 = 2112;
                uint64_t v56 = v45;
                _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Updating account %@ with carrier information %@ ", buf, 0x16u);
              }

              id v36 = sub_100057150();
              uint64_t v37 = [v45 objectForKeyedSubscript:v36];

              uint64_t v38 = sub_100057130();
              uint64_t v39 = [v45 objectForKeyedSubscript:v38];

              if (v37) {
                objc_msgSend(v25, "setProvisioned:", objc_msgSend(v37, "isEqualToString:", @"NewAccount", v43) ^ 1);
              }
              if (v39)
              {
                id v40 = [objc_alloc((Class)VMHandle) initWithType:1 value:v39];
                [v25 setHandle:v40];
              }
              id v41 = a1[4];
              id v42 = objc_msgSend(v25, "copy", v43);
              [v41 setAccount:v42 forUUID:v14];

              goto LABEL_24;
            }
          }
          id v19 = [v17 countByEnumeratingWithState:&v48 objects:v52 count:16];
          __int16 v16 = v45;
          if (v19) {
            continue;
          }
          break;
        }
      }
LABEL_24:
    }
  }
}

void sub_100036FD0(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) userInfo];
  id v3 = [v2 objectForKeyedSubscript:@"VMCarrierNotificationUserInfoAccountUUID"];
  uint64_t v4 = [v2 objectForKeyedSubscript:@"VMCarrierNotificationUserInfoIMAPParameters"];
  uint32_t v5 = (void *)v4;
  if (v3) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    uint64_t v19 = a1;
    [*(id *)(a1 + 40) accounts];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    id v8 = [v7 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v21;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(v7);
          }
          __int16 v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          id v13 = [v12 UUID];
          unsigned int v14 = [v13 isEqual:v3];

          if (v14)
          {
            id v15 = [v12 copy];
            __int16 v16 = vm_vmd_log();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              id v25 = v15;
              __int16 v26 = 2112;
              uint64_t v27 = v5;
              _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Updating account %@ with IMAP information %@ ", buf, 0x16u);
            }

            [*(id *)(v19 + 40) updateAccount:v15 withDictionary:v5];
            id v17 = *(void **)(v19 + 40);
            id v18 = [v15 copy];
            [v17 setAccount:v18 forUUID:v3];

            goto LABEL_17;
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_17:
  }
}

uint64_t sub_100037924(uint64_t a1, uint64_t a2)
{
  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0;
    while (1)
    {
      unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      BOOL v9 = v5++ >= 9;
      if (v9)
      {
        unint64_t v6 = 0;
        int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0;
    }
LABEL_13:
    if (v10 || (v6 & 7) == 4) {
      break;
    }
    switch((v6 >> 3))
    {
      case 1u:
        char v12 = 0;
        unsigned int v13 = 0;
        uint64_t v14 = 0;
        *(unsigned char *)(a1 + 40) |= 1u;
        while (1)
        {
          unint64_t v15 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v15 == -1 || v15 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
            break;
          }
          char v16 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v15);
          *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v15 + 1;
          v14 |= (unint64_t)(v16 & 0x7F) << v12;
          if ((v16 & 0x80) == 0) {
            goto LABEL_45;
          }
          v12 += 7;
          BOOL v9 = v13++ >= 9;
          if (v9)
          {
            uint64_t v14 = 0;
            goto LABEL_47;
          }
        }
        *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_45:
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v14 = 0;
        }
LABEL_47:
        *(void *)(a1 + 8) = v14;
        continue;
      case 2u:
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        *(unsigned char *)(a1 + 40) |= 2u;
        while (2)
        {
          unint64_t v21 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v21 == -1 || v21 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v22 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v21);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v21 + 1;
            v20 |= (unint64_t)(v22 & 0x7F) << v18;
            if (v22 < 0)
            {
              v18 += 7;
              BOOL v9 = v19++ >= 9;
              if (v9)
              {
                LODWORD(v20) = 0;
                goto LABEL_51;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v20) = 0;
        }
LABEL_51:
        uint64_t v30 = 32;
        goto LABEL_56;
      case 3u:
        char v23 = 0;
        unsigned int v24 = 0;
        uint64_t v20 = 0;
        *(unsigned char *)(a1 + 40) |= 4u;
        break;
      case 4u:
        uint64_t v27 = PBReaderReadString();
        uint64_t v28 = 16;
        goto LABEL_43;
      case 5u:
        uint64_t v27 = PBReaderReadString();
        uint64_t v28 = 24;
LABEL_43:
        id v29 = *(void **)(a1 + v28);
        *(void *)(a1 + v28) = v27;

        continue;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        continue;
    }
    while (1)
    {
      unint64_t v25 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v25 == -1 || v25 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v26 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v25);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v25 + 1;
      v20 |= (unint64_t)(v26 & 0x7F) << v23;
      if ((v26 & 0x80) == 0) {
        goto LABEL_53;
      }
      v23 += 7;
      BOOL v9 = v24++ >= 9;
      if (v9)
      {
        LODWORD(v20) = 0;
        goto LABEL_55;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_53:
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      LODWORD(v20) = 0;
    }
LABEL_55:
    uint64_t v30 = 36;
LABEL_56:
    *(_DWORD *)(a1 + v30) = v20;
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

void sub_100038714(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100038794(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

uint64_t sub_1000387F4()
{
  if (qword_1000E0920 != -1) {
    dispatch_once(&qword_1000E0920, &stru_1000C2078);
  }
  return qword_1000E0918;
}

void sub_100038838(id a1)
{
  qword_1000E0918 = (uint64_t)os_log_create("com.apple.voicemail", "vmstore");
}

void sub_1000390B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
}

void sub_1000390EC(uint64_t a1, uint64_t a2)
{
  char v4 = vm_vmd_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138412546;
    uint64_t v7 = v5;
    __int16 v8 = 2048;
    uint64_t v9 = a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ Asset download progress=%lu ", (uint8_t *)&v6, 0x16u);
  }
}

void sub_1000391AC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = vm_vmd_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v13 = 138412802;
    uint64_t v14 = v8;
    __int16 v15 = 2112;
    id v16 = v5;
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@ Asset download complete with path=%@ error=%@", (uint8_t *)&v13, 0x20u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  int v10 = [WeakRetained progress];
  [v10 setCompletedUnitCount:1];

  if (WeakRetained)
  {
    id v11 = [WeakRetained operationCompletion];

    if (v11)
    {
      char v12 = [WeakRetained operationCompletion];
      ((void (**)(void, uint64_t, id))v12)[2](v12, 1, v6);
    }
  }
  [*(id *)(a1 + 40) downloadComplete:1];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

void sub_1000394C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
  objc_destroyWeak(v19);
  _Block_object_dispose(&a19, 8);
  objc_destroyWeak((id *)(v20 - 56));
  _Unwind_Resume(a1);
}

void sub_1000394F0(id a1, unint64_t a2)
{
  id v3 = vm_vmd_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 134217984;
    unint64_t v5 = a2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "LID Asset download progress=%lu ", (uint8_t *)&v4, 0xCu);
  }
}

void sub_100039594(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v8 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v9 = [WeakRetained operationCompletion];

    if (v9)
    {
      int v10 = vm_vmd_log();
      BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
      if (v5)
      {
        if (v11)
        {
          int v14 = 138412546;
          id v15 = v5;
          __int16 v16 = 2112;
          id v17 = v6;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "LID Asset download complete with path=%@ error=%@", (uint8_t *)&v14, 0x16u);
        }

        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
        char v12 = [v8 operationCompletion];
        int v13 = (void (*)(void))v12[2];
      }
      else
      {
        if (v11)
        {
          int v14 = 138412290;
          id v15 = v6;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "LID Assets currently not deployed. error=%@", (uint8_t *)&v14, 0xCu);
        }

        char v12 = [v8 operationCompletion];
        int v13 = (void (*)(void))v12[2];
      }
      v13();
    }
  }
  [*(id *)(a1 + 32) downloadComplete:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_100039D3C(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  if (a2)
  {
    v2();
    int v4 = vm_vmd_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100080DCC(a2, v4);
    }
  }
  else
  {
    v2();
  }
}

id sub_100039F0C(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) downloadAssetCatalogComplete:a2];
}

void sub_10003A108(id a1, MAProgressNotification *a2)
{
  unsigned int v2 = a2;
  unsigned __int8 v3 = [(MAProgressNotification *)v2 isStalled];
  int v4 = vm_vmd_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      int v12 = 134218240;
      id v13 = [(MAProgressNotification *)v2 totalWritten];
      __int16 v14 = 2048;
      id v15 = [(MAProgressNotification *)v2 totalExpected];
      id v6 = "Asset Download Progress stalled at %lld of %lld bytes";
      uint64_t v7 = v4;
      uint32_t v8 = 22;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v12, v8);
    }
  }
  else if (v5)
  {
    id v9 = [(MAProgressNotification *)v2 totalWritten];
    id v10 = [(MAProgressNotification *)v2 totalExpected];
    [(MAProgressNotification *)v2 expectedTimeRemaining];
    int v12 = 134218496;
    id v13 = v9;
    __int16 v14 = 2048;
    id v15 = v10;
    __int16 v16 = 2048;
    uint64_t v17 = v11;
    id v6 = "Asset Download Progress: %lld of %lld bytes, ~%.2f seconds remaining";
    uint64_t v7 = v4;
    uint32_t v8 = 32;
    goto LABEL_6;
  }
}

id sub_10003A254(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    int v4 = vm_vmd_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100080E44(a2, v4);
    }

    return [*(id *)(a1 + 32) downloadAssetComplete:0];
  }
  else
  {
    id v6 = *(void **)(a1 + 32);
    return [v6 downloadAssetComplete:1];
  }
}

BOOL sub_10003A568(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    while (1)
    {
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
      }
      char v4 = 0;
      unsigned int v5 = 0;
      unint64_t v6 = 0;
      while (1)
      {
        unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
        *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
        v6 |= (unint64_t)(v8 & 0x7F) << v4;
        if ((v8 & 0x80) == 0) {
          goto LABEL_11;
        }
        v4 += 7;
        if (v5++ >= 9)
        {
          unint64_t v6 = 0;
          int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
          goto LABEL_13;
        }
      }
      *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
      int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        unint64_t v6 = 0;
      }
LABEL_13:
      if (v10 || (v6 & 7) == 4) {
        return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
      }
      if ((v6 >> 3) == 2) {
        break;
      }
      if ((v6 >> 3) == 1)
      {
        char v12 = 0;
        unsigned int v13 = 0;
        uint64_t v14 = 0;
        *(unsigned char *)(a1 + 24) |= 2u;
        while (1)
        {
          unint64_t v15 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v15 == -1 || v15 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            id v18 = &OBJC_IVAR___AWDVisualVoicemailDownloaded__timestamp;
            goto LABEL_37;
          }
          char v16 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v15);
          *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v15 + 1;
          v14 |= (unint64_t)(v16 & 0x7F) << v12;
          if ((v16 & 0x80) == 0) {
            break;
          }
          v12 += 7;
          BOOL v17 = v13++ > 8;
          if (v17)
          {
            uint64_t v14 = 0;
            id v18 = &OBJC_IVAR___AWDVisualVoicemailDownloaded__timestamp;
            goto LABEL_40;
          }
        }
        id v18 = &OBJC_IVAR___AWDVisualVoicemailDownloaded__timestamp;
LABEL_38:
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v14 = 0;
        }
LABEL_40:
        *(void *)(a1 + *v18) = v14;
        goto LABEL_41;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_41:
      if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
      }
    }
    char v19 = 0;
    unsigned int v20 = 0;
    uint64_t v14 = 0;
    *(unsigned char *)(a1 + 24) |= 1u;
    while (1)
    {
      unint64_t v21 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v21 == -1 || v21 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v22 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v21);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v21 + 1;
      v14 |= (unint64_t)(v22 & 0x7F) << v19;
      if ((v22 & 0x80) == 0)
      {
        id v18 = &OBJC_IVAR___AWDVisualVoicemailDownloaded__lengthInSeconds;
        goto LABEL_38;
      }
      v19 += 7;
      BOOL v17 = v20++ > 8;
      if (v17)
      {
        uint64_t v14 = 0;
        id v18 = &OBJC_IVAR___AWDVisualVoicemailDownloaded__lengthInSeconds;
        goto LABEL_40;
      }
    }
    id v18 = &OBJC_IVAR___AWDVisualVoicemailDownloaded__lengthInSeconds;
LABEL_37:
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
    goto LABEL_38;
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

id sub_10003B490()
{
  if (qword_1000E0930 != -1) {
    dispatch_once(&qword_1000E0930, &stru_1000C2248);
  }
  uint64_t v0 = (void *)qword_1000E0928;
  return v0;
}

void sub_10003B4E4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.voicemail", "imap.syn");
  unsigned int v2 = (void *)qword_1000E0928;
  qword_1000E0928 = (uint64_t)v1;
}

void sub_10003B614(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10003B6BC(uint64_t a1)
{
  id result = (id)CTGetCurrentCallCount();
  if (!result)
  {
    unsigned __int8 v3 = *(void **)(a1 + 32);
    return [v3 synchronize:0 reason:@"CallStatusChanged"];
  }
  return result;
}

void sub_10003B900(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_10003C2B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18)
{
  _Unwind_Resume(a1);
}

id sub_10003C458(uint64_t a1)
{
  return [*(id *)(a1 + 32) clearRemoteUIDsForDetachedMessages];
}

void sub_10003C4E8(uint64_t a1)
{
  uint64_t v2 = a1 + 32;
  [*(id *)(*(void *)(a1 + 32) + 128) start];
  unsigned __int8 v3 = [*(id *)(*(void *)v2 + 128) getState];
  char v4 = sub_100020EE0(*(id **)(*(void *)v2 + 120));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [*(id *)(a1 + 32) getServiceObjLogPrefix];
    int v6 = 136315650;
    id v7 = v5;
    __int16 v8 = 2080;
    id v9 = " ";
    __int16 v10 = 2112;
    uint64_t v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#I %s%sstartup Stewie state is: %@", (uint8_t *)&v6, 0x20u);
  }

  [*(id *)(a1 + 32) stateChanged:v3];
}

void sub_10003C5F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003C7A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  __int16 v10 = v9;

  a9.super_class = (Class)VVService;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_10003C868(id a1)
{
  qword_1000E0940 = _CTServerConnectionCreate();
}

void sub_10003CBBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10003CBE8(uint64_t a1)
{
  [*(id *)(a1 + 32) cancelDelayedSynchronize:@"NotSubscribed"];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 resetDelayedSynchronizationAttemptCount];
}

void sub_10003CC2C(uint64_t a1)
{
  uint64_t v2 = a1 + 40;
  [*(id *)(a1 + 32) postNotificationName:@"VVServiceOnlineStateChangedNotification" object:*(void *)(a1 + 40) userInfo:0];
  char v4 = *(void **)(v2 - 8);
  id v3 = *(id *)v2;
  v9[0] = @"yesno";
  id v5 = +[NSNumber numberWithBool:*(unsigned __int8 *)(v2 + 8)];
  v10[0] = v5;
  v9[1] = @"contextInfo";
  int v6 = [*(id *)v2 contextInfo];
  v10[1] = v6;
  v9[2] = @"serviceLabelID";
  id v7 = [*(id *)(a1 + 40) serviceLabelID];
  v10[2] = v7;
  __int16 v8 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:3];
  [v4 postNotificationName:@"VVServiceSubscriptionStatusChangedNotification" object:v3 userInfo:v8];
}

void sub_10003CD60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10003CE38(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancelDelayedSynchronize:@"Kill"];
}

void sub_10003CF5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10003D088(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003D2B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003D4F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003D5C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10003D680(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10003D698(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 152);
  return result;
}

void sub_10003D720(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned __int8 *)(v1 + 152) != v2)
  {
    *(unsigned char *)(v1 + 152) = v2;
    char v4 = [*(id *)(a1 + 32) serialDispatchQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10003D7C8;
    block[3] = &unk_1000C1A98;
    void block[4] = *(void *)(a1 + 32);
    dispatch_async(v4, block);
  }
}

id sub_10003D7C8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateOnlineStatus];
}

void sub_10003D8BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10003D8D4(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 154);
  return result;
}

void sub_10003D98C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10003D9A4(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 155);
  return result;
}

void sub_10003DA2C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned __int8 *)(v1 + 155) != v2)
  {
    *(unsigned char *)(v1 + 155) = v2;
    int v4 = *(unsigned __int8 *)(a1 + 40);
    id v5 = +[VVMSharedNetworkObserver sharedInstance];
    int v6 = v5;
    uint64_t v7 = *(void *)(a1 + 32);
    if (v4)
    {
      __int16 v8 = [*(id *)(a1 + 32) serialDispatchQueue];
      [v6 addDelegate:v7 queue:v8];

      id v9 = +[VVMSharedNetworkObserver sharedInstance];
      *(unsigned char *)(*(void *)(a1 + 32) + 154) = [v9 isNetworkReachable];
    }
    else
    {
      [v5 removeDelegate:*(void *)(a1 + 32)];

      *(unsigned char *)(*(void *)(a1 + 32) + 154) = 0;
    }
    __int16 v10 = [*(id *)(a1 + 32) serialDispatchQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10003DB8C;
    block[3] = &unk_1000C1A98;
    void block[4] = *(void *)(a1 + 32);
    dispatch_async(v10, block);
  }
}

void sub_10003DB68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10003DB8C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateOnlineStatus];
}

void sub_10003DC38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10003DC50(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 156);
  return result;
}

uint64_t sub_10003DCD8(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  int v2 = *(unsigned __int8 *)(result + 40);
  if (*(unsigned __int8 *)(v1 + 156) != v2) {
    *(unsigned char *)(v1 + 156) = v2;
  }
  return result;
}

void sub_10003DDDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10003DDFC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10003DE0C(uint64_t a1)
{
}

void sub_10003DE14(uint64_t a1)
{
}

void sub_10003DEBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_10003DED4(uint64_t a1)
{
}

void sub_10003DF84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10003DF9C(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 153);
  return result;
}

uint64_t sub_10003E024(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  int v2 = *(unsigned __int8 *)(result + 40);
  if (*(unsigned __int8 *)(v1 + 153) != v2) {
    *(unsigned char *)(v1 + 153) = v2;
  }
  return result;
}

void sub_10003E0E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10003E0FC(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 184);
  return result;
}

void sub_10003E180(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(v1 + 184);
  if (v3 != v2)
  {
    *(void *)(v1 + 184) = v2;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10003E210;
    block[3] = &unk_1000C23F8;
    uint64_t v4 = *(void *)(a1 + 40);
    void block[4] = *(void *)(a1 + 32);
    void block[5] = v3;
    void block[6] = v4;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

void sub_10003E210(uint64_t a1)
{
  uint64_t v2 = sub_100020EE0(*(id **)(*(void *)(a1 + 32) + 120));
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) getServiceObjLogPrefix];
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 136315906;
    id v13 = v3;
    __int16 v14 = 2080;
    unint64_t v15 = " ";
    __int16 v16 = 2048;
    uint64_t v17 = v4;
    __int16 v18 = 2048;
    uint64_t v19 = v5;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "#I %s%sPosting VVServiceTrashedCountChangedNotification; old trashed count=%lu, new trashed count=%lu",
      buf,
      0x2Au);
  }

  int v6 = +[NSNotificationCenter defaultCenter];
  uint64_t v7 = *(void *)(a1 + 32);
  __int16 v8 = +[NSNumber numberWithUnsignedInteger:*(void *)(a1 + 48), @"TrashedCount"];
  uint64_t v11 = v8;
  id v9 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  [v6 postNotificationName:@"VVServiceTrashedCountChangedNotification" object:v7 userInfo:v9];
}

void sub_10003E37C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003E45C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10003E474(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 192);
  return result;
}

void sub_10003E4F8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(v1 + 192);
  if (v3 != v2)
  {
    *(void *)(v1 + 192) = v2;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10003E588;
    block[3] = &unk_1000C23F8;
    uint64_t v4 = *(void *)(a1 + 40);
    void block[4] = *(void *)(a1 + 32);
    void block[5] = v3;
    void block[6] = v4;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

void sub_10003E588(uint64_t a1)
{
  uint64_t v2 = sub_100020EE0(*(id **)(*(void *)(a1 + 32) + 120));
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) getServiceObjLogPrefix];
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 136315906;
    id v13 = v3;
    __int16 v14 = 2080;
    unint64_t v15 = " ";
    __int16 v16 = 2048;
    uint64_t v17 = v4;
    __int16 v18 = 2048;
    uint64_t v19 = v5;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "#I %s%sPosting VVServiceUnreadCountChangedNotification; old unread count=%lu, new unread count=%lu",
      buf,
      0x2Au);
  }

  int v6 = +[NSNotificationCenter defaultCenter];
  uint64_t v7 = *(void *)(a1 + 32);
  __int16 v8 = +[NSNumber numberWithUnsignedInteger:*(void *)(a1 + 48), @"UnreadCount"];
  uint64_t v11 = v8;
  id v9 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  [v6 postNotificationName:@"VVServiceUnreadCountChangedNotification" object:v7 userInfo:v9];
}

void sub_10003E6F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003E818(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10003E948(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003EEFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003F01C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_10003F0CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003F1E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003F30C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003F430(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003F670(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  _Unwind_Resume(a1);
}

void sub_10003F6D4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (xpc_activity_get_state(v3) == 2)
  {
    id WeakRetained = (id **)objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained _enterFallbackMode];
    if (!xpc_activity_set_state(v3, 5))
    {
      if (WeakRetained)
      {
        uint64_t v5 = sub_100020EE0(WeakRetained[15]);
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          CFStringRef v6 = (const __CFString *)[WeakRetained getServiceObjLogPrefix];
          uint64_t v7 = [WeakRetained fallbackActivityIdentifier];
          int v8 = 136315650;
          CFStringRef v9 = v6;
          __int16 v10 = 2080;
          uint64_t v11 = " ";
          __int16 v12 = 2112;
          id v13 = v7;
          _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#I %s%sUnable to transition %@ activity to state done", (uint8_t *)&v8, 0x20u);
        }
      }
      else
      {
        uint64_t v5 = vm_vmd_log();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          int v8 = 138412290;
          CFStringRef v9 = @"com.apple.voicemail.fallback";
          _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Unable to transition %@ activity to state done", (uint8_t *)&v8, 0xCu);
        }
      }
    }
  }
}

void sub_10003F864(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003FA0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003FB08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003FC00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003FCE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003FDF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003FFD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100040090(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10004010C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000401F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_10004027C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100040368(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100040614(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100040864(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100040A00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100040E20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000410AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000411E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000412C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000412D8(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 92);
  return result;
}

void sub_100041410(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100041574(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100041698(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000417C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004185C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100041C48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  _Unwind_Resume(a1);
}

void sub_100041CC0(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (xpc_activity_get_state((xpc_activity_t)v3) == 2)
  {
    uint64_t v4 = (id *)(a1 + 32);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    CFStringRef v6 = WeakRetained;
    if (WeakRetained)
    {
      uint64_t v7 = [WeakRetained serialDispatchQueue];
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_100041DD0;
      void v8[3] = &unk_1000C2470;
      objc_copyWeak(&v10, v4);
      id v9 = v3;
      dispatch_async(v7, v8);

      objc_destroyWeak(&v10);
    }
  }
}

void sub_100041DB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100041DD0(uint64_t a1)
{
  id WeakRetained = (id **)objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _attemptDelayedSynchronize];
    if (!xpc_activity_set_state(*(xpc_activity_t *)(a1 + 32), 5))
    {
      uint64_t v4 = sub_100020EE0(v3[15]);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        id v5 = [v3 getServiceObjLogPrefix];
        CFStringRef v6 = [v3 delayedRetryActivityIdentifier];
        int v7 = 136315650;
        id v8 = v5;
        __int16 v9 = 2080;
        id v10 = " ";
        __int16 v11 = 2112;
        __int16 v12 = v6;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#W %s%sUnable to transition %@ activity to state done", (uint8_t *)&v7, 0x20u);
      }
    }
  }
}

void sub_100041EEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100041F88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004276C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  _Unwind_Resume(a1);
}

void sub_1000428F8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (xpc_activity_get_state((xpc_activity_t)v3) == 2)
  {
    uint64_t v4 = (id *)(a1 + 32);
    id WeakRetained = (id **)objc_loadWeakRetained((id *)(a1 + 32));
    CFStringRef v6 = WeakRetained;
    if (WeakRetained)
    {
      int v7 = [WeakRetained serialDispatchQueue];
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_100042B54;
      v11[3] = &unk_1000C2470;
      objc_copyWeak(&v13, v4);
      id v12 = v3;
      dispatch_async(v7, v11);

      objc_destroyWeak(&v13);
    }
    if (!xpc_activity_set_state((xpc_activity_t)v3, 4))
    {
      if (v6)
      {
        id v8 = sub_100020EE0(v6[15]);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          CFStringRef v9 = (const __CFString *)[v6 getServiceObjLogPrefix];
          id v10 = [v6 automatedTrashActivityIdentifier];
          *(_DWORD *)buf = 136315650;
          CFStringRef v15 = v9;
          __int16 v16 = 2080;
          uint64_t v17 = " ";
          __int16 v18 = 2112;
          uint64_t v19 = v10;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#W %s%sCOMPACTION: Unable to transition %@ activity to state continue", buf, 0x20u);
        }
      }
      else
      {
        id v8 = vm_vmd_log();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          CFStringRef v15 = @"com.apple.voicemail.autotrash";
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "COMPACTION: Unable to transition %@ activity to state continue", buf, 0xCu);
        }
      }
    }
  }
}

void sub_100042B1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100042B54(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained) {
    [WeakRetained _attemptScheduledTrashCompaction:*(void *)(a1 + 32)];
  }
}

void sub_100042BAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100042CA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100042F74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000430DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000431C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000432D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000433CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000434E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004363C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100043654(uint64_t a1)
{
  [*(id *)(a1 + 32) cancelDelayedSynchronize:@"SyncRetryOverCellular"];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 synchronize:1 reason:@"SyncRetryOverCellular"];
}

void sub_100043A20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100043BE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100043D80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

unsigned __int8 *sub_100043DA0(unsigned __int8 *result)
{
  uint64_t v1 = *((void *)result + 4);
  int v2 = result[40];
  if (*(unsigned __int8 *)(v1 + 154) != v2)
  {
    *(unsigned char *)(v1 + 154) = v2;
    return (unsigned __int8 *)[*((id *)result + 4) _updateOnlineStatus];
  }
  return result;
}

void sub_100043EE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000440A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000441E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000442DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Block_object_dispose((const void *)(v16 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_100044300(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) stateRequestAttemptCount];
  id v4 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  id v3 = v4;
  if (v4)
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v4 integerValue];
    id v3 = v4;
  }
}

void sub_100044378(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_100044448(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100044458(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) stateRequestAttemptCount];
  id v6 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (v6) {
    uint64_t v3 = (uint64_t)[v6 integerValue] + 1;
  }
  else {
    uint64_t v3 = 1;
  }
  id v4 = +[NSNumber numberWithInteger:v3];
  id v5 = [*(id *)(a1 + 32) stateRequestAttemptCount];
  [v5 setObject:v4 forKeyedSubscript:*(void *)(a1 + 40)];
}

void sub_100044510(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000445FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004460C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) stateRequestAttemptCount];
  [v2 setObject:0 forKeyedSubscript:*(void *)(a1 + 40)];
}

void sub_100044664(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100044760(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Unwind_Resume(a1);
}

void sub_100044780(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 176);
  if (!v2)
  {
    id v3 = objc_alloc_init((Class)NSMutableDictionary);
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 176);
    *(void *)(v4 + 176) = v3;

    id v2 = *(void **)(*(void *)(a1 + 32) + 176);
  }
  id v6 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  objc_storeStrong(v6, v2);
}

void sub_1000448B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100044958(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100044CB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100045324(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 104), *(id *)(a1 + 40));
  uint64_t v2 = [*(id *)(a1 + 40) locale];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 88);
  *(void *)(v3 + 88) = v2;

  uint64_t v5 = +[CPNetworkObserver sharedNetworkObserver];
  uint64_t v6 = *(void *)(a1 + 32);
  int v7 = *(void **)(v6 + 96);
  *(void *)(v6 + 96) = v5;

  [*(id *)(*(void *)(a1 + 32) + 96) addNetworkReachableObserver:*(void *)(a1 + 32) selector:"handleCPNetworkObserverNetworkReachableNotification:"];
  id v8 = objc_alloc_init((Class)NSOperationQueue);
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(void **)(v9 + 112);
  *(void *)(v9 + 112) = v8;

  [*(id *)(*(void *)(a1 + 32) + 112) setMaxConcurrentOperationCount:1];
  id v11 = objc_alloc_init((Class)NSOperationQueue);
  uint64_t v12 = *(void *)(a1 + 32);
  id v13 = *(void **)(v12 + 128);
  *(void *)(v12 + 128) = v11;

  [*(id *)(*(void *)(a1 + 32) + 128) setMaxConcurrentOperationCount:1];
  uint64_t v14 = *(void *)(a1 + 32);
  CFStringRef v15 = *(void **)(v14 + 112);
  uint64_t v16 = NSStringFromSelector("operationCount");
  [v15 addObserver:v14 forKeyPath:v16 options:3 context:off_1000E0520];

  uint64_t v17 = +[NSMapTable weakToStrongObjectsMapTable];
  uint64_t v18 = *(void *)(a1 + 32);
  uint64_t v19 = *(void **)(v18 + 144);
  *(void *)(v18 + 144) = v17;

  uint64_t v20 = +[NSProgress progressWithTotalUnitCount:1];
  uint64_t v21 = *(void *)(a1 + 32);
  char v22 = *(void **)(v21 + 120);
  *(void *)(v21 + 120) = v20;

  [*(id *)(*(void *)(a1 + 32) + 120) becomeCurrentWithPendingUnitCount:1];
  [*(id *)(*(void *)(a1 + 32) + 120) resignCurrent];
  uint64_t v23 = *(void *)(a1 + 32);
  unsigned int v24 = *(void **)(v23 + 120);
  unint64_t v25 = NSStringFromSelector("fractionCompleted");
  [v24 addObserver:v23 forKeyPath:v25 options:1 context:off_1000E0528];

  uint64_t v26 = *(void *)(a1 + 32);
  uint64_t v27 = *(void **)(v26 + 120);
  NSStringFromSelector("totalUnitCount");
  id v28 = (id)objc_claimAutoreleasedReturnValue();
  [v27 addObserver:v26 forKeyPath:v28 options:1 context:off_1000E0530];
}

void sub_100045788(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegateToQueue];
  [v2 setObject:*(void *)(a1 + 40) forKey:*(void *)(a1 + 48)];
}

void sub_100045890(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegateToQueue];
  [v2 removeObjectForKey:*(void *)(a1 + 40)];
}

void sub_1000459E4(uint64_t a1)
{
  id v2 = [VMTranscriptionTranscribeOperation alloc];
  uint64_t v3 = [*(id *)(a1 + 32) locale];
  uint64_t v5 = [(VMSpeechURLRecognitionRequestOperation *)v2 initWithLocale:v3 URL:*(void *)(a1 + 40)];

  [(VMTranscriptionTranscribeOperation *)v5 setProcessOnServer:1];
  uint64_t v4 = [*(id *)(a1 + 32) transcriptionOperationQueue];
  [v4 addOperation:v5];
}

void sub_100045C28(uint64_t a1)
{
  id v2 = [VMTranscriptionTranscribeOperation alloc];
  uint64_t v3 = [*(id *)(a1 + 32) locale];
  uint64_t v9 = [(VMSpeechURLRecognitionRequestOperation *)v2 initWithLocale:v3 URL:*(void *)(a1 + 40)];

  [(VMTranscriptionTranscribeOperation *)v9 setQueuePriority:*(void *)(a1 + 64)];
  [(VMTranscriptionTranscribeOperation *)v9 setTimeout:*(double *)(a1 + 72) + *(double *)(a1 + 72)];
  [(VMTranscriptionTranscribeOperation *)v9 setTranscribeOperationCompletion:*(void *)(a1 + 48)];
  [(VMTranscriptionTranscribeOperation *)v9 setTranscribeOperationBeginCallback:*(void *)(a1 + 56)];
  uint64_t v4 = [*(id *)(a1 + 32) transcriptionProgress];
  objc_msgSend(v4, "setTotalUnitCount:", (uint64_t)(*(double *)(a1 + 72) + (double)(uint64_t)objc_msgSend(v4, "totalUnitCount")));

  [(VMTranscriptionTranscribeOperation *)v9 configureProgressWithUnitCount:(uint64_t)*(double *)(a1 + 72)];
  [(VMTranscriptionTranscribeOperation *)v9 setDuration:*(double *)(a1 + 72)];
  uint64_t v5 = [*(id *)(a1 + 32) transcriptionProgress];
  uint64_t v6 = [(VMTranscriptionTranscribeOperation *)v9 progress];
  [(VMTranscriptionTranscribeOperation *)v9 duration];
  [v5 addChild:v6 withPendingUnitCount:(uint64_t)v7];

  id v8 = [*(id *)(a1 + 32) transcriptionOperationQueue];
  [v8 addOperation:v9];
}

void sub_100045D80(id *a1)
{
  if ([a1[4] isFileURL])
  {
    if ([a1[5] isDictationModelInstalled])
    {
      id v2 = vm_vmd_log();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        id v3 = a1[4];
        *(_DWORD *)buf = 138412290;
        id v17 = v3;
        _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Dictation model is already installed. Initiating operation to transcribe audio file at %@.", buf, 0xCu);
      }

      (*((void (**)(void))a1[6] + 2))();
    }
    else
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_100045F8C;
      void v10[3] = &unk_1000C2518;
      id v9 = a1[5];
      id v11 = a1[4];
      id v12 = a1[6];
      id v13 = a1[7];
      [v9 requestAssetModelOperationWithCompletion:v10];
    }
  }
  else
  {
    uint64_t v4 = (void (**)(id, void, void *))a1[7];
    v14[0] = NSLocalizedDescriptionKey;
    v14[1] = NSURLErrorKey;
    uint64_t v5 = kVVErrorDomain;
    id v6 = a1[4];
    v15[0] = @"Expected a file URL.";
    v15[1] = v6;
    double v7 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];
    id v8 = +[NSError errorWithDomain:v5 code:1039 userInfo:v7];
    v4[2](v4, 0, v8);
  }
}

void sub_100045F8C(void *a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = vm_vmd_log();
  double v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = a1[4];
      *(_DWORD *)buf = 138412290;
      uint64_t v18 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Request to install dictation model completed successfully. Initiating operation to transcribe audio file at %@.", buf, 0xCu);
    }

    (*(void (**)(void))(a1[5] + 16))();
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100081070((uint64_t)v5, v7);
    }

    id v9 = [v5 localizedDescription];
    id v10 = +[NSString stringWithFormat:@"Unable to download offline transcription model. Speech error was: %@", v9];

    uint64_t v11 = a1[6];
    uint64_t v12 = kVVErrorDomain;
    NSErrorUserInfoKey v15 = NSLocalizedDescriptionKey;
    uint64_t v16 = v10;
    id v13 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    uint64_t v14 = +[NSError errorWithDomain:v12 code:1040 userInfo:v13];
    (*(void (**)(uint64_t, void, void *))(v11 + 16))(v11, 0, v14);
  }
}

void sub_1000462C0(uint64_t a1)
{
  id v3 = [[VMSpeechAnalyzerLanguageIDOperation alloc] initSpeechAnalyzerForLanguageID:*(void *)(a1 + 32)];
  [v3 setQueuePriority:*(void *)(a1 + 56)];
  [v3 setLanguageIDOperationCompletion:*(void *)(a1 + 48)];
  id v2 = [*(id *)(a1 + 40) speechAnalyzerOperationQueue];
  [v2 addOperation:v3];
}

void sub_100046344(id *a1)
{
  if ([a1[4] isFileURL])
  {
    if ([a1[5] isLanguageIDModelInstalled])
    {
      id v2 = vm_vmd_log();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        id v3 = a1[4];
        *(_DWORD *)buf = 138412290;
        id v17 = v3;
        _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Language ID model is already installed. Initiating operation to LID audio file at %@.", buf, 0xCu);
      }

      (*((void (**)(void))a1[6] + 2))();
    }
    else
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_100046550;
      void v10[3] = &unk_1000C2518;
      id v9 = a1[5];
      id v11 = a1[4];
      id v12 = a1[6];
      id v13 = a1[7];
      [v9 requestLanguageIDModelOperationWithCompletion:v10];
    }
  }
  else
  {
    uint64_t v4 = (void (**)(id, void, void *))a1[7];
    v14[0] = NSLocalizedDescriptionKey;
    v14[1] = NSURLErrorKey;
    uint64_t v5 = kVVErrorDomain;
    id v6 = a1[4];
    v15[0] = @"Expected a file URL.";
    v15[1] = v6;
    double v7 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];
    uint64_t v8 = +[NSError errorWithDomain:v5 code:1042 userInfo:v7];
    v4[2](v4, 0, v8);
  }
}

void sub_100046550(void *a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = vm_vmd_log();
  double v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = a1[4];
      *(_DWORD *)buf = 138412290;
      uint64_t v18 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Request to fetch/install Language ID model completed successfully. Initiating operation to LID audio file at %@.", buf, 0xCu);
    }

    (*(void (**)(void))(a1[5] + 16))();
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000810E8((uint64_t)v5, v7);
    }

    id v9 = [v5 localizedDescription];
    id v10 = +[NSString stringWithFormat:@"Unable to download offline Language ID model. Speech error was: %@", v9];

    uint64_t v11 = a1[6];
    uint64_t v12 = kVVErrorDomain;
    NSErrorUserInfoKey v15 = NSLocalizedDescriptionKey;
    uint64_t v16 = v10;
    id v13 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    uint64_t v14 = +[NSError errorWithDomain:v12 code:1043 userInfo:v13];
    (*(void (**)(uint64_t, void, void *))(v11 + 16))(v11, 0, v14);
  }
}

void sub_1000467F4(uint64_t a1)
{
  id v2 = *(void **)(a1 + 56);
  if (v2 == off_1000E0520)
  {
    uint64_t v12 = [*(id *)(a1 + 32) objectForKey:NSKeyValueChangeOldKey];
    uint64_t v13 = (uint64_t)[v12 integerValue];

    uint64_t v14 = [*(id *)(a1 + 32) objectForKey:NSKeyValueChangeNewKey];
    id v15 = [v14 integerValue];

    if (v13) {
      BOOL v16 = 1;
    }
    else {
      BOOL v16 = (uint64_t)v15 <= 0;
    }
    if (!v16 || (v13 >= 1 ? (BOOL v17 = v15 == 0) : (BOOL v17 = 0), v17))
    {
      uint64_t v18 = vm_vmd_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        uint64_t v57 = v13;
        __int16 v58 = 2048;
        id v59 = v15;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "oldOperationCount %ld, newOperationCount: %ld", buf, 0x16u);
      }

      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      uint64_t v19 = [*(id *)(*(void *)(a1 + 40) + 112) operations];
      uint64_t v20 = (char *)[v19 countByEnumeratingWithState:&v49 objects:v55 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v50;
        while (2)
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(void *)v50 != v22) {
              objc_enumerationMutation(v19);
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                continue;
              }
            }
            int v24 = 1;
            goto LABEL_44;
          }
          uint64_t v21 = (char *)[v19 countByEnumeratingWithState:&v49 objects:v55 count:16];
          int v24 = 0;
          if (v21) {
            continue;
          }
          break;
        }
      }
      else
      {
        int v24 = 0;
      }
LABEL_44:

      uint64_t v33 = *(void *)(a1 + 40);
      if (*(unsigned __int8 *)(v33 + 73) != v24)
      {
        *(unsigned char *)(v33 + 73) = v24;
        pthread_mutex_lock((pthread_mutex_t *)(*(void *)(a1 + 40) + 8));
        *(unsigned char *)(*(void *)(a1 + 40) + 72) = v24;
        pthread_mutex_unlock((pthread_mutex_t *)(*(void *)(a1 + 40) + 8));
        v47[0] = _NSConcreteStackBlock;
        v47[1] = 3221225472;
        v47[2] = sub_100046D3C;
        v47[3] = &unk_1000C2588;
        char v48 = v24;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, v47);
      }
    }
  }
  else
  {
    if (v2 == off_1000E0528)
    {
      id v3 = *(id *)(a1 + 48);
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      id obj = [*(id *)(a1 + 40) delegateToQueue];
      id v25 = [obj countByEnumeratingWithState:&v43 objects:v54 count:16];
      if (v25)
      {
        id v26 = v25;
        uint64_t v27 = *(void *)v44;
        do
        {
          for (j = 0; j != v26; j = (char *)j + 1)
          {
            if (*(void *)v44 != v27) {
              objc_enumerationMutation(obj);
            }
            uint64_t v29 = *(void *)(*((void *)&v43 + 1) + 8 * (void)j);
            uint64_t v30 = [*(id *)(a1 + 40) delegateToQueue];
            uint64_t v31 = [v30 objectForKey:v29];

            v41[0] = _NSConcreteStackBlock;
            v41[1] = 3221225472;
            v41[2] = sub_100046E74;
            v41[3] = &unk_1000C11E0;
            uint64_t v32 = *(void *)(a1 + 40);
            v41[4] = v29;
            v41[5] = v32;
            id v42 = v3;
            dispatch_async(v31, v41);
          }
          id v26 = [obj countByEnumeratingWithState:&v43 objects:v54 count:16];
        }
        while (v26);
      }
    }
    else
    {
      if (v2 != off_1000E0530) {
        return;
      }
      id v3 = *(id *)(a1 + 48);
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      id obj = [*(id *)(a1 + 40) delegateToQueue];
      id v4 = [obj countByEnumeratingWithState:&v37 objects:v53 count:16];
      if (v4)
      {
        id v5 = v4;
        uint64_t v6 = *(void *)v38;
        do
        {
          for (k = 0; k != v5; k = (char *)k + 1)
          {
            if (*(void *)v38 != v6) {
              objc_enumerationMutation(obj);
            }
            uint64_t v8 = *(void *)(*((void *)&v37 + 1) + 8 * (void)k);
            id v9 = [*(id *)(a1 + 40) delegateToQueue];
            id v10 = [v9 objectForKey:v8];

            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_100046EE4;
            block[3] = &unk_1000C11E0;
            uint64_t v11 = *(void *)(a1 + 40);
            void block[4] = v8;
            void block[5] = v11;
            id v36 = v3;
            dispatch_async(v10, block);
          }
          id v5 = [obj countByEnumeratingWithState:&v37 objects:v53 count:16];
        }
        while (v5);
      }
    }
  }
}

void sub_100046D3C(uint64_t a1)
{
  id v2 = vm_vmd_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(unsigned __int8 *)(a1 + 32);
    *(_DWORD *)buf = 67109120;
    int v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Posting notification that transcribing status has changed: %d", buf, 8u);
  }

  id v4 = +[NSNotificationCenter defaultCenter];
  id v5 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 32), @"kVMVoicemailTranscriptionInProgress"];
  uint64_t v8 = v5;
  uint64_t v6 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  [v4 postNotificationName:@"VVVoicemailTranscribingStatusChangedNotification" object:0 userInfo:v6];
}

uint64_t sub_100046E74(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    int v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    [*(id *)(a1 + 48) fractionCompleted];
    return (uint64_t)objc_msgSend(v3, "transcriptionController:transcriptionProgressFractionCompletedChanged:", v4);
  }
  return result;
}

uint64_t sub_100046EE4(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    int v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = [*(id *)(a1 + 48) totalUnitCount];
    return (uint64_t)[v3 transcriptionController:v4 transcriptionProgressTotalUnitCountChanged:v5];
  }
  return result;
}

void sub_100046FFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100047014(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) speechRecognizer];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 supportsOnDeviceRecognition];
}

void sub_100047114(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_10004712C(uint64_t a1)
{
  id result = +[SFSpeechAssetManager isLanguageDetectorInstalled];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = (_BYTE)result;
  return result;
}

void sub_100047244(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10004725C(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 73);
  return result;
}

void sub_1000472F8(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) transcriptionOperationQueue];
  [v2 cancelAllOperations];

  id v3 = [*(id *)(a1 + 32) speechAnalyzerOperationQueue];
  [v3 cancelAllOperations];
}

void sub_1000473E8(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isDictationModelInstalled])
  {
    id v2 = vm_vmd_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      id v3 = *(void **)(a1 + 32);
      uint64_t v4 = [v3 speechRecognizer];
      id v5 = [v4 locale];
      uint64_t v6 = [v5 localeIdentifier];
      *(_DWORD *)buf = 138412546;
      int v10 = v3;
      __int16 v11 = 2112;
      uint64_t v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%@: Dictation model for locale %@ is installed, request to install asset model is not processed.", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v7 = *(void **)(a1 + 32);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100047544;
    void v8[3] = &unk_1000C2600;
    void v8[4] = v7;
    [v7 requestAssetModelOperationWithCompletion:v8];
  }
}

void sub_100047544(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = vm_vmd_log();
  uint64_t v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 138412290;
      uint64_t v10 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@: Request to install asset model completed successfully.", (uint8_t *)&v9, 0xCu);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    sub_100081160(a1, (uint64_t)v5, v7);
  }
}

void sub_1000476B4(uint64_t a1)
{
  id v3 = objc_alloc_init(VMTranscriptionSanitizeDatabaseOperation);
  id v2 = [*(id *)(a1 + 32) transcriptionOperationQueue];
  [v2 addOperation:v3];
}

void sub_100047804(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10004781C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10004782C(uint64_t a1)
{
}

void sub_100047834(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 80));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = WeakRetained;
}

void sub_100047968(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100047980(uint64_t a1)
{
}

void sub_100047A7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100047A94(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 96);
  if (!v2)
  {
    uint64_t v3 = +[CPNetworkObserver sharedNetworkObserver];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 96);
    *(void *)(v4 + 96) = v3;

    id v2 = *(void **)(*(void *)(a1 + 32) + 96);
  }
  uint64_t v6 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  objc_storeStrong(v6, v2);
}

void sub_100047BB8(uint64_t a1)
{
  id v2 = vm_vmd_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(v3 + 96);
    int v8 = 138412546;
    uint64_t v9 = v3;
    __int16 v10 = 2112;
    uint64_t v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%@: Removing network observer %@", (uint8_t *)&v8, 0x16u);
  }

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 96), "removeNetworkReachableObserver:");
  id v5 = vm_vmd_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    int v8 = 138412546;
    uint64_t v9 = v6;
    __int16 v10 = 2112;
    uint64_t v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@: Setting network observer %@", (uint8_t *)&v8, 0x16u);
  }

  objc_storeStrong((id *)(*(void *)(a1 + 32) + 96), *(id *)(a1 + 40));
}

void sub_100047DD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100047DEC(uint64_t a1)
{
}

void sub_100047EE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100047F00(uint64_t a1)
{
}

void sub_100047FFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100048014(uint64_t a1)
{
}

void sub_100048110(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100048128(uint64_t a1)
{
}

id sub_100048E70()
{
  if (qword_1000E0970 != -1) {
    dispatch_once(&qword_1000E0970, &stru_1000C26B8);
  }
  uint64_t v0 = (void *)qword_1000E0968;
  return v0;
}

void sub_100048EC4(uint64_t a1)
{
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100048F50;
  handler[3] = &unk_1000C1E98;
  id v2 = *(id *)(a1 + 32);
  xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)&_dispatch_main_q, handler);
}

void sub_100048F50(uint64_t a1, xpc_object_t xdict)
{
  string = xpc_dictionary_get_string(xdict, _xpc_event_key_name);
  if (string
    && (+[NSString stringWithUTF8String:string],
        (uint64_t v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v5 = v4;
    [*(id *)(a1 + 32) executeHandlerForNotificationWithName:v4 userInfo:0];
  }
  else
  {
    id v5 = sub_100048E70();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000811EC(a1, v5);
    }
  }
}

id sub_10004914C(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 48) loadTranscriptionService];
  id v2 = *(void **)(a1 + 32);
  return [v2 queryAndInitVoicemailServices];
}

void sub_1000496CC(uint64_t a1)
{
  id v2 = sub_100048E70();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = objc_opt_class();
    uint64_t v4 = *(void **)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    int v15 = 136316162;
    BOOL v16 = "";
    __int16 v17 = 2080;
    uint64_t v18 = "";
    __int16 v19 = 2112;
    uint64_t v20 = v3;
    __int16 v21 = 2112;
    uint64_t v22 = v4;
    __int16 v23 = 2112;
    uint64_t v24 = v5;
    id v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "#I %s%s%@ is handling %@ with user info %@", (uint8_t *)&v15, 0x34u);
  }
  if ([*(id *)(a1 + 40) isEqualToString:kCTIndicatorsVoiceMailNotification])
  {
    uint64_t v7 = *(void **)(a1 + 48);
    if (v7)
    {
      int v8 = [v7 objectForKeyedSubscript:kCTIndicatorVoiceMailSubInstance];
      if (v8)
      {
        id v9 = [objc_alloc((Class)NSUUID) initWithUUIDString:v8];
        if (v9)
        {
          __int16 v10 = v9;
          uint64_t v11 = [*(id *)(a1 + 32) findContextInfoWithSubscriptionUUID:v9];
          if (v11)
          {
            [*(id *)(a1 + 32) executeHandlerForVoicemailInfoNotification:v11 userInfo:*(void *)(a1 + 48)];
          }
          else
          {
            uint64_t v12 = sub_100048E70();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v13 = objc_opt_class();
              int v15 = 136315906;
              BOOL v16 = "";
              __int16 v17 = 2080;
              uint64_t v18 = "";
              __int16 v19 = 2112;
              uint64_t v20 = v13;
              __int16 v21 = 2112;
              uint64_t v22 = v8;
              id v14 = v13;
              _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#I %s%s%@ subscription for UUID %@ not found", (uint8_t *)&v15, 0x2Au);
            }
          }
        }
      }
    }
  }
  else
  {
    [*(id *)(a1 + 32) handleNotificationWithName:*(void *)(a1 + 40) userInfo:*(void *)(a1 + 48)];
  }
}

id sub_10004A5AC(void *a1, void *a2)
{
  id v3 = a2;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v4 = objc_msgSend(a1, "subscriptions", 0);
  id v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        __int16 v10 = [v9 labelID];
        uint64_t v11 = [v3 UUIDString];
        unsigned __int8 v12 = [v10 isEqualToString:v11];

        if (v12)
        {
          id v13 = v9;

          goto LABEL_11;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  id v13 = (id)objc_opt_new();
LABEL_11:

  return v13;
}

void sub_10004BAC0(uint64_t a1)
{
  id v2 = sub_100048E70();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) labelUUIDToService];
    *(_DWORD *)buf = 136315650;
    long long v16 = "";
    __int16 v17 = 2080;
    long long v18 = "";
    __int16 v19 = 2112;
    uint64_t v20 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "#I %s%sPerforming synchronize for all services %@", buf, 0x20u);
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "labelUUIDToService", 0);
  id v5 = [v4 allValues];

  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) synchronize:1 reason:@"SyncServices"];
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

void sub_10004BD48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10004BD60(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10004BD70(uint64_t a1)
{
}

void sub_10004BD78(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) telephonyClient];
  id v17 = [v2 contexts];

  id v3 = [v17 voicePreferred];
  uint64_t v4 = [v17 findForUuid:v3];

  id v5 = objc_alloc((Class)NSUUID);
  id v6 = [v4 labelID];
  id v7 = [v5 initWithUUIDString:v6];

  uint64_t v8 = [*(id *)(a1 + 32) labelUUIDToService];
  uint64_t v9 = [v8 objectForKeyedSubscript:v7];
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  long long v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    long long v12 = [*(id *)(a1 + 32) labelUUIDToService];
    long long v13 = [v12 allValues];
    uint64_t v14 = [v13 firstObject];
    uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
    long long v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;
  }
}

void sub_10004BF70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10004BF88(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) labelUUIDToService];
  id v3 = [v2 allValues];

  if ([v3 count]
    || ([*(id *)(a1 + 32) telephonyClient],
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        [v4 subscriptions],
        id v5 = objc_claimAutoreleasedReturnValue(),
        id v6 = [v5 count],
        v5,
        v4,
        v6))
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v7 = v3;
    id v8 = [v7 countByEnumeratingWithState:&v20 objects:v34 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v21;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(v7);
          }
          *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= objc_msgSend(*(id *)(*((void *)&v20 + 1)+ 8 * i), "isSubscribed", (void)v20);
        }
        id v9 = [v7 countByEnumeratingWithState:&v20 objects:v34 count:16];
      }
      while (v9);
    }

    long long v12 = sub_100048E70();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
        CFStringRef v13 = @"subscribed";
      }
      else {
        CFStringRef v13 = @"not subscribed";
      }
      id v14 = objc_msgSend(v7, "count", (void)v20);
      uint64_t v15 = [*(id *)(a1 + 32) telephonyClient];
      long long v16 = [v15 contexts];
      id v17 = [v16 subscriptions];
      id v18 = [v17 count];
      *(_DWORD *)buf = 136316162;
      id v25 = "";
      __int16 v26 = 2080;
      uint64_t v27 = "";
      __int16 v28 = 2112;
      CFStringRef v29 = v13;
      __int16 v30 = 2048;
      id v31 = v14;
      __int16 v32 = 2048;
      id v33 = v18;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#I %s%sVoicemail state is %@; services %lu, subscriptions %lu",
        buf,
        0x34u);
    }
  }
  else
  {
    __int16 v19 = sub_100048E70();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v25 = "";
      __int16 v26 = 2080;
      uint64_t v27 = "";
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "#I %s%sVoicemail state has been changed to subscribed; services and subscriptions arrays are empty",
        buf,
        0x16u);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

void sub_10004C2F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10004C310(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) labelUUIDToService];
  id v3 = [v2 allValues];

  if ([v3 count]
    || ([*(id *)(a1 + 32) telephonyClient],
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        [v4 subscriptions],
        id v5 = objc_claimAutoreleasedReturnValue(),
        id v6 = [v5 count],
        v5,
        v4,
        v6))
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v7 = v3;
    id v8 = [v7 countByEnumeratingWithState:&v20 objects:v34 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v21;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(v7);
          }
          *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= objc_msgSend(*(id *)(*((void *)&v20 + 1)+ 8 * i), "isOnline", (void)v20);
        }
        id v9 = [v7 countByEnumeratingWithState:&v20 objects:v34 count:16];
      }
      while (v9);
    }

    long long v12 = sub_100048E70();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
        CFStringRef v13 = @"online";
      }
      else {
        CFStringRef v13 = @"offline";
      }
      id v14 = objc_msgSend(v7, "count", (void)v20);
      uint64_t v15 = [*(id *)(a1 + 32) telephonyClient];
      long long v16 = [v15 contexts];
      id v17 = [v16 subscriptions];
      id v18 = [v17 count];
      *(_DWORD *)buf = 136316162;
      id v25 = "";
      __int16 v26 = 2080;
      uint64_t v27 = "";
      __int16 v28 = 2112;
      CFStringRef v29 = v13;
      __int16 v30 = 2048;
      id v31 = v14;
      __int16 v32 = 2048;
      id v33 = v18;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#I %s%sVoicemail state is %@; services %lu, subscriptions %lu",
        buf,
        0x34u);
    }
  }
  else
  {
    __int16 v19 = sub_100048E70();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v25 = "";
      __int16 v26 = 2080;
      uint64_t v27 = "";
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "#I %s%sVoicemail state has been changed to online; services and subscriptions arrays are empty",
        buf,
        0x16u);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

void sub_10004C680(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10004C698(uint64_t a1)
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = objc_msgSend(*(id *)(a1 + 32), "labelUUIDToService", 0);
  id v3 = [v2 allValues];

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
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= [*(id *)(*((void *)&v8 + 1)+ 8 * (void)v7) isSyncInProgress];
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

void sub_10004C870(uint64_t a1)
{
  id v2 = sub_100048E70();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) labelID];
    id v4 = (void *)v3;
    int v5 = *(unsigned __int8 *)(a1 + 48);
    int v10 = 136315906;
    long long v11 = "";
    if (v5) {
      uint64_t v6 = "";
    }
    else {
      uint64_t v6 = "NOT ";
    }
    __int16 v12 = 2080;
    CFStringRef v13 = "";
    __int16 v14 = 2112;
    uint64_t v15 = v3;
    __int16 v16 = 2080;
    id v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "#I %s%sReport account with labelID %@ is %ssubscribed", (uint8_t *)&v10, 0x2Au);
  }
  id v7 = [*(id *)(a1 + 40) telephonyClient];
  long long v8 = [*(id *)(a1 + 32) context];
  id v9 = [v7 setVisualVoicemailState:v8 subscribed:*(unsigned __int8 *)(a1 + 48)];
}

void sub_10004CA60(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) labelUUIDToService];
  uint64_t v3 = [v2 objectForKey:*(void *)(a1 + 40)];

  id v4 = sub_100048E70();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 136315906;
    v75 = "";
    __int16 v76 = 2080;
    double v77 = "";
    __int16 v78 = 2112;
    v79 = v5;
    __int16 v80 = 2112;
    long long v81 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#I %s%sDo M2A merge for account %@, service %@", buf, 0x2Au);
  }

  if (v3)
  {
    uint64_t v6 = (void *)VMStoreCopyOfAllRecordsWithFlags(8, 0, 0);
    uint64_t v53 = v3;
    if ([v6 count])
    {
      id v7 = objc_opt_new();
      long long v66 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      long long v50 = v6;
      id v8 = v6;
      id v9 = [v8 countByEnumeratingWithState:&v66 objects:v73 count:16];
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = *(void *)v67;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(void *)v67 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = *(void *)(*((void *)&v66 + 1) + 8 * i);
            __int16 v14 = VMStoreRecordGetToken(v13);
            if (v14)
            {
              [v7 addObject:v14];
            }
            else
            {
              uint64_t v15 = sub_100048E70();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
              {
                __int16 v16 = (void *)sub_10006E7DC(v13);
                *(_DWORD *)buf = 136315650;
                v75 = "";
                __int16 v76 = 2080;
                double v77 = "";
                __int16 v78 = 2112;
                v79 = v16;
                _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "#I %s%sdo_M2A_merge: (trashed) No token for record: %@", buf, 0x20u);
              }
            }
          }
          id v10 = [v8 countByEnumeratingWithState:&v66 objects:v73 count:16];
        }
        while (v10);
      }

      uint64_t v3 = v53;
      if ([v7 count]) {
        [v53 moveRecordsToTrash:v7];
      }

      uint64_t v6 = v50;
    }

    id v17 = (void *)VMStoreCopyOfAllRecordsWithFlags(0, 8, 0);
    if ([v17 count])
    {
      id v18 = objc_opt_new();
      long long v62 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      long long v51 = v17;
      id v19 = v17;
      id v20 = [v19 countByEnumeratingWithState:&v62 objects:v72 count:16];
      if (v20)
      {
        id v21 = v20;
        uint64_t v22 = *(void *)v63;
        do
        {
          for (j = 0; j != v21; j = (char *)j + 1)
          {
            if (*(void *)v63 != v22) {
              objc_enumerationMutation(v19);
            }
            uint64_t v24 = *(void *)(*((void *)&v62 + 1) + 8 * (void)j);
            id v25 = VMStoreRecordGetToken(v24);
            if (v25)
            {
              [v18 addObject:v25];
            }
            else
            {
              __int16 v26 = sub_100048E70();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v27 = (void *)sub_10006E7DC(v24);
                *(_DWORD *)buf = 136315650;
                v75 = "";
                __int16 v76 = 2080;
                double v77 = "";
                __int16 v78 = 2112;
                v79 = v27;
                _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "#I %s%sdo_M2A_merge: (untrashed) No token for record: %@", buf, 0x20u);
              }
            }
          }
          id v21 = [v19 countByEnumeratingWithState:&v62 objects:v72 count:16];
        }
        while (v21);
      }

      uint64_t v3 = v53;
      if ([v18 count]) {
        [v53 moveRecordsToInbox:v18];
      }

      id v17 = v51;
    }

    __int16 v28 = (void *)VMStoreCopyOfAllRecordsWithFlags(1, 1, 0);
    if ([v28 count])
    {
      CFStringRef v29 = objc_opt_new();
      long long v58 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      long long v52 = v28;
      id v30 = v28;
      id v31 = [v30 countByEnumeratingWithState:&v58 objects:v71 count:16];
      if (v31)
      {
        id v32 = v31;
        uint64_t v33 = *(void *)v59;
        do
        {
          for (k = 0; k != v32; k = (char *)k + 1)
          {
            if (*(void *)v59 != v33) {
              objc_enumerationMutation(v30);
            }
            uint64_t v35 = *(void *)(*((void *)&v58 + 1) + 8 * (void)k);
            id v36 = VMStoreRecordGetToken(v35);
            if (v36)
            {
              [v29 addObject:v36];
            }
            else
            {
              long long v37 = sub_100048E70();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
              {
                long long v38 = (void *)sub_10006E7DC(v35);
                *(_DWORD *)buf = 136315650;
                v75 = "";
                __int16 v76 = 2080;
                double v77 = "";
                __int16 v78 = 2112;
                v79 = v38;
                _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "#I %s%sdo_M2A_merge: (read) No token for record: %@", buf, 0x20u);
              }
            }
          }
          id v32 = [v30 countByEnumeratingWithState:&v58 objects:v71 count:16];
        }
        while (v32);
      }

      uint64_t v3 = v53;
      if ([v29 count]) {
        [v53 markRecordsAsRead:v29];
      }

      __int16 v28 = v52;
    }

    long long v39 = VMStoreCopyOfAllDeletedRecords();
    if ([v39 count])
    {
      long long v40 = objc_opt_new();
      long long v54 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      long long v39 = v39;
      id v41 = [v39 countByEnumeratingWithState:&v54 objects:v70 count:16];
      if (v41)
      {
        id v42 = v41;
        uint64_t v43 = *(void *)v55;
        do
        {
          for (m = 0; m != v42; m = (char *)m + 1)
          {
            if (*(void *)v55 != v43) {
              objc_enumerationMutation(v39);
            }
            uint64_t v45 = *(void *)(*((void *)&v54 + 1) + 8 * (void)m);
            long long v46 = VMStoreRecordGetToken(v45);
            if (v46)
            {
              [v40 addObject:v46];
            }
            else
            {
              id v47 = sub_100048E70();
              if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
              {
                char v48 = (void *)sub_10006E7DC(v45);
                *(_DWORD *)buf = 136315650;
                v75 = "";
                __int16 v76 = 2080;
                double v77 = "";
                __int16 v78 = 2112;
                v79 = v48;
                _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "#I %s%sdo_M2A_merge: (deleted) No token for record: %@", buf, 0x20u);
              }
            }
          }
          id v42 = [v39 countByEnumeratingWithState:&v54 objects:v70 count:16];
        }
        while (v42);
      }

      uint64_t v3 = v53;
      if ([v40 count]) {
        [v53 moveRecordsToDeleted:v40];
      }
      goto LABEL_69;
    }
  }
  else
  {
    long long v39 = sub_100048E70();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      long long v49 = *(void **)(a1 + 40);
      long long v40 = [*(id *)(a1 + 32) labelUUIDToService];
      *(_DWORD *)buf = 136315906;
      v75 = "";
      __int16 v76 = 2080;
      double v77 = "";
      __int16 v78 = 2112;
      v79 = v49;
      __int16 v80 = 2112;
      long long v81 = v40;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "#I %s%sM2A merge cannot find account %@ - fatal error. ALL:%@", buf, 0x2Au);
LABEL_69:
    }
  }
}

void sub_10004D378(uint64_t a1)
{
  id v2 = objc_opt_new();
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v3 = *(id *)(a1 + 32);
  id v4 = [v3 countByEnumeratingWithState:&v31 objects:v42 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v26 = a1;
    char v6 = 0;
    uint64_t v7 = *(void *)v32;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v32 != v7) {
          objc_enumerationMutation(v3);
        }
        id v9 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        [v9 integerValue];
        uint64_t v10 = VMStoreCopyRecordWithIdentifier();
        if (v10)
        {
          uint64_t v11 = (const void *)v10;
          CFStringRef v12 = VMStoreRecordCopyDescription(v10);
          if (v12)
          {
            CFStringRef v13 = v12;
            __int16 v14 = sub_100048E70();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315650;
              long long v37 = "";
              __int16 v38 = 2080;
              long long v39 = "";
              __int16 v40 = 2112;
              CFStringRef v41 = v13;
              _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#I %s%sAdding Trashed flag to record %@", buf, 0x20u);
            }

            CFRelease(v13);
          }
          if (sub_100073C18((uint64_t)v11, 1))
          {
            Token = VMStoreRecordGetToken((uint64_t)v11);
            if (Token)
            {
              [v2 addObject:Token];
            }
            else
            {
              id v18 = sub_100048E70();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                id v19 = (__CFString *)sub_10006E7DC(v11);
                *(_DWORD *)buf = 136315650;
                long long v37 = "";
                __int16 v38 = 2080;
                long long v39 = "";
                __int16 v40 = 2112;
                CFStringRef v41 = v19;
                _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "#I %s%smoveRecordsWithIdentifiersToTrash: No token for record: %@", buf, 0x20u);
              }
            }
            char v6 = 1;
          }
          VMStoreRecordRelease(v11);
        }
        else
        {
          __int16 v16 = vm_vmd_log();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            id v17 = (const char *)[v9 integerValue];
            *(_DWORD *)buf = 134217984;
            long long v37 = v17;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "moveRecordsWithIdentifiersToTrash: record with identifier %ld not found", buf, 0xCu);
          }
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v31 objects:v42 count:16];
    }
    while (v5);

    a1 = v26;
    if (v6) {
      VMStoreSave();
    }
  }
  else
  {
  }
  if ([v2 count])
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v20 = [*(id *)(a1 + 40) labelUUIDToService];
    id v21 = [v20 allValues];

    id v22 = [v21 countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v28;
      do
      {
        for (j = 0; j != v23; j = (char *)j + 1)
        {
          if (*(void *)v28 != v24) {
            objc_enumerationMutation(v21);
          }
          [*(id *)(*((void *)&v27 + 1) + 8 * (void)j) moveRecordsToTrash:v2];
        }
        id v23 = [v21 countByEnumeratingWithState:&v27 objects:v35 count:16];
      }
      while (v23);
    }
  }
}

void sub_10004D864(uint64_t a1)
{
  id v2 = objc_opt_new();
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v3 = *(id *)(a1 + 32);
  id v4 = [v3 countByEnumeratingWithState:&v31 objects:v42 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v26 = a1;
    char v6 = 0;
    uint64_t v7 = *(void *)v32;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v32 != v7) {
          objc_enumerationMutation(v3);
        }
        id v9 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        [v9 integerValue];
        uint64_t v10 = VMStoreCopyRecordWithIdentifier();
        if (v10)
        {
          uint64_t v11 = (const void *)v10;
          CFStringRef v12 = VMStoreRecordCopyDescription(v10);
          if (v12)
          {
            CFStringRef v13 = v12;
            __int16 v14 = sub_100048E70();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315650;
              long long v37 = "";
              __int16 v38 = 2080;
              long long v39 = "";
              __int16 v40 = 2112;
              CFStringRef v41 = v13;
              _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#I %s%sRemoving Trashed flag from record %@", buf, 0x20u);
            }

            CFRelease(v13);
          }
          if (sub_100073C18((uint64_t)v11, 0))
          {
            Token = VMStoreRecordGetToken((uint64_t)v11);
            if (Token)
            {
              [v2 addObject:Token];
            }
            else
            {
              id v18 = sub_100048E70();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                id v19 = (__CFString *)sub_10006E7DC(v11);
                *(_DWORD *)buf = 136315650;
                long long v37 = "";
                __int16 v38 = 2080;
                long long v39 = "";
                __int16 v40 = 2112;
                CFStringRef v41 = v19;
                _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "#I %s%smoveRecordsWithIdentifiersToInbox: No token for record: %@", buf, 0x20u);
              }
            }
            char v6 = 1;
          }
          VMStoreRecordRelease(v11);
        }
        else
        {
          __int16 v16 = vm_vmd_log();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            id v17 = (const char *)[v9 integerValue];
            *(_DWORD *)buf = 134217984;
            long long v37 = v17;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "moveRecordsWithIdentifiersToInbox: record with identifier %ld not found", buf, 0xCu);
          }
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v31 objects:v42 count:16];
    }
    while (v5);

    a1 = v26;
    if (v6) {
      VMStoreSave();
    }
  }
  else
  {
  }
  if ([v2 count])
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v20 = [*(id *)(a1 + 40) labelUUIDToService];
    id v21 = [v20 allValues];

    id v22 = [v21 countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v28;
      do
      {
        for (j = 0; j != v23; j = (char *)j + 1)
        {
          if (*(void *)v28 != v24) {
            objc_enumerationMutation(v21);
          }
          [*(id *)(*((void *)&v27 + 1) + 8 * (void)j) moveRecordsToInbox:v2];
        }
        id v23 = [v21 countByEnumeratingWithState:&v27 objects:v35 count:16];
      }
      while (v23);
    }
  }
}

void sub_10004DD50(uint64_t a1)
{
  id v2 = objc_opt_new();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v3 = *(id *)(a1 + 32);
  id v4 = [v3 countByEnumeratingWithState:&v27 objects:v38 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v28;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v28 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        [v8 integerValue];
        uint64_t v9 = VMStoreCopyRecordWithIdentifier();
        if (v9)
        {
          uint64_t v10 = (const void *)v9;
          Token = VMStoreRecordGetToken(v9);
          if (Token)
          {
            [v2 addObject:Token];
          }
          else
          {
            __int16 v14 = sub_100048E70();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v15 = (void *)sub_10006E7DC(v10);
              *(_DWORD *)buf = 136315650;
              long long v33 = "";
              __int16 v34 = 2080;
              uint64_t v35 = "";
              __int16 v36 = 2112;
              long long v37 = v15;
              _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#I %s%smoveRecordsWithIdentifiersToDeleted: No token for record: %@", buf, 0x20u);
            }
          }
          VMStoreRemoveRecord((uint64_t)v10);
          __int16 v16 = (const void *)VMStoreCopyRecordToDeleted((uint64_t)v10);
          VMStoreRecordRelease(v16);
          VMStoreRecordRelease(v10);
        }
        else
        {
          CFStringRef v12 = vm_vmd_log();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            CFStringRef v13 = (const char *)[v8 integerValue];
            *(_DWORD *)buf = 134217984;
            long long v33 = v13;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "moveRecordsWithIdentifiersToDeleted: record with identifier %ld not found", buf, 0xCu);
          }
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v27 objects:v38 count:16];
    }
    while (v5);
  }

  if ([v2 count])
  {
    VMStoreSave();
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v17 = [*(id *)(a1 + 40) labelUUIDToService];
    id v18 = [v17 allValues];

    id v19 = [v18 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v24;
      do
      {
        for (j = 0; j != v20; j = (char *)j + 1)
        {
          if (*(void *)v24 != v21) {
            objc_enumerationMutation(v18);
          }
          [*(id *)(*((void *)&v23 + 1) + 8 * (void)j) moveRecordsToDeleted:v2];
        }
        id v20 = [v18 countByEnumeratingWithState:&v23 objects:v31 count:16];
      }
      while (v20);
    }
  }
}

void sub_10004E10C(uint64_t a1)
{
  id v2 = objc_opt_new();
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v3 = *(id *)(a1 + 32);
  id v4 = [v3 countByEnumeratingWithState:&v30 objects:v41 count:16];
  if (v4)
  {
    id v5 = v4;
    char v6 = 0;
    uint64_t v7 = *(void *)v31;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v31 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        [v9 integerValue];
        uint64_t v10 = VMStoreCopyRecordWithIdentifier();
        if (v10)
        {
          uint64_t v11 = (const void *)v10;
          if (sub_100073CA4(v10, 1))
          {
            CFStringRef v12 = VMStoreRecordCopyDescription((uint64_t)v11);
            if (v12)
            {
              CFStringRef v13 = v12;
              __int16 v14 = sub_100048E70();
              if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315650;
                __int16 v36 = "";
                __int16 v37 = 2080;
                __int16 v38 = "";
                __int16 v39 = 2112;
                CFStringRef v40 = v13;
                _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#I %s%sAdding Read flag to record %@", buf, 0x20u);
              }

              CFRelease(v13);
            }
            Token = VMStoreRecordGetToken((uint64_t)v11);
            if (Token)
            {
              [v2 addObject:Token];
            }
            else
            {
              id v18 = sub_100048E70();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                id v19 = (__CFString *)sub_10006E7DC(v11);
                *(_DWORD *)buf = 136315650;
                __int16 v36 = "";
                __int16 v37 = 2080;
                __int16 v38 = "";
                __int16 v39 = 2112;
                CFStringRef v40 = v19;
                _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "#I %s%smarkRecordsWithIdentifiersAsRead: No token for record: %@", buf, 0x20u);
              }
            }
            char v6 = 1;
          }
          VMStoreRecordRelease(v11);
        }
        else
        {
          __int16 v16 = vm_vmd_log();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            id v17 = (const char *)[v9 integerValue];
            *(_DWORD *)buf = 134217984;
            __int16 v36 = v17;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "markRecordsWithIdentifiersAsRead: record with identifier %ld not found", buf, 0xCu);
          }
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v30 objects:v41 count:16];
    }
    while (v5);

    if (v6) {
      VMStoreSave();
    }
  }
  else
  {
  }
  if ([v2 count])
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v20 = [*(id *)(a1 + 40) labelUUIDToService];
    uint64_t v21 = [v20 allValues];

    id v22 = [v21 countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v27;
      do
      {
        for (j = 0; j != v23; j = (char *)j + 1)
        {
          if (*(void *)v27 != v24) {
            objc_enumerationMutation(v21);
          }
          [*(id *)(*((void *)&v26 + 1) + 8 * (void)j) markRecordsAsRead:v2];
        }
        id v23 = [v21 countByEnumeratingWithState:&v26 objects:v34 count:16];
      }
      while (v23);
    }
  }
}

void sub_10004E5F4(uint64_t a1)
{
  id v2 = objc_opt_new();
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v3 = *(id *)(a1 + 32);
  id v4 = [v3 countByEnumeratingWithState:&v31 objects:v42 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v26 = a1;
    char v6 = 0;
    uint64_t v7 = *(void *)v32;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v32 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        CFTypeRef v10 = sub_100072F10(v9);
        if (v10)
        {
          uint64_t v11 = v10;
          CFStringRef v12 = VMStoreRecordCopyDescription((uint64_t)v10);
          if (v12)
          {
            CFStringRef v13 = v12;
            __int16 v14 = sub_100048E70();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315650;
              __int16 v37 = "";
              __int16 v38 = 2080;
              __int16 v39 = "";
              __int16 v40 = 2112;
              CFStringRef v41 = v13;
              _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#I %s%sAdding Trashed flag to record %@", buf, 0x20u);
            }

            CFRelease(v13);
          }
          if (sub_100073C18((uint64_t)v11, 1))
          {
            Token = VMStoreRecordGetToken((uint64_t)v11);
            if (Token)
            {
              [v2 addObject:Token];
            }
            else
            {
              id v18 = sub_100048E70();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                id v19 = (__CFString *)sub_10006E7DC(v11);
                *(_DWORD *)buf = 136315650;
                __int16 v37 = "";
                __int16 v38 = 2080;
                __int16 v39 = "";
                __int16 v40 = 2112;
                CFStringRef v41 = v19;
                _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "#I %s%smoveRecordsWithUniqueIdentifiersToTrash: No token for record: %@", buf, 0x20u);
              }
            }
            char v6 = 1;
          }
          VMStoreRecordRelease(v11);
        }
        else
        {
          __int16 v16 = vm_vmd_log();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            id v17 = [v9 UUIDString];
            *(_DWORD *)buf = 138412290;
            __int16 v37 = v17;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "moveRecordsWithUniqueIdentifiersToTrash: record with UUID %@ not found", buf, 0xCu);
          }
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v31 objects:v42 count:16];
    }
    while (v5);

    a1 = v26;
    if (v6) {
      VMStoreSave();
    }
  }
  else
  {
  }
  if ([v2 count])
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v20 = [*(id *)(a1 + 40) labelUUIDToService];
    uint64_t v21 = [v20 allValues];

    id v22 = [v21 countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v28;
      do
      {
        for (j = 0; j != v23; j = (char *)j + 1)
        {
          if (*(void *)v28 != v24) {
            objc_enumerationMutation(v21);
          }
          [*(id *)(*((void *)&v27 + 1) + 8 * (void)j) moveRecordsToTrash:v2];
        }
        id v23 = [v21 countByEnumeratingWithState:&v27 objects:v35 count:16];
      }
      while (v23);
    }
  }
}

void sub_10004EAE8(uint64_t a1)
{
  id v2 = objc_opt_new();
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v3 = *(id *)(a1 + 32);
  id v4 = [v3 countByEnumeratingWithState:&v31 objects:v42 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v26 = a1;
    char v6 = 0;
    uint64_t v7 = *(void *)v32;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v32 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        CFTypeRef v10 = sub_100072F10(v9);
        if (v10)
        {
          uint64_t v11 = v10;
          CFStringRef v12 = VMStoreRecordCopyDescription((uint64_t)v10);
          if (v12)
          {
            CFStringRef v13 = v12;
            __int16 v14 = sub_100048E70();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315650;
              __int16 v37 = "";
              __int16 v38 = 2080;
              __int16 v39 = "";
              __int16 v40 = 2112;
              CFStringRef v41 = v13;
              _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#I %s%sRemoving Trashed flag from record %@", buf, 0x20u);
            }

            CFRelease(v13);
          }
          if (sub_100073C18((uint64_t)v11, 0))
          {
            Token = VMStoreRecordGetToken((uint64_t)v11);
            if (Token)
            {
              [v2 addObject:Token];
            }
            else
            {
              id v18 = sub_100048E70();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                id v19 = (__CFString *)sub_10006E7DC(v11);
                *(_DWORD *)buf = 136315650;
                __int16 v37 = "";
                __int16 v38 = 2080;
                __int16 v39 = "";
                __int16 v40 = 2112;
                CFStringRef v41 = v19;
                _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "#I %s%smoveRecordsWithUniqueIdentifiersToInbox: No token for record: %@", buf, 0x20u);
              }
            }
            char v6 = 1;
          }
          VMStoreRecordRelease(v11);
        }
        else
        {
          __int16 v16 = vm_vmd_log();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            id v17 = [v9 UUIDString];
            *(_DWORD *)buf = 138412290;
            __int16 v37 = v17;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "moveRecordsWithUniqueIdentifiersToInbox: record with UUID %@ not found", buf, 0xCu);
          }
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v31 objects:v42 count:16];
    }
    while (v5);

    a1 = v26;
    if (v6) {
      VMStoreSave();
    }
  }
  else
  {
  }
  if ([v2 count])
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v20 = [*(id *)(a1 + 40) labelUUIDToService];
    uint64_t v21 = [v20 allValues];

    id v22 = [v21 countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v28;
      do
      {
        for (j = 0; j != v23; j = (char *)j + 1)
        {
          if (*(void *)v28 != v24) {
            objc_enumerationMutation(v21);
          }
          [*(id *)(*((void *)&v27 + 1) + 8 * (void)j) moveRecordsToInbox:v2];
        }
        id v23 = [v21 countByEnumeratingWithState:&v27 objects:v35 count:16];
      }
      while (v23);
    }
  }
}

void sub_10004EFDC(uint64_t a1)
{
  id v2 = objc_opt_new();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v3 = *(id *)(a1 + 32);
  id v4 = [v3 countByEnumeratingWithState:&v27 objects:v38 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v28;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v28 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        CFTypeRef v9 = sub_100072F10(v8);
        if (v9)
        {
          CFTypeRef v10 = v9;
          Token = VMStoreRecordGetToken((uint64_t)v9);
          if (Token)
          {
            [v2 addObject:Token];
          }
          else
          {
            __int16 v14 = sub_100048E70();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v15 = (void *)sub_10006E7DC(v10);
              *(_DWORD *)buf = 136315650;
              long long v33 = "";
              __int16 v34 = 2080;
              uint64_t v35 = "";
              __int16 v36 = 2112;
              __int16 v37 = v15;
              _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#I %s%smoveRecordsWithUniqueIdentifiersToDeleted: No token for record: %@", buf, 0x20u);
            }
          }
          VMStoreRemoveRecord((uint64_t)v10);
          __int16 v16 = (const void *)VMStoreCopyRecordToDeleted((uint64_t)v10);
          VMStoreRecordRelease(v16);
          VMStoreRecordRelease(v10);
        }
        else
        {
          CFStringRef v12 = vm_vmd_log();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            CFStringRef v13 = [v8 UUIDString];
            *(_DWORD *)buf = 138412290;
            long long v33 = v13;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "moveRecordsWithUniqueIdentifiersToDeleted: record with UUID %@ not found", buf, 0xCu);
          }
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v27 objects:v38 count:16];
    }
    while (v5);
  }

  if ([v2 count])
  {
    VMStoreSave();
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v17 = [*(id *)(a1 + 40) labelUUIDToService];
    id v18 = [v17 allValues];

    id v19 = [v18 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v24;
      do
      {
        for (j = 0; j != v20; j = (char *)j + 1)
        {
          if (*(void *)v24 != v21) {
            objc_enumerationMutation(v18);
          }
          [*(id *)(*((void *)&v23 + 1) + 8 * (void)j) moveRecordsToDeleted:v2];
        }
        id v20 = [v18 countByEnumeratingWithState:&v23 objects:v31 count:16];
      }
      while (v20);
    }
  }
}

void sub_10004F3A0(uint64_t a1)
{
  id v2 = objc_opt_new();
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v3 = *(id *)(a1 + 32);
  id v4 = [v3 countByEnumeratingWithState:&v31 objects:v42 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v26 = a1;
    char v6 = 0;
    uint64_t v7 = *(void *)v32;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v32 != v7) {
          objc_enumerationMutation(v3);
        }
        CFTypeRef v9 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        CFTypeRef v10 = sub_100072F10(v9);
        if (v10)
        {
          uint64_t v11 = v10;
          if (sub_100073CA4((uint64_t)v10, 1))
          {
            CFStringRef v12 = VMStoreRecordCopyDescription((uint64_t)v11);
            if (v12)
            {
              CFStringRef v13 = v12;
              __int16 v14 = sub_100048E70();
              if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315650;
                __int16 v37 = "";
                __int16 v38 = 2080;
                __int16 v39 = "";
                __int16 v40 = 2112;
                CFStringRef v41 = v13;
                _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#I %s%sAdding Read flag to record %@", buf, 0x20u);
              }

              CFRelease(v13);
            }
            Token = VMStoreRecordGetToken((uint64_t)v11);
            if (Token)
            {
              [v2 addObject:Token];
            }
            else
            {
              id v18 = sub_100048E70();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                id v19 = (__CFString *)sub_10006E7DC(v11);
                *(_DWORD *)buf = 136315650;
                __int16 v37 = "";
                __int16 v38 = 2080;
                __int16 v39 = "";
                __int16 v40 = 2112;
                CFStringRef v41 = v19;
                _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "#I %s%smarkRecordsWithUniqueIdentifiersAsRead: No token for record: %@", buf, 0x20u);
              }
            }
            char v6 = 1;
          }
          VMStoreRecordRelease(v11);
        }
        else
        {
          __int16 v16 = vm_vmd_log();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            id v17 = [v9 UUIDString];
            *(_DWORD *)buf = 138412290;
            __int16 v37 = v17;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "markRecordsWithUniqueIdentifiersAsRead: record with UUID %@ not found", buf, 0xCu);
          }
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v31 objects:v42 count:16];
    }
    while (v5);

    a1 = v26;
    if (v6) {
      VMStoreSave();
    }
  }
  else
  {
  }
  if ([v2 count])
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v20 = [*(id *)(a1 + 40) labelUUIDToService];
    uint64_t v21 = [v20 allValues];

    id v22 = [v21 countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v28;
      do
      {
        for (j = 0; j != v23; j = (char *)j + 1)
        {
          if (*(void *)v28 != v24) {
            objc_enumerationMutation(v21);
          }
          [*(id *)(*((void *)&v27 + 1) + 8 * (void)j) markRecordsAsRead:v2];
        }
        id v23 = [v21 countByEnumeratingWithState:&v27 objects:v35 count:16];
      }
      while (v23);
    }
  }
}

uint64_t sub_10004F814(uint64_t a1)
{
  id v2 = sub_100048E70();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v17 = 136315906;
    id v18 = "";
    __int16 v19 = 2080;
    id v20 = "";
    __int16 v21 = 2112;
    uint64_t v22 = v3;
    __int16 v23 = 2112;
    uint64_t v24 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "#I %s%sReceived remapAccount from:%@ to:%@", (uint8_t *)&v17, 0x2Au);
  }

  CFArrayRef v5 = (const __CFArray *)VMMain_StoreCopyMainRecordsWithLabelID(*(void **)(a1 + 32));
  if (v5)
  {
    CFArrayRef v6 = v5;
    if (CFArrayGetCount(v5) >= 1)
    {
      CFIndex v7 = 0;
      do
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v6, v7);
        VMStoreRecordSetLabel((uint64_t)ValueAtIndex, *(void **)(a1 + 40));
        ++v7;
      }
      while (v7 < CFArrayGetCount(v6));
    }
    CFTypeRef v9 = sub_100048E70();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int Count = CFArrayGetCount(v6);
      int v17 = 136315650;
      id v18 = "";
      __int16 v19 = 2080;
      id v20 = "";
      __int16 v21 = 1024;
      LODWORD(v22) = Count;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#I %s%sremapped %d records", (uint8_t *)&v17, 0x1Cu);
    }

    CFRelease(v6);
  }
  else
  {
    uint64_t v11 = sub_100048E70();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 136315394;
      id v18 = "";
      __int16 v19 = 2080;
      id v20 = "";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#I %s%snothing to remap", (uint8_t *)&v17, 0x16u);
    }
  }
  CFStringRef v12 = (void *)VMMap_copyAccountForLabel(*(void **)(a1 + 32));
  if (v12)
  {
    CFStringRef v13 = v12;
    CFTypeRef v14 = VMMap_copyRecordWithLabel(*(void **)(a1 + 32));
    if (v14)
    {
      uint64_t v15 = v14;
      VMMap_removeRecord();
      CFRelease(v15);
    }
    sub_100079AD0(v13);
    CFRelease(v13);
  }
  return VMStoreSave();
}

void sub_10004FAE4(uint64_t a1)
{
  id v2 = sub_100048E70();
  uint64_t v3 = "rGreetingDataSource\"";
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v40 = "";
    __int16 v41 = 2080;
    id v42 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "#I %s%sresetNetworkSettings called", buf, 0x16u);
  }

  uint64_t v4 = [*(id *)(a1 + 32) labelUUIDToService];
  [v4 removeAllObjects];

  CFArrayRef v5 = [*(id *)(a1 + 32) labelUUIDToGreetingController];
  [v5 removeAllObjects];

  CFArrayRef v6 = sub_100048E70();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v40 = "";
    __int16 v41 = 2080;
    id v42 = "";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#I %s%sreleased all service controllers", buf, 0x16u);
  }

  CFIndex v7 = +[VMPreferences sharedInstance];
  [v7 setPreferencesValue:0 forKey:@"LastActiveAccounts"];

  id v8 = sub_10006D758();
  id v9 = [v8 path];
  CFTypeRef v10 = opendir((const char *)[v9 UTF8String]);

  if (v10)
  {
    for (i = readdir(v10); i; i = readdir(v10))
    {
      unsigned int d_namlen = i->d_namlen;
      if (i->d_type == 4)
      {
        if (d_namlen < 3) {
          continue;
        }
        d_name = i->d_name;
        if (strncmp(i->d_name, "A-", 2uLL)) {
          continue;
        }
        CFTypeRef v14 = sub_100048E70();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          __int16 v40 = "";
          __int16 v41 = 2080;
          id v42 = "";
          __int16 v43 = 2080;
          long long v44 = d_name;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#I %s%sremoving account dir = %s", buf, 0x20u);
        }

        uint64_t v15 = sub_10006D758();
        __int16 v16 = +[NSString stringWithUTF8String:d_name];
        int v17 = [v15 URLByAppendingPathComponent:v16 isDirectory:1];

        id v18 = +[NSFileManager defaultManager];
        id v38 = 0;
        unsigned int v19 = [v18 removeItemAtURL:v17 error:&v38];
        id v20 = v38;

        __int16 v21 = sub_100048E70();
        uint64_t v22 = v21;
        if (v19)
        {
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            __int16 v40 = "";
            __int16 v41 = 2080;
            id v42 = "";
            __int16 v43 = 2112;
            long long v44 = v17;
            __int16 v23 = v22;
            uint64_t v24 = "#I %s%sRemoved account directory at %@";
LABEL_22:
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, v24, buf, 0x20u);
          }
        }
        else if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315906;
          __int16 v40 = "";
          __int16 v41 = 2080;
          id v42 = "";
          __int16 v43 = 2112;
          long long v44 = v17;
          __int16 v45 = 2112;
          id v46 = v20;
          long long v31 = v22;
          long long v32 = "#E %s%sCould not remove directory at %@ due to error %@";
LABEL_30:
          _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, v32, buf, 0x2Au);
        }
      }
      else
      {
        if (d_namlen < 5) {
          continue;
        }
        long long v25 = i->d_name;
        if (strncmp(i->d_name, "SMS-", 4uLL)) {
          continue;
        }
        uint64_t v26 = sub_100048E70();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          __int16 v40 = "";
          __int16 v41 = 2080;
          id v42 = "";
          __int16 v43 = 2080;
          long long v44 = v25;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "#I %s%sremoving account SMS plist = %s", buf, 0x20u);
        }

        long long v27 = sub_10006D758();
        long long v28 = +[NSString stringWithUTF8String:v25];
        int v17 = [v27 URLByAppendingPathComponent:v28 isDirectory:0];

        long long v29 = +[NSFileManager defaultManager];
        id v37 = 0;
        LODWORD(v27) = [v29 removeItemAtURL:v17 error:&v37];
        id v20 = v37;

        long long v30 = sub_100048E70();
        uint64_t v22 = v30;
        if (v27)
        {
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            __int16 v40 = "";
            __int16 v41 = 2080;
            id v42 = "";
            __int16 v43 = 2112;
            long long v44 = v17;
            __int16 v23 = v22;
            uint64_t v24 = "#I %s%sRemoved account SMS file at %@";
            goto LABEL_22;
          }
        }
        else if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315906;
          __int16 v40 = "";
          __int16 v41 = 2080;
          id v42 = "";
          __int16 v43 = 2112;
          long long v44 = v17;
          __int16 v45 = 2112;
          id v46 = v20;
          long long v31 = v22;
          long long v32 = "#E %s%sCould not remove account SMS file at %@ due to error %@";
          goto LABEL_30;
        }
      }
    }
    closedir(v10);
    uint64_t v3 = "@\"VMDCarrierGreetingDataSource\"" + 11;
  }
  else
  {
    long long v33 = sub_100048E70();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      long long v34 = sub_10006D758();
      uint64_t v35 = [v34 path];
      *(_DWORD *)buf = 136315650;
      __int16 v40 = "";
      __int16 v41 = 2080;
      id v42 = "";
      __int16 v43 = 2112;
      long long v44 = v35;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "#I %s%sunable to open %@", buf, 0x20u);
    }
  }
  __int16 v36 = sub_100048E70();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = *((void *)v3 + 474);
    __int16 v40 = "";
    __int16 v41 = 2080;
    id v42 = "";
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "#I %s%sresetNetworkSettings complete", buf, 0x16u);
  }
}

void sub_100050280(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100050298(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) labelUUIDToService];
  uint64_t v2 = [v5 objectForKey:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_1000503A4(uint64_t a1)
{
  uint64_t v3 = VMStoreRecordGetLabel(*(void *)(a1 + 40));
  uint64_t v4 = [*(id *)(a1 + 32) serviceForLabel:v3];
  [v4 retrieveDataForRecord:*(void *)(a1 + 40)];

  id v5 = *(const void **)(a1 + 40);
  CFRelease(v5);
}

void sub_1000504C4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) transcriptionService];
  [v2 reportTranscriptionProblemForRecord:*(void *)(a1 + 40)];

  uint64_t v3 = *(const void **)(a1 + 40);
  CFRelease(v3);
}

void sub_1000505BC(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) transcriptionService];
  [v2 reportTranscriptionRatedAccurate:*(unsigned __int8 *)(a1 + 48) forRecord:*(void *)(a1 + 40)];

  uint64_t v3 = *(const void **)(a1 + 40);
  CFRelease(v3);
}

void sub_100050894(id a1)
{
  id v1 = +[NSNotificationCenter defaultCenter];
  [v1 postNotificationName:@"VVServiceCheckSubscriptionStatusNotification" object:0 userInfo:0];
}

void sub_1000524F4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.voicemail", "main.ctl");
  uint64_t v2 = (void *)qword_1000E0968;
  qword_1000E0968 = (uint64_t)v1;
}

void sub_100052558(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

void sub_100052A04(uint64_t a1)
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v2 = [*(id *)(a1 + 32) delegateToQueue];
  id v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v13;
    do
    {
      CFArrayRef v6 = 0;
      do
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v12 + 1) + 8 * (void)v6);
        if (objc_opt_respondsToSelector())
        {
          id v8 = [*(id *)(a1 + 32) delegateToQueue];
          uint64_t v9 = [v8 objectForKey:v7];

          v11[0] = _NSConcreteStackBlock;
          v11[1] = 3221225472;
          v11[2] = sub_100052BA8;
          v11[3] = &unk_1000C11B8;
          uint64_t v10 = *(void *)(a1 + 32);
          void v11[4] = v7;
          void v11[5] = v10;
          dispatch_async(v9, v11);
        }
        CFArrayRef v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }
}

id sub_100052BA8(uint64_t a1)
{
  return [*(id *)(a1 + 32) accountsDidChangeForAccountManager:*(void *)(a1 + 40)];
}

void sub_100052D24(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) accountDir];
  os_log_t v1 = [v4 URLByAppendingPathComponent:@"Checkpoint.plist" isDirectory:0];
  uint64_t v2 = [v1 path];
  id v3 = (void *)qword_1000E0978;
  qword_1000E0978 = v2;
}

void sub_10005335C(uint64_t a1)
{
  id v2 = objc_alloc((Class)NSArray);
  id v7 = +[NSBundle bundleForClass:objc_opt_class()];
  id v3 = [v7 pathForResource:@"VerifierKeys" ofType:@"plist"];
  id v4 = [v2 initWithContentsOfFile:v3];
  uint64_t v5 = *(void *)(a1 + 32);
  CFArrayRef v6 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v4;
}

BOOL sub_100054A10(id a1, NSString *a2, NSDictionary *a3)
{
  id v3 = [(NSString *)a2 pathExtension];
  unsigned __int8 v4 = [v3 isEqualToString:@"asset"];

  return v4;
}

id sub_100054B20(uint64_t a1, uint64_t a2)
{
  id v3 = [@"/var/MobileAsset/Assets/com_apple_MobileAsset_EmbeddedSpeech" stringByAppendingPathComponent:a2];
  id v4 = [*(id *)(a1 + 32) speechAssetHasConfidenceModel:v3];

  return v4;
}

void sub_10005551C(uint64_t a1, uint64_t a2)
{
  id v3 = +[VMVoicemail messageForRecord:a2 forContexts:0 andIsoCodes:0];
  if (v3)
  {
    id v4 = v3;
    [*(id *)(a1 + 32) addObject:v3];
    id v3 = v4;
  }
}

id sub_1000556C0(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) voicemailWasTranscribedWithoutConfidence:a2];
}

id sub_1000557B4(id result, char a2)
{
  if ((a2 & 1) == 0)
  {
    id v2 = result;
    id v3 = vm_vmd_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = NSStringFromSelector(*((SEL *)v2 + 6));
      uint64_t v5 = +[NSString stringWithFormat:@"Transcription cancelled for voicemail: %@. Removing from attempted voicemails.", *((void *)v2 + 4)];
      *(_DWORD *)buf = 138412546;
      id v7 = v4;
      __int16 v8 = 2112;
      uint64_t v9 = v5;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@: %@", buf, 0x16u);
    }
    return [*((id *)v2 + 5) cancelAttemptedVoicemailTranscriptionForVoicemail:*((void *)v2 + 4)];
  }
  return result;
}

void sub_100055D10(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = vm_vmd_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = NSStringFromSelector(*(SEL *)(a1 + 40));
    CFArrayRef v6 = +[NSString stringWithFormat:@"Queueing voicemail for retranscription: %@", v3];
    *(_DWORD *)buf = 138412546;
    __int16 v8 = v5;
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@: %@", buf, 0x16u);
  }
  [*(id *)(a1 + 32) processTranscriptForVoicemail:v3];
}

id sub_100056068(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startRetranscribingVoicemailsIfNecessaryTranscribingAllVoicemails:1];
}

void sub_10005612C(void *a1, int a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint8_t buf)
{
  _os_log_error_impl(a1, v11, OS_LOG_TYPE_ERROR, a4, &buf, 0x16u);
}

void sub_100056170(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

id sub_1000570E0()
{
  return kVMGreetingChangedNotificationName;
}

id sub_1000570F0()
{
  return kVMMailboxChangedNotificationName;
}

id sub_100057100()
{
  return kVMServerChangedNotificationName;
}

id sub_100057110()
{
  return kVMStateNotificationName;
}

id sub_100057120()
{
  return kVMUnrecognizedCommandNotificationName;
}

id sub_100057130()
{
  return kVMNotificationLoginKey;
}

id sub_100057140()
{
  return kVMNotificationPasswordKey;
}

id sub_100057150()
{
  return kVMNotificationStateKey;
}

id sub_100057160()
{
  return kVMNotificationNameKey;
}

id sub_100057170()
{
  return kVMNotificationHostKey;
}

id sub_100057180()
{
  return kVMNotificationPortKey;
}

id sub_100057190()
{
  return kVMNotificationMWIKey;
}

id sub_1000571A0()
{
  if (qword_1000E0998 != -1) {
    dispatch_once(&qword_1000E0998, &stru_1000C2868);
  }
  uint64_t v0 = (void *)qword_1000E0990;
  return v0;
}

void sub_1000571F4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.voicemail", "imap.syn");
  id v2 = (void *)qword_1000E0990;
  qword_1000E0990 = (uint64_t)v1;
}

void sub_100057BA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16, void *a17, void *a18, void *a19, void *a20,void *a21,void *a22,void *a23,void *a24)
{
  _Unwind_Resume(a1);
}

void sub_100057D4C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v8 = a2;
  __int16 v9 = v8;
  if (v8 && a4 && a5)
  {
    [v8 onVMStoreRecordFlagsChangedNotification:a3 object:a4 userInfo:a5];
  }
  else
  {
    uint64_t v10 = vm_vmd_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000819BC(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
}

void sub_100057DD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100057DE8(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v8 = a2;
  __int16 v9 = v8;
  if (v8 && a4 && a5)
  {
    [v8 onVMStoreRecordFlagsDidChangeNotification:a3 object:a4 userInfo:a5];
  }
  else
  {
    uint64_t v10 = vm_vmd_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000819F4(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
}

void sub_100057E70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100057E84(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v8 = a2;
  __int16 v9 = v8;
  if (v8 && a4 && a5)
  {
    [v8 onVMStoreRecordFlagsWillChangeNotification:a3 object:a4 userInfo:a5];
  }
  else
  {
    uint64_t v10 = vm_vmd_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100081A2C(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
}

void sub_100057F0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100057F20(void *a1)
{
  id v1 = a1;
  id v2 = objc_opt_new();
  id v3 = +[NSNumber numberWithInteger:1];
  [v2 setObject:v3 forKey:@"NotAvailable"];

  id v4 = +[NSNumber numberWithInteger:2];
  [v2 setObject:v4 forKey:@"NewAccount"];

  uint64_t v5 = +[NSNumber numberWithInteger:3];
  [v2 setObject:v5 forKey:@"Active"];

  if (v1)
  {
    CFArrayRef v6 = [v2 objectForKeyedSubscript:v1];
    id v7 = [v6 integerValue];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

void sub_100058038(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100058218(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  uint64_t v10 = v9;

  a9.super_class = (Class)IMAPService;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1000582F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000583B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100058470(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100058488(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 457);
  return result;
}

uint64_t sub_100058518(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  int v2 = *(unsigned __int8 *)(result + 40);
  if (*(unsigned __int8 *)(v1 + 457) != v2) {
    *(unsigned char *)(v1 + 457) = v2;
  }
  return result;
}

void sub_1000585B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000586A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Unwind_Resume(a1);
}

id sub_1000586C8(uint64_t a1, uint64_t a2)
{
  id result = objc_retainBlock(*(id *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void sub_1000586F4(uint64_t a1)
{
}

void sub_1000586FC(uint64_t a1)
{
  id v2 = objc_retainBlock(*(id *)(*(void *)(a1 + 32) + 464));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_1000587E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1000587FC(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 464) != v2)
  {
    id v4 = [v2 copy];
    uint64_t v5 = *(void *)(a1 + 32);
    CFArrayRef v6 = *(void **)(v5 + 464);
    *(void *)(v5 + 464) = v4;
  }
}

void sub_100058948(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100058968(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100058978(uint64_t a1)
{
}

void sub_100058980(uint64_t a1)
{
}

void sub_100058A30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100058A48(uint64_t a1)
{
  id v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 472);
  if (v3 != v2)
  {
    [v3 invalidateServiceAccount];
    [*(id *)(a1 + 32) scheduleReleaseAllAccountConnections:*(void *)(*(void *)(a1 + 32) + 472) reason:@"setServiceAccount" forService:*(void *)(a1 + 32)];
    id v4 = *(void **)(a1 + 40);
    uint64_t v5 = (id *)(*(void *)(a1 + 32) + 472);
    objc_storeStrong(v5, v4);
  }
}

void sub_100058B0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100059410(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_10005964C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000596BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

CFStringRef sub_1000596CC(int a1)
{
  CFStringRef v1 = @"Unknown";
  if (a1 == 30) {
    CFStringRef v1 = @"IPv6";
  }
  if (a1 == 2) {
    return @"IPv4";
  }
  else {
    return v1;
  }
}

BOOL sub_1000596F8(int a1)
{
  return a1 == 2 || a1 == 30;
}

BOOL sub_100059708(unsigned __int8 *a1, unsigned __int8 *a2, unsigned int a3)
{
  unint64_t v3 = (unint64_t)a3 >> 3;
  if (a3 >= 8)
  {
    if (v3 <= 1) {
      unint64_t v4 = 1;
    }
    else {
      unint64_t v4 = (unint64_t)a3 >> 3;
    }
    uint64_t v5 = a2;
    CFArrayRef v6 = a1;
    do
    {
      int v8 = *v5++;
      int v7 = v8;
      int v9 = *v6++;
      if (v7 != v9) {
        return 0;
      }
    }
    while (--v4);
  }
  return (a3 & 7) == 0 || !((a1[v3] ^ a2[v3]) >> (8 - (a3 & 7)));
}

void sub_10005A08C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,void *a23,void *a24,void *a25,void *a26)
{
  _Unwind_Resume(a1);
}

void sub_10005A580(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_10005A9AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10005B4D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, uint64_t a20,void *a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *a26,void *a27)
{
  _Unwind_Resume(a1);
}

void sub_10005B7C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10005B910(uint64_t a1)
{
  id WeakRetained = (id **)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    unint64_t v3 = +[MFMonitoredInvocation invocationWithSelector:"releaseAllConnections" target:*(void *)(a1 + 32) taskName:&stru_1000C35D8 priority:3 canBeCancelled:0];
    [v3 retainArguments];
    unint64_t v4 = [WeakRetained _messageChangeQueue];
    uint64_t v5 = sub_100020EE0(WeakRetained[55]);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [WeakRetained getServiceObjLogPrefix];
      int v7 = [v3 monitor];
      int v8 = [v3 monitor];
      uint64_t v9 = *(void *)(a1 + 40);
      int v14 = 136316674;
      id v15 = v6;
      __int16 v16 = 2080;
      uint64_t v17 = " ";
      __int16 v18 = 2112;
      unsigned int v19 = v4;
      __int16 v20 = 2048;
      __int16 v21 = v7;
      __int16 v22 = 2112;
      __int16 v23 = v8;
      __int16 v24 = 2112;
      uint64_t v25 = v9;
      __int16 v26 = 2112;
      long long v27 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#I %s%s[IVQ] queue:%@, monitor:%p.'%@', schedule: %@; dropping connections => %@",
        (uint8_t *)&v14,
        0x48u);
    }
    uint64_t v10 = *(void **)(a1 + 48);
    uint64_t v11 = [v3 monitor];
    [v10 addScheduledActivity:v11];

    [v4 addInvocation:v3];
  }
  else
  {
    uint64_t v12 = vm_imap_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = *(void **)(a1 + 40);
      int v14 = 138412290;
      id v15 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "doing postmortem releaseAllConnections %@;",
        (uint8_t *)&v14,
        0xCu);
    }

    [*(id *)(a1 + 32) releaseAllConnections];
  }
}

void sub_10005BB44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10005BC08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10005BD4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10005BF80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10005C058(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10005C1BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10005C25C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10005C3C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10005C504(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10005C578(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10005CCE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10005CF2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_10005D19C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v17);

  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10005D1EC(uint64_t a1, void *a2)
{
  unint64_t v3 = a2;
  id WeakRetained = (id **)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = sub_100020EE0(WeakRetained[55]);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315394;
      id v11 = [v5 getServiceObjLogPrefix];
      __int16 v12 = 2080;
      uint64_t v13 = " ";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#I %s%sPerforming STATE request beacon retry.", (uint8_t *)&v10, 0x16u);
    }

    if (xpc_activity_get_state(v3) == 2)
    {
      [v5 setBeaconActive:0];
      [v5 _startBeacon];
      if (!xpc_activity_set_state(v3, 5))
      {
        int v7 = sub_100020EE0(v5[55]);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          id v8 = [v5 getServiceObjLogPrefix];
          uint64_t v9 = [v5 beaconRetryActivityIdentifier];
          int v10 = 136315650;
          id v11 = v8;
          __int16 v12 = 2080;
          uint64_t v13 = " ";
          __int16 v14 = 2112;
          id v15 = v9;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#I %s%sUnable to transition %@ activity to state done", (uint8_t *)&v10, 0x20u);
        }
      }
    }
  }
}

void sub_10005D3B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10005D5D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10005D61C(uint64_t a1)
{
  [*(id *)(a1 + 32) cancelDelayedSynchronize:@"AuthenticationFailed"];
  id v2 = *(void **)(a1 + 32);
  return [v2 resetDelayedSynchronizationAttemptCount];
}

void sub_10005D784(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10005DB98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10005DD70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10005DDEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10005E2F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10005E744(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10005E7D8(const __CFArray *a1, const __CFArray *a2)
{
  unsigned int v3 = objc_msgSend((id)CFArrayGetValueAtIndex(a1, 1), "unsignedIntValue");
  unsigned int v4 = objc_msgSend((id)CFArrayGetValueAtIndex(a2, 1), "unsignedIntValue");
  if (v3 < v4) {
    return -1;
  }
  else {
    return v3 > v4;
  }
}

void sub_10005E8A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10005E968(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10005E9BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10005EA18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10005ED30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10005EE40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10005F038(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10005F218(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10005F5D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_10005FAE4(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,long long buf,int a26,__int16 a27,__int16 a28,id a29,__int16 a30)
{
  if (a2)
  {

    if (a2 == 2)
    {
      id v38 = objc_begin_catch(a1);
      __int16 v39 = sub_100020EE0(*(id **)&v31[v35]);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        id v40 = [v31 getServiceObjLogPrefix];
        LODWORD(buf) = 136315906;
        *(void *)((char *)&buf + 4) = v40;
        WORD6(buf) = 2080;
        *(void *)(v34 + 14) = " ";
        a28 = 2112;
        a29 = v38;
        a30 = 2112;
        *(void *)(v34 + 34) = v30;
        _os_log_error_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "#E %s%s*** Raise the roof.  %@ while synchronizing service account %@.", (uint8_t *)&buf, 0x2Au);
      }

      objc_end_catch();
      JUMPOUT(0x10005F954);
    }
    objc_begin_catch(a1);
    JUMPOUT(0x10005F958);
  }
  _Unwind_Resume(a1);
}

id sub_10005FCE4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _messagesAddedCompleted];
}

void sub_10005FCEC(void *a1)
{
  id v2 = (void *)a1[4];
  unsigned int v3 = (std::__shared_weak_count *)a1[7];
  uint64_t v4 = a1[6];
  uint64_t v5 = v3;
  if (v3) {
    atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  [v2 _syncCompletedWithError:&v4 error:a1[5]];
  if (v5) {
    sub_10006C2BC(v5);
  }
}

void sub_10005FD48(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    sub_10006C2BC(a10);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_10005FD60(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 56);
  *(void *)(result + 48) = *(void *)(a2 + 48);
  *(void *)(result + 56) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void sub_10005FD7C(uint64_t a1)
{
  CFStringRef v1 = *(std::__shared_weak_count **)(a1 + 56);
  if (v1) {
    sub_10006C2BC(v1);
  }
}

void sub_10005FEE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10005FFA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100060BCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
  _Unwind_Resume(a1);
}

id sub_100060E34(uint64_t a1)
{
  return [*(id *)(a1 + 32) scheduleDelayedSynchronize];
}

id sub_100060E3C(uint64_t a1)
{
  [*(id *)(a1 + 32) cancelDelayedSynchronize:@"SyncCompleted"];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 resetDelayedSynchronizationAttemptCount];
}

void sub_100060FF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100061134(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained) {
    [WeakRetained scheduleSyncTask:*(unsigned __int8 *)(a1 + 48) reason:*(void *)(a1 + 32)];
  }
}

void sub_100061190(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000613E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000619A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100061A2C(uint64_t a1)
{
  [*(id *)(a1 + 32) cancelDelayedSynchronize:@"Sync"];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 addSyncTask];
}

void sub_100061BB8(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
  {

    objc_begin_catch(exception_object);
    JUMPOUT(0x100061B5CLL);
  }
  _Unwind_Resume(exception_object);
}

void sub_100061EAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, id a11)
{
  _Unwind_Resume(a1);
}

void sub_100061FDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100062094(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_1000624D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_1000626FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100062888(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (a2 == 1)
  {
    id v16 = objc_begin_catch(a1);
    uint64_t v17 = sub_100020EE0(*(id **)&v9[v13]);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_100081AA8((uint64_t)[v9 getServiceObjLogPrefix], (uint64_t)v16, (uint64_t)&a9);
    }

    +[IMAPServiceActivityController setRemainingBodyRetries:0];
    objc_end_catch();
    JUMPOUT(0x100062850);
  }
  _Unwind_Resume(a1);
}

void sub_100062BD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100062E6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  _Unwind_Resume(a1);
}

void sub_100062EAC(uint64_t a1)
{
  id WeakRetained = (id **)objc_loadWeakRetained((id *)(a1 + 32));
  unsigned int v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = sub_100020EE0(WeakRetained[55]);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [v3 getServiceObjLogPrefix];
      int v6 = *(_DWORD *)(a1 + 40);
      int v7 = 136315906;
      id v8 = v5;
      __int16 v9 = 2080;
      int v10 = " ";
      __int16 v11 = 1024;
      int v12 = v6;
      __int16 v13 = 2080;
      uint64_t v14 = asStringBOOL();
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#I %s%sDone processing transcription for record: %d finished: %s", (uint8_t *)&v7, 0x26u);
    }
  }
}

void sub_100062FC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000639F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_100063C88(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) serviceAccount];
  unsigned int v3 = [v2 accountStore];

  id v4 = sub_100079A6C(v3, *(unsigned int *)(a1 + 40));
  id v5 = v4;
  if (v4)
  {
    CFStringRef v6 = VMStoreRecordCopyDescription((uint64_t)v4);
    int v7 = sub_100020EE0(*(id **)(*(void *)(a1 + 32) + 440));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [*(id *)(a1 + 32) getServiceObjLogPrefix];
      int v29 = 136315906;
      id v30 = v8;
      __int16 v31 = 2080;
      long long v32 = " ";
      __int16 v33 = 2112;
      uint64_t v34 = v3;
      __int16 v35 = 2112;
      CFStringRef v36 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#I %s%sRetrieved audio data for account store %@, record %@", (uint8_t *)&v29, 0x2Au);
    }

    sub_1000793CC(v3, (uint64_t)v5, 2);
    [v3 save];
    int v9 = sub_1000790B0(v3, (uint64_t)v5);
    int v10 = +[NSDate date];
    __int16 v11 = +[NSDate dateWithTimeIntervalSince1970:(double)v9];
    [v10 timeIntervalSinceDate:v11];
    double v13 = v12;

    if (v13 >= 3600.0)
    {
      uint64_t v17 = sub_100020EE0(*(id **)(*(void *)(a1 + 32) + 440));
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        id v23 = [*(id *)(a1 + 32) getServiceObjLogPrefix];
        int v29 = 136315394;
        id v30 = v23;
        __int16 v31 = 2080;
        long long v32 = " ";
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "#I %s%sNot reporting voicemail message length because voicemail is too old", (uint8_t *)&v29, 0x16u);
      }
    }
    else
    {
      uint64_t v14 = sub_1000790E0(v3, (uint64_t)v5);
      id v15 = [*(id *)(a1 + 32) contextInfo];
      id v16 = [v15 slotID];

      uint64_t v17 = [*(id *)(a1 + 32) serviceMCC];
      __int16 v18 = [*(id *)(a1 + 32) serviceMNC];
      unsigned int v19 = +[VMAWDReporter sharedInstance];
      [v19 reportVoicemailDownloadedWithDuration:v14 slotID:v16 mcc:v17 mnc:v18];
    }
    __int16 v24 = (void *)sub_10007931C(v3, (uint64_t)v5);
    CFTypeRef DeletedRecordWithToken = VMStoreCopyFirstDeletedRecordWithToken(v24, 0);
    __int16 v26 = *(id ***)(a1 + 32);
    if (DeletedRecordWithToken)
    {
      long long v27 = sub_100020EE0(v26[55]);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        id v28 = [*(id *)(a1 + 32) getServiceObjLogPrefix];
        int v29 = 136315650;
        id v30 = v28;
        __int16 v31 = 2080;
        long long v32 = " ";
        __int16 v33 = 2112;
        uint64_t v34 = v24;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "#I %s%sRecord with the same token '%@' is found in the deleted table, cancel copying the audio data", (uint8_t *)&v29, 0x20u);
      }

      CFRelease(DeletedRecordWithToken);
    }
    else
    {
      [v26 addDataForRecord:v5];
    }
    if (v24) {
      CFRelease(v24);
    }
    if (v6) {
      CFRelease(v6);
    }
    CFRelease(v5);
  }
  else
  {
    __int16 v20 = sub_100020EE0(*(id **)(*(void *)(a1 + 32) + 440));
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      id v21 = [*(id *)(a1 + 32) getServiceObjLogPrefix];
      int v22 = *(_DWORD *)(a1 + 40);
      int v29 = 136315906;
      id v30 = v21;
      __int16 v31 = 2080;
      long long v32 = " ";
      __int16 v33 = 2112;
      uint64_t v34 = v3;
      __int16 v35 = 1024;
      LODWORD(v36) = v22;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "#I %s%sRetrieved audio data for account store %@, record with identifier %u not found", (uint8_t *)&v29, 0x26u);
    }
  }
}

void sub_1000640B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100064410(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100064558(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100064848(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100064BC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100064F0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100065230(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100065554(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100065878(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100065BB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100065C14(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) serviceAccount];
  [v2 storeFlagsWithMask:&off_1000C8690 forRecordsWithIdentifiers:*(void *)(a1 + 40)];
}

void sub_100065C70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100065E38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000666DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

NSString *__cdecl sub_100066854(id a1, NSString *a2, NSString *a3, BOOL a4)
{
  id v5 = a2;
  CFStringRef v6 = a3;
  if ([(NSString *)v5 length] && [(NSString *)v5 characterAtIndex:1])
  {
    int v7 = sub_10001FA20(v5, v6);
  }
  else
  {
    int v7 = 0;
  }

  return (NSString *)v7;
}

void sub_1000668E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000668FC(uint64_t a1, uint64_t a2, void *a3)
{
  id v11 = a3;
  id v5 = VMStoreRecordCopyCallbackNumber(a2);
  if (v5)
  {
    CFStringRef v6 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    if ([v6 length]) {
      VMStoreRecordSetCallbackNumber(a2);
    }
  }
  int v7 = VMStoreRecordCopyReceiver(a2);
  if (v7)
  {
    id v8 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    if ([v8 length]) {
      VMStoreRecordSetReceiver(a2);
    }
  }
  int v9 = VMStoreRecordCopySender(a2);
  if (v9)
  {
    int v10 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    if ([v10 length]) {
      VMStoreRecordSetSender(a2);
    }
  }
}

void sub_100066A50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100066E94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100067390(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22)
{
  if (a2)
  {

    if (a2 == 2)
    {
      id v29 = objc_begin_catch(exception_object);
      id v30 = sub_100020EE0(*(id **)&v22[v26]);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        sub_100081AF0((uint64_t)[v22 getServiceObjLogPrefix], (uint64_t)v29, (uint64_t)&a22);
      }

      objc_end_catch();
      JUMPOUT(0x10006729CLL);
    }
    objc_begin_catch(exception_object);
    JUMPOUT(0x1000672A0);
  }
  _Unwind_Resume(exception_object);
}

void sub_100067EB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, void *exc_buf, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  if (a2)
  {

    if (a2 == 2)
    {
      id v40 = objc_begin_catch(a1);
      __int16 v41 = sub_100020EE0(*(id **)&v32[a15]);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
        sub_100081B38((uint64_t)[v32 getServiceObjLogPrefix], (uint64_t)v40, (uint64_t)&a30);
      }

      objc_end_catch();
      JUMPOUT(0x100067D6CLL);
    }
    objc_begin_catch(a1);
    JUMPOUT(0x100067D70);
  }
  _Unwind_Resume(a1);
}

void sub_10006837C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100068890(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100068E9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1000690E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100069204(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10006944C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100069AAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, std::__shared_weak_count *a17)
{
  if (a17) {
    sub_10006C2BC(a17);
  }

  _Unwind_Resume(a1);
}

void sub_100069C84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100069D48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100069F58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100069FA4(uint64_t a1)
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.visualvoicemail.VVVerifierChanged", 0, 0, 1u);
  v6[0] = @"VMCarrierNotificationUserInfoAccountUUID";
  unsigned int v3 = [*(id *)(a1 + 32) serviceLabelID];
  v6[1] = @"VMCarrierNotificationUserInfoIMAPParameters";
  v7[0] = v3;
  v7[1] = *(void *)(a1 + 40);
  id v4 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];

  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 postNotificationName:@"VMCarrierIMAPParametersChangedNotification" object:0 userInfo:v4];
}

void sub_10006A0B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10006A1C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10006A2A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10006A628(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_10006A8C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, uint64_t a15, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_10006A910(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained) {
    objc_msgSend(WeakRetained, "_onQueue_setPasscode:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
  }
}

void sub_10006A968(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10006AA88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10006ADB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10006AFDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10006B4D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10006B9E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_10006BE78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_10006C100(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10006C2BC(std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

uint64_t sub_10006C330(uint64_t a1)
{
  pthread_mutex_lock((pthread_mutex_t *)a1);
  id v2 = *(std::__shared_weak_count **)(a1 + 72);
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 72) = 0;
  pthread_mutex_unlock((pthread_mutex_t *)a1);
  if (v2) {
    sub_10006C2BC(v2);
  }
  unsigned int v3 = *(std::__shared_weak_count **)(a1 + 72);
  if (v3) {
    sub_10006C2BC(v3);
  }
  return a1;
}

uint64_t sub_10006C388(uint64_t result, uint64_t a2, float a3)
{
  *(float *)a2 = a3;
  *(void *)(a2 + 4) = result;
  *(_WORD *)(a2 + 12) = 2080;
  return result;
}

void sub_10006C39C(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void sub_10006C3B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a3 + 14) = v3;
  *(_WORD *)(a3 + 22) = 2112;
  *(void *)(a3 + 24) = a2;
}

uint64_t sub_10006C3CC(uint64_t result, float a2, uint64_t a3, uint64_t a4)
{
  *(float *)a4 = a2;
  *(void *)(a4 + 4) = result;
  *(_WORD *)(a4 + 12) = 2080;
  return result;
}

void sub_10006C3E0(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, NSObject *a4@<X8>)
{
  _os_log_error_impl(a1, a4, OS_LOG_TYPE_ERROR, a2, a3, 0x20u);
}

uint64_t sub_10006C3FC()
{
  if ((byte_1000E0710 & 1) == 0)
  {
    byte_1000E0710 = 1;
    return __cxa_atexit((void (*)(void *))sub_10006C2B8, &stru_1000E06C0, (void *)&_mh_execute_header);
  }
  return result;
}

void sub_10006C4D8()
{
  id v0 = objc_alloc_init((Class)objc_opt_class());
  CFStringRef v1 = (void *)qword_1000E09A0;
  qword_1000E09A0 = (uint64_t)v0;
}

void sub_10006C5AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10006C644(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  os_unfair_lock_unlock(v11);

  _Unwind_Resume(a1);
}

void sub_10006C6DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  os_unfair_lock_unlock(v10);

  _Unwind_Resume(a1);
}

void sub_10006C7A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10006C7B4(uint64_t a1)
{
  id v2 = +[CPNetworkObserver sharedNetworkObserver];
  [v2 addNetworkReachableObserver:*(void *)(a1 + 32) selector:"networkReachabilityChanged:"];
}

void sub_10006C814(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10006C8B0(uint64_t a1)
{
  id v2 = +[CPNetworkObserver sharedNetworkObserver];
  [v2 removeNetworkReachableObserver:*(void *)(a1 + 32)];
}

void sub_10006C908(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10006CB44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, os_unfair_lock_t lock, void *a10, void *a11, void *a12)
{
  os_unfair_lock_unlock(lock);
  _Unwind_Resume(a1);
}

id sub_10006CBC0(uint64_t a1)
{
  return [*(id *)(a1 + 32) networkReachabilityChangedSync:*(unsigned __int8 *)(a1 + 40)];
}

void sub_10006CC48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10006D758()
{
  if (qword_1000E09B8 != -1) {
    dispatch_once(&qword_1000E09B8, &stru_1000C2A90);
  }
  id v0 = (void *)qword_1000E09B0;
  return v0;
}

void sub_10006D7AC(id a1)
{
  if (qword_1000E09E8 != -1) {
    dispatch_once(&qword_1000E09E8, &stru_1000C2AF0);
  }
  id v3 = (id)qword_1000E09E0;
  uint64_t v1 = [v3 URLByAppendingPathComponent:@"Voicemail" isDirectory:1];
  id v2 = (void *)qword_1000E09B0;
  qword_1000E09B0 = v1;
}

id sub_10006D83C()
{
  if (qword_1000E09C8 != -1) {
    dispatch_once(&qword_1000E09C8, &stru_1000C2AB0);
  }
  id v0 = (void *)qword_1000E09C0;
  return v0;
}

void sub_10006D890(id a1)
{
  sub_10006D758();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v3 URLByAppendingPathComponent:@"voicemail.db" isDirectory:0];
  id v2 = (void *)qword_1000E09C0;
  qword_1000E09C0 = v1;
}

id sub_10006D8F0(void *a1)
{
  id v1 = a1;
  id v2 = [(id)objc_opt_class() hashedUUID:v1];

  id v3 = [v2 UUIDString];
  uint64_t v4 = +[NSString stringWithFormat:@"A-%@", v3];

  uint64_t v5 = sub_10006D758();
  CFStringRef v6 = [v5 URLByAppendingPathComponent:v4 isDirectory:1];

  return v6;
}

id sub_10006D9C0(void *a1)
{
  id v1 = a1;
  return v1;
}

id sub_10006D9E8(void *a1, const char *a2)
{
  return [a1 URLByAppendingPathComponent:@"Greeting.amr" isDirectory:0];
}

id sub_10006D9F8(void *a1, const char *a2)
{
  return [a1 URLByAppendingPathComponent:@"voicemail.db" isDirectory:0];
}

id sub_10006DA08(void *a1)
{
  id v1 = a1;
  id v2 = sub_10006D758();
  id v3 = [v2 URLByAppendingPathComponent:v1 isDirectory:1];

  return v3;
}

id sub_10006DA70()
{
  if (qword_1000E09D8 != -1) {
    dispatch_once(&qword_1000E09D8, &stru_1000C2AD0);
  }
  id v0 = (void *)qword_1000E09D0;
  return v0;
}

void sub_10006DAC4(id a1)
{
  sub_10006D758();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v3 URLByAppendingPathComponent:@"sms" isDirectory:1];
  id v2 = (void *)qword_1000E09D0;
  qword_1000E09D0 = v1;
}

id sub_10006DB24(void *a1)
{
  id v1 = a1;
  id v2 = [(id)objc_opt_class() hashedUUID:v1];

  id v3 = [v2 UUIDString];
  uint64_t v4 = +[NSString stringWithFormat:@"SMS-%@.plist", v3];

  uint64_t v5 = sub_10006DA70();
  CFStringRef v6 = [v5 URLByAppendingPathComponent:v4];

  return v6;
}

void sub_10006DBF0(id a1)
{
  if (qword_1000E09F8 != -1) {
    dispatch_once(&qword_1000E09F8, &stru_1000C2B10);
  }
  uint64_t v1 = [(id)qword_1000E09F0 URLByAppendingPathComponent:@"Library" isDirectory:1];
  id v2 = (void *)qword_1000E09E0;
  qword_1000E09E0 = v1;
}

void sub_10006DC64(id a1)
{
  if (qword_1000E0A08 != -1) {
    dispatch_once(&qword_1000E0A08, &stru_1000C2B30);
  }
  qword_1000E09F0 = CFCopyHomeDirectoryURLForUser();
}

void sub_10006DCB4(id a1)
{
  qword_1000E0A00 = @"mobile";
  CFRetain(@"mobile");
}

void sub_10006DCC8()
{
}

void sub_10006DD38()
{
}

void sub_10006DD60(void *a1, uint64_t a2, uint64_t a3)
{
  *a1 = a2;
  a1[1] = a3;
  a1[3] = 0;
  a1[4] = 0;
  a1[5] = 0;
  uint64_t v3 = qword_1000E0A10++;
  a1[2] = v3;
  operator new();
}

void sub_10006E018(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  pthread_mutex_unlock(&stru_1000E06C0);

  unsigned int v19 = *(std::__shared_weak_count **)(v15 + 40);
  if (v19) {
    sub_10006C2BC(v19);
  }
  sub_100026948(v16, 0);
  _Unwind_Resume(a1);
}

void sub_10006E0F4()
{
}

uint64_t *sub_10006E0FC(uint64_t *a1)
{
  id v2 = (ctu::OsLogLogger **)(a1 + 3);
  uint64_t v3 = sub_100020EE0((id *)a1[3]);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = a1[1];
    uint64_t v4 = a1[2];
    uint64_t v6 = *a1;
    int v9 = 136315906;
    uint64_t v10 = v5;
    __int16 v11 = 2080;
    double v12 = " ";
    __int16 v13 = 2048;
    uint64_t v14 = v4;
    __int16 v15 = 2080;
    uint64_t v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#I %s%sJetsam assertion [%lu, %s] deleted", (uint8_t *)&v9, 0x2Au);
  }

  int v7 = (std::__shared_weak_count *)a1[5];
  if (v7) {
    sub_10006C2BC(v7);
  }
  sub_100026948(v2, 0);
  return a1;
}

void sub_10006E200(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  sub_1000092D0(a1);
}

void sub_10006E374(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10006E4CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  a9.super_class = (Class)VMSharedJetsamAssertion;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_10006E5B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10006E5D8(void *a1, uint64_t a2)
{
  *a1 = a2;
  operator new();
}

void sub_10006E64C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_10006E72C((uint64_t **)va, 0);
  _Unwind_Resume(a1);
}

void sub_10006E668(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete();
}

uint64_t *sub_10006E6A0(uint64_t a1)
{
  uint64_t result = *(uint64_t **)(a1 + 24);
  if (result)
  {
    sub_10006E0FC(result);
    operator delete();
  }
  return result;
}

uint64_t sub_10006E6E8(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

uint64_t *sub_10006E72C(uint64_t **a1, uint64_t *a2)
{
  uint64_t result = *a1;
  *a1 = a2;
  if (result)
  {
    sub_10006E0FC(result);
    operator delete();
  }
  return result;
}

uint64_t sub_10006E77C()
{
  if ((byte_1000E0710 & 1) == 0)
  {
    byte_1000E0710 = 1;
    return __cxa_atexit((void (*)(void *))sub_10006C2B8, &stru_1000E06C0, (void *)&_mh_execute_header);
  }
  return result;
}

const char *VMStoreGetDataFileExtension()
{
  return ".amr";
}

const char *VMStoreGetTranscriptionFileExtension()
{
  return ".transcript";
}

const char *VMStoreGetSummarizationFileExtension()
{
  return ".summary";
}

CFStringRef VMStoreRecordCopyDescription(uint64_t a1)
{
  uint64_t ID = CSDBRecordGetID();
  uint64_t v3 = sub_10006E9B4(a1);
  uint64_t v4 = VMStoreRecordCopySender(a1);
  uint64_t v5 = VMStoreRecordCopyReceiver(a1);
  uint64_t v6 = VMStoreRecordCopyCallbackNumber(a1);
  uint64_t v18 = sub_10006E9B4(a1);
  int v7 = sub_10006E9B4(a1);
  id v8 = VMStoreRecordCopyFlagsDescription(v7);
  int v9 = VMStoreRecordGetLabel(a1);
  uint64_t v10 = [v9 UUIDString];

  __int16 v11 = +[NSNumber numberWithUnsignedInt:ID];
  double v12 = +[NSNumber numberWithUnsignedInt:v3];
  __int16 v13 = +[NSNumber numberWithInt:sub_10006E9B4(a1)];
  uint64_t v14 = (void *)v10;
  __int16 v15 = +[NSNumber numberWithInt:v18];
  CFStringRef v16 = CFStringCreateWithFormat(0, 0, @"<VMStoreRecord %p identifier=%@, remoteUID=%@, date=%@, sender=%@, receiver=%@, callback=%@, duration=%@, flags=%@, label=%@>", a1, v11, v12, v13, v4, v5, v6, v15, v8, v14);

  if (v4) {
    CFRelease(v4);
  }
  if (v5) {
    CFRelease(v5);
  }
  if (v6) {
    CFRelease(v6);
  }
  if (v8) {
    CFRelease(v8);
  }

  return v16;
}

void VMStoreRecordRelease(CFTypeRef cf)
{
  if (cf) {
    CFRelease(cf);
  }
}

uint64_t VMStoreRecordGetRemoteUID(uint64_t a1)
{
  return sub_10006E9B4(a1);
}

uint64_t sub_10006E9B4(uint64_t Property)
{
  if (Property) {
    Property = CSDBRecordGetProperty();
  }
  pthread_mutex_unlock(&stru_1000E0718);
  return Property;
}

uint64_t VMStoreRecordSetRemoteUID(uint64_t a1)
{
  return sub_10006EA1C(a1);
}

uint64_t sub_10006EA1C(uint64_t a1)
{
  pthread_mutex_lock(&stru_1000E0718);
  if (a1) {
    CSDBRecordSetProperty();
  }
  return pthread_mutex_unlock(&stru_1000E0718);
}

uint64_t sub_10006EA8C(uint64_t result)
{
  return result;
}

uint64_t VMStoreRecordGetDate(uint64_t a1)
{
  return sub_10006E9B4(a1);
}

const void *VMStoreRecordGetToken(uint64_t a1)
{
  uint64_t v1 = (const void *)sub_10006E9B4(a1);
  return sub_10006EADC(v1);
}

const void *sub_10006EADC(const void *result)
{
  if (result)
  {
    uint64_t v1 = result;
    Typeuint64_t ID = CFStringGetTypeID();
    if (TypeID == CFGetTypeID(v1)) {
      return v1;
    }
    else {
      return 0;
    }
  }
  return result;
}

const void *VMStoreRecordCopyToken(uint64_t a1)
{
  pthread_mutex_lock(&stru_1000E0718);
  if (a1) {
    Property = (const void *)CSDBRecordGetProperty();
  }
  else {
    Property = 0;
  }
  uint64_t v3 = sub_10006EADC(Property);
  uint64_t v4 = v3;
  if (v3) {
    CFRetain(v3);
  }
  pthread_mutex_unlock(&stru_1000E0718);
  return v4;
}

uint64_t VMStoreRecordSetToken(uint64_t a1)
{
  return sub_10006EA1C(a1);
}

uint64_t VMStoreRecordSetCallbackNumber(uint64_t a1)
{
  return sub_10006EA1C(a1);
}

uint64_t VMStoreRecordSetReceiver(uint64_t a1)
{
  return sub_10006EA1C(a1);
}

uint64_t VMStoreRecordSetSender(uint64_t a1)
{
  return sub_10006EA1C(a1);
}

uint64_t VMStoreRecordSetLabel(uint64_t a1, void *a2)
{
  [a2 UUIDString];
  return sub_10006EA1C(a1);
}

uint64_t sub_10006EBFC(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  pthread_mutex_lock(&stru_1000E0718);
  if (!qword_1000E0A18) {
    VMStoreInitialize();
  }
  CSDBRecordStoreGetDatabase();
  if (CSDBSqliteDatabaseConnectionForReading())
  {
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"SELECT * FROM %@ WHERE %@ = ?;",
      a1,
    int v7 = a3);
    uint64_t v8 = CSDBSqliteConnectionStatementForSQL();
    if (v8)
    {
      sqlite3_bind_text(*(sqlite3_stmt **)(v8 + 8), 1, (const char *)[a4 UTF8String], -1, 0);
      uint64_t v9 = CSDBRecordStoreProcessStatement();
    }
    else
    {
      uint64_t v9 = 0;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }
  pthread_mutex_unlock(&stru_1000E0718);
  return v9;
}

uint64_t VMStoreInitialize()
{
  if (qword_1000E0A18) {
    goto LABEL_57;
  }
  context = v0;
  memset(&v62, 0, sizeof(v62));
  uint64_t v1 = sub_10006D838();
  id v2 = sub_10006D83C();
  id v3 = [v2 path];
  int v4 = stat((const char *)[v3 UTF8String], &v62);

  uint64_t v5 = vm_vmd_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = "";
    if (v4 < 0) {
      uint64_t v6 = " not";
    }
    *(_DWORD *)buf = 136315138;
    uint64_t v55 = (uint64_t)v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Database file does%s exist", buf, 0xCu);
  }

  int v7 = vm_vmd_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [v1 path];
    *(_DWORD *)buf = 138412290;
    uint64_t v55 = (uint64_t)v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Creating directories to %@", buf, 0xCu);
  }
  id v9 = [v1 path];
  uint64_t v10 = [v9 UTF8String];
  uid_t v11 = sub_10000F2A0();
  gid_t v12 = sub_10000F2E4();
  sub_10000EFE4(v10, v11, v12, 0x1EDu);

  [v2 path];
  uint64_t v13 = CSDBRecordStoreCreateWithPath();
  qword_1000E0A18 = v13;
  uint64_t v14 = vm_vmd_log();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (!v13)
  {
    if (v15)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Voicemail store is NOT valid", buf, 2u);
    }
    goto LABEL_28;
  }
  if (v15)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Voicemail store is valid", buf, 2u);
  }

  CSDBRecordStoreRegisterClass();
  CSDBRecordStoreSetSetupHandler();
  uint64_t Database = CSDBRecordStoreGetDatabase();
  if (Database)
  {
    uint64_t v17 = Database;
    uint64_t v18 = vm_vmd_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "db is valid", buf, 2u);
    }

    CSDBSqliteDatabaseSetDataProtectionClass();
    CSDBSqliteDatabaseSetVersion();
    *(void *)(v17 + 24) = sub_1000745C8;
    CSDBSqliteDatabaseSetMigrationHandlers();
    unsigned int v19 = (const void *)CSDBSqliteDatabaseCopyValueForProperty();
    if (v19) {
      CFRelease(v19);
    }
  }
  id v20 = [v2 path];
  int v21 = stat((const char *)[v20 UTF8String], &v62);

  int v22 = vm_vmd_log();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    id v23 = " not";
    if (!v21) {
      id v23 = "";
    }
    *(_DWORD *)buf = 136315138;
    uint64_t v55 = (uint64_t)v23;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "DB does%s exist", buf, 0xCu);
  }

  if (!v21 && (sub_10000F2E4() != v62.st_gid || sub_10000F2A0() != v62.st_uid))
  {
    __int16 v24 = vm_vmd_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Chowning data base", buf, 2u);
    }

    uint64_t v14 = [v2 path];
    uint64_t v25 = (const char *)[v14 UTF8String];
    uid_t v26 = sub_10000F2A0();
    gid_t v27 = sub_10000F2E4();
    chown(v25, v26, v27);
LABEL_28:
  }
  long long v51 = v2;
  long long v52 = v1;
  int v50 = v4;
  uint64_t v28 = 0;
  id v29 = &off_1000C2F68;
  do
  {
    id v30 = *v29;
    dword_1000E0A2C[v28] = CSDBRecordIndexOfPropertyNamed();
    __int16 v31 = vm_vmd_log();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      int v32 = dword_1000E0A2C[v28];
      *(_DWORD *)buf = 134218754;
      uint64_t v55 = v28;
      __int16 v56 = 2080;
      long long v57 = v30;
      __int16 v58 = 2048;
      uint64_t v59 = v28;
      __int16 v60 = 1024;
      int v61 = v32;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "[%lu] Property ID of %s (%lu) is %d", buf, 0x26u);
    }

    ++v28;
    v29 += 5;
  }
  while (v28 != 12);
  uint64_t v33 = 0;
  char v34 = 1;
  do
  {
    char v35 = v34;
    CFStringRef v36 = (&off_1000C2F18)[5 * v33];
    dword_1000E0A20[v33] = CSDBRecordIndexOfPropertyNamed();
    id v37 = vm_vmd_log();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      int v38 = dword_1000E0A20[v33];
      *(_DWORD *)buf = 134218754;
      uint64_t v55 = v33;
      __int16 v56 = 2080;
      long long v57 = v36;
      __int16 v58 = 2048;
      uint64_t v59 = v33;
      __int16 v60 = 1024;
      int v61 = v38;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "[%lu] Property ID of %s (%lu) is %d", buf, 0x26u);
    }

    char v34 = 0;
    uint64_t v33 = 1;
  }
  while ((v35 & 1) != 0);
  CSDBRecordStoreGetDatabase();
  uint64_t v39 = CSDBSqliteDatabaseConnectionForWriting();
  uint64_t v40 = CSDBSqliteDatabaseCopyValueForProperty();
  if (!v40) {
    goto LABEL_52;
  }
  __int16 v41 = (const void *)v40;
  id v42 = vm_vmd_log();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Perform UUID migration", buf, 2u);
  }

  sub_100075788(qword_1000E0A18, (CFIndex *)&off_1000C2CC8);
  sub_100075788(qword_1000E0A18, (CFIndex *)&off_1000C2D68);
  if (!v39)
  {
    __int16 v43 = vm_vmd_log();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Can't find sql connection for UUID migration", buf, 2u);
    }
    goto LABEL_51;
  }
  __int16 v43 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"DELETE FROM _SqliteDatabaseProperties WHERE key = '%@';",
                      @"UUIDMigration");
  int v44 = CSDBSqliteConnectionPerformSQL();
  if (v44 != 101 && v44)
  {
    __int16 v45 = vm_vmd_log();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v46 = "Can't remove property for UUID migration";
      goto LABEL_49;
    }
  }
  else
  {
    __int16 v45 = vm_vmd_log();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v46 = "Removed property for UUID migration";
LABEL_49:
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, v46, buf, 2u);
    }
  }

LABEL_51:
  CFRelease(v41);
LABEL_52:

  id v47 = vm_vmd_log();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    char v48 = " not";
    if (v50 < 0) {
      char v48 = "";
    }
    v62.st_dev = 136315138;
    *(void *)&v62.st_mode = v48;
    _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "Voicemail initialization occured while%s previously existing", (uint8_t *)&v62, 0xCu);
  }

  id v0 = context;
LABEL_57:
  return 0;
}

CFTypeRef VMMap_copyRecordWithLabel(void *a1)
{
  CFArrayRef v1 = (const __CFArray *)sub_10006EBFC(@"map", (uint64_t)&off_1000C2C28, @"label", [a1 UUIDString]);
  if (!v1) {
    return 0;
  }
  CFArrayRef v2 = v1;
  if (CFArrayGetCount(v1))
  {
    ValueAtIndex = CFArrayGetValueAtIndex(v2, 0);
    CFTypeRef v4 = CFRetain(ValueAtIndex);
  }
  else
  {
    CFTypeRef v4 = 0;
  }
  CFRelease(v2);
  return v4;
}

const void *VMMap_copyAccountForLabel(void *a1)
{
  CFTypeRef v1 = VMMap_copyRecordWithLabel(a1);
  if (!v1) {
    return 0;
  }
  CFArrayRef v2 = v1;
  Property = (const void *)CSDBRecordGetProperty();
  CFTypeRef v4 = sub_10006EADC(Property);
  uint64_t v5 = v4;
  if (v4) {
    CFRetain(v4);
  }
  CFRelease(v2);
  return v5;
}

CFTypeRef VMMap_copyRecordWithAccount(void *a1)
{
  CFArrayRef v1 = (const __CFArray *)sub_10006EBFC(@"map", (uint64_t)&off_1000C2C28, @"account", a1);
  if (!v1) {
    return 0;
  }
  CFArrayRef v2 = v1;
  if (CFArrayGetCount(v1))
  {
    ValueAtIndex = CFArrayGetValueAtIndex(v2, 0);
    CFTypeRef v4 = CFRetain(ValueAtIndex);
  }
  else
  {
    CFTypeRef v4 = 0;
  }
  CFRelease(v2);
  return v4;
}

uint64_t VMMap_addRecord(uint64_t a1, void *a2)
{
  id v2 = a2;
  pthread_mutex_lock(&stru_1000E0718);
  uint64_t v3 = CSDBRecordCreate();
  if (v3)
  {
    CSDBRecordSetProperty();
    [v2 UUIDString];
    CSDBRecordSetProperty();
    CSDBRecordStoreAddRecord();
  }
  pthread_mutex_unlock(&stru_1000E0718);

  return v3;
}

uint64_t VMMap_removeRecord()
{
  pthread_mutex_lock(&stru_1000E0718);
  CSDBRecordStoreRemoveRecord();
  return pthread_mutex_unlock(&stru_1000E0718);
}

uint64_t VMMain_StoreCopyMainRecordsWithLabelID(void *a1)
{
  id v1 = [a1 UUIDString];
  return sub_10006EBFC(@"voicemail", (uint64_t)&off_1000C2CC8, @"label", v1);
}

uint64_t VMStoreRecordSetUUID(uint64_t a1, void *a2)
{
  [a2 UUIDString];
  return sub_10006EA1C(a1);
}

id VMStoreRecordGetUUID(uint64_t a1)
{
  pthread_mutex_lock(&stru_1000E0718);
  if (a1) {
    Property = (const void *)CSDBRecordGetProperty();
  }
  else {
    Property = 0;
  }
  uint64_t v3 = sub_10006EADC(Property);
  if (v3) {
    id v4 = [objc_alloc((Class)NSUUID) initWithUUIDString:v3];
  }
  else {
    id v4 = 0;
  }
  pthread_mutex_unlock(&stru_1000E0718);

  return v4;
}

uint64_t VMStoreRecordGetSender(uint64_t Property)
{
  return sub_10006E9B4(Property);
}

const void *VMStoreRecordCopySender(uint64_t a1)
{
  pthread_mutex_lock(&stru_1000E0718);
  if (a1) {
    Property = (const void *)CSDBRecordGetProperty();
  }
  else {
    Property = 0;
  }
  uint64_t v3 = sub_10006EADC(Property);
  id v4 = v3;
  if (v3) {
    CFRetain(v3);
  }
  pthread_mutex_unlock(&stru_1000E0718);
  return v4;
}

const void *VMStoreRecordCopyReceiver(uint64_t a1)
{
  pthread_mutex_lock(&stru_1000E0718);
  if (a1) {
    Property = (const void *)CSDBRecordGetProperty();
  }
  else {
    Property = 0;
  }
  uint64_t v3 = sub_10006EADC(Property);
  id v4 = v3;
  if (v3) {
    CFRetain(v3);
  }
  pthread_mutex_unlock(&stru_1000E0718);
  return v4;
}

id VMStoreRecordGetLabel(uint64_t a1)
{
  pthread_mutex_lock(&stru_1000E0718);
  if (a1) {
    Property = (const void *)CSDBRecordGetProperty();
  }
  else {
    Property = 0;
  }
  uint64_t v3 = sub_10006EADC(Property);
  if (v3) {
    id v4 = [objc_alloc((Class)NSUUID) initWithUUIDString:v3];
  }
  else {
    id v4 = 0;
  }
  pthread_mutex_unlock(&stru_1000E0718);

  return v4;
}

const void *VMStoreRecordGetCallbackNumber(uint64_t a1)
{
  id v1 = (const void *)sub_10006E9B4(a1);
  return sub_10006EADC(v1);
}

const void *VMStoreRecordCopyCallbackNumber(uint64_t a1)
{
  pthread_mutex_lock(&stru_1000E0718);
  if (a1) {
    Property = (const void *)CSDBRecordGetProperty();
  }
  else {
    Property = 0;
  }
  uint64_t v3 = sub_10006EADC(Property);
  id v4 = v3;
  if (v3) {
    CFRetain(v3);
  }
  pthread_mutex_unlock(&stru_1000E0718);
  return v4;
}

uint64_t VMStoreRecordGetDuration(uint64_t a1)
{
  return sub_10006E9B4(a1);
}

uint64_t VMStoreRecordSetDuration(uint64_t a1)
{
  return sub_10006EA1C(a1);
}

uint64_t sub_10006FAFC(uint64_t result)
{
  return (int)result;
}

uint64_t VMStoreRecordGetExpirationDate(uint64_t a1)
{
  return sub_10006E9B4(a1);
}

uint64_t VMStoreRecordSetExpirationDate(uint64_t a1)
{
  return sub_10006EA1C(a1);
}

uint64_t VMStoreRecordGetTrashedDate(uint64_t a1)
{
  return sub_10006E9B4(a1);
}

uint64_t VMStoreRecordGetFlags(uint64_t a1)
{
  return sub_10006E9B4(a1);
}

uint64_t VMStoreRecordCopyDataPath()
{
  id v0 = sub_10006D758();
  id v1 = +[NSString stringWithFormat:@"%d%s", CSDBRecordGetID(), ".amr"];
  id v2 = [v0 URLByAppendingPathComponent:v1];
  uint64_t v3 = [v2 path];

  return v3;
}

uint64_t VMStoreRecordCopyTranscriptionPath()
{
  id v0 = sub_10006D758();
  id v1 = +[NSString stringWithFormat:@"%d%s", CSDBRecordGetID(), ".transcript"];
  id v2 = [v0 URLByAppendingPathComponent:v1];
  uint64_t v3 = [v2 path];

  return v3;
}

uint64_t VMStoreRecordCopySummarizationPath()
{
  id v0 = sub_10006D758();
  id v1 = +[NSString stringWithFormat:@"%d%s", CSDBRecordGetID(), ".summary"];
  id v2 = [v0 URLByAppendingPathComponent:v1];
  uint64_t v3 = [v2 path];

  return v3;
}

uint64_t VMStoreSave()
{
  pthread_mutex_lock(&stru_1000E0718);
  if (qword_1000E0A18)
  {
    CSDBRecordSaveStore();
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.voicemail.changed", 0, 0, 1u);
    ++dword_1000E0A28;
  }
  return pthread_mutex_unlock(&stru_1000E0718);
}

void VMStoreChangedExternally()
{
  pthread_mutex_lock(&stru_1000E0718);
  if (dword_1000E0A28 <= 0)
  {
    if (qword_1000E0A18)
    {
      CSDBRecordStoreDestroy();
      qword_1000E0A18 = 0;
    }
    pthread_mutex_unlock(&stru_1000E0718);
    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterPostNotification(LocalCenter, @"com.apple.voicemail.changed", 0, 0, 1u);
  }
  else
  {
    --dword_1000E0A28;
    pthread_mutex_unlock(&stru_1000E0718);
  }
}

uint64_t VMStoreDestroy()
{
  pthread_mutex_lock(&stru_1000E0718);
  if (qword_1000E0A18) {
    CSDBRecordStoreInvalidateCachesWithStore();
  }
  return pthread_mutex_unlock(&stru_1000E0718);
}

uint64_t VMStoreInitializeLocked()
{
  return 0;
}

uint64_t VMStoreInvalidateCaches()
{
  pthread_mutex_lock(&stru_1000E0718);
  if (qword_1000E0A18) {
    CSDBRecordStoreInvalidateCachesWithStore();
  }
  return pthread_mutex_unlock(&stru_1000E0718);
}

id sub_10006FF30(uint64_t a1, const __CFString *a2)
{
  CSDBRecordStoreGetDatabase();
  uint64_t v3 = sub_10006FFE8(a2);
  uint64_t v4 = CSDBSqliteDatabaseCopyValueForProperty();
  if (!v4)
  {
    id v8 = 0;
    if (!v3) {
      return v8;
    }
    goto LABEL_3;
  }
  uint64_t v5 = (const void *)v4;
  id v6 = objc_alloc_init((Class)NSNumberFormatter);
  [v6 setNumberStyle:1];
  int v7 = [v6 numberFromString:v5];
  id v8 = [v7 unsignedIntValue];
  CFRelease(v5);

  if (v3) {
LABEL_3:
  }
    CFRelease(v3);
  return v8;
}

__CFString *sub_10006FFE8(const __CFString *a1)
{
  if (a1)
  {
    CFIndex Length = CFStringGetLength(a1);
    MutableCopy = CFStringCreateMutableCopy(0, Length + 12, @"uid_validity");
    CFStringAppend(MutableCopy, a1);
    return MutableCopy;
  }
  else
  {
    return (__CFString *)CFRetain(@"uid_validity");
  }
}

void sub_10007004C(uint64_t a1, const __CFString *a2, uint64_t a3)
{
  if (a2) {
    CFStringRef v4 = a2;
  }
  else {
    CFStringRef v4 = &stru_1000C35D8;
  }
  CSDBRecordStoreGetDatabase();
  CFStringRef v5 = CFStringCreateWithFormat(0, 0, @"%u", a3);
  id v6 = sub_10006FFE8(v4);
  CSDBSqliteDatabaseSetValueForProperty();
  CFRelease(v5);
  CFRelease(v6);
}

uint64_t VMStoreCreateAndAddRecord(uint64_t a1, uint64_t a2, const __CFString *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  id v11 = a10;
  pthread_mutex_lock(&stru_1000E0718);
  uint64_t v12 = CSDBRecordCreate();
  if (v12)
  {
    CSDBRecordSetProperty();
    CSDBRecordSetProperty();
    CSDBRecordSetProperty();
    CSDBRecordSetProperty();
    CSDBRecordSetProperty();
    CSDBRecordSetProperty();
    CSDBRecordSetProperty();
    CSDBRecordSetProperty();
    CSDBRecordSetProperty();
    [v11 UUIDString];
    CSDBRecordSetProperty();
    if (a3 && CFStringGetLength(a3))
    {
      uint64_t v13 = +[NSUUID hashedUUID:a3];
    }
    else
    {
      uint64_t v13 = +[NSUUID UUID];
    }
    uint64_t v14 = v13;
    [v13 UUIDString];
    CSDBRecordSetProperty();

    CSDBRecordStoreAddRecord();
  }
  pthread_mutex_unlock(&stru_1000E0718);

  return v12;
}

uint64_t sub_1000702AC(uint64_t a1, uint64_t a2)
{
  pthread_mutex_lock(&stru_1000E0718);
  uint64_t v3 = CSDBRecordCreate();
  if (v3)
  {
    if (a2)
    {
      CSDBRecordGetProperty();
      CSDBRecordSetProperty();
      CSDBRecordGetProperty();
      CSDBRecordSetProperty();
      CSDBRecordGetProperty();
      CSDBRecordSetProperty();
      CSDBRecordGetProperty();
      CSDBRecordSetProperty();
      CSDBRecordGetProperty();
      CSDBRecordSetProperty();
      CSDBRecordGetProperty();
      CSDBRecordSetProperty();
      CSDBRecordGetProperty();
      CSDBRecordSetProperty();
      CSDBRecordGetProperty();
      CSDBRecordSetProperty();
      CSDBRecordGetProperty();
      CSDBRecordSetProperty();
      CSDBRecordGetProperty();
    }
    else
    {
      CSDBRecordSetProperty();
      CSDBRecordSetProperty();
      CSDBRecordSetProperty();
      CSDBRecordSetProperty();
      CSDBRecordSetProperty();
      CSDBRecordSetProperty();
      CSDBRecordSetProperty();
      CSDBRecordSetProperty();
      CSDBRecordSetProperty();
    }
    CSDBRecordSetProperty();
    CSDBRecordStoreAddRecord();
  }
  pthread_mutex_unlock(&stru_1000E0718);
  return v3;
}

uint64_t VMStoreCopyRecordToDeleted(uint64_t a1)
{
  return sub_1000702AC((uint64_t)&off_1000C2D68, a1);
}

uint64_t VMStoreRemoveRecord(uint64_t a1)
{
  CFStringRef v2 = VMStoreRecordCopyDescription(a1);
  uint64_t v3 = vm_vmd_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    CFStringRef v12 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Remove record %@", (uint8_t *)&v11, 0xCu);
  }

  if (v2) {
    CFRelease(v2);
  }
  pthread_mutex_lock(&stru_1000E0718);
  if (a1 && (CSDBRecordGetProperty() & 2) != 0)
  {
    CFStringRef v4 = (const __CFString *)VMStoreRecordCopyDataPath();
    if (v4)
    {
      CFStringRef v5 = v4;
      if (CFStringGetFileSystemRepresentation(v4, (char *)&v11, 256)) {
        unlink((const char *)&v11);
      }
      CFRelease(v5);
    }
    CFStringRef v6 = (const __CFString *)VMStoreRecordCopyTranscriptionPath();
    if (v6)
    {
      CFStringRef v7 = v6;
      if (CFStringGetFileSystemRepresentation(v6, (char *)&v11, 256)) {
        unlink((const char *)&v11);
      }
      CFRelease(v7);
    }
    CFStringRef v8 = (const __CFString *)VMStoreRecordCopySummarizationPath();
    if (v8)
    {
      CFStringRef v9 = v8;
      if (CFStringGetFileSystemRepresentation(v8, (char *)&v11, 256)) {
        unlink((const char *)&v11);
      }
      CFRelease(v9);
    }
  }
  CSDBRecordStoreRemoveRecord();
  return pthread_mutex_unlock(&stru_1000E0718);
}

void sub_10007067C(int a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    CFArrayRef v4 = (const __CFArray *)VMStoreCopyOfAllRecordsWithFlags(0, 0, v3);
    if (v4)
    {
      CFArrayRef v5 = v4;
      CFIndex Count = CFArrayGetCount(v4);
      if (Count >= 1)
      {
        CFIndex v7 = Count;
        for (CFIndex i = 0; i != v7; ++i)
        {
          ValueAtIndex = CFArrayGetValueAtIndex(v5, i);
          VMStoreRemoveRecord((uint64_t)ValueAtIndex);
        }
      }
      VMStoreSave();
      CFRelease(v5);
    }
    else
    {
      uint64_t v14 = vm_vmd_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138412290;
        id v16 = v3;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Did not find any records for label %@; skipping record removal.",
          (uint8_t *)&v15,
          0xCu);
      }
    }
  }
  else
  {
    pthread_mutex_lock(&stru_1000E0718);
    if (qword_1000E0A18)
    {
      uint64_t v10 = vm_vmd_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v15) = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Destroying voicemail store", (uint8_t *)&v15, 2u);
      }

      CSDBRecordStoreDestroy();
    }
    qword_1000E0A18 = 0;
    int v11 = sub_10006D758();
    id v12 = [v11 fullPath];
    sub_1000708EC((const char *)[v12 UTF8String], a1);

    VMStoreInitialize();
    pthread_mutex_unlock(&stru_1000E0718);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.voicemail.changed", 0, 0, 1u);
    ++dword_1000E0A28;
  }
}

uint64_t VMStoreCopyOfAllRecordsWithFlags(int a1, int a2, void *a3)
{
  id v5 = a3;
  pthread_mutex_lock(&stru_1000E0718);
  uint64_t v6 = qword_1000E0A18;
  if (!qword_1000E0A18)
  {
    VMStoreInitialize();
    uint64_t v6 = qword_1000E0A18;
  }
  uint64_t v7 = sub_100071A90(v6, &off_1000C2CC8, a1, a2, v5);
  pthread_mutex_unlock(&stru_1000E0718);

  return v7;
}

void sub_1000708EC(const char *a1, int a2)
{
  CFArrayRef v4 = vm_vmd_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id d_name = (id)a1;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Removing all contents of %s", buf, 0xCu);
  }

  id v5 = opendir(a1);
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = vm_vmd_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Opened dir", buf, 2u);
    }

    CFStringRef v8 = +[NSString stringWithUTF8String:a1];
    CFStringRef v9 = vm_vmd_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id d_name = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Subpath = %@", buf, 0xCu);
    }

    *(void *)&long long v10 = 138412290;
    long long v25 = v10;
    while (1)
    {
      do
      {
        int v11 = readdir(v6);
        id v12 = vm_vmd_log();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          id d_name = v11;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "entry = %p", buf, 0xCu);
        }

        if (!v11)
        {
          closedir(v6);

          return;
        }
      }
      while (!v11->d_namlen || v11->d_name[0] == 46);
      uint64_t v13 = vm_vmd_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        id d_name = v11->d_name;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "entry name = %s", buf, 0xCu);
      }

      if (a2)
      {
        size_t d_namlen = v11->d_namlen;
        if (!strncmp(v11->d_name, "Greeting.amr", d_namlen))
        {
          int v15 = vm_vmd_log();
          if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_37;
          }
          *(_WORD *)buf = 0;
          id v16 = v15;
          uint64_t v17 = "Skipping greeting deletion";
          goto LABEL_31;
        }
        if (strncmp(v11->d_name, "voicemail.db", d_namlen)
          && (d_namlen < 5 || strncmp((const char *)&v11->d_reclen + d_namlen + 1, ".amr", 4uLL)))
        {
          int v15 = vm_vmd_log();
          if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_37;
          }
          *(_WORD *)buf = 0;
          id v16 = v15;
          uint64_t v17 = "Skipping";
LABEL_31:
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, v17, buf, 2u);
          goto LABEL_37;
        }
        if (v11->d_type != 4) {
          goto LABEL_33;
        }
      }
      else
      {
        if (v11->d_type == 4)
        {
          int v15 = +[NSString stringWithUTF8String:v11->d_name];
          uint64_t v18 = [v8 stringByAppendingPathComponent:v15];
          unsigned int v19 = vm_vmd_log();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v25;
            id d_name = v18;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Cleaning %@", buf, 0xCu);
          }

          id v20 = v18;
          sub_1000708EC([v20 UTF8String], 0);
          int v21 = vm_vmd_log();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v25;
            id d_name = v20;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Removing %@", buf, 0xCu);
          }

          id v22 = v20;
          rmdir((const char *)[v22 UTF8String]);
          goto LABEL_36;
        }
LABEL_33:
        int v15 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v11->d_name, v25);
        id v23 = [v8 stringByAppendingPathComponent:v15];
        __int16 v24 = vm_vmd_log();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v25;
          id d_name = v23;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Unlinking %@", buf, 0xCu);
        }

        id v22 = v23;
        unlink((const char *)[v22 UTF8String]);
LABEL_36:

LABEL_37:
      }
    }
  }
}

void VMStoreCleanBackingFiles()
{
  id v0 = sub_10006D758();
  pthread_mutex_lock(&stru_1000E0718);
  if (qword_1000E0A18 || (VMStoreInitialize(), qword_1000E0A18))
  {
    uint64_t v1 = vm_vmd_log();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Voicemail store is valid", buf, 2u);
    }

    CFStringRef v2 = (const __CFString *)CSDBRecordStoreCopyValueForProperty();
    CFStringRef v3 = v2;
    if (v2 && CFStringGetLength(v2)) {
      goto LABEL_38;
    }
    CFArrayRef v4 = vm_vmd_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "CLEANING BACKING FILES\n", buf, 2u);
    }

    id v5 = [v0 fullPath];
    uint64_t v6 = opendir((const char *)[v5 UTF8String]);

    if (v6)
    {
      uint64_t v7 = readdir(v6);
      if (v7)
      {
        CFStringRef v9 = v7;
        Mutable = 0;
        *(void *)&long long v8 = 136315138;
        long long v19 = v8;
        do
        {
          if (v9->d_namlen)
          {
            id d_name = v9->d_name;
            if (v9->d_name[0] != 46)
            {
              id v12 = vm_vmd_log();
              if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)id v20 = v19;
                int v21 = v9->d_name;
                _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Entry name %s", v20, 0xCu);
              }

              size_t d_namlen = v9->d_namlen;
              int v14 = strncmp(d_name, "Greeting.amr", d_namlen);
              if (d_namlen >= 5)
              {
                if (v14)
                {
                  if (!strncmp(&d_name[d_namlen - 4], ".amr", 4uLL))
                  {
                    int v15 = memchr(d_name, 46, d_namlen);
                    if (v15)
                    {
                      int64_t v16 = v15 - d_name;
                      if ((unint64_t)(v15 - d_name) <= 0xFE)
                      {
                        __memcpy_chk();
                        buf[v16] = 0;
                        uint64_t v17 = atoi((const char *)buf);
                        uint64_t v18 = vm_vmd_log();
                        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)id v20 = 67109120;
                          LODWORD(v21) = v17;
                          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Record uint64_t ID = %d", v20, 8u);
                        }

                        if (!Mutable) {
                          Mutable = CFSetCreateMutable(kCFAllocatorDefault, 0, &kCFTypeSetCallBacks);
                        }
                        CFSetAddValue(Mutable, +[NSNumber numberWithInt:v17]);
                      }
                    }
                  }
                }
              }
            }
          }
          CFStringRef v9 = readdir(v6);
        }
        while (v9);
        closedir(v6);
        if (Mutable)
        {
          if (CSDBRecordStoreGetDatabase()
            && CSDBSqliteDatabaseConnectionForReading()
            && CSDBSqliteConnectionStatementForSQL())
          {
            CSDBSqliteStatementSendResults();
          }
          if (CFSetGetCount(Mutable)) {
            CFSetApplyFunction(Mutable, (CFSetApplierFunction)sub_1000712A0, 0);
          }
          CFRelease(Mutable);
        }
      }
      else
      {
        closedir(v6);
      }
    }
    CSDBRecordStoreSetValueForProperty();
    CSDBRecordSaveStore();
    if (v3) {
LABEL_38:
    }
      CFRelease(v3);
  }
  pthread_mutex_unlock(&stru_1000E0718);
}

uint64_t sub_1000711C0(uint64_t a1, __CFSet *a2)
{
  uint64_t v3 = sqlite3_column_int(*(sqlite3_stmt **)(a1 + 8), 0);
  if (a2)
  {
    uint64_t v4 = v3;
    id v5 = vm_vmd_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 67109120;
      v7[1] = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Removing uid %d", (uint8_t *)v7, 8u);
    }

    CFSetRemoveValue(a2, +[NSNumber numberWithUnsignedInt:v4]);
  }
  return 0;
}

void sub_1000712A0(uint64_t a1)
{
  CFStringRef v2 = vm_vmd_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v10 = a1;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Record uint64_t ID = %d", buf, 8u);
  }

  uint64_t v3 = sub_10006D758();
  uint64_t v4 = [v3 fullPath];
  CFStringRef v5 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%@%d.amr", v4, a1);

  if (v5)
  {
    if (CFStringGetFileSystemRepresentation(v5, (char *)buf, 1024))
    {
      uint64_t v6 = vm_vmd_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t v7 = 136315138;
        long long v8 = buf;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "DELETING FILE %s\n", v7, 0xCu);
      }

      unlink((const char *)buf);
    }
    CFRelease(v5);
  }
}

void VMStoreRecordSetData(void *a1, const void *a2, void *a3)
{
  id v5 = a1;
  id v7 = a3;
  long long v8 = (void *)VMStoreRecordCopyDataPath();
  if (v8)
  {
    id v17 = 0;
    unsigned __int8 v9 = [v7 writeToFile:v8 options:268435457 error:&v17];
    id v10 = v17;
    id v11 = v10;
    if (v9)
    {

      id v12 = +[NSFileManager defaultManager];
      NSFileAttributeKey v18 = NSFilePosixPermissions;
      long long v19 = &off_1000C86D8;
      uint64_t v13 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
      id v16 = 0;
      unsigned __int8 v14 = [v12 setAttributes:v13 ofItemAtPath:v8 error:&v16];
      id v11 = v16;

      if ((v14 & 1) == 0) {
        NSLog(@"Permissions (0700) for file %@ could not be set, error: %@", v8, v11);
      }
      VMStoreRecordSetFlag(v5, a2, 2u);
      VMStoreSave();
    }
    else
    {
      NSLog(@"Data for file %@ could not be written out, error: %@", v8, v10);
    }
  }
  else
  {
    id v11 = +[NSAssertionHandler currentHandler];
    int v15 = +[NSString stringWithUTF8String:"void VMStoreRecordSetData(NSUUID *__strong, VMStoreRecord, CFDataRef)"];
    [v11 handleFailureInFunction:v15, @"VoicemailStore.m", 1507, @"Unable to get data path for record %@", a2 file lineNumber description];
  }
}

void VMStoreRecordSetFlag(void *a1, const void *a2, unsigned int a3)
{
  id v6 = a1;
  int v5 = sub_10006E9B4((uint64_t)a2);
  VMStoreRecordSetFlagsFromServer(v6, a2, v5 | a3, 0);
}

uint64_t VMStoreGetRecordCountWithMailboxType(uint64_t a1, const __CFBoolean *a2)
{
  pthread_mutex_lock(&stru_1000E0718);
  if (!qword_1000E0A18) {
    VMStoreInitialize();
  }
  if (a2) {
    int v4 = 19;
  }
  else {
    int v4 = 18;
  }
  if (kCFBooleanTrue == a2) {
    int v5 = 3;
  }
  else {
    int v5 = 2;
  }
  switch(a1)
  {
    case 0:
      v4 |= 4u;
      break;
    case 1:
      v4 |= 0x8Cu;
      break;
    case 2:
      v4 |= 0x80u;
      v5 |= 0x80u;
      break;
    case 3:
      v4 |= 8u;
      v5 |= 8u;
      break;
    default:
      break;
  }
  if (CSDBRecordStoreGetDatabase() && CSDBSqliteDatabaseConnectionForReading())
  {
    id v6 = +[NSString stringWithFormat:@"SELECT COUNT(*) FROM voicemail WHERE ((flags & ?) = ?)"];;
    uint64_t v7 = CSDBSqliteConnectionStatementForSQL();
    if (v7)
    {
      uint64_t v8 = v7;
      sqlite3_bind_int(*(sqlite3_stmt **)(v7 + 8), 1, v4);
      sqlite3_bind_int(*(sqlite3_stmt **)(v8 + 8), 2, v5);
      uint64_t v9 = (int)CSDBSqliteStatementIntegerResult();
      CSDBSqliteStatementReset();
    }
    else
    {
      uint64_t v9 = 0;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }
  pthread_mutex_unlock(&stru_1000E0718);
  return v9;
}

uint64_t sub_1000717F4(uint64_t a1, uint64_t a2, uint64_t a3, const __CFBoolean *a4, int a5, int a6)
{
  if (a4) {
    int v8 = 19;
  }
  else {
    int v8 = 18;
  }
  if (kCFBooleanTrue == a4) {
    int v9 = 3;
  }
  else {
    int v9 = 2;
  }
  switch(a3)
  {
    case 0:
      v8 |= 4u;
      break;
    case 1:
      v8 |= 0x8Cu;
      break;
    case 2:
      int v9 = 0;
      v8 |= 0x80u;
      break;
    case 3:
      int v9 = 0;
      v8 |= 8u;
      break;
    default:
      break;
  }
  if (!CSDBRecordStoreGetDatabase() || !CSDBSqliteDatabaseConnectionForReading()) {
    return 0;
  }
  id v10 = +[NSString stringWithFormat:@"SELECT * FROM voicemail WHERE ((flags & ?) = ?) ORDER BY date DESC LIMIT ? OFFSET ?"];;
  uint64_t v11 = CSDBSqliteConnectionStatementForSQL();
  if (v11)
  {
    uint64_t v12 = v11;
    sqlite3_bind_int(*(sqlite3_stmt **)(v11 + 8), 1, v8);
    sqlite3_bind_int(*(sqlite3_stmt **)(v12 + 8), 2, v9);
    sqlite3_bind_int(*(sqlite3_stmt **)(v12 + 8), 3, a5);
    sqlite3_bind_int(*(sqlite3_stmt **)(v12 + 8), 4, a6);
    uint64_t v13 = CSDBRecordStoreProcessStatement();
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

uint64_t sub_10007197C(uint64_t a1, uint64_t a2, uint64_t a3, const __CFBoolean *a4, int a5, int a6)
{
  pthread_mutex_lock(&stru_1000E0718);
  uint64_t v12 = sub_1000717F4(a1, a2, a3, a4, a5, a6);
  pthread_mutex_unlock(&stru_1000E0718);
  return v12;
}

uint64_t VMStoreCopyRecordsWithMailboxType(uint64_t a1, const __CFBoolean *a2, int a3, int a4)
{
  pthread_mutex_lock(&stru_1000E0718);
  uint64_t v8 = qword_1000E0A18;
  if (!qword_1000E0A18)
  {
    VMStoreInitialize();
    uint64_t v8 = qword_1000E0A18;
  }
  uint64_t v9 = sub_1000717F4(v8, (uint64_t)&off_1000C2CC8, a1, a2, a3, a4);
  pthread_mutex_unlock(&stru_1000E0718);
  return v9;
}

uint64_t sub_100071A90(uint64_t a1, void *a2, int a3, int a4, void *a5)
{
  id v8 = a5;
  CSDBRecordStoreGetDatabase();
  if (CSDBSqliteDatabaseConnectionForReading())
  {
    CFStringRef v9 = @" AND label = ? ";
    if (!v8) {
      CFStringRef v9 = @" ";
    }
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"SELECT * FROM %s WHERE ((flags & ?) = ?)%@ORDER BY date DESC, ROWID DESC;",
      *a2,
    id v10 = v9);
    uint64_t v11 = CSDBSqliteConnectionStatementForSQL();
    if (v11)
    {
      uint64_t v12 = v11;
      sqlite3_bind_int(*(sqlite3_stmt **)(v11 + 8), 1, a4 | a3);
      sqlite3_bind_int(*(sqlite3_stmt **)(v12 + 8), 2, a3);
      if (v8)
      {
        uint64_t v13 = *(sqlite3_stmt **)(v12 + 8);
        id v14 = [v8 UUIDString];
        sqlite3_bind_text(v13, 3, (const char *)[v14 UTF8String], -1, 0);
      }
      uint64_t v15 = CSDBRecordStoreProcessStatement();
      CSDBSqliteStatementReset();
    }
    else
    {
      uint64_t v15 = 0;
    }
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

uint64_t sub_100071BE4(uint64_t a1, void *a2)
{
  CSDBRecordStoreGetDatabase();
  if (!CSDBSqliteDatabaseConnectionForReading()) {
    return 0;
  }
  uint64_t v3 = +[NSString stringWithFormat:@"SELECT * FROM %s;", *a2];
  if (CSDBSqliteConnectionStatementForSQL())
  {
    uint64_t v4 = CSDBRecordStoreProcessStatement();
    CSDBSqliteStatementReset();
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

uint64_t sub_100071C9C(uint64_t a1, void *a2, int a3, int a4, void *a5)
{
  id v9 = a5;
  pthread_mutex_lock(&stru_1000E0718);
  uint64_t v10 = sub_100071A90(a1, a2, a3, a4, v9);

  pthread_mutex_unlock(&stru_1000E0718);
  return v10;
}

uint64_t VMStoreCopyOfAllDeletedRecords()
{
  pthread_mutex_lock(&stru_1000E0718);
  uint64_t v0 = qword_1000E0A18;
  if (!qword_1000E0A18)
  {
    VMStoreInitialize();
    uint64_t v0 = qword_1000E0A18;
  }
  uint64_t v1 = sub_100071A90(v0, &off_1000C2D68, 0, 0, 0);
  pthread_mutex_unlock(&stru_1000E0718);
  return v1;
}

uint64_t sub_100071D84()
{
  pthread_mutex_lock(&stru_1000E0718);
  if ((qword_1000E0A18 || (VMStoreInitialize(), qword_1000E0A18))
    && (CSDBRecordStoreGetDatabase(), CSDBSqliteDatabaseConnectionForWriting())
    && CSDBSqliteDatabaseStatementForReading())
  {
    uint64_t v0 = (int)CSDBSqliteStatementIntegerResult();
    CSDBSqliteStatementReset();
  }
  else
  {
    uint64_t v0 = 0;
  }
  pthread_mutex_unlock(&stru_1000E0718);
  return v0;
}

uint64_t sub_100071E18(sqlite3_int64 a1)
{
  pthread_mutex_lock(&stru_1000E0718);
  if (!qword_1000E0A18) {
    VMStoreInitialize();
  }
  if (CSDBRecordStoreGetDatabase()
    && (uint64_t v2 = CSDBSqliteDatabaseStatementForReading()) != 0
    && (uint64_t v3 = *(sqlite3_stmt **)(v2 + 8)) != 0)
  {
    sqlite3_bind_int64(v3, 1, a1);
    uint64_t v4 = CSDBRecordStoreProcessStatement();
  }
  else
  {
    uint64_t v4 = 0;
  }
  pthread_mutex_unlock(&stru_1000E0718);
  return v4;
}

uint64_t sub_100071EC8(uint64_t a1, int a2, int a3, void *a4)
{
  id v6 = a4;
  CSDBRecordStoreGetDatabase();
  if (CSDBSqliteDatabaseConnectionForReading())
  {
    CFStringRef v7 = @" AND label = ? ";
    if (!v6) {
      CFStringRef v7 = @" ";
    }
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"SELECT remote_uid FROM voicemail WHERE (flags & ?) = ?%@ORDER BY remote_uid ASC;",
    id v8 = v7);
    uint64_t v9 = CSDBSqliteConnectionStatementForSQL();
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(sqlite3_stmt **)(v9 + 8);
      if (a3) {
        int v12 = 24;
      }
      else {
        int v12 = 56;
      }
      sqlite3_bind_int(v11, 1, v12);
      if (a2) {
        int v13 = 8;
      }
      else {
        int v13 = 0;
      }
      sqlite3_bind_int(*(sqlite3_stmt **)(v10 + 8), 2, v13);
      if (v6)
      {
        id v14 = *(sqlite3_stmt **)(v10 + 8);
        id v15 = [v6 UUIDString];
        sqlite3_bind_text(v14, 3, (const char *)[v15 UTF8String], -1, 0);
      }
      CSDBSqliteStatementSendResults();
    }
  }
  return 0;
}

uint64_t sub_100072018(uint64_t a1, __CFArray **a2)
{
  uint64_t v3 = sqlite3_column_int(*(sqlite3_stmt **)(a1 + 8), 0);
  Mutable = *a2;
  if (!*a2)
  {
    Mutable = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
    *a2 = Mutable;
  }
  CFArrayAppendValue(Mutable, +[NSNumber numberWithUnsignedInt:v3]);
  return 0;
}

const void *sub_100072094(uint64_t a1, uint64_t a2, int a3, int a4, int a5, void *a6)
{
  id v10 = a6;
  uint64_t Database = (void *)CSDBRecordStoreGetDatabase();
  uint64_t v12 = CSDBSqliteDatabaseConnectionForReading();
  if (v12)
  {
    uint64_t v13 = v12;
    CFStringRef v14 = @" AND label = ? ";
    if (!v10) {
      CFStringRef v14 = @" ";
    }
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"SELECT * FROM voicemail WHERE remote_uid = ? AND (flags & ?) = ?%@ORDER BY date DESC;",
    id v15 = v14);
    uint64_t v16 = CSDBSqliteConnectionStatementForSQL();
    if (!v16) {
      goto LABEL_17;
    }
    uint64_t v17 = v16;
    sqlite3_bind_int(*(sqlite3_stmt **)(v16 + 8), 1, a3);
    sqlite3_bind_int(*(sqlite3_stmt **)(v17 + 8), 2, a5 | a4);
    sqlite3_bind_int(*(sqlite3_stmt **)(v17 + 8), 3, a4);
    if (v10)
    {
      int cfa = a5;
      NSFileAttributeKey v18 = v15;
      long long v19 = *(sqlite3_stmt **)(v17 + 8);
      [v10 UUIDString];
      int v20 = a3;
      id v21 = objc_claimAutoreleasedReturnValue();
      id v22 = (const char *)[v21 UTF8String];
      id v23 = v19;
      id v15 = v18;
      a5 = cfa;
      sqlite3_bind_text(v23, 4, v22, -1, 0);

      a3 = v20;
    }
    CFArrayRef v24 = (const __CFArray *)CSDBRecordStoreProcessStatement();
    if (v24)
    {
      CFArrayRef v25 = v24;
      if (CFArrayGetCount(v24))
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v25, 0);
        gid_t v27 = VMStoreRecordCopyFlagsDescription(a4);
        cf = VMStoreRecordCopyFlagsDescription(a5);
        uint64_t v28 = vm_vmd_log();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          int Count = CFArrayGetCount(v25);
          uint64_t v30 = *Database;
          *(_DWORD *)buf = 67111170;
          int v35 = a3;
          __int16 v36 = 2112;
          id v37 = v27;
          __int16 v38 = 2112;
          uint64_t v39 = cf;
          __int16 v40 = 2112;
          id v41 = v10;
          __int16 v42 = 1024;
          int v43 = Count;
          __int16 v44 = 2048;
          uint64_t v45 = a1;
          __int16 v46 = 2048;
          id v47 = Database;
          __int16 v48 = 2112;
          uint64_t v49 = v30;
          __int16 v50 = 2048;
          uint64_t v51 = v13;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "VMStoreCopyRecordWithRemoteUID for UID=%u <flagsToHave=%@, flagsToNotHave=%@ label=%@> found %d records (store=%p, db=%p path=%@, connection=%p)", buf, 0x54u);
        }

        if (v27) {
          CFRelease(v27);
        }
        if (cf) {
          CFRelease(cf);
        }
        if (ValueAtIndex) {
          CFRetain(ValueAtIndex);
        }
      }
      else
      {
        ValueAtIndex = 0;
      }
      CFRelease(v25);
    }
    else
    {
LABEL_17:
      ValueAtIndex = 0;
    }
  }
  else
  {
    ValueAtIndex = 0;
  }

  return ValueAtIndex;
}

__CFString *VMStoreRecordCopyFlagsDescription(int a1)
{
  MutableCopy = CFStringCreateMutableCopy(0, 0, @"(");
  uint64_t v3 = 0;
  char v4 = 1;
  do
  {
    if ((dword_1000C2E08[v3] & a1) != 0)
    {
      if ((v4 & 1) == 0) {
        CFStringAppend(MutableCopy, @", ");
      }
      CFStringAppend(MutableCopy, *(CFStringRef *)&dword_1000C2E08[v3 + 2]);
      char v4 = 0;
    }
    v3 += 4;
  }
  while (v3 != 68);
  CFStringAppend(MutableCopy, @""));
  return MutableCopy;
}

const void *sub_100072414(uint64_t a1, uint64_t a2, int a3, int a4, int a5, void *a6)
{
  id v11 = a6;
  pthread_mutex_lock(&stru_1000E0718);
  uint64_t v12 = sub_100072094(a1, a2, a3, a4, a5, v11);

  pthread_mutex_unlock(&stru_1000E0718);
  return v12;
}

const void *VMStoreCopyRecordWithRemoteUID(int a1, int a2, int a3, void *a4)
{
  id v7 = a4;
  pthread_mutex_lock(&stru_1000E0718);
  uint64_t v8 = qword_1000E0A18;
  if (!qword_1000E0A18)
  {
    VMStoreInitialize();
    uint64_t v8 = qword_1000E0A18;
  }
  uint64_t v9 = sub_100072094(v8, (uint64_t)&off_1000C2CC8, a1, a2, a3, v7);
  pthread_mutex_unlock(&stru_1000E0718);

  return v9;
}

uint64_t VMStoreCopyRecordWithIdentifier()
{
  pthread_mutex_lock(&stru_1000E0718);
  if (!qword_1000E0A18) {
    VMStoreInitialize();
  }
  uint64_t v0 = CSDBRecordStoreCopyInstanceOfClassWithUID();
  pthread_mutex_unlock(&stru_1000E0718);
  return v0;
}

uint64_t sub_10007259C(uint64_t a1, void *a2, void *a3, unint64_t a4)
{
  if (a4 > 3)
  {
    int v6 = 0;
    int v7 = 0;
  }
  else
  {
    int v6 = dword_1000A73C0[a4];
    int v7 = dword_1000A73D0[a4];
  }
  CSDBRecordStoreGetDatabase();
  if (!CSDBSqliteDatabaseConnectionForReading()) {
    return 0;
  }
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"SELECT * FROM %s WHERE token = ? AND ((flags & ?) = ?) ORDER BY ROWID ASC;",
  uint64_t v8 = *a2);
  uint64_t v9 = CSDBSqliteConnectionStatementForSQL();
  if (v9)
  {
    uint64_t v10 = v9;
    sqlite3_bind_text(*(sqlite3_stmt **)(v9 + 8), 1, (const char *)[a3 UTF8String], -1, 0);
    sqlite3_bind_int(*(sqlite3_stmt **)(v10 + 8), 2, v7);
    sqlite3_bind_int(*(sqlite3_stmt **)(v10 + 8), 3, v6);
    uint64_t v11 = CSDBRecordStoreProcessStatement();
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

CFTypeRef sub_1000726D8(uint64_t a1, void *a2, void *a3, unint64_t a4)
{
  CFArrayRef v4 = (const __CFArray *)sub_10007259C(a1, a2, a3, a4);
  if (!v4) {
    return 0;
  }
  CFArrayRef v5 = v4;
  if (CFArrayGetCount(v4) < 1)
  {
    CFTypeRef v7 = 0;
  }
  else
  {
    ValueAtIndex = CFArrayGetValueAtIndex(v5, 0);
    CFTypeRef v7 = CFRetain(ValueAtIndex);
  }
  CFRelease(v5);
  return v7;
}

uint64_t sub_10007273C(uint64_t a1, void *a2, void *a3, unint64_t a4)
{
  pthread_mutex_lock(&stru_1000E0718);
  uint64_t v8 = sub_10007259C(a1, a2, a3, a4);
  pthread_mutex_unlock(&stru_1000E0718);
  return v8;
}

CFTypeRef sub_1000727AC(uint64_t a1, void *a2, void *a3, unint64_t a4)
{
  pthread_mutex_lock(&stru_1000E0718);
  CFTypeRef v8 = sub_1000726D8(a1, a2, a3, a4);
  pthread_mutex_unlock(&stru_1000E0718);
  return v8;
}

uint64_t VMStoreCopyRecordsWithTokenInMailbox(void *a1, unint64_t a2)
{
  pthread_mutex_lock(&stru_1000E0718);
  uint64_t v4 = qword_1000E0A18;
  if (!qword_1000E0A18)
  {
    VMStoreInitialize();
    uint64_t v4 = qword_1000E0A18;
  }
  uint64_t v5 = sub_10007259C(v4, &off_1000C2CC8, a1, a2);
  pthread_mutex_unlock(&stru_1000E0718);
  return v5;
}

CFTypeRef VMStoreCopyFirstRecordWithTokenInMailbox(void *a1, unint64_t a2)
{
  pthread_mutex_lock(&stru_1000E0718);
  uint64_t v4 = qword_1000E0A18;
  if (!qword_1000E0A18)
  {
    VMStoreInitialize();
    uint64_t v4 = qword_1000E0A18;
  }
  CFTypeRef v5 = sub_1000726D8(v4, &off_1000C2CC8, a1, a2);
  pthread_mutex_unlock(&stru_1000E0718);
  return v5;
}

uint64_t sub_100072904(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = a4;
  CSDBRecordStoreGetDatabase();
  if (CSDBSqliteDatabaseConnectionForReading())
  {
    CFStringRef v7 = @" AND label = ?";
    if (!v6) {
      CFStringRef v7 = &stru_1000C35D8;
    }
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"SELECT * FROM %s WHERE token = ?%@ ORDER BY ROWID ASC;",
      *a2,
    CFTypeRef v8 = v7);
    uint64_t v9 = CSDBSqliteConnectionStatementForSQL();
    if (v9)
    {
      uint64_t v10 = v9;
      sqlite3_bind_text(*(sqlite3_stmt **)(v9 + 8), 1, (const char *)[a3 UTF8String], -1, 0);
      if (v6)
      {
        uint64_t v11 = *(sqlite3_stmt **)(v10 + 8);
        id v12 = [v6 UUIDString];
        sqlite3_bind_text(v11, 2, (const char *)[v12 UTF8String], -1, 0);
      }
      uint64_t v13 = CSDBRecordStoreProcessStatement();
    }
    else
    {
      uint64_t v13 = 0;
    }
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

CFTypeRef sub_100072A54(uint64_t a1, void *a2, void *a3, void *a4)
{
  CFArrayRef v4 = (const __CFArray *)sub_100072904(a1, a2, a3, a4);
  if (!v4) {
    return 0;
  }
  CFArrayRef v5 = v4;
  if (CFArrayGetCount(v4) < 1)
  {
    CFTypeRef v7 = 0;
  }
  else
  {
    ValueAtIndex = CFArrayGetValueAtIndex(v5, 0);
    CFTypeRef v7 = CFRetain(ValueAtIndex);
  }
  CFRelease(v5);
  return v7;
}

uint64_t sub_100072AB8(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a4;
  pthread_mutex_lock(&stru_1000E0718);
  uint64_t v8 = sub_100072904(a1, a2, a3, v7);

  pthread_mutex_unlock(&stru_1000E0718);
  return v8;
}

CFTypeRef sub_100072B30(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a4;
  pthread_mutex_lock(&stru_1000E0718);
  CFTypeRef v8 = sub_100072A54(a1, a2, a3, v7);

  pthread_mutex_unlock(&stru_1000E0718);
  return v8;
}

uint64_t VMStoreCopyRecordsWithToken(void *a1, void *a2)
{
  id v3 = a2;
  pthread_mutex_lock(&stru_1000E0718);
  uint64_t v4 = qword_1000E0A18;
  if (!qword_1000E0A18)
  {
    VMStoreInitialize();
    uint64_t v4 = qword_1000E0A18;
  }
  uint64_t v5 = sub_100072904(v4, &off_1000C2CC8, a1, v3);
  pthread_mutex_unlock(&stru_1000E0718);

  return v5;
}

CFTypeRef VMStoreCopyFirstRecordWithToken(void *a1, void *a2)
{
  id v3 = a2;
  pthread_mutex_lock(&stru_1000E0718);
  uint64_t v4 = qword_1000E0A18;
  if (!qword_1000E0A18)
  {
    VMStoreInitialize();
    uint64_t v4 = qword_1000E0A18;
  }
  CFTypeRef v5 = sub_100072A54(v4, &off_1000C2CC8, a1, v3);
  pthread_mutex_unlock(&stru_1000E0718);

  return v5;
}

CFTypeRef VMStoreCopyFirstDeletedRecordWithToken(void *a1, void *a2)
{
  id v3 = a2;
  pthread_mutex_lock(&stru_1000E0718);
  uint64_t v4 = qword_1000E0A18;
  if (!qword_1000E0A18)
  {
    VMStoreInitialize();
    uint64_t v4 = qword_1000E0A18;
  }
  CFTypeRef v5 = sub_100072A54(v4, &off_1000C2D68, a1, v3);
  pthread_mutex_unlock(&stru_1000E0718);

  return v5;
}

CFTypeRef sub_100072D1C(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  CSDBRecordStoreGetDatabase();
  if (CSDBSqliteDatabaseConnectionForReading())
  {
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"SELECT * FROM %s where uuid = ? ORDER BY ROWID ASC;",
    CFTypeRef v5 = *a2);
    uint64_t v6 = CSDBSqliteConnectionStatementForSQL();
    if (v6)
    {
      id v7 = *(sqlite3_stmt **)(v6 + 8);
      id v8 = [v4 UUIDString];
      sqlite3_bind_text(v7, 1, (const char *)[v8 UTF8String], -1, 0);

      CFArrayRef v9 = (const __CFArray *)CSDBRecordStoreProcessStatement();
      if (v9)
      {
        CFArrayRef v10 = v9;
        CFIndex Count = CFArrayGetCount(v9);
        if (Count < 1)
        {
          CFTypeRef v14 = 0;
        }
        else
        {
          CFIndex v12 = Count;
          ValueAtIndex = CFArrayGetValueAtIndex(v10, 0);
          CFTypeRef v14 = CFRetain(ValueAtIndex);
          if (v12 != 1)
          {
            id v15 = vm_vmd_log();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v16 = [v4 UUIDString];
              *(_DWORD *)buf = 134218242;
              CFIndex v19 = v12;
              __int16 v20 = 2112;
              id v21 = v16;
              _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Warning: Found %ld records for UUID '%@'", buf, 0x16u);
            }
          }
        }
        CFRelease(v10);
      }
      else
      {
        CFTypeRef v14 = 0;
      }
      CSDBSqliteStatementReset();
    }
    else
    {
      CFTypeRef v14 = 0;
    }
  }
  else
  {
    CFTypeRef v14 = 0;
  }

  return v14;
}

CFTypeRef sub_100072F10(void *a1)
{
  id v1 = a1;
  pthread_mutex_lock(&stru_1000E0718);
  CFTypeRef v2 = sub_100072D1C(qword_1000E0A18, &off_1000C2CC8, v1);

  pthread_mutex_unlock(&stru_1000E0718);
  return v2;
}

uint64_t VMStoreCopyRecordsWithLabelID(void *a1)
{
  id v1 = a1;
  pthread_mutex_lock(&stru_1000E0718);
  if (!qword_1000E0A18) {
    VMStoreInitialize();
  }
  CSDBRecordStoreGetDatabase();
  uint64_t v2 = CSDBSqliteDatabaseConnectionForReading();
  if (v2)
  {
    id v3 = +[NSString stringWithFormat:@"SELECT * FROM voicemail WHERE label = ? ORDER BY ROWID ASC"];;
    uint64_t v4 = CSDBSqliteConnectionStatementForSQL();
    uint64_t v2 = v4;
    if (v4)
    {
      CFTypeRef v5 = *(sqlite3_stmt **)(v4 + 8);
      id v6 = [v1 UUIDString];
      sqlite3_bind_text(v5, 1, (const char *)[v6 UTF8String], -1, 0);

      uint64_t v2 = CSDBRecordStoreProcessStatement();
    }
  }
  pthread_mutex_unlock(&stru_1000E0718);

  return v2;
}

uint64_t VMStoreCopyRecordsWithReceiver(void *a1)
{
  pthread_mutex_lock(&stru_1000E0718);
  if (!qword_1000E0A18) {
    VMStoreInitialize();
  }
  CSDBRecordStoreGetDatabase();
  if (CSDBSqliteDatabaseConnectionForReading())
  {
    uint64_t v2 = +[NSString stringWithFormat:@"SELECT * FROM voicemail WHERE receiver = ? ORDER BY ROWID ASC"];;
    uint64_t v3 = CSDBSqliteConnectionStatementForSQL();
    if (v3)
    {
      sqlite3_bind_text(*(sqlite3_stmt **)(v3 + 8), 1, (const char *)[a1 UTF8String], -1, 0);
      uint64_t v4 = CSDBRecordStoreProcessStatement();
    }
    else
    {
      uint64_t v4 = 0;
    }
  }
  else
  {
    uint64_t v4 = 0;
  }
  pthread_mutex_unlock(&stru_1000E0718);
  return v4;
}

CFArrayRef sub_100073178(uint64_t a1, uint64_t a2, int a3, int a4, int a5, int a6, void *a7)
{
  id v12 = a7;
  uint64_t Database = (void *)CSDBRecordStoreGetDatabase();
  uint64_t v14 = CSDBSqliteDatabaseConnectionForReading();
  int v15 = a4 | 0x10;
  int v29 = a5;
  int v30 = a6;
  if (v14)
  {
    CFStringRef v16 = @" AND label = ? ";
    if (!v12) {
      CFStringRef v16 = @" ";
    }
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"SELECT * FROM voicemail WHERE (flags & ?) = ? AND remote_uid >= ? AND remote_uid <= ?%@ORDER BY remote_uid;",
    uint64_t v17 = v16);
    uint64_t v18 = CSDBSqliteConnectionStatementForSQL();
    if (v18)
    {
      uint64_t v19 = v18;
      sqlite3_bind_int(*(sqlite3_stmt **)(v18 + 8), 1, v15 | a3);
      sqlite3_bind_int(*(sqlite3_stmt **)(v19 + 8), 2, a3);
      sqlite3_bind_int(*(sqlite3_stmt **)(v19 + 8), 3, a5);
      sqlite3_bind_int(*(sqlite3_stmt **)(v19 + 8), 4, a6);
      if (v12)
      {
        __int16 v20 = *(sqlite3_stmt **)(v19 + 8);
        id v21 = [v12 UUIDString];
        sqlite3_bind_text(v20, 5, (const char *)[v21 UTF8String], -1, 0);
      }
      CFArrayRef v22 = (const __CFArray *)CSDBRecordStoreProcessStatement();
      CSDBSqliteStatementReset();
    }
    else
    {
      CFArrayRef v22 = 0;
    }
  }
  else
  {
    CFArrayRef v22 = 0;
  }
  id v23 = VMStoreRecordCopyFlagsDescription(a3);
  CFArrayRef v24 = VMStoreRecordCopyFlagsDescription(v15);
  CFArrayRef v25 = vm_vmd_log();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    int Count = CFArrayGetCount(v22);
    uint64_t v27 = *Database;
    *(_DWORD *)buf = 67111938;
    int v32 = v29;
    __int16 v33 = 1024;
    int v34 = v30;
    __int16 v35 = 2112;
    __int16 v36 = v23;
    __int16 v37 = 2112;
    __int16 v38 = v24;
    __int16 v39 = 2112;
    id v40 = v12;
    __int16 v41 = 1024;
    int v42 = v15 | a3;
    __int16 v43 = 1024;
    int v44 = a3;
    __int16 v45 = 1024;
    int v46 = Count;
    __int16 v47 = 2048;
    uint64_t v48 = a1;
    __int16 v49 = 2048;
    __int16 v50 = Database;
    __int16 v51 = 2112;
    uint64_t v52 = v27;
    __int16 v53 = 2048;
    uint64_t v54 = v14;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "VMStoreCopyOfAllRecordsWithFlagsInRemoteUIDRange <lowUID=%u, highUID=%u> <flagsToHave=%@, flagsToNotHave=%@ label=%@> ((flags & %d) = %d) found %d records (store=%p, db=%p path=%@, connection=%p)", buf, 0x66u);
  }

  if (v23) {
    CFRelease(v23);
  }
  if (v24) {
    CFRelease(v24);
  }

  return v22;
}

CFArrayRef sub_10007342C(uint64_t a1, uint64_t a2, int a3, int a4, int a5, int a6, void *a7)
{
  id v13 = a7;
  pthread_mutex_lock(&stru_1000E0718);
  CFArrayRef v14 = sub_100073178(a1, a2, a3, a4, a5, a6, v13);

  pthread_mutex_unlock(&stru_1000E0718);
  return v14;
}

CFArrayRef VMStoreCopyOfAllRecordsWithFlagsInRemoteUIDRange(int a1, int a2, int a3, int a4, void *a5)
{
  id v9 = a5;
  pthread_mutex_lock(&stru_1000E0718);
  uint64_t v10 = qword_1000E0A18;
  if (!qword_1000E0A18)
  {
    VMStoreInitialize();
    uint64_t v10 = qword_1000E0A18;
  }
  CFArrayRef v11 = sub_100073178(v10, (uint64_t)&off_1000C2CC8, a1, a2, a3, a4, v9);
  pthread_mutex_unlock(&stru_1000E0718);

  return v11;
}

uint64_t VMStoreCountOfRecordsWithFlags(int a1, int a2, void *a3)
{
  id v5 = a3;
  pthread_mutex_lock(&stru_1000E0718);
  if (!qword_1000E0A18) {
    VMStoreInitialize();
  }
  CSDBRecordStoreGetDatabase();
  uint64_t v6 = CSDBSqliteDatabaseConnectionForReading();
  if (v6)
  {
    CFStringRef v7 = @" AND label = ? ";
    if (!v5) {
      CFStringRef v7 = @" ";
    }
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"SELECT COUNT(*) FROM voicemail WHERE ((flags & ?) = ?)%@;",
    id v8 = v7);
    uint64_t v9 = CSDBSqliteConnectionStatementForSQL();
    if (v9)
    {
      uint64_t v10 = v9;
      sqlite3_bind_int(*(sqlite3_stmt **)(v9 + 8), 1, a2 | a1);
      sqlite3_bind_int(*(sqlite3_stmt **)(v10 + 8), 2, a1);
      if (v5)
      {
        CFArrayRef v11 = *(sqlite3_stmt **)(v10 + 8);
        id v12 = [v5 UUIDString];
        sqlite3_bind_text(v11, 3, (const char *)[v12 UTF8String], -1, 0);
      }
      uint64_t v6 = CSDBSqliteStatementIntegerResult();
      CSDBSqliteStatementReset();
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  pthread_mutex_unlock(&stru_1000E0718);
  id v13 = VMStoreRecordCopyFlagsDescription(a1);
  CFArrayRef v14 = VMStoreRecordCopyFlagsDescription(a2);
  int v15 = vm_vmd_log();
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (!v16) {
      goto LABEL_18;
    }
    *(_DWORD *)buf = 138413058;
    CFArrayRef v22 = v13;
    __int16 v23 = 2112;
    CFArrayRef v24 = v14;
    __int16 v25 = 2112;
    id v26 = v5;
    __int16 v27 = 1024;
    int v28 = v6;
    uint64_t v17 = "VMStoreCountOfRecordsWithFlags <flagsToHave=%@, flagsToNotHave=%@ label=%@> found %d records";
    uint64_t v18 = v15;
    uint32_t v19 = 38;
  }
  else
  {
    if (!v16) {
      goto LABEL_18;
    }
    *(_DWORD *)buf = 138412802;
    CFArrayRef v22 = v13;
    __int16 v23 = 2112;
    CFArrayRef v24 = v14;
    __int16 v25 = 1024;
    LODWORD(v26) = v6;
    uint64_t v17 = "VMStoreCountOfRecordsWithFlags <flagsToHave=%@, flagsToNotHave=%@> found %d records";
    uint64_t v18 = v15;
    uint32_t v19 = 28;
  }
  _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, v17, buf, v19);
LABEL_18:

  if (v13) {
    CFRelease(v13);
  }
  if (v14) {
    CFRelease(v14);
  }

  return v6;
}

void VMStoreRecordSetFlagLocal(uint64_t a1, int a2)
{
  int v4 = sub_10006E9B4(a1);
  CFStringRef v5 = VMStoreRecordCopyDescription(a1);
  uint64_t v6 = VMStoreRecordCopyFlagsDescription(a2);
  CFStringRef v7 = vm_vmd_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    CFStringRef v10 = v5;
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "VMStoreRecordSetFlagLocal <record=%@, flagsToEnable=%@>", (uint8_t *)&v9, 0x16u);
  }

  if (v6) {
    CFRelease(v6);
  }
  int v8 = v4 | a2;
  if (v5) {
    CFRelease(v5);
  }
  if (v8 != v4) {
    sub_10006EA1C(a1);
  }
}

void VMStoreRecordSetFlags(void *a1, const void *a2, uint64_t a3)
{
}

void VMStoreRecordSetFlagsFromServer(void *a1, const void *a2, uint64_t a3, int a4)
{
  id v7 = a1;
  CFStringRef v8 = VMStoreRecordCopyDescription((uint64_t)a2);
  int v9 = VMStoreRecordCopyFlagsDescription(a3);
  CFStringRef v10 = vm_vmd_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v11 = @"YES";
    int v19 = 138412802;
    CFStringRef v20 = v8;
    __int16 v21 = 2112;
    if (!a4) {
      CFStringRef v11 = @"NO";
    }
    CFStringRef v22 = v11;
    __int16 v23 = 2112;
    CFArrayRef v24 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "VMStoreRecordSetFlagsFromServer <record=%@, fromServer=%@, flags=%@>", (uint8_t *)&v19, 0x20u);
  }

  if (v9) {
    CFRelease(v9);
  }
  if (v8) {
    CFRelease(v8);
  }
  pthread_mutex_lock(&stru_1000E0718);
  if (!qword_1000E0A18)
  {
    VMStoreInitialize();
    if (!qword_1000E0A18) {
      goto LABEL_20;
    }
  }
  if (!a2)
  {
    if (a3)
    {
      uint64_t Property = 0;
      goto LABEL_16;
    }
LABEL_20:
    pthread_mutex_unlock(&stru_1000E0718);
    goto LABEL_27;
  }
  uint64_t Property = CSDBRecordGetProperty();
  if (Property == a3) {
    goto LABEL_20;
  }
  CSDBRecordSetProperty();
LABEL_16:
  pthread_mutex_unlock(&stru_1000E0718);
  Mutable = CFDictionaryCreateMutable(0, 3, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFArrayRef v14 = Mutable;
  if (a4) {
    CFDictionarySetValue(Mutable, @"VMStoreRecordChangedFlagsFromServer", &off_1000C86F0);
  }
  if (v7)
  {
    CFDictionarySetValue(v14, @"VMStoreRecordChangedFlagsLabel", [v7 UUIDString]);
  }
  else
  {
    int v15 = vm_vmd_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "=== VMStoreRecordSetFlagsFromServer, NO LABEL ID given - notifications will not work properly!!!! ====", (uint8_t *)&v19, 2u);
    }
  }
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterPostNotification(LocalCenter, @"VMStoreRecordFlagsWIllChange", a2, v14, 1u);
  CFDictionarySetValue(v14, @"VMStoreRecordOldFlags", +[NSNumber numberWithUnsignedInt:Property]);
  CFDictionarySetValue(v14, @"VMStoreRecordNewFlags", +[NSNumber numberWithUnsignedInt:a3]);
  CFDictionarySetValue(v14, @"VMStoreRecordChangedFlags", +[NSNumber numberWithUnsignedInt:Property ^ a3]);
  uint64_t v17 = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterPostNotification(v17, @"VMStoreRecordFlagsDidChange", a2, v14, 1u);
  if ((Property ^ a3) != 2)
  {
    uint64_t v18 = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterPostNotification(v18, @"VMStoreRecordFlagsChanged", a2, v14, 1u);
  }
  CFRelease(v14);
LABEL_27:
}

uint64_t sub_100073C18(uint64_t a1, int a2)
{
  char v4 = sub_10006E9B4(a1);
  if (!a2)
  {
    if ((v4 & 8) != 0)
    {
      sub_10006EA1C(a1);
      goto LABEL_7;
    }
    return 0;
  }
  if ((v4 & 8) != 0) {
    return 0;
  }
  sub_10006EA1C(a1);
  CFAbsoluteTimeGetCurrent();
LABEL_7:
  sub_10006EA1C(a1);
  return 1;
}

uint64_t sub_100073CA4(uint64_t a1, int a2)
{
  char v4 = sub_10006E9B4(a1);
  if (a2)
  {
    if ((v4 & 1) == 0) {
      goto LABEL_6;
    }
    return 0;
  }
  if ((v4 & 1) == 0) {
    return 0;
  }
LABEL_6:
  sub_10006EA1C(a1);
  return 1;
}

void *VMStoreRecordCopyArrayDescription(const __CFArray *a1)
{
  uint64_t v2 = objc_opt_new();
  objc_msgSend(v2, "appendFormat:", @"(\n");
  if (a1)
  {
    CFIndex Count = CFArrayGetCount(a1);
    if (Count >= 1)
    {
      CFIndex v4 = Count;
      for (CFIndex i = 0; i != v4; ++i)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(a1, i);
        CFStringRef v7 = VMStoreRecordCopyDescription((uint64_t)ValueAtIndex);
        [v2 appendFormat:@"  '%@'\n", v7];
        if (v7) {
          CFRelease(v7);
        }
      }
    }
  }
  [v2 appendFormat:@"\n"]);
  return v2;
}

uint64_t sub_100073DCC()
{
  pthread_mutex_lock(&stru_1000E0718);
  if (qword_1000E0A18 || (VMStoreInitialize(), qword_1000E0A18))
  {
    CSDBRecordStoreGetDatabase();
    CSDBSqliteDatabaseSetValueForProperty();
  }
  return pthread_mutex_unlock(&stru_1000E0718);
}

uint64_t sub_100073E3C(const __CFString *a1)
{
  id v1 = sub_100073EB8(a1);
  pthread_mutex_lock(&stru_1000E0718);
  if (qword_1000E0A18)
  {
    CSDBRecordStoreGetDatabase();
    uint64_t v2 = CSDBSqliteDatabaseCopyValueForProperty();
  }
  else
  {
    uint64_t v2 = 0;
  }
  pthread_mutex_unlock(&stru_1000E0718);
  if (v1) {
    CFRelease(v1);
  }
  return v2;
}

__CFString *sub_100073EB8(const __CFString *a1)
{
  MutableCopy = @"token";
  if (CFStringCompare(a1, @"token", 0))
  {
    if (a1 && (CFIndex Length = CFStringGetLength(a1), Length >= 1))
    {
      MutableCopy = CFStringCreateMutableCopy(0, Length + 6, @"token-");
      CFStringAppend(MutableCopy, a1);
    }
    else
    {
      return 0;
    }
  }
  return MutableCopy;
}

void sub_100073F30(uint64_t a1, const __CFString *a2)
{
  uint64_t v3 = sub_100073EB8(a2);
  if (v3)
  {
    CFIndex v4 = v3;
    pthread_mutex_lock(&stru_1000E0718);
    if (qword_1000E0A18 || (VMStoreInitialize(), qword_1000E0A18))
    {
      if (CSDBRecordStoreGetDatabase() && CSDBSqliteDatabaseConnectionForWriting())
      {
        CSDBSqliteConnectionBegin();
        CSDBSqliteConnectionSetValueForProperty();
        if (CFStringCompare(@"token", a2, 0)) {
          CSDBSqliteConnectionSetValueForProperty();
        }
        CSDBSqliteConnectionCommit();
      }
    }
    pthread_mutex_unlock(&stru_1000E0718);
    CFRelease(v4);
  }
  else
  {
    sub_100073DCC();
  }
}

uint64_t VMStoreCopyKeyedTokens()
{
  if (qword_1000E0A18 || (VMStoreInitialize(), qword_1000E0A18))
  {
    if (CSDBRecordStoreGetDatabase() && CSDBSqliteDatabaseConnectionForReading()) {
      CSDBSqliteConnectionCopyValuesForPropertiesLike();
    }
  }
  pthread_mutex_unlock(&stru_1000E0718);
  return 0;
}

void VMStoreSetTimestampForTokenWithKey(uint64_t a1, const __CFString *a2)
{
  uint64_t v3 = sub_100074194(a2);
  if (!v3) {
    return;
  }
  CFIndex v4 = v3;
  pthread_mutex_lock(&stru_1000E0718);
  if (qword_1000E0A18 || (VMStoreInitialize(), qword_1000E0A18))
  {
    CFStringRef v5 = CFStringCreateWithFormat(0, 0, @"%u", a1);
    if (CSDBRecordStoreGetDatabase()) {
      BOOL v6 = v5 == 0;
    }
    else {
      BOOL v6 = 1;
    }
    if (v6)
    {
      if (!v5) {
        goto LABEL_13;
      }
    }
    else
    {
      CSDBSqliteDatabaseSetValueForProperty();
    }
    CFRelease(v5);
  }
LABEL_13:
  pthread_mutex_unlock(&stru_1000E0718);
  CFRelease(v4);
}

__CFString *sub_100074194(const __CFString *a1)
{
  if (!a1) {
    return 0;
  }
  CFIndex Length = CFStringGetLength(a1);
  if (Length < 1) {
    return 0;
  }
  MutableCopy = CFStringCreateMutableCopy(0, Length + 10, @"timestamp-");
  CFStringAppend(MutableCopy, a1);
  return MutableCopy;
}

uint64_t VMStoreGetTimestampForTokenWithKey(const __CFString *a1)
{
  id v1 = sub_100074194(a1);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  pthread_mutex_lock(&stru_1000E0718);
  if ((qword_1000E0A18 || (VMStoreInitialize(), qword_1000E0A18))
    && CSDBRecordStoreGetDatabase()
    && (CFStringRef v3 = (const __CFString *)CSDBSqliteDatabaseCopyValueForProperty()) != 0)
  {
    CFStringRef v4 = v3;
    uint64_t IntValue = CFStringGetIntValue(v3);
    CFRelease(v4);
  }
  else
  {
    uint64_t IntValue = 0;
  }
  pthread_mutex_unlock(&stru_1000E0718);
  CFRelease(v2);
  return IntValue;
}

uint64_t VMStoreSetMailboxUsage()
{
  pthread_mutex_lock(&stru_1000E0718);
  if (qword_1000E0A18 || (VMStoreInitialize(), qword_1000E0A18))
  {
    CSDBRecordStoreGetDatabase();
    CSDBSqliteDatabaseSetValueForProperty();
  }
  return pthread_mutex_unlock(&stru_1000E0718);
}

uint64_t VMStoreCopyMailboxUsage()
{
  pthread_mutex_lock(&stru_1000E0718);
  if (qword_1000E0A18 || (VMStoreInitialize(), qword_1000E0A18))
  {
    CSDBRecordStoreGetDatabase();
    uint64_t v0 = CSDBSqliteDatabaseCopyValueForProperty();
  }
  else
  {
    uint64_t v0 = 0;
  }
  pthread_mutex_unlock(&stru_1000E0718);
  return v0;
}

BOOL sub_100074370(uint64_t a1, uint64_t a2, const void *a3)
{
  pthread_mutex_lock(&stru_1000E0718);
  if ((qword_1000E0A18 || (VMStoreInitialize(), qword_1000E0A18))
    && (CFStringRef v6 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%@_%@", a2, a1)) != 0)
  {
    CFStringRef v7 = v6;
    CSDBRecordStoreGetDatabase();
    CFStringRef v8 = (const void *)CSDBSqliteDatabaseCopyValueForProperty();
    if (v8)
    {
      int v9 = v8;
      BOOL v10 = CFEqual(v8, a3) != 0;
      CFRelease(v9);
    }
    else
    {
      BOOL v10 = 0;
    }
    CFRelease(v7);
  }
  else
  {
    BOOL v10 = 0;
  }
  pthread_mutex_unlock(&stru_1000E0718);
  return v10;
}

uint64_t sub_10007444C(uint64_t a1, uint64_t a2)
{
  pthread_mutex_lock(&stru_1000E0718);
  if (qword_1000E0A18 || (VMStoreInitialize(), qword_1000E0A18))
  {
    CFStringRef v4 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%@_%@", a2, a1);
    if (v4)
    {
      CFStringRef v5 = v4;
      CSDBRecordStoreGetDatabase();
      CSDBSqliteDatabaseSetValueForProperty();
      CFRelease(v5);
    }
  }
  return pthread_mutex_unlock(&stru_1000E0718);
}

BOOL VMStoreGetReceiverMigration(uint64_t a1)
{
  return sub_100074370(a1, @"ReceiverMigration", @"2");
}

uint64_t VMStoreSetReceiverMigration(uint64_t a1)
{
  return sub_10007444C(a1, @"ReceiverMigration");
}

uint64_t sub_100074538()
{
  sub_1000752D0((uint64_t *)&off_1000C2CC8);
  sub_1000752D0((uint64_t *)&off_1000C2D68);
  sub_1000752D0((uint64_t *)&off_1000C2C28);
  sub_100075394();
  sub_100075394();
  return CSDBSqliteConnectionSetValueForProperty();
}

uint64_t sub_1000745C8()
{
  return CSDBSqliteConnectionPerformSQL();
}

BOOL sub_1000745D8(uint64_t a1, uint64_t a2, unsigned int a3)
{
  CFStringRef v4 = vm_vmd_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109376;
    v7[1] = a3;
    __int16 v8 = 2048;
    uint64_t v9 = 11;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "The current VM database is v%d.  The current schema version is v%ld", (uint8_t *)v7, 0x12u);
  }

  if (a3 <= 0xA)
  {
    CFStringRef v5 = vm_vmd_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v7[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Voicemail DB can be migrated.", (uint8_t *)v7, 2u);
    }
  }
  return a3 < 0xB;
}

uint64_t sub_1000746E0(uint64_t a1, NSObject *a2, int a3)
{
  CFStringRef v5 = vm_vmd_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)__int16 v45 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "==> VMStoreMigrationHandler with version: %d", buf, 8u);
  }

  if (!a3)
  {
    a3 = CSDBSqliteConnectionIntegerForProperty();
    CFStringRef v6 = vm_vmd_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)__int16 v45 = a3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "oldVersion = %d", buf, 8u);
    }

    if (a3 == 11)
    {
      CFStringRef v7 = vm_vmd_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "database has correct version, migration is a no-op\n", buf, 2u);
      }

      __int16 v8 = vm_vmd_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Determined that there is no need to perform migration", buf, 2u);
      }

      return 3;
    }
  }
  int v10 = a3;
  switch(a3)
  {
    case 4:
      CFStringRef v11 = vm_vmd_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)__int16 v45 = 4;
        *(_WORD *)&v45[4] = 1024;
        *(_DWORD *)&v45[6] = 5;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Migrating database from schema version %d to schema version %d", buf, 0xEu);
      }

      id v12 = vm_vmd_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)__int16 v45 = @"voicemail";
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Adding column of type: TEXT with name: receiver to table: %@", buf, 0xCu);
      }

      int v13 = sub_1000753EC(a2, @"receiver", @"voicemail");
      CFArrayRef v14 = vm_vmd_log();
      BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
      if (v13)
      {
        if (v15)
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)__int16 v45 = 5;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Migrated database to schema version %d", buf, 8u);
        }

        goto LABEL_21;
      }
      if (v15)
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)__int16 v45 = 4;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Could not migrate database from schema version %d", buf, 8u);
      }

      int v10 = 4;
      goto LABEL_85;
    case 5:
LABEL_21:
      BOOL v16 = vm_vmd_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)__int16 v45 = 5;
        *(_WORD *)&v45[4] = 1024;
        *(_DWORD *)&v45[6] = 6;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Migrated database from schema version %d to schema version %d (nothing to do)", buf, 0xEu);
      }

      goto LABEL_24;
    case 6:
LABEL_24:
      uint64_t v17 = vm_vmd_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)__int16 v45 = 6;
        *(_WORD *)&v45[4] = 1024;
        *(_DWORD *)&v45[6] = 7;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Migrated database from schema version %d to schema version %d (nothing to do)", buf, 0xEu);
      }

      goto LABEL_27;
    case 7:
LABEL_27:
      uint64_t v18 = vm_vmd_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)__int16 v45 = 7;
        *(_WORD *)&v45[4] = 1024;
        *(_DWORD *)&v45[6] = 8;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Migrating database from schema version %d to schema version %d", buf, 0xEu);
      }

      int v19 = vm_vmd_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)__int16 v45 = @"label";
        *(_WORD *)&v45[8] = 2112;
        CFStringRef v46 = @"voicemail";
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Adding column of type: TEXT with name: %@ to table: %@", buf, 0x16u);
      }

      int v20 = sub_1000753EC(a2, @"label", @"voicemail");
      sub_1000752D0((uint64_t *)&off_1000C2D68);
      sub_1000752D0((uint64_t *)&off_1000C2C28);
      __int16 v21 = vm_vmd_log();
      BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
      if (v20)
      {
        int v10 = 8;
        if (!v22) {
          goto LABEL_37;
        }
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)__int16 v45 = 8;
        __int16 v23 = "Migrated database to schema version %d";
      }
      else
      {
        int v10 = 7;
        if (!v22) {
          goto LABEL_37;
        }
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)__int16 v45 = 7;
        __int16 v23 = "Could not migrate database from schema version %d";
      }
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, v23, buf, 8u);
LABEL_37:

LABEL_38:
      if (v10 == 10) {
        goto LABEL_66;
      }
      if (v10 == 9) {
        goto LABEL_50;
      }
      if (v10 != 8) {
        goto LABEL_78;
      }
      CFArrayRef v24 = vm_vmd_log();
      BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
      if (a3 != 8)
      {
        if (!v25) {
          goto LABEL_49;
        }
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)__int16 v45 = 8;
        *(_WORD *)&v45[4] = 1024;
        *(_DWORD *)&v45[6] = 9;
        id v26 = "Migrated database from schema version %d to schema version %d (nothing to do)";
        __int16 v27 = v24;
        uint32_t v28 = 14;
        goto LABEL_48;
      }
      if (v25)
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)__int16 v45 = 8;
        *(_WORD *)&v45[4] = 1024;
        *(_DWORD *)&v45[6] = 9;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Migrating database from schema version %d to schema version %d", buf, 0xEu);
      }

      +[NSString stringWithFormat:@"DROP TABLE %@;", @"map"];
      sub_100075394();
      sub_1000752D0((uint64_t *)&off_1000C2C28);
      CFArrayRef v24 = vm_vmd_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)__int16 v45 = 9;
        id v26 = "Migrated database to schema version %d";
        __int16 v27 = v24;
        uint32_t v28 = 8;
LABEL_48:
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, v26, buf, v28);
      }
LABEL_49:

LABEL_50:
      int v29 = vm_vmd_log();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)__int16 v45 = 9;
        *(_WORD *)&v45[4] = 1024;
        *(_DWORD *)&v45[6] = 10;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Migrating database from schema version %d to schema version %d", buf, 0xEu);
      }

      if (CSDBSqliteConnectionStatementForSQL())
      {
        int v30 = CSDBSqliteStatementIntegerResult();
        __int16 v31 = vm_vmd_log();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)__int16 v45 = v30;
          *(_WORD *)&v45[4] = 1024;
          *(_DWORD *)&v45[6] = 101;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "'ROWID' count in 'map' is %d (statement result: %d", buf, 0xEu);
        }

        CSDBSqliteStatementReset();
        if (v30)
        {
          int v32 = vm_vmd_log();
          if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_63;
          }
          *(_WORD *)buf = 0;
          __int16 v33 = "'ROWID' EXIST in 'map' - everything is correct";
          goto LABEL_62;
        }
      }
      int v34 = vm_vmd_log();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "'ROWID' column is missing in 'map', table need to be recreated", buf, 2u);
      }

      +[NSString stringWithFormat:@"DROP TABLE %@;", @"map"];
      sub_100075394();
      sub_1000752D0((uint64_t *)&off_1000C2C28);
      int v32 = vm_vmd_log();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        __int16 v33 = "table 'map' recreated";
LABEL_62:
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, v33, buf, 2u);
      }
LABEL_63:

      __int16 v35 = vm_vmd_log();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)__int16 v45 = 10;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Migrated database to schema version %d", buf, 8u);
      }

LABEL_66:
      __int16 v36 = vm_vmd_log();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)__int16 v45 = 10;
        *(_WORD *)&v45[4] = 1024;
        *(_DWORD *)&v45[6] = 11;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Migrating database from schema version %d to schema version %d", buf, 0xEu);
      }

      __int16 v37 = vm_vmd_log();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        *(void *)__int16 v45 = @"uuid";
        *(_WORD *)&v45[8] = 2112;
        CFStringRef v46 = @"voicemail";
        __int16 v47 = 2112;
        CFStringRef v48 = @"deleted";
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Adding column of type: TEXT with name: %@ to table: %@ and table: %@", buf, 0x20u);
      }

      int v38 = sub_1000753EC(a2, @"uuid", @"voicemail");
      int v39 = sub_1000753EC(a2, @"uuid", @"deleted");
      if (v38 && v39)
      {
        CSDBSqliteConnectionSetValueForProperty();
        id v40 = vm_vmd_log();
        int v10 = 11;
        if (!os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_77;
        }
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)__int16 v45 = 11;
        __int16 v41 = "Migrated database to schema version %d";
      }
      else
      {
        id v40 = vm_vmd_log();
        int v10 = 10;
        if (!os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_77;
        }
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)__int16 v45 = 10;
        __int16 v41 = "Could not migrate database from schema version %d";
      }
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, v41, buf, 8u);
LABEL_77:

LABEL_78:
      if (v10 == 11)
      {
        int v42 = vm_vmd_log();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)__int16 v45 = a3;
          *(_WORD *)&v45[4] = 1024;
          *(_DWORD *)&v45[6] = 11;
          _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Successfully migrated database from schema version %d to schema version %d; setting result to CSDBSqliteMigrationDone ",
            buf,
            0xEu);
        }
        uint64_t v9 = 0;
      }
      else
      {
LABEL_85:
        int v42 = vm_vmd_log();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)__int16 v45 = a3;
          *(_WORD *)&v45[4] = 1024;
          *(_DWORD *)&v45[6] = v10;
          _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Failed to migrate database from schema version %d to schema version %d; setting result to CSDBSqliteMigrationDelete ",
            buf,
            0xEu);
        }
        uint64_t v9 = 3;
      }

      CSDBSqliteConnectionCommit();
      return v9;
    default:
      goto LABEL_38;
  }
}

uint64_t sub_1000752D0(uint64_t *a1)
{
  uint64_t v2 = vm_vmd_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *a1;
    int v5 = 136315138;
    uint64_t v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Create %s table", (uint8_t *)&v5, 0xCu);
  }

  return CSDBRecordStoreCreateTablesForClass();
}

uint64_t sub_100075394()
{
  uint64_t result = CSDBSqliteConnectionStatementForSQL();
  if (result)
  {
    CSDBSqliteStatementPerform();
    return CSDBSqliteStatementReset();
  }
  return result;
}

uint64_t sub_1000753EC(NSObject *a1, void *a2, void *a3)
{
  int v5 = a2;
  id v6 = a3;
  if (a1 && -[NSObject length](v5, "length") && [@"TEXT" length] && objc_msgSend(v6, "length"))
  {
    CFStringRef v7 = [objc_alloc((Class)NSString) initWithFormat:@"SELECT %@ FROM %@", v5, v6];
    int v8 = CSDBSqliteConnectionPerformSQL();
    if ((v8 - 100) < 2 || v8 == 0)
    {
      BOOL v15 = vm_vmd_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v26 = v5;
        __int16 v27 = 2112;
        *(void *)uint32_t v28 = v6;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "The %@ column already exists on %@, skipping this step.", buf, 0x16u);
      }
      uint64_t v10 = 1;
      goto LABEL_35;
    }
    id v12 = [objc_alloc((Class)NSString) initWithFormat:@"Voicemail database migration failed to add column %@ to the %@ table.", v5, v6];
    id v13 = [objc_alloc((Class)NSString) initWithFormat:@"Added %@ column to the %@ table.", v5, v6];
    id v14 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"ALTER TABLE %@ ADD COLUMN %@ %@;",
            v6,
            v5,
            @"TEXT");
    BOOL v15 = v12;
    BOOL v16 = v13;
    id v17 = v14;
    if (![v17 length])
    {
      __int16 v21 = vm_vmd_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "No migration block to execute!", buf, 2u);
      }
      uint64_t v10 = 1;
      goto LABEL_34;
    }
    int v18 = CSDBSqliteConnectionPerformSQL();
    if (v18) {
      BOOL v19 = v18 == 101;
    }
    else {
      BOOL v19 = 1;
    }
    uint64_t v10 = v19;
    if (v18 && (int v20 = v18, v18 != 101))
    {
      __int16 v21 = vm_vmd_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        id v26 = v15;
        __int16 v27 = 1024;
        *(_DWORD *)uint32_t v28 = v20;
        *(_WORD *)&v28[4] = 2080;
        *(void *)&v28[6] = CSDBSqliteErrMsg();
        BOOL v22 = "%@ SQLiteResult: %d SQLite Message: %s";
        __int16 v23 = v21;
        uint32_t v24 = 28;
        goto LABEL_33;
      }
    }
    else
    {
      __int16 v21 = vm_vmd_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v26 = v16;
        BOOL v22 = "VMMessageStore migration complete: %@";
        __int16 v23 = v21;
        uint32_t v24 = 12;
LABEL_33:
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, v22, buf, v24);
      }
    }
LABEL_34:

LABEL_35:
    goto LABEL_16;
  }
  CFStringRef v7 = vm_vmd_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    id v26 = a1;
    __int16 v27 = 2112;
    *(void *)uint32_t v28 = v5;
    *(_WORD *)&v28[8] = 2112;
    *(void *)&v28[10] = @"TEXT";
    __int16 v29 = 2112;
    id v30 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Cannot perform migration because of %@, %@, %@, %@", buf, 0x2Au);
  }
  uint64_t v10 = 1;
LABEL_16:

  return v10;
}

void sub_100075788(uint64_t a1, CFIndex *a2)
{
  CFStringRef v4 = vm_vmd_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    CFIndex v5 = *a2;
    *(_DWORD *)buf = 136315138;
    CFIndex v26 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Perform UUID migration for table %s", buf, 0xCu);
  }

  CFArrayRef v6 = (const __CFArray *)sub_100071BE4(a1, a2);
  if (v6)
  {
    CFArrayRef v7 = v6;
    CFIndex Count = CFArrayGetCount(v6);
    uint64_t v9 = vm_vmd_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      CFIndex v26 = Count;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Found %ld records for UUID migration", buf, 0xCu);
    }

    if (Count >= 1)
    {
      char v10 = 0;
      CFIndex v11 = 0;
      while (1)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v7, v11);
        if (ValueAtIndex)
        {
          uint64_t Property = (const void *)CSDBRecordGetProperty();
          id v14 = sub_10006EADC(Property);
          BOOL v15 = (const void *)CSDBRecordGetProperty();
        }
        else
        {
          id v14 = sub_10006EADC(0);
          BOOL v15 = 0;
        }
        BOOL v16 = sub_10006EADC(v15);
        if ([v16 length])
        {
          id v17 = vm_vmd_log();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218498;
            CFIndex v26 = v11;
            __int16 v27 = 2112;
            uint32_t v28 = v16;
            __int16 v29 = 2112;
            id v30 = v14;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "[%ld] Found UUID %@ for token %@", buf, 0x20u);
          }
          goto LABEL_26;
        }
        if (v14 && [v14 length])
        {
          id v17 = +[NSUUID hashedUUID:v14];
          [v17 UUIDString];
          if (ValueAtIndex) {
            CSDBRecordSetProperty();
          }
          int v18 = vm_vmd_log();
          if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_25;
          }
          BOOL v19 = [v17 UUIDString];
          *(_DWORD *)buf = 134218498;
          CFIndex v26 = v11;
          __int16 v27 = 2112;
          uint32_t v28 = v19;
          __int16 v29 = 2112;
          id v30 = v14;
          int v20 = v18;
          __int16 v21 = "[%ld] Added UUID %@ for token %@";
          uint32_t v22 = 32;
        }
        else
        {
          id v17 = +[NSUUID UUID];
          [v17 UUIDString];
          if (ValueAtIndex) {
            CSDBRecordSetProperty();
          }
          int v18 = vm_vmd_log();
          if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_25;
          }
          BOOL v19 = [v17 UUIDString];
          *(_DWORD *)buf = 134218242;
          CFIndex v26 = v11;
          __int16 v27 = 2112;
          uint32_t v28 = v19;
          int v20 = v18;
          __int16 v21 = "[%ld] Added UUID %@ for empty token";
          uint32_t v22 = 22;
        }
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, v21, buf, v22);

LABEL_25:
        char v10 = 1;
LABEL_26:

        if (Count == ++v11)
        {
          if (v10)
          {
            __int16 v23 = vm_vmd_log();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Saving store after UUID migration", buf, 2u);
            }

            CSDBRecordSaveStore();
          }
          break;
        }
      }
    }
    CFRelease(v7);
  }
  else
  {
    uint32_t v24 = vm_vmd_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Did not find any records for UUID migration", buf, 2u);
    }
  }
}

uint64_t sub_1000769EC()
{
  CSDBRecordStoreCreateTablesForClass();
  uint64_t result = CSDBSqliteConnectionStatementForSQL();
  if (result)
  {
    CSDBSqliteStatementPerform();
    return CSDBSqliteStatementReset();
  }
  return result;
}

void sub_100076C68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100076C80(uint64_t a1)
{
  id result = objc_msgSend(*(id *)(a1 + 32), "getRecordProperty_sync:property:", *(void *)(a1 + 48), *(unsigned int *)(a1 + 56));
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

unsigned int *sub_100076D80(unsigned int *result)
{
  uint64_t v1 = *((void *)result + 5);
  if (v1) {
    return (unsigned int *)objc_msgSend(*((id *)result + 4), "setRecordProperty_sync:property:value:", v1, result[14], *((void *)result + 6));
  }
  return result;
}

void sub_100076E60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100076E78(uint64_t a1)
{
  uint64_t result = CSDBRecordGetID();
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

id sub_100076F48(uint64_t a1)
{
  uint64_t v2 = *(_DWORD *)(a1 + 48) | nullsub_7(objc_msgSend(*(id *)(a1 + 32), "getRecordProperty_sync:property:", *(void *)(a1 + 40), 8));
  CFStringRef v4 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v5 = sub_10006EA8C(v2);
  return objc_msgSend(v4, "setRecordProperty_sync:property:value:", v3, 8, v5);
}

id sub_100077048(uint64_t a1)
{
  uint64_t v2 = nullsub_7(objc_msgSend(*(id *)(a1 + 32), "getRecordProperty_sync:property:", *(void *)(a1 + 40), 8)) & ~*(_DWORD *)(a1 + 48);
  CFStringRef v4 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v5 = sub_10006EA8C(v2);
  return objc_msgSend(v4, "setRecordProperty_sync:property:value:", v3, 8, v5);
}

void sub_10007722C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100077244(uint64_t a1)
{
  [*(id *)(a1 + 32) getRecordDescriptor];
  *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = CSDBRecordCreate();
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "setRecordProperty_sync:property:value:", v2, 0, sub_10006EA8C(*(unsigned int *)(a1 + 80)));
    objc_msgSend(*(id *)(a1 + 32), "setRecordProperty_sync:property:value:", *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24), 1, sub_10006FAFC(*(unsigned int *)(a1 + 84)));
    objc_msgSend(*(id *)(a1 + 32), "setRecordProperty_sync:property:value:", *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24), 2, nullsub_7(*(void *)(a1 + 40)));
    objc_msgSend(*(id *)(a1 + 32), "setRecordProperty_sync:property:value:", *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24), 3, nullsub_7(*(void *)(a1 + 48)));
    objc_msgSend(*(id *)(a1 + 32), "setRecordProperty_sync:property:value:", *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24), 4, nullsub_7(*(void *)(a1 + 56)));
    objc_msgSend(*(id *)(a1 + 32), "setRecordProperty_sync:property:value:", *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24), 5, sub_10006FAFC(*(unsigned int *)(a1 + 88)));
    objc_msgSend(*(id *)(a1 + 32), "setRecordProperty_sync:property:value:", *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24), 6, sub_10006FAFC(*(unsigned int *)(a1 + 92)));
    objc_msgSend(*(id *)(a1 + 32), "setRecordProperty_sync:property:value:", *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24), 8, sub_10006FAFC(*(unsigned int *)(a1 + 96)));
    objc_msgSend(*(id *)(a1 + 32), "setRecordProperty_sync:property:value:", *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24), 9, nullsub_7(*(void *)(a1 + 64)));
    [*(id *)(a1 + 32) getStore];
    CSDBRecordStoreAddRecord();
    [*(id *)(a1 + 32) getStore];
    CSDBRecordSaveStore();
    CFStringRef v3 = VMStoreRecordCopyDescription(*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24));
    CFStringRef v4 = vm_vmd_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138412546;
      CFStringRef v7 = v3;
      __int16 v8 = 2112;
      uint64_t v9 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Add record %@ for account %@", (uint8_t *)&v6, 0x16u);
    }

    if (v3) {
      CFRelease(v3);
    }
  }
}

uint64_t sub_100077578(uint64_t a1)
{
  CFStringRef v2 = VMStoreRecordCopyDescription(*(void *)(a1 + 40));
  CFStringRef v3 = vm_vmd_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    CFStringRef v11 = v2;
    __int16 v12 = 2112;
    uint64_t v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Remove record %@ for account %@", buf, 0x16u);
  }

  if (v2) {
    CFRelease(v2);
  }
  if ((nullsub_7(objc_msgSend(*(id *)(a1 + 32), "getRecordProperty_sync:property:", *(void *)(a1 + 40), 8)) & 2) != 0)
  {
    uint64_t v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%d%s", objc_msgSend(*(id *)(a1 + 32), "getRecordIdentifier_sync:", *(void *)(a1 + 40)), VMStoreGetDataFileExtension());
    int v6 = [*(id *)(a1 + 32) accountDir];
    CFStringRef v7 = [v6 URLByAppendingPathComponent:v5 isDirectory:0];

    id v8 = [v7 path];
    unlink((const char *)[v8 UTF8String]);
  }
  [*(id *)(a1 + 32) getStore];
  return CSDBRecordStoreRemoveRecord();
}

BOOL sub_100077890(id a1, NSString *a2, NSDictionary *a3)
{
  CFStringRef v3 = [(NSString *)a2 pathExtension];
  unsigned __int8 v4 = [v3 isEqualToString:@"amr"];

  return v4;
}

void sub_10007795C(uint64_t a1)
{
  CFStringRef v2 = vm_vmd_log();
  CFStringRef v3 = "rGreetingDataSource\"";
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v4 = *(__CFString **)(a1 + 32);
    uint64_t v5 = [(__CFString *)v4 dbfile];
    id v6 = [v5 path];
    *(_DWORD *)buf = 138412546;
    CFStringRef v46 = v4;
    __int16 v47 = 2080;
    id v48 = [v6 UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Remove all records for account %@, path %s", buf, 0x16u);
  }
  CFArrayRef v7 = (const __CFArray *)sub_100071BE4((uint64_t)[*(id *)(a1 + 32) getStore], objc_msgSend(*(id *)(a1 + 32), "getRecordDescriptor"));
  if (v7)
  {
    CFArrayRef v8 = v7;
    CFIndex Count = CFArrayGetCount(v7);
    if (Count >= 1)
    {
      CFIndex v10 = Count;
      for (CFIndex i = 0; i != v10; ++i)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v8, i);
        CFStringRef v13 = VMStoreRecordCopyDescription((uint64_t)ValueAtIndex);
        id v14 = vm_vmd_log();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          BOOL v15 = *(void **)(a1 + 32);
          *(_DWORD *)buf = 138412546;
          CFStringRef v46 = v13;
          __int16 v47 = 2112;
          id v48 = v15;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Remove record %@ for account %@", buf, 0x16u);
        }

        if (v13) {
          CFRelease(v13);
        }
        [*(id *)(a1 + 32) getStore];
        CSDBRecordStoreRemoveRecord();
      }
    }
    CSDBRecordSaveStore();
    CFRelease(v8);
    CFStringRef v3 = "@\"VMDCarrierGreetingDataSource\"" + 11;
  }
  else
  {
    BOOL v16 = vm_vmd_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v17 = *(const __CFString **)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      CFStringRef v46 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Did not find any records for account %@", buf, 0xCu);
    }
  }
  uint64_t v18 = a1;
  [*(id *)(a1 + 32) getDataFiles];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  BOOL v19 = v43 = 0u;
  id v20 = [v19 countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v20)
  {
    id v22 = v20;
    uint64_t v23 = *(void *)v41;
    *(void *)&long long v21 = *((void *)v3 + 465);
    long long v38 = v21;
    do
    {
      for (j = 0; j != v22; j = (char *)j + 1)
      {
        if (*(void *)v41 != v23) {
          objc_enumerationMutation(v19);
        }
        uint64_t v25 = *(void *)(*((void *)&v40 + 1) + 8 * (void)j);
        CFIndex v26 = objc_msgSend(*(id *)(v18 + 32), "accountDir", v38);
        __int16 v27 = [v26 URLByAppendingPathComponent:v25 isDirectory:0];

        uint32_t v28 = +[NSFileManager defaultManager];
        __int16 v29 = [v27 path];
        id v39 = 0;
        unsigned int v30 = [v28 removeItemAtPath:v29 error:&v39];
        id v31 = v39;

        int v32 = vm_vmd_log();
        BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
        if (v30)
        {
          if (!v33) {
            goto LABEL_26;
          }
          int v34 = [v27 path];
          *(_DWORD *)buf = 138412290;
          CFStringRef v46 = v34;
          __int16 v35 = v32;
          __int16 v36 = "Remove audio data %@";
          uint32_t v37 = 12;
        }
        else
        {
          if (!v33) {
            goto LABEL_26;
          }
          int v34 = [v27 path];
          *(_DWORD *)buf = v38;
          CFStringRef v46 = v34;
          __int16 v47 = 2112;
          id v48 = v31;
          __int16 v35 = v32;
          __int16 v36 = "Unable to remove audio data %@ with error %@";
          uint32_t v37 = 22;
        }
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, v36, buf, v37);

LABEL_26:
      }
      id v22 = [v19 countByEnumeratingWithState:&v40 objects:v44 count:16];
    }
    while (v22);
  }
}

void sub_100077E6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100077E84(uint64_t a1)
{
  [*(id *)(a1 + 32) getStore];
  [*(id *)(a1 + 32) getRecordDescriptor];
  uint64_t result = CSDBRecordStoreCopyInstanceOfClassWithUID();
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void sub_100077FB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

const void *sub_100077FC8(uint64_t a1)
{
  uint64_t result = sub_100072414((uint64_t)[*(id *)(a1 + 32) getStore], (uint64_t)objc_msgSend(*(id *)(a1 + 32), "getRecordDescriptor"), *(_DWORD *)(a1 + 48), *(_DWORD *)(a1 + 52), *(_DWORD *)(a1 + 56), 0);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void sub_1000783DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000783F4(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = sub_10007342C((uint64_t)[*(id *)(a1 + 32) getStore], (uint64_t)objc_msgSend(*(id *)(a1 + 32), "getRecordDescriptor"), *(_DWORD *)(a1 + 48), *(_DWORD *)(a1 + 52), *(_DWORD *)(a1 + 56), *(_DWORD *)(a1 + 60), 0);
  unsigned int v2 = [*(id *)(a1 + 32) copyOfAllRecordsWithFlagsInRemoteUIDRangeByStatement:*(unsigned int *)(a1 + 48) flagsToNotHave:*(unsigned int *)(a1 + 52) lowUid:*(unsigned int *)(a1 + 56) highUid:*(unsigned int *)(a1 + 60)];
  CFStringRef v3 = vm_vmd_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = *(_DWORD *)(a1 + 56);
    int v5 = *(_DWORD *)(a1 + 60);
    id v6 = [*(id *)(a1 + 32) label];
    int Count = CFArrayGetCount(*(CFArrayRef *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
    CFArrayRef v8 = [*(id *)(a1 + 32) dbfile];
    id v9 = [v8 path];
    v10[0] = 67110402;
    v10[1] = v4;
    __int16 v11 = 1024;
    int v12 = v5;
    __int16 v13 = 2112;
    id v14 = v6;
    __int16 v15 = 1024;
    int v16 = Count;
    __int16 v17 = 1024;
    unsigned int v18 = v2;
    __int16 v19 = 2080;
    id v20 = [v9 UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "==> copyOfAllRecordsWithFlagsInRemoteUIDRange <%u, %u>: label=%@ count=%d (by statement %d) dbfile %s", (uint8_t *)v10, 0x2Eu);
  }
}

void sub_10007865C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100078674(uint64_t a1)
{
  uint64_t result = sub_100071C9C((uint64_t)[*(id *)(a1 + 32) getStore], objc_msgSend(*(id *)(a1 + 32), "getRecordDescriptor"), *(_DWORD *)(a1 + 48), *(_DWORD *)(a1 + 52), 0);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void sub_1000787A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000787B8(uint64_t a1)
{
  uint64_t result = sub_100071EC8((uint64_t)[*(id *)(a1 + 32) getStore], *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49), 0);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void sub_1000788D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

CFTypeRef sub_1000788E8(uint64_t a1)
{
  CFTypeRef result = sub_1000727AC((uint64_t)[*(id *)(a1 + 32) getStore], objc_msgSend(*(id *)(a1 + 32), "getRecordDescriptor"), *(void **)(a1 + 48), *(void *)(a1 + 56));
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void sub_100078A0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100078A24(uint64_t a1)
{
  uint64_t result = sub_10007273C((uint64_t)[*(id *)(a1 + 32) getStore], objc_msgSend(*(id *)(a1 + 32), "getRecordDescriptor"), *(void **)(a1 + 48), *(void *)(a1 + 56));
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void sub_100078B3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

CFTypeRef sub_100078B54(uint64_t a1)
{
  CFTypeRef result = sub_100072B30((uint64_t)[*(id *)(a1 + 32) getStore], objc_msgSend(*(id *)(a1 + 32), "getRecordDescriptor"), *(void **)(a1 + 48), 0);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void sub_100078C70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100078C88(uint64_t a1)
{
  uint64_t result = sub_100072AB8((uint64_t)[*(id *)(a1 + 32) getStore], objc_msgSend(*(id *)(a1 + 32), "getRecordDescriptor"), *(void **)(a1 + 48), 0);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void sub_100078DA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100078DBC(uint64_t a1)
{
  id result = sub_10006FF30((uint64_t)[*(id *)(a1 + 32) getStore], *(const __CFString **)(a1 + 48));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void sub_100078E94(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) getStore];
  CFStringRef v3 = *(const __CFString **)(a1 + 40);
  uint64_t v4 = *(unsigned int *)(a1 + 48);
  sub_10007004C((uint64_t)v2, v3, v4);
}

uint64_t sub_100078F5C()
{
  return CSDBRecordSaveStore();
}

id sub_100079014(void *a1, const char *a2)
{
  return [a1 getRecordIdentifier:a2];
}

uint64_t sub_10007901C(void *a1, uint64_t a2)
{
  id v2 = [a1 getRecordProperty:a2 property:0];
  return nullsub_7(v2);
}

void sub_10007904C(void *a1, uint64_t a2, uint64_t a3)
{
  id v5 = a1;
  [v5 setRecordProperty:a2 property:0 value:sub_10006EA8C(a3)];
}

uint64_t sub_1000790B0(void *a1, uint64_t a2)
{
  id v2 = [a1 getRecordProperty:a2 property:1];
  return nullsub_7(v2);
}

uint64_t sub_1000790E0(void *a1, uint64_t a2)
{
  id v2 = [a1 getRecordProperty:a2 property:5];
  return nullsub_7(v2);
}

uint64_t sub_100079110(void *a1, uint64_t a2)
{
  id v2 = [a1 getRecordProperty:a2 property:6];
  return nullsub_7(v2);
}

uint64_t sub_100079140(void *a1, uint64_t a2)
{
  id v2 = [a1 getRecordProperty:a2 property:7];
  return nullsub_7(v2);
}

void sub_100079170(void *a1, uint64_t a2, uint64_t a3)
{
  id v5 = a1;
  [v5 setRecordProperty:a2 property:7 value:sub_10006FAFC(a3)];
}

void sub_1000791D4(void *a1, uint64_t a2, uint64_t a3)
{
  id v5 = a1;
  [v5 setRecordProperty:a2 property:5 value:sub_10006FAFC(a3)];
}

void sub_100079238(void *a1, uint64_t a2, uint64_t a3)
{
  id v5 = a1;
  [v5 setRecordProperty:a2 property:9 value:nullsub_7(a3)];
}

const void *sub_10007929C(void *a1, uint64_t a2)
{
  id v2 = sub_10006EADC([a1 getRecordProperty:a2 property:3]);
  CFStringRef v3 = v2;
  if (v2) {
    CFRetain(v2);
  }
  return v3;
}

const void *sub_1000792DC(void *a1, uint64_t a2)
{
  id v2 = sub_10006EADC([a1 getRecordProperty:a2 property:4]);
  CFStringRef v3 = v2;
  if (v2) {
    CFRetain(v2);
  }
  return v3;
}

const void *sub_10007931C(void *a1, uint64_t a2)
{
  id v2 = sub_10006EADC([a1 getRecordProperty:a2 property:2]);
  CFStringRef v3 = v2;
  if (v2) {
    CFRetain(v2);
  }
  return v3;
}

const void *sub_10007935C(void *a1, uint64_t a2)
{
  id v2 = sub_10006EADC([a1 getRecordProperty:a2 property:9]);
  CFStringRef v3 = v2;
  if (v2) {
    CFRetain(v2);
  }
  return v3;
}

uint64_t sub_10007939C(void *a1, uint64_t a2)
{
  id v2 = [a1 getRecordProperty:a2 property:8];
  return nullsub_7(v2);
}

id sub_1000793CC(void *a1, uint64_t a2, uint64_t a3)
{
  return [a1 setLocalFlag:a2 flag:a3];
}

id sub_1000793D8(void *a1, uint64_t a2, uint64_t a3)
{
  return [a1 resetLocalFlag:a2 flag:a3];
}

void sub_1000793E4(void *a1, const void *a2, uint64_t a3)
{
  id v5 = a1;
  CFStringRef v6 = VMStoreRecordCopyDescription((uint64_t)a2);
  CFArrayRef v7 = VMStoreRecordCopyFlagsDescription(a3);
  CFArrayRef v8 = vm_vmd_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412546;
    CFStringRef v18 = v6;
    __int16 v19 = 2112;
    id v20 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "VMAccountStoreRecordSetFlags <record=%@, flags=%@>", (uint8_t *)&v17, 0x16u);
  }

  if (v7) {
    CFRelease(v7);
  }
  if (v6) {
    CFRelease(v6);
  }
  uint64_t v9 = nullsub_7([v5 getRecordProperty:a2 property:8]);
  if (v9 != a3)
  {
    uint64_t v10 = v9;
    [v5 setRecordProperty:a2 property:8 value:sub_10006EA8C(a3)];
    Mutable = CFDictionaryCreateMutable(0, 3, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    int v12 = [v5 getStoreLabelID];
    CFDictionarySetValue(Mutable, @"VMStoreRecordChangedFlagsLabel", [v12 UUIDString]);

    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterPostNotification(LocalCenter, @"VMStoreRecordFlagsWIllChange", a2, Mutable, 1u);
    uint64_t v14 = v10 ^ a3;
    CFDictionarySetValue(Mutable, @"VMStoreRecordOldFlags", +[NSNumber numberWithUnsignedInt:v10]);
    CFDictionarySetValue(Mutable, @"VMStoreRecordNewFlags", +[NSNumber numberWithUnsignedInt:a3]);
    CFDictionarySetValue(Mutable, @"VMStoreRecordChangedFlags", +[NSNumber numberWithUnsignedInt:v14]);
    __int16 v15 = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterPostNotification(v15, @"VMStoreRecordFlagsDidChange", a2, Mutable, 1u);
    if (v14 != 2)
    {
      int v16 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v16, @"VMStoreRecordFlagsChanged", a2, Mutable, 1u);
    }
    CFRelease(Mutable);
  }
}

CFTypeRef sub_10007966C(void *a1, uint64_t a2)
{
  id v3 = a1;
  uint64_t v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%u%s", [v3 getRecordIdentifier:a2], VMStoreGetDataFileExtension());
  id v5 = [v3 accountDir];

  CFStringRef v6 = [v5 URLByAppendingPathComponent:v4 isDirectory:0];

  CFTypeRef v7 = CFRetain([v6 path]);
  return v7;
}

CFTypeRef sub_100079724(void *a1, uint64_t a2)
{
  id v3 = a1;
  uint64_t v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%u%s", [v3 getRecordIdentifier:a2], VMStoreGetTranscriptionFileExtension());
  id v5 = [v3 accountDir];

  CFStringRef v6 = [v5 URLByAppendingPathComponent:v4 isDirectory:0];

  CFTypeRef v7 = CFRetain([v6 path]);
  return v7;
}

CFTypeRef sub_1000797DC(void *a1, uint64_t a2)
{
  id v3 = a1;
  uint64_t v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%u%s", [v3 getRecordIdentifier:a2], VMStoreGetSummarizationFileExtension());
  id v5 = [v3 accountDir];

  CFStringRef v6 = [v5 URLByAppendingPathComponent:v4 isDirectory:0];

  CFTypeRef v7 = CFRetain([v6 path]);
  return v7;
}

id sub_100079894(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return objc_msgSend(a1, "createAndAddRecord:date:token:sender:callbackNumber:duration:expirationDate:flags:receiver:", a2, a3, a4, a5, a6, a7);
}

id sub_1000798C4(void *a1, uint64_t a2)
{
  return [a1 removeRecord:a2];
}

uint64_t sub_1000798D0(void *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = a1;
  unsigned int v18 = nullsub_7([v6 getRecordProperty:a2 property:0]);
  uint64_t v7 = nullsub_7([v6 getRecordProperty:a2 property:1]);
  CFStringRef v8 = (const __CFString *)sub_10007931C(v6, a2);
  uint64_t v9 = sub_10007929C(v6, a2);
  uint64_t v10 = sub_10007935C(v6, a2);
  __int16 v11 = sub_1000792DC(v6, a2);
  uint64_t v12 = nullsub_7([v6 getRecordProperty:a2 property:5]);
  uint64_t v13 = nullsub_7([v6 getRecordProperty:a2 property:6]);
  id v14 = [v6 getRecordProperty:a2 property:8];

  uint64_t v15 = nullsub_7(v14);
  uint64_t v16 = VMStoreCreateAndAddRecord(v18, v7, v8, (uint64_t)v9, (uint64_t)v11, v12, v13, v15, (uint64_t)v10, v5);

  if (v8) {
    CFRelease(v8);
  }
  if (v9) {
    CFRelease(v9);
  }
  if (v10) {
    CFRelease(v10);
  }
  if (v11) {
    CFRelease(v11);
  }
  return v16;
}

id sub_100079A4C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [a1 copyOfAllRecordsWithFlagsInRemoteUIDRange:a2 flagsToNotHave:a3 lowUid:a4 highUid:a5];
}

id sub_100079A60(void *a1, uint64_t a2, uint64_t a3)
{
  return [a1 copyOfAllRecordsWithFlags:a2 flagsToNotHave:a3];
}

id sub_100079A6C(void *a1, uint64_t a2)
{
  return [a1 copyRecordWithIdentifier:a2];
}

id sub_100079A74(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [a1 copyRecordWithRemoteUID:a2 flagsToHave:a3 flagsToNotHave:a4];
}

id sub_100079A84(void *a1, uint64_t a2, uint64_t a3)
{
  return [a1 copyOfAllRemoteUIDsWithTrashState:a2 includeTemp:a3];
}

id sub_100079A90(void *a1, uint64_t a2, uint64_t a3)
{
  return [a1 copyFirstRecordWithTokenInMailbox:a2 mailboxType:a3];
}

id sub_100079A9C(void *a1, uint64_t a2, uint64_t a3)
{
  return [a1 copyRecordsWithTokenInMailbox:a2 mailboxType:a3];
}

id sub_100079AA8(void *a1, uint64_t a2)
{
  return [a1 copyFirstRecordWithToken:a2];
}

id sub_100079AB0(void *a1, uint64_t a2)
{
  return [a1 copyRecordsWithToken:a2];
}

id sub_100079AB8(void *a1, uint64_t a2)
{
  return [a1 getUIDValidity:a2];
}

id sub_100079AC0(void *a1, uint64_t a2, uint64_t a3)
{
  return [a1 setUIDValidity:a2 uidValidity:a3];
}

void sub_100079AD0(void *a1)
{
  uint64_t v1 = sub_10006D8F0(a1);
  id v2 = vm_vmd_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [v1 path];
    *(_DWORD *)buf = 138412290;
    __int16 v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "destroying account folder %@", buf, 0xCu);
  }
  uint64_t v4 = +[NSFileManager defaultManager];
  id v9 = 0;
  unsigned __int8 v5 = [v4 removeItemAtURL:v1 error:&v9];
  id v6 = v9;

  if ((v5 & 1) == 0)
  {
    uint64_t v7 = vm_vmd_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v8 = [v1 path];
      *(_DWORD *)buf = 138412546;
      __int16 v11 = v8;
      __int16 v12 = 2112;
      id v13 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "failed to remove account folder %@ - error: %@", buf, 0x16u);
    }
  }
}

id sub_100079E9C(uint64_t a1, void *a2)
{
  id v3 = [a2 phoneNumber];
  id v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

id sub_100079FF0(uint64_t a1, void *a2)
{
  id v3 = [a2 uuid];
  id v4 = [*(id *)(a1 + 32) uuid];
  id v5 = [v3 isEqual:v4];

  return v5;
}

void sub_10007A13C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10007A154(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10007A164(uint64_t a1)
{
}

void sub_10007A16C(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + 32), "cached_subscriptions");

  if (!v2)
  {
    id v3 = [*(id *)(a1 + 32) fetchSubscriptions];
    objc_msgSend(*(id *)(a1 + 32), "setCached_subscriptions:", v3);
  }
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "cached_subscriptions");
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void sub_10007A2D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10007A2F0(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + 32), "cached_contexts");

  if (!v2)
  {
    id v3 = [*(id *)(a1 + 32) fetchContexts];
    objc_msgSend(*(id *)(a1 + 32), "setCached_contexts:", v3);

    [*(id *)(a1 + 32) performSelectorOnDelegates:"activeSubscriptionsDidChange"];
  }
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "cached_contexts");
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void sub_10007A494(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10007A4AC(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + 32), "cached_iso");
  id v3 = [*(id *)(a1 + 40) uuid];
  uint64_t v4 = [v2 objectForKey:v3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    uint64_t v7 = [*(id *)(a1 + 32) fetchIsoCountryCode:*(void *)(a1 + 40)];
    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
    {
      objc_msgSend(*(id *)(a1 + 32), "cached_iso");
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v10 = *(void **)(a1 + 40);
      uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      __int16 v12 = [v10 uuid];
      [v13 setObject:v11 forKey:v12];
    }
  }
}

void sub_10007A6E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10007A6F8(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + 32), "cached_mcc");

  if (!v2)
  {
    id v3 = [*(id *)(a1 + 32) fetchCountryCode:*(void *)(a1 + 40)];
    objc_msgSend(*(id *)(a1 + 32), "setCached_mcc:", v3);
  }
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "cached_mcc");
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void sub_10007A890(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10007A8A8(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + 32), "cached_mnc");

  if (!v2)
  {
    id v3 = [*(id *)(a1 + 32) fetchNetworkCode:*(void *)(a1 + 40)];
    objc_msgSend(*(id *)(a1 + 32), "setCached_mnc:", v3);
  }
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "cached_mnc");
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void sub_10007AA14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10007AA2C(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "cached_iso");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_10007ABA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10007ABBC(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + 32), "cached_vmnumber");
  uint64_t v3 = [*(id *)(a1 + 40) uuid];
  uint64_t v4 = [v2 objectForKey:v3];

  if (!v4)
  {
    uint64_t v4 = [*(id *)(a1 + 32) fetchVoicemailPhoneNumber:*(void *)(a1 + 40)];
    id v5 = objc_msgSend(*(id *)(a1 + 32), "cached_vmnumber");
    id v6 = [*(id *)(a1 + 40) uuid];
    [v5 setObject:v4 forKey:v6];
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v4;
}

void sub_10007AD50(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegateToQueue];
  id v4 = v2;
  if (*(void *)(a1 + 40)) {
    uint64_t v3 = *(void **)(a1 + 40);
  }
  else {
    uint64_t v3 = &_dispatch_main_q;
  }
  [v2 setObject:v3 forKey:*(void *)(a1 + 48)];
}

void sub_10007AE48(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegateToQueue];
  [v2 removeObjectForKey:*(void *)(a1 + 40)];
}

void sub_10007B9B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10007B9D0(uint64_t a1)
{
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id obj = *(id *)(a1 + 32);
  id v38 = [obj countByEnumeratingWithState:&v48 objects:v58 count:16];
  if (v38)
  {
    uint64_t v37 = *(void *)v49;
    *(void *)&long long v1 = 138412546;
    long long v35 = v1;
    do
    {
      for (CFIndex i = 0; i != v38; CFIndex i = (char *)i + 1)
      {
        if (*(void *)v49 != v37) {
          objc_enumerationMutation(obj);
        }
        uint64_t v3 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        long long v44 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        id v4 = objc_msgSend(*(id *)(a1 + 40), "cached_subscriptions", v35);
        id v5 = [v4 countByEnumeratingWithState:&v44 objects:v57 count:16];
        if (v5)
        {
          id v6 = v5;
          uint64_t v7 = *(void *)v45;
          while (2)
          {
            for (j = 0; j != v6; j = (char *)j + 1)
            {
              if (*(void *)v45 != v7) {
                objc_enumerationMutation(v4);
              }
              id v9 = *(void **)(*((void *)&v44 + 1) + 8 * (void)j);
              uint64_t v10 = [v9 uuid];
              uint64_t v11 = [v3 uuid];
              unsigned int v12 = [v10 isEqual:v11];

              if (v12)
              {
                unsigned int v13 = [v9 isSimDataOnly];
                if (v13 != [v3 isSimDataOnly])
                {
                  id v14 = vm_vmd_log();
                  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = v35;
                    uint64_t v54 = v9;
                    __int16 v55 = 2112;
                    __int16 v56 = v3;
                    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Subscription data-only property has changed from %@ to %@.", buf, 0x16u);
                  }

                  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
                  goto LABEL_19;
                }
              }
            }
            id v6 = [v4 countByEnumeratingWithState:&v44 objects:v57 count:16];
            if (v6) {
              continue;
            }
            break;
          }
        }
LABEL_19:
      }
      id v38 = [obj countByEnumeratingWithState:&v48 objects:v58 count:16];
    }
    while (v38);
  }

  objc_msgSend(*(id *)(a1 + 40), "setCached_subscriptions:", *(void *)(a1 + 32));
  uint64_t v15 = objc_opt_new();
  uint64_t v16 = objc_msgSend(*(id *)(a1 + 40), "cached_iso");
  int v17 = [v16 keyEnumerator];

  uint64_t v18 = [v17 nextObject];
  if (v18)
  {
    __int16 v19 = (void *)v18;
    do
    {
      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id v20 = *(id *)(a1 + 32);
      id v21 = [v20 countByEnumeratingWithState:&v40 objects:v52 count:16];
      if (v21)
      {
        id v22 = v21;
        uint64_t v23 = *(void *)v41;
        while (2)
        {
          for (k = 0; k != v22; k = (char *)k + 1)
          {
            if (*(void *)v41 != v23) {
              objc_enumerationMutation(v20);
            }
            uint64_t v25 = *(void **)(*((void *)&v40 + 1) + 8 * (void)k);
            CFIndex v26 = [v25 uuid];
            unsigned int v27 = [v26 isEqual:v19];

            if (v27)
            {
              uint64_t v28 = [v25 labelID];
              if (v28)
              {
                __int16 v29 = (void *)v28;
                unsigned int v30 = [v25 labelID];
                id v31 = [v30 length];

                if (v31)
                {
                  int v32 = objc_msgSend(*(id *)(a1 + 40), "cached_iso");
                  BOOL v33 = [v32 objectForKey:v19];
                  [v15 setObject:v33 forKey:v19];
                }
              }
              goto LABEL_35;
            }
          }
          id v22 = [v20 countByEnumeratingWithState:&v40 objects:v52 count:16];
          if (v22) {
            continue;
          }
          break;
        }
      }
LABEL_35:

      uint64_t v34 = [v17 nextObject];

      __int16 v19 = (void *)v34;
    }
    while (v34);
  }
  objc_msgSend(*(id *)(a1 + 40), "setCached_iso:", v15);
}

void sub_10007BEF4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setCached_contexts:", *(void *)(a1 + 40));
  id v2 = (id)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "setCached_vmnumber:", v2);
}

void sub_10007C0A0(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "cached_iso");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = [*(id *)(a1 + 40) uuid];
  [v3 removeObjectForKey:v2];
}

void sub_10007C258(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "cached_iso");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = [*(id *)(a1 + 40) uuid];
  [v3 removeObjectForKey:v2];
}

void sub_10007C384(uint64_t a1)
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v2 = [*(id *)(a1 + 32) delegateToQueue];
  id v3 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v16;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v15 + 1) + 8 * (void)v6);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v8 = [*(id *)(a1 + 32) delegateToQueue];
          id v9 = [v8 objectForKey:v7];

          v10[0] = _NSConcreteStackBlock;
          v10[1] = 3221225472;
          _DWORD v10[2] = sub_10007C550;
          void v10[3] = &unk_1000C3558;
          void v10[4] = v7;
          id v11 = *(id *)(a1 + 40);
          char v14 = *(unsigned char *)(a1 + 72);
          long long v12 = *(_OWORD *)(a1 + 48);
          uint64_t v13 = *(void *)(a1 + 64);
          dispatch_async(v9, v10);
        }
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v4);
  }
}

id sub_10007C550(uint64_t a1)
{
  return [*(id *)(a1 + 32) postSMSMessageSent:*(void *)(a1 + 40) success:*(unsigned __int8 *)(a1 + 72) messageID:*(void *)(a1 + 48) err1:*(void *)(a1 + 56) err2:*(void *)(a1 + 64)];
}

void sub_10007C798(uint64_t a1)
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v2 = [*(id *)(a1 + 32) delegateToQueue];
  id v3 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v15;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v14 + 1) + 8 * (void)v6);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v8 = [*(id *)(a1 + 32) delegateToQueue];
          id v9 = [v8 objectForKey:v7];

          v10[0] = _NSConcreteStackBlock;
          v10[1] = 3221225472;
          _DWORD v10[2] = sub_10007C968;
          void v10[3] = &unk_1000C1D08;
          void v10[4] = v7;
          id v11 = *(id *)(a1 + 40);
          int v13 = *(_DWORD *)(a1 + 56);
          id v12 = *(id *)(a1 + 48);
          dispatch_async(v9, v10);
        }
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v4);
  }
}

id sub_10007C968(uint64_t a1)
{
  return [*(id *)(a1 + 32) connectionStateChanged:*(void *)(a1 + 40) connection:*(unsigned int *)(a1 + 56) dataConnectionStatusInfo:*(void *)(a1 + 48)];
}

void sub_10007CAA0(uint64_t a1)
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v2 = [*(id *)(a1 + 32) delegateToQueue];
  id v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v14;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v13 + 1) + 8 * (void)v6);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v8 = [*(id *)(a1 + 32) delegateToQueue];
          id v9 = [v8 objectForKey:v7];

          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_10007CC5C;
          block[3] = &unk_1000C2650;
          void block[4] = v7;
          id v11 = *(id *)(a1 + 40);
          char v12 = *(unsigned char *)(a1 + 48);
          dispatch_async(v9, block);
        }
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }
}

id sub_10007CC5C(uint64_t a1)
{
  return [*(id *)(a1 + 32) smsReadyStateChanged:*(void *)(a1 + 40) info:*(unsigned __int8 *)(a1 + 48)];
}

void sub_10007CCEC(uint64_t a1)
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = [*(id *)(a1 + 32) delegateToQueue];
  id v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v13;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v12 + 1) + 8 * (void)v6);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v8 = [*(id *)(a1 + 32) delegateToQueue];
          id v9 = [v8 objectForKey:v7];

          v11[0] = _NSConcreteStackBlock;
          v11[1] = 3221225472;
          v11[2] = sub_10007CE88;
          v11[3] = &unk_1000C1DD0;
          uint64_t v10 = *(void *)(a1 + 40);
          void v11[4] = v7;
          void v11[5] = v10;
          dispatch_async(v9, v11);
        }
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }
}

id sub_10007CE88(uint64_t a1)
{
  return [*(id *)(a1 + 32) performSelector:*(void *)(a1 + 40)];
}

void sub_10007CF30(uint64_t a1)
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v2 = [*(id *)(a1 + 32) delegateToQueue];
  id v3 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v15;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v14 + 1) + 8 * (void)v6);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v8 = [*(id *)(a1 + 32) delegateToQueue];
          id v9 = [v8 objectForKey:v7];

          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_10007D0E8;
          block[3] = &unk_1000C2038;
          void block[4] = v7;
          long long v11 = *(_OWORD *)(a1 + 40);
          id v10 = (id)v11;
          long long v13 = v11;
          dispatch_async(v9, block);
        }
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v4);
  }
}

id sub_10007D0E8(uint64_t a1)
{
  return [*(id *)(a1 + 32) performSelector:*(void *)(a1 + 48) withObject:*(void *)(a1 + 40)];
}

void sub_10007D1BC(uint64_t a1)
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v2 = [*(id *)(a1 + 32) delegateToQueue];
  id v3 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v16;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v15 + 1) + 8 * (void)v6);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v8 = [*(id *)(a1 + 32) delegateToQueue];
          id v9 = [v8 objectForKey:v7];

          v11[0] = _NSConcreteStackBlock;
          v11[1] = 3221225472;
          v11[2] = sub_10007D384;
          v11[3] = &unk_1000C25B0;
          uint64_t v10 = *(void *)(a1 + 56);
          void v11[4] = v7;
          uint64_t v14 = v10;
          id v12 = *(id *)(a1 + 40);
          id v13 = *(id *)(a1 + 48);
          dispatch_async(v9, v11);
        }
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v4);
  }
}

id sub_10007D384(uint64_t a1)
{
  return [*(id *)(a1 + 32) performSelector:*(void *)(a1 + 56) withObject:*(void *)(a1 + 40) withObject:*(void *)(a1 + 48)];
}

__CFString *sub_10007D578(__CFString *result)
{
  if (result) {
    return (__CFString *)sub_10007D5D4(result, 0);
  }
  return result;
}

BOOL sub_10007D588(void *a1)
{
  if (!a1) {
    return 1;
  }
  char v3 = 0;
  CFStringRef v1 = sub_10007D5D4(a1, &v3);
  if (v1) {
    CFRelease(v1);
  }
  return v3 == 0;
}

CFStringRef sub_10007D5D4(void *a1, unsigned char *a2)
{
  CFTypeRef result = 0;
  keys[0] = (void *)kSecClass;
  keys[1] = (void *)kSecAttrService;
  keys[2] = (void *)kSecAttrAccount;
  keys[3] = (void *)kSecReturnData;
  values[0] = (void *)kSecClassGenericPassword;
  values[1] = @"EnhancedVoicemail";
  values[2] = a1;
  values[3] = kCFBooleanTrue;
  CFDictionaryRef v3 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 4, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryRef v4 = v3;
  if (a2) {
    *a2 = 0;
  }
  OSStatus v5 = SecItemCopyMatching(v3, &result);
  id v6 = vm_vmd_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    OSStatus v16 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "_CopyKeychainPasswordForAccountNameWithRetry: SecItemCopyMatching returned %d", buf, 8u);
  }

  CFTypeRef v7 = result;
  if (v5 || !result)
  {
    if (v5 != -34019)
    {
      CFStringRef v10 = 0;
      if (!result) {
        goto LABEL_17;
      }
      goto LABEL_16;
    }
    id v12 = vm_vmd_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "_CopyKeychainPasswordForAccountNameWithRetry: errSecUpgradePending", buf, 2u);
    }

    CFStringRef v10 = 0;
    if (a2) {
      *a2 = 1;
    }
  }
  else
  {
    BytePtr = CFDataGetBytePtr((CFDataRef)result);
    CFIndex Length = CFDataGetLength((CFDataRef)result);
    CFStringRef v10 = CFStringCreateWithBytes(0, BytePtr, Length, 0x8000100u, 1u);
    long long v11 = vm_vmd_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "_CopyKeychainPasswordForAccountNameWithRetry: found a password", buf, 2u);
    }
  }
  CFTypeRef v7 = result;
  if (result) {
LABEL_16:
  }
    CFRelease(v7);
LABEL_17:
  CFRelease(v4);
  return v10;
}

void sub_10007D82C(const __CFString *a1, void *a2)
{
  if (a2)
  {
    CFStringRef v4 = sub_10007D5D4(a2, 0);
    sub_10007D8A0((uint64_t)v4, a1, a2);
    if (v4)
    {
      CFRelease(v4);
    }
  }
}

void sub_10007D8A0(uint64_t a1, const __CFString *a2, void *a3)
{
  CFDataRef ExternalRepresentation = CFStringCreateExternalRepresentation(0, a2, 0x8000100u, 0);
  keys[0] = (void *)kSecClass;
  keys[1] = (void *)kSecAttrService;
  keys[2] = (void *)kSecAttrAccount;
  v11[0] = kSecAttrAccessible;
  v11[1] = kSecValueData;
  values[0] = (void *)kSecClassGenericPassword;
  values[1] = @"EnhancedVoicemail";
  values[2] = a3;
  v9[0] = kSecAttrAccessibleAlways;
  v9[1] = ExternalRepresentation;
  if (a1)
  {
    CFDictionaryRef v6 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 3, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFDictionaryRef v7 = CFDictionaryCreate(0, v11, v9, 2, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    SecItemUpdate(v6, v7);
    CFRelease(v6);
  }
  else
  {
    CFDictionaryRef v7 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 5, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    SecItemAdd(v7, 0);
  }
  CFRelease(v7);
  CFRelease(ExternalRepresentation);
}

CFStringRef sub_10007DA50(__CFString *a1)
{
  if (!a1) {
    return 0;
  }
  CFMutableStringRef v1 = sub_10007DA9C(a1);
  if (!v1) {
    return 0;
  }
  CFMutableStringRef v2 = v1;
  CFStringRef v3 = sub_10007D5D4(v1, 0);
  CFRelease(v2);
  return v3;
}

CFMutableStringRef sub_10007DA9C(__CFString *theString)
{
  CFMutableStringRef MutableCopy = theString;
  if (theString)
  {
    CFIndex Length = CFStringGetLength(theString);
    CFIndex v3 = CFStringGetLength(@"-Temp");
    CFMutableStringRef MutableCopy = CFStringCreateMutableCopy(0, v3 + Length, MutableCopy);
    CFStringAppend(MutableCopy, @"-Temp");
  }
  return MutableCopy;
}

void sub_10007DB04(const __CFString *a1, __CFString *theString)
{
  CFMutableStringRef v4 = sub_10007DA9C(theString);
  CFMutableStringRef v5 = v4;
  if (!a1 || !v4)
  {
    if (!v4) {
      return;
    }
    keys[0] = (void *)kSecClass;
    keys[1] = (void *)kSecAttrAccessible;
    keys[2] = (void *)kSecAttrService;
    keys[3] = (void *)kSecAttrAccount;
    values[0] = (void *)kSecClassGenericPassword;
    values[1] = (void *)kSecAttrAccessibleAlways;
    values[2] = @"EnhancedVoicemail";
    values[3] = v4;
    CFDictionaryRef v8 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 4, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    SecItemDelete(v8);
    CFDictionaryRef v7 = v8;
    goto LABEL_7;
  }
  CFStringRef v6 = sub_10007DA50(theString);
  sub_10007D8A0((uint64_t)v6, a1, v5);
  if (v6)
  {
    CFDictionaryRef v7 = v6;
LABEL_7:
    CFRelease(v7);
  }
  CFRelease(v5);
}

uint64_t sub_10007E934(uint64_t a1, uint64_t a2)
{
  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0;
    while (1)
    {
      unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      BOOL v9 = v5++ >= 9;
      if (v9)
      {
        unint64_t v6 = 0;
        int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0;
    }
LABEL_13:
    if (v10 || (v6 & 7) == 4) {
      break;
    }
    switch((v6 >> 3))
    {
      case 1u:
        char v12 = 0;
        unsigned int v13 = 0;
        uint64_t v14 = 0;
        *(unsigned char *)(a1 + 48) |= 1u;
        while (1)
        {
          unint64_t v15 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v15 == -1 || v15 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
            break;
          }
          char v16 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v15);
          *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v15 + 1;
          v14 |= (unint64_t)(v16 & 0x7F) << v12;
          if ((v16 & 0x80) == 0) {
            goto LABEL_52;
          }
          v12 += 7;
          BOOL v9 = v13++ >= 9;
          if (v9)
          {
            uint64_t v14 = 0;
            goto LABEL_54;
          }
        }
        *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_52:
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v14 = 0;
        }
LABEL_54:
        *(void *)(a1 + 8) = v14;
        continue;
      case 2u:
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        *(unsigned char *)(a1 + 48) |= 4u;
        while (2)
        {
          unint64_t v21 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v21 == -1 || v21 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v22 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v21);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v21 + 1;
            v20 |= (unint64_t)(v22 & 0x7F) << v18;
            if (v22 < 0)
            {
              v18 += 7;
              BOOL v9 = v19++ >= 9;
              if (v9)
              {
                LODWORD(v20) = 0;
                goto LABEL_58;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v20) = 0;
        }
LABEL_58:
        uint64_t v34 = 40;
        goto LABEL_67;
      case 3u:
        char v23 = 0;
        unsigned int v24 = 0;
        uint64_t v20 = 0;
        *(unsigned char *)(a1 + 48) |= 2u;
        while (2)
        {
          unint64_t v25 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v25 == -1 || v25 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v26 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v25);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v25 + 1;
            v20 |= (unint64_t)(v26 & 0x7F) << v23;
            if (v26 < 0)
            {
              v23 += 7;
              BOOL v9 = v24++ >= 9;
              if (v9)
              {
                LODWORD(v20) = 0;
                goto LABEL_62;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v20) = 0;
        }
LABEL_62:
        uint64_t v34 = 16;
        goto LABEL_67;
      case 4u:
        char v27 = 0;
        unsigned int v28 = 0;
        uint64_t v20 = 0;
        *(unsigned char *)(a1 + 48) |= 8u;
        break;
      case 5u:
        uint64_t v31 = PBReaderReadString();
        uint64_t v32 = 24;
        goto LABEL_50;
      case 6u:
        uint64_t v31 = PBReaderReadString();
        uint64_t v32 = 32;
LABEL_50:
        BOOL v33 = *(void **)(a1 + v32);
        *(void *)(a1 + v32) = v31;

        continue;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        continue;
    }
    while (1)
    {
      unint64_t v29 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v29 == -1 || v29 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v30 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v29);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v29 + 1;
      v20 |= (unint64_t)(v30 & 0x7F) << v27;
      if ((v30 & 0x80) == 0) {
        goto LABEL_64;
      }
      v27 += 7;
      BOOL v9 = v28++ >= 9;
      if (v9)
      {
        LODWORD(v20) = 0;
        goto LABEL_66;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_64:
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      LODWORD(v20) = 0;
    }
LABEL_66:
    uint64_t v34 = 44;
LABEL_67:
    *(_DWORD *)(a1 + v34) = v20;
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

void sub_10007FBE8()
{
  sub_100007558(__stack_chk_guard);
  sub_100007544();
  sub_100007530();
  sub_100007510((void *)&_mh_execute_header, v0, v1, "#E %s%sError while fetching carrier params %@");
}

void sub_10007FC5C()
{
  sub_10000E838();
  sub_10000E804((void *)&_mh_execute_header, v0, v1, "Unable to send capabilities to client: %@", v2, v3, v4, v5, v6);
}

void sub_10007FCC4()
{
  sub_10000E838();
  sub_10000E804((void *)&_mh_execute_header, v0, v1, "Error sending voicemail storage usage back to client with error: %@", v2, v3, v4, v5, v6);
}

void sub_10007FD2C()
{
  sub_10000E838();
  sub_10000E804((void *)&_mh_execute_header, v0, v1, "Error sending voicemails back to client with error: %@", v2, v3, v4, v5, v6);
}

void sub_10007FD94()
{
  sub_10000E838();
  sub_10000E804((void *)&_mh_execute_header, v0, v1, "Error sending subscription status back to client with error: %@", v2, v3, v4, v5, v6);
}

void sub_10007FDFC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "_handleCheckSubscriptionStatus", v1, 2u);
}

void sub_10007FE40()
{
  sub_10000E838();
  sub_10000E804((void *)&_mh_execute_header, v0, v1, "Error sending subscription status check back to client with error: %@", v2, v3, v4, v5, v6);
}

void sub_10007FEA8()
{
  sub_10000E838();
  sub_10000E804((void *)&_mh_execute_header, v0, v1, "Error sending online status back to client with error: %@", v2, v3, v4, v5, v6);
}

void sub_10007FF10()
{
  sub_10000E838();
  sub_10000E804((void *)&_mh_execute_header, v0, v1, "Error sending transcription status back to client with error: %@", v2, v3, v4, v5, v6);
}

void sub_10007FF78()
{
  sub_10000E838();
  sub_10000E804((void *)&_mh_execute_header, v0, v1, "Error sending sync complete status back to client with error: %@", v2, v3, v4, v5, v6);
}

void sub_10007FFE0(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Client %@ requested %@ for transcriptionProgress, but we are not transcribing", buf, 0x16u);
}

void sub_100080048(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Executing existing reply block for connection %@", buf, 0xCu);
}

void sub_1000800A0(uint64_t a1, NSObject *a2)
{
  int v2 = 138412546;
  CFStringRef v3 = @"/var/mobile/Library/Voicemail";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error resetting VVM, Failed to remove item at path %@: %@", (uint8_t *)&v2, 0x16u);
}

void sub_10008012C()
{
  sub_10000E820();
  sub_10000E844((void *)&_mh_execute_header, v0, v1, "Unable to copy data from transcript path to record %@ with error %@");
}

void sub_100080194()
{
  sub_10000E820();
  sub_10000E844((void *)&_mh_execute_header, v0, v1, "Transcript file %@ does not exist, record %@");
}

void sub_1000801FC()
{
  sub_10000E820();
  sub_10000E844((void *)&_mh_execute_header, v0, v1, "Unable to copy data from audio path to record %@ with error %@");
}

void sub_100080264()
{
  sub_10000E820();
  sub_10000E844((void *)&_mh_execute_header, v0, v1, "Audio file %@ does not exist, record %@");
}

void sub_1000802CC()
{
  sub_10000E838();
  sub_10000E804((void *)&_mh_execute_header, v0, v1, "Sending updated accounts list to client failed with error %@", v2, v3, v4, v5, v6);
}

void sub_100080334()
{
  sub_10000E838();
  sub_10000E804((void *)&_mh_execute_header, v0, v1, "Sending greetingChangedByCarrier failed with error %@", v2, v3, v4, v5, v6);
}

void sub_10008039C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Error unarchiving summarization metadata dictionary as file name empty.", v1, 2u);
}

void sub_1000803E0(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error unarchiving summarization metadata dictionary: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100080458(void *a1, uint64_t a2, NSObject *a3)
{
  id v6 = [a1 mambaID];
  unint64_t v7 = [a1 rumbaID];
  int v8 = 136316162;
  id v9 = v6;
  __int16 v10 = 2080;
  long long v11 = " ";
  __int16 v12 = 2114;
  unsigned int v13 = v7;
  __int16 v14 = 2080;
  unint64_t v15 = " ";
  __int16 v16 = 2112;
  uint64_t v17 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "#E %s%s%{public}@%sPasscode change attempt failed with error %@", (uint8_t *)&v8, 0x34u);
}

void sub_100080540(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Could not retrieve carrier bundle value for context %@ with error %@", (uint8_t *)&v3, 0x16u);
}

void sub_1000805C8(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "CoreTelephony Message Center returned false; attempt failed for STATE request %@",
    (uint8_t *)&v2,
    0xCu);
}

void sub_100080640(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "We are expecting a pending state request here %@", (uint8_t *)&v2, 0xCu);
}

void sub_1000806B8(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "**** given URL does not match to any known mailbox: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100080730(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Could not retrieve a normalized telephone number", v1, 2u);
}

void sub_100080774(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + OBJC_IVAR___MFAccount_mambaID);
  int v4 = 136315650;
  uint64_t v5 = v3;
  __int16 v6 = 2080;
  unint64_t v7 = " ";
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#E %s%sAttempt to obtain an IMAP connection failed with error %@", (uint8_t *)&v4, 0x20u);
}

void sub_100080820(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "??? ??? no identificators for connection!", v1, 2u);
}

void sub_100080864(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "??? %@ failed to find stub for connection (flushLog)", (uint8_t *)&v3, 0xCu);
}

void sub_1000808E0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100080950(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000809C0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100080A30(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100080AA0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100080B10(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100080B48(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100080BB4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100080BEC()
{
  sub_10000E820();
  sub_10000E844((void *)&_mh_execute_header, v0, v1, "Error %@ unarchiving file: %@");
}

void sub_100080C54(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100080C8C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100080CF8()
{
  sub_10000E820();
  sub_10000E844((void *)&_mh_execute_header, v0, v1, "Error %@ while writing data for file: %@");
}

void sub_100080D60(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100080DCC(uint64_t a1, NSObject *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error while downloading asset catalog %ld", (uint8_t *)&v2, 0xCu);
}

void sub_100080E44(uint64_t a1, NSObject *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error while downloading asset %ld", (uint8_t *)&v2, 0xCu);
}

void sub_100080EBC(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "-[VVService setPassword:] called for mailbox named %@; same as old non-NULL password for this mailbox",
    buf,
    0xCu);
}

void sub_100080F14(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "-[VVService setPassword:] called for mailbox named %@; different from old non-NULL password for this mailbox",
    buf,
    0xCu);
}

void sub_100080F6C(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 136315650;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2080;
  *(void *)(buf + 14) = " ";
  *((_WORD *)buf + 11) = 2112;
  *((void *)buf + 3) = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#E %s%s%@", buf, 0x20u);
}

void sub_100080FE8()
{
  __assert_rtn("+[VVService _acquireAssertionsForInsomniaState:]", "VVService.mm", 1420, "tryLockRetVal == EBUSY");
}

void sub_100081014(uint64_t a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 136315394;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2080;
  *(void *)(buf + 14) = " ";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#E %s%sCan't execute automated trash compaction", buf, 0x16u);
}

void sub_100081070(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Request to install dictation model failed with error %@.", (uint8_t *)&v2, 0xCu);
}

void sub_1000810E8(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Request to install Language ID model failed with error %@.", (uint8_t *)&v2, 0xCu);
}

void sub_100081160(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%@: Request to install asset model failed with error %@.", (uint8_t *)&v4, 0x16u);
}

void sub_1000811EC(uint64_t a1, NSObject *a2)
{
  objc_opt_class();
  v6[0] = 136316162;
  sub_100052538();
  __int16 v7 = v3;
  uint64_t v8 = 0;
  __int16 v9 = v3;
  uint64_t v10 = 0;
  id v5 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "#E %s%s%@ event stream handler can't handle notification %@ with user info %@.", (uint8_t *)v6, 0x34u);
}

void sub_1000812A0()
{
  sub_100052538();
  sub_100052558((void *)&_mh_execute_header, v0, v1, "#E %s%sCould not retrieve account for subscription %@", v2, v3, v4, v5, 2u);
}

void sub_100081314()
{
  sub_100052538();
  sub_100052558((void *)&_mh_execute_header, v0, v1, "#E %s%sCould not retrieve service provider for subscription %@", v2, v3, v4, v5, 2u);
}

void sub_100081388()
{
  sub_10000E820();
  sub_10000E844((void *)&_mh_execute_header, v0, v1, "Error setting %@ to be excluded from backup: %@");
}

void sub_1000813F0()
{
  sub_10000E820();
  sub_10000E844((void *)&_mh_execute_header, v0, v1, "Error while writing verifier file at path: %@ error:%@");
}

void sub_100081458()
{
  sub_10005614C();
  uint64_t v2 = NSStringFromSelector(v1);
  uint64_t v10 = v0;
  uint64_t v3 = +[NSString stringWithFormat:@"Unable to delete transcription plist file: %@"];
  sub_100056114();
  sub_10005612C((void *)&_mh_execute_header, v4, v5, "%@: %@", v6, v7, v8, v9, v10, v11, v12);
}

void sub_100081508()
{
  sub_10005614C();
  uint64_t v2 = NSStringFromSelector(v1);
  uint64_t v10 = v0;
  uint64_t v3 = +[NSString stringWithFormat:@"Could not write dictionary to file: %@"];
  sub_100056114();
  sub_10005612C((void *)&_mh_execute_header, v4, v5, "%@: %@", v6, v7, v8, v9, v10, v11, v12);
}

void sub_1000815B8()
{
  sub_10005614C();
  uint64_t v2 = NSStringFromSelector(v1);
  uint64_t v10 = v0;
  uint64_t v3 = +[NSString stringWithFormat:@"Got error accessing speech assets: %@"];
  sub_100056114();
  sub_10005612C((void *)&_mh_execute_header, v4, v5, "%@: %@", v6, v7, v8, v9, v10, v11, v12);
}

void sub_100081668()
{
  sub_10005614C();
  uint64_t v2 = NSStringFromSelector(v1);
  uint64_t v10 = v0;
  uint64_t v3 = +[NSString stringWithFormat:@"[Warning] Speech asset at path: %@ matched a hash that is known to not have confidence."];
  sub_100056114();
  sub_10005612C((void *)&_mh_execute_header, v4, v5, "%@: %@", v6, v7, v8, v9, v10, v11, v12);
}

void sub_100081718(const char *a1)
{
  SEL v1 = NSStringFromSelector(a1);
  uint64_t v2 = +[NSString stringWithFormat:@"The task was already running when we tried to run it again."];
  sub_100056158();
  sub_100056170((void *)&_mh_execute_header, v3, v4, "%@: %@", v5, v6, v7, v8, v9);
}

void sub_1000817C4(const char *a1)
{
  SEL v1 = NSStringFromSelector(a1);
  uint64_t v2 = +[NSString stringWithFormat:@"There's no task running to end."];
  sub_100056158();
  sub_100056170((void *)&_mh_execute_header, v3, v4, "%@: %@", v5, v6, v7, v8, v9);
}

void sub_100081870(void *a1, void *a2, NSObject *a3)
{
  uint64_t v5 = [a1 url];
  uint64_t v6 = [a2 voicemailService];
  uint64_t v7 = [v6 serviceLabelID];
  uint64_t v8 = [a2 voicemailService];
  uint8_t v9 = [v8 contextInfo];
  int v10 = 138412802;
  uint64_t v11 = v5;
  __int16 v12 = 2112;
  unsigned int v13 = v7;
  __int16 v14 = 2112;
  unint64_t v15 = v9;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Greeting data is empty at %@ for account %@, subscription %@", (uint8_t *)&v10, 0x20u);
}

void sub_100081978(uint64_t a1, uint64_t a2)
{
  sub_10006C388(a1, a2, 4.8151e-34);
  *(void *)(v2 + 14) = " ";
  sub_10006C39C((void *)&_mh_execute_header, v2, v3, "#E %s%sCarrier does not have a beacon address in the bundle", v4);
}

void sub_1000819BC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000819F4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100081A2C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100081A64(uint64_t a1, uint64_t a2)
{
  sub_10006C388(a1, a2, 4.8151e-34);
  *(void *)(v2 + 14) = " ";
  sub_10006C39C((void *)&_mh_execute_header, v2, v3, "#E %s%sInvalid IP address family", v4);
}

void sub_100081AA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = sub_10006C3CC(a1, 4.8152e-34, a2, a3);
  sub_10006C3B8(v3, v4, v5);
  sub_10006C3E0((void *)&_mh_execute_header, "#E %s%sException while retrieving single message body. Setting retries to zero. %@", v6, v7);
}

void sub_100081AF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = sub_10006C3CC(a1, 4.8152e-34, a2, a3);
  sub_10006C3B8(v3, v4, v5);
  sub_10006C3E0((void *)&_mh_execute_header, "#E %s%s*** Raise the roof.  %@ while saving default greeting.", v6, v7);
}

void sub_100081B38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = sub_10006C3CC(a1, 4.8152e-34, a2, a3);
  sub_10006C3B8(v3, v4, v5);
  sub_10006C3E0((void *)&_mh_execute_header, "#E %s%s*** Raise the roof.  %@ while saving custom greeting.", v6, v7);
}

void sub_100081B80(uint64_t a1, uint64_t a2)
{
  sub_10006C388(a1, a2, 4.8151e-34);
  *(void *)(v2 + 14) = " ";
  sub_10006C39C((void *)&_mh_execute_header, v2, v3, "#E %s%sNo parameters to save", v4);
}

void sub_100081BC4(uint64_t a1, uint64_t a2)
{
  sub_10006C388(a1, a2, 4.8151e-34);
  *(void *)(v2 + 14) = " ";
  sub_10006C39C((void *)&_mh_execute_header, v2, v3, "#E %s%sCannot invoke changePasswordReplyBlock since its already nil", v4);
}

void sub_100081C08(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Error while creating folder at path:%@ error: %@", (uint8_t *)&v3, 0x16u);
}

void sub_100081C90(void *a1, uint64_t a2, NSObject *a3)
{
  __int16 v5 = [a1 accountDir];
  uint64_t v6 = [v5 path];
  int v7 = 138412546;
  uint64_t v8 = v6;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Error while creating folder at path:%@ error: %@", (uint8_t *)&v7, 0x16u);
}

void sub_100081D50()
{
  sub_10000E838();
  sub_10000E804((void *)&_mh_execute_header, v0, v1, "Retrieving subscription info failed with error %@", v2, v3, v4, v5, v6);
}

void sub_100081DB8()
{
  sub_10000E838();
  sub_10000E804((void *)&_mh_execute_header, v0, v1, "Retrieving active context information failed with error %@.", v2, v3, v4, v5, v6);
}

void sub_100081E20()
{
  sub_10000E820();
  sub_10000E844((void *)&_mh_execute_header, v0, v1, "Retrieving ISO country codes failed with error %@ for %@.");
}

void sub_100081E88()
{
  sub_10000E838();
  sub_10000E804((void *)&_mh_execute_header, v0, v1, "Retrieving country code failed with error %@", v2, v3, v4, v5, v6);
}

void sub_100081EF0()
{
  sub_10000E838();
  sub_10000E804((void *)&_mh_execute_header, v0, v1, "Retrieving network code failed with error %@", v2, v3, v4, v5, v6);
}

void sub_100081F58()
{
  sub_10000E820();
  sub_10000E844((void *)&_mh_execute_header, v0, v1, "Retrieving voicemail call-in details failed for %@ with error %@)");
}

uint64_t AFOfflineDictationCapable()
{
  return _AFOfflineDictationCapable();
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
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

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return _CFAllocatorAllocate(allocator, size, hint);
}

void CFAllocatorDeallocate(CFAllocatorRef allocator, void *ptr)
{
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFArrayRef CFArrayCreateCopy(CFAllocatorRef allocator, CFArrayRef theArray)
{
  return _CFArrayCreateCopy(allocator, theArray);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreateMutable(allocator, capacity, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return _CFArrayCreateMutableCopy(allocator, capacity, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
}

void CFArraySortValues(CFMutableArrayRef theArray, CFRange range, CFComparatorFunction comparator, void *context)
{
}

CFTypeID CFBooleanGetTypeID(void)
{
  return _CFBooleanGetTypeID();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

uint64_t CFCopyHomeDirectoryURLForUser()
{
  return _CFCopyHomeDirectoryURLForUser();
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return _CFDataGetBytePtr(theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return _CFDataGetLength(theData);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreate(allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return _CFDictionaryGetTypeID();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return _CFNotificationCenterGetLocalCenter();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return _CFNumberCreate(allocator, theType, valuePtr);
}

uint64_t CFPhoneNumberCreate()
{
  return _CFPhoneNumberCreate();
}

uint64_t CFPhoneNumberCreateString()
{
  return _CFPhoneNumberCreateString();
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return _CFPreferencesAppSynchronize(applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return _CFPreferencesCopyAppValue(key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppBooleanValue(key, applicationID, keyExistsAndHasValidFormat);
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

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
}

void CFSetApplyFunction(CFSetRef theSet, CFSetApplierFunction applier, void *context)
{
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return _CFSetCreateMutable(allocator, capacity, callBacks);
}

CFIndex CFSetGetCount(CFSetRef theSet)
{
  return _CFSetGetCount(theSet);
}

void CFSetRemoveValue(CFMutableSetRef theSet, const void *value)
{
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return _CFStringCompare(theString1, theString2, compareOptions);
}

CFDataRef CFStringCreateExternalRepresentation(CFAllocatorRef alloc, CFStringRef theString, CFStringEncoding encoding, UInt8 lossByte)
{
  return _CFStringCreateExternalRepresentation(alloc, theString, encoding, lossByte);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return _CFStringCreateMutableCopy(alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return _CFStringCreateWithBytes(alloc, bytes, numBytes, encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return _CFStringCreateWithFormat(alloc, formatOptions, format);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return _CFStringGetBytes(theString, range, encoding, lossByte, isExternalRepresentation, buffer, maxBufLen, usedBufLen);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return _CFStringGetCString(theString, buffer, bufferSize, encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return _CFStringGetCStringPtr(theString, encoding);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return _CFStringGetCharactersPtr(theString);
}

Boolean CFStringGetFileSystemRepresentation(CFStringRef string, char *buffer, CFIndex maxBufLen)
{
  return _CFStringGetFileSystemRepresentation(string, buffer, maxBufLen);
}

SInt32 CFStringGetIntValue(CFStringRef str)
{
  return _CFStringGetIntValue(str);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return _CFStringGetLength(theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

Boolean CFStringHasSuffix(CFStringRef theString, CFStringRef suffix)
{
  return _CFStringHasSuffix(theString, suffix);
}

CFStringRef CFURLCopyFileSystemPath(CFURLRef anURL, CFURLPathStyle pathStyle)
{
  return _CFURLCopyFileSystemPath(anURL, pathStyle);
}

uint64_t CMFBlockListIsItemBlocked()
{
  return _CMFBlockListIsItemBlocked();
}

uint64_t CMFItemCreateWithPhoneNumber()
{
  return _CMFItemCreateWithPhoneNumber();
}

OSStatus CMSampleBufferCopyPCMDataIntoAudioBufferList(CMSampleBufferRef sbuf, int32_t frameOffset, int32_t numFrames, AudioBufferList *bufferList)
{
  return _CMSampleBufferCopyPCMDataIntoAudioBufferList(sbuf, frameOffset, numFrames, bufferList);
}

CMFormatDescriptionRef CMSampleBufferGetFormatDescription(CMSampleBufferRef sbuf)
{
  return _CMSampleBufferGetFormatDescription(sbuf);
}

CMItemCount CMSampleBufferGetNumSamples(CMSampleBufferRef sbuf)
{
  return _CMSampleBufferGetNumSamples(sbuf);
}

uint64_t CPIsInternalDevice()
{
  return _CPIsInternalDevice();
}

uint64_t CSDBRecordCreate()
{
  return _CSDBRecordCreate();
}

uint64_t CSDBRecordGetID()
{
  return _CSDBRecordGetID();
}

uint64_t CSDBRecordGetProperty()
{
  return _CSDBRecordGetProperty();
}

uint64_t CSDBRecordIndexOfPropertyNamed()
{
  return _CSDBRecordIndexOfPropertyNamed();
}

uint64_t CSDBRecordSaveStore()
{
  return _CSDBRecordSaveStore();
}

uint64_t CSDBRecordSetProperty()
{
  return _CSDBRecordSetProperty();
}

uint64_t CSDBRecordStoreAddRecord()
{
  return _CSDBRecordStoreAddRecord();
}

uint64_t CSDBRecordStoreCopyInstanceOfClassWithUID()
{
  return _CSDBRecordStoreCopyInstanceOfClassWithUID();
}

uint64_t CSDBRecordStoreCopyValueForProperty()
{
  return _CSDBRecordStoreCopyValueForProperty();
}

uint64_t CSDBRecordStoreCreateTablesForClass()
{
  return _CSDBRecordStoreCreateTablesForClass();
}

uint64_t CSDBRecordStoreCreateWithPath()
{
  return _CSDBRecordStoreCreateWithPath();
}

uint64_t CSDBRecordStoreDestroy()
{
  return _CSDBRecordStoreDestroy();
}

uint64_t CSDBRecordStoreGetDatabase()
{
  return _CSDBRecordStoreGetDatabase();
}

uint64_t CSDBRecordStoreInvalidateCachesWithStore()
{
  return _CSDBRecordStoreInvalidateCachesWithStore();
}

uint64_t CSDBRecordStoreProcessStatement()
{
  return _CSDBRecordStoreProcessStatement();
}

uint64_t CSDBRecordStoreRegisterClass()
{
  return _CSDBRecordStoreRegisterClass();
}

uint64_t CSDBRecordStoreRemoveRecord()
{
  return _CSDBRecordStoreRemoveRecord();
}

uint64_t CSDBRecordStoreSetSetupHandler()
{
  return _CSDBRecordStoreSetSetupHandler();
}

uint64_t CSDBRecordStoreSetValueForProperty()
{
  return _CSDBRecordStoreSetValueForProperty();
}

uint64_t CSDBSqliteConnectionBegin()
{
  return _CSDBSqliteConnectionBegin();
}

uint64_t CSDBSqliteConnectionCommit()
{
  return _CSDBSqliteConnectionCommit();
}

uint64_t CSDBSqliteConnectionCopyValuesForPropertiesLike()
{
  return _CSDBSqliteConnectionCopyValuesForPropertiesLike();
}

uint64_t CSDBSqliteConnectionIntegerForProperty()
{
  return _CSDBSqliteConnectionIntegerForProperty();
}

uint64_t CSDBSqliteConnectionPerformSQL()
{
  return _CSDBSqliteConnectionPerformSQL();
}

uint64_t CSDBSqliteConnectionSetValueForProperty()
{
  return _CSDBSqliteConnectionSetValueForProperty();
}

uint64_t CSDBSqliteConnectionStatementForSQL()
{
  return _CSDBSqliteConnectionStatementForSQL();
}

uint64_t CSDBSqliteDatabaseConnectionForReading()
{
  return _CSDBSqliteDatabaseConnectionForReading();
}

uint64_t CSDBSqliteDatabaseConnectionForWriting()
{
  return _CSDBSqliteDatabaseConnectionForWriting();
}

uint64_t CSDBSqliteDatabaseCopyValueForProperty()
{
  return _CSDBSqliteDatabaseCopyValueForProperty();
}

uint64_t CSDBSqliteDatabaseSetDataProtectionClass()
{
  return _CSDBSqliteDatabaseSetDataProtectionClass();
}

uint64_t CSDBSqliteDatabaseSetMigrationHandlers()
{
  return _CSDBSqliteDatabaseSetMigrationHandlers();
}

uint64_t CSDBSqliteDatabaseSetValueForProperty()
{
  return _CSDBSqliteDatabaseSetValueForProperty();
}

uint64_t CSDBSqliteDatabaseSetVersion()
{
  return _CSDBSqliteDatabaseSetVersion();
}

uint64_t CSDBSqliteDatabaseStatementForReading()
{
  return _CSDBSqliteDatabaseStatementForReading();
}

uint64_t CSDBSqliteErrMsg()
{
  return _CSDBSqliteErrMsg();
}

uint64_t CSDBSqliteStatementIntegerResult()
{
  return _CSDBSqliteStatementIntegerResult();
}

uint64_t CSDBSqliteStatementPerform()
{
  return _CSDBSqliteStatementPerform();
}

uint64_t CSDBSqliteStatementReset()
{
  return _CSDBSqliteStatementReset();
}

uint64_t CSDBSqliteStatementSendResults()
{
  return _CSDBSqliteStatementSendResults();
}

uint64_t CTGetCurrentCallCount()
{
  return _CTGetCurrentCallCount();
}

uint64_t CTRegistrationCopyDataStatus()
{
  return _CTRegistrationCopyDataStatus();
}

IOReturn IOPMAssertionCreateWithProperties(CFDictionaryRef AssertionProperties, IOPMAssertionID *AssertionID)
{
  return _IOPMAssertionCreateWithProperties(AssertionProperties, AssertionID);
}

IOReturn IOPMAssertionSetProperty(IOPMAssertionID theAssertion, CFStringRef theProperty, CFTypeRef theValue)
{
  return _IOPMAssertionSetProperty(theAssertion, theProperty, theValue);
}

uint64_t MFCreateArrayForMessageFlags()
{
  return _MFCreateArrayForMessageFlags();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return _MKBDeviceUnlockedSinceBoot();
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return _NSStringFromRange(range);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

uint64_t PBDataWriterWriteBOOLField()
{
  return _PBDataWriterWriteBOOLField();
}

uint64_t PBDataWriterWriteStringField()
{
  return _PBDataWriterWriteStringField();
}

uint64_t PBDataWriterWriteUint32Field()
{
  return _PBDataWriterWriteUint32Field();
}

uint64_t PBDataWriterWriteUint64Field()
{
  return _PBDataWriterWriteUint64Field();
}

uint64_t PBReaderReadString()
{
  return _PBReaderReadString();
}

uint64_t PBReaderSkipValueWithTag()
{
  return _PBReaderSkipValueWithTag();
}

uint64_t PLLogRegisteredEvent()
{
  return _PLLogRegisteredEvent();
}

uint64_t PNCopyBestGuessCountryCodeForNumber()
{
  return _PNCopyBestGuessCountryCodeForNumber();
}

uint64_t PNDecomposeForCountry()
{
  return _PNDecomposeForCountry();
}

int SCError(void)
{
  return _SCError();
}

const char *__cdecl SCErrorString(int status)
{
  return _SCErrorString(status);
}

SCPreferencesRef SCPreferencesCreate(CFAllocatorRef allocator, CFStringRef name, CFStringRef prefsID)
{
  return _SCPreferencesCreate(allocator, name, prefsID);
}

CFPropertyListRef SCPreferencesGetValue(SCPreferencesRef prefs, CFStringRef key)
{
  return _SCPreferencesGetValue(prefs, key);
}

Boolean SCPreferencesSetCallback(SCPreferencesRef prefs, SCPreferencesCallBack callout, SCPreferencesContext *context)
{
  return _SCPreferencesSetCallback(prefs, callout, context);
}

Boolean SCPreferencesSetDispatchQueue(SCPreferencesRef prefs, dispatch_queue_t queue)
{
  return _SCPreferencesSetDispatchQueue(prefs, queue);
}

void SCPreferencesSynchronize(SCPreferencesRef prefs)
{
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return _SecItemAdd(attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return _SecItemCopyMatching(query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return _SecItemDelete(query);
}

OSStatus SecItemUpdate(CFDictionaryRef query, CFDictionaryRef attributesToUpdate)
{
  return _SecItemUpdate(query, attributesToUpdate);
}

uint64_t VMCopyDictionaryForNotificationString()
{
  return _VMCopyDictionaryForNotificationString();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return __CFXPCCreateCFObjectFromXPCObject();
}

uint64_t _CTServerConnectionCreate()
{
  return __CTServerConnectionCreate();
}

uint64_t _CTServerConnectionGetVoiceMailAvailable()
{
  return __CTServerConnectionGetVoiceMailAvailable();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t asString()
{
  return asString();
}

uint64_t ctu::OsLogLogger::OsLogLogger(ctu::OsLogLogger *this, const char *a2, const char *a3)
{
  return ctu::OsLogLogger::OsLogLogger(this, a2, a3);
}

void ctu::OsLogLogger::~OsLogLogger(ctu::OsLogLogger *this)
{
}

uint64_t ctu::XpcJetsamAssertion::createActivity()
{
  return ctu::XpcJetsamAssertion::createActivity();
}

uint64_t ctu::XpcJetsamAssertion::getAssertionCount(ctu::XpcJetsamAssertion *this)
{
  return ctu::XpcJetsamAssertion::getAssertionCount(this);
}

uint64_t ctu::XpcJetsamAssertion::create_default_global(ctu::XpcJetsamAssertion *this)
{
  return ctu::XpcJetsamAssertion::create_default_global(this);
}

uint64_t ctu::basename()
{
  return ctu::basename();
}

uint64_t logger::CFTypeRefLogger()
{
  return logger::CFTypeRefLogger();
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return std::logic_error::logic_error(this, a2);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

void std::terminate(void)
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

void operator new()
{
  while (1)
    ;
}

uint64_t __NSMakeSpecialForwardingCaptureBlock()
{
  return ___NSMakeSpecialForwardingCaptureBlock();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return ___cxa_allocate_exception(thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return ___cxa_atexit(lpfunc, obj, lpdso_handle);
}

void *__cxa_begin_catch(void *a1)
{
  return ___cxa_begin_catch(a1);
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
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

uint64_t __mfEnableCallStackLogging()
{
  return ___mfEnableCallStackLogging();
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

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return _arc4random_uniform(__upper_bound);
}

uint64_t asNSStringBOOL()
{
  return _asNSStringBOOL();
}

uint64_t asStringBOOL()
{
  return _asStringBOOL();
}

uint64_t asStringBool()
{
  return _asStringBool();
}

int atoi(const char *a1)
{
  return _atoi(a1);
}

void bzero(void *a1, size_t a2)
{
}

uint64_t calculateLogPrefix()
{
  return _calculateLogPrefix();
}

int chmod(const char *a1, mode_t a2)
{
  return _chmod(a1, a2);
}

int chown(const char *a1, uid_t a2, gid_t a3)
{
  return _chown(a1, a2, a3);
}

int close(int a1)
{
  return _close(a1);
}

int closedir(DIR *a1)
{
  return _closedir(a1);
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

dispatch_queue_t dispatch_get_current_queue(void)
{
  return _dispatch_get_current_queue();
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return _dispatch_get_specific(key);
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

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
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

int fputs(const char *a1, FILE *a2)
{
  return _fputs(a1, a2);
}

passwd *__cdecl getpwnam(const char *a1)
{
  return _getpwnam(a1);
}

int inet_pton(int a1, const char *a2, void *a3)
{
  return _inet_pton(a1, a2, a3);
}

uint64_t initImapNetworkLayer()
{
  return _initImapNetworkLayer();
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return _memchr(__s, __c, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

int mkdir(const char *a1, mode_t a2)
{
  return _mkdir(a1, a2);
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
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

id objc_retainAutoreleasedReturnValue(id a1)
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

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

DIR *__cdecl opendir(const char *a1)
{
  return _opendir(a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

uint64_t os_unfair_lock_lock_with_options()
{
  return _os_unfair_lock_lock_with_options();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return _proc_pidpath(pid, buffer, buffersize);
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

int pthread_mutex_trylock(pthread_mutex_t *a1)
{
  return _pthread_mutex_trylock(a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return _pthread_mutex_unlock(a1);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return _pthread_once(a1, a2);
}

dirent *__cdecl readdir(DIR *a1)
{
  return _readdir(a1);
}

int rmdir(const char *a1)
{
  return _rmdir(a1);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return _sqlite3_bind_int(a1, a2, a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return _sqlite3_bind_int64(a1, a2, a3);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return _sqlite3_bind_text(a1, a2, a3, a4, a5);
}

int sqlite3_close(sqlite3 *a1)
{
  return _sqlite3_close(a1);
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_int(a1, iCol);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_text(a1, iCol);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return _sqlite3_errmsg(a1);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return _sqlite3_finalize(pStmt);
}

int sqlite3_open(const char *filename, sqlite3 **ppDb)
{
  return _sqlite3_open(filename, ppDb);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return _sqlite3_prepare_v2(db, zSql, nByte, ppStmt, pzTail);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return _sqlite3_step(a1);
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

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}

int unlink(const char *a1)
{
  return _unlink(a1);
}

uint64_t vm_imap_log()
{
  return _vm_imap_log();
}

uint64_t vm_vmd_log()
{
  return _vm_vmd_log();
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return _write(__fd, __buf, __nbyte);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return _xpc_activity_get_state(activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return _xpc_activity_set_state(activity, state);
}

void xpc_activity_unregister(const char *identifier)
{
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_value(xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend_URLString(void *a1, const char *a2, ...)
{
  return [a1 URLString];
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

id objc_msgSend__attemptDelayedSynchronize(void *a1, const char *a2, ...)
{
  return [a1 _attemptDelayedSynchronize];
}

id objc_msgSend__authenticationFailed(void *a1, const char *a2, ...)
{
  return [a1 _authenticationFailed];
}

id objc_msgSend__beaconCount(void *a1, const char *a2, ...)
{
  return [a1 _beaconCount];
}

id objc_msgSend__bodyLoadMonitor(void *a1, const char *a2, ...)
{
  return [a1 _bodyLoadMonitor];
}

id objc_msgSend__cancelBeacon(void *a1, const char *a2, ...)
{
  return [a1 _cancelBeacon];
}

id objc_msgSend__cancelIndicatorAction(void *a1, const char *a2, ...)
{
  return [a1 _cancelIndicatorAction];
}

id objc_msgSend__carrierBundleChanged(void *a1, const char *a2, ...)
{
  return [a1 _carrierBundleChanged];
}

id objc_msgSend__checkForQueuedNotifications(void *a1, const char *a2, ...)
{
  return [a1 _checkForQueuedNotifications];
}

id objc_msgSend__checkpointDictionary(void *a1, const char *a2, ...)
{
  return [a1 _checkpointDictionary];
}

id objc_msgSend__checkpointDictionaryChanged(void *a1, const char *a2, ...)
{
  return [a1 _checkpointDictionaryChanged];
}

id objc_msgSend__checkpointDictionaryFilePath(void *a1, const char *a2, ...)
{
  return [a1 _checkpointDictionaryFilePath];
}

id objc_msgSend__dataRoamingStatusChanged(void *a1, const char *a2, ...)
{
  return [a1 _dataRoamingStatusChanged];
}

id objc_msgSend__deliverFallbackNotification(void *a1, const char *a2, ...)
{
  return [a1 _deliverFallbackNotification];
}

id objc_msgSend__doneBeacon(void *a1, const char *a2, ...)
{
  return [a1 _doneBeacon];
}

id objc_msgSend__endRetranscribingTask(void *a1, const char *a2, ...)
{
  return [a1 _endRetranscribingTask];
}

id objc_msgSend__enterFallbackMode(void *a1, const char *a2, ...)
{
  return [a1 _enterFallbackMode];
}

id objc_msgSend__forceOfflineRecognition(void *a1, const char *a2, ...)
{
  return [a1 _forceOfflineRecognition];
}

id objc_msgSend__headersToPreserve(void *a1, const char *a2, ...)
{
  return [a1 _headersToPreserve];
}

id objc_msgSend__incrementBeaconCount(void *a1, const char *a2, ...)
{
  return [a1 _incrementBeaconCount];
}

id objc_msgSend__incrementBeaconTemporaryRetryCount(void *a1, const char *a2, ...)
{
  return [a1 _incrementBeaconTemporaryRetryCount];
}

id objc_msgSend__inferActiveState(void *a1, const char *a2, ...)
{
  return [a1 _inferActiveState];
}

id objc_msgSend__messageChangeQueue(void *a1, const char *a2, ...)
{
  return [a1 _messageChangeQueue];
}

id objc_msgSend__parameters(void *a1, const char *a2, ...)
{
  return [a1 _parameters];
}

id objc_msgSend__parametersFilePath(void *a1, const char *a2, ...)
{
  return [a1 _parametersFilePath];
}

id objc_msgSend__resetBeaconTemporaryRetryCount(void *a1, const char *a2, ...)
{
  return [a1 _resetBeaconTemporaryRetryCount];
}

id objc_msgSend__resetCountsForCompaction(void *a1, const char *a2, ...)
{
  return [a1 _resetCountsForCompaction];
}

id objc_msgSend__resetLegacyMessageWaiting(void *a1, const char *a2, ...)
{
  return [a1 _resetLegacyMessageWaiting];
}

id objc_msgSend__saveCheckpointDictionary(void *a1, const char *a2, ...)
{
  return [a1 _saveCheckpointDictionary];
}

id objc_msgSend__saveParameters(void *a1, const char *a2, ...)
{
  return [a1 _saveParameters];
}

id objc_msgSend__scheduleFallbackActivityIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 _scheduleFallbackActivityIfNecessary];
}

id objc_msgSend__sendCapabilities(void *a1, const char *a2, ...)
{
  return [a1 _sendCapabilities];
}

id objc_msgSend__startBeacon(void *a1, const char *a2, ...)
{
  return [a1 _startBeacon];
}

id objc_msgSend__updateOnlineStatus(void *a1, const char *a2, ...)
{
  return [a1 _updateOnlineStatus];
}

id objc_msgSend__voicemailPowerAssertion(void *a1, const char *a2, ...)
{
  return [a1 _voicemailPowerAssertion];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_account(void *a1, const char *a2, ...)
{
  return [a1 account];
}

id objc_msgSend_accountDir(void *a1, const char *a2, ...)
{
  return [a1 accountDir];
}

id objc_msgSend_accountID(void *a1, const char *a2, ...)
{
  return [a1 accountID];
}

id objc_msgSend_accountIdentifier(void *a1, const char *a2, ...)
{
  return [a1 accountIdentifier];
}

id objc_msgSend_accountManager(void *a1, const char *a2, ...)
{
  return [a1 accountManager];
}

id objc_msgSend_accountStore(void *a1, const char *a2, ...)
{
  return [a1 accountStore];
}

id objc_msgSend_accountType(void *a1, const char *a2, ...)
{
  return [a1 accountType];
}

id objc_msgSend_accounts(void *a1, const char *a2, ...)
{
  return [a1 accounts];
}

id objc_msgSend_accountsToRefreshIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 accountsToRefreshIfNeeded];
}

id objc_msgSend_accurate(void *a1, const char *a2, ...)
{
  return [a1 accurate];
}

id objc_msgSend_activityTarget(void *a1, const char *a2, ...)
{
  return [a1 activityTarget];
}

id objc_msgSend_activityTargets(void *a1, const char *a2, ...)
{
  return [a1 activityTargets];
}

id objc_msgSend_all(void *a1, const char *a2, ...)
{
  return [a1 all];
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

id objc_msgSend_allVoicemails(void *a1, const char *a2, ...)
{
  return [a1 allVoicemails];
}

id objc_msgSend_allVoicemailsWithTranscription(void *a1, const char *a2, ...)
{
  return [a1 allVoicemailsWithTranscription];
}

id objc_msgSend_alternatives(void *a1, const char *a2, ...)
{
  return [a1 alternatives];
}

id objc_msgSend_archivedData(void *a1, const char *a2, ...)
{
  return [a1 archivedData];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_assetId(void *a1, const char *a2, ...)
{
  return [a1 assetId];
}

id objc_msgSend_assetModelOperation(void *a1, const char *a2, ...)
{
  return [a1 assetModelOperation];
}

id objc_msgSend_attachmentURLs(void *a1, const char *a2, ...)
{
  return [a1 attachmentURLs];
}

id objc_msgSend_attributes(void *a1, const char *a2, ...)
{
  return [a1 attributes];
}

id objc_msgSend_automatedTrashActivityIdentifier(void *a1, const char *a2, ...)
{
  return [a1 automatedTrashActivityIdentifier];
}

id objc_msgSend_available(void *a1, const char *a2, ...)
{
  return [a1 available];
}

id objc_msgSend_beaconRetryActivityIdentifier(void *a1, const char *a2, ...)
{
  return [a1 beaconRetryActivityIdentifier];
}

id objc_msgSend_bestTranscription(void *a1, const char *a2, ...)
{
  return [a1 bestTranscription];
}

id objc_msgSend_blockInvocationDescription(void *a1, const char *a2, ...)
{
  return [a1 blockInvocationDescription];
}

id objc_msgSend_bodyData(void *a1, const char *a2, ...)
{
  return [a1 bodyData];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_callbackDestinationID(void *a1, const char *a2, ...)
{
  return [a1 callbackDestinationID];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_cancelAllOperations(void *a1, const char *a2, ...)
{
  return [a1 cancelAllOperations];
}

id objc_msgSend_cancelAutomatedTrashCompaction(void *a1, const char *a2, ...)
{
  return [a1 cancelAutomatedTrashCompaction];
}

id objc_msgSend_cancelNotificationFallback(void *a1, const char *a2, ...)
{
  return [a1 cancelNotificationFallback];
}

id objc_msgSend_cancelPasswordRequest(void *a1, const char *a2, ...)
{
  return [a1 cancelPasswordRequest];
}

id objc_msgSend_cancelReading(void *a1, const char *a2, ...)
{
  return [a1 cancelReading];
}

id objc_msgSend_candidateGreetingMessage(void *a1, const char *a2, ...)
{
  return [a1 candidateGreetingMessage];
}

id objc_msgSend_capabilities(void *a1, const char *a2, ...)
{
  return [a1 capabilities];
}

id objc_msgSend_carrierAccountDataSource(void *a1, const char *a2, ...)
{
  return [a1 carrierAccountDataSource];
}

id objc_msgSend_carrierBundle(void *a1, const char *a2, ...)
{
  return [a1 carrierBundle];
}

id objc_msgSend_carrierBundleClient(void *a1, const char *a2, ...)
{
  return [a1 carrierBundleClient];
}

id objc_msgSend_carrierServicesController(void *a1, const char *a2, ...)
{
  return [a1 carrierServicesController];
}

id objc_msgSend_changePasswordReplyBlock(void *a1, const char *a2, ...)
{
  return [a1 changePasswordReplyBlock];
}

id objc_msgSend_checkAirplaneModePreference(void *a1, const char *a2, ...)
{
  return [a1 checkAirplaneModePreference];
}

id objc_msgSend_checkIn(void *a1, const char *a2, ...)
{
  return [a1 checkIn];
}

id objc_msgSend_checkInForcefully(void *a1, const char *a2, ...)
{
  return [a1 checkInForcefully];
}

id objc_msgSend_checkUnlockSinceBootState(void *a1, const char *a2, ...)
{
  return [a1 checkUnlockSinceBootState];
}

id objc_msgSend_checkUpdateAccounts(void *a1, const char *a2, ...)
{
  return [a1 checkUpdateAccounts];
}

id objc_msgSend_cleanUpErroredFile(void *a1, const char *a2, ...)
{
  return [a1 cleanUpErroredFile];
}

id objc_msgSend_clearRemoteUIDsForDetachedMessages(void *a1, const char *a2, ...)
{
  return [a1 clearRemoteUIDsForDetachedMessages];
}

id objc_msgSend_clients(void *a1, const char *a2, ...)
{
  return [a1 clients];
}

id objc_msgSend_close(void *a1, const char *a2, ...)
{
  return [a1 close];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_completeFlagChange(void *a1, const char *a2, ...)
{
  return [a1 completeFlagChange];
}

id objc_msgSend_confidence(void *a1, const char *a2, ...)
{
  return [a1 confidence];
}

id objc_msgSend_confidenceRating(void *a1, const char *a2, ...)
{
  return [a1 confidenceRating];
}

id objc_msgSend_configurationDictionary(void *a1, const char *a2, ...)
{
  return [a1 configurationDictionary];
}

id objc_msgSend_configureLoggingClass(void *a1, const char *a2, ...)
{
  return [a1 configureLoggingClass];
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return [a1 connection];
}

id objc_msgSend_connectionServiceType(void *a1, const char *a2, ...)
{
  return [a1 connectionServiceType];
}

id objc_msgSend_contentTransferEncoding(void *a1, const char *a2, ...)
{
  return [a1 contentTransferEncoding];
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return [a1 context];
}

id objc_msgSend_contextInfo(void *a1, const char *a2, ...)
{
  return [a1 contextInfo];
}

id objc_msgSend_contexts(void *a1, const char *a2, ...)
{
  return [a1 contexts];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_copyAddressListForReplyTo(void *a1, const char *a2, ...)
{
  return [a1 copyAddressListForReplyTo];
}

id objc_msgSend_copyNextSampleBuffer(void *a1, const char *a2, ...)
{
  return [a1 copyNextSampleBuffer];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_createFoldersIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 createFoldersIfNecessary];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return [a1 currentLocale];
}

id objc_msgSend_currentMonitor(void *a1, const char *a2, ...)
{
  return [a1 currentMonitor];
}

id objc_msgSend_currentOffset(void *a1, const char *a2, ...)
{
  return [a1 currentOffset];
}

id objc_msgSend_currentPart(void *a1, const char *a2, ...)
{
  return [a1 currentPart];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_currentTaskType(void *a1, const char *a2, ...)
{
  return [a1 currentTaskType];
}

id objc_msgSend_currentThread(void *a1, const char *a2, ...)
{
  return [a1 currentThread];
}

id objc_msgSend_currentTracebleMonitor(void *a1, const char *a2, ...)
{
  return [a1 currentTracebleMonitor];
}

id objc_msgSend_customFlags(void *a1, const char *a2, ...)
{
  return [a1 customFlags];
}

id objc_msgSend_daemonListener(void *a1, const char *a2, ...)
{
  return [a1 daemonListener];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_dataSource(void *a1, const char *a2, ...)
{
  return [a1 dataSource];
}

id objc_msgSend_dataURL(void *a1, const char *a2, ...)
{
  return [a1 dataURL];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_dateSent(void *a1, const char *a2, ...)
{
  return [a1 dateSent];
}

id objc_msgSend_dateSentAsTimeIntervalSince1970(void *a1, const char *a2, ...)
{
  return [a1 dateSentAsTimeIntervalSince1970];
}

id objc_msgSend_dbfile(void *a1, const char *a2, ...)
{
  return [a1 dbfile];
}

id objc_msgSend_debugDescription(void *a1, const char *a2, ...)
{
  return [a1 debugDescription];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultService(void *a1, const char *a2, ...)
{
  return [a1 defaultService];
}

id objc_msgSend_delayedRetryActivityIdentifier(void *a1, const char *a2, ...)
{
  return [a1 delayedRetryActivityIdentifier];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_delegateToQueue(void *a1, const char *a2, ...)
{
  return [a1 delegateToQueue];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_destination(void *a1, const char *a2, ...)
{
  return [a1 destination];
}

id objc_msgSend_detectedLanguageCode(void *a1, const char *a2, ...)
{
  return [a1 detectedLanguageCode];
}

id objc_msgSend_deviceHasSpeechAssets(void *a1, const char *a2, ...)
{
  return [a1 deviceHasSpeechAssets];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return [a1 dictionaryRepresentation];
}

id objc_msgSend_displayPasswordRequestIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 displayPasswordRequestIfNecessary];
}

id objc_msgSend_distantPast(void *a1, const char *a2, ...)
{
  return [a1 distantPast];
}

id objc_msgSend_doCompact(void *a1, const char *a2, ...)
{
  return [a1 doCompact];
}

id objc_msgSend_doesClientManageTrashCompaction(void *a1, const char *a2, ...)
{
  return [a1 doesClientManageTrashCompaction];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_dominantLocale(void *a1, const char *a2, ...)
{
  return [a1 dominantLocale];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_downloadAssetCatalog(void *a1, const char *a2, ...)
{
  return [a1 downloadAssetCatalog];
}

id objc_msgSend_duration(void *a1, const char *a2, ...)
{
  return [a1 duration];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_execute(void *a1, const char *a2, ...)
{
  return [a1 execute];
}

id objc_msgSend_expectedLength(void *a1, const char *a2, ...)
{
  return [a1 expectedLength];
}

id objc_msgSend_expectedTimeRemaining(void *a1, const char *a2, ...)
{
  return [a1 expectedTimeRemaining];
}

id objc_msgSend_exportedInterface(void *a1, const char *a2, ...)
{
  return [a1 exportedInterface];
}

id objc_msgSend_expunge(void *a1, const char *a2, ...)
{
  return [a1 expunge];
}

id objc_msgSend_failureReason(void *a1, const char *a2, ...)
{
  return [a1 failureReason];
}

id objc_msgSend_fallbackActivityIdentifier(void *a1, const char *a2, ...)
{
  return [a1 fallbackActivityIdentifier];
}

id objc_msgSend_fetchContexts(void *a1, const char *a2, ...)
{
  return [a1 fetchContexts];
}

id objc_msgSend_fetchSubscriptions(void *a1, const char *a2, ...)
{
  return [a1 fetchSubscriptions];
}

id objc_msgSend_fileModificationDate(void *a1, const char *a2, ...)
{
  return [a1 fileModificationDate];
}

id objc_msgSend_fileSize(void *a1, const char *a2, ...)
{
  return [a1 fileSize];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_finishAudio(void *a1, const char *a2, ...)
{
  return [a1 finishAudio];
}

id objc_msgSend_fire(void *a1, const char *a2, ...)
{
  return [a1 fire];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_firstSenderAddress(void *a1, const char *a2, ...)
{
  return [a1 firstSenderAddress];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_flushIMAPServiceLibraryCache(void *a1, const char *a2, ...)
{
  return [a1 flushIMAPServiceLibraryCache];
}

id objc_msgSend_flushMessageCache(void *a1, const char *a2, ...)
{
  return [a1 flushMessageCache];
}

id objc_msgSend_fractionCompleted(void *a1, const char *a2, ...)
{
  return [a1 fractionCompleted];
}

id objc_msgSend_fullPath(void *a1, const char *a2, ...)
{
  return [a1 fullPath];
}

id objc_msgSend_getAccountStore(void *a1, const char *a2, ...)
{
  return [a1 getAccountStore];
}

id objc_msgSend_getBlockArgumentIndex(void *a1, const char *a2, ...)
{
  return [a1 getBlockArgumentIndex];
}

id objc_msgSend_getDataFiles(void *a1, const char *a2, ...)
{
  return [a1 getDataFiles];
}

id objc_msgSend_getIsoContryCodes(void *a1, const char *a2, ...)
{
  return [a1 getIsoContryCodes];
}

id objc_msgSend_getRecordDescriptor(void *a1, const char *a2, ...)
{
  return [a1 getRecordDescriptor];
}

id objc_msgSend_getRetryIntervals(void *a1, const char *a2, ...)
{
  return [a1 getRetryIntervals];
}

id objc_msgSend_getServiceObjLogPrefix(void *a1, const char *a2, ...)
{
  return [a1 getServiceObjLogPrefix];
}

id objc_msgSend_getState(void *a1, const char *a2, ...)
{
  return [a1 getState];
}

id objc_msgSend_getStore(void *a1, const char *a2, ...)
{
  return [a1 getStore];
}

id objc_msgSend_getStoreLabelID(void *a1, const char *a2, ...)
{
  return [a1 getStoreLabelID];
}

id objc_msgSend_getTranscriptionLocaleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 getTranscriptionLocaleIdentifier];
}

id objc_msgSend_greetingManager(void *a1, const char *a2, ...)
{
  return [a1 greetingManager];
}

id objc_msgSend_hasDeviceBeenUnlockedSinceBoot(void *a1, const char *a2, ...)
{
  return [a1 hasDeviceBeenUnlockedSinceBoot];
}

id objc_msgSend_hasDirectoryPath(void *a1, const char *a2, ...)
{
  return [a1 hasDirectoryPath];
}

id objc_msgSend_hasPendingOfflineOperations(void *a1, const char *a2, ...)
{
  return [a1 hasPendingOfflineOperations];
}

id objc_msgSend_hasTemporaryUid(void *a1, const char *a2, ...)
{
  return [a1 hasTemporaryUid];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_headerData(void *a1, const char *a2, ...)
{
  return [a1 headerData];
}

id objc_msgSend_headers(void *a1, const char *a2, ...)
{
  return [a1 headers];
}

id objc_msgSend_heldConnectionsForCheckingIn(void *a1, const char *a2, ...)
{
  return [a1 heldConnectionsForCheckingIn];
}

id objc_msgSend_hostname(void *a1, const char *a2, ...)
{
  return [a1 hostname];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_ignoresRoamingSwitch(void *a1, const char *a2, ...)
{
  return [a1 ignoresRoamingSwitch];
}

id objc_msgSend_imapTransactionEnded(void *a1, const char *a2, ...)
{
  return [a1 imapTransactionEnded];
}

id objc_msgSend_inferredMimeType(void *a1, const char *a2, ...)
{
  return [a1 inferredMimeType];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_install(void *a1, const char *a2, ...)
{
  return [a1 install];
}

id objc_msgSend_installAssetLanguages(void *a1, const char *a2, ...)
{
  return [a1 installAssetLanguages];
}

id objc_msgSend_installLIDAsset(void *a1, const char *a2, ...)
{
  return [a1 installLIDAsset];
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

id objc_msgSend_invalidateServiceAccount(void *a1, const char *a2, ...)
{
  return [a1 invalidateServiceAccount];
}

id objc_msgSend_invalidateServiceLibrary(void *a1, const char *a2, ...)
{
  return [a1 invalidateServiceLibrary];
}

id objc_msgSend_invertedSet(void *a1, const char *a2, ...)
{
  return [a1 invertedSet];
}

id objc_msgSend_invocationDescription(void *a1, const char *a2, ...)
{
  return [a1 invocationDescription];
}

id objc_msgSend_invocationQueue(void *a1, const char *a2, ...)
{
  return [a1 invocationQueue];
}

id objc_msgSend_invoke(void *a1, const char *a2, ...)
{
  return [a1 invoke];
}

id objc_msgSend_isAttachment(void *a1, const char *a2, ...)
{
  return [a1 isAttachment];
}

id objc_msgSend_isBeaconActive(void *a1, const char *a2, ...)
{
  return [a1 isBeaconActive];
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return [a1 isCancelled];
}

id objc_msgSend_isCellularNetworkAvailable(void *a1, const char *a2, ...)
{
  return [a1 isCellularNetworkAvailable];
}

id objc_msgSend_isConnectivityError(void *a1, const char *a2, ...)
{
  return [a1 isConnectivityError];
}

id objc_msgSend_isDataAvailable(void *a1, const char *a2, ...)
{
  return [a1 isDataAvailable];
}

id objc_msgSend_isDelayedRetryImmediate(void *a1, const char *a2, ...)
{
  return [a1 isDelayedRetryImmediate];
}

id objc_msgSend_isDelayedRetryScheduled(void *a1, const char *a2, ...)
{
  return [a1 isDelayedRetryScheduled];
}

id objc_msgSend_isDelayedRetryScheduledGuarded(void *a1, const char *a2, ...)
{
  return [a1 isDelayedRetryScheduledGuarded];
}

id objc_msgSend_isDeleted(void *a1, const char *a2, ...)
{
  return [a1 isDeleted];
}

id objc_msgSend_isDictationModelInstalled(void *a1, const char *a2, ...)
{
  return [a1 isDictationModelInstalled];
}

id objc_msgSend_isExecuting(void *a1, const char *a2, ...)
{
  return [a1 isExecuting];
}

id objc_msgSend_isFileURL(void *a1, const char *a2, ...)
{
  return [a1 isFileURL];
}

id objc_msgSend_isFinal(void *a1, const char *a2, ...)
{
  return [a1 isFinal];
}

id objc_msgSend_isInSync(void *a1, const char *a2, ...)
{
  return [a1 isInSync];
}

id objc_msgSend_isInvalidSubscriberError(void *a1, const char *a2, ...)
{
  return [a1 isInvalidSubscriberError];
}

id objc_msgSend_isLanguageDetectorInstalled(void *a1, const char *a2, ...)
{
  return [a1 isLanguageDetectorInstalled];
}

id objc_msgSend_isLanguageIDModelInstalled(void *a1, const char *a2, ...)
{
  return [a1 isLanguageIDModelInstalled];
}

id objc_msgSend_isMailboxUsageUpdated(void *a1, const char *a2, ...)
{
  return [a1 isMailboxUsageUpdated];
}

id objc_msgSend_isMainThread(void *a1, const char *a2, ...)
{
  return [a1 isMainThread];
}

id objc_msgSend_isMessageWaiting(void *a1, const char *a2, ...)
{
  return [a1 isMessageWaiting];
}

id objc_msgSend_isNetworkOriginated(void *a1, const char *a2, ...)
{
  return [a1 isNetworkOriginated];
}

id objc_msgSend_isNetworkReachable(void *a1, const char *a2, ...)
{
  return [a1 isNetworkReachable];
}

id objc_msgSend_isOffline(void *a1, const char *a2, ...)
{
  return [a1 isOffline];
}

id objc_msgSend_isOnline(void *a1, const char *a2, ...)
{
  return [a1 isOnline];
}

id objc_msgSend_isPasswordMismatchError(void *a1, const char *a2, ...)
{
  return [a1 isPasswordMismatchError];
}

id objc_msgSend_isPluggedIn(void *a1, const char *a2, ...)
{
  return [a1 isPluggedIn];
}

id objc_msgSend_isProxy(void *a1, const char *a2, ...)
{
  return [a1 isProxy];
}

id objc_msgSend_isSMSReady(void *a1, const char *a2, ...)
{
  return [a1 isSMSReady];
}

id objc_msgSend_isSimDataOnly(void *a1, const char *a2, ...)
{
  return [a1 isSimDataOnly];
}

id objc_msgSend_isSingleMode(void *a1, const char *a2, ...)
{
  return [a1 isSingleMode];
}

id objc_msgSend_isStalled(void *a1, const char *a2, ...)
{
  return [a1 isStalled];
}

id objc_msgSend_isSubscribed(void *a1, const char *a2, ...)
{
  return [a1 isSubscribed];
}

id objc_msgSend_isSyncInProgress(void *a1, const char *a2, ...)
{
  return [a1 isSyncInProgress];
}

id objc_msgSend_isTaskRunning(void *a1, const char *a2, ...)
{
  return [a1 isTaskRunning];
}

id objc_msgSend_isTelephonyProvider(void *a1, const char *a2, ...)
{
  return [a1 isTelephonyProvider];
}

id objc_msgSend_isTemporary(void *a1, const char *a2, ...)
{
  return [a1 isTemporary];
}

id objc_msgSend_isTranscribing(void *a1, const char *a2, ...)
{
  return [a1 isTranscribing];
}

id objc_msgSend_isTranscriptionAvailable(void *a1, const char *a2, ...)
{
  return [a1 isTranscriptionAvailable];
}

id objc_msgSend_isValid(void *a1, const char *a2, ...)
{
  return [a1 isValid];
}

id objc_msgSend_isVoiceMailMWI(void *a1, const char *a2, ...)
{
  return [a1 isVoiceMailMWI];
}

id objc_msgSend_isWiFiNetworkAvailable(void *a1, const char *a2, ...)
{
  return [a1 isWiFiNetworkAvailable];
}

id objc_msgSend_isWiFiNetworkReachable(void *a1, const char *a2, ...)
{
  return [a1 isWiFiNetworkReachable];
}

id objc_msgSend_isWiFiNetworkSupported(void *a1, const char *a2, ...)
{
  return [a1 isWiFiNetworkSupported];
}

id objc_msgSend_isoCountryCode(void *a1, const char *a2, ...)
{
  return [a1 isoCountryCode];
}

id objc_msgSend_keyDescriptions(void *a1, const char *a2, ...)
{
  return [a1 keyDescriptions];
}

id objc_msgSend_keyEnumerator(void *a1, const char *a2, ...)
{
  return [a1 keyEnumerator];
}

id objc_msgSend_knownMessages(void *a1, const char *a2, ...)
{
  return [a1 knownMessages];
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return [a1 label];
}

id objc_msgSend_labelID(void *a1, const char *a2, ...)
{
  return [a1 labelID];
}

id objc_msgSend_labelUUIDToGreetingController(void *a1, const char *a2, ...)
{
  return [a1 labelUUIDToGreetingController];
}

id objc_msgSend_labelUUIDToService(void *a1, const char *a2, ...)
{
  return [a1 labelUUIDToService];
}

id objc_msgSend_languageDetectorResult(void *a1, const char *a2, ...)
{
  return [a1 languageDetectorResult];
}

id objc_msgSend_languageIDOperationCompletion(void *a1, const char *a2, ...)
{
  return [a1 languageIDOperationCompletion];
}

id objc_msgSend_languageIdentifier(void *a1, const char *a2, ...)
{
  return [a1 languageIdentifier];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_lastUsedConnectionTypeWasCellular(void *a1, const char *a2, ...)
{
  return [a1 lastUsedConnectionTypeWasCellular];
}

id objc_msgSend_lastUsedTime(void *a1, const char *a2, ...)
{
  return [a1 lastUsedTime];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_lengthInSeconds(void *a1, const char *a2, ...)
{
  return [a1 lengthInSeconds];
}

id objc_msgSend_library(void *a1, const char *a2, ...)
{
  return [a1 library];
}

id objc_msgSend_libraryID(void *a1, const char *a2, ...)
{
  return [a1 libraryID];
}

id objc_msgSend_loadHasStarted(void *a1, const char *a2, ...)
{
  return [a1 loadHasStarted];
}

id objc_msgSend_loadTranscriptionService(void *a1, const char *a2, ...)
{
  return [a1 loadTranscriptionService];
}

id objc_msgSend_localSenderIdentityUUID(void *a1, const char *a2, ...)
{
  return [a1 localSenderIdentityUUID];
}

id objc_msgSend_locale(void *a1, const char *a2, ...)
{
  return [a1 locale];
}

id objc_msgSend_localeForTranscriptionLanguage(void *a1, const char *a2, ...)
{
  return [a1 localeForTranscriptionLanguage];
}

id objc_msgSend_localeIdentifier(void *a1, const char *a2, ...)
{
  return [a1 localeIdentifier];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return [a1 lock];
}

id objc_msgSend_locked(void *a1, const char *a2, ...)
{
  return [a1 locked];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_longValue(void *a1, const char *a2, ...)
{
  return [a1 longValue];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return [a1 lowercaseString];
}

id objc_msgSend_mailboxGreetingType(void *a1, const char *a2, ...)
{
  return [a1 mailboxGreetingType];
}

id objc_msgSend_mailboxName(void *a1, const char *a2, ...)
{
  return [a1 mailboxName];
}

id objc_msgSend_mailboxRequiresSetup(void *a1, const char *a2, ...)
{
  return [a1 mailboxRequiresSetup];
}

id objc_msgSend_mailboxUid(void *a1, const char *a2, ...)
{
  return [a1 mailboxUid];
}

id objc_msgSend_mailboxUsage(void *a1, const char *a2, ...)
{
  return [a1 mailboxUsage];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return [a1 mainRunLoop];
}

id objc_msgSend_mambaID(void *a1, const char *a2, ...)
{
  return [a1 mambaID];
}

id objc_msgSend_matchLocaleForTranscriptionLanguage(void *a1, const char *a2, ...)
{
  return [a1 matchLocaleForTranscriptionLanguage];
}

id objc_msgSend_maximumPasswordLength(void *a1, const char *a2, ...)
{
  return [a1 maximumPasswordLength];
}

id objc_msgSend_message(void *a1, const char *a2, ...)
{
  return [a1 message];
}

id objc_msgSend_messageBody(void *a1, const char *a2, ...)
{
  return [a1 messageBody];
}

id objc_msgSend_messageCenter(void *a1, const char *a2, ...)
{
  return [a1 messageCenter];
}

id objc_msgSend_messageFlags(void *a1, const char *a2, ...)
{
  return [a1 messageFlags];
}

id objc_msgSend_messageIDHeader(void *a1, const char *a2, ...)
{
  return [a1 messageIDHeader];
}

id objc_msgSend_messageNotificationFallbackTimeout(void *a1, const char *a2, ...)
{
  return [a1 messageNotificationFallbackTimeout];
}

id objc_msgSend_messageStore(void *a1, const char *a2, ...)
{
  return [a1 messageStore];
}

id objc_msgSend_messages(void *a1, const char *a2, ...)
{
  return [a1 messages];
}

id objc_msgSend_methodSignature(void *a1, const char *a2, ...)
{
  return [a1 methodSignature];
}

id objc_msgSend_mimePartFinishedLoading(void *a1, const char *a2, ...)
{
  return [a1 mimePartFinishedLoading];
}

id objc_msgSend_mimeType(void *a1, const char *a2, ...)
{
  return [a1 mimeType];
}

id objc_msgSend_minimumPasswordLength(void *a1, const char *a2, ...)
{
  return [a1 minimumPasswordLength];
}

id objc_msgSend_monitor(void *a1, const char *a2, ...)
{
  return [a1 monitor];
}

id objc_msgSend_mutableAudioBufferList(void *a1, const char *a2, ...)
{
  return [a1 mutableAudioBufferList];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_networkObserver(void *a1, const char *a2, ...)
{
  return [a1 networkObserver];
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return [a1 nextObject];
}

id objc_msgSend_normalizedPhoneNumber(void *a1, const char *a2, ...)
{
  return [a1 normalizedPhoneNumber];
}

id objc_msgSend_notificationType(void *a1, const char *a2, ...)
{
  return [a1 notificationType];
}

id objc_msgSend_notifyDelegateAccountsDidChange(void *a1, const char *a2, ...)
{
  return [a1 notifyDelegateAccountsDidChange];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_numFailedAttemptsToSyncOverWifi(void *a1, const char *a2, ...)
{
  return [a1 numFailedAttemptsToSyncOverWifi];
}

id objc_msgSend_numberOfArguments(void *a1, const char *a2, ...)
{
  return [a1 numberOfArguments];
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return [a1 object];
}

id objc_msgSend_obtainInsomniaAssertion(void *a1, const char *a2, ...)
{
  return [a1 obtainInsomniaAssertion];
}

id objc_msgSend_operationCompletion(void *a1, const char *a2, ...)
{
  return [a1 operationCompletion];
}

id objc_msgSend_operations(void *a1, const char *a2, ...)
{
  return [a1 operations];
}

id objc_msgSend_password(void *a1, const char *a2, ...)
{
  return [a1 password];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return [a1 pathExtension];
}

id objc_msgSend_pendingRequest(void *a1, const char *a2, ...)
{
  return [a1 pendingRequest];
}

id objc_msgSend_performMigrationIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 performMigrationIfNecessary];
}

id objc_msgSend_phoneNumber(void *a1, const char *a2, ...)
{
  return [a1 phoneNumber];
}

id objc_msgSend_prepareForFlagChange(void *a1, const char *a2, ...)
{
  return [a1 prepareForFlagChange];
}

id objc_msgSend_primaryMailboxUid(void *a1, const char *a2, ...)
{
  return [a1 primaryMailboxUid];
}

id objc_msgSend_primaryTarget(void *a1, const char *a2, ...)
{
  return [a1 primaryTarget];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_progress(void *a1, const char *a2, ...)
{
  return [a1 progress];
}

id objc_msgSend_provider(void *a1, const char *a2, ...)
{
  return [a1 provider];
}

id objc_msgSend_pstnAddress(void *a1, const char *a2, ...)
{
  return [a1 pstnAddress];
}

id objc_msgSend_publicNetAllowed(void *a1, const char *a2, ...)
{
  return [a1 publicNetAllowed];
}

id objc_msgSend_queryAndInitVoicemailServices(void *a1, const char *a2, ...)
{
  return [a1 queryAndInitVoicemailServices];
}

id objc_msgSend_queryMetaDataSync(void *a1, const char *a2, ...)
{
  return [a1 queryMetaDataSync];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return [a1 queue];
}

id objc_msgSend_queuePriority(void *a1, const char *a2, ...)
{
  return [a1 queuePriority];
}

id objc_msgSend_range(void *a1, const char *a2, ...)
{
  return [a1 range];
}

id objc_msgSend_readBufferSize(void *a1, const char *a2, ...)
{
  return [a1 readBufferSize];
}

id objc_msgSend_receiverDestinationID(void *a1, const char *a2, ...)
{
  return [a1 receiverDestinationID];
}

id objc_msgSend_refreshIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 refreshIfNeeded];
}

id objc_msgSend_releaseAllConnections(void *a1, const char *a2, ...)
{
  return [a1 releaseAllConnections];
}

id objc_msgSend_releaseInsomniaAssertion(void *a1, const char *a2, ...)
{
  return [a1 releaseInsomniaAssertion];
}

id objc_msgSend_remainingBodyRetries(void *a1, const char *a2, ...)
{
  return [a1 remainingBodyRetries];
}

id objc_msgSend_remoteID(void *a1, const char *a2, ...)
{
  return [a1 remoteID];
}

id objc_msgSend_remoteUID(void *a1, const char *a2, ...)
{
  return [a1 remoteUID];
}

id objc_msgSend_removeActiveGreetingFlagFromAllUids(void *a1, const char *a2, ...)
{
  return [a1 removeActiveGreetingFlagFromAllUids];
}

id objc_msgSend_removeAllItems(void *a1, const char *a2, ...)
{
  return [a1 removeAllItems];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_removeAllRecords(void *a1, const char *a2, ...)
{
  return [a1 removeAllRecords];
}

id objc_msgSend_removeNetworkReachableObserver(void *a1, const char *a2, ...)
{
  return [a1 removeNetworkReachableObserver];
}

id objc_msgSend_removeServiceInformation(void *a1, const char *a2, ...)
{
  return [a1 removeServiceInformation];
}

id objc_msgSend_reportFailedToSyncOverWifi(void *a1, const char *a2, ...)
{
  return [a1 reportFailedToSyncOverWifi];
}

id objc_msgSend_reportSucessfulSync(void *a1, const char *a2, ...)
{
  return [a1 reportSucessfulSync];
}

id objc_msgSend_reportTranscriptionProgressReplyBlock(void *a1, const char *a2, ...)
{
  return [a1 reportTranscriptionProgressReplyBlock];
}

id objc_msgSend_reportVoicemailTranscriptionAttempted(void *a1, const char *a2, ...)
{
  return [a1 reportVoicemailTranscriptionAttempted];
}

id objc_msgSend_reportVoicemailTranscriptionCompleted(void *a1, const char *a2, ...)
{
  return [a1 reportVoicemailTranscriptionCompleted];
}

id objc_msgSend_reporter(void *a1, const char *a2, ...)
{
  return [a1 reporter];
}

id objc_msgSend_requestAssetModelInstallation(void *a1, const char *a2, ...)
{
  return [a1 requestAssetModelInstallation];
}

id objc_msgSend_requestDatabaseSanitization(void *a1, const char *a2, ...)
{
  return [a1 requestDatabaseSanitization];
}

id objc_msgSend_resetCounts(void *a1, const char *a2, ...)
{
  return [a1 resetCounts];
}

id objc_msgSend_resetDelayedSynchronizationAttemptCount(void *a1, const char *a2, ...)
{
  return [a1 resetDelayedSynchronizationAttemptCount];
}

id objc_msgSend_resetMessages(void *a1, const char *a2, ...)
{
  return [a1 resetMessages];
}

id objc_msgSend_resetNetworkSettings(void *a1, const char *a2, ...)
{
  return [a1 resetNetworkSettings];
}

id objc_msgSend_resetRetranscriptionTaskState(void *a1, const char *a2, ...)
{
  return [a1 resetRetranscriptionTaskState];
}

id objc_msgSend_resignCurrent(void *a1, const char *a2, ...)
{
  return [a1 resignCurrent];
}

id objc_msgSend_resultCode(void *a1, const char *a2, ...)
{
  return [a1 resultCode];
}

id objc_msgSend_results(void *a1, const char *a2, ...)
{
  return [a1 results];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_retainArguments(void *a1, const char *a2, ...)
{
  return [a1 retainArguments];
}

id objc_msgSend_retranscribeAllVoicemails(void *a1, const char *a2, ...)
{
  return [a1 retranscribeAllVoicemails];
}

id objc_msgSend_retryIntervals(void *a1, const char *a2, ...)
{
  return [a1 retryIntervals];
}

id objc_msgSend_reverseObjectEnumerator(void *a1, const char *a2, ...)
{
  return [a1 reverseObjectEnumerator];
}

id objc_msgSend_rumbaID(void *a1, const char *a2, ...)
{
  return [a1 rumbaID];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_save(void *a1, const char *a2, ...)
{
  return [a1 save];
}

id objc_msgSend_saveState(void *a1, const char *a2, ...)
{
  return [a1 saveState];
}

id objc_msgSend_scheduleAutomatedTrashCompaction(void *a1, const char *a2, ...)
{
  return [a1 scheduleAutomatedTrashCompaction];
}

id objc_msgSend_scheduleDelayedSynchronize(void *a1, const char *a2, ...)
{
  return [a1 scheduleDelayedSynchronize];
}

id objc_msgSend_selector(void *a1, const char *a2, ...)
{
  return [a1 selector];
}

id objc_msgSend_semaphore(void *a1, const char *a2, ...)
{
  return [a1 semaphore];
}

id objc_msgSend_senderDestinationID(void *a1, const char *a2, ...)
{
  return [a1 senderDestinationID];
}

id objc_msgSend_serialDispatchQueue(void *a1, const char *a2, ...)
{
  return [a1 serialDispatchQueue];
}

id objc_msgSend_serialQueue(void *a1, const char *a2, ...)
{
  return [a1 serialQueue];
}

id objc_msgSend_serverConnection(void *a1, const char *a2, ...)
{
  return [a1 serverConnection];
}

id objc_msgSend_service(void *a1, const char *a2, ...)
{
  return [a1 service];
}

id objc_msgSend_serviceAccount(void *a1, const char *a2, ...)
{
  return [a1 serviceAccount];
}

id objc_msgSend_serviceCenter(void *a1, const char *a2, ...)
{
  return [a1 serviceCenter];
}

id objc_msgSend_serviceICC(void *a1, const char *a2, ...)
{
  return [a1 serviceICC];
}

id objc_msgSend_serviceLabelID(void *a1, const char *a2, ...)
{
  return [a1 serviceLabelID];
}

id objc_msgSend_serviceMCC(void *a1, const char *a2, ...)
{
  return [a1 serviceMCC];
}

id objc_msgSend_serviceMDN(void *a1, const char *a2, ...)
{
  return [a1 serviceMDN];
}

id objc_msgSend_serviceMNC(void *a1, const char *a2, ...)
{
  return [a1 serviceMNC];
}

id objc_msgSend_serviceState(void *a1, const char *a2, ...)
{
  return [a1 serviceState];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_setLongLifeMessagesCache(void *a1, const char *a2, ...)
{
  return [a1 setLongLifeMessagesCache];
}

id objc_msgSend_setVoicemailReply(void *a1, const char *a2, ...)
{
  return [a1 setVoicemailReply];
}

id objc_msgSend_setupAirplaneModeCallback(void *a1, const char *a2, ...)
{
  return [a1 setupAirplaneModeCallback];
}

id objc_msgSend_setupMobileKeyBag(void *a1, const char *a2, ...)
{
  return [a1 setupMobileKeyBag];
}

id objc_msgSend_sharedCallStatusObserver(void *a1, const char *a2, ...)
{
  return [a1 sharedCallStatusObserver];
}

id objc_msgSend_sharedDaemon(void *a1, const char *a2, ...)
{
  return [a1 sharedDaemon];
}

id objc_msgSend_sharedGenericStore(void *a1, const char *a2, ...)
{
  return [a1 sharedGenericStore];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedMessageCenter(void *a1, const char *a2, ...)
{
  return [a1 sharedMessageCenter];
}

id objc_msgSend_sharedNetworkObserver(void *a1, const char *a2, ...)
{
  return [a1 sharedNetworkObserver];
}

id objc_msgSend_sharedPreferencesObserver(void *a1, const char *a2, ...)
{
  return [a1 sharedPreferencesObserver];
}

id objc_msgSend_sharedProtectionObserver(void *a1, const char *a2, ...)
{
  return [a1 sharedProtectionObserver];
}

id objc_msgSend_shouldCancel(void *a1, const char *a2, ...)
{
  return [a1 shouldCancel];
}

id objc_msgSend_shouldImmediatelyRetrySyncOverCellular(void *a1, const char *a2, ...)
{
  return [a1 shouldImmediatelyRetrySyncOverCellular];
}

id objc_msgSend_shouldRunTranscriptionTask(void *a1, const char *a2, ...)
{
  return [a1 shouldRunTranscriptionTask];
}

id objc_msgSend_shouldScheduleAutoTrashOnMailboxUsageChange(void *a1, const char *a2, ...)
{
  return [a1 shouldScheduleAutoTrashOnMailboxUsageChange];
}

id objc_msgSend_slotID(void *a1, const char *a2, ...)
{
  return [a1 slotID];
}

id objc_msgSend_speechAnalyzer(void *a1, const char *a2, ...)
{
  return [a1 speechAnalyzer];
}

id objc_msgSend_speechAnalyzerOperationQueue(void *a1, const char *a2, ...)
{
  return [a1 speechAnalyzerOperationQueue];
}

id objc_msgSend_speechAssetsOnDevice(void *a1, const char *a2, ...)
{
  return [a1 speechAssetsOnDevice];
}

id objc_msgSend_speechAssetsWithConfidenceModelsOnDevice(void *a1, const char *a2, ...)
{
  return [a1 speechAssetsWithConfidenceModelsOnDevice];
}

id objc_msgSend_speechRecognitionRequest(void *a1, const char *a2, ...)
{
  return [a1 speechRecognitionRequest];
}

id objc_msgSend_speechRecognizer(void *a1, const char *a2, ...)
{
  return [a1 speechRecognizer];
}

id objc_msgSend_speechURLRecognitionRequest(void *a1, const char *a2, ...)
{
  return [a1 speechURLRecognitionRequest];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_startObservingNetworkSync(void *a1, const char *a2, ...)
{
  return [a1 startObservingNetworkSync];
}

id objc_msgSend_startReading(void *a1, const char *a2, ...)
{
  return [a1 startReading];
}

id objc_msgSend_startXpc(void *a1, const char *a2, ...)
{
  return [a1 startXpc];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_stateRequestAttemptCount(void *a1, const char *a2, ...)
{
  return [a1 stateRequestAttemptCount];
}

id objc_msgSend_stateRequestController(void *a1, const char *a2, ...)
{
  return [a1 stateRequestController];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return [a1 status];
}

id objc_msgSend_stopObservingNetworkSync(void *a1, const char *a2, ...)
{
  return [a1 stopObservingNetworkSync];
}

id objc_msgSend_store(void *a1, const char *a2, ...)
{
  return [a1 store];
}

id objc_msgSend_storeClass(void *a1, const char *a2, ...)
{
  return [a1 storeClass];
}

id objc_msgSend_stringByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingLastPathComponent];
}

id objc_msgSend_stringByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingPathExtension];
}

id objc_msgSend_strongToWeakObjectsMapTable(void *a1, const char *a2, ...)
{
  return [a1 strongToWeakObjectsMapTable];
}

id objc_msgSend_subparts(void *a1, const char *a2, ...)
{
  return [a1 subparts];
}

id objc_msgSend_subscription(void *a1, const char *a2, ...)
{
  return [a1 subscription];
}

id objc_msgSend_subscriptions(void *a1, const char *a2, ...)
{
  return [a1 subscriptions];
}

id objc_msgSend_subscriptionsValid(void *a1, const char *a2, ...)
{
  return [a1 subscriptionsValid];
}

id objc_msgSend_subtype(void *a1, const char *a2, ...)
{
  return [a1 subtype];
}

id objc_msgSend_summarizationMetaDataURL(void *a1, const char *a2, ...)
{
  return [a1 summarizationMetaDataURL];
}

id objc_msgSend_supportsDetachedStorage(void *a1, const char *a2, ...)
{
  return [a1 supportsDetachedStorage];
}

id objc_msgSend_supportsOnDeviceRecognition(void *a1, const char *a2, ...)
{
  return [a1 supportsOnDeviceRecognition];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return [a1 synchronize];
}

id objc_msgSend_synchronizeRecordFlags(void *a1, const char *a2, ...)
{
  return [a1 synchronizeRecordFlags];
}

id objc_msgSend_taskName(void *a1, const char *a2, ...)
{
  return [a1 taskName];
}

id objc_msgSend_telephonyClient(void *a1, const char *a2, ...)
{
  return [a1 telephonyClient];
}

id objc_msgSend_telephonyService(void *a1, const char *a2, ...)
{
  return [a1 telephonyService];
}

id objc_msgSend_threadDictionary(void *a1, const char *a2, ...)
{
  return [a1 threadDictionary];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSince1970];
}

id objc_msgSend_timestamp(void *a1, const char *a2, ...)
{
  return [a1 timestamp];
}

id objc_msgSend_topLevelPart(void *a1, const char *a2, ...)
{
  return [a1 topLevelPart];
}

id objc_msgSend_totalExpected(void *a1, const char *a2, ...)
{
  return [a1 totalExpected];
}

id objc_msgSend_totalUnitCount(void *a1, const char *a2, ...)
{
  return [a1 totalUnitCount];
}

id objc_msgSend_totalWritten(void *a1, const char *a2, ...)
{
  return [a1 totalWritten];
}

id objc_msgSend_transcribeOperationBeginCallback(void *a1, const char *a2, ...)
{
  return [a1 transcribeOperationBeginCallback];
}

id objc_msgSend_transcribeOperationCompletion(void *a1, const char *a2, ...)
{
  return [a1 transcribeOperationCompletion];
}

id objc_msgSend_transcript(void *a1, const char *a2, ...)
{
  return [a1 transcript];
}

id objc_msgSend_transcriptionController(void *a1, const char *a2, ...)
{
  return [a1 transcriptionController];
}

id objc_msgSend_transcriptionEnabled(void *a1, const char *a2, ...)
{
  return [a1 transcriptionEnabled];
}

id objc_msgSend_transcriptionLanguageCodes(void *a1, const char *a2, ...)
{
  return [a1 transcriptionLanguageCodes];
}

id objc_msgSend_transcriptionOperationQueue(void *a1, const char *a2, ...)
{
  return [a1 transcriptionOperationQueue];
}

id objc_msgSend_transcriptionProgress(void *a1, const char *a2, ...)
{
  return [a1 transcriptionProgress];
}

id objc_msgSend_transcriptionService(void *a1, const char *a2, ...)
{
  return [a1 transcriptionService];
}

id objc_msgSend_transcriptionTask(void *a1, const char *a2, ...)
{
  return [a1 transcriptionTask];
}

id objc_msgSend_transcriptionURL(void *a1, const char *a2, ...)
{
  return [a1 transcriptionURL];
}

id objc_msgSend_trashCompactionAge(void *a1, const char *a2, ...)
{
  return [a1 trashCompactionAge];
}

id objc_msgSend_trashedCount(void *a1, const char *a2, ...)
{
  return [a1 trashedCount];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_uid(void *a1, const char *a2, ...)
{
  return [a1 uid];
}

id objc_msgSend_unarchivedObjectClasses(void *a1, const char *a2, ...)
{
  return [a1 unarchivedObjectClasses];
}

id objc_msgSend_underlyingQueue(void *a1, const char *a2, ...)
{
  return [a1 underlyingQueue];
}

id objc_msgSend_unloadTranscriptionService(void *a1, const char *a2, ...)
{
  return [a1 unloadTranscriptionService];
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return [a1 unlock];
}

id objc_msgSend_unreadCount(void *a1, const char *a2, ...)
{
  return [a1 unreadCount];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongValue];
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return [a1 url];
}

id objc_msgSend_userDefaultVoiceSubscriptionContext(void *a1, const char *a2, ...)
{
  return [a1 userDefaultVoiceSubscriptionContext];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return [a1 username];
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return [a1 uuid];
}

id objc_msgSend_values(void *a1, const char *a2, ...)
{
  return [a1 values];
}

id objc_msgSend_verifier(void *a1, const char *a2, ...)
{
  return [a1 verifier];
}

id objc_msgSend_voicePreferred(void *a1, const char *a2, ...)
{
  return [a1 voicePreferred];
}

id objc_msgSend_voicemailClientXPCInterface(void *a1, const char *a2, ...)
{
  return [a1 voicemailClientXPCInterface];
}

id objc_msgSend_voicemailServerXPCInterface(void *a1, const char *a2, ...)
{
  return [a1 voicemailServerXPCInterface];
}

id objc_msgSend_voicemailService(void *a1, const char *a2, ...)
{
  return [a1 voicemailService];
}

id objc_msgSend_wasDeviceRestart(void *a1, const char *a2, ...)
{
  return [a1 wasDeviceRestart];
}

id objc_msgSend_weakToStrongObjectsMapTable(void *a1, const char *a2, ...)
{
  return [a1 weakToStrongObjectsMapTable];
}

id objc_msgSend_weakToWeakObjectsMapTable(void *a1, const char *a2, ...)
{
  return [a1 weakToWeakObjectsMapTable];
}

id objc_msgSend_writeDataIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 writeDataIfNeeded];
}

id objc_msgSend_writeToURL_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToURL:options:error:");
}