uint64_t start()
{
  NSObject *v0;
  ServiceDelegate *v1;
  supd *v2;
  void *v3;
  id v4;
  dispatch_time_t v5;
  NSObject *v6;
  void *v7;
  uint8_t v9[16];

  v0 = sub_1000106A0("lifecycle");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "supd lives!", v9, 2u);
  }

  +[NSError _setFileNameLocalizationEnabled:0];
  v1 = objc_alloc_init(ServiceDelegate);
  v2 = [[supd alloc] initWithConnection:0];
  v3 = (void *)qword_10001DB60;
  qword_10001DB60 = (uint64_t)v2;

  v4 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.securityuploadd"];
  [v4 setDelegate:v1];
  v5 = dispatch_time(0, 5000000000);
  v6 = dispatch_get_global_queue(0, 0);
  dispatch_after(v5, v6, &stru_100018620);

  [v4 resume];
  v7 = +[NSRunLoop currentRunLoop];
  [v7 run];

  return 0;
}

void sub_10000465C(id a1)
{
  v1 = sub_1000106A0("lifecycle");
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "will exit when clean", v2, 2u);
  }

  xpc_transaction_exit_clean();
}

void sub_1000047A4(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = sub_1000106A0("OSAWriteLogForSubmission");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138412290;
    uint64_t v7 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Writing log data to report: %@", (uint8_t *)&v6, 0xCu);
  }

  [v3 writeData:*(void *)(a1 + 40)];
}

void sub_1000049A0(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) store];
  id v10 = 0;
  unsigned __int8 v3 = [v2 openWithError:&v10];
  id v4 = v10;

  if (v3)
  {
    uint64_t v5 = *(void *)(a1 + 40);
    int v6 = [*(id *)(a1 + 32) store];
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

    uint64_t v7 = [*(id *)(a1 + 32) store];
    [v7 close];
  }
  else
  {
    if (!v4 || [v4 code] != (id)23)
    {
      v8 = sub_1000106A0("SecError");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v12 = v4;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "SFAnalytics: could not open db at init, will try again later. Error: %@", buf, 0xCu);
      }
    }
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v7 = [*(id *)(a1 + 32) store];
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v7);
  }
}

void sub_1000051A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_10001DB68);
  _Unwind_Resume(a1);
}

uint64_t sub_1000051E4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000051F4(uint64_t a1)
{
}

void sub_1000051FC(uint64_t a1, int a2, id obj, unsigned char *a4)
{
  *a4 = 1;
}

void sub_1000059CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100005D40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location,char a27)
{
  objc_destroyWeak(v27);
  _Block_object_dispose(&a20, 8);
  _Block_object_dispose(&a27, 8);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100005D80(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    if (!v7 || v9)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a4);
LABEL_16:
      if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
      {
        v23 = sub_1000106A0("upload");
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v24 = *(void *)(*(void *)(a1 + 32) + 40);
          uint64_t v25 = *(void *)(a1 + 48);
          uint64_t v26 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
          *(_DWORD *)buf = 138412802;
          unint64_t v48 = v24;
          __int16 v49 = 2112;
          uint64_t v50 = v25;
          __int16 v51 = 2112;
          uint64_t v52 = v26;
          v27 = "Unable to fetch splunk endpoint at URL for %@: %@ -- error: %@";
          v28 = v23;
          uint32_t v29 = 32;
LABEL_19:
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, v27, buf, v29);
        }
      }
      else
      {
        if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)) {
          goto LABEL_22;
        }
        v23 = sub_1000106A0("upload");
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v30 = *(void *)(*(void *)(a1 + 32) + 40);
          *(_DWORD *)buf = 138412290;
          unint64_t v48 = v30;
          v27 = "Malformed iTunes config payload for %@!";
          v28 = v23;
          uint32_t v29 = 12;
          goto LABEL_19;
        }
      }

LABEL_22:
      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
      goto LABEL_23;
    }
    id v11 = v7;
    uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
    id obj = *(id *)(v13 + 40);
    v14 = +[NSJSONSerialization JSONObjectWithData:v11 options:0 error:&obj];
    objc_storeStrong((id *)(v13 + 40), obj);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
    {
LABEL_14:

      goto LABEL_16;
    }
    if (*(unsigned char *)(*(void *)(a1 + 32) + 9))
    {
LABEL_7:
      uint64_t v15 = [v14 objectForKeyedSubscript:@"metricsBase"];
      v16 = (void *)WeakRetained[11];
      WeakRetained[11] = v15;

      v17 = [v14 objectForKeyedSubscript:@"metricsUrl"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v45 = v17;
        uint64_t v18 = [v17 stringByAppendingFormat:@"/2/%@", WeakRetained[3]];
        v19 = sub_1000106A0("upload");
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v20 = *(void *)(*(void *)(a1 + 32) + 40);
          *(_DWORD *)buf = 138412546;
          unint64_t v48 = v18;
          __int16 v49 = 2112;
          uint64_t v50 = v20;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "got metrics endpoint %@ for %@", buf, 0x16u);
        }

        v44 = (void *)v18;
        v21 = +[NSURL URLWithString:v18];
        v22 = [v21 scheme];
        unsigned int v43 = [v22 isEqualToString:@"https"];

        if (v43) {
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v21);
        }

        v17 = v45;
      }

      goto LABEL_14;
    }
    v31 = [v14 valueForKey:@"sendDisabled"];
    *(unsigned char *)(*(void *)(a1 + 32) + 10) = [v31 BOOLValue];

    if (!*(unsigned char *)(*(void *)(a1 + 32) + 10))
    {
      v34 = [v14 valueForKey:@"postFrequency"];
      unint64_t v35 = (unint64_t)[v34 unsignedIntegerValue];

      if (v35 >= 0x3E8)
      {
        unint64_t v36 = v35 / 0x3E8;
        if (os_variant_has_internal_diagnostics() && *(void *)(*(void *)(a1 + 32) + 72) < v36)
        {
          v37 = sub_1000106A0("getURL");
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v38 = *(void *)(*(void *)(a1 + 32) + 72);
            *(_DWORD *)buf = 134218240;
            unint64_t v48 = v36;
            __int16 v49 = 2048;
            uint64_t v50 = v38;
            _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Overriding server-sent post frequency because device is internal (%lu -> %lu)", buf, 0x16u);
          }
        }
        else
        {
          WeakRetained[9] = v36;
        }
      }
      uint64_t v39 = [v14 objectForKeyedSubscript:@"blacklistedEvents"];
      v40 = (void *)WeakRetained[13];
      WeakRetained[13] = v39;

      uint64_t v41 = [v14 objectForKeyedSubscript:@"blacklistedFields"];
      v42 = (void *)WeakRetained[12];
      WeakRetained[12] = v41;

      goto LABEL_7;
    }
    v32 = sub_1000106A0("SecError");
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v33 = *(void *)(*(void *)(a1 + 32) + 40);
      *(_DWORD *)buf = 138412290;
      unint64_t v48 = v33;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "not returning a splunk URL because uploads are disabled for %@", buf, 0xCu);
    }

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  }
LABEL_23:
}

void sub_100006838(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100006858(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100006A50(id a1)
{
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = sub_1000051E4;
  uint64_t v26 = sub_1000051F4;
  id v27 = 0;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = sub_1000051E4;
  uint64_t v20 = sub_1000051F4;
  id v21 = 0;
  v1 = sub_100006E60();
  if (v1)
  {
    v2 = sub_1000106A0("_getiCloudConfigurationInfoWithError");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Fetching configuration info", (uint8_t *)&buf, 2u);
    }

    dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
    id v4 = objc_opt_new();
    CFStringRef v34 = @"com.apple.idms.config.privacy.icloud.data";
    uint64_t v5 = +[NSArray arrayWithObjects:&v34 count:1];
    *(void *)&long long buf = _NSConcreteStackBlock;
    *((void *)&buf + 1) = 3221225472;
    uint32_t v29 = sub_100006EDC;
    unint64_t v30 = &unk_100018978;
    v32 = &v16;
    unint64_t v33 = &v22;
    int v6 = v3;
    v31 = v6;
    [v4 configurationInfoWithIdentifiers:v5 forAltDSID:v1 completion:&buf];

    dispatch_time_t v7 = dispatch_time(0, 5000000000);
    dispatch_semaphore_wait(v6, v7);
  }
  else
  {
    int v6 = sub_1000106A0("SecError");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "_getiCloudConfigurationInfoWithError: Failed to fetch primary account info.", (uint8_t *)&buf, 2u);
    }
  }

  id v8 = (void *)v17[5];
  if (v8) {
    id v9 = v8;
  }
  id v10 = (id)v23[5];

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  id v11 = v8;
  if (v10) {
    BOOL v12 = v8 == 0;
  }
  else {
    BOOL v12 = 0;
  }
  if (v12)
  {
    uint64_t v13 = [v10 objectForKeyedSubscript:@"com.apple.idms.config.privacy.icloud.data"];
    if (v13)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
      {
        v14 = +[NSNumber numberWithInteger:[v13 integerValue]];
        uint64_t v15 = +[NSNumber numberWithInteger:0];
        byte_10001DBA0 = [v14 isEqualToNumber:v15] ^ 1;
      }
    }
LABEL_20:

    goto LABEL_21;
  }
  if (v8)
  {
    uint64_t v13 = sub_1000106A0("SecError");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "_isiCloudAnalyticsEnabled: %@", (uint8_t *)&buf, 0xCu);
    }
    goto LABEL_20;
  }
LABEL_21:
}

void sub_100006E30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
}

id sub_100006E60()
{
  v0 = +[ACAccountStore defaultStore];
  v1 = [v0 aa_primaryAppleAccount];
  v2 = v1;
  if (v1)
  {
    dispatch_semaphore_t v3 = [v1 aa_altDSID];
  }
  else
  {
    dispatch_semaphore_t v3 = 0;
  }

  return v3;
}

void sub_100006EDC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    dispatch_time_t v7 = sub_1000106A0("SecError");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      id v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "_getiCloudConfigurationInfoWithError: Error fetching configurationInfo: %@", (uint8_t *)&v16, 0xCu);
    }

    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    id v9 = v6;
LABEL_9:
    id v11 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v9;
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = sub_1000106A0("_getiCloudConfigurationInfoWithError");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      id v17 = v5;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "fetched configurationInfo %@", (uint8_t *)&v16, 0xCu);
    }

    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
    id v9 = v5;
    id v5 = v9;
    goto LABEL_9;
  }
  BOOL v12 = sub_1000106A0("SecError");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138543362;
    id v17 = (id)objc_opt_class();
    id v13 = v17;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "_getiCloudConfigurationInfoWithError: configurationInfo dict was not a dict, it was a %{public}@", (uint8_t *)&v16, 0xCu);
  }
  uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = 0;

  id v11 = v5;
  id v5 = 0;
LABEL_10:

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_1000070EC(id a1)
{
  byte_10001DB90 = DiagnosticLogSubmissionEnabled();
}

void sub_1000079E8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 uploadDate];

  if (v4)
  {
    id v5 = [v3 uploadDate];
    [v5 timeIntervalSince1970];
    id v4 = +[NSNumber numberWithDouble:v6 * 1000.0];
  }
  if (!*(unsigned char *)(a1 + 136))
  {
    if (![*(id *)(a1 + 32) requireDeviceAnalytics]) {
      goto LABEL_12;
    }
    if (qword_10001DB98 != -1) {
      dispatch_once(&qword_10001DB98, &stru_100018930);
    }
    if (!byte_10001DB90)
    {
      uint64_t v8 = sub_1000106A0("getLoggingJSON");
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_39;
      }
      v31 = [*(id *)(a1 + 32) name];
      *(_DWORD *)unint64_t v33 = 138412290;
      *(void *)&v33[4] = v31;
      v32 = "Client '%@' requires device analytics yet user did not opt in.";
    }
    else
    {
LABEL_12:
      if (*(unsigned char *)(a1 + 136) || ![*(id *)(a1 + 32) requireiCloudAnalytics]) {
        goto LABEL_13;
      }
      if (qword_10001DBA8 != -1) {
        dispatch_once(&qword_10001DBA8, &stru_100018950);
      }
      if (byte_10001DBA0) {
        goto LABEL_13;
      }
      uint64_t v8 = sub_1000106A0("getLoggingJSON");
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_39;
      }
      v31 = [*(id *)(a1 + 32) name];
      *(_DWORD *)unint64_t v33 = 138412290;
      *(void *)&v33[4] = v31;
      v32 = "Client '%@' requires iCloud analytics yet user did not opt in.";
    }
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v32, v33, 0xCu);

    goto LABEL_39;
  }
LABEL_13:
  if (!*(unsigned char *)(a1 + 137))
  {
LABEL_27:
    v23 = [*(id *)(a1 + 40) healthSummaryWithName:*(void *)(a1 + 32) store:v3 uuid:*(void *)(a1 + 56) timestamp:*(void *)(a1 + 64) lastUploadTime:v4 *(_OWORD *)v33, *(void *)&v33[16]];
    uint64_t v8 = v23;
    if (v23)
    {
      uint64_t v24 = *(void *)(a1 + 72);
      if (v24) {
        [v23 setObject:v24 forKeyedSubscript:@"ckdeviceID"];
      }
      uint64_t v25 = *(void *)(a1 + 80);
      if (v25) {
        [v8 setObject:v25 forKeyedSubscript:@"altDSID"];
      }
      if (*(void *)(a1 + 88)) {
        -[NSObject addEntriesFromDictionary:](v8, "addEntriesFromDictionary:");
      }
      if (*(void *)(a1 + 96)) {
        [v8 setObject:&__kCFBooleanTrue forKeyedSubscript:@"isAppleUser"];
      }
      [*(id *)(a1 + 104) addObject:v8];
    }
    uint64_t v26 = *(void **)(a1 + 112);
    id v27 = [v3 rockwells];
    [v26 addObject:v27];

    v28 = *(void **)(a1 + 120);
    uint32_t v29 = [v3 hardFailures];
    [v28 addObject:v29];

    unint64_t v30 = *(void **)(a1 + 128);
    uint64_t v14 = [v3 softFailures];
    [v30 addObject:v14];
    goto LABEL_38;
  }
  uint64_t v7 = [v3 uploadDate];
  uint64_t v8 = v7;
  int v9 = *(unsigned __int8 *)(a1 + 136);
  if (*(unsigned char *)(a1 + 136) || !v7)
  {
LABEL_20:
    id v17 = sub_1000106A0("json");
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v18)
      {
        v19 = [*(id *)(a1 + 32) name];
        uint64_t v20 = *(void *)(*(void *)(a1 + 40) + 40);
        *(_DWORD *)unint64_t v33 = 138412546;
        *(void *)&v33[4] = v19;
        *(_WORD *)&v33[12] = 2112;
        *(void *)&v33[14] = v20;
        id v21 = "client '%@' for topic '%@' force-included";
LABEL_25:
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v21, v33, 0x16u);
      }
    }
    else if (v18)
    {
      v19 = [*(id *)(a1 + 32) name];
      uint64_t v22 = *(void *)(*(void *)(a1 + 40) + 40);
      *(_DWORD *)unint64_t v33 = 138412546;
      *(void *)&v33[4] = v19;
      *(_WORD *)&v33[12] = 2112;
      *(void *)&v33[14] = v22;
      id v21 = "including client '%@' for topic '%@' for upload";
      goto LABEL_25;
    }

    [*(id *)(a1 + 48) addObject:*(void *)(a1 + 32)];
    goto LABEL_27;
  }
  id v10 = +[NSDate date];
  [v10 timeIntervalSinceDate:v8];
  double v12 = v11;
  double v13 = (double)*(unint64_t *)(*(void *)(a1 + 40) + 72);

  if (v12 >= v13)
  {
    int v9 = *(unsigned __int8 *)(a1 + 136);
    goto LABEL_20;
  }
  uint64_t v14 = sub_1000106A0("json");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = [*(id *)(a1 + 32) name];
    uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 40);
    *(_DWORD *)unint64_t v33 = 138412802;
    *(void *)&v33[4] = v15;
    *(_WORD *)&v33[12] = 2112;
    *(void *)&v33[14] = v16;
    *(_WORD *)&v33[22] = 2112;
    CFStringRef v34 = v8;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "ignoring client '%@' for %@ because last upload too recent: %@", v33, 0x20u);
  }
LABEL_38:

LABEL_39:
}

void sub_100007F48(id a1)
{
  v4[0] = SFAnalyticsTopicKeySync;
  v4[1] = SFAnalyticsTopicCloudServices;
  v4[2] = SFAnalyticsTopicTransparency;
  v4[3] = SFAnalyticsTopicSWTransparency;
  v1 = +[NSArray arrayWithObjects:v4 count:4];
  uint64_t v2 = +[NSSet setWithArray:v1];
  id v3 = (void *)qword_10001DB80;
  qword_10001DB80 = v2;
}

void sub_100008D88(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_1000106A0("postprocess");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = *(void **)(a1 + 32);
    double v6 = [*(id *)(a1 + 40) name];
    int v9 = 138412546;
    id v10 = v5;
    __int16 v11 = 2112;
    double v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Setting upload date (%@) for client: %@", (uint8_t *)&v9, 0x16u);
  }
  [v3 setUploadDate:*(void *)(a1 + 32)];
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v7 = sub_1000106A0("postprocess");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [*(id *)(a1 + 40) name];
      int v9 = 138412290;
      id v10 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Clearing collected data for client: %@", (uint8_t *)&v9, 0xCu);
    }
    [v3 clearAllData];
  }
}

void sub_1000096C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57)
{
}

void sub_10000972C(uint64_t a1, void *a2, void *a3)
{
  id v29 = a2;
  uint64_t v5 = SFAnalyticsColumnSuccessCount;
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:v5];
  id v8 = [v7 integerValue];

  int v9 = [v6 objectForKeyedSubscript:SFAnalyticsColumnHardFailureCount];
  unint64_t v10 = (unint64_t)[v9 integerValue];

  __int16 v11 = [v6 objectForKeyedSubscript:SFAnalyticsColumnSoftFailureCount];

  unint64_t v12 = (unint64_t)[v11 integerValue];
  if (![*(id *)(a1 + 32) terseMetrics])
  {
    uint64_t v22 = +[NSNumber numberWithInteger:v8];
    v23 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v24 = +[NSString stringWithFormat:@"%@-success", v29];
    [v23 setObject:v22 forKeyedSubscript:v24];

    uint64_t v25 = +[NSNumber numberWithInteger:v10];
    uint64_t v26 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v27 = +[NSString stringWithFormat:@"%@-hardfail", v29];
    [v26 setObject:v25 forKeyedSubscript:v27];

    uint64_t v20 = +[NSNumber numberWithInteger:v12];
    id v21 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    +[NSString stringWithFormat:@"%@-softfail", v29];
    goto LABEL_12;
  }
  if (v10 | v12) {
    BOOL v13 = v8 == 0;
  }
  else {
    BOOL v13 = 0;
  }
  if (!v13)
  {
    uint64_t v14 = +[NSNumber numberWithInteger:v8];
    uint64_t v15 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v16 = +[NSString stringWithFormat:@"%@-s", v29];
    [v15 setObject:v14 forKeyedSubscript:v16];
  }
  if (v10)
  {
    id v17 = +[NSNumber numberWithInteger:v10];
    BOOL v18 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    v19 = +[NSString stringWithFormat:@"%@-h", v29];
    [v18 setObject:v17 forKeyedSubscript:v19];
  }
  if (v12)
  {
    uint64_t v20 = +[NSNumber numberWithInteger:v12];
    id v21 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    +[NSString stringWithFormat:@"%@-f", v29];
    v28 = LABEL_12:;
    [v21 setObject:v20 forKeyedSubscript:v28];
  }
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += v8;
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) += v10;
  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) += v12;
}

void sub_100009A8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = [*(id *)(a1 + 32) sampleStatisticsForSamples:a3 withName:a2];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addEntriesFromDictionary:v4];
}

void sub_10000A60C(uint64_t a1, void *a2, unint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if (*(void *)(a1 + 56) <= a3)
  {
    *a4 = 1;
  }
  else
  {
    if ([*(id *)(a1 + 32) prepareEventForUpload:v7 linkedUUID:*(void *)(a1 + 40)])
    {
      if (+[NSJSONSerialization isValidJSONObject:v7])
      {
        [*(id *)(a1 + 48) addObject:v7];
      }
      else
      {
        int v9 = sub_1000106A0("SecError");
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412290;
          id v17 = v7;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "supd: Replacing event with errorEvent because invalid JSON: %@", buf, 0xCu);
        }

        uint64_t v10 = SFAnalyticsEventType;
        __int16 v11 = [v7 objectForKeyedSubscript:SFAnalyticsEventType];
        v14[0] = v10;
        v14[1] = SFAnalyticsEventErrorDestription;
        v15[0] = SFAnalyticsEventTypeErrorEvent;
        unint64_t v12 = +[NSString stringWithFormat:@"JSON:%@", v11];
        v15[1] = v12;
        BOOL v13 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];

        [*(id *)(a1 + 48) addObject:v13];
      }
    }
  }
}

void sub_10000A7DC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "prepareEventForUpload:linkedUUID:")) {
    [*(id *)(a1 + 48) addObject:v3];
  }
}

void sub_10000A9E4(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v7];

  if (!v6) {
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v7];
  }
}

void sub_10000AEC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000AEE0(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v15 = (objc_class *)objc_opt_class();
      id v8 = sub_1000106A0("SecError");
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_15;
      }
      uint64_t v16 = *(void *)(*(void *)(a1 + 32) + 40);
      uint64_t v10 = NSStringFromClass(v15);
      int v19 = 138412546;
      uint64_t v20 = v16;
      __int16 v21 = 2112;
      uint64_t v22 = v10;
      unint64_t v12 = "Received the wrong kind of response for %@: %@";
      BOOL v13 = v8;
      uint32_t v14 = 22;
      goto LABEL_13;
    }
    id v8 = v6;
    if ((uint64_t)[v8 statusCode] < 200
      || (uint64_t)[v8 statusCode] > 299)
    {
      uint64_t v10 = sub_1000106A0("upload");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v17 = *(NSObject **)(a1 + 40);
        uint64_t v18 = *(void *)(*(void *)(a1 + 32) + 40);
        int v19 = 138412802;
        uint64_t v20 = v18;
        __int16 v21 = 2112;
        uint64_t v22 = v17;
        __int16 v23 = 1024;
        unsigned int v24 = [v8 statusCode];
        unint64_t v12 = "Splunk upload for %@ unexpected status to URL: %@ -- status: %d";
        BOOL v13 = v10;
        uint32_t v14 = 28;
        goto LABEL_13;
      }
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
      uint64_t v10 = sub_1000106A0("upload");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 40);
        int v19 = 138412290;
        uint64_t v20 = v11;
        unint64_t v12 = "Splunk upload success for %@";
        BOOL v13 = v10;
        uint32_t v14 = 12;
LABEL_13:
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v19, v14);
      }
    }

    goto LABEL_15;
  }
  id v8 = sub_1000106A0("SecError");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 40);
    int v19 = 138412546;
    uint64_t v20 = v9;
    __int16 v21 = 2112;
    uint64_t v22 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Error in uploading the events to splunk for %@: %@", (uint8_t *)&v19, 0x16u);
  }
LABEL_15:

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

void sub_10000C3D0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = +[NSMutableDictionary dictionary];
  id v4 = [v3 uploadDate];

  [v7 setObject:v4 forKeyedSubscript:@"uploadDate"];
  id v5 = *(void **)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) name];
  [v5 setObject:v7 forKeyedSubscript:v6];
}

void sub_10000D1D4(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1[4];
  id v5 = [a1[5] name];
  id v6 = +[NSString stringWithFormat:@"Client: %@\n", v5];
  [v4 appendString:v6];

  id v7 = [v3 allEvents];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = a1[4];
        BOOL v13 = [a1[6] sysdiagnoseStringForEventRecord:*(void *)(*((void *)&v14 + 1) + 8 * (void)v11)];
        [v12 appendFormat:@"%@\n", v13];

        uint64_t v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
  if (![v7 count]) {
    [a1[4] appendString:@"No data to report for this client\n"];
  }
}

void sub_10000D5C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000D5D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = *(void **)(a1 + 32);
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    CFStringRef v5 = &stru_100019AF8;
  }
  else {
    CFStringRef v5 = @", ";
  }
  id v6 = +[NSString stringWithFormat:@"%@%@ : %@", v5, a2, a3];
  [v4 appendString:v6];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
}

void sub_10000E27C(uint64_t a1)
{
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10000E318;
  handler[3] = &unk_100018848;
  id v2 = *(id *)(a1 + 32);
  xpc_activity_register("com.apple.securityuploadd.triggerupload", XPC_ACTIVITY_CHECK_IN, handler);
}

void sub_10000E318(uint64_t a1, xpc_activity_t activity)
{
  xpc_activity_state_t state = xpc_activity_get_state(activity);
  id v4 = sub_1000106A0("supd");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 134217984;
    xpc_activity_state_t v6 = state;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "hit xpc activity trigger, state: %ld", (uint8_t *)&v5, 0xCu);
  }

  if (state == 2) {
    [*(id *)(a1 + 32) performRegularlyScheduledUpload];
  }
}

void sub_10000ED94(id a1, const char *a2)
{
}

void sub_10000ED9C(id a1, const char *a2)
{
}

void sub_10000EDA4(id a1, const char *a2)
{
}

void sub_10000EE84(id a1, const char *a2)
{
}

void sub_10000EE8C(id a1, const char *a2)
{
}

void sub_10000EE94(id a1, const char *a2)
{
}

void sub_10000EE9C(id a1, const char *a2)
{
}

void sub_10000EEA4(id a1, const char *a2)
{
}

void sub_10000EEAC(id a1, const char *a2)
{
}

void sub_10000EFEC(id a1, const char *a2)
{
}

void sub_10000EFF4(id a1, const char *a2)
{
}

void sub_10000EFFC(id a1, const char *a2)
{
}

void sub_10000F004(id a1, const char *a2)
{
}

void sub_10000F020(id a1, const char *a2)
{
  int v3 = mkpath_np(a2, 0x1FFu);
  if (v3)
  {
    int v4 = v3;
    if (v3 != 17)
    {
      int v5 = sub_1000106A0("SecError");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 136315394;
        uint64_t v10 = a2;
        __int16 v11 = 2080;
        id v12 = strerror(v4);
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "could not create path: %s (%s)", (uint8_t *)&v9, 0x16u);
      }
    }
  }
  if (chmod(a2, 0x1FFu))
  {
    xpc_activity_state_t v6 = sub_1000106A0("SecError");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = __error();
      id v8 = strerror(*v7);
      int v9 = 136315394;
      uint64_t v10 = a2;
      __int16 v11 = 2080;
      id v12 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "failed to change permissions of %s: %s", (uint8_t *)&v9, 0x16u);
    }
  }
}

uint64_t sub_10000F35C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000F36C(uint64_t a1)
{
}

void sub_10000F374(uint64_t a1, char *a2)
{
  if (chmod(a2, 0x1A4u))
  {
    int v4 = *__error();
    NSErrorUserInfoKey v15 = NSLocalizedDescriptionKey;
    int v5 = +[NSString localizedStringWithFormat:@"failed to change permissions of %s: %s", a2, strerror(v4)];
    long long v16 = v5;
    xpc_activity_state_t v6 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    uint64_t v7 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v4 userInfo:v6];
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
    int v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    if (v4 != 2)
    {
      uint64_t v10 = sub_1000106A0("SecError");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 136315394;
        id v12 = a2;
        __int16 v13 = 2080;
        long long v14 = strerror(v4);
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "failed to change permissions of %s: %s", buf, 0x16u);
      }

      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    }
  }
}

BOOL sub_10000F8E0(id a1, NSURL *a2, NSError *a3)
{
  int v4 = a2;
  int v5 = a3;
  xpc_activity_state_t v6 = [(NSURL *)v4 fileSystemRepresentation];
  uint64_t v7 = [(NSError *)v5 localizedFailureReason];

  id v8 = v7;
  int v9 = (const char *)[v8 UTF8String];

  uint64_t v10 = sub_1000106A0("SecError");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v11 = "unknown error";
    if (v9) {
      __int16 v11 = v9;
    }
    int v13 = 136315394;
    long long v14 = v6;
    __int16 v15 = 2080;
    long long v16 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "unable to fix permissions for %s: %s", (uint8_t *)&v13, 0x16u);
  }

  return 1;
}

void sub_10000FCEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_10000FD10(uint64_t a1, char *a2)
{
  if (chown(a2, 0x11Au, 0x11Au))
  {
    int v4 = *__error();
    NSErrorUserInfoKey v15 = NSLocalizedDescriptionKey;
    int v5 = +[NSString localizedStringWithFormat:@"failed to change owner of %s: %s", a2, strerror(v4)];
    long long v16 = v5;
    xpc_activity_state_t v6 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    uint64_t v7 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v4 userInfo:v6];
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    if (v4 != 2)
    {
      uint64_t v10 = sub_1000106A0("SecError");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 136315394;
        id v12 = a2;
        __int16 v13 = 2080;
        long long v14 = strerror(v4);
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "failed to change owner of %s: %s", buf, 0x16u);
      }

      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    }
  }
}

void sub_100010284(id a1)
{
  if (getuid() == 282 || !getuid() && gTrustd) {
    byte_10001DBB0 = 1;
  }
}

void sub_1000102C8(id a1)
{
  CFURLRef v1 = sub_1000107C0(@"private/var/protected/", @"trustd");

  sub_1000108AC(v1, (uint64_t)&stru_100018C68);
}

void sub_100010308(id a1, const char *a2)
{
  int v3 = mkpath_np(a2, 0x1FFu);
  if (v3)
  {
    int v4 = v3;
    if (v3 != 17)
    {
      int v5 = sub_1000106A0("SecError");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 136315394;
        uint64_t v8 = a2;
        __int16 v9 = 2080;
        uint64_t v10 = strerror(v4);
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "could not create path: %s (%s)", (uint8_t *)&v7, 0x16u);
      }
    }
  }
  if (qword_10001DBB8 != -1) {
    dispatch_once(&qword_10001DBB8, &stru_100018C08);
  }
  if (byte_10001DBB0 == 1)
  {
    uid_t v6 = getuid();
    chown(a2, v6, v6);
    chmod(a2, 0x1EDu);
  }
}

const void *sub_100010444(const __CFString *a1)
{
  if (a1) {
    CFStringRef v1 = a1;
  }
  else {
    CFStringRef v1 = @"logging";
  }
  os_unfair_lock_lock_with_options();
  CFDictionaryRef Mutable = (const __CFDictionary *)qword_10001DBD0;
  if (!qword_10001DBD0)
  {
    CFDictionaryRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFCopyStringDictionaryKeyCallBacks, 0);
    qword_10001DBD0 = (uint64_t)Mutable;
  }
  Value = CFDictionaryGetValue(Mutable, v1);
  if (!Value)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 0x40000000;
    v9[2] = sub_100010650;
    v9[3] = &unk_100018C88;
    v9[4] = v1;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 0x40000000;
    __int16 v11 = sub_1000107B0;
    id v12 = &unk_100018CD8;
    __int16 v13 = v9;
    CStringPtr = CFStringGetCStringPtr(v1, 0x8000100u);
    if (CStringPtr)
    {
      int v5 = CStringPtr;
      size_t v6 = strlen(CStringPtr);
      ((void (*)(void *, const char *, size_t))v11)(v10, v5, v6);
    }
    else
    {
      CFIndex usedBufLen = 0;
      CFIndex Length = CFStringGetLength(v1);
      v16.location = 0;
      v16.length = Length;
      CFStringGetBytes(v1, v16, 0x8000100u, 0, 0, 0, 0, &usedBufLen);
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 0x40000000;
      void v14[2] = sub_100010730;
      v14[3] = &unk_100018CB0;
      v14[6] = 0;
      v14[7] = Length;
      v14[8] = usedBufLen;
      v14[4] = v10;
      v14[5] = v1;
      sub_100010BF8(usedBufLen + 1, (uint64_t)v14);
    }
    Value = CFDictionaryGetValue((CFDictionaryRef)qword_10001DBD0, v1);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_10001DBC8);
  return Value;
}

void sub_100010650(uint64_t a1, const char *a2)
{
  id v2 = (__CFDictionary *)qword_10001DBD0;
  int v3 = *(const void **)(a1 + 32);
  os_log_t v4 = os_log_create("com.apple.securityd", a2);

  CFDictionaryAddValue(v2, v3, v4);
}

const void *sub_1000106A0(const char *a1)
{
  pthread_mutex_lock(&stru_10001DB18);
  pthread_mutex_unlock(&stru_10001DB18);
  if (a1)
  {
    CFStringRef v2 = CFStringCreateWithCString(kCFAllocatorDefault, a1, 0x600u);
    int v3 = sub_100010444(v2);
    if (v2) {
      CFRelease(v2);
    }
    return v3;
  }
  else
  {
    return sub_100010444(0);
  }
}

uint64_t sub_100010730(uint64_t result, int a2, UInt8 *buffer)
{
  if (buffer)
  {
    uint64_t v4 = result;
    CFStringRef v5 = *(const __CFString **)(result + 40);
    CFRange v8 = *(CFRange *)(v4 + 48);
    CFIndex v6 = *(void *)(v4 + 64);
    CFIndex usedBufLen = 0xAAAAAAAAAAAAAAAALL;
    CFStringGetBytes(v5, v8, 0x8000100u, 0, 0, buffer, v6, &usedBufLen);
    buffer[usedBufLen] = 0;
    return (*(uint64_t (**)(void))(*(void *)(v4 + 32) + 16))();
  }
  return result;
}

uint64_t sub_1000107B0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

CFURLRef sub_1000107C0(const __CFString *a1, uint64_t a2)
{
  CFURLRef v4 = CFURLCreateWithFileSystemPath(0, @"/", kCFURLPOSIXPathStyle, 1u);
  if (a2)
  {
    CFAllocatorRef v5 = kCFAllocatorDefault;
    CFStringRef Copy = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%@/%@", a1, a2);
  }
  else
  {
    if (!a1) {
      goto LABEL_10;
    }
    CFAllocatorRef v5 = kCFAllocatorDefault;
    CFStringRef Copy = CFStringCreateCopy(kCFAllocatorDefault, a1);
  }
  CFStringRef v7 = Copy;
  if (v4 && Copy)
  {
    CFURLRef v8 = CFURLCreateCopyAppendingPathComponent(v5, v4, Copy, a2 == 0);
    CFRelease(v7);
LABEL_11:
    CFRelease(v4);
    return v8;
  }
  if (Copy) {
    CFRelease(Copy);
  }
LABEL_10:
  CFURLRef v8 = 0;
  if (v4) {
    goto LABEL_11;
  }
  return v8;
}

void sub_1000108AC(const __CFURL *a1, uint64_t a2)
{
  if (a1)
  {
    memset(__b, 170, sizeof(__b));
    CFURLGetFileSystemRepresentation(a1, 0, __b, 1024);
    (*(void (**)(uint64_t, UInt8 *))(a2 + 16))(a2, __b);
    CFRelease(a1);
  }
}

void sub_100010950(uint64_t a1, uint64_t a2)
{
  syslog(5, "SecCopyURLForFileInParameterizedKeychainDirectory: forceUserScope:%d", 0);
  CFURLRef v4 = sub_1000107C0(@"Library/Keychains", a1);

  sub_1000108AC(v4, a2);
}

uint64_t sub_1000109B4()
{
  if (!qword_10001DBD8) {
    qword_10001DBD8 = _sl_dlopen();
  }
  return qword_10001DBD8;
}

void *sub_100010A84(uint64_t a1)
{
  CFStringRef v2 = sub_100010AD4();
  result = dlsym(v2, "SimulateCrash");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_10001DBE0 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_100010AD4()
{
  uint64_t v0 = sub_1000109B4();
  if (v0) {
    return (void *)v0;
  }
  CFStringRef v1 = +[NSAssertionHandler currentHandler];
  int v3 = +[NSString stringWithUTF8String:"void *CrashReporterSupportLibrary(void)"];
  [v1 handleFailureInFunction:v3 file:@"simulate_crash.m" lineNumber:18 description:@"%s"];

  __break(1u);
  free(v4);
  return v1;
}

uint64_t sub_100010B84()
{
  uint64_t result = _sl_dlopen();
  qword_10001DBD8 = result;
  return result;
}

void sub_100010BF8(size_t size, uint64_t a2)
{
  if (size)
  {
    if (size > 0x800)
    {
      CFAllocatorRef v5 = malloc_type_malloc(size, 0x9C1A2F70uLL);
      (*(void (**)(uint64_t, size_t, void *))(a2 + 16))(a2, size, v5);
      if (v5)
      {
        free(v5);
      }
    }
    else
    {
      __chkstk_darwin();
      memset((char *)&v6 - ((size + 15) & 0xFFFFFFFFFFFFFFF0), 170, size);
      (*(void (**)(uint64_t, size_t, char *))(a2 + 16))(a2, size, (char *)&v6 - ((size + 15) & 0xFFFFFFFFFFFFFFF0));
    }
  }
  else
  {
    CFURLRef v4 = *(void (**)(uint64_t, void, void))(a2 + 16);
    v4(a2, 0, 0);
  }
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesCopyValue(key, applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return _CFStringCreateCopy(alloc, theString);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return _CFStringCreateWithFormat(alloc, formatOptions, format);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return _CFStringGetBytes(theString, range, encoding, lossByte, isExternalRepresentation, buffer, maxBufLen, usedBufLen);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return _CFStringGetCStringPtr(theString, encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return _CFStringGetLength(theString);
}

CFURLRef CFURLCreateCopyAppendingPathComponent(CFAllocatorRef allocator, CFURLRef url, CFStringRef pathComponent, Boolean isDirectory)
{
  return _CFURLCreateCopyAppendingPathComponent(allocator, url, pathComponent, isDirectory);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return _CFURLCreateWithFileSystemPath(allocator, filePath, pathStyle, isDirectory);
}

Boolean CFURLGetFileSystemRepresentation(CFURLRef url, Boolean resolveAgainstBase, UInt8 *buffer, CFIndex maxBufLen)
{
  return _CFURLGetFileSystemRepresentation(url, resolveAgainstBase, buffer, maxBufLen);
}

uint64_t DiagnosticLogSubmissionEnabled()
{
  return _DiagnosticLogSubmissionEnabled();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t OSAWriteLogForSubmission()
{
  return _OSAWriteLogForSubmission();
}

BOOL SecTrustEvaluateWithError(SecTrustRef trust, CFErrorRef *error)
{
  return _SecTrustEvaluateWithError(trust, error);
}

void _Block_object_dispose(const void *a1, const int a2)
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

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint32_t arc4random(void)
{
  return _arc4random();
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

int deflate(z_streamp strm, int flush)
{
  return _deflate(strm, flush);
}

int deflateEnd(z_streamp strm)
{
  return _deflateEnd(strm);
}

int deflateInit2_(z_streamp strm, int level, int method, int windowBits, int memLevel, int strategy, const char *version, int stream_size)
{
  return _deflateInit2_(strm, level, method, windowBits, memLevel, strategy, version, stream_size);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
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

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return _dispatch_queue_create_with_target_V2(label, attr, target);
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

int fcntl(int a1, int a2, ...)
{
  return _fcntl(a1, a2);
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return _getpid();
}

uid_t getuid(void)
{
  return _getuid();
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return _memset(__b, __c, __len);
}

int mkpath_np(const char *path, mode_t omode)
{
  return _mkpath_np(path, omode);
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
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

uint64_t os_variant_has_internal_diagnostics()
{
  return _os_variant_has_internal_diagnostics();
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return _pthread_mutex_lock(a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return _pthread_mutex_unlock(a1);
}

BOOL remove(const std::__fs::filesystem::path *__p, std::error_code *__ec)
{
  return _remove(__p, __ec);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

void syslog(int a1, const char *a2, ...)
{
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return _xpc_activity_get_state(activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

uint64_t xpc_transaction_exit_clean()
{
  return _xpc_transaction_exit_clean();
}

id objc_msgSend_AppSupportPath(void *a1, const char *a2, ...)
{
  return [a1 AppSupportPath];
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

id objc_msgSend_allEvents(void *a1, const char *a2, ...)
{
  return [a1 allEvents];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allowTrustdToWriteAnalyticsFiles(void *a1, const char *a2, ...)
{
  return [a1 allowTrustdToWriteAnalyticsFiles];
}

id objc_msgSend_appleUser(void *a1, const char *a2, ...)
{
  return [a1 appleUser];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_askSecurityForCKDeviceID(void *a1, const char *a2, ...)
{
  return [a1 askSecurityForCKDeviceID];
}

id objc_msgSend_authenticationMethod(void *a1, const char *a2, ...)
{
  return [a1 authenticationMethod];
}

id objc_msgSend_automatedDeviceGroup(void *a1, const char *a2, ...)
{
  return [a1 automatedDeviceGroup];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_carryStatus(void *a1, const char *a2, ...)
{
  return [a1 carryStatus];
}

id objc_msgSend_checkSupdEntitlement(void *a1, const char *a2, ...)
{
  return [a1 checkSupdEntitlement];
}

id objc_msgSend_clearAllData(void *a1, const char *a2, ...)
{
  return [a1 clearAllData];
}

id objc_msgSend_close(void *a1, const char *a2, ...)
{
  return [a1 close];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return [a1 connection];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_databasePathForCKKS(void *a1, const char *a2, ...)
{
  return [a1 databasePathForCKKS];
}

id objc_msgSend_databasePathForCloudServices(void *a1, const char *a2, ...)
{
  return [a1 databasePathForCloudServices];
}

id objc_msgSend_databasePathForLocal(void *a1, const char *a2, ...)
{
  return [a1 databasePathForLocal];
}

id objc_msgSend_databasePathForNetworking(void *a1, const char *a2, ...)
{
  return [a1 databasePathForNetworking];
}

id objc_msgSend_databasePathForPCS(void *a1, const char *a2, ...)
{
  return [a1 databasePathForPCS];
}

id objc_msgSend_databasePathForSOS(void *a1, const char *a2, ...)
{
  return [a1 databasePathForSOS];
}

id objc_msgSend_databasePathForSWTransparency(void *a1, const char *a2, ...)
{
  return [a1 databasePathForSWTransparency];
}

id objc_msgSend_databasePathForTransparency(void *a1, const char *a2, ...)
{
  return [a1 databasePathForTransparency];
}

id objc_msgSend_databasePathForTrust(void *a1, const char *a2, ...)
{
  return [a1 databasePathForTrust];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultStore(void *a1, const char *a2, ...)
{
  return [a1 defaultStore];
}

id objc_msgSend_deleteOldFiles(void *a1, const char *a2, ...)
{
  return [a1 deleteOldFiles];
}

id objc_msgSend_deleteSupplementalsAssetsDir(void *a1, const char *a2, ...)
{
  return [a1 deleteSupplementalsAssetsDir];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_disableUploads(void *a1, const char *a2, ...)
{
  return [a1 disableUploads];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_ephemeralSessionConfiguration(void *a1, const char *a2, ...)
{
  return [a1 ephemeralSessionConfiguration];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_getSession(void *a1, const char *a2, ...)
{
  return [a1 getSession];
}

id objc_msgSend_getSysdiagnoseDump(void *a1, const char *a2, ...)
{
  return [a1 getSysdiagnoseDump];
}

id objc_msgSend_hardFailures(void *a1, const char *a2, ...)
{
  return [a1 hardFailures];
}

id objc_msgSend_haveEligibleClients(void *a1, const char *a2, ...)
{
  return [a1 haveEligibleClients];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_internalTopicName(void *a1, const char *a2, ...)
{
  return [a1 internalTopicName];
}

id objc_msgSend_isSampledUpload(void *a1, const char *a2, ...)
{
  return [a1 isSampledUpload];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_localizedFailureReason(void *a1, const char *a2, ...)
{
  return [a1 localizedFailureReason];
}

id objc_msgSend_metricsAccountID(void *a1, const char *a2, ...)
{
  return [a1 metricsAccountID];
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

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return [a1 pathExtension];
}

id objc_msgSend_performRegularlyScheduledUpload(void *a1, const char *a2, ...)
{
  return [a1 performRegularlyScheduledUpload];
}

id objc_msgSend_previousFailureCount(void *a1, const char *a2, ...)
{
  return [a1 previousFailureCount];
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

id objc_msgSend_requireDeviceAnalytics(void *a1, const char *a2, ...)
{
  return [a1 requireDeviceAnalytics];
}

id objc_msgSend_requireiCloudAnalytics(void *a1, const char *a2, ...)
{
  return [a1 requireiCloudAnalytics];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_rockwells(void *a1, const char *a2, ...)
{
  return [a1 rockwells];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_samples(void *a1, const char *a2, ...)
{
  return [a1 samples];
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return [a1 scheme];
}

id objc_msgSend_sendNotificationForOncePerReportSamplers(void *a1, const char *a2, ...)
{
  return [a1 sendNotificationForOncePerReportSamplers];
}

id objc_msgSend_serverTrust(void *a1, const char *a2, ...)
{
  return [a1 serverTrust];
}

id objc_msgSend_setupSamplingRates(void *a1, const char *a2, ...)
{
  return [a1 setupSamplingRates];
}

id objc_msgSend_setupTopics(void *a1, const char *a2, ...)
{
  return [a1 setupTopics];
}

id objc_msgSend_softFailures(void *a1, const char *a2, ...)
{
  return [a1 softFailures];
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return [a1 statusCode];
}

id objc_msgSend_store(void *a1, const char *a2, ...)
{
  return [a1 store];
}

id objc_msgSend_storePath(void *a1, const char *a2, ...)
{
  return [a1 storePath];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_stringByStandardizingPath(void *a1, const char *a2, ...)
{
  return [a1 stringByStandardizingPath];
}

id objc_msgSend_summaryCounts(void *a1, const char *a2, ...)
{
  return [a1 summaryCounts];
}

id objc_msgSend_terseMetrics(void *a1, const char *a2, ...)
{
  return [a1 terseMetrics];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSince1970];
}

id objc_msgSend_topicClients(void *a1, const char *a2, ...)
{
  return [a1 topicClients];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_uploadDate(void *a1, const char *a2, ...)
{
  return [a1 uploadDate];
}

id objc_msgSend_uploadSizeLimit(void *a1, const char *a2, ...)
{
  return [a1 uploadSizeLimit];
}

id objc_msgSend_writeToURL_error_(void *a1, const char *a2, ...)
{
  return [a1 writeToURL:error:];
}