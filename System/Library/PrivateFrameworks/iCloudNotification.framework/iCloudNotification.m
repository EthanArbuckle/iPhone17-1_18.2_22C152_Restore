id sub_100003B28(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint8_t v5[16];

  v2 = _INLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Finished reconsidering iCloud offers.", v5, 2u);
  }

  v3 = *(void *)(a1 + 48);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }
  return [*(id *)(a1 + 32) setReconsideringOffers:0];
}

void sub_100003BB4(id a1)
{
  v1 = _INLogSystem();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Client connection interrupted/invalidated.", v2, 2u);
  }
}

uint64_t sub_100003D34()
{
  if (qword_10004E480 != -1) {
    dispatch_once(&qword_10004E480, &stru_1000412E0);
  }
  return byte_10004E478;
}

id sub_1000041E0(uint64_t a1)
{
  v2 = _INLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "ICQ notification about persitance change received, time to revalidate our activities...", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_unsafe_ensureFreshmintActivityValidity");
}

void sub_100004254(uint64_t a1)
{
  v2 = _INLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) activityID];
    int v4 = 136315138;
    id v5 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Stopping activity... %s", (uint8_t *)&v4, 0xCu);
  }

  xpc_activity_unregister((const char *)[*(id *)(a1 + 32) activityID]);
}

void sub_100005028(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,char a42)
{
}

int64_t sub_10000504C(id a1, id a2, id a3)
{
  return (int64_t)[a2 compare:a3];
}

void sub_100005160(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = _INLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100026214((uint64_t)v6, v7);
    }
  }
  else
  {
    if (![v5 count]) {
      goto LABEL_5;
    }
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v7 = v5;
    id v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v8)
    {
      id v9 = v8;
      v17 = 0;
      id v18 = v5;
      uint64_t v10 = *(void *)v20;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v20 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          id v13 = objc_alloc_init((Class)NSMutableDictionary);
          v14 = [v12 systemSerialNumber];
          if (v14) {
            [v13 setObject:v14 forKeyedSubscript:@"systemSerialNumber"];
          }
          v15 = objc_msgSend(v12, "leftSerialNumber", v17, v18, (void)v19);
          if (v15) {
            [v13 setObject:v15 forKeyedSubscript:@"leftSerialNumber"];
          }
          v16 = [v12 rightSerialNumber];
          if (v16) {
            [v13 setObject:v16 forKeyedSubscript:@"rightSerialNumber"];
          }
          [*(id *)(a1 + 32) addObject:v13];
        }
        id v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v9);
      id v6 = v17;
      id v5 = v18;
    }
  }

LABEL_5:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

Class sub_100005384(uint64_t a1)
{
  sub_1000053DC();
  Class result = objc_getClass("NRPairedDeviceRegistry");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_10004E440 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    sub_10002628C();
    return (Class)sub_1000053DC();
  }
  return result;
}

uint64_t sub_1000053DC()
{
  v3[0] = 0;
  if (!qword_10004E448)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = 3221225472;
    v3[3] = sub_1000054DC;
    v3[4] = &unk_100040D98;
    v3[5] = v3;
    long long v4 = off_100040D80;
    uint64_t v5 = 0;
    qword_10004E448 = _sl_dlopen();
  }
  uint64_t v0 = qword_10004E448;
  v1 = (void *)v3[0];
  if (!qword_10004E448)
  {
    v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t sub_1000054DC()
{
  uint64_t result = _sl_dlopen();
  qword_10004E448 = result;
  return result;
}

void *sub_100005550(uint64_t a1)
{
  v2 = (void *)sub_1000053DC();
  uint64_t result = dlsym(v2, "NRDevicePropertyUDID");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_10004E450 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_100005CF4(id a1, BOOL a2, NSError *a3)
{
  BOOL v3 = a2;
  long long v4 = a3;
  uint64_t v5 = _INLogSystem();
  id v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Successfully handled terms push message!", v7, 2u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    sub_1000265BC();
  }
}

void sub_100005EC4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = _INLogSystem();
  id v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Successfully updated properties for account %@", (uint8_t *)&v10, 0xCu);
    }

    id v9 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100026624((uint64_t)v6, v8);
    }

    id v9 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v9();
}

void sub_100005FEC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1000062C8(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = _INLogSystem();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100026808(v4, v6);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_1000267C4(v6);
    }

    v7 = objc_msgSend(*(id *)(a1 + 32), "aa_appleAccountWithAltDSID:", *(void *)(a1 + 40));
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void sub_100006540(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [INStorageSummaryResponse alloc];
  uint64_t v9 = [v7 httpResponse];
  int v10 = [v7 data];

  id v11 = [(INStorageSummaryResponse *)v8 initWithHTTPResponse:v9 data:v10];
  if (v6)
  {
    id v12 = v6;
LABEL_4:
    id v13 = _INLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100026958();
    }

    v14 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    goto LABEL_7;
  }
  id v12 = [(INStorageSummaryResponse *)v11 error];
  if (v12) {
    goto LABEL_4;
  }
  v15 = _INLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    sub_100026924();
  }

  v16 = _INLogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    sub_1000268A0(v11);
  }

  uint64_t v17 = *(void *)(a1 + 32);
  id v12 = [(INStorageSummaryResponse *)v11 cloudStorageSummary];
  v14 = *(void (**)(void))(v17 + 16);
LABEL_7:
  v14();
}

void sub_1000067BC(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [INStorageAppsResponse alloc];
  uint64_t v9 = [v7 httpResponse];
  int v10 = [v7 data];

  id v11 = [(INStorageAppsResponse *)v8 initWithHTTPResponse:v9 data:v10];
  if (v6)
  {
    id v12 = v6;
LABEL_4:
    id v13 = _INLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100026A78();
    }

    v14 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    goto LABEL_7;
  }
  id v12 = [(INStorageAppsResponse *)v11 error];
  if (v12) {
    goto LABEL_4;
  }
  v15 = _INLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    sub_100026A44();
  }

  v16 = _INLogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    sub_1000269C0(v11);
  }

  uint64_t v17 = *(void *)(a1 + 32);
  id v12 = [(INStorageAppsResponse *)v11 cloudStorageApps];
  v14 = *(void (**)(void))(v17 + 16);
LABEL_7:
  v14();
}

void sub_100006A24(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [INStorageByAppResponse alloc];
  uint64_t v9 = [v7 httpResponse];
  int v10 = [v7 data];

  id v11 = [(INStorageByAppResponse *)v8 initWithHTTPResponse:v9 data:v10];
  if (v6)
  {
    id v12 = v6;
LABEL_4:
    id v13 = _INLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100026B98();
    }

    v14 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    goto LABEL_7;
  }
  id v12 = [(INStorageByAppResponse *)v11 error];
  if (v12) {
    goto LABEL_4;
  }
  v15 = _INLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    sub_100026B64();
  }

  v16 = _INLogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    sub_100026AE0(v11);
  }

  uint64_t v17 = *(void *)(a1 + 32);
  id v12 = [(INStorageByAppResponse *)v11 appCloudStorage];
  v14 = *(void (**)(void))(v17 + 16);
LABEL_7:
  v14();
}

void sub_100006CA0(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [INCloudBackupInfoResponse alloc];
  uint64_t v9 = [v7 httpResponse];
  int v10 = [v7 data];

  id v11 = [(INCloudBackupInfoResponse *)v8 initWithHTTPResponse:v9 data:v10];
  if (v6)
  {
    id v12 = v6;
LABEL_4:
    id v13 = _INLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100026CB8();
    }

    v14 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    goto LABEL_7;
  }
  id v12 = [(INCloudBackupInfoResponse *)v11 error];
  if (v12) {
    goto LABEL_4;
  }
  v15 = _INLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    sub_100026C84();
  }

  v16 = _INLogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    sub_100026C00(v11);
  }

  uint64_t v17 = *(void *)(a1 + 32);
  id v12 = [(INCloudBackupInfoResponse *)v11 backupInfo];
  v14 = *(void (**)(void))(v17 + 16);
LABEL_7:
  v14();
}

void sub_100006FFC(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [INTipNetworkResponse alloc];
  uint64_t v9 = [v7 httpResponse];
  int v10 = [v7 data];

  id v11 = [(INTipNetworkResponse *)v8 initWithHTTPResponse:v9 data:v10];
  if (v6)
  {
    id v12 = v6;
    goto LABEL_4;
  }
  id v12 = [(INTipNetworkResponse *)v11 error];
  if (v12)
  {
LABEL_4:
    id v13 = _INLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100026DC8();
    }
    goto LABEL_6;
  }
  v14 = _INLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    sub_100026D94();
  }

  id v13 = _INLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    sub_100026D20();
  }
  id v12 = 0;
LABEL_6:

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000071F0(uint64_t a1)
{
  id v1 = [objc_alloc((Class)MBManager) initWithAccount:*(void *)(*(void *)(a1 + 32) + 8) delegate:0 eventQueue:0];
  uint64_t v2 = [v1 backupDeviceUUID];
  BOOL v3 = (void *)qword_10004E458;
  qword_10004E458 = v2;

  id v4 = _INLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_100026E30(v4);
  }
}

void sub_10000733C(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [INAppsSyncingToDriveResponse alloc];
  uint64_t v9 = [v7 httpResponse];
  int v10 = [v7 data];

  id v11 = [(INAppsSyncingToDriveResponse *)v8 initWithHTTPResponse:v9 data:v10];
  if (v6)
  {
    id v12 = v6;
LABEL_4:
    id v13 = _INLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100026F6C();
    }

    v14 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    goto LABEL_7;
  }
  id v12 = [(INAppsSyncingToDriveResponse *)v11 error];
  if (v12) {
    goto LABEL_4;
  }
  v15 = _INLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    sub_100026F38();
  }

  v16 = _INLogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    sub_100026EB4(v11);
  }

  uint64_t v17 = *(void *)(a1 + 32);
  id v12 = [(INAppsSyncingToDriveResponse *)v11 appsSyncingToDrive];
  v14 = *(void (**)(void))(v17 + 16);
LABEL_7:
  v14();
}

void sub_10000758C(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [INRecommendationsResponse alloc];
  uint64_t v9 = [v6 httpResponse];
  int v10 = [v6 data];
  id v11 = [(INRecommendationsResponse *)v8 initWithHTTPResponse:v9 data:v10];

  if (v7)
  {
    id v12 = v7;
LABEL_4:
    id v13 = _INLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10002708C();
    }

    v14 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    goto LABEL_7;
  }
  id v12 = [v6 error];
  if (v12) {
    goto LABEL_4;
  }
  v15 = _INLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    sub_100027058();
  }

  v16 = _INLogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    sub_100026FD4(v11);
  }

  uint64_t v17 = *(void *)(a1 + 32);
  id v12 = [(INRecommendationsResponse *)v11 serverRecommendations];
  v14 = *(void (**)(void))(v17 + 16);
LABEL_7:
  v14();
}

void sub_1000077D8(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [INRulesetResponse alloc];
  uint64_t v9 = [v6 httpResponse];
  int v10 = [v6 data];
  id v11 = [(INRulesetResponse *)v8 initWithHTTPResponse:v9 data:v10];

  if (v7)
  {
    id v12 = v7;
LABEL_4:
    id v13 = _INLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1000271AC();
    }

    v14 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    goto LABEL_7;
  }
  id v12 = [v6 error];
  if (v12) {
    goto LABEL_4;
  }
  v15 = _INLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    sub_100027178();
  }

  v16 = _INLogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    sub_1000270F4(v11);
  }

  uint64_t v17 = *(void *)(a1 + 32);
  id v12 = [(INRulesetResponse *)v11 ruleConfiguration];
  v14 = *(void (**)(void))(v17 + 16);
LABEL_7:
  v14();
}

void sub_100007A3C(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [INRecommendationsResponse alloc];
  uint64_t v9 = [v6 httpResponse];
  int v10 = [v6 data];
  id v11 = [(INRecommendationsResponse *)v8 initWithHTTPResponse:v9 data:v10];

  if (v7)
  {
    id v12 = v7;
LABEL_4:
    id v13 = _INLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1000272CC();
    }

    v14 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    goto LABEL_7;
  }
  id v12 = [v6 error];
  if (v12) {
    goto LABEL_4;
  }
  v15 = _INLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    sub_100027298();
  }

  v16 = _INLogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    sub_100027214(v11);
  }

  uint64_t v17 = *(void *)(a1 + 32);
  id v12 = [(INRecommendationsResponse *)v11 serverRecommendations];
  v14 = *(void (**)(void))(v17 + 16);
LABEL_7:
  v14();
}

void sub_100007C6C(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [INRecommendationsActionsResponse alloc];
  uint64_t v9 = [v6 httpResponse];
  int v10 = [v6 data];
  id v11 = [(INRecommendationsActionsResponse *)v8 initWithHTTPResponse:v9 data:v10];

  if (v7)
  {
    id v12 = v7;
LABEL_4:
    id v13 = _INLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1000273B8();
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    goto LABEL_7;
  }
  id v12 = [v6 error];
  if (v12) {
    goto LABEL_4;
  }
  v14 = _INLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    sub_100027334(v11);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
LABEL_7:
}

void sub_100008084(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_1000080A4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

id sub_100008324(uint64_t a1)
{
  return [*(id *)(a1 + 32) _configureXPCActivityWithCriteria:0];
}

void sub_10000844C(uint64_t a1)
{
  uint64_t v2 = _INLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) activityID];
    int v14 = 136315138;
    id v15 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Ensuring timer for activity... %s", (uint8_t *)&v14, 0xCu);
  }

  id v4 = +[INManagedDefaults sharedInstance];
  id v5 = [*(id *)(a1 + 32) activityNextFireDateKey];
  id v6 = [v4 valueForManagedDefault:v5];

  if (v6)
  {
    [v6 doubleValue];
    id v7 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
    if ([v7 compare:*(void *)(a1 + 40)] == (id)1)
    {
      id v8 = _INLogSystem();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        sub_10002757C((void **)(a1 + 32));
      }
    }
    else
    {
      uint64_t v10 = +[NSDate date];
      id v11 = [v7 compare:v10];

      id v12 = _INLogSystem();
      id v8 = v12;
      if (v11 != (id)-1)
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
          sub_1000275F0((uint64_t)v7, (id *)(a1 + 32));
        }

        goto LABEL_15;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = [*(id *)(a1 + 32) activityID];
        int v14 = 138412546;
        id v15 = v7;
        __int16 v16 = 2080;
        id v17 = v13;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "It looks like we missed an activity scheduled for %@! id=%s", (uint8_t *)&v14, 0x16u);
      }
    }

    [*(id *)(a1 + 32) _scheduleNextFireForDate:*(void *)(a1 + 40)];
LABEL_15:

    goto LABEL_16;
  }
  uint64_t v9 = _INLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_100027508((void **)(a1 + 32));
  }

  [*(id *)(a1 + 32) _scheduleNextFireForDate:*(void *)(a1 + 40)];
LABEL_16:
}

void sub_10000885C(uint64_t a1, void *a2)
{
  id v3 = a2;
  xpc_activity_state_t state = xpc_activity_get_state(v3);
  id v5 = _INLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1000278D0(a1);
  }

  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(NSObject **)(v6 + 32);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100008954;
  v9[3] = &unk_100040F18;
  v9[4] = v6;
  uint64_t v10 = v3;
  xpc_activity_state_t v12 = state;
  id v11 = *(id *)(a1 + 40);
  id v8 = v3;
  dispatch_async(v7, v9);
}

void sub_100008954(uint64_t a1)
{
  uint64_t v2 = a1 + 32;
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), *(id *)(a1 + 40));
  if (*(void *)(v2 + 24) == 2)
  {
    if (*(void *)(*(void *)v2 + 8))
    {
      if (*(void *)(*(void *)v2 + 16))
      {
        id v3 = _INLogSystem();
        if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
          sub_100027A38((void **)v2);
        }

        if (*(void *)(*(void *)v2 + 16)) {
          uint64_t v4 = *(void *)(*(void *)v2 + 16);
        }
        else {
          uint64_t v4 = 0;
        }
        uint64_t v6 = [*(id *)(*(void *)v2 + 8) methodSignatureForSelector:v4];
        id v7 = +[NSInvocation invocationWithMethodSignature:v6];
        [v7 setTarget:*(void *)(*(void *)v2 + 8)];
        if (*(void *)(*(void *)v2 + 16)) {
          uint64_t v8 = *(void *)(*(void *)v2 + 16);
        }
        else {
          uint64_t v8 = 0;
        }
        [v7 setSelector:v8];
        [v7 invoke];
      }
      else
      {
        uint64_t v6 = _INLogSystem();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
          sub_1000279C4((void **)v2);
        }
      }
    }
    else
    {
      uint64_t v6 = _INLogSystem();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_100027950((void **)v2);
      }
    }
  }
  else if (*(void *)(a1 + 48))
  {
    id v5 = _INLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_100027AAC((void **)v2);
    }

    xpc_activity_set_criteria(*(xpc_activity_t *)(*(void *)(a1 + 32) + 24), *(xpc_object_t *)(a1 + 48));
  }
}

void sub_100008ECC(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

id sub_100008EEC(void **a1)
{
  uint64_t v2 = *a1;
  return [v2 activityID];
}

void sub_100008F04(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100009704(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = [*(id *)(a1 + 32) _parseTip:v3];
    [*(id *)(a1 + 40) addObject:v4];
  }
  else
  {
    id v5 = _INLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100027D84();
    }
  }
}

void sub_100009B58(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = *(void **)(a1 + 32);
    id v5 = [*(id *)(a1 + 40) _parseTipAction:v3];
    [v4 addObject:v5];
  }
  else
  {
    id v5 = _INLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100027EA4();
    }
  }
}

void sub_10000A1A4(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

void sub_10000A538(uint64_t a1, void *a2)
{
  id v5 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = [*(id *)(a1 + 40) _parseSpecifierInfo:v5];
    [v3 addObject:v4];
  }
}

void sub_10000AA84(uint64_t a1, void *a2)
{
  id v5 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = [*(id *)(a1 + 40) _parseiCloudPlusFeature:v5];
    [v3 addObject:v4];
  }
}

void sub_10000AB08(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [objc_alloc((Class)ICQConfirmationActionInfo) initFromDictionary:v4];
    [*(id *)(a1 + 32) addObject:v3];
  }
}

void sub_10000BE18(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init((Class)ICQBackupDeviceGroup);
  id v5 = [v3 objectForKeyedSubscript:@"title"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v4 setSectionHeader:v5];
  }
  uint64_t v6 = [v3 objectForKeyedSubscript:@"footer"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v4 setSectionFooter:v6];
  }
  id v7 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v8 = [v3 objectForKeyedSubscript:@"deviceBackups"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    xpc_activity_state_t v12 = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472;
    int v14 = sub_10000BFD4;
    id v15 = &unk_100040F68;
    id v9 = v7;
    uint64_t v10 = *(void *)(a1 + 32);
    id v16 = v9;
    uint64_t v17 = v10;
    [v8 enumerateObjectsUsingBlock:&v12];
  }
  id v11 = objc_msgSend(v7, "copy", v12, v13, v14, v15);
  [v4 setBackupDevices:v11];

  [*(id *)(a1 + 40) addObject:v4];
}

void sub_10000BFD4(uint64_t a1, void *a2)
{
  id v5 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = [*(id *)(a1 + 40) _parseBackUpDevice:v5];
    [v3 addObject:v4];
  }
}

void sub_10000C94C(id a1, id a2, unint64_t a3, BOOL *a4)
{
  id v4 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v6 = _INLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10002877C();
    }
    goto LABEL_14;
  }
  if (![v4 isEqualToString:@"featuresCache"])
  {
    unsigned int v7 = [v4 isEqualToString:@"offersCache"];
    uint64_t v8 = _INLogSystem();
    uint64_t v6 = v8;
    if (v7)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v9 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Cleaning offers cache.", v9, 2u);
      }

      uint64_t v6 = +[ICQDaemonOfferManager sharedDaemonOfferManager];
      [v6 teardownCachedOffers];
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      sub_100028714();
    }
LABEL_14:

    goto LABEL_15;
  }
  id v5 = _INLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Cleaning features cache.", buf, 2u);
  }

  +[CSFFeatureManager clearCacheAndNotify];
LABEL_15:
}

void sub_10000CAD4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_10000CB64(id a1)
{
  qword_10004E468 = objc_alloc_init(INRegistrationDigestCache);
  _objc_release_x1();
}

void sub_10000CC94(uint64_t a1)
{
  id v2 = +[NSNotificationCenter defaultCenter];
  [v2 postNotificationName:@"INRegistrationDigestCacheDidBecomeAvailable" object:*(void *)(a1 + 32)];
}

void sub_10000CE94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000CEAC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000CEBC(uint64_t a1)
{
}

void sub_10000CEC4(uint64_t a1)
{
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 4, 0, 0);
  CFDictionaryAddValue(Mutable, kSecClass, kSecClassGenericPassword);
  CFDictionaryAddValue(Mutable, kSecAttrAccount, *(const void **)(a1 + 32));
  CFDictionaryAddValue(Mutable, kSecAttrService, @"com.apple.ind.registration");
  CFDictionaryAddValue(Mutable, kSecReturnData, kCFBooleanTrue);
  CFTypeRef result = 0;
  if (SecItemCopyMatching(Mutable, &result))
  {
    id v3 = _INLogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_1000287E4();
    }

    if (*(void *)(a1 + 56))
    {
      INCreateErrorWithKeychainError();
      **(void **)(a1 + 56) = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else if (result)
  {
    id v4 = [INRegistrationDigest alloc];
    id v5 = [(INRegistrationDigest *)v4 initWithData:result];
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    unsigned int v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    CFRelease(result);
  }
  CFRelease(Mutable);
}

void sub_10000D140(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000D158(uint64_t a1)
{
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 3, 0, 0);
  CFDictionaryAddValue(Mutable, kSecClass, kSecClassGenericPassword);
  CFDictionaryAddValue(Mutable, kSecAttrAccount, *(const void **)(a1 + 32));
  CFDictionaryAddValue(Mutable, kSecAttrService, @"com.apple.ind.registration");
  OSStatus v3 = SecItemDelete(Mutable);
  if (v3)
  {
    OSStatus v4 = v3;
    id v5 = _INLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000287E4();
    }

    if (v4 != -25300 && *(void *)(a1 + 56))
    {
      INCreateErrorWithKeychainError();
      **(void **)(a1 + 56) = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  CFRelease(Mutable);
}

void sub_10000D3B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000D3CC(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) data];
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 3, 0, 0);
  CFDictionaryAddValue(Mutable, kSecClass, kSecClassGenericPassword);
  CFDictionaryAddValue(Mutable, kSecAttrAccount, *(const void **)(a1 + 40));
  CFDictionaryAddValue(Mutable, kSecAttrService, @"com.apple.ind.registration");
  CFDictionaryAddValue(Mutable, kSecAttrAccessible, kSecAttrAccessibleAfterFirstUnlock);
  OSStatus v4 = CFDictionaryCreateMutable(kCFAllocatorDefault, 1, 0, 0);
  CFDictionaryAddValue(v4, kSecValueData, v2);
  OSStatus v5 = SecItemUpdate(Mutable, v4);
  if (!v5) {
    goto LABEL_6;
  }
  if (v5 == -25300)
  {
    uint64_t v6 = _INLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "No existing item. Creating a new one.", v8, 2u);
    }

    CFDictionaryAddValue(Mutable, kSecValueData, v2);
    if (!SecItemAdd(Mutable, 0)) {
LABEL_6:
    }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    unsigned int v7 = _INLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100028850();
    }

    if (*(void *)(a1 + 64))
    {
      INCreateErrorWithKeychainError();
      **(void **)(a1 + 64) = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  CFRelease(v4);
  CFRelease(Mutable);
}

void sub_10000D614(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x12u);
}

uint64_t start()
{
  uint64_t v1 = _INLogSystem();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "ind reporting for duty!", buf, 2u);
  }

  id v2 = +[INDaemon sharedInstance];
  [v2 start];

  if (MGGetSInt32Answer() == 7)
  {
    OSStatus v3 = _INLogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "The platform detected as HomePod, Skipping CSF.", v8, 2u);
    }
  }
  else
  {
    OSStatus v3 = +[FeaturesDaemon sharedInstance];
    [v3 start];
  }

  uint64_t v4 = +[NSRunLoop mainRunLoop];
  [v4 run];

  OSStatus v5 = _INLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "ind is shutting down!", v7, 2u);
  }

  return 0;
}

id sub_10000E7BC(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setAccount:a2];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  v6.receiver = *(id *)(a1 + 32);
  v6.super_class = (Class)INRenewingRequest;
  return objc_msgSendSuper2(&v6, "performRequestWithSession:withHandler:", v3, v4);
}

void sub_10000FC64(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  unsigned int v7 = _INLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_100029374(v5, v7);
  }

  [*(id *)(a1 + 32) _handleRegistrationResponse:v5 forRequest:v6 digest:*(void *)(a1 + 40) account:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

void sub_100010230(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = _INLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1000295C4(v4, v5);
  }

  [*(id *)(a1 + 32) _handleUnregistrationResponse:v4 account:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

void sub_100010818(id a1)
{
  byte_10004E478 = MGGetSInt32Answer() != 7;
}

void sub_1000108A0(id a1)
{
  qword_10004E488 = objc_alloc_init(INDaemon_iOS);
  _objc_release_x1();
}

id sub_100010D18(uint64_t a1)
{
  return [*(id *)(a1 + 32) _validateRegistrationStateIfFirstLaunch];
}

void sub_100010F04(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_100010F20(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained apsConnection];

    if (!v4)
    {
      id v5 = _INLogSystem();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_1000298B8(v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
    uint64_t v13 = [v3 apsConnection];
    int v14 = [v13 publicToken];

    if (v14)
    {
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_100011250;
      v33[3] = &unk_100041378;
      id v15 = v3;
      id v34 = v15;
      id v35 = *(id *)(a1 + 32);
      id v16 = v14;
      uint64_t v17 = *(void *)(a1 + 64);
      id v36 = v16;
      uint64_t v38 = v17;
      id v37 = *(id *)(a1 + 48);
      id v18 = objc_retainBlock(v33);
      if (*(void *)(a1 + 32))
      {
        if (!+[LoggedOutPushCache wasDeviceRegistered])
        {
          ((void (*)(void *))v18[2])(v18);
          goto LABEL_21;
        }
        long long v19 = _INLogSystem();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
          sub_100029884();
        }

        long long v20 = *(void **)(a1 + 40);
        v31[0] = _NSConcreteStackBlock;
        v31[1] = 3221225472;
        v31[2] = sub_100011618;
        v31[3] = &unk_1000413A0;
        v32 = v18;
        [v20 unregisterDeviceFromLoggedOutiCloudNotificationsWithReason:1 completion:v31];
        long long v21 = v32;
      }
      else
      {
        v25 = [v15 registrar];
        uint64_t v26 = *(void *)(a1 + 64);
        v27[0] = _NSConcreteStackBlock;
        v27[1] = 3221225472;
        v27[2] = sub_1000116BC;
        v27[3] = &unk_1000413C8;
        uint64_t v30 = v26;
        id v29 = *(id *)(a1 + 48);
        id v28 = v15;
        [v25 registerForLoggedOutPushWithToken:v16 reason:v26 completion:v27];

        long long v21 = v29;
      }

LABEL_21:
      goto LABEL_22;
    }
    v23 = _INLogSystem();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_100029850();
    }

    uint64_t v24 = *(void *)(a1 + 48);
    if (v24)
    {
      INCreateError();
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void, id))(v24 + 16))(v24, 0, v16);
LABEL_22:
    }
  }
  else
  {
    uint64_t v22 = *(void *)(a1 + 48);
    if (v22) {
      (*(void (**)(uint64_t, void, void))(v22 + 16))(v22, 0, 0);
    }
  }
}

void sub_100011250(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) registrar];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 64);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100011340;
  v6[3] = &unk_100041350;
  uint64_t v10 = v5;
  id v9 = *(id *)(a1 + 56);
  id v7 = *(id *)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  [v2 registerForPushNotificationsWithAccount:v3 pushToken:v4 reason:v5 completion:v6];
}

void sub_100011340(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  id v8 = +[INRegistrationRequest bodyParameterValueForRegistrationReason:*(void *)(a1 + 56)];
  id v9 = _INLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_100029A34(a2, (uint64_t)v8, v9);
  }

  uint64_t v10 = _INLogSystem();
  uint64_t v11 = v10;
  if (a2)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Success!", buf, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    if (a2 == 1)
    {
      uint64_t v12 = (void *)os_transaction_create();
      uint64_t v13 = _INLogSystem();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v22 = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Registration Success!", v22, 2u);
      }

      [*(id *)(a1 + 32) _enablePushTopics];
      [*(id *)(a1 + 32) _planForRegistrationTTL:a3 account:*(void *)(a1 + 40)];
    }
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000299CC();
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  id v14 = *(id *)(a1 + 32);
  objc_sync_enter(v14);
  id v15 = [*(id *)(a1 + 32) accountsToReconsiderAfterReboot];
  id v16 = objc_msgSend(*(id *)(a1 + 40), "aa_altDSID");
  unsigned int v17 = [v15 containsObject:v16];

  if (v17)
  {
    id v18 = _INLogSystem();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      sub_100029930();
    }

    [*(id *)(a1 + 32) handlePushRegistrationWithAccount:*(void *)(a1 + 40) reason:5];
    long long v19 = [*(id *)(a1 + 32) accountsToReconsiderAfterReboot];
    long long v20 = objc_msgSend(*(id *)(a1 + 40), "aa_altDSID");
    [v19 removeObject:v20];
  }
  else if ((*(void *)(a1 + 56) | 4) == 5)
  {
    long long v21 = _INLogSystem();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      sub_100029964();
    }

    [*(id *)(a1 + 32) handlePushRegistrationWithAccount:*(void *)(a1 + 40) reason:*(void *)(a1 + 56)];
  }
  objc_sync_exit(v14);
}

void sub_1000115FC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100011618(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = _INLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_100029B74(a2, v6, v7, v8, v9, v10, v11, v12);
  }

  if (v5)
  {
    uint64_t v13 = _INLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100029AE8(v5, v13);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000116BC(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  uint64_t v8 = +[INRegistrationRequest bodyParameterValueForRegistrationReason:*(void *)(a1 + 48)];
  uint64_t v9 = _INLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = +[NSNumber numberWithInteger:a2];
    int v15 = 138412546;
    id v16 = v10;
    __int16 v17 = 2112;
    id v18 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "INRegistrationResult was %@ for reason: %@", (uint8_t *)&v15, 0x16u);
  }
  uint64_t v11 = _INLogSystem();
  uint64_t v12 = v11;
  if (a2)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Success!", (uint8_t *)&v15, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    if (a2 == 1)
    {
      uint64_t v13 = (void *)os_transaction_create();
      id v14 = _INLogSystem();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v15) = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Logged-Out Registration Success!", (uint8_t *)&v15, 2u);
      }

      [*(id *)(a1 + 32) _enablePushTopics];
      [*(id *)(a1 + 32) _planForRegistrationTTL:a3 account:0];
    }
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1000299CC();
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  [*(id *)(a1 + 32) handlePushRegistrationWithAccount:0 reason:*(void *)(a1 + 48)];
}

void sub_100011A6C(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = _INLogSystem();
  id v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_100029C60(a1, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    sub_100029CD0();
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_100011C08(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_100011C24(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = [WeakRetained apsConnection];
    id v5 = [v4 publicToken];

    if (v5)
    {
      uint64_t v6 = *(void *)(a1 + 32);
      id v7 = _INLogSystem();
      BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
      if (v6)
      {
        if (v8)
        {
          uint64_t v9 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 138412290;
          uint64_t v26 = v9;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Unregistering account %@", buf, 0xCu);
        }

        uint64_t v10 = [v3 registrar];
        uint64_t v11 = *(void *)(a1 + 32);
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_100011EFC;
        v21[3] = &unk_100041440;
        id v22 = v3;
        id v23 = *(id *)(a1 + 32);
        id v24 = *(id *)(a1 + 40);
        [v10 unregisterFromPushNotificationsForAccount:v11 pushToken:v5 completion:v21];

        uint64_t v12 = v22;
      }
      else
      {
        if (v8)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Unregistering device from logged-out pushes", buf, 2u);
        }

        __int16 v17 = [v3 registrar];
        uint64_t v18 = *(void *)(a1 + 56);
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        v19[2] = sub_100011FA4;
        v19[3] = &unk_100041468;
        id v20 = *(id *)(a1 + 40);
        [v17 unregisterFromLoggedOutPushNotificationsWithToken:v5 reason:v18 completionHandler:v19];

        uint64_t v12 = v20;
      }
    }
    else
    {
      id v14 = _INLogSystem();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_100029D3C();
      }

      uint64_t v15 = *(void *)(a1 + 40);
      if (v15)
      {
        id v16 = INCreateError();
        (*(void (**)(uint64_t, void, void *))(v15 + 16))(v15, 0, v16);
      }
    }
  }
  else
  {
    uint64_t v13 = *(void *)(a1 + 40);
    if (v13) {
      (*(void (**)(uint64_t, void, void))(v13 + 16))(v13, 0, 0);
    }
  }
}

void sub_100011EFC(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = _INLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Unregistration Success!", v7, 2u);
    }

    [*(id *)(a1 + 32) _cleanUpIfNoAccountsAreLeftOtherThanAccount:*(void *)(a1 + 40)];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_100011FA4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _INLogSystem();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100029D70(v3, v5);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Unregistration Success!", v6, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

id *sub_100012334(id *result, int a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    id v3 = _INLogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4[0] = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "No primary iCloud account but we have an active feature ticket. Registering for logged out push notifications", (uint8_t *)v4, 2u);
    }

    return (id *)[v2[4] registerDeviceForLoggedOutiCloudNotificationsWithReason:2 completion:&stru_1000414B0];
  }
  return result;
}

void sub_1000128E4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100012900(id a1, BOOL a2, NSError *a3)
{
  BOOL v3 = a2;
  uint64_t v4 = a3;
  id v5 = _INLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v6 = @"NO";
    if (v3) {
      CFStringRef v6 = @"YES";
    }
    int v7 = 138412546;
    CFStringRef v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "FLAB registration validation finished for logged-out device. Success: %@. Error %@", (uint8_t *)&v7, 0x16u);
  }
}

void sub_1000129DC(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  CFStringRef v6 = _INLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    CFStringRef v8 = @"NO";
    int v9 = 138412802;
    if (a2) {
      CFStringRef v8 = @"YES";
    }
    uint64_t v10 = v7;
    __int16 v11 = 2112;
    CFStringRef v12 = v8;
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "FLAB registration validation finished for account %@. Success: %@. Error %@", (uint8_t *)&v9, 0x20u);
  }
}

void sub_100012CE0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100013638(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  CFStringRef v6 = _INLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109378;
    v7[1] = a2;
    __int16 v8 = 2112;
    id v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Registration complete. Result: %d. Error: %@.", (uint8_t *)v7, 0x12u);
  }
}

id sub_100013708(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 72) setActivityState:5];
}

void sub_100013960(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  CFStringRef v6 = _INLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109378;
    v7[1] = a2;
    __int16 v8 = 2112;
    id v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Registration complete. Result: %d. Error: %@.", (uint8_t *)v7, 0x12u);
  }
}

void sub_100013A30(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 72) setActivityState:5];
  uint64_t v1 = _INLogSystem();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Heartbeat activity is set to done, will exit the dameon on audio devices.", v2, 2u);
  }
}

void sub_100013FD4(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  CFStringRef v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001409C;
  v10[3] = &unk_100041568;
  id v8 = *(id *)(a1 + 48);
  char v13 = a2;
  id v11 = v5;
  id v12 = v8;
  id v9 = v5;
  [v6 handlePushUnregistrationWithAccount:v7 completion:v10];
}

uint64_t sub_10001409C(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

void sub_1000141E4(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000142A0;
  v9[3] = &unk_100041568;
  CFStringRef v6 = *(void **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  char v12 = a2;
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  [v6 handlePushUnregistrationWithAccount:0 completion:v9];
}

uint64_t sub_1000142A0(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

void sub_100014E08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100014E20(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100014E30(uint64_t a1)
{
}

void sub_100014E38(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = _INLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10002A108();
    }

    CFStringRef v6 = INCreateErrorWithError();
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;
}

void sub_100015098(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000150B0(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = _INLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10002A170();
    }

    CFStringRef v6 = INCreateErrorWithError();
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;
}

void sub_100015324(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001533C(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = _INLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10002A1D8();
    }

    CFStringRef v6 = INCreateErrorWithError();
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;
}

void sub_10001559C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000155B4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = _INLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10002A240();
    }

    CFStringRef v6 = INCreateErrorWithError();
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;
}

void sub_100015824(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001583C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = _INLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10002A310();
    }
  }
  id v5 = INCreateErrorWithError();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0;
}

void sub_100015A88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100015AA0(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = _INLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10002A3E0();
    }
  }
  id v5 = INCreateErrorWithError();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0;
}

void sub_100015CDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100015CF4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = _INLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10002A4B0();
    }

    uint64_t v6 = INCreateErrorWithError();
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;
}

void sub_1000161D8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = _INLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10002A604(v6, v7);
    }
  }
  id v8 = [v5 apsEnvironment];
  [*(id *)(a1 + 32) setActiveAPSEnvironment:v8];

  id v9 = [*(id *)(a1 + 32) activeAPSEnvironment];

  id v10 = _INLogSystem();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (!v9)
  {
    if (v11)
    {
      LOWORD(v19) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Using production APS env as fallback, since none was specified by the iCloud server.", (uint8_t *)&v19, 2u);
    }
    goto LABEL_13;
  }
  if (v11)
  {
    char v12 = [*(id *)(a1 + 32) activeAPSEnvironment];
    int v19 = 138412290;
    id v20 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Server wants us to use the APS env: %@", (uint8_t *)&v19, 0xCu);
  }
  char v13 = [*(id *)(a1 + 32) activeAPSEnvironment];
  unsigned __int8 v14 = +[APSConnection isValidEnvironment:v13];

  if ((v14 & 1) == 0)
  {
    id v10 = _INLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10002A5D0();
    }
LABEL_13:

    [*(id *)(a1 + 32) setActiveAPSEnvironment:APSEnvironmentProduction];
  }
  id v15 = objc_alloc((Class)APSConnection);
  id v16 = [*(id *)(a1 + 32) activeAPSEnvironment];
  id v17 = [v15 initWithEnvironmentName:v16 namedDelegatePort:@"com.apple.ind.aps" queue:*(void *)(*(void *)(a1 + 32) + 16)];
  [*(id *)(a1 + 32) setApsConnection:v17];

  [*(id *)(a1 + 32) _validateEnabledTopics];
  uint64_t v18 = [*(id *)(a1 + 32) apsConnection];
  [v18 setDelegate:*(void *)(a1 + 32)];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_1000164DC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = _INLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10002A604(v6, v7);
    }
  }
  id v8 = [v5 apsEnvironment];
  if (v8)
  {
    id v9 = (id *)(a1 + 32);
    id v10 = [*(id *)(a1 + 32) activeAPSEnvironment];
    unsigned int v11 = [v8 isEqualToString:v10];

    char v12 = _INLogSystem();
    char v13 = v12;
    if (v11)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        sub_10002A6C4((id *)(a1 + 32));
      }
LABEL_22:

      goto LABEL_23;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = [*v9 activeAPSEnvironment];
      int v24 = 138412546;
      v25 = v15;
      __int16 v26 = 2112;
      v27 = v8;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Active APS env (%@) does not match server-requested env (%@).", (uint8_t *)&v24, 0x16u);
    }
    unsigned __int8 v16 = +[APSConnection isValidEnvironment:v8];
    id v17 = _INLogSystem();
    char v13 = v17;
    if ((v16 & 1) == 0)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_10002A74C();
      }
      goto LABEL_22;
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = [*v9 activeAPSEnvironment];
      int v24 = 138412290;
      v25 = v18;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Shutting down APS connection with env %@...", (uint8_t *)&v24, 0xCu);
    }
    int v19 = [*v9 apsConnection];
    [v19 setDelegate:0];

    id v20 = [*v9 apsConnection];
    [v20 shutdown];

    long long v21 = _INLogSystem();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 138412290;
      v25 = v8;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Starting new APS connection with env %@...", (uint8_t *)&v24, 0xCu);
    }

    id v22 = [objc_alloc((Class)APSConnection) initWithEnvironmentName:v8 namedDelegatePort:@"com.apple.ind.aps" queue:*((void *)*v9 + 2)];
    [*v9 setApsConnection:v22];

    id v23 = [*v9 apsConnection];
    [v23 setDelegate:*v9];

    [*v9 setActiveAPSEnvironment:v8];
  }
  else
  {
    unsigned __int8 v14 = _INLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      sub_10002A690();
    }
  }
LABEL_23:
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100016C68(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = _INLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    CFStringRef v8 = @"NO";
    int v9 = 138412802;
    if (a2) {
      CFStringRef v8 = @"YES";
    }
    uint64_t v10 = v7;
    __int16 v11 = 2112;
    CFStringRef v12 = v8;
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Registration due to new APS token for account %@ finished. Success: %@ . Error %@", (uint8_t *)&v9, 0x20u);
  }
}

void sub_100016D54(id a1, BOOL a2, NSError *a3)
{
  BOOL v3 = a2;
  id v4 = a3;
  id v5 = _INLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v6 = @"NO";
    if (v3) {
      CFStringRef v6 = @"YES";
    }
    int v7 = 138412546;
    CFStringRef v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Registration due to new APS token finished for logged-out device. Success: %@. Error %@", (uint8_t *)&v7, 0x16u);
  }
}

void sub_1000176C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000176E0(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = _INLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10002AABC();
    }

    CFStringRef v6 = INCreateErrorWithError();
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  CFStringRef v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;
}

void sub_100017940(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100017958(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = _INLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10002AB8C();
    }

    CFStringRef v6 = INCreateErrorWithError();
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  CFStringRef v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;
}

void sub_100017BCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100017BE4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = _INLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10002AC5C();
    }

    CFStringRef v6 = INCreateErrorWithError();
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  CFStringRef v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;
}

void sub_100017FCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100017FE4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = _INLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10002AD30();
    }

    id v5 = INCreateErrorWithError();
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0;
}

void sub_100018260(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_100018278(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_100018294(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_1000195C4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[NSString stringWithUTF8String:xpc_dictionary_get_string(v3, _xpc_event_key_name)];
  uint64_t v5 = _INLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    CFStringRef v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "XPC notifyd matching event stream handler called. Event name: %@", (uint8_t *)&v7, 0xCu);
  }

  if (![v4 isEqualToString:@"DeviceNameChangeEvent"])
  {
    if ([v4 isEqualToString:@"FirstUnlockEvent"])
    {
      uint64_t v6 = _INLogSystem();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v7) = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received first-unlock launch event.", (uint8_t *)&v7, 2u);
      }
      goto LABEL_8;
    }
    if ([v4 isEqualToString:@"DeviceDidPairEvent"])
    {
      [*(id *)(a1 + 32) _handleDeviceDidPairEvent];
      goto LABEL_30;
    }
    if ([v4 isEqualToString:@"LanguageChangedEvent"])
    {
      [*(id *)(a1 + 32) _handleLanguageChangedEvent];
      goto LABEL_30;
    }
    if ([v4 isEqualToString:@"refreshCFAvailability"])
    {
      [*(id *)(a1 + 32) _handleOSEligibilityChange];
      goto LABEL_30;
    }
    if ([v4 isEqualToString:@"refreshGMSAvailability"])
    {
      [*(id *)(a1 + 32) _handleGMSAvailabilityChange];
      goto LABEL_30;
    }
    if ([v4 isEqualToString:@"ModelCatalogChange"])
    {
      [*(id *)(a1 + 32) _handleModelCatalogChange];
      goto LABEL_30;
    }
    if (sub_100003D34())
    {
      if ([v4 isEqualToString:@"PhotosiCPLStateChangedEvent"])
      {
        objc_msgSend(*(id *)(a1 + 32), "_unsafe_handlePhotosiCPLStateChangedEvent");
        goto LABEL_30;
      }
      if ([v4 isEqualToString:@"PhotosOptimizeStateChangedEvent"])
      {
        objc_msgSend(*(id *)(a1 + 32), "_unsafe_handlePhotosOptimizeStateChangedEvent");
        goto LABEL_30;
      }
      if ([v4 isEqualToString:@"SimulateVFSAlmostFullEvent"])
      {
        objc_msgSend(*(id *)(a1 + 32), "_unsafe_handleSimulateVFSAlmostFullEvent");
        goto LABEL_30;
      }
      if ([v4 isEqualToString:@"SimulateVFSNotFullEvent"])
      {
        objc_msgSend(*(id *)(a1 + 32), "_unsafe_handleSimulateVFSNotFullEvent");
        goto LABEL_30;
      }
      uint64_t v6 = _INLogSystem();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        goto LABEL_8;
      }
    }
    else
    {
      uint64_t v6 = _INLogSystem();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
LABEL_8:

        goto LABEL_30;
      }
    }
    sub_10002AF10();
    goto LABEL_8;
  }
  [*(id *)(a1 + 32) _handleDeviceNameChangeEvent];
LABEL_30:
}

void sub_10001989C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _INLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_10002AF78();
  }

  if ((sub_100003D34() & 1) == 0)
  {
    CFStringRef v12 = _INLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      __int16 v13 = "Unable to process vfs event - quota usage not supported.";
      id v14 = v12;
      uint32_t v15 = 2;
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v13, buf, v15);
    }
LABEL_13:

    goto LABEL_14;
  }
  if (v3)
  {
    uint64_t uint64 = xpc_dictionary_get_uint64(v3, "_Flags");
    int v18 = 0;
    int v6 = fsctl("/private/var", 0x40046818uLL, &v18, 0);
    int v7 = _INLogSystem();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (!v8)
      {
LABEL_9:

        goto LABEL_14;
      }
      *(_DWORD *)buf = 138412546;
      id v20 = v3;
      __int16 v21 = 2048;
      uint64_t v22 = uint64;
      uint64_t v9 = "Unable to get user volume status - ignoring dispatch vfs event. %@ (flags:0x%lx)";
      uint64_t v10 = v7;
      uint32_t v11 = 22;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
      goto LABEL_9;
    }
    if (v8)
    {
      *(_DWORD *)buf = 138412802;
      id v20 = v3;
      __int16 v21 = 2048;
      uint64_t v22 = uint64;
      __int16 v23 = 1024;
      int v24 = v18;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Processing dispatch vfs event. %@ (flags:0x%lx userFlags:0x%x)", buf, 0x1Cu);
    }

    if ((uint64 & 0x4000) != 0 && (v18 & 0x2204) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "_unsafe_handleVFSRiseAboveDesiredDisk");
      goto LABEL_14;
    }
    unsigned int v16 = objc_msgSend(*(id *)(a1 + 32), "_unsafe_isLegacyDeviceStorageLevelNotificationEnabled");
    int v7 = _INLogSystem();
    BOOL v17 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (!v16)
    {
      if (!v17) {
        goto LABEL_9;
      }
      *(_DWORD *)buf = 138412802;
      id v20 = v3;
      __int16 v21 = 2048;
      uint64_t v22 = uint64;
      __int16 v23 = 1024;
      int v24 = v18;
      uint64_t v9 = "Ignoring dispatch vfs event (letting CacheDelete get the first shot): %@ (flags:0x%lx userFlags:0x%x)";
      uint64_t v10 = v7;
      uint32_t v11 = 28;
      goto LABEL_8;
    }
    if (v17)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Legacy device storage level notification enabled", buf, 2u);
    }

    if ((uint64 & 0x200) != 0 && (v18 & 0x200) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "_unsafe_handleVFSFallBelowVeryLowDisk");
      goto LABEL_14;
    }
    if ((uint64 & 4) != 0 && (v18 & 4) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "_unsafe_handleVFSFallBelowLowDisk");
      goto LABEL_14;
    }
    if ((uint64 & 0x2000) != 0 && (v18 & 0x2000) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "_unsafe_handleVFSFallBelowNearLowDisk");
      goto LABEL_14;
    }
    CFStringRef v12 = _INLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v20 = v3;
      __int16 v21 = 2048;
      uint64_t v22 = uint64;
      __int16 v23 = 1024;
      int v24 = v18;
      __int16 v13 = "Ignoring dispatch vfs event (unexpected flags): %@ (flags:0x%lx userFlags:0x%x)";
      id v14 = v12;
      uint32_t v15 = 28;
      goto LABEL_12;
    }
    goto LABEL_13;
  }
LABEL_14:
}

void sub_100019E64(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  int v6 = _INLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = 138412802;
    uint64_t v9 = v7;
    __int16 v10 = 1024;
    int v11 = a2;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Registration complete for account %@. Result: %d. Error: %@.", (uint8_t *)&v8, 0x1Cu);
  }
}

void sub_10001A218(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  int v6 = _INLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = 138412802;
    uint64_t v9 = v7;
    __int16 v10 = 1024;
    int v11 = a2;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Registration complete for account %@. Result: %d. Error: %@.", (uint8_t *)&v8, 0x1Cu);
  }
}

void sub_10001AE4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10001AE74(uint64_t a1)
{
  uint64_t v2 = _INLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    sub_10002B170();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v5 = WeakRetained[18];
    int v6 = INCreateError();
    (*(void (**)(uint64_t, void, void *))(v5 + 16))(v5, 0, v6);

    uint64_t v7 = (void *)v4[19];
    v4[19] = 0;

    int v8 = (void *)v4[18];
    v4[18] = 0;
  }
}

intptr_t sub_10001C648(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = [a2 base64EncodedStringWithOptions:0];
    [*(id *)(a1 + 32) setValue:v3 forHTTPHeaderField:@"X-Mme-Nas-Qualify"];
  }
  uint64_t v4 = *(NSObject **)(a1 + 40);
  return dispatch_semaphore_signal(v4);
}

void sub_10001C738(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void sub_10001CC38(void *a1, void *a2)
{
  id v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  uint64_t v5 = (void *)a1[6];
  id v6 = a2;
  id v7 = [v5 identifier];
  [v3 _handleEventDetailsResponse:v6 forEventID:v4 accountID:v7 pushMessage:a1[7]];
}

void sub_10001D54C(id a1, AAResponse *a2)
{
  uint64_t v2 = a2;
  id v3 = _INLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10002BAA8(v2);
  }
}

void sub_10001DA8C(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  id v3 = _INLogSystem();
  uint64_t v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_10002BB40((uint64_t)v2, v4);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[SUBD] Successfully called the ICQDaemonOfferManager after the failsafe activity elapsed.", v5, 2u);
  }
}

void sub_10001DB20(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  id v3 = _INLogSystem();
  uint64_t v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_10002BBB8((uint64_t)v2, v4);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[SUBD] Successfully cleared the state of the subscription daemon.", v5, 2u);
  }
}

void sub_10001DCAC(id a1)
{
  uint64_t v1 = [INCachedDeviceInfo alloc];
  id v4 = +[AADeviceInfo currentInfo];
  uint64_t v2 = [(INCachedDeviceInfo *)v1 initWithDeviceInfo:v4];
  id v3 = (void *)qword_10004E498;
  qword_10004E498 = (uint64_t)v2;
}

id sub_10001DE5C()
{
  id result = [self standardUserDefaults];
  qword_10004E4B0 = (uint64_t)result;
  return result;
}

uint64_t static LoggedOutPushCache.expirationDate.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_10004E4A8 != -1) {
    swift_once();
  }
  uint64_t v2 = (void *)qword_10004E4B0;
  NSString v3 = String._bridgeToObjectiveC()();
  id v4 = [v2 valueForKey:v3];

  if (v4)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v9, 0, sizeof(v9));
  }
  sub_10001E5B8((uint64_t)v9, (uint64_t)v10);
  if (v11)
  {
    uint64_t v5 = type metadata accessor for Date();
    int v6 = swift_dynamicCast();
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(a1, v6 ^ 1u, 1, v5);
  }
  else
  {
    sub_10001E664((uint64_t)v10);
    uint64_t v8 = type metadata accessor for Date();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(a1, 1, 1, v8);
  }
}

void static LoggedOutPushCache.registeredDevice(expirationDate:)()
{
  if (qword_10004E4A8 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_10004E4B0;
  Class isa = Date._bridgeToObjectiveC()().super.isa;
  id v2 = String._bridgeToObjectiveC()();
  [v0 setObject:isa forKey:v2];
}

void static LoggedOutPushCache.unregisteredDevice()()
{
  if (qword_10004E4A8 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_10004E4B0;
  id v1 = String._bridgeToObjectiveC()();
  [v0 setURL:0 forKey:v1];
}

id LoggedOutPushCache.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LoggedOutPushCache();
  return objc_msgSendSuper2(&v2, "dealloc");
}

BOOL _s3ind18LoggedOutPushCacheC19wasDeviceRegisteredSbvgZ_0()
{
  if (qword_10004E4A8 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_10004E4B0;
  NSString v1 = String._bridgeToObjectiveC()();
  id v2 = [v0 valueForKey:v1];

  if (v2)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v4, 0, sizeof(v4));
  }
  sub_10001E664((uint64_t)v4);
  return v2 != 0;
}

uint64_t sub_10001E5B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10001E620(&qword_10004E280);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001E620(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10001E664(uint64_t a1)
{
  uint64_t v2 = sub_10001E620(&qword_10004E280);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for LoggedOutPushCache()
{
  return self;
}

void sub_10001E6E8()
{
}

uint64_t sub_10001E6FC()
{
  type metadata accessor for TaskLimiters();
  uint64_t result = TaskLimiters.__allocating_init()();
  qword_10004E4C8 = result;
  return result;
}

uint64_t sub_10001E730(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_10001E620(&qword_10004E2B8);
  __chkstk_darwin();
  __int16 v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v12, 1, 1, v13);
  id v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = a1;
  v14[5] = a2;
  v14[6] = a3;
  v14[7] = v5;
  v14[8] = a4;
  v14[9] = a5;
  sub_10001F8A8(a1, a2);
  id v15 = v5;
  swift_retain();
  sub_10001F6FC((uint64_t)v12, (uint64_t)&unk_10004E2C8, (uint64_t)v14);
  return swift_release();
}

uint64_t sub_10001E868(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[7] = a8;
  v8[8] = v10;
  v8[5] = a6;
  v8[6] = a7;
  v8[3] = a4;
  v8[4] = a5;
  return ((uint64_t (*)(uint64_t (*)(), void, void))_swift_task_switch)(sub_10001E898, 0, 0);
}

uint64_t sub_10001E898()
{
  if (qword_10004E4C0 != -1) {
    swift_once();
  }
  *(void *)(v0 + 72) = qword_10004E4C8;
  type metadata accessor for TaskLimiters();
  sub_100025EE8(&qword_10004E2D8, (void (*)(uint64_t))&type metadata accessor for TaskLimiters);
  uint64_t v2 = dispatch thunk of Actor.unownedExecutor.getter();
  return ((uint64_t (*)(uint64_t (*)(), uint64_t, uint64_t))_swift_task_switch)(sub_10001E988, v2, v1);
}

uint64_t sub_10001E988()
{
  *(void *)(v0 + 80) = TaskLimiters.limiter(key:)();
  return ((uint64_t (*)(uint64_t (*)(), void, void))_swift_task_switch)(sub_10001EA0C, 0, 0);
}

uint64_t sub_10001EA0C()
{
  uint64_t v2 = v0[5];
  uint64_t v1 = (void *)v0[6];
  uint64_t v4 = v0[3];
  unint64_t v3 = v0[4];
  uint64_t v5 = (void *)swift_allocObject();
  v0[11] = v5;
  v5[2] = v4;
  v5[3] = v3;
  v5[4] = v2;
  v5[5] = v1;
  sub_10001F8A8(v4, v3);
  uint64_t v9 = (char *)&async function pointer to dispatch thunk of TaskLimiter.perform<A>(identifier:operation:)
     + async function pointer to dispatch thunk of TaskLimiter.perform<A>(identifier:operation:);
  id v6 = v1;
  id v7 = (void *)swift_task_alloc();
  v0[12] = v7;
  void *v7 = v0;
  v7[1] = sub_10001EB48;
  return ((uint64_t (*)(void *, unint64_t, unint64_t, void *, void *, void *))v9)(v0 + 2, 0xD000000000000015, 0x8000000100033980, &unk_10004E428, v5, &type metadata for UInt);
}

uint64_t sub_10001EB48()
{
  *(void *)(*(void *)v1 + 104) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_10001ECDC;
  }
  else
  {
    swift_release();
    swift_release();
    uint64_t v2 = sub_10001EC6C;
  }
  return ((uint64_t (*)(uint64_t (*)(), void, void))_swift_task_switch)(v2, 0, 0);
}

uint64_t sub_10001EC6C()
{
  (*(void (**)(uint64_t, void, void))(v0 + 56))(1, *(void *)(v0 + 16), 0);
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10001ECDC()
{
  uint64_t v1 = v0[13];
  uint64_t v2 = (void (*)(void, void, uint64_t))v0[7];
  swift_release();
  swift_release();
  swift_errorRetain();
  v2(0, 0, v1);
  swift_errorRelease();
  swift_errorRelease();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_10001ED84(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }
  return swift_release();
}

uint64_t sub_10001EDDC()
{
  long long v7 = *(_OWORD *)(v0 + 32);
  uint64_t v2 = *(void *)(v0 + 48);
  uint64_t v3 = *(void *)(v0 + 72);
  uint64_t v4 = swift_task_alloc();
  long long v5 = *(_OWORD *)(v0 + 56);
  *(void *)(v1 + 16) = v4;
  *(void *)uint64_t v4 = v1;
  *(void *)(v4 + 8) = sub_1000261A0;
  *(void *)(v4 + 64) = v3;
  *(_OWORD *)(v4 + 48) = v5;
  *(void *)(v4 + 40) = v2;
  *(_OWORD *)(v4 + 24) = v7;
  return ((uint64_t (*)(uint64_t (*)(), void, void))_swift_task_switch)(sub_10001E898, 0, 0);
}

uint64_t sub_10001EEB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[23] = a3;
  v4[24] = a4;
  v4[21] = a1;
  v4[22] = a2;
  return ((uint64_t (*)(uint64_t (*)(), void, void))_swift_task_switch)(sub_10001EED4, 0, 0);
}

uint64_t sub_10001EED4()
{
  id v1 = [self sharedServerWithNoUrlCache];
  v0[25] = v1;
  v0[2] = v0;
  v0[7] = v0 + 20;
  v0[3] = sub_10001EFF8;
  uint64_t v2 = swift_continuation_init();
  v0[10] = _NSConcreteStackBlock;
  v0[11] = 0x40000000;
  v0[12] = sub_10001F638;
  v0[13] = &unk_100041F48;
  v0[14] = v2;
  [v1 configurationWithCompletion:v0 + 10];
  return _swift_continuation_await(v0 + 2);
}

uint64_t sub_10001EFF8()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 208) = v1;
  if (v1) {
    uint64_t v2 = sub_10001F5C8;
  }
  else {
    uint64_t v2 = sub_10001F108;
  }
  return ((uint64_t (*)(void *, void, void))_swift_task_switch)(v2, 0, 0);
}

void sub_10001F108()
{
  uint64_t v1 = (void *)v0[25];
  uint64_t v2 = (void *)v0[20];
  v0[27] = v2;

  NSString v3 = String._bridgeToObjectiveC()();
  id v4 = [v2 _urlStringForKey:v3];

  if (v4)
  {
    uint64_t v5 = v0[24];
    uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v8 = v7;

    v0[28] = v8;
    id v9 = [self bodyParameterValueForRegistrationReason:v5];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v12 = v0[22];
      unint64_t v11 = v0[23];
      uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v15 = v14;

      v0[29] = v15;
      v0[18] = &type metadata for LoggedOutPushRegistrationRequestBody;
      v0[19] = sub_100025D64();
      unsigned int v16 = (void *)swift_allocObject();
      v0[15] = v16;
      v16[2] = v12;
      v16[3] = v11;
      v16[4] = v13;
      v16[5] = v15;
      sub_10001F8A8(v12, v11);
      sub_10001F8A8(v12, v11);
      swift_bridgeObjectRetain();
      uint64_t v17 = (void *)swift_task_alloc();
      v0[30] = v17;
      void *v17 = v0;
      v17[1] = sub_10001F370;
      sub_1000227F0(v6, v8, 5526864, 0xE300000000000000, (uint64_t)(v0 + 15));
      return;
    }
    __break(1u);
LABEL_11:
    __break(1u);
    return;
  }
  NSString v18 = String._bridgeToObjectiveC()();
  id v19 = (id)INCreateErrorWithMessage();

  if (!v19) {
    goto LABEL_11;
  }
  swift_willThrow();

  id v20 = (void (*)(void))v0[1];
  v20();
}

uint64_t sub_10001F370(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 248) = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v1)
  {
    uint64_t v5 = sub_10001F53C;
  }
  else
  {
    *(void *)(v4 + 256) = a1;
    sub_100024EB0(v4 + 120);
    uint64_t v5 = sub_10001F4B0;
  }
  return ((uint64_t (*)(uint64_t (*)(), void, void))_swift_task_switch)(v5, 0, 0);
}

uint64_t sub_10001F4B0()
{
  uint64_t v1 = v0[32];
  uint64_t v2 = (void *)v0[27];
  NSString v3 = (void *)v0[21];
  sub_10001ED84(v0[22], v0[23]);
  swift_bridgeObjectRelease();

  *NSString v3 = v1;
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_10001F53C()
{
  uint64_t v1 = (void *)v0[27];
  sub_10001ED84(v0[22], v0[23]);
  swift_bridgeObjectRelease();

  sub_100024EB0((uint64_t)(v0 + 15));
  uint64_t v2 = (uint64_t (*)(void))v0[1];
  return v2();
}

uint64_t sub_10001F5C8()
{
  uint64_t v1 = *(void **)(v0 + 200);
  swift_willThrow();

  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_10001F638(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    sub_10001E620(&qword_10004E400);
    uint64_t v5 = swift_allocError();
    *uint64_t v6 = a3;
    id v7 = a3;
    return _swift_continuation_throwingResumeWithError(v3, v5);
  }
  else
  {
    if (a2)
    {
      **(void **)(*(void *)(v3 + 64) + 40) = a2;
      id v8 = a2;
      a1 = v3;
    }
    else
    {
      __break(1u);
    }
    return _swift_continuation_throwingResume(a1);
  }
}

uint64_t sub_10001F6FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_100025E4C(a1, &qword_10004E2B8);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    dispatch thunk of Actor.unownedExecutor.getter();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_10001F8A8(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }
  return swift_retain();
}

void sub_10001FAB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a3) {
    uint64_t v7 = _convertErrorToNSError(_:)();
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = (id)v7;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(a4 + 16))(a4, a1, a2);
}

uint64_t sub_10001FB34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[4] = a3;
  v4[5] = v3;
  _OWORD v4[2] = a1;
  v4[3] = a2;
  return ((uint64_t (*)(uint64_t (*)(), void, void))_swift_task_switch)(sub_10001FB58, 0, 0);
}

uint64_t sub_10001FB58()
{
  if (qword_10004E4C0 != -1) {
    swift_once();
  }
  *(void *)(v0 + 48) = qword_10004E4C8;
  type metadata accessor for TaskLimiters();
  sub_100025EE8(&qword_10004E2D8, (void (*)(uint64_t))&type metadata accessor for TaskLimiters);
  uint64_t v2 = dispatch thunk of Actor.unownedExecutor.getter();
  return ((uint64_t (*)(uint64_t (*)(), uint64_t, uint64_t))_swift_task_switch)(sub_10001FC48, v2, v1);
}

uint64_t sub_10001FC48()
{
  *(void *)(v0 + 56) = TaskLimiters.limiter(key:)();
  return ((uint64_t (*)(uint64_t (*)(), void, void))_swift_task_switch)(sub_10001FCCC, 0, 0);
}

uint64_t sub_10001FCCC()
{
  uint64_t v2 = v0[4];
  uint64_t v1 = (void *)v0[5];
  uint64_t v3 = v0[2];
  unint64_t v4 = v0[3];
  uint64_t v5 = (void *)swift_allocObject();
  v0[8] = v5;
  v5[2] = v3;
  v5[3] = v4;
  v5[4] = v2;
  v5[5] = v1;
  sub_10001F8A8(v3, v4);
  id v9 = (uint64_t (*)(void))((char *)&async function pointer to dispatch thunk of TaskLimiter.perform<A>(identifier:operation:)
                         + async function pointer to dispatch thunk of TaskLimiter.perform<A>(identifier:operation:));
  id v6 = v1;
  uint64_t v7 = (void *)swift_task_alloc();
  v0[9] = v7;
  void *v7 = v0;
  v7[1] = sub_10001FDFC;
  return v9();
}

uint64_t sub_10001FDFC()
{
  *(void *)(*(void *)v1 + 80) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_10001FF38;
  }
  else
  {
    swift_release();
    swift_release();
    uint64_t v2 = sub_10001FF20;
  }
  return ((uint64_t (*)(uint64_t (*)(), void, void))_swift_task_switch)(v2, 0, 0);
}

uint64_t sub_10001FF20()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10001FF38()
{
  swift_release();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10001FFA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[22] = a3;
  v4[23] = a4;
  v4[21] = a2;
  return ((uint64_t (*)(uint64_t (*)(), void, void))_swift_task_switch)(sub_10001FFC8, 0, 0);
}

uint64_t sub_10001FFC8()
{
  id v1 = [self sharedServerWithNoUrlCache];
  v0[24] = v1;
  v0[2] = v0;
  v0[7] = v0 + 20;
  v0[3] = sub_1000200EC;
  uint64_t v2 = swift_continuation_init();
  v0[10] = _NSConcreteStackBlock;
  v0[11] = 0x40000000;
  v0[12] = sub_10001F638;
  v0[13] = &unk_100041EA0;
  v0[14] = v2;
  [v1 configurationWithCompletion:v0 + 10];
  return _swift_continuation_await(v0 + 2);
}

uint64_t sub_1000200EC()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 200) = v1;
  if (v1) {
    uint64_t v2 = sub_10002069C;
  }
  else {
    uint64_t v2 = sub_1000201FC;
  }
  return ((uint64_t (*)(void *, void, void))_swift_task_switch)(v2, 0, 0);
}

void sub_1000201FC()
{
  uint64_t v1 = (void *)v0[24];
  uint64_t v2 = (void *)v0[20];
  v0[26] = v2;

  NSString v3 = String._bridgeToObjectiveC()();
  id v4 = [v2 _urlStringForKey:v3];

  if (v4)
  {
    uint64_t v5 = v0[23];
    uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v8 = v7;

    v0[27] = v8;
    id v9 = [self bodyParameterValueForRegistrationReason:v5];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v12 = v0[21];
      unint64_t v11 = v0[22];
      uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v15 = v14;

      v0[28] = v15;
      v0[18] = &type metadata for LoggedOutPushRegistrationRequestBody;
      v0[19] = sub_100025D64();
      unsigned int v16 = (void *)swift_allocObject();
      v0[15] = v16;
      v16[2] = v12;
      v16[3] = v11;
      v16[4] = v13;
      v16[5] = v15;
      sub_10001F8A8(v12, v11);
      sub_10001F8A8(v12, v11);
      swift_bridgeObjectRetain();
      uint64_t v17 = (void *)swift_task_alloc();
      v0[29] = v17;
      void *v17 = v0;
      v17[1] = sub_100020468;
      sub_100023A24(v6, v8, 0x4554454C4544, 0xE600000000000000, (uint64_t)(v0 + 15));
      return;
    }
    __break(1u);
LABEL_11:
    __break(1u);
    return;
  }
  NSString v18 = String._bridgeToObjectiveC()();
  id v19 = (id)INCreateErrorWithMessage();

  if (!v19) {
    goto LABEL_11;
  }
  swift_willThrow();

  id v20 = (void (*)(void))v0[1];
  v20();
}

uint64_t sub_100020468()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 240) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v0)
  {
    NSString v3 = sub_100020610;
  }
  else
  {
    sub_100024EB0(v2 + 120);
    NSString v3 = sub_100020598;
  }
  return ((uint64_t (*)(uint64_t (*)(), void, void))_swift_task_switch)(v3, 0, 0);
}

uint64_t sub_100020598()
{
  uint64_t v1 = (void *)v0[26];
  sub_10001ED84(v0[21], v0[22]);
  swift_bridgeObjectRelease();

  uint64_t v2 = (uint64_t (*)(void))v0[1];
  return v2();
}

uint64_t sub_100020610()
{
  uint64_t v1 = (void *)v0[26];
  sub_10001ED84(v0[21], v0[22]);
  swift_bridgeObjectRelease();

  sub_100024EB0((uint64_t)(v0 + 15));
  uint64_t v2 = (uint64_t (*)(void))v0[1];
  return v2();
}

uint64_t sub_10002069C()
{
  uint64_t v1 = *(void **)(v0 + 192);
  swift_willThrow();

  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_100020710()
{
  long long v5 = *(_OWORD *)(v0 + 16);
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *(void *)uint64_t v3 = v1;
  *(void *)(v3 + 8) = sub_1000261A0;
  *(void *)(v3 + 184) = v2;
  *(_OWORD *)(v3 + 168) = v5;
  return ((uint64_t (*)(uint64_t (*)(), void, void))_swift_task_switch)(sub_10001FFC8, 0, 0);
}

uint64_t sub_10002094C(void *a1, uint64_t a2, void *aBlock, void *a4)
{
  _OWORD v4[2] = a4;
  v4[3] = _Block_copy(aBlock);
  id v8 = a1;
  id v9 = a4;
  uint64_t v10 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v12 = v11;

  v4[4] = v10;
  v4[5] = v12;
  uint64_t v13 = (void *)swift_task_alloc();
  v4[6] = v13;
  *uint64_t v13 = v4;
  v13[4] = a2;
  v13[5] = v9;
  v13[2] = v10;
  v13[3] = v12;
  v13[1] = sub_100020A4C;
  return ((uint64_t (*)(uint64_t (*)(), void, void))_swift_task_switch)(sub_10001FB58, 0, 0);
}

uint64_t sub_100020A4C()
{
  uint64_t v2 = v0;
  uint64_t v4 = *v1;
  uint64_t v3 = *v1;
  unint64_t v5 = *(void *)(*v1 + 40);
  uint64_t v6 = *(void *)(*v1 + 32);
  uint64_t v7 = *(void **)(*v1 + 16);
  uint64_t v8 = *v1;
  swift_task_dealloc();

  sub_10001ED84(v6, v5);
  uint64_t v9 = *(void *)(v3 + 24);
  if (v2)
  {
    uint64_t v10 = (void *)_convertErrorToNSError(_:)();
    swift_errorRelease();
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);
  }
  else
  {
    (*(void (**)(uint64_t, void))(v9 + 16))(v9, 0);
  }
  _Block_release(*(const void **)(v4 + 24));
  uint64_t v11 = *(uint64_t (**)(void))(v8 + 8);
  return v11();
}

uint64_t sub_100020C0C(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if (a4)
  {
    sub_10001E620(&qword_10004E400);
    uint64_t v6 = swift_allocError();
    void *v7 = a4;
    id v8 = a4;
    return _swift_continuation_throwingResumeWithError(v4, v6);
  }
  else
  {
    id v10 = a2;
    id v11 = a3;
    uint64_t v12 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v14 = v13;

    if (v11)
    {
      unsigned int v16 = *(uint64_t **)(*(void *)(v4 + 64) + 40);
      uint64_t *v16 = v12;
      v16[1] = v14;
      v16[2] = (uint64_t)v11;
      uint64_t v15 = v4;
    }
    else
    {
      __break(1u);
    }
    return _swift_continuation_throwingResume(v15);
  }
}

uint64_t sub_100020D04(uint64_t a1, unint64_t a2)
{
  return a1;
}

uint64_t sub_100020D34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a3;
}

uint64_t sub_100020D68(Swift::String string)
{
  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  Swift::Int v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_1000419E8, v2);
  swift_bridgeObjectRelease();
  if (v3 == 1) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = 2;
  }
  if (v3) {
    return v4;
  }
  else {
    return 0;
  }
}

uint64_t sub_100020DBC()
{
  return 2;
}

uint64_t sub_100020DC4()
{
  return 0;
}

uint64_t sub_100020DD0(char a1)
{
  if (a1) {
    return 0x6E6F73616572;
  }
  else {
    return 0x6B6F742D68737570;
  }
}

uint64_t sub_100020E08(char *a1, char *a2)
{
  return sub_100020E14(*a1, *a2);
}

uint64_t sub_100020E14(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x6E6F73616572;
  }
  else {
    uint64_t v3 = 0x6B6F742D68737570;
  }
  if (v2) {
    unint64_t v4 = 0xEA00000000006E65;
  }
  else {
    unint64_t v4 = 0xE600000000000000;
  }
  if (a2) {
    uint64_t v5 = 0x6E6F73616572;
  }
  else {
    uint64_t v5 = 0x6B6F742D68737570;
  }
  if (a2) {
    unint64_t v6 = 0xE600000000000000;
  }
  else {
    unint64_t v6 = 0xEA00000000006E65;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

Swift::Int sub_100020EBC()
{
  return Hasher._finalize()();
}

uint64_t sub_100020F40()
{
  String.hash(into:)();
  return swift_bridgeObjectRelease();
}

Swift::Int sub_100020FB0()
{
  return Hasher._finalize()();
}

uint64_t sub_100021030@<X0>(Swift::String *a1@<X0>, char *a2@<X8>)
{
  Swift::Int v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_1000419E8, *a1);
  uint64_t result = swift_bridgeObjectRelease();
  if (v3 == 1) {
    char v5 = 1;
  }
  else {
    char v5 = 2;
  }
  if (!v3) {
    char v5 = 0;
  }
  *a2 = v5;
  return result;
}

void sub_100021090(uint64_t *a1@<X8>)
{
  uint64_t v2 = 0x6B6F742D68737570;
  if (*v1) {
    uint64_t v2 = 0x6E6F73616572;
  }
  unint64_t v3 = 0xEA00000000006E65;
  if (*v1) {
    unint64_t v3 = 0xE600000000000000;
  }
  *a1 = v2;
  a1[1] = v3;
}

uint64_t sub_1000210D0()
{
  if (*v0) {
    return 0x6E6F73616572;
  }
  else {
    return 0x6B6F742D68737570;
  }
}

uint64_t sub_10002110C@<X0>(Swift::String string@<0:X0, 8:X1>, char *a2@<X8>)
{
  object = string._object;
  v3._countAndFlagsBits = string._countAndFlagsBits;
  v3._object = object;
  Swift::Int v5 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_1000419E8, v3);
  uint64_t result = swift_bridgeObjectRelease();
  if (v5 == 1) {
    char v7 = 1;
  }
  else {
    char v7 = 2;
  }
  if (!v5) {
    char v7 = 0;
  }
  *a2 = v7;
  return result;
}

void sub_100021170(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_10002117C(uint64_t a1)
{
  unint64_t v2 = sub_1000213BC();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000211B8(uint64_t a1)
{
  unint64_t v2 = sub_1000213BC();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1000211F4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v15[0] = a4;
  v15[1] = a5;
  uint64_t v9 = sub_10001E620(&qword_10004E2F0);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9, v11);
  uint64_t v13 = (char *)v15 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100021378(a1, a1[3]);
  sub_1000213BC();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  uint64_t v16 = a2;
  uint64_t v17 = a3;
  char v18 = 0;
  sub_100021410();
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  if (!v5)
  {
    LOBYTE(v16) = 1;
    KeyedEncodingContainer.encode(_:forKey:)();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v13, v9);
}

void *sub_100021378(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_1000213BC()
{
  unint64_t result = qword_10004E2F8;
  if (!qword_10004E2F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10004E2F8);
  }
  return result;
}

unint64_t sub_100021410()
{
  unint64_t result = qword_10004E300;
  if (!qword_10004E300)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10004E300);
  }
  return result;
}

uint64_t sub_100021464(void *a1)
{
  uint64_t result = sub_100024C14(a1);
  if (v1) {
    return v3;
  }
  return result;
}

uint64_t sub_100021490@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_100024C14(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
    a2[3] = v7;
  }
  return result;
}

uint64_t sub_1000214C0(void *a1)
{
  return sub_1000211F4(a1, *v1, v1[1], v1[2], v1[3]);
}

BOOL sub_1000214E0(Swift::String string)
{
  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  Swift::Int v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100041A38, v2);
  swift_bridgeObjectRelease();
  return v3 != 0;
}

BOOL sub_100021528(Swift::String string)
{
  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  Swift::Int v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100041A70, v2);
  swift_bridgeObjectRelease();
  return v3 != 0;
}

uint64_t sub_100021570()
{
  return 1;
}

unint64_t sub_100021578()
{
  return 0xD000000000000013;
}

Swift::Int sub_100021594()
{
  return Hasher._finalize()();
}

uint64_t sub_1000215EC()
{
  return String.hash(into:)();
}

Swift::Int sub_100021608()
{
  return Hasher._finalize()();
}

uint64_t sub_10002165C@<X0>(Swift::String *a1@<X0>, BOOL *a2@<X8>)
{
  Swift::Int v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100041AA8, *a1);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v3 != 0;
  return result;
}

void sub_1000216B0(void *a1@<X8>)
{
  *a1 = 0xD000000000000013;
  a1[1] = 0x8000000100033960;
}

uint64_t sub_1000216D0@<X0>(Swift::String string@<0:X0, 8:X1>, BOOL *a2@<X8>)
{
  object = string._object;
  v3._countAndFlagsBits = string._countAndFlagsBits;
  v3._object = object;
  Swift::Int v5 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100041AE0, v3);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v5 != 0;
  return result;
}

void sub_100021728(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_100021734(uint64_t a1)
{
  unint64_t v2 = sub_100024E5C();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100021770(uint64_t a1)
{
  unint64_t v2 = sub_100024E5C();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1000217AC(void *a1)
{
  uint64_t v2 = sub_10001E620(&qword_10004E308);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2, v4);
  uint64_t v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100021378(a1, a1[3]);
  sub_100024E5C();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  KeyedEncodingContainer.encode(_:forKey:)();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
}

uint64_t sub_1000218D8(void *a1)
{
  uint64_t v3 = sub_10001E620(&qword_10004E318);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3, v5);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = (uint64_t)sub_100021378(a1, a1[3]);
  sub_100024E5C();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (!v1)
  {
    uint64_t v8 = KeyedDecodingContainer.decode(_:forKey:)();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  }
  sub_100024EB0((uint64_t)a1);
  return v8;
}

uint64_t sub_100021A28@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = sub_10001E620(&qword_10004E318);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100021378(a1, a1[3]);
  sub_100024E5C();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2) {
    return sub_100024EB0((uint64_t)a1);
  }
  uint64_t v10 = KeyedDecodingContainer.decode(_:forKey:)();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  uint64_t result = sub_100024EB0((uint64_t)a1);
  *a2 = v10;
  return result;
}

uint64_t sub_100021B84(void *a1)
{
  uint64_t v2 = sub_10001E620(&qword_10004E308);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2, v4);
  uint64_t v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100021378(a1, a1[3]);
  sub_100024E5C();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  KeyedEncodingContainer.encode(_:forKey:)();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
}

uint64_t sub_100021CB8()
{
  return 0;
}

uint64_t sub_100021CC4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_100021CF4(uint64_t a1)
{
  unint64_t v2 = sub_100024F00();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100021D30(uint64_t a1)
{
  unint64_t v2 = sub_100024F00();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100021D6C(void *a1)
{
  uint64_t v2 = sub_10001E620(&qword_10004E320);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2, v4);
  uint64_t v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100021378(a1, a1[3]);
  sub_100024F00();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
}

uint64_t sub_100021E7C(uint64_t a1)
{
  return sub_100024EB0(a1);
}

uint64_t sub_100021EA4(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_100021F80;
  return v6(a1);
}

uint64_t sub_100021F80()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100022078(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_1000261A0;
  return v6();
}

uint64_t sub_100022144(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_1000261A0;
  return v7();
}

uint64_t sub_100022210(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_100025E4C(a1, &qword_10004E2B8);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    dispatch thunk of Actor.unownedExecutor.getter();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_1000223BC(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_1000261A8;
  return v6(a1);
}

void sub_100022498(unint64_t a1)
{
  unint64_t v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v6)
    {
LABEL_3:
      sub_10001E620(&qword_10004E408);
      uint64_t v3 = (void *)static _SetStorage.allocate(capacity:)();
      uint64_t v4 = a1 & 0xFFFFFFFFFFFFFF8;
      if (!v2) {
        goto LABEL_4;
      }
LABEL_8:
      swift_bridgeObjectRetain();
      uint64_t v5 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      if (!v5) {
        return;
      }
      goto LABEL_9;
    }
  }
  else if (*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_3;
  }
  uint64_t v3 = &_swiftEmptySetSingleton;
  uint64_t v4 = a1 & 0xFFFFFFFFFFFFFF8;
  if (v2) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v5 = *(void *)(v4 + 16);
  if (!v5) {
    return;
  }
LABEL_9:
  uint64_t v7 = (char *)(v3 + 7);
  uint64_t v42 = v5;
  if ((a1 & 0xC000000000000001) != 0)
  {
    uint64_t v8 = 0;
    while (1)
    {
      uint64_t v9 = specialized _ArrayBuffer._getElementSlowPath(_:)();
      BOOL v10 = __OFADD__(v8++, 1);
      if (v10)
      {
        __break(1u);
        goto LABEL_36;
      }
      uint64_t v11 = v9;
      Swift::Int v12 = NSObject._rawHashValue(seed:)(v3[5]);
      uint64_t v13 = -1 << *((unsigned char *)v3 + 32);
      unint64_t v14 = v12 & ~v13;
      unint64_t v15 = v14 >> 6;
      uint64_t v16 = *(void *)&v7[8 * (v14 >> 6)];
      uint64_t v17 = 1 << v14;
      if (((1 << v14) & v16) != 0)
      {
        sub_100025EA8();
        id v18 = *(id *)(v3[6] + 8 * v14);
        char v19 = static NSObject.== infix(_:_:)();

        if (v19)
        {
LABEL_11:
          swift_unknownObjectRelease();
          goto LABEL_12;
        }
        uint64_t v20 = ~v13;
        while (1)
        {
          unint64_t v14 = (v14 + 1) & v20;
          unint64_t v15 = v14 >> 6;
          uint64_t v16 = *(void *)&v7[8 * (v14 >> 6)];
          uint64_t v17 = 1 << v14;
          if ((v16 & (1 << v14)) == 0) {
            break;
          }
          id v21 = *(id *)(v3[6] + 8 * v14);
          char v22 = static NSObject.== infix(_:_:)();

          if (v22) {
            goto LABEL_11;
          }
        }
      }
      *(void *)&v7[8 * v15] = v17 | v16;
      *(void *)(v3[6] + 8 * v14) = v11;
      uint64_t v23 = v3[2];
      BOOL v10 = __OFADD__(v23, 1);
      uint64_t v24 = v23 + 1;
      if (v10) {
        goto LABEL_37;
      }
      v3[2] = v24;
LABEL_12:
      if (v8 == v42) {
        return;
      }
    }
  }
  uint64_t v25 = 0;
  uint64_t v41 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (v25 != v41)
  {
    Swift::Int v26 = v3[5];
    id v27 = *(id *)(a1 + 32 + 8 * v25);
    Swift::Int v28 = NSObject._rawHashValue(seed:)(v26);
    uint64_t v29 = -1 << *((unsigned char *)v3 + 32);
    unint64_t v30 = v28 & ~v29;
    unint64_t v31 = v30 >> 6;
    uint64_t v32 = *(void *)&v7[8 * (v30 >> 6)];
    uint64_t v33 = 1 << v30;
    if (((1 << v30) & v32) != 0)
    {
      sub_100025EA8();
      id v34 = *(id *)(v3[6] + 8 * v30);
      char v35 = static NSObject.== infix(_:_:)();

      if (v35) {
        goto LABEL_23;
      }
      uint64_t v36 = ~v29;
      unint64_t v30 = (v30 + 1) & v36;
      unint64_t v31 = v30 >> 6;
      uint64_t v32 = *(void *)&v7[8 * (v30 >> 6)];
      uint64_t v33 = 1 << v30;
      if ((v32 & (1 << v30)) != 0)
      {
        while (1)
        {
          id v37 = *(id *)(v3[6] + 8 * v30);
          char v38 = static NSObject.== infix(_:_:)();

          if (v38) {
            break;
          }
          unint64_t v30 = (v30 + 1) & v36;
          unint64_t v31 = v30 >> 6;
          uint64_t v32 = *(void *)&v7[8 * (v30 >> 6)];
          uint64_t v33 = 1 << v30;
          if ((v32 & (1 << v30)) == 0) {
            goto LABEL_31;
          }
        }
LABEL_23:

        uint64_t v5 = v42;
        goto LABEL_24;
      }
LABEL_31:
      uint64_t v5 = v42;
    }
    *(void *)&v7[8 * v31] = v33 | v32;
    *(void *)(v3[6] + 8 * v30) = v27;
    uint64_t v39 = v3[2];
    BOOL v10 = __OFADD__(v39, 1);
    uint64_t v40 = v39 + 1;
    if (v10) {
      goto LABEL_38;
    }
    v3[2] = v40;
LABEL_24:
    if (++v25 == v5) {
      return;
    }
  }
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
}

uint64_t sub_1000227F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[33] = a4;
  v5[34] = a5;
  v5[31] = a2;
  v5[32] = a3;
  v5[30] = a1;
  uint64_t v6 = type metadata accessor for String.Encoding();
  v5[35] = v6;
  v5[36] = *(void *)(v6 - 8);
  v5[37] = swift_task_alloc();
  sub_10001E620(&qword_10004E2B0);
  v5[38] = swift_task_alloc();
  uint64_t v7 = type metadata accessor for URLRequest();
  v5[39] = v7;
  v5[40] = *(void *)(v7 - 8);
  v5[41] = swift_task_alloc();
  v5[42] = swift_task_alloc();
  v5[43] = swift_task_alloc();
  sub_10001E620(&qword_10004E3D0);
  v5[44] = swift_task_alloc();
  uint64_t v8 = type metadata accessor for URL();
  v5[45] = v8;
  v5[46] = *(void *)(v8 - 8);
  v5[47] = swift_task_alloc();
  return ((uint64_t (*)(void (*)(), void, void))_swift_task_switch)(sub_1000229EC, 0, 0);
}

void sub_1000229EC()
{
  uint64_t v1 = v0[45];
  uint64_t v2 = v0[46];
  uint64_t v3 = v0[44];
  uint64_t v5 = v0[30];
  uint64_t v4 = v0[31];
  uint64_t v6 = static SystemProperties.getDeviceID()();
  if (v7) {
    uint64_t v8 = v6;
  }
  else {
    uint64_t v8 = 0;
  }
  v0[23] = v8;
  if (v7) {
    unint64_t v9 = v7;
  }
  else {
    unint64_t v9 = 0xE000000000000000;
  }
  v0[27] = v5;
  v0[28] = v4;
  v0[25] = 0x7D644964757BLL;
  v0[26] = 0xE600000000000000;
  v0[24] = v9;
  unint64_t v25 = sub_100025DF8();
  StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
  swift_bridgeObjectRelease();
  URL.init(string:)();
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    sub_100025E4C(v0[44], &qword_10004E3D0);
    NSString v10 = String._bridgeToObjectiveC()();
    id v11 = (id)INCreateErrorWithMessage();

    if (v11)
    {
      swift_willThrow();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      Swift::Int v12 = (void (*)(void))v0[1];
      v12();
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    uint64_t v13 = v0[38];
    (*(void (**)(void, void, void))(v0[46] + 32))(v0[47], v0[44], v0[45]);
    id v14 = objc_allocWithZone((Class)NSMutableURLRequest);
    URL._bridgeToObjectiveC()(v15);
    uint64_t v17 = v16;
    id v18 = objc_msgSend(v14, "initWithURL:", v16, &type metadata for String, v25, v25, v25);
    v0[48] = v18;

    NSString v19 = String._bridgeToObjectiveC()();
    [v18 setHTTPMethod:v19];

    static URLRequest._unconditionallyBridgeFromObjectiveC(_:)();
    id v20 = [objc_allocWithZone((Class)ICQRequestProvider) init];
    [v20 addBasicHeadersToRequest:v18];

    type metadata accessor for BAARequestSigner();
    uint64_t v21 = type metadata accessor for Date();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v13, 1, 1, v21);
    v0[49] = BAARequestSigner.__allocating_init(date:)();
    static URLRequest._unconditionallyBridgeFromObjectiveC(_:)();
    Swift::Int v26 = (void (*)(uint64_t, uint64_t))((char *)&async function pointer to dispatch thunk of BAARequestSigner.sign(request:)
                                                + async function pointer to dispatch thunk of BAARequestSigner.sign(request:));
    char v22 = (void *)swift_task_alloc();
    v0[50] = v22;
    *char v22 = v0;
    v22[1] = sub_100022D98;
    uint64_t v24 = v0[41];
    uint64_t v23 = v0[42];
    v26(v23, v24);
  }
}

uint64_t sub_100022D98()
{
  uint64_t v2 = (void *)*v1;
  v2[51] = v0;
  swift_task_dealloc();
  uint64_t v3 = (void *)v2[49];
  uint64_t v4 = v2[41];
  uint64_t v5 = v2[40];
  uint64_t v6 = v2[39];
  unint64_t v7 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  uint64_t v8 = (v5 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  if (v0)
  {
    v2[55] = v7;
    v2[56] = v8;
    v7(v4, v6);

    unint64_t v9 = sub_100023388;
  }
  else
  {
    v2[52] = v7;
    v2[53] = v8;
    v7(v4, v6);

    unint64_t v9 = sub_100022F40;
  }
  return ((uint64_t (*)(uint64_t (*)(), void, void))_swift_task_switch)(v9, 0, 0);
}

uint64_t sub_100022F40()
{
  uint64_t v1 = *(void *)(v0 + 408);
  uint64_t v2 = *(void *)(v0 + 336);
  uint64_t v3 = *(void *)(v0 + 344);
  uint64_t v4 = *(void *)(v0 + 312);
  uint64_t v5 = *(void *)(v0 + 320);
  uint64_t v6 = *(void **)(v0 + 272);
  (*(void (**)(uint64_t, uint64_t))(v0 + 416))(v3, v4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 32))(v3, v2, v4);
  sub_100021378(v6, v6[3]);
  type metadata accessor for JSONEncoder();
  swift_allocObject();
  JSONEncoder.init()();
  dispatch thunk of JSONEncoder.encode<A>(_:)();
  *(void *)(v0 + 432) = v1;
  if (v1)
  {
    unint64_t v7 = *(void (**)(uint64_t, uint64_t))(v0 + 416);
    uint64_t v8 = *(void **)(v0 + 384);
    uint64_t v26 = *(void *)(v0 + 376);
    uint64_t v10 = *(void *)(v0 + 360);
    uint64_t v9 = *(void *)(v0 + 368);
    uint64_t v11 = *(void *)(v0 + 344);
    uint64_t v12 = *(void *)(v0 + 312);
    swift_release();

    v7(v11, v12);
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v26, v10);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v13 = *(uint64_t (**)(void))(v0 + 8);
    return v13();
  }
  swift_release();
  URLRequest.httpBody.setter();
  v15.value._object = (void *)0x8000000100033AA0;
  v15.value._countAndFlagsBits = 0xD000000000000010;
  v16._countAndFlagsBits = 0x2D746E65746E6F43;
  v16._object = (void *)0xEC00000065707954;
  URLRequest.setValue(_:forHTTPHeaderField:)(v15, v16);
  id v17 = [self sharedSessionWithNoUrlCache];
  id v18 = [v17 urlSession];

  id v19 = [objc_allocWithZone((Class)ACSENetworkRequestController) initWithSession:v18];
  *(void *)(v0 + 456) = v19;

  Class isa = URLRequest._bridgeToObjectiveC()().super.isa;
  *(void *)(v0 + 464) = isa;
  sub_10001E620(&qword_10004E3E0);
  unint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10003D9D0;
  sub_100025EA8();
  *(NSNumber *)(inited + 32) = NSNumber.init(integerLiteral:)(200);
  specialized Array._endMutation()();
  unint64_t v22 = inited;
  if (inited >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v23 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (!v23) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  if (*(void *)((inited & 0xFFFFFFFFFFFFFF8) + 0x10)) {
LABEL_7:
  }
    sub_100022498(v22);
LABEL_9:
  swift_bridgeObjectRelease();
  sub_100025EE8(&qword_10004E3F0, (void (*)(uint64_t))sub_100025EA8);
  Class v24 = Set._bridgeToObjectiveC()().super.isa;
  *(void *)(v0 + 472) = v24;
  swift_bridgeObjectRelease();
  *(void *)(v0 + 16) = v0;
  *(void *)(v0 + 56) = v0 + 160;
  *(void *)(v0 + 24) = sub_10002347C;
  uint64_t v25 = swift_continuation_init();
  *(void *)(v0 + 80) = _NSConcreteStackBlock;
  *(void *)(v0 + 88) = 0x40000000;
  *(void *)(v0 + 96) = sub_100020C0C;
  *(void *)(v0 + 104) = &unk_100041F60;
  *(void *)(v0 + 112) = v25;
  [v19 executeRequest:isa acceptedStatusCodes:v24 completion:v0 + 80];
  return _swift_continuation_await(v0 + 16);
}

uint64_t sub_100023388()
{
  uint64_t v1 = *(void (**)(uint64_t, uint64_t))(v0 + 440);
  uint64_t v2 = *(void *)(v0 + 376);
  uint64_t v3 = *(void *)(v0 + 360);
  uint64_t v4 = *(void *)(v0 + 368);
  uint64_t v5 = *(void *)(v0 + 344);
  uint64_t v6 = *(void *)(v0 + 312);

  v1(v5, v6);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

uint64_t sub_10002347C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 480) = v1;
  if (v1) {
    uint64_t v2 = sub_100023900;
  }
  else {
    uint64_t v2 = sub_10002358C;
  }
  return ((uint64_t (*)(uint64_t (*)(), void, void))_swift_task_switch)(v2, 0, 0);
}

uint64_t sub_10002358C()
{
  uint64_t v2 = *(void **)(v0 + 464);
  uint64_t v1 = *(void **)(v0 + 472);
  uint64_t v3 = *(void *)(v0 + 160);
  unint64_t v4 = *(void *)(v0 + 168);

  sub_10001F8A8(v3, v4);
  switch(v4 >> 62)
  {
    case 1uLL:
      sub_10001ED84(v3, v4);
      uint64_t v5 = (int)v3;
      uint64_t v6 = v3 >> 32;
      goto LABEL_7;
    case 2uLL:
      uint64_t v5 = *(void *)(v3 + 16);
      uint64_t v6 = *(void *)(v3 + 24);
      sub_10001ED84(v3, v4);
LABEL_7:
      if (v5 == v6) {
        goto LABEL_8;
      }
      goto LABEL_10;
    case 3uLL:
      sub_10001ED84(v3, v4);
      goto LABEL_8;
    default:
      sub_10001ED84(v3, v4);
      if ((v4 & 0xFF000000000000) == 0)
      {
LABEL_8:
        uint64_t v7 = *(void *)(v0 + 288);
        uint64_t v8 = *(void *)(v0 + 296);
        uint64_t v9 = *(void *)(v0 + 280);
        static String.Encoding.utf8.getter();
        uint64_t v10 = String.data(using:allowLossyConversion:)();
        unint64_t v12 = v11;
        (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v8, v9);
        if (v12 >> 60 != 15)
        {
          sub_10001ED84(v3, v4);
          uint64_t v3 = v10;
          unint64_t v4 = v12;
        }
      }
LABEL_10:
      uint64_t v13 = *(void *)(v0 + 432);
      type metadata accessor for JSONDecoder();
      swift_allocObject();
      JSONDecoder.init()();
      sub_10002614C();
      dispatch thunk of JSONDecoder.decode<A>(_:from:)();
      id v14 = *(void **)(v0 + 456);
      uint64_t v25 = *(void (**)(uint64_t, uint64_t))(v0 + 416);
      Swift::String_optional v15 = *(void **)(v0 + 384);
      uint64_t v16 = *(void *)(v0 + 368);
      uint64_t v26 = *(void *)(v0 + 360);
      uint64_t v27 = *(void *)(v0 + 376);
      if (v13)
      {
        uint64_t v17 = *(void *)(v0 + 344);
        uint64_t v18 = *(void *)(v0 + 312);
        swift_release();

        sub_10001ED84(v3, v4);
        v25(v17, v18);
        (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v27, v26);
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        id v19 = *(uint64_t (**)(void))(v0 + 8);
        return v19();
      }
      else
      {
        uint64_t v21 = *(void *)(v0 + 344);
        uint64_t v22 = *(void *)(v0 + 312);
        swift_release();

        sub_10001ED84(v3, v4);
        v25(v21, v22);
        (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v27, v26);
        uint64_t v23 = *(void *)(v0 + 232);
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        Class v24 = *(uint64_t (**)(uint64_t))(v0 + 8);
        return v24(v23);
      }
  }
}

uint64_t sub_100023900()
{
  uint64_t v1 = (void *)v0[57];
  unint64_t v11 = (void *)v0[59];
  unint64_t v12 = (void *)v0[58];
  uint64_t v2 = (void (*)(uint64_t, uint64_t))v0[52];
  uint64_t v3 = (void *)v0[48];
  uint64_t v10 = v0[47];
  uint64_t v4 = v0[45];
  uint64_t v5 = v0[46];
  uint64_t v6 = v0[43];
  uint64_t v7 = v0[39];
  swift_willThrow();

  v2(v6, v7);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v10, v4);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_100023A24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[32] = a4;
  v5[33] = a5;
  v5[30] = a2;
  v5[31] = a3;
  v5[29] = a1;
  uint64_t v6 = type metadata accessor for String.Encoding();
  v5[34] = v6;
  v5[35] = *(void *)(v6 - 8);
  v5[36] = swift_task_alloc();
  sub_10001E620(&qword_10004E2B0);
  v5[37] = swift_task_alloc();
  uint64_t v7 = type metadata accessor for URLRequest();
  v5[38] = v7;
  v5[39] = *(void *)(v7 - 8);
  v5[40] = swift_task_alloc();
  v5[41] = swift_task_alloc();
  v5[42] = swift_task_alloc();
  sub_10001E620(&qword_10004E3D0);
  v5[43] = swift_task_alloc();
  uint64_t v8 = type metadata accessor for URL();
  v5[44] = v8;
  v5[45] = *(void *)(v8 - 8);
  v5[46] = swift_task_alloc();
  return ((uint64_t (*)(void (*)(), void, void))_swift_task_switch)(sub_100023C20, 0, 0);
}

void sub_100023C20()
{
  uint64_t v1 = v0[44];
  uint64_t v2 = v0[45];
  uint64_t v3 = v0[43];
  uint64_t v5 = v0[29];
  uint64_t v4 = v0[30];
  uint64_t v6 = static SystemProperties.getDeviceID()();
  if (v7) {
    uint64_t v8 = v6;
  }
  else {
    uint64_t v8 = 0;
  }
  v0[23] = v8;
  if (v7) {
    unint64_t v9 = v7;
  }
  else {
    unint64_t v9 = 0xE000000000000000;
  }
  v0[27] = v5;
  v0[28] = v4;
  v0[25] = 0x7D644964757BLL;
  v0[26] = 0xE600000000000000;
  v0[24] = v9;
  unint64_t v25 = sub_100025DF8();
  StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
  swift_bridgeObjectRelease();
  URL.init(string:)();
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    sub_100025E4C(v0[43], &qword_10004E3D0);
    NSString v10 = String._bridgeToObjectiveC()();
    id v11 = (id)INCreateErrorWithMessage();

    if (v11)
    {
      swift_willThrow();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      unint64_t v12 = (void (*)(void))v0[1];
      v12();
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    uint64_t v13 = v0[37];
    (*(void (**)(void, void, void))(v0[45] + 32))(v0[46], v0[43], v0[44]);
    id v14 = objc_allocWithZone((Class)NSMutableURLRequest);
    URL._bridgeToObjectiveC()(v15);
    uint64_t v17 = v16;
    id v18 = objc_msgSend(v14, "initWithURL:", v16, &type metadata for String, v25, v25, v25);
    v0[47] = v18;

    NSString v19 = String._bridgeToObjectiveC()();
    [v18 setHTTPMethod:v19];

    static URLRequest._unconditionallyBridgeFromObjectiveC(_:)();
    id v20 = [objc_allocWithZone((Class)ICQRequestProvider) init];
    [v20 addBasicHeadersToRequest:v18];

    type metadata accessor for BAARequestSigner();
    uint64_t v21 = type metadata accessor for Date();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v13, 1, 1, v21);
    v0[48] = BAARequestSigner.__allocating_init(date:)();
    static URLRequest._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v26 = (void (*)(uint64_t, uint64_t))((char *)&async function pointer to dispatch thunk of BAARequestSigner.sign(request:)
                                                + async function pointer to dispatch thunk of BAARequestSigner.sign(request:));
    uint64_t v22 = (void *)swift_task_alloc();
    v0[49] = v22;
    *uint64_t v22 = v0;
    v22[1] = sub_100023FCC;
    uint64_t v24 = v0[40];
    uint64_t v23 = v0[41];
    v26(v23, v24);
  }
}

uint64_t sub_100023FCC()
{
  uint64_t v2 = (void *)*v1;
  v2[50] = v0;
  swift_task_dealloc();
  uint64_t v3 = (void *)v2[48];
  uint64_t v4 = v2[40];
  uint64_t v5 = v2[39];
  uint64_t v6 = v2[38];
  unint64_t v7 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  uint64_t v8 = (v5 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  if (v0)
  {
    v2[54] = v7;
    v2[55] = v8;
    v7(v4, v6);

    unint64_t v9 = sub_1000245BC;
  }
  else
  {
    v2[51] = v7;
    v2[52] = v8;
    v7(v4, v6);

    unint64_t v9 = sub_100024174;
  }
  return ((uint64_t (*)(uint64_t (*)(), void, void))_swift_task_switch)(v9, 0, 0);
}

uint64_t sub_100024174()
{
  uint64_t v1 = *(void *)(v0 + 400);
  uint64_t v2 = *(void *)(v0 + 328);
  uint64_t v3 = *(void *)(v0 + 336);
  uint64_t v4 = *(void *)(v0 + 304);
  uint64_t v5 = *(void *)(v0 + 312);
  uint64_t v6 = *(void **)(v0 + 264);
  (*(void (**)(uint64_t, uint64_t))(v0 + 408))(v3, v4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 32))(v3, v2, v4);
  sub_100021378(v6, v6[3]);
  type metadata accessor for JSONEncoder();
  swift_allocObject();
  JSONEncoder.init()();
  dispatch thunk of JSONEncoder.encode<A>(_:)();
  *(void *)(v0 + 424) = v1;
  if (v1)
  {
    unint64_t v7 = *(void (**)(uint64_t, uint64_t))(v0 + 408);
    uint64_t v8 = *(void **)(v0 + 376);
    uint64_t v26 = *(void *)(v0 + 368);
    uint64_t v10 = *(void *)(v0 + 352);
    uint64_t v9 = *(void *)(v0 + 360);
    uint64_t v11 = *(void *)(v0 + 336);
    uint64_t v12 = *(void *)(v0 + 304);
    swift_release();

    v7(v11, v12);
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v26, v10);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v13 = *(uint64_t (**)(void))(v0 + 8);
    return v13();
  }
  swift_release();
  URLRequest.httpBody.setter();
  v15.value._object = (void *)0x8000000100033AA0;
  v15.value._countAndFlagsBits = 0xD000000000000010;
  v16._countAndFlagsBits = 0x2D746E65746E6F43;
  v16._object = (void *)0xEC00000065707954;
  URLRequest.setValue(_:forHTTPHeaderField:)(v15, v16);
  id v17 = [self sharedSessionWithNoUrlCache];
  id v18 = [v17 urlSession];

  id v19 = [objc_allocWithZone((Class)ACSENetworkRequestController) initWithSession:v18];
  *(void *)(v0 + 448) = v19;

  Class isa = URLRequest._bridgeToObjectiveC()().super.isa;
  *(void *)(v0 + 456) = isa;
  sub_10001E620(&qword_10004E3E0);
  unint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10003D9D0;
  sub_100025EA8();
  *(NSNumber *)(inited + 32) = NSNumber.init(integerLiteral:)(200);
  specialized Array._endMutation()();
  unint64_t v22 = inited;
  if (inited >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v23 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (!v23) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  if (*(void *)((inited & 0xFFFFFFFFFFFFFF8) + 0x10)) {
LABEL_7:
  }
    sub_100022498(v22);
LABEL_9:
  swift_bridgeObjectRelease();
  sub_100025EE8(&qword_10004E3F0, (void (*)(uint64_t))sub_100025EA8);
  Class v24 = Set._bridgeToObjectiveC()().super.isa;
  *(void *)(v0 + 464) = v24;
  swift_bridgeObjectRelease();
  *(void *)(v0 + 16) = v0;
  *(void *)(v0 + 56) = v0 + 160;
  *(void *)(v0 + 24) = sub_1000246B0;
  uint64_t v25 = swift_continuation_init();
  *(void *)(v0 + 80) = _NSConcreteStackBlock;
  *(void *)(v0 + 88) = 0x40000000;
  *(void *)(v0 + 96) = sub_100020C0C;
  *(void *)(v0 + 104) = &unk_100041EE0;
  *(void *)(v0 + 112) = v25;
  [v19 executeRequest:isa acceptedStatusCodes:v24 completion:v0 + 80];
  return _swift_continuation_await(v0 + 16);
}

uint64_t sub_1000245BC()
{
  uint64_t v1 = *(void (**)(uint64_t, uint64_t))(v0 + 432);
  uint64_t v2 = *(void *)(v0 + 368);
  uint64_t v3 = *(void *)(v0 + 352);
  uint64_t v4 = *(void *)(v0 + 360);
  uint64_t v5 = *(void *)(v0 + 336);
  uint64_t v6 = *(void *)(v0 + 304);

  v1(v5, v6);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

uint64_t sub_1000246B0()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 472) = v1;
  if (v1) {
    uint64_t v2 = sub_100024AF0;
  }
  else {
    uint64_t v2 = sub_1000247C0;
  }
  return ((uint64_t (*)(uint64_t (*)(), void, void))_swift_task_switch)(v2, 0, 0);
}

uint64_t sub_1000247C0()
{
  uint64_t v2 = *(void **)(v0 + 456);
  uint64_t v1 = *(void **)(v0 + 464);
  uint64_t v3 = *(void *)(v0 + 160);
  unint64_t v4 = *(void *)(v0 + 168);

  sub_10001F8A8(v3, v4);
  switch(v4 >> 62)
  {
    case 1uLL:
      sub_10001ED84(v3, v4);
      uint64_t v5 = (int)v3;
      uint64_t v6 = v3 >> 32;
      goto LABEL_7;
    case 2uLL:
      uint64_t v5 = *(void *)(v3 + 16);
      uint64_t v6 = *(void *)(v3 + 24);
      sub_10001ED84(v3, v4);
LABEL_7:
      if (v5 == v6) {
        goto LABEL_8;
      }
      goto LABEL_10;
    case 3uLL:
      sub_10001ED84(v3, v4);
      goto LABEL_8;
    default:
      sub_10001ED84(v3, v4);
      if ((v4 & 0xFF000000000000) == 0)
      {
LABEL_8:
        uint64_t v8 = *(void *)(v0 + 280);
        uint64_t v7 = *(void *)(v0 + 288);
        uint64_t v9 = *(void *)(v0 + 272);
        static String.Encoding.utf8.getter();
        uint64_t v10 = String.data(using:allowLossyConversion:)();
        unint64_t v12 = v11;
        (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
        if (v12 >> 60 != 15)
        {
          sub_10001ED84(v3, v4);
          uint64_t v3 = v10;
          unint64_t v4 = v12;
        }
      }
LABEL_10:
      type metadata accessor for JSONDecoder();
      swift_allocObject();
      JSONDecoder.init()();
      sub_100025F30();
      dispatch thunk of JSONDecoder.decode<A>(_:from:)();
      uint64_t v13 = *(void **)(v0 + 448);
      id v20 = *(void (**)(uint64_t, uint64_t))(v0 + 408);
      id v14 = *(void **)(v0 + 376);
      uint64_t v15 = *(void *)(v0 + 360);
      uint64_t v21 = *(void *)(v0 + 352);
      uint64_t v22 = *(void *)(v0 + 368);
      uint64_t v16 = *(void *)(v0 + 336);
      uint64_t v17 = *(void *)(v0 + 304);
      swift_release();

      sub_10001ED84(v3, v4);
      v20(v16, v17);
      (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v22, v21);
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      id v18 = *(uint64_t (**)(void))(v0 + 8);
      return v18();
  }
}

uint64_t sub_100024AF0()
{
  uint64_t v1 = (void *)v0[56];
  unint64_t v11 = (void *)v0[58];
  unint64_t v12 = (void *)v0[57];
  uint64_t v2 = (void (*)(uint64_t, uint64_t))v0[51];
  uint64_t v3 = (void *)v0[47];
  uint64_t v10 = v0[46];
  uint64_t v4 = v0[44];
  uint64_t v5 = v0[45];
  uint64_t v6 = v0[42];
  uint64_t v7 = v0[38];
  swift_willThrow();

  v2(v6, v7);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v10, v4);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_100024C14(void *a1)
{
  uint64_t v3 = sub_10001E620(&qword_10004E3B0);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = a1[3];
  sub_100021378(a1, v7);
  sub_1000213BC();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v1)
  {
    sub_100024EB0((uint64_t)a1);
  }
  else
  {
    char v12 = 0;
    sub_100025D10();
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    uint64_t v7 = v10;
    unint64_t v9 = v11;
    LOBYTE(v10) = 1;
    sub_10001F8A8(v7, v11);
    KeyedDecodingContainer.decode(_:forKey:)();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    sub_10001F8A8(v7, v9);
    swift_bridgeObjectRetain();
    sub_10001ED84(v7, v9);
    sub_100024EB0((uint64_t)a1);
    sub_10001ED84(v7, v9);
    swift_bridgeObjectRelease();
  }
  return v7;
}

unint64_t sub_100024E5C()
{
  unint64_t result = qword_10004E310;
  if (!qword_10004E310)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10004E310);
  }
  return result;
}

uint64_t sub_100024EB0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

unint64_t sub_100024F00()
{
  unint64_t result = qword_10004E4D0[0];
  if (!qword_10004E4D0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10004E4D0);
  }
  return result;
}

unint64_t sub_100024F58()
{
  unint64_t result = qword_10004E328;
  if (!qword_10004E328)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10004E328);
  }
  return result;
}

unint64_t sub_100024FB0()
{
  unint64_t result = qword_10004E330;
  if (!qword_10004E330)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10004E330);
  }
  return result;
}

unint64_t sub_100025008()
{
  unint64_t result = qword_10004E338;
  if (!qword_10004E338)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10004E338);
  }
  return result;
}

unint64_t sub_100025060()
{
  unint64_t result = qword_10004E340;
  if (!qword_10004E340)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10004E340);
  }
  return result;
}

unint64_t sub_1000250B8()
{
  unint64_t result = qword_10004E348;
  if (!qword_10004E348)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10004E348);
  }
  return result;
}

unint64_t sub_100025110()
{
  unint64_t result = qword_10004E350;
  if (!qword_10004E350)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10004E350);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for LoggedOutPushRegistrationRequestBody(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for LoggedOutPushRegistrationRequestBody(uint64_t a1)
{
  sub_10001ED84(*(void *)a1, *(void *)(a1 + 8));
  return swift_bridgeObjectRelease();
}

uint64_t *initializeWithCopy for LoggedOutPushRegistrationRequestBody(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  unint64_t v5 = a2[1];
  sub_10001F8A8(*a2, v5);
  *a1 = v4;
  a1[1] = v5;
  uint64_t v6 = a2[3];
  a1[2] = a2[2];
  a1[3] = v6;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t *assignWithCopy for LoggedOutPushRegistrationRequestBody(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  unint64_t v5 = a2[1];
  sub_10001F8A8(*a2, v5);
  uint64_t v6 = *a1;
  unint64_t v7 = a1[1];
  *a1 = v4;
  a1[1] = v5;
  sub_10001ED84(v6, v7);
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for LoggedOutPushRegistrationRequestBody(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t *assignWithTake for LoggedOutPushRegistrationRequestBody(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  unint64_t v5 = a1[1];
  *(_OWORD *)a1 = *(_OWORD *)a2;
  sub_10001ED84(v4, v5);
  uint64_t v6 = *(void *)(a2 + 24);
  a1[2] = *(void *)(a2 + 16);
  a1[3] = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for LoggedOutPushRegistrationRequestBody(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for LoggedOutPushRegistrationRequestBody(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 32) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LoggedOutPushRegistrationRequestBody()
{
  return &type metadata for LoggedOutPushRegistrationRequestBody;
}

unsigned char *initializeBufferWithCopyOfBuffer for LoggedOutPushRegistrationRequestBody.CodingKeys(unsigned char *result, unsigned char *a2)
{
  *__n128 result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for LoggedOutPushRegistrationRequestBody.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for LoggedOutPushRegistrationRequestBody.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *__n128 result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x1000254F0);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *__n128 result = a2 + 1;
        break;
    }
  }
  return result;
}

uint64_t sub_100025518(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_100025520(unsigned char *result, char a2)
{
  *__n128 result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for LoggedOutPushRegistrationRequestBody.CodingKeys()
{
  return &type metadata for LoggedOutPushRegistrationRequestBody.CodingKeys;
}

ValueMetadata *type metadata accessor for LoggedOutPushRegistrationResponseBody()
{
  return &type metadata for LoggedOutPushRegistrationResponseBody;
}

uint64_t getEnumTagSinglePayload for LoggedOutPushRegistrationResponseBody.CodingKeys(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if ((a2 + 1) >= 0x10000) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) < 0x100) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

unsigned char *storeEnumTagSinglePayload for LoggedOutPushRegistrationResponseBody.CodingKeys(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *__n128 result = a2;
        return result;
      case 2:
        *(_WORD *)__n128 result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)__n128 result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *__n128 result = 0;
      break;
    case 2:
      *(_WORD *)__n128 result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x10002563CLL);
    case 4:
      *(_DWORD *)__n128 result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100025664()
{
  return 0;
}

ValueMetadata *type metadata accessor for LoggedOutPushRegistrationResponseBody.CodingKeys()
{
  return &type metadata for LoggedOutPushRegistrationResponseBody.CodingKeys;
}

ValueMetadata *type metadata accessor for EmptyResponse()
{
  return &type metadata for EmptyResponse;
}

ValueMetadata *type metadata accessor for EmptyResponse.CodingKeys()
{
  return &type metadata for EmptyResponse.CodingKeys;
}

void type metadata accessor for INRegistrationResult(uint64_t a1)
{
}

void type metadata accessor for INRegistrationReason(uint64_t a1)
{
}

void sub_1000256C4(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

unint64_t sub_100025710()
{
  unint64_t result = qword_10004EEE0;
  if (!qword_10004EEE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10004EEE0);
  }
  return result;
}

unint64_t sub_100025768()
{
  unint64_t result = qword_10004EEE8[0];
  if (!qword_10004EEE8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10004EEE8);
  }
  return result;
}

uint64_t sub_1000257BC()
{
  _Block_release(*(const void **)(v0 + 32));
  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100025804()
{
  int v2 = (void *)v0[2];
  uint64_t v3 = v0[3];
  uint64_t v5 = (void *)v0[4];
  uint64_t v4 = (void *)v0[5];
  unsigned int v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  *unsigned int v6 = v1;
  v6[1] = sub_1000261A0;
  BOOL v7 = (uint64_t (*)(void *, uint64_t, void *, void *))((char *)&dword_10004E368 + dword_10004E368);
  return v7(v2, v3, v5, v4);
}

uint64_t sub_1000258C8()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_1000261A0;
  unsigned int v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_10004E378 + dword_10004E378);
  return v6(v2, v3, v4);
}

uint64_t sub_10002598C()
{
  swift_unknownObjectRelease();
  swift_release();
  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_1000259CC(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  unsigned int v6 = (int *)v1[4];
  BOOL v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_100025A98;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_10004E388 + dword_10004E388);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_100025A98()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100025B8C()
{
  swift_release();
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100025BC4(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1000261A0;
  unsigned int v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_10004E398 + dword_10004E398);
  return v6(a1, v4);
}

uint64_t sub_100025C7C()
{
  _Block_release(*(const void **)(v0 + 16));
  return _swift_deallocObject(v0, 24, 7);
}

void sub_100025CB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_10001FAB4(a1, a2, a3, *(void *)(v3 + 16));
}

uint64_t sub_100025CC0()
{
  swift_unknownObjectRelease();
  sub_10001ED84(*(void *)(v0 + 32), *(void *)(v0 + 40));

  swift_release();
  return _swift_deallocObject(v0, 80, 7);
}

unint64_t sub_100025D10()
{
  unint64_t result = qword_10004E3B8;
  if (!qword_10004E3B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10004E3B8);
  }
  return result;
}

unint64_t sub_100025D64()
{
  unint64_t result = qword_10004E3C0;
  if (!qword_10004E3C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_10004E3C0);
  }
  return result;
}

uint64_t sub_100025DB8()
{
  sub_10001ED84(*(void *)(v0 + 16), *(void *)(v0 + 24));
  swift_bridgeObjectRelease();
  return _swift_deallocObject(v0, 48, 7);
}

unint64_t sub_100025DF8()
{
  unint64_t result = qword_10004E3D8;
  if (!qword_10004E3D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10004E3D8);
  }
  return result;
}

uint64_t sub_100025E4C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_10001E620(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_100025EA8()
{
  unint64_t result = qword_10004E3E8;
  if (!qword_10004E3E8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10004E3E8);
  }
  return result;
}

uint64_t sub_100025EE8(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100025F30()
{
  unint64_t result = qword_10004E3F8;
  if (!qword_10004E3F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10004E3F8);
  }
  return result;
}

uint64_t sub_100025F84(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1000261A0;
  unsigned int v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_10004E410 + dword_10004E410);
  return v6(a1, v4);
}

uint64_t sub_100026040()
{
  sub_10001ED84(*(void *)(v0 + 16), *(void *)(v0 + 24));

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100026080(uint64_t a1)
{
  long long v7 = *(_OWORD *)(v1 + 16);
  uint64_t v4 = *(void *)(v1 + 32);
  uint64_t v5 = swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *(void *)uint64_t v5 = v2;
  *(void *)(v5 + 8) = sub_100025A98;
  *(void *)(v5 + 192) = v4;
  *(_OWORD *)(v5 + 176) = v7;
  *(void *)(v5 + 168) = a1;
  return ((uint64_t (*)(uint64_t (*)(), void, void))_swift_task_switch)(sub_10001EED4, 0, 0);
}

unint64_t sub_10002614C()
{
  unint64_t result = qword_10004E438;
  if (!qword_10004E438)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10004E438);
  }
  return result;
}

void sub_1000261AC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "PersonID is nil cannot provide urlString.", v1, 2u);
}

uint64_t sub_1000261F0()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return sub_100026214(v0);
}

void sub_100026214(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to fetch audioAccessorySerialNumbers %@", (uint8_t *)&v2, 0xCu);
}

uint64_t sub_10002628C()
{
  uint64_t v0 = abort_report_np();
  return sub_1000262B4(v0);
}

void sub_1000262B4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "No request parameters for registration digest!", v1, 2u);
}

void sub_1000262F8(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v5 = (objc_class *)objc_opt_class();
  unsigned int v6 = NSStringFromClass(v5);
  int v7 = 138412802;
  uint64_t v8 = v6;
  __int16 v9 = 2048;
  id v10 = [a2 statusCode];
  __int16 v11 = 2112;
  char v12 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "%@ has non-200 status code: %zd with response %@", (uint8_t *)&v7, 0x20u);
}

void sub_1000263C0(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Incoming push message does not have the DSID of the receipient account.", v1, 2u);
}

void sub_100026404()
{
  sub_100006008();
  sub_100005FEC((void *)&_mh_execute_header, v0, v1, "Incoming push is for DSID %@, but there is no matching account on the device.", v2, v3, v4, v5, v6);
}

void sub_10002646C()
{
  sub_100006008();
  sub_100005FEC((void *)&_mh_execute_header, v0, v1, "Unsupported terms event found: %@", v2, v3, v4, v5, v6);
}

void sub_1000264D4(uint64_t a1, NSObject *a2)
{
  objc_opt_class();
  sub_100006008();
  __int16 v7 = 2112;
  uint64_t v8 = a1;
  id v5 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unexpected type %@ for DSID %@.", v6, 0x16u);
}

void sub_100026578(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Incoming push message does not valid event type!", v1, 2u);
}

void sub_1000265BC()
{
  sub_100006008();
  sub_100005FEC((void *)&_mh_execute_header, v0, v1, "Failed to handle terms push message, error: %{public}@", v2, v3, v4, v5, v6);
}

void sub_100026624(uint64_t a1, NSObject *a2)
{
  int v2 = 138412546;
  uint64_t v3 = 0;
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to discover properties for account %@, error: %@", (uint8_t *)&v2, 0x16u);
}

void sub_1000266A8(id *a1, NSObject *a2)
{
  id v4 = [*a1 statusCode];
  id v5 = *a1;
  int v6 = 134218242;
  id v7 = v4;
  __int16 v8 = 2112;
  id v9 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "ICQUsageDetailsResponse has non-200 status code: %zd for response %@", (uint8_t *)&v6, 0x16u);
}

void sub_10002674C(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Attempting renew credentials for altDSID %@", (uint8_t *)&v2, 0xCu);
}

void sub_1000267C4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Renew credentials was successful!", v1, 2u);
}

void sub_100026808(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 localizedDescription];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to renew credentials. Error: %@", (uint8_t *)&v4, 0xCu);
}

void sub_1000268A0(void *a1)
{
  uint64_t v1 = [a1 cloudStorageSummary];
  sub_100006008();
  sub_100008084((void *)&_mh_execute_header, v2, v3, "Cloud storage summary %@", v4, v5, v6, v7, v8);
}

void sub_100026924()
{
  sub_1000080C0();
  sub_1000080A4((void *)&_mh_execute_header, v0, v1, "Quota info request completed successfully.", v2, v3, v4, v5, v6);
}

void sub_100026958()
{
  sub_100006008();
  sub_100005FEC((void *)&_mh_execute_header, v0, v1, "Quota info request completed with error: %@", v2, v3, v4, v5, v6);
}

void sub_1000269C0(void *a1)
{
  uint64_t v1 = [a1 cloudStorageApps];
  sub_100006008();
  sub_100008084((void *)&_mh_execute_header, v2, v3, "Storage apps: %@", v4, v5, v6, v7, v8);
}

void sub_100026A44()
{
  sub_1000080C0();
  sub_1000080A4((void *)&_mh_execute_header, v0, v1, "Cloud storage apps request completed successfully.", v2, v3, v4, v5, v6);
}

void sub_100026A78()
{
  sub_100006008();
  sub_100005FEC((void *)&_mh_execute_header, v0, v1, "cloudStorageApps request completed with error: %@", v2, v3, v4, v5, v6);
}

void sub_100026AE0(void *a1)
{
  uint64_t v1 = [a1 appCloudStorage];
  sub_100006008();
  sub_100008084((void *)&_mh_execute_header, v2, v3, "Storage by app summary %@", v4, v5, v6, v7, v8);
}

void sub_100026B64()
{
  sub_1000080C0();
  sub_1000080A4((void *)&_mh_execute_header, v0, v1, "Storage by app request completed successfully.", v2, v3, v4, v5, v6);
}

void sub_100026B98()
{
  sub_100006008();
  sub_100005FEC((void *)&_mh_execute_header, v0, v1, "Storage by app request completed with error: %@", v2, v3, v4, v5, v6);
}

void sub_100026C00(void *a1)
{
  uint64_t v1 = [a1 backupInfo];
  sub_100006008();
  sub_100008084((void *)&_mh_execute_header, v2, v3, "Backup details summary %@", v4, v5, v6, v7, v8);
}

void sub_100026C84()
{
  sub_1000080C0();
  sub_1000080A4((void *)&_mh_execute_header, v0, v1, "Backup details request completed successfully.", v2, v3, v4, v5, v6);
}

void sub_100026CB8()
{
  sub_100006008();
  sub_100005FEC((void *)&_mh_execute_header, v0, v1, "Backup details request completed with error: %@", v2, v3, v4, v5, v6);
}

void sub_100026D20()
{
  sub_100006008();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Notify tip status response %@", v1, 0xCu);
}

void sub_100026D94()
{
  sub_1000080C0();
  sub_1000080A4((void *)&_mh_execute_header, v0, v1, "Notify tip status request completed successfully", v2, v3, v4, v5, v6);
}

void sub_100026DC8()
{
  sub_100006008();
  sub_100005FEC((void *)&_mh_execute_header, v0, v1, "Notify tip status request completed with error: %@", v2, v3, v4, v5, v6);
}

void sub_100026E30(os_log_t log)
{
  int v1 = 138412290;
  uint64_t v2 = qword_10004E458;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "MBManager reports backupDeviceUUID as %@", (uint8_t *)&v1, 0xCu);
}

void sub_100026EB4(void *a1)
{
  int v1 = [a1 appsSyncingToDrive];
  sub_100006008();
  sub_100008084((void *)&_mh_execute_header, v2, v3, "Apps Syncing To Drive Summary %@", v4, v5, v6, v7, v8);
}

void sub_100026F38()
{
  sub_1000080C0();
  sub_1000080A4((void *)&_mh_execute_header, v0, v1, "AppsSyncingToDrive Request completed sucessfully.", v2, v3, v4, v5, v6);
}

void sub_100026F6C()
{
  sub_100006008();
  sub_100005FEC((void *)&_mh_execute_header, v0, v1, "AppsSyncingToDrive Request completed with error: %@", v2, v3, v4, v5, v6);
}

void sub_100026FD4(void *a1)
{
  uint64_t v1 = [a1 serverRecommendations];
  sub_100006008();
  sub_100008084((void *)&_mh_execute_header, v2, v3, "Recommendations result %@", v4, v5, v6, v7, v8);
}

void sub_100027058()
{
  sub_1000080C0();
  sub_1000080A4((void *)&_mh_execute_header, v0, v1, "Recommendations request completed successfully.", v2, v3, v4, v5, v6);
}

void sub_10002708C()
{
  sub_100006008();
  sub_100005FEC((void *)&_mh_execute_header, v0, v1, "Recommendations request completed with error: %@", v2, v3, v4, v5, v6);
}

void sub_1000270F4(void *a1)
{
  uint64_t v1 = [a1 ruleConfiguration];
  sub_100006008();
  sub_100008084((void *)&_mh_execute_header, v2, v3, "Ruleset result %@", v4, v5, v6, v7, v8);
}

void sub_100027178()
{
  sub_1000080C0();
  sub_1000080A4((void *)&_mh_execute_header, v0, v1, "Ruleset request completed successfully.", v2, v3, v4, v5, v6);
}

void sub_1000271AC()
{
  sub_100006008();
  sub_100005FEC((void *)&_mh_execute_header, v0, v1, "Ruleset request completed with error: %@", v2, v3, v4, v5, v6);
}

void sub_100027214(void *a1)
{
  uint64_t v1 = [a1 serverRecommendations];
  sub_100006008();
  sub_100008084((void *)&_mh_execute_header, v2, v3, "Completed and dismissed recommendations result %@", v4, v5, v6, v7, v8);
}

void sub_100027298()
{
  sub_1000080C0();
  sub_1000080A4((void *)&_mh_execute_header, v0, v1, "Completed and dismissed recommendations request completed successfully.", v2, v3, v4, v5, v6);
}

void sub_1000272CC()
{
  sub_100006008();
  sub_100005FEC((void *)&_mh_execute_header, v0, v1, "Completed and dismissed recommendations request completed with error: %@", v2, v3, v4, v5, v6);
}

void sub_100027334(void *a1)
{
  uint64_t v1 = [a1 httpResponse];
  sub_100006008();
  sub_100008084((void *)&_mh_execute_header, v2, v3, "Recommendation action request request completed successfully. %@", v4, v5, v6, v7, v8);
}

void sub_1000273B8()
{
  sub_100006008();
  sub_100005FEC((void *)&_mh_execute_header, v0, v1, "Recommendation action request completed with error: %@", v2, v3, v4, v5, v6);
}

void sub_100027420()
{
  sub_100006008();
  sub_100005FEC((void *)&_mh_execute_header, v0, v1, "Invalid status: %@ request is nil", v2, v3, v4, v5, v6);
}

void sub_100027488(uint64_t a1, void *a2)
{
  [a2 activityID];
  sub_100008EB4();
  sub_100008ECC((void *)&_mh_execute_header, v2, v3, "Setting the new run date to %@. id=%s", v4, v5, v6, v7, v8);
}

void sub_100027508(void **a1)
{
  sub_100008EEC(a1);
  sub_100006008();
  sub_100008084((void *)&_mh_execute_header, v1, v2, "There is no activity already scheduled. id=%s", v3, v4, v5, v6, v7);
}

void sub_10002757C(void **a1)
{
  sub_100008EEC(a1);
  sub_100006008();
  sub_100008084((void *)&_mh_execute_header, v1, v2, "The next scheduled activity is too late. Will reschedule. id=%s", v3, v4, v5, v6, v7);
}

void sub_1000275F0(uint64_t a1, id *a2)
{
  [*a2 activityID];
  sub_100008EB4();
  sub_100008ECC((void *)&_mh_execute_header, v2, v3, "We already have an activity scheduled for %@. id=%s", v4, v5, v6, v7, v8);
}

void sub_100027670(void *a1)
{
  [a1 activityID];
  sub_100006008();
  sub_100008084((void *)&_mh_execute_header, v1, v2, "Checking in for XPC activity %s", v3, v4, v5, v6, v7);
}

void sub_1000276E8(void *a1)
{
  [a1 activityID];
  sub_100006008();
  sub_100008084((void *)&_mh_execute_header, v1, v2, "Asked to set criteria but our XPC activity is MIA. Will set after check-in. id=%s", v3, v4, v5, v6, v7);
}

void sub_100027760(uint64_t a1, void *a2)
{
  [a2 activityID];
  sub_100008EB4();
  sub_100008ECC((void *)&_mh_execute_header, v2, v3, "Setting a new criteria %@. id=%s", v4, v5, v6, v7, v8);
}

void sub_1000277E0(void *a1)
{
  [a1 activityID];
  sub_100006008();
  sub_100008084((void *)&_mh_execute_header, v1, v2, "Re-registering non-repeating XPC activity. id=%s", v3, v4, v5, v6, v7);
}

void sub_100027858(void *a1)
{
  [a1 activityID];
  sub_100006008();
  sub_100008084((void *)&_mh_execute_header, v1, v2, "Configuring %s", v3, v4, v5, v6, v7);
}

void sub_1000278D0(uint64_t a1)
{
  [*(id *)(a1 + 32) activityID];
  sub_100008EB4();
  sub_100008ECC((void *)&_mh_execute_header, v1, v2, "XPC Activity block invoked with state %ld... id=%s", v3, v4, v5, v6, v7);
}

void sub_100027950(void **a1)
{
  sub_100008EEC(a1);
  sub_100006008();
  sub_100008F04((void *)&_mh_execute_header, v1, v2, "No target for %s activity run!", v3, v4, v5, v6, v7);
}

void sub_1000279C4(void **a1)
{
  sub_100008EEC(a1);
  sub_100006008();
  sub_100008F04((void *)&_mh_execute_header, v1, v2, "No action for %s activity run!", v3, v4, v5, v6, v7);
}

void sub_100027A38(void **a1)
{
  sub_100008EEC(a1);
  sub_100006008();
  sub_100008084((void *)&_mh_execute_header, v1, v2, "Running the activity %s.", v3, v4, v5, v6, v7);
}

void sub_100027AAC(void **a1)
{
  sub_100008EEC(a1);
  sub_100006008();
  sub_100008084((void *)&_mh_execute_header, v1, v2, "Finally setting %s activity criteria.", v3, v4, v5, v6, v7);
}

void sub_100027B20(void *a1, uint64_t a2, NSObject *a3)
{
  [a1 activityID];
  sub_100006008();
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Request %s activity date %@ is earlier than now.", v5, 0x16u);
}

void sub_100027BB8(void *a1)
{
  [a1 activityID];
  sub_100008ECC((void *)&_mh_execute_header, v1, v2, "Time interval to %f for %s", v3, v4, v5, v6, 2u);
}

void sub_100027C4C(id *a1, NSObject *a2)
{
  [*a1 statusCode];
  sub_100006008();
  __int16 v5 = 2112;
  uint64_t v6 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "ICQUsageDetailsResponse has non-200 status code: %zd for response %@", v4, 0x16u);
}

void sub_100027CEC(void *a1, void *a2)
{
  [a1 count];
  [a2 count];
  sub_100008F04((void *)&_mh_execute_header, v3, v4, "Failed to parse %lu tips.", v5, v6, v7, v8, 0);
}

void sub_100027D84()
{
  id v0 = (id)objc_opt_class();
  sub_100008F04((void *)&_mh_execute_header, v1, v2, "Expected tip object to be a dictionary, instead found a %@", v3, v4, v5, v6, 2u);
}

void sub_100027E0C(void *a1, void *a2)
{
  [a1 count];
  [a2 count];
  sub_100008F04((void *)&_mh_execute_header, v3, v4, "Failed to parse %lu tip actions.", v5, v6, v7, v8, 0);
}

void sub_100027EA4()
{
  id v0 = (id)objc_opt_class();
  sub_100008F04((void *)&_mh_execute_header, v1, v2, "Expected tip button object to be a dictionary, instead found a %@", v3, v4, v5, v6, 2u);
}

void sub_100027F2C(void *a1)
{
  uint64_t v1 = [a1 buttonTitle];
  sub_100006008();
  sub_100008F04((void *)&_mh_execute_header, v2, v3, "Action with buttonTitle %@ has nil actionName and actionURL.", v4, v5, v6, v7, v8);
}

void sub_100027FB0()
{
  sub_100006008();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Unexpected tip image type: %@", v1, 0xCu);
}

void sub_100028024(void *a1, NSObject *a2)
{
  [a1 count];
  sub_100006008();
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Setting actions with %lu actions...", v3, 0xCu);
}

void sub_1000280AC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "INRecommendationsCompletedAndDismissedRequest PersonID is nil cannot provide urlString.", v1, 2u);
}

void sub_1000280F0(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "INRecommendationsCompletedAndDismissedRequest could not find completedURL in ruleConfiguration: %@", (uint8_t *)&v3, 0xCu);
}

void sub_10002816C(uint64_t a1, id *a2, NSObject *a3)
{
  uint64_t v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  id v7 = [*a2 statusCode];
  id v8 = *a2;
  int v9 = 138412802;
  id v10 = v6;
  __int16 v11 = 2048;
  id v12 = v7;
  __int16 v13 = 2112;
  id v14 = v8;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "%@ has a non-200 status code: %zd with response %@", (uint8_t *)&v9, 0x20u);
}

void sub_100028238(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "INTipNetworkRequest PersonID is nil cannot provide urlString.", v1, 2u);
}

void sub_10002827C(void *a1, NSObject *a2)
{
  int v3 = [a1 urlString];
  sub_100006008();
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "INTipNetworkRequest Fatal request error: missing account and/or parameters for %@.", v4, 0xCu);
}

void sub_100028310()
{
  sub_100006008();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "INTipNetworkRequest Request body: %@", v1, 0xCu);
}

void sub_100028384()
{
  sub_100006008();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "INTipNetworkRequest Could not convert message body to JSON. Error: %@. Body: %@", v2, 0x16u);
}

void sub_100028408(void *a1, NSObject *a2)
{
  __int16 v3 = [a1 urlString];
  sub_100006008();
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "INTipNetworkRequest Building request for URL %@.", v4, 0xCu);
}

void sub_10002849C(id *a1, NSObject *a2)
{
  id v4 = [*a1 statusCode];
  id v5 = *a1;
  int v6 = 134218242;
  id v7 = v4;
  __int16 v8 = 2112;
  id v9 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "ICQBackupDetails has non-200 status code: %zd for response %@", (uint8_t *)&v6, 0x16u);
}

void sub_100028540(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100028578(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000285B0(uint64_t a1, id *a2, NSObject *a3)
{
  id v5 = objc_msgSend(*a2, "aa_primaryAppleAccount");
  int v6 = objc_msgSend(v5, "aa_personID");
  int v7 = 138412546;
  uint64_t v8 = a1;
  __int16 v9 = 2112;
  id v10 = v6;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "dsid mimatch. Push dsid: %@, primary account dsid: %@", (uint8_t *)&v7, 0x16u);
}

void sub_100028674(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000286AC()
{
  sub_100006008();
  sub_100005FEC((void *)&_mh_execute_header, v0, v1, "Incorrect cache types: %@. An array is expected.", v2, v3, v4, v5, v6);
}

void sub_100028714()
{
  sub_100006008();
  sub_100005FEC((void *)&_mh_execute_header, v0, v1, "Unsupported cacheType: %@", v2, v3, v4, v5, v6);
}

void sub_10002877C()
{
  sub_100006008();
  sub_100005FEC((void *)&_mh_execute_header, v0, v1, "Invalid type %@, String expected.", v2, v3, v4, v5, v6);
}

void sub_1000287E4()
{
  sub_10000D5FC();
  sub_10000D614((void *)&_mh_execute_header, v0, v1, "Failed with error code %d for account %@");
}

void sub_100028850()
{
  sub_10000D5FC();
  sub_10000D614((void *)&_mh_execute_header, v0, v1, "Failed with error code %d for account %@");
}

void sub_1000288BC(void *a1)
{
  os_log_t v1 = [a1 allHTTPHeaderFields];
  sub_100006008();
  sub_100008084((void *)&_mh_execute_header, v2, v3, "Headers: %@", v4, v5, v6, v7, v8);
}

void sub_100028940(void *a1)
{
  id v2 = objc_alloc((Class)NSString);
  uint64_t v3 = [a1 HTTPBody];
  id v4 = [v2 initWithData:v3 encoding:4];
  sub_100006008();
  sub_100008084((void *)&_mh_execute_header, v5, v6, "Body: %@", v7, v8, v9, v10, v11);
}

void sub_1000289FC()
{
  sub_100006008();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "Could not convert push message body to JSON. Error: %@. Body: %@", v2, 0x16u);
}

void sub_100028A84(void *a1)
{
  os_log_t v1 = [a1 urlString];
  sub_100006008();
  sub_100008084((void *)&_mh_execute_header, v2, v3, "URL: %@", v4, v5, v6, v7, v8);
}

void sub_100028B08(id *a1, NSObject *a2)
{
  id v4 = [*a1 statusCode];
  id v5 = *a1;
  int v6 = 134218242;
  id v7 = v4;
  __int16 v8 = 2112;
  id v9 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "INTipNetworkResponse has non-200 status code: %zd for response %@", (uint8_t *)&v6, 0x16u);
}

void sub_100028BAC(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "INRecommendationsActionsRequest PersonID is nil cannot provide urlString.", v1, 2u);
}

void sub_100028BF0()
{
  sub_100006008();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "urlstring Building request for URL %@.", v1, 0xCu);
}

void sub_100028C64(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 urlString];
  sub_100006008();
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "INRecommendationsActionsRequest Fatal request error: missing account and/or parameters for %@.", v4, 0xCu);
}

void sub_100028CF8()
{
  sub_100006008();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "INRecommendationsActionsRequest Request body: %@", v1, 0xCu);
}

void sub_100028D6C()
{
  sub_100006008();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "INRecommendationsActionsRequest Could not convert message body to JSON. Error: %@. Body: %@", v2, 0x16u);
}

void sub_100028DF0(void *a1, NSObject *a2)
{
  __int16 v3 = [a1 urlString];
  sub_100006008();
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "INRecommendationsActionsRequest Building request for URL %@.", v4, 0xCu);
}

void sub_100028E84(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "No response data for INAccountEventDetailsResponse!", v1, 2u);
}

void sub_100028EC8(uint64_t a1, uint64_t a2, NSObject *a3)
{
  id v5 = [objc_alloc((Class)NSString) initWithData:a1 encoding:4];
  int v6 = 138412546;
  id v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Could not parse server response data: %@. Error: %@", (uint8_t *)&v6, 0x16u);
}

void sub_100028F8C(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "showMessage value %@", (uint8_t *)&v2, 0xCu);
}

void sub_100029004(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Server provided an unparseable URL string: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10002907C(uint64_t a1, NSObject *a2)
{
  uint64_t v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  int v5 = 138412290;
  int v6 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Person ID is nil. Cannot provide URL string for %@", (uint8_t *)&v5, 0xCu);
}

void sub_100029118(id *a1, NSObject *a2)
{
  id v4 = [*a1 statusCode];
  id v5 = *a1;
  int v6 = 134218242;
  id v7 = v4;
  __int16 v8 = 2112;
  id v9 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "INRecommendationsActionsResponse has non-200 status code: %zd for response %@", (uint8_t *)&v6, 0x16u);
}

void sub_1000291BC()
{
  sub_1000080C0();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Aborting registration because INRegistrationRequest could not be initialized.", v1, 2u);
}

void sub_1000291FC()
{
  sub_1000080C0();
  sub_1000080A4((void *)&_mh_execute_header, v0, v1, "Nothing has changed since last or in-flight registration. Thanks for stopping by!", v2, v3, v4, v5, v6);
}

void sub_100029230()
{
  sub_1000080C0();
  sub_1000080A4((void *)&_mh_execute_header, v0, v1, "Checking for previous registration digest...", v2, v3, v4, v5, v6);
}

void sub_100029264()
{
  sub_100006008();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "We are preparing a heartbeat or reboot registration request, so we will not compare against cached digests (%@).", v1, 0xCu);
}

void sub_1000292D8()
{
  sub_1000080C0();
  sub_1000080A4((void *)&_mh_execute_header, v0, v1, "No registration requests are currently in-flight.", v2, v3, v4, v5, v6);
}

void sub_10002930C()
{
  sub_1000080C0();
  sub_1000080A4((void *)&_mh_execute_header, v0, v1, "The in-flight request is identical to the one being prepared. Dropping.", v2, v3, v4, v5, v6);
}

void sub_100029340()
{
  sub_1000080C0();
  sub_1000080A4((void *)&_mh_execute_header, v0, v1, "We have a registration request in-flight.", v2, v3, v4, v5, v6);
}

void sub_100029374(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 responseDictionary];
  sub_100006008();
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%@", v4, 0xCu);
}

void sub_100029408(void *a1)
{
  uint64_t v1 = [a1 error];
  sub_100006008();
  sub_100008F04((void *)&_mh_execute_header, v2, v3, "Registration request failed due to network connection problems. Error: %@", v4, v5, v6, v7, v8);
}

void sub_10002948C()
{
  sub_100006008();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Failed to update registration digest cache: %@", v1, 0xCu);
}

void sub_100029500(void *a1)
{
  uint64_t v1 = [a1 error];
  sub_100006008();
  sub_100008F04((void *)&_mh_execute_header, v2, v3, "Registration failed with error %@", v4, v5, v6, v7, v8);
}

void sub_100029584()
{
  sub_1000080C0();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Aborting registration because INUnregistrationRequest could not be initialized.", v1, 2u);
}

void sub_1000295C4(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 responseDictionary];
  sub_100006008();
  __int16 v5 = 2080;
  uint64_t v6 = "-[INRegistrar unregisterFromPushNotificationsForAccount:pushToken:completion:]_block_invoke";
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Unregistration response: %@, %s", v4, 0x16u);
}

void sub_10002966C(void *a1)
{
  uint64_t v1 = [a1 error];
  sub_100006008();
  sub_100008F04((void *)&_mh_execute_header, v2, v3, "Unregistration request failed due to error: %@", v4, v5, v6, v7, v8);
}

void sub_1000296F0()
{
  sub_100006008();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Failed to remove registration digest cache: %@", v1, 0xCu);
}

void sub_100029764()
{
  sub_100006008();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "Could not convert push message body to JSON. Error: %@. Body: %@", v2, 0x16u);
}

void sub_1000297E8()
{
  sub_1000080C0();
  sub_1000080A4((void *)&_mh_execute_header, v0, v1, "Starting XPC listener...", v2, v3, v4, v5, v6);
}

void sub_10002981C()
{
  sub_1000080C0();
  sub_1000080A4((void *)&_mh_execute_header, v0, v1, "Shutting down...", v2, v3, v4, v5, v6);
}

void sub_100029850()
{
  sub_1000080C0();
  sub_10000CAD4((void *)&_mh_execute_header, v0, v1, "Error! No APS token. Bailing out on registration request!", v2, v3, v4, v5, v6);
}

void sub_100029884()
{
  sub_1000080C0();
  sub_1000080A4((void *)&_mh_execute_header, v0, v1, "Unregistering from device notifications due to Login", v2, v3, v4, v5, v6);
}

void sub_1000298B8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100029930()
{
  sub_1000080C0();
  sub_1000080A4((void *)&_mh_execute_header, v0, v1, "handlePushRegistrationWithAccount because accountShouldBeReconsidered is True", v2, v3, v4, v5, v6);
}

void sub_100029964()
{
  sub_100006008();
  sub_100018278((void *)&_mh_execute_header, v0, v1, "handlePushRegistrationWithAccount due to Reason %@", v2, v3, v4, v5, v6);
}

void sub_1000299CC()
{
  sub_100006008();
  sub_100005FEC((void *)&_mh_execute_header, v0, v1, "Failure! Error: %@", v2, v3, v4, v5, v6);
}

void sub_100029A34(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5 = +[NSNumber numberWithInteger:a1];
  sub_1000182CC();
  uint64_t v7 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "INRegistrationResult was %@ for reason: %@", v6, 0x16u);
}

void sub_100029AE8(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 localizedDescription];
  sub_100006008();
  sub_100018260((void *)&_mh_execute_header, a2, v4, "Unregister device notifications failed with error %@", v5);
}

void sub_100029B74(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100029BF8()
{
  sub_100006008();
  sub_100018278((void *)&_mh_execute_header, v0, v1, "Registration TTL: %lu", v2, v3, v4, v5, v6);
}

void sub_100029C60(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100029CD0()
{
  sub_1000182B4();
  sub_100018294((void *)&_mh_execute_header, v0, v1, "Failed to save account %@ after setting expiration date. Error %@");
}

void sub_100029D3C()
{
  sub_1000080C0();
  sub_10000CAD4((void *)&_mh_execute_header, v0, v1, "Error! No APS token. Bailing out on unregistration request!", v2, v3, v4, v5, v6);
}

void sub_100029D70(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 localizedDescription];
  sub_100006008();
  sub_100018260((void *)&_mh_execute_header, a2, v4, "Unregistration completed with error: %@", v5);
}

void sub_100029DFC()
{
  sub_1000080C0();
  sub_1000080A4((void *)&_mh_execute_header, v0, v1, "Checking if clean up is necessary...", v2, v3, v4, v5, v6);
}

void sub_100029E30()
{
  sub_1000080C0();
  sub_1000080A4((void *)&_mh_execute_header, v0, v1, "INRegistrationDigestCache is now available! We might need to do FLAB validation.", v2, v3, v4, v5, v6);
}

void sub_100029E64()
{
  sub_1000080C0();
  sub_1000080A4((void *)&_mh_execute_header, v0, v1, "FLAB registration skipped because this (logged-out) device is not in the queue.", v2, v3, v4, v5, v6);
}

void sub_100029E98()
{
  sub_1000080C0();
  sub_1000080A4((void *)&_mh_execute_header, v0, v1, "FLAB registration skipped because this is not our first launch since boot.", v2, v3, v4, v5, v6);
}

void sub_100029ECC()
{
  sub_1000080C0();
  sub_1000080A4((void *)&_mh_execute_header, v0, v1, "FLAB registration validation check about to start.", v2, v3, v4, v5, v6);
}

void sub_100029F00()
{
  sub_1000080C0();
  sub_10000CAD4((void *)&_mh_execute_header, v0, v1, "_heartbeatActivity failed to set state to continue, registration aborted", v2, v3, v4, v5, v6);
}

void sub_100029F34()
{
  sub_1000080C0();
  sub_10000CAD4((void *)&_mh_execute_header, v0, v1, "Account is nil... unable to unregister", v2, v3, v4, v5, v6);
}

void sub_100029F68()
{
  sub_100006008();
  sub_100005FEC((void *)&_mh_execute_header, v0, v1, "Account type is not Apple Account %@", v2, v3, v4, v5, v6);
}

void sub_100029FD0()
{
  sub_100006008();
  sub_100018278((void *)&_mh_execute_header, v0, v1, "Found account %@", v2, v3, v4, v5, v6);
}

void sub_10002A038()
{
  sub_1000080C0();
  sub_1000080A4((void *)&_mh_execute_header, v0, v1, "Received client request.", v2, v3, v4, v5, v6);
}

void sub_10002A06C()
{
  sub_1000080C0();
  sub_1000080A4((void *)&_mh_execute_header, v0, v1, "Received offer update request over XPC!", v2, v3, v4, v5, v6);
}

void sub_10002A0A0()
{
  sub_100006008();
  sub_100005FEC((void *)&_mh_execute_header, v0, v1, "No AppleAccount found for altDSID: %@", v2, v3, v4, v5, v6);
}

void sub_10002A108()
{
  sub_100006008();
  sub_100005FEC((void *)&_mh_execute_header, v0, v1, "Failed to fetch cloud storage summary with error: %@", v2, v3, v4, v5, v6);
}

void sub_10002A170()
{
  sub_100006008();
  sub_100005FEC((void *)&_mh_execute_header, v0, v1, "Failed to fetch cloud storage apps with error: %@", v2, v3, v4, v5, v6);
}

void sub_10002A1D8()
{
  sub_100006008();
  sub_100005FEC((void *)&_mh_execute_header, v0, v1, "Failed to fetch cloud storage for app with error: %@", v2, v3, v4, v5, v6);
}

void sub_10002A240()
{
  sub_100006008();
  sub_100005FEC((void *)&_mh_execute_header, v0, v1, "Failed to fetch cloud backup details with error: %@", v2, v3, v4, v5, v6);
}

void sub_10002A2A8()
{
  sub_100006008();
  sub_100005FEC((void *)&_mh_execute_header, v0, v1, "Failed to make a network request for tip display. No AppleAccount found for altDSID: %@", v2, v3, v4, v5, v6);
}

void sub_10002A310()
{
  sub_100006008();
  sub_100005FEC((void *)&_mh_execute_header, v0, v1, "Failed to notify tip display status with error: %@", v2, v3, v4, v5, v6);
}

void sub_10002A378()
{
  sub_100006008();
  sub_100005FEC((void *)&_mh_execute_header, v0, v1, "Failed to make a network request for tip dismiss. No AppleAccount found for altDSID: %@", v2, v3, v4, v5, v6);
}

void sub_10002A3E0()
{
  sub_100006008();
  sub_100005FEC((void *)&_mh_execute_header, v0, v1, "Failed to notify tip dismissal status with error: %@", v2, v3, v4, v5, v6);
}

void sub_10002A448()
{
  sub_100006008();
  sub_100005FEC((void *)&_mh_execute_header, v0, v1, "Failed to make a network request for Apps Syncing to Drive. No AppleAccount found for altDSID %@", v2, v3, v4, v5, v6);
}

void sub_10002A4B0()
{
  sub_100006008();
  sub_100005FEC((void *)&_mh_execute_header, v0, v1, "Failed to fetch apps syncing to iCloud Drive with error: %@", v2, v3, v4, v5, v6);
}

void sub_10002A518()
{
  sub_1000080C0();
  sub_10000CAD4((void *)&_mh_execute_header, v0, v1, "Subclass must provide push notification handler.", v2, v3, v4, v5, v6);
}

void sub_10002A54C(void *a1)
{
  uint64_t v1 = [a1 userInfo];
  sub_100006008();
  sub_100008084((void *)&_mh_execute_header, v2, v3, "Handling iCloudQuota push message: %@", v4, v5, v6, v7, v8);
}

void sub_10002A5D0()
{
  sub_1000080C0();
  sub_10000CAD4((void *)&_mh_execute_header, v0, v1, "Server is requesting that we use an invalid env! Falling back to prod.", v2, v3, v4, v5, v6);
}

void sub_10002A604(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 localizedDescription];
  sub_100006008();
  sub_100018260((void *)&_mh_execute_header, a2, v4, "Error retrieving configuration from AARemoteServer: %@", v5);
}

void sub_10002A690()
{
  sub_1000080C0();
  sub_1000080A4((void *)&_mh_execute_header, v0, v1, "Server is not providing an APS env override.", v2, v3, v4, v5, v6);
}

void sub_10002A6C4(id *a1)
{
  uint64_t v1 = [*a1 activeAPSEnvironment];
  sub_100006008();
  sub_100008084((void *)&_mh_execute_header, v2, v3, "Current APS env matches server preference. %@", v4, v5, v6, v7, v8);
}

void sub_10002A74C()
{
  sub_100006008();
  sub_100005FEC((void *)&_mh_execute_header, v0, v1, "The server requested env (%@) is not valid!", v2, v3, v4, v5, v6);
}

void sub_10002A7B4()
{
  sub_1000080C0();
  sub_1000080A4((void *)&_mh_execute_header, v0, v1, "Check done.", v2, v3, v4, v5, v6);
}

void sub_10002A7E8()
{
  sub_1000080C0();
  sub_1000080A4((void *)&_mh_execute_header, v0, v1, "Enabled-topics validation check about to start.", v2, v3, v4, v5, v6);
}

void sub_10002A81C(void *a1)
{
  uint64_t v1 = [a1 pushTopics];
  sub_100006008();
  sub_100008084((void *)&_mh_execute_header, v2, v3, "Setting APS enabled topics to %@", v4, v5, v6, v7, v8);
}

void sub_10002A8A0()
{
  sub_1000080C0();
  sub_1000080A4((void *)&_mh_execute_header, v0, v1, "Will re-register all iCloud accounts with the new public token.", v2, v3, v4, v5, v6);
}

void sub_10002A8D4(void *a1, NSObject *a2)
{
  uint64_t v4 = [a1 topic];
  int v5 = 138412546;
  uint8_t v6 = a1;
  __int16 v7 = 2112;
  uint8_t v8 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Dropping incoming push message %@ because its topic %@ is unrecognized.", (uint8_t *)&v5, 0x16u);
}

void sub_10002A984()
{
  sub_1000080C0();
  sub_1000080A4((void *)&_mh_execute_header, v0, v1, "[SUBD] ICQDaemonOfferManager successfully handled the XPC call from SubD.", v2, v3, v4, v5, v6);
}

void sub_10002A9B8()
{
  sub_100006008();
  sub_100018278((void *)&_mh_execute_header, v0, v1, "[SUBD] Received XPC call to display a delayed notification. context=[%@]", v2, v3, v4, v5, v6);
}

void sub_10002AA20()
{
  sub_1000080C0();
  sub_10000CAD4((void *)&_mh_execute_header, v0, v1, "Reconsider offers called with Enterprise persona. Ignoring request.", v2, v3, v4, v5, v6);
}

void sub_10002AA54()
{
  sub_100006008();
  sub_100005FEC((void *)&_mh_execute_header, v0, v1, "Failed to make a network request for Recommendations. No AppleAccount found for altDSID %@", v2, v3, v4, v5, v6);
}

void sub_10002AABC()
{
  sub_100006008();
  sub_100005FEC((void *)&_mh_execute_header, v0, v1, "Failed to fetch recommendations with error: %@", v2, v3, v4, v5, v6);
}

void sub_10002AB24()
{
  sub_100006008();
  sub_100005FEC((void *)&_mh_execute_header, v0, v1, "Failed to make a network request for recommendation ruleset. No AppleAccount found for altDSID %@", v2, v3, v4, v5, v6);
}

void sub_10002AB8C()
{
  sub_100006008();
  sub_100005FEC((void *)&_mh_execute_header, v0, v1, "Failed to fetch recommendation ruleset with error: %@", v2, v3, v4, v5, v6);
}

void sub_10002ABF4()
{
  sub_100006008();
  sub_100005FEC((void *)&_mh_execute_header, v0, v1, "Failed to make a network request to fetch completed and dismissed recommendations. No AppleAccount found for altDSID %@", v2, v3, v4, v5, v6);
}

void sub_10002AC5C()
{
  sub_100006008();
  sub_100005FEC((void *)&_mh_execute_header, v0, v1, "Failed to fetch completed and dismissed recommendations with error: %@", v2, v3, v4, v5, v6);
}

void sub_10002ACC4()
{
  sub_1000182CC();
  sub_100018294((void *)&_mh_execute_header, v0, v1, "Failed to make a network request to send status: %@. No AppleAccount found for altDSID %@");
}

void sub_10002AD30()
{
  sub_1000182B4();
  sub_100018294((void *)&_mh_execute_header, v0, v1, "Failed to send status: %@ for recommendations with error: %@");
}

void sub_10002AD9C(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Unable to get unique device info for storage summary request.", v1, 2u);
}

void sub_10002ADE0(os_log_t log)
{
  int v1 = 138412290;
  CFStringRef v2 = @"settingsAppStorageDetailsURL";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "iCloudQuota data class doesn't contain url for key: %@", (uint8_t *)&v1, 0xCu);
}

void sub_10002AE64(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to format url for string: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10002AEDC()
{
  sub_1000080C0();
  sub_1000080A4((void *)&_mh_execute_header, v0, v1, "Configuring XPC stuff...", v2, v3, v4, v5, v6);
}

void sub_10002AF10()
{
  sub_100006008();
  sub_100005FEC((void *)&_mh_execute_header, v0, v1, "Asked to handle unknown XPC event. %@", v2, v3, v4, v5, v6);
}

void sub_10002AF78()
{
  sub_1000080C0();
  sub_1000080A4((void *)&_mh_execute_header, v0, v1, "XPC dispatch vfs event stream handler called.", v2, v3, v4, v5, v6);
}

void sub_10002AFAC()
{
  sub_1000080C0();
  sub_1000080A4((void *)&_mh_execute_header, v0, v1, "Couldn't find specialized handler, falling back to default handler...", v2, v3, v4, v5, v6);
}

void sub_10002AFE0(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 localizedDescription];
  sub_100006008();
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to signal exit megaBackupMode with error: %{public}@", v4, 0xCu);
}

void sub_10002B074()
{
  sub_100006008();
  sub_100005FEC((void *)&_mh_execute_header, v0, v1, "Failed to handle iCloudQuota OOBE Prebuddy push notification with action: %@", v2, v3, v4, v5, v6);
}

void sub_10002B0DC()
{
  __assert_rtn("-[INDaemon_iOS iCloudServerOfferForAccountWithID:options:completion:]", "INDaemon_iOS.m", 366, "[SICQDaemonOfferManager sharedDaemonOfferManager] != nil");
}

void sub_10002B108()
{
  sub_100006008();
  sub_100005FEC((void *)&_mh_execute_header, v0, v1, "Received notifyDeviceStorageLevel: for unexpected level %ld", v2, v3, v4, v5, v6);
}

void sub_10002B170()
{
  sub_1000080C0();
  sub_10000CAD4((void *)&_mh_execute_header, v0, v1, "Presentation manager was invalidated, finishing freshmint flow.", v2, v3, v4, v5, v6);
}

void sub_10002B1A4()
{
  sub_1000080C0();
  sub_10000CAD4((void *)&_mh_execute_header, v0, v1, "Attempted to add headers to request when _INDShouldLoadQuotaFramework() == NO", v2, v3, v4, v5, v6);
}

void sub_10002B1D8(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[INDaemon_iOS renewCredentialsWithCompletion:]";
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v1, 0xCu);
}

void sub_10002B25C()
{
  sub_1000080C0();
  sub_10000CAD4((void *)&_mh_execute_header, v0, v1, "Attempted to renew credentials when _INDShouldLoadQuotaFramework() == NO", v2, v3, v4, v5, v6);
}

void sub_10002B290(id *a1, NSObject *a2)
{
  id v4 = [*a1 statusCode];
  id v5 = *a1;
  int v6 = 134218242;
  id v7 = v4;
  __int16 v8 = 2112;
  id v9 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "INStorageByAppResponse has non-200 status code: %zd for response %@", (uint8_t *)&v6, 0x16u);
}

void sub_10002B334()
{
  sub_100006008();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "Missing iCloud auth token for account %@. Error: %@", v2, 0x16u);
}

void sub_10002B3B8()
{
  sub_100006008();
  sub_10001C738((void *)&_mh_execute_header, v0, v1, "MBManager reports backupDeviceUUID as %@", v2);
}

void sub_10002B424(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Could not get DSID for POST parameters.", v1, 2u);
}

void sub_10002B468(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Could not get push token for POST parameters.", v1, 2u);
}

void sub_10002B4AC(void *a1, NSObject *a2)
{
  __int16 v3 = [a1 urlString];
  sub_100006008();
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Fatal request error: missing account and/or parameters for %@.", v4, 0xCu);
}

void sub_10002B540()
{
  sub_100006008();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Unable to create body for request. %@", v1, 0xCu);
}

void sub_10002B5B4(void *a1, NSObject *a2)
{
  __int16 v3 = [a1 allHTTPHeaderFields];
  sub_100006008();
  sub_10001C738((void *)&_mh_execute_header, a2, v4, "Request headers: %@", v5);
}

void sub_10002B640(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Attaching Absinthe signature.", v1, 2u);
}

void sub_10002B684()
{
  sub_100006008();
  sub_10001C738((void *)&_mh_execute_header, v0, v1, "Request body: %@", v2);
}

void sub_10002B6F0(void *a1, NSObject *a2)
{
  __int16 v3 = [a1 urlString];
  sub_100006008();
  sub_10001C738((void *)&_mh_execute_header, a2, v4, "Building request for URL %@.", v5);
}

void sub_10002B77C()
{
  sub_1000080C0();
  sub_10000CAD4((void *)&_mh_execute_header, v0, v1, "Incoming push message does not have the DSID of the receipient account.", v2, v3, v4, v5, v6);
}

void sub_10002B7B0()
{
  sub_100006008();
  sub_100005FEC((void *)&_mh_execute_header, v0, v1, "Error! Expected msgid string parameter, but got: %@", v2, v3, v4, v5, v6);
}

void sub_10002B818()
{
  sub_1000080C0();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Requesting details for event.", v1, 2u);
}

void sub_10002B858()
{
  sub_1000080C0();
  sub_10000CAD4((void *)&_mh_execute_header, v0, v1, "Error: Account event lacking title and message will be discarded!", v2, v3, v4, v5, v6);
}

void sub_10002B88C(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 error];
  sub_100006008();
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Could not get event details. Error: %@", v4, 0xCu);
}

void sub_10002B920(void *a1)
{
  [a1 statusCode];
  sub_100006008();
  sub_100008084((void *)&_mh_execute_header, v1, v2, "HTTP status code: %lu", v3, v4, v5, v6, v7);
}

void sub_10002B998()
{
  sub_1000080C0();
  sub_10000CAD4((void *)&_mh_execute_header, v0, v1, "Error! Nil event ID.", v2, v3, v4, v5, v6);
}

void sub_10002B9CC()
{
  sub_100006008();
  sub_100005FEC((void *)&_mh_execute_header, v0, v1, "No account with ID: %@", v2, v3, v4, v5, v6);
}

void sub_10002BA34()
{
  sub_1000080C0();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Sending notification acknowledgement request.", v1, 2u);
}

void sub_10002BA74()
{
  sub_1000080C0();
  sub_10000CAD4((void *)&_mh_execute_header, v0, v1, "Nil push message info!", v2, v3, v4, v5, v6);
}

void sub_10002BAA8(void *a1)
{
  uint64_t v1 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [a1 statusCode]);
  sub_100006008();
  sub_100008084((void *)&_mh_execute_header, v2, v3, "Server response to notification ack: %@", v4, v5, v6, v7, v8);
}

void sub_10002BB40(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "[SUBD] Failed to display the delayed offer after failsafe triggered with error=[%@].", (uint8_t *)&v2, 0xCu);
}

void sub_10002BBB8(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "[SUBD] Failed to clear the subd state with error=[%@].", (uint8_t *)&v2, 0xCu);
}

NSURLRequest __swiftcall URLRequest._bridgeToObjectiveC()()
{
  os_log_t v0 = (objc_class *)URLRequest._bridgeToObjectiveC()();
  result._internal = v1;
  result.super.Class isa = v0;
  return result;
}

uint64_t static URLRequest._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static URLRequest._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t URLRequest.httpBody.setter()
{
  return URLRequest.httpBody.setter();
}

Swift::Void __swiftcall URLRequest.setValue(_:forHTTPHeaderField:)(Swift::String_optional _, Swift::String forHTTPHeaderField)
{
}

uint64_t type metadata accessor for URLRequest()
{
  return type metadata accessor for URLRequest();
}

uint64_t dispatch thunk of JSONDecoder.decode<A>(_:from:)()
{
  return dispatch thunk of JSONDecoder.decode<A>(_:from:)();
}

uint64_t JSONDecoder.init()()
{
  return JSONDecoder.init()();
}

uint64_t type metadata accessor for JSONDecoder()
{
  return type metadata accessor for JSONDecoder();
}

uint64_t dispatch thunk of JSONEncoder.encode<A>(_:)()
{
  return dispatch thunk of JSONEncoder.encode<A>(_:)();
}

uint64_t JSONEncoder.init()()
{
  return JSONEncoder.init()();
}

uint64_t type metadata accessor for JSONEncoder()
{
  return type metadata accessor for JSONEncoder();
}

uint64_t _convertErrorToNSError(_:)()
{
  return _convertErrorToNSError(_:)();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

uint64_t URL.init(string:)()
{
  return URL.init(string:)();
}

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

NSDate __swiftcall Date._bridgeToObjectiveC()()
{
  return (NSDate)Date._bridgeToObjectiveC()();
}

uint64_t static Date._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Date._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t type metadata accessor for Date()
{
  return type metadata accessor for Date();
}

uint64_t TaskLimiters.limiter(key:)()
{
  return TaskLimiters.limiter(key:)();
}

uint64_t TaskLimiters.__allocating_init()()
{
  return TaskLimiters.__allocating_init()();
}

uint64_t type metadata accessor for TaskLimiters()
{
  return type metadata accessor for TaskLimiters();
}

uint64_t BAARequestSigner.__allocating_init(date:)()
{
  return BAARequestSigner.__allocating_init(date:)();
}

uint64_t type metadata accessor for BAARequestSigner()
{
  return type metadata accessor for BAARequestSigner();
}

uint64_t static SystemProperties.getDeviceID()()
{
  return static SystemProperties.getDeviceID()();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t String.data(using:allowLossyConversion:)()
{
  return String.data(using:allowLossyConversion:)();
}

uint64_t static String.Encoding.utf8.getter()
{
  return static String.Encoding.utf8.getter();
}

uint64_t type metadata accessor for String.Encoding()
{
  return type metadata accessor for String.Encoding();
}

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

uint64_t specialized Array._endMutation()()
{
  return specialized Array._endMutation()();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t TaskPriority.rawValue.getter()
{
  return TaskPriority.rawValue.getter();
}

uint64_t type metadata accessor for TaskPriority()
{
  return type metadata accessor for TaskPriority();
}

NSSet __swiftcall Set._bridgeToObjectiveC()()
{
  return (NSSet)Set._bridgeToObjectiveC()();
}

NSNumber __swiftcall NSNumber.init(integerLiteral:)(Swift::Int integerLiteral)
{
  return (NSNumber)NSNumber.init(integerLiteral:)(integerLiteral);
}

Swift::Int __swiftcall NSObject._rawHashValue(seed:)(Swift::Int seed)
{
  return NSObject._rawHashValue(seed:)(seed);
}

uint64_t static NSObject.== infix(_:_:)()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)()
{
  return StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t static _SetStorage.allocate(capacity:)()
{
  return static _SetStorage.allocate(capacity:)();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases._rawValue, string._countAndFlagsBits, string._object);
}

uint64_t KeyedDecodingContainer.decode(_:forKey:)()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t KeyedDecodingContainer.decode<A>(_:forKey:)()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t KeyedEncodingContainer.encode(_:forKey:)()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t KeyedEncodingContainer.encode<A>(_:forKey:)()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

uint64_t dispatch thunk of Decoder.container<A>(keyedBy:)()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t dispatch thunk of Encoder.container<A>(keyedBy:)()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return _CC_SHA1(data, len, md);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
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

CFStringRef CFURLCreateStringByAddingPercentEscapes(CFAllocatorRef allocator, CFStringRef originalString, CFStringRef charactersToLeaveUnescaped, CFStringRef legalURLCharactersToBeEscaped, CFStringEncoding encoding)
{
  return _CFURLCreateStringByAddingPercentEscapes(allocator, originalString, charactersToLeaveUnescaped, legalURLCharactersToBeEscaped, encoding);
}

uint64_t INCreateError()
{
  return _INCreateError();
}

uint64_t INCreateErrorWithError()
{
  return _INCreateErrorWithError();
}

uint64_t INCreateErrorWithKeychainError()
{
  return _INCreateErrorWithKeychainError();
}

uint64_t INCreateErrorWithMessage()
{
  return _INCreateErrorWithMessage();
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t MGGetSInt32Answer()
{
  return _MGGetSInt32Answer();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return _MKBDeviceUnlockedSinceBoot();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
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

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _ICQActionForString()
{
  return __ICQActionForString();
}

uint64_t _INLogSystem()
{
  return __INLogSystem();
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

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint64_t abort_report_np()
{
  return _abort_report_np();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
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

char *dlerror(void)
{
  return _dlerror();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

void free(void *a1)
{
}

int fsctl(const char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  return _fsctl(a1, a2, a3, a4);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
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
  return _objc_getClass(name);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

int sem_close(sem_t *a1)
{
  return _sem_close(a1);
}

sem_t *sem_open(const char *a1, int a2, ...)
{
  return _sem_open(a1, a2);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

uint64_t swift_allocError()
{
  return _swift_allocError();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
}

uint64_t swift_deletedMethodError()
{
  return _swift_deletedMethodError();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_create()
{
  return _swift_task_create();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return _xpc_activity_get_state(activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

void xpc_activity_set_criteria(xpc_activity_t activity, xpc_object_t criteria)
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

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_uint64(xdict, key);
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

id objc_msgSend_HTTPBody(void *a1, const char *a2, ...)
{
  return _[a1 HTTPBody];
}

id objc_msgSend_JSONObjectWithData_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "JSONObjectWithData:options:error:");
}

id objc_msgSend_URLQueryAllowedCharacterSet(void *a1, const char *a2, ...)
{
  return _[a1 URLQueryAllowedCharacterSet];
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_XPCInterface(void *a1, const char *a2, ...)
{
  return _[a1 XPCInterface];
}

id objc_msgSend__audioAccessoryInfo(void *a1, const char *a2, ...)
{
  return _[a1 _audioAccessoryInfo];
}

id objc_msgSend__backupDevice(void *a1, const char *a2, ...)
{
  return _[a1 _backupDevice];
}

id objc_msgSend__backupDeviceGroup(void *a1, const char *a2, ...)
{
  return _[a1 _backupDeviceGroup];
}

id objc_msgSend__backupDeviceUDID(void *a1, const char *a2, ...)
{
  return _[a1 _backupDeviceUDID];
}

id objc_msgSend__backupInfo(void *a1, const char *a2, ...)
{
  return _[a1 _backupInfo];
}

id objc_msgSend__basicBodyParameters(void *a1, const char *a2, ...)
{
  return _[a1 _basicBodyParameters];
}

id objc_msgSend__bodyParameters(void *a1, const char *a2, ...)
{
  return _[a1 _bodyParameters];
}

id objc_msgSend__cleanUpIfNoAccountsAreLeftOtherThanAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_cleanUpIfNoAccountsAreLeftOtherThanAccount:");
}

id objc_msgSend__configureXPCActivityWithCriteria_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_configureXPCActivityWithCriteria:");
}

id objc_msgSend__configureXPCEventStreamHandler(void *a1, const char *a2, ...)
{
  return _[a1 _configureXPCEventStreamHandler];
}

id objc_msgSend__currentBootSessionUUID(void *a1, const char *a2, ...)
{
  return _[a1 _currentBootSessionUUID];
}

id objc_msgSend__disablePushTopics(void *a1, const char *a2, ...)
{
  return _[a1 _disablePushTopics];
}

id objc_msgSend__dismissNotificationsForPushEventWithID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_dismissNotificationsForPushEventWithID:");
}

id objc_msgSend__enablePushTopics(void *a1, const char *a2, ...)
{
  return _[a1 _enablePushTopics];
}

id objc_msgSend__endpoint(void *a1, const char *a2, ...)
{
  return _[a1 _endpoint];
}

id objc_msgSend__ensureDesiredAPSEnvironmentIsInUseWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_ensureDesiredAPSEnvironmentIsInUseWithCompletion:");
}

id objc_msgSend__handleDeviceDidPairEvent(void *a1, const char *a2, ...)
{
  return _[a1 _handleDeviceDidPairEvent];
}

id objc_msgSend__handleDeviceNameChangeEvent(void *a1, const char *a2, ...)
{
  return _[a1 _handleDeviceNameChangeEvent];
}

id objc_msgSend__handleEventDetailsResponse_forEventID_accountID_pushMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleEventDetailsResponse:forEventID:accountID:pushMessage:");
}

id objc_msgSend__handleGMSAvailabilityChange(void *a1, const char *a2, ...)
{
  return _[a1 _handleGMSAvailabilityChange];
}

id objc_msgSend__handleLanguageChangedEvent(void *a1, const char *a2, ...)
{
  return _[a1 _handleLanguageChangedEvent];
}

id objc_msgSend__handleModelCatalogChange(void *a1, const char *a2, ...)
{
  return _[a1 _handleModelCatalogChange];
}

id objc_msgSend__handleOSEligibilityChange(void *a1, const char *a2, ...)
{
  return _[a1 _handleOSEligibilityChange];
}

id objc_msgSend__handleRegistrationResponse_forRequest_digest_account_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleRegistrationResponse:forRequest:digest:account:completion:");
}

id objc_msgSend__handleUnregistrationResponse_account_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleUnregistrationResponse:account:completion:");
}

id objc_msgSend__iCloudAccountType(void *a1, const char *a2, ...)
{
  return _[a1 _iCloudAccountType];
}

id objc_msgSend__imageURL(void *a1, const char *a2, ...)
{
  return _[a1 _imageURL];
}

id objc_msgSend__initiateAPSConnectionWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_initiateAPSConnectionWithCompletion:");
}

id objc_msgSend__isFirstLaunchAfterBoot(void *a1, const char *a2, ...)
{
  return _[a1 _isFirstLaunchAfterBoot];
}

id objc_msgSend__isFirstLaunchAfterBootiOS(void *a1, const char *a2, ...)
{
  return _[a1 _isFirstLaunchAfterBootiOS];
}

id objc_msgSend__isValidPush_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isValidPush:");
}

id objc_msgSend__loadPushNotificationHandlers(void *a1, const char *a2, ...)
{
  return _[a1 _loadPushNotificationHandlers];
}

id objc_msgSend__mockMediaStorage(void *a1, const char *a2, ...)
{
  return _[a1 _mockMediaStorage];
}

id objc_msgSend__parseBackUpDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_parseBackUpDevice:");
}

id objc_msgSend__parseBackUpDeviceGroups_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_parseBackUpDeviceGroups:");
}

id objc_msgSend__parseResponseDict(void *a1, const char *a2, ...)
{
  return _[a1 _parseResponseDict];
}

id objc_msgSend__parseSpecifierInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_parseSpecifierInfo:");
}

id objc_msgSend__parseSubscriptionInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_parseSubscriptionInfo:");
}

id objc_msgSend__parseTip_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_parseTip:");
}

id objc_msgSend__parseTipAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_parseTipAction:");
}

id objc_msgSend__parseTipActionLink_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_parseTipActionLink:");
}

id objc_msgSend__parseTipCriteria_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_parseTipCriteria:");
}

id objc_msgSend__parseTipIcon_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_parseTipIcon:");
}

id objc_msgSend__parseTips_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_parseTips:");
}

id objc_msgSend__parseUsageByMedia_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_parseUsageByMedia:");
}

id objc_msgSend__parseiCloudPlusFeature_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_parseiCloudPlusFeature:");
}

id objc_msgSend__performLoggedOutHeartbeatRegistrationIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 _performLoggedOutHeartbeatRegistrationIfNeeded];
}

id objc_msgSend__planForRegistrationTTL_account_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_planForRegistrationTTL:account:");
}

id objc_msgSend__refreshAppleAccount_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_refreshAppleAccount:completion:");
}

id objc_msgSend__requestEventDetailsForPushMessage_withEventID_recipientDSID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_requestEventDetailsForPushMessage:withEventID:recipientDSID:");
}

id objc_msgSend__scheduleNextFireForDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_scheduleNextFireForDate:");
}

id objc_msgSend__sendAcknowledgementForNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sendAcknowledgementForNotification:");
}

id objc_msgSend__sendNetworkRequestForTip_request_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sendNetworkRequestForTip:request:completion:");
}

id objc_msgSend__sendRecommendationActionStatusWithRequest_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sendRecommendationActionStatusWithRequest:completion:");
}

id objc_msgSend__setEnabledTopics_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setEnabledTopics:");
}

id objc_msgSend__specifiersInfo(void *a1, const char *a2, ...)
{
  return _[a1 _specifiersInfo];
}

id objc_msgSend__stopHeartbeat(void *a1, const char *a2, ...)
{
  return _[a1 _stopHeartbeat];
}

id objc_msgSend__subscriptionInfo(void *a1, const char *a2, ...)
{
  return _[a1 _subscriptionInfo];
}

id objc_msgSend__unregisterAccount_fromiCloudNotificationsWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_unregisterAccount:fromiCloudNotificationsWithCompletion:");
}

id objc_msgSend__unregisterAccount_fromiCloudNotificationsWithReason_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_unregisterAccount:fromiCloudNotificationsWithReason:completion:");
}

id objc_msgSend__unsafe_ensureFreshmintActivityValidity(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_unsafe_ensureFreshmintActivityValidity");
}

id objc_msgSend__unsafe_handlePhotosOptimizeStateChangedEvent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_unsafe_handlePhotosOptimizeStateChangedEvent");
}

id objc_msgSend__unsafe_handlePhotosiCPLStateChangedEvent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_unsafe_handlePhotosiCPLStateChangedEvent");
}

id objc_msgSend__unsafe_handleSimulateVFSAlmostFullEvent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_unsafe_handleSimulateVFSAlmostFullEvent");
}

id objc_msgSend__unsafe_handleSimulateVFSNotFullEvent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_unsafe_handleSimulateVFSNotFullEvent");
}

id objc_msgSend__unsafe_handleVFSFallBelowLowDisk(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_unsafe_handleVFSFallBelowLowDisk");
}

id objc_msgSend__unsafe_handleVFSFallBelowNearLowDisk(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_unsafe_handleVFSFallBelowNearLowDisk");
}

id objc_msgSend__unsafe_handleVFSFallBelowVeryLowDisk(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_unsafe_handleVFSFallBelowVeryLowDisk");
}

id objc_msgSend__unsafe_handleVFSRiseAboveDesiredDisk(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_unsafe_handleVFSRiseAboveDesiredDisk");
}

id objc_msgSend__unsafe_handleVFSRiseAboveLowDisk(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_unsafe_handleVFSRiseAboveLowDisk");
}

id objc_msgSend__unsafe_icqReconsiderOffers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_unsafe_icqReconsiderOffers");
}

id objc_msgSend__unsafe_icqReconsiderOffersWithReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_unsafe_icqReconsiderOffersWithReason:");
}

id objc_msgSend__unsafe_icqReconsiderOffersWithReason_reuseLocalOffers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_unsafe_icqReconsiderOffersWithReason:reuseLocalOffers:");
}

id objc_msgSend__unsafe_icqReconsiderOffersWithReason_reuseLocalOffers_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_unsafe_icqReconsiderOffersWithReason:reuseLocalOffers:completion:");
}

id objc_msgSend__unsafe_icqUpdateOfferForButtonId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_unsafe_icqUpdateOfferForButtonId:");
}

id objc_msgSend__unsafe_isLegacyDeviceStorageLevelNotificationEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_unsafe_isLegacyDeviceStorageLevelNotificationEnabled");
}

id objc_msgSend__unsafe_performFreshmintRefreshWithReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_unsafe_performFreshmintRefreshWithReason:");
}

id objc_msgSend__validateEnabledTopics(void *a1, const char *a2, ...)
{
  return _[a1 _validateEnabledTopics];
}

id objc_msgSend__validateRegistrationStateIfFirstLaunch(void *a1, const char *a2, ...)
{
  return _[a1 _validateRegistrationStateIfFirstLaunch];
}

id objc_msgSend_aa_addBasicAuthorizationHeaderWithAccount_preferUsingPassword_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_addBasicAuthorizationHeaderWithAccount:preferUsingPassword:");
}

id objc_msgSend_aa_addDeviceIDHeader(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_addDeviceIDHeader");
}

id objc_msgSend_aa_addMultiUserDeviceHeaderIfEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_addMultiUserDeviceHeaderIfEnabled");
}

id objc_msgSend_aa_altDSID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_altDSID");
}

id objc_msgSend_aa_appleAccountType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_appleAccountType");
}

id objc_msgSend_aa_appleAccountWithAltDSID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_appleAccountWithAltDSID:");
}

id objc_msgSend_aa_appleAccountWithPersonID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_appleAccountWithPersonID:");
}

id objc_msgSend_aa_appleAccounts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_appleAccounts");
}

id objc_msgSend_aa_authTokenWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_authTokenWithError:");
}

id objc_msgSend_aa_isAccountClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_isAccountClass:");
}

id objc_msgSend_aa_isPrimaryAccount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_isPrimaryAccount");
}

id objc_msgSend_aa_isSuspended(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_isSuspended");
}

id objc_msgSend_aa_personID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_personID");
}

id objc_msgSend_aa_primaryAppleAccount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_primaryAppleAccount");
}

id objc_msgSend_aaf_toHexString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aaf_toHexString");
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return _[a1 absoluteString];
}

id objc_msgSend_account(void *a1, const char *a2, ...)
{
  return _[a1 account];
}

id objc_msgSend_accountPushNotificationHandlerForEventType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accountPushNotificationHandlerForEventType:");
}

id objc_msgSend_accountStore(void *a1, const char *a2, ...)
{
  return _[a1 accountStore];
}

id objc_msgSend_accountType(void *a1, const char *a2, ...)
{
  return _[a1 accountType];
}

id objc_msgSend_accountWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accountWithIdentifier:");
}

id objc_msgSend_accountsToReconsiderAfterReboot(void *a1, const char *a2, ...)
{
  return _[a1 accountsToReconsiderAfterReboot];
}

id objc_msgSend_actionForOpeningWebURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionForOpeningWebURL:");
}

id objc_msgSend_actionName(void *a1, const char *a2, ...)
{
  return _[a1 actionName];
}

id objc_msgSend_actionURL(void *a1, const char *a2, ...)
{
  return _[a1 actionURL];
}

id objc_msgSend_activeAPSEnvironment(void *a1, const char *a2, ...)
{
  return _[a1 activeAPSEnvironment];
}

id objc_msgSend_activityID(void *a1, const char *a2, ...)
{
  return _[a1 activityID];
}

id objc_msgSend_activityNextFireDateKey(void *a1, const char *a2, ...)
{
  return _[a1 activityNextFireDateKey];
}

id objc_msgSend_addBodyParameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addBodyParameters:");
}

id objc_msgSend_addCommonHeadersToRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addCommonHeadersToRequest:");
}

id objc_msgSend_addNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addNotification:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addObserverForName_object_queue_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserverForName:object:queue:usingBlock:");
}

id objc_msgSend_addOperation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addOperation:");
}

id objc_msgSend_addValue_forHTTPHeaderField_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addValue:forHTTPHeaderField:");
}

id objc_msgSend_allHTTPHeaderFields(void *a1, const char *a2, ...)
{
  return _[a1 allHTTPHeaderFields];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _[a1 allObjects];
}

id objc_msgSend_alternateButtonURL(void *a1, const char *a2, ...)
{
  return _[a1 alternateButtonURL];
}

id objc_msgSend_ams_DSID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_DSID");
}

id objc_msgSend_ams_activeiTunesAccount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_activeiTunesAccount");
}

id objc_msgSend_ams_sharedAccountStore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_sharedAccountStore");
}

id objc_msgSend_appCloudStorage(void *a1, const char *a2, ...)
{
  return _[a1 appCloudStorage];
}

id objc_msgSend_appCloudStorageForBundleId_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appCloudStorageForBundleId:completion:");
}

id objc_msgSend_appLaunchLinkTrackerSetLastShownDate_forBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appLaunchLinkTrackerSetLastShownDate:forBundleID:");
}

id objc_msgSend_appsSyncingToDrive(void *a1, const char *a2, ...)
{
  return _[a1 appsSyncingToDrive];
}

id objc_msgSend_apsConnection(void *a1, const char *a2, ...)
{
  return _[a1 apsConnection];
}

id objc_msgSend_apsEnvironment(void *a1, const char *a2, ...)
{
  return _[a1 apsEnvironment];
}

id objc_msgSend_archivedDataWithRootObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "archivedDataWithRootObject:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_attemptRenewCredentialsWithAccount_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attemptRenewCredentialsWithAccount:completion:");
}

id objc_msgSend_audioAccessorySerialNumbersWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "audioAccessorySerialNumbersWithCompletion:");
}

id objc_msgSend_backupDeviceUUID(void *a1, const char *a2, ...)
{
  return _[a1 backupDeviceUUID];
}

id objc_msgSend_backupInfo(void *a1, const char *a2, ...)
{
  return _[a1 backupInfo];
}

id objc_msgSend_base64EncodedStringWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "base64EncodedStringWithOptions:");
}

id objc_msgSend_bodyParameterValueForRegistrationReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bodyParameterValueForRegistrationReason:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_buttonTitle(void *a1, const char *a2, ...)
{
  return _[a1 buttonTitle];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return _[a1 bytes];
}

id objc_msgSend_calculateExtraQuotaNeededToSyncForAccountWithID_isAccountFull_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "calculateExtraQuotaNeededToSyncForAccountWithID:isAccountFull:completion:");
}

id objc_msgSend_cancelPrebuddy(void *a1, const char *a2, ...)
{
  return _[a1 cancelPrebuddy];
}

id objc_msgSend_checkIn(void *a1, const char *a2, ...)
{
  return _[a1 checkIn];
}

id objc_msgSend_clearCacheAndNotify(void *a1, const char *a2, ...)
{
  return _[a1 clearCacheAndNotify];
}

id objc_msgSend_clearClientCacheWithCacheTypes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearClientCacheWithCacheTypes:");
}

id objc_msgSend_clearNotificationState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearNotificationState:");
}

id objc_msgSend_cloudStorageApps(void *a1, const char *a2, ...)
{
  return _[a1 cloudStorageApps];
}

id objc_msgSend_cloudStorageApps_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cloudStorageApps:");
}

id objc_msgSend_cloudStorageSummary(void *a1, const char *a2, ...)
{
  return _[a1 cloudStorageSummary];
}

id objc_msgSend_cloudStorageSummary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cloudStorageSummary:");
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "compare:");
}

id objc_msgSend_completedURL(void *a1, const char *a2, ...)
{
  return _[a1 completedURL];
}

id objc_msgSend_configurationWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configurationWithCompletion:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_creationDateOfOldestFollowUpWithIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "creationDateOfOldestFollowUpWithIdentifiers:");
}

id objc_msgSend_currentDeviceInfo(void *a1, const char *a2, ...)
{
  return _[a1 currentDeviceInfo];
}

id objc_msgSend_currentInfo(void *a1, const char *a2, ...)
{
  return _[a1 currentInfo];
}

id objc_msgSend_currentPersona(void *a1, const char *a2, ...)
{
  return _[a1 currentPersona];
}

id objc_msgSend_daemonOfferDictionaryForAccount_options_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "daemonOfferDictionaryForAccount:options:completion:");
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return _[a1 data];
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithBytes:length:");
}

id objc_msgSend_dataWithJSONObject_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithJSONObject:options:error:");
}

id objc_msgSend_dataWithPropertyList_format_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithPropertyList:format:options:error:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_dateByAddingTimeInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateByAddingTimeInterval:");
}

id objc_msgSend_dateWithTimeIntervalSinceNow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeIntervalSinceNow:");
}

id objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeIntervalSinceReferenceDate:");
}

id objc_msgSend_defaultButtonTitle(void *a1, const char *a2, ...)
{
  return _[a1 defaultButtonTitle];
}

id objc_msgSend_defaultButtonURL(void *a1, const char *a2, ...)
{
  return _[a1 defaultButtonURL];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultStore(void *a1, const char *a2, ...)
{
  return _[a1 defaultStore];
}

id objc_msgSend_delayedOfferFailsafeActivity(void *a1, const char *a2, ...)
{
  return _[a1 delayedOfferFailsafeActivity];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _[a1 description];
}

id objc_msgSend_deviceBackingColor(void *a1, const char *a2, ...)
{
  return _[a1 deviceBackingColor];
}

id objc_msgSend_deviceClass(void *a1, const char *a2, ...)
{
  return _[a1 deviceClass];
}

id objc_msgSend_deviceColor(void *a1, const char *a2, ...)
{
  return _[a1 deviceColor];
}

id objc_msgSend_deviceCoverGlassColor(void *a1, const char *a2, ...)
{
  return _[a1 deviceCoverGlassColor];
}

id objc_msgSend_deviceEnclosureColor(void *a1, const char *a2, ...)
{
  return _[a1 deviceEnclosureColor];
}

id objc_msgSend_deviceHasAnyTicket_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceHasAnyTicket:");
}

id objc_msgSend_deviceHousingColor(void *a1, const char *a2, ...)
{
  return _[a1 deviceHousingColor];
}

id objc_msgSend_deviceInfoProvider(void *a1, const char *a2, ...)
{
  return _[a1 deviceInfoProvider];
}

id objc_msgSend_deviceName(void *a1, const char *a2, ...)
{
  return _[a1 deviceName];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_discoverPropertiesForAccount_options_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "discoverPropertiesForAccount:options:completion:");
}

id objc_msgSend_dismissAlertURL(void *a1, const char *a2, ...)
{
  return _[a1 dismissAlertURL];
}

id objc_msgSend_dismissURL(void *a1, const char *a2, ...)
{
  return _[a1 dismissURL];
}

id objc_msgSend_dismissedNetworkRequestForTip_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismissedNetworkRequestForTip:completion:");
}

id objc_msgSend_displayDelayedOfferWithContext_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayDelayedOfferWithContext:completion:");
}

id objc_msgSend_displayURL(void *a1, const char *a2, ...)
{
  return _[a1 displayURL];
}

id objc_msgSend_displayedNetworkRequestForTip_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayedNetworkRequestForTip:completion:");
}

id objc_msgSend_doesNotRecognizeSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "doesNotRecognizeSelector:");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _[a1 doubleValue];
}

id objc_msgSend_enabledDataclasses(void *a1, const char *a2, ...)
{
  return _[a1 enabledDataclasses];
}

id objc_msgSend_enabledTopics(void *a1, const char *a2, ...)
{
  return _[a1 enabledTopics];
}

id objc_msgSend_endpoint(void *a1, const char *a2, ...)
{
  return _[a1 endpoint];
}

id objc_msgSend_ensureNextActivityWillOccurBeforeDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ensureNextActivityWillOccurBeforeDate:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return _[a1 error];
}

id objc_msgSend_exitMegaBackupMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "exitMegaBackupMode:");
}

id objc_msgSend_expirationDate(void *a1, const char *a2, ...)
{
  return _[a1 expirationDate];
}

id objc_msgSend_fetchAppsSyncingToDrive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchAppsSyncingToDrive:");
}

id objc_msgSend_fetchBackupInfoWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchBackupInfoWithCompletion:");
}

id objc_msgSend_fetchCompletedAndDismissedRecommendationsWithConfiguration_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchCompletedAndDismissedRecommendationsWithConfiguration:completion:");
}

id objc_msgSend_fetchOfferReasonWithRegistrationReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchOfferReasonWithRegistrationReason:");
}

id objc_msgSend_fetchRecommendationRules_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchRecommendationRules:");
}

id objc_msgSend_fetchServerRecommendations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchServerRecommendations:");
}

id objc_msgSend_freshmintActivity(void *a1, const char *a2, ...)
{
  return _[a1 freshmintActivity];
}

id objc_msgSend_getAccountEventDetailsURL(void *a1, const char *a2, ...)
{
  return _[a1 getAccountEventDetailsURL];
}

id objc_msgSend_getCachedContentWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getCachedContentWithCompletion:");
}

id objc_msgSend_getDevices(void *a1, const char *a2, ...)
{
  return _[a1 getDevices];
}

id objc_msgSend_handleICloudQuotaPush_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleICloudQuotaPush:");
}

id objc_msgSend_handleIncomingPushNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleIncomingPushNotification:");
}

id objc_msgSend_handlePushRegistrationWithAccount_reason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handlePushRegistrationWithAccount:reason:");
}

id objc_msgSend_handlePushUnregistrationWithAccount_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handlePushUnregistrationWithAccount:completion:");
}

id objc_msgSend_hasCellularCapability(void *a1, const char *a2, ...)
{
  return _[a1 hasCellularCapability];
}

id objc_msgSend_httpResponse(void *a1, const char *a2, ...)
{
  return _[a1 httpResponse];
}

id objc_msgSend_id(void *a1, const char *a2, ...)
{
  return _[a1 id];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_in_registrationExpirationDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "in_registrationExpirationDate");
}

id objc_msgSend_in_setRegistrationExpirationDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "in_setRegistrationExpirationDate:");
}

id objc_msgSend_ind_addQuotaHeadersForAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ind_addQuotaHeadersForAccount:");
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return _[a1 init];
}

id objc_msgSend_initForAccountWithType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initForAccountWithType:");
}

id objc_msgSend_initFromDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initFromDictionary:");
}

id objc_msgSend_initWithAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAccount:");
}

id objc_msgSend_initWithAccount_bundleId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAccount:bundleId:");
}

id objc_msgSend_initWithAccount_configuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAccount:configuration:");
}

id objc_msgSend_initWithAccount_configuration_params_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAccount:configuration:params:");
}

id objc_msgSend_initWithAccount_delegate_eventQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAccount:delegate:eventQueue:");
}

id objc_msgSend_initWithAccount_pushMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAccount:pushMessage:");
}

id objc_msgSend_initWithAccount_pushToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAccount:pushToken:");
}

id objc_msgSend_initWithAccount_store_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAccount:store:");
}

id objc_msgSend_initWithAccount_tip_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAccount:tip:");
}

id objc_msgSend_initWithAccount_withBackupDeviceUDID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAccount:withBackupDeviceUDID:");
}

id objc_msgSend_initWithAccountForActionCancelledStatus_configuration_recommendations_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAccountForActionCancelledStatus:configuration:recommendations:context:");
}

id objc_msgSend_initWithAccountForActionCompletedStatus_configuration_recommendations_storageRecovered_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAccountForActionCompletedStatus:configuration:recommendations:storageRecovered:context:");
}

id objc_msgSend_initWithAccountForDismissStatus_configuration_recommendations_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAccountForDismissStatus:configuration:recommendations:context:");
}

id objc_msgSend_initWithAccountForDismissStatus_tip_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAccountForDismissStatus:tip:");
}

id objc_msgSend_initWithAccountForDisplayStatus_configuration_recommendations_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAccountForDisplayStatus:configuration:recommendations:context:");
}

id objc_msgSend_initWithAccountForDisplayStatus_tip_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAccountForDisplayStatus:tip:");
}

id objc_msgSend_initWithAccountStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAccountStore:");
}

id objc_msgSend_initWithActionString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithActionString:");
}

id objc_msgSend_initWithActionString_url_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithActionString:url:");
}

id objc_msgSend_initWithCallbackMachService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCallbackMachService:");
}

id objc_msgSend_initWithData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithData:");
}

id objc_msgSend_initWithData_encoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithData:encoding:");
}

id objc_msgSend_initWithDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDelegate:");
}

id objc_msgSend_initWithDeviceInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDeviceInfo:");
}

id objc_msgSend_initWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDictionary:");
}

id objc_msgSend_initWithEnvironmentName_namedDelegatePort_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEnvironmentName:namedDelegatePort:queue:");
}

id objc_msgSend_initWithHTTPResponse_data_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithHTTPResponse:data:");
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMachServiceName:");
}

id objc_msgSend_initWithName_value_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:value:");
}

id objc_msgSend_initWithRegistrationRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRegistrationRequest:");
}

id objc_msgSend_initWithRemoteContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRemoteContext:");
}

id objc_msgSend_initWithRequest_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRequest:handler:");
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithString:");
}

id objc_msgSend_initWithTarget_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTarget:action:");
}

id objc_msgSend_initWithText_action_parameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithText:action:parameters:");
}

id objc_msgSend_internationalMobileEquipmentIdentity(void *a1, const char *a2, ...)
{
  return _[a1 internationalMobileEquipmentIdentity];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _[a1 invalidate];
}

id objc_msgSend_invocationWithMethodSignature_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invocationWithMethodSignature:");
}

id objc_msgSend_invoke(void *a1, const char *a2, ...)
{
  return _[a1 invoke];
}

id objc_msgSend_isAvailable(void *a1, const char *a2, ...)
{
  return _[a1 isAvailable];
}

id objc_msgSend_isEnabledForDataclass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEnabledForDataclass:");
}

id objc_msgSend_isEnterprisePersona(void *a1, const char *a2, ...)
{
  return _[a1 isEnterprisePersona];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToData:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isLegacyDeviceStorageLevelNotificationEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isLegacyDeviceStorageLevelNotificationEnabled];
}

id objc_msgSend_isRepeating(void *a1, const char *a2, ...)
{
  return _[a1 isRepeating];
}

id objc_msgSend_isResponseEmpty(void *a1, const char *a2, ...)
{
  return _[a1 isResponseEmpty];
}

id objc_msgSend_isRunning(void *a1, const char *a2, ...)
{
  return _[a1 isRunning];
}

id objc_msgSend_isValidEnvironment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isValidEnvironment:");
}

id objc_msgSend_leftSerialNumber(void *a1, const char *a2, ...)
{
  return _[a1 leftSerialNumber];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_listener(void *a1, const char *a2, ...)
{
  return _[a1 listener];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return _[a1 localizedDescription];
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return _[a1 lock];
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return _[a1 mainRunLoop];
}

id objc_msgSend_message(void *a1, const char *a2, ...)
{
  return _[a1 message];
}

id objc_msgSend_methodSignatureForSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "methodSignatureForSelector:");
}

id objc_msgSend_mobileEquipmentIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 mobileEquipmentIdentifier];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return _[a1 now];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_parameters(void *a1, const char *a2, ...)
{
  return _[a1 parameters];
}

id objc_msgSend_performRequestWithSession_withHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performRequestWithSession:withHandler:");
}

id objc_msgSend_postCFUIfEligible(void *a1, const char *a2, ...)
{
  return _[a1 postCFUIfEligible];
}

id objc_msgSend_postFollowUp(void *a1, const char *a2, ...)
{
  return _[a1 postFollowUp];
}

id objc_msgSend_postNotificationName_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotificationName:object:");
}

id objc_msgSend_prebuddyBackupDeleted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prebuddyBackupDeleted:");
}

id objc_msgSend_presentHiddenFreshmintFlowWithEndpoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentHiddenFreshmintFlowWithEndpoint:");
}

id objc_msgSend_processPushNotificationDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processPushNotificationDictionary:");
}

id objc_msgSend_processPushNotificationDictionary_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processPushNotificationDictionary:completion:");
}

id objc_msgSend_productType(void *a1, const char *a2, ...)
{
  return _[a1 productType];
}

id objc_msgSend_productVersion(void *a1, const char *a2, ...)
{
  return _[a1 productVersion];
}

id objc_msgSend_propertiesForDataclass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertiesForDataclass:");
}

id objc_msgSend_publicToken(void *a1, const char *a2, ...)
{
  return _[a1 publicToken];
}

id objc_msgSend_pushToken(void *a1, const char *a2, ...)
{
  return _[a1 pushToken];
}

id objc_msgSend_pushTopics(void *a1, const char *a2, ...)
{
  return _[a1 pushTopics];
}

id objc_msgSend_quotaPushNotificationHandlerForEventType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "quotaPushNotificationHandlerForEventType:");
}

id objc_msgSend_reconsiderOffersWithReason_reuseLocalOffers_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reconsiderOffersWithReason:reuseLocalOffers:completion:");
}

id objc_msgSend_reconsideringOffers(void *a1, const char *a2, ...)
{
  return _[a1 reconsideringOffers];
}

id objc_msgSend_registerDeviceForLoggedOutiCloudNotificationsWithReason_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerDeviceForLoggedOutiCloudNotificationsWithReason:completion:");
}

id objc_msgSend_registerDeviceURL(void *a1, const char *a2, ...)
{
  return _[a1 registerDeviceURL];
}

id objc_msgSend_registerForLoggedOutPushWithToken_reason_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerForLoggedOutPushWithToken:reason:completion:");
}

id objc_msgSend_registerForPushNotificationsWithAccount_pushToken_reason_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerForPushNotificationsWithAccount:pushToken:reason:completion:");
}

id objc_msgSend_registerForPushNotificationsWithAccount_reason_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerForPushNotificationsWithAccount:reason:completion:");
}

id objc_msgSend_registeredDeviceWithExpirationDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registeredDeviceWithExpirationDate:");
}

id objc_msgSend_registrar(void *a1, const char *a2, ...)
{
  return _[a1 registrar];
}

id objc_msgSend_registrationDigestForAccount_withError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registrationDigestForAccount:withError:");
}

id objc_msgSend_removeNotificationsWithEventIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeNotificationsWithEventIdentifier:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_removeRegistrationDigestForAccount_withError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeRegistrationDigestForAccount:withError:");
}

id objc_msgSend_renewCredentialsForAccount_options_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "renewCredentialsForAccount:options:completion:");
}

id objc_msgSend_renewCredentialsWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "renewCredentialsWithCompletion:");
}

id objc_msgSend_responseDictionary(void *a1, const char *a2, ...)
{
  return _[a1 responseDictionary];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _[a1 resume];
}

id objc_msgSend_revalidateCFU(void *a1, const char *a2, ...)
{
  return _[a1 revalidateCFU];
}

id objc_msgSend_rightSerialNumber(void *a1, const char *a2, ...)
{
  return _[a1 rightSerialNumber];
}

id objc_msgSend_ruleConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 ruleConfiguration];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return _[a1 run];
}

id objc_msgSend_saveAccount_withDataclassActions_doVerify_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveAccount:withDataclassActions:doVerify:completion:");
}

id objc_msgSend_sendStatusForRecommendationWithConfiguration_params_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendStatusForRecommendationWithConfiguration:params:completion:");
}

id objc_msgSend_sendStatusForRecommendationsWithAltDSID_configuration_params_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendStatusForRecommendationsWithAltDSID:configuration:params:completion:");
}

id objc_msgSend_serialNumber(void *a1, const char *a2, ...)
{
  return _[a1 serialNumber];
}

id objc_msgSend_serverRecommendations(void *a1, const char *a2, ...)
{
  return _[a1 serverRecommendations];
}

id objc_msgSend_setAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccount:");
}

id objc_msgSend_setActionName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActionName:");
}

id objc_msgSend_setActionType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActionType:");
}

id objc_msgSend_setActionURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActionURL:");
}

id objc_msgSend_setActions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActions:");
}

id objc_msgSend_setActivateAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActivateAction:");
}

id objc_msgSend_setActivateButtonTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActivateButtonTitle:");
}

id objc_msgSend_setActiveAPSEnvironment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActiveAPSEnvironment:");
}

id objc_msgSend_setActivityID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActivityID:");
}

id objc_msgSend_setActivityNextFireDateKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActivityNextFireDateKey:");
}

id objc_msgSend_setActivityState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActivityState:");
}

id objc_msgSend_setAnchor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAnchor:");
}

id objc_msgSend_setApsConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setApsConnection:");
}

id objc_msgSend_setArrowConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setArrowConfiguration:");
}

id objc_msgSend_setBackupDevices_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackupDevices:");
}

id objc_msgSend_setBackupFailedByinBytes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackupFailedByinBytes:");
}

id objc_msgSend_setBackupInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackupInfo:");
}

id objc_msgSend_setBackupSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackupSize:");
}

id objc_msgSend_setBackupTimestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackupTimestamp:");
}

id objc_msgSend_setBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBundleID:");
}

id objc_msgSend_setButtonTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setButtonTitle:");
}

id objc_msgSend_setBytesRequiredForBackup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBytesRequiredForBackup:");
}

id objc_msgSend_setCommerceStorage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCommerceStorage:");
}

id objc_msgSend_setCriteria_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCriteria:");
}

id objc_msgSend_setCriteriaURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCriteriaURL:");
}

id objc_msgSend_setDelayedOfferFailsafeActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelayedOfferFailsafeActivity:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDeleteButtonLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeleteButtonLabel:");
}

id objc_msgSend_setDeleteURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeleteURL:");
}

id objc_msgSend_setDetailViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDetailViewController:");
}

id objc_msgSend_setDeviceGroups_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceGroups:");
}

id objc_msgSend_setDeviceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceName:");
}

id objc_msgSend_setDeviceSubtitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceSubtitle:");
}

id objc_msgSend_setDeviceUDID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceUDID:");
}

id objc_msgSend_setDisabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisabled:");
}

id objc_msgSend_setDismissAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDismissAction:");
}

id objc_msgSend_setDismissURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDismissURL:");
}

id objc_msgSend_setDisplayColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisplayColor:");
}

id objc_msgSend_setDisplayColorDark_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisplayColorDark:");
}

id objc_msgSend_setDisplayLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisplayLabel:");
}

id objc_msgSend_setDisplayURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisplayURL:");
}

id objc_msgSend_setEventIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEventIdentifier:");
}

id objc_msgSend_setExcludeApps_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExcludeApps:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setFeatureList_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFeatureList:");
}

id objc_msgSend_setFreeStorage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFreeStorage:");
}

id objc_msgSend_setHTTPBody_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHTTPBody:");
}

id objc_msgSend_setHTTPMethod_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHTTPMethod:");
}

id objc_msgSend_setICloudDetailsPageInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setICloudDetailsPageInfo:");
}

id objc_msgSend_setICloudPlusSubscriber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setICloudPlusSubscriber:");
}

id objc_msgSend_setIcon_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIcon:");
}

id objc_msgSend_setIconURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIconURL:");
}

id objc_msgSend_setIcqLink_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIcqLink:");
}

id objc_msgSend_setId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setId:");
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIdentifier:");
}

id objc_msgSend_setImageURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImageURL:");
}

id objc_msgSend_setInterruptionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterruptionHandler:");
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInvalidationHandler:");
}

id objc_msgSend_setIsActive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsActive:");
}

id objc_msgSend_setIsLocalBackup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsLocalBackup:");
}

id objc_msgSend_setIsRepeating_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsRepeating:");
}

id objc_msgSend_setLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLabel:");
}

id objc_msgSend_setLargeImageURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLargeImageURL:");
}

id objc_msgSend_setLiftUIURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLiftUIURL:");
}

id objc_msgSend_setLink_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLink:");
}

id objc_msgSend_setManageStorageActionButtonText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setManageStorageActionButtonText:");
}

id objc_msgSend_setManageStoragePage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setManageStoragePage:");
}

id objc_msgSend_setManageStorageTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setManageStorageTitle:");
}

id objc_msgSend_setManageStorageURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setManageStorageURL:");
}

id objc_msgSend_setMaximumRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaximumRange:");
}

id objc_msgSend_setMediaStorage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMediaStorage:");
}

id objc_msgSend_setMediaType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMediaType:");
}

id objc_msgSend_setMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMessage:");
}

id objc_msgSend_setMinimumRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMinimumRange:");
}

id objc_msgSend_setNextActivityDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNextActivityDate:");
}

id objc_msgSend_setNextHeartbeatDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNextHeartbeatDate:");
}

id objc_msgSend_setNoOfBackupDevices_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNoOfBackupDevices:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPath:");
}

id objc_msgSend_setPresentationWasInvalidated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPresentationWasInvalidated:");
}

id objc_msgSend_setPushEnvironment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPushEnvironment:");
}

id objc_msgSend_setPushMessageInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPushMessageInfo:");
}

id objc_msgSend_setPushToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPushToken:");
}

id objc_msgSend_setPushTopics_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPushTopics:");
}

id objc_msgSend_setQueryItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setQueryItems:");
}

id objc_msgSend_setReconsideringOffers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReconsideringOffers:");
}

id objc_msgSend_setRegistrationReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRegistrationReason:");
}

id objc_msgSend_setRuiURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRuiURL:");
}

id objc_msgSend_setSectionFooter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSectionFooter:");
}

id objc_msgSend_setSectionHeader_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSectionHeader:");
}

id objc_msgSend_setSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelector:");
}

id objc_msgSend_setSimulatedDeviceStorageAlmostFull_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSimulatedDeviceStorageAlmostFull:");
}

id objc_msgSend_setSpecifiersInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSpecifiersInfo:");
}

id objc_msgSend_setStorageUsed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStorageUsed:");
}

id objc_msgSend_setStorageUsedLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStorageUsedLabel:");
}

id objc_msgSend_setSubTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSubTitle:");
}

id objc_msgSend_setSublabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSublabel:");
}

id objc_msgSend_setSubscriptionInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSubscriptionInfo:");
}

id objc_msgSend_setSystemColorName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSystemColorName:");
}

id objc_msgSend_setTarget_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTarget:");
}

id objc_msgSend_setTips_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTips:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setTotalStorage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTotalStorage:");
}

id objc_msgSend_setType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setType:");
}

id objc_msgSend_setURL1x_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setURL1x:");
}

id objc_msgSend_setURL2x_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setURL2x:");
}

id objc_msgSend_setURL3x_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setURL3x:");
}

id objc_msgSend_setUsedStorage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUsedStorage:");
}

id objc_msgSend_setUserInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserInfo:");
}

id objc_msgSend_setValue_forHTTPHeaderField_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forHTTPHeaderField:");
}

id objc_msgSend_setValue_forManagedDefault_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forManagedDefault:");
}

id objc_msgSend_shared(void *a1, const char *a2, ...)
{
  return _[a1 shared];
}

id objc_msgSend_sharedDaemonOfferManager(void *a1, const char *a2, ...)
{
  return _[a1 sharedDaemonOfferManager];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return _[a1 sharedManager];
}

id objc_msgSend_sharedServerWithNoUrlCache(void *a1, const char *a2, ...)
{
  return _[a1 sharedServerWithNoUrlCache];
}

id objc_msgSend_sharedSessionWithNoUrlCache(void *a1, const char *a2, ...)
{
  return _[a1 sharedSessionWithNoUrlCache];
}

id objc_msgSend_sharedSigner(void *a1, const char *a2, ...)
{
  return _[a1 sharedSigner];
}

id objc_msgSend_showAlert(void *a1, const char *a2, ...)
{
  return _[a1 showAlert];
}

id objc_msgSend_shutdown(void *a1, const char *a2, ...)
{
  return _[a1 shutdown];
}

id objc_msgSend_signalPrebuddy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "signalPrebuddy:");
}

id objc_msgSend_signatureForData_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "signatureForData:completion:");
}

id objc_msgSend_soonestOfferOrStubExpirationDate(void *a1, const char *a2, ...)
{
  return _[a1 soonestOfferOrStubExpirationDate];
}

id objc_msgSend_sortUsingComparator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortUsingComparator:");
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return _[a1 standardUserDefaults];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return _[a1 start];
}

id objc_msgSend_startActivityWithDelaySecs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startActivityWithDelaySecs:");
}

id objc_msgSend_startDirectingToStorageManagement(void *a1, const char *a2, ...)
{
  return _[a1 startDirectingToStorageManagement];
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return _[a1 statusCode];
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return _[a1 stop];
}

id objc_msgSend_stopActivity(void *a1, const char *a2, ...)
{
  return _[a1 stopActivity];
}

id objc_msgSend_stopDirectingToStorageManagement(void *a1, const char *a2, ...)
{
  return _[a1 stopDirectingToStorageManagement];
}

id objc_msgSend_storageCapacity(void *a1, const char *a2, ...)
{
  return _[a1 storageCapacity];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return _[a1 string];
}

id objc_msgSend_stringByAddingPercentEncodingWithAllowedCharacters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAddingPercentEncodingWithAllowedCharacters:");
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:");
}

id objc_msgSend_stringForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringForKey:");
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return _[a1 stringValue];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_systemSerialNumber(void *a1, const char *a2, ...)
{
  return _[a1 systemSerialNumber];
}

id objc_msgSend_teardownCachedOffers(void *a1, const char *a2, ...)
{
  return _[a1 teardownCachedOffers];
}

id objc_msgSend_teardownOffersForAccount_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "teardownOffersForAccount:completion:");
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSince1970];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceNow];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_timeToLive(void *a1, const char *a2, ...)
{
  return _[a1 timeToLive];
}

id objc_msgSend_tipStatus(void *a1, const char *a2, ...)
{
  return _[a1 tipStatus];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return _[a1 title];
}

id objc_msgSend_topic(void *a1, const char *a2, ...)
{
  return _[a1 topic];
}

id objc_msgSend_udid(void *a1, const char *a2, ...)
{
  return _[a1 udid];
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return _[a1 unlock];
}

id objc_msgSend_unregisterDeviceFromLoggedOutiCloudNotificationsWithReason_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unregisterDeviceFromLoggedOutiCloudNotificationsWithReason:completion:");
}

id objc_msgSend_unregisterDeviceURL(void *a1, const char *a2, ...)
{
  return _[a1 unregisterDeviceURL];
}

id objc_msgSend_unregisterFromLoggedOutPushNotificationsWithToken_reason_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unregisterFromLoggedOutPushNotificationsWithToken:reason:completionHandler:");
}

id objc_msgSend_unregisterFromPushNotificationsForAccount_pushToken_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unregisterFromPushNotificationsForAccount:pushToken:completion:");
}

id objc_msgSend_unregisteredDevice(void *a1, const char *a2, ...)
{
  return _[a1 unregisteredDevice];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntegerValue];
}

id objc_msgSend_updateOfferForAccount_offerId_buttonId_info_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateOfferForAccount:offerId:buttonId:info:completion:");
}

id objc_msgSend_updateRegistrationDigest_forAccount_withError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateRegistrationDigest:forAccount:withError:");
}

id objc_msgSend_urlConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 urlConfiguration];
}

id objc_msgSend_urlString(void *a1, const char *a2, ...)
{
  return _[a1 urlString];
}

id objc_msgSend_urlStringFromFormat_dsid_udid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "urlStringFromFormat:dsid:udid:");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _[a1 userInfo];
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return _[a1 username];
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForEntitlement:");
}

id objc_msgSend_valueForManagedDefault_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForManagedDefault:");
}

id objc_msgSend_valueForProperty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForProperty:");
}

id objc_msgSend_wasDeviceRegistered(void *a1, const char *a2, ...)
{
  return _[a1 wasDeviceRegistered];
}