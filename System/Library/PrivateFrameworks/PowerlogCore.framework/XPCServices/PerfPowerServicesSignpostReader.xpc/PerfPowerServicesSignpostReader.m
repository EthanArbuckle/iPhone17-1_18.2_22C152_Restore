void sub_1000032DC(id a1)
{
  NSObject *v1;
  dispatch_time_t v2;

  v1 = PLLogSignpostReader();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG)) {
    sub_10000CB6C(v1);
  }

  v2 = dispatch_time(0, 60000000000);
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, &stru_100014410);
}

void sub_100003348(id a1)
{
  v1 = PLLogSignpostReader();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, "Requesting exit in invalidation handler...", v2, 2u);
  }

  xpc_transaction_exit_clean();
}

int main(int argc, const char **argv, const char **envp)
{
  pid_t v3 = getpid();
  v4 = PLLogSignpostReader();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_10000CBEC(v3, v4);
  }

  proc_disable_cpumon();
  NSLog(@"In the main of the XPCSignpostReader Service");
  v5 = objc_opt_new();
  v6 = +[NSXPCListener serviceListener];
  [v6 setDelegate:v5];
  [v6 resume];

  return 5000;
}

double sub_100003768(uint64_t a1, void *a2)
{
  [a2 durationSeconds];
  uint64_t v4 = *(void *)(a1 + 32);
  double result = *(double *)(v4 + 48) + (float)(v3 * 1000.0);
  *(double *)(v4 + 48) = result;
  return result;
}

double sub_100003A94(uint64_t a1, void *a2)
{
  [a2 durationSeconds];
  uint64_t v4 = *(void *)(a1 + 32);
  double result = *(double *)(v4 + 48) + (float)(v3 * 1000.0);
  *(double *)(v4 + 48) = result;
  return result;
}

void sub_100003ED0(id a1)
{
  v1 = PLLogSignpostReader();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "SIGTERM handler invoked!", v2, 2u);
  }

  exit(0);
}

id PLLogSignpostReader()
{
  if (qword_100019638 != -1) {
    dispatch_once(&qword_100019638, &stru_100014478);
  }
  v0 = (void *)qword_100019630;
  return v0;
}

void sub_100003F84(id a1)
{
  qword_100019630 = (uint64_t)os_log_create("com.apple.PerfPowerServicesSignpostReader", "");
  _objc_release_x1();
}

void sub_100004F94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

float sub_100004FAC(uint64_t a1, void *a2)
{
  [a2 durationSeconds];
  float result = v3 * 1000.0;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += (unint64_t)result;
  return result;
}

uint64_t sub_100006228(uint64_t a1, uint64_t a2)
{
  return 1;
}

uint64_t sub_10000624C(uint64_t a1, uint64_t a2)
{
  return 1;
}

uint64_t sub_100006270(uint64_t a1, uint64_t a2)
{
  return 1;
}

void sub_10000634C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  v7 = +[NSMutableDictionary dictionary];
  v8 = [*(id *)(*(void *)(a1 + 32) + 72) objectForKeyedSubscript:v6];
  v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  v13 = sub_1000064B4;
  v14 = &unk_100014540;
  id v15 = v7;
  id v9 = v7;
  [v8 enumerateKeysAndObjectsUsingBlock:&v11];

  v16[0] = @"appSignpostDurations";
  v16[1] = @"appSignpostMetrics";
  v17[0] = v5;
  v17[1] = v9;
  v10 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v17, v16, 2, v11, v12, v13, v14);
  [*(id *)(a1 + 40) setObject:v10 forKey:v6];
}

void sub_1000064B4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = [a3 getMetricDictionary];
  [v4 setObject:v6 forKey:v5];
}

void sub_100006A60(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = v5;
      id v8 = v6;
      if ([v8 count])
      {
        long long v21 = 0u;
        long long v22 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        id v9 = v8;
        id v10 = [v9 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v10)
        {
          id v11 = v10;
          id v16 = v8;
          id v17 = v6;
          id v18 = v5;
          uint64_t v12 = *(void *)v20;
          do
          {
            for (i = 0; i != v11; i = (char *)i + 1)
            {
              if (*(void *)v20 != v12) {
                objc_enumerationMutation(v9);
              }
              uint64_t v14 = *(void *)(*((void *)&v19 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                [*(id *)(a1 + 32) addSubsystem:v7 category:v14];
                id v15 = PLLogSignpostReader();
                if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412546;
                  id v24 = v7;
                  __int16 v25 = 2112;
                  uint64_t v26 = v14;
                  _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "adding %@,%@ to signpost allowlist", buf, 0x16u);
                }
              }
            }
            id v11 = [v9 countByEnumeratingWithState:&v19 objects:v27 count:16];
          }
          while (v11);
          id v6 = v17;
          id v5 = v18;
          id v8 = v16;
        }
      }
      else
      {
        [*(id *)(a1 + 32) addSubsystem:v7 category:0];
        id v9 = PLLogSignpostReader();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
          sub_10000D1B4();
        }
      }
    }
  }
}

void sub_100006F60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100006F8C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100006F9C(uint64_t a1)
{
}

void sub_100006FA4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 argument];
  unsigned int v5 = [v4 type];

  if (v5 == 3)
  {
    id v6 = [v3 placeholderTokens];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100007084;
    v9[3] = &unk_1000145B8;
    uint64_t v11 = *(void *)(a1 + 32);
    id v7 = v3;
    uint64_t v8 = *(void *)(a1 + 40);
    id v10 = v7;
    uint64_t v12 = v8;
    [v6 enumerateObjectsUsingBlock:v9];
  }
}

uint64_t sub_100007084(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v12 = a2;
  if ([v12 containsString:@"name="])
  {
    if ([v12 isEqualToString:@"name=sx"])
    {
      id v6 = [*(id *)(a1 + 32) argument];
      uint64_t v7 = [v6 argumentObject];
      uint64_t v8 = *(void *)(a1 + 40);
    }
    else
    {
      if (![v12 isEqualToString:@"name=sy"])
      {
LABEL_7:
        *a4 = 1;
        goto LABEL_8;
      }
      id v6 = [*(id *)(a1 + 32) argument];
      uint64_t v7 = [v6 argumentObject];
      uint64_t v8 = *(void *)(a1 + 48);
    }
    uint64_t v9 = *(void *)(v8 + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v7;

    goto LABEL_7;
  }
LABEL_8:
  return _objc_release_x1();
}

uint64_t sub_1000074CC(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 category];
  unsigned int v5 = [v3 name];
  id v6 = [v3 beginEvent];
  uint64_t v7 = [v6 processName];

  uint64_t v8 = [v3 endEvent];
  uint64_t v9 = [v8 processName];
  unsigned __int8 v10 = [v9 isEqualToString:v7];

  if ((v10 & 1) == 0)
  {
    uint64_t v11 = PLLogSignpostReader();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_10000D5B4((uint64_t)v7, v3);
    }
  }
  [v3 durationSeconds];
  uint64_t v13 = 0;
  if (v4 && v5 && v7)
  {
    float v14 = v12;
    id v15 = [*(id *)(a1 + 32) objectForKey:v4];

    if (!v15)
    {
      id v16 = objc_alloc_init((Class)NSMutableDictionary);
      [*(id *)(a1 + 32) setObject:v16 forKeyedSubscript:v4];
    }
    id v17 = [*(id *)(a1 + 32) objectForKeyedSubscript:v4];
    id v18 = [v17 objectForKey:v5];

    if (!v18)
    {
      id v19 = objc_alloc_init((Class)NSMutableDictionary);
      long long v20 = [*(id *)(a1 + 32) objectForKeyedSubscript:v4];
      [v20 setObject:v19 forKeyedSubscript:v5];
    }
    double v21 = v14;
    if ([v4 isEqualToString:@"ScrollView"])
    {
      if (([v5 isEqualToString:@"Scroll_Dragging"] & 1) == 0
        && ([v5 isEqualToString:@"Scroll_Deceleration"] & 1) == 0
        && ![v5 isEqualToString:@"Scroll_Animating"])
      {
        v53 = 0;
        v33 = 0;
        v23 = 0;
        goto LABEL_29;
      }
      long long v22 = PLLogSignpostReader();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
        sub_10000D54C();
      }

      v23 = [v3 number2Name];
      if (!v23)
      {
        v53 = 0;
        v33 = 0;
        goto LABEL_29;
      }
      id v24 = [v3 number2Value];
      [v24 doubleValue];
      double v26 = v25;

      v27 = [*(id *)(a1 + 32) objectForKeyedSubscript:v4];
      v28 = [v27 objectForKeyedSubscript:v5];
      v29 = [v28 objectForKey:v7];

      if (!v29)
      {
        id v30 = objc_alloc_init((Class)NSMutableDictionary);
        v31 = [*(id *)(a1 + 32) objectForKeyedSubscript:v4];
        v32 = [v31 objectForKeyedSubscript:v5];
        [v32 setObject:v30 forKeyedSubscript:v7];
      }
      v33 = [*(id *)(a1 + 40) getScrollDirectionForSignpostInterval:v3];
      if (!v33)
      {
        v53 = 0;
        uint64_t v13 = 0;
LABEL_35:

        goto LABEL_36;
      }
      v91 = v23;
      v34 = [*(id *)(a1 + 32) objectForKeyedSubscript:v4];
      v35 = [v34 objectForKeyedSubscript:v5];
      v36 = [v35 objectForKeyedSubscript:v7];
      v37 = [v36 objectForKey:v33];

      if (!v37)
      {
        id v38 = objc_alloc_init((Class)NSMutableDictionary);
        v39 = [*(id *)(a1 + 32) objectForKeyedSubscript:v4];
        v40 = [v39 objectForKeyedSubscript:v5];
        v41 = [v40 objectForKeyedSubscript:v7];
        [v41 setObject:v38 forKeyedSubscript:v33];

        v42 = [*(id *)(a1 + 32) objectForKeyedSubscript:v4];
        v43 = [v42 objectForKeyedSubscript:v5];
        v44 = [v43 objectForKeyedSubscript:v7];
        v45 = [v44 objectForKeyedSubscript:v33];
        [v45 setObject:&off_100015C60 forKeyedSubscript:v91];

        v46 = [*(id *)(a1 + 32) objectForKeyedSubscript:v4];
        v47 = [v46 objectForKeyedSubscript:v5];
        v48 = [v47 objectForKeyedSubscript:v7];
        v49 = [v48 objectForKeyedSubscript:v33];
        [v49 setObject:&off_100015C00 forKeyedSubscript:@"Count"];
      }
      v50 = [*(id *)(a1 + 32) objectForKeyedSubscript:v4];
      v51 = [v50 objectForKeyedSubscript:v5];
      v52 = [v51 objectForKeyedSubscript:v7];
      v53 = [v52 objectForKeyedSubscript:v33];

      v54 = [v53 objectForKeyedSubscript:v91];
      [v54 doubleValue];
      v56 = +[NSNumber numberWithDouble:v26 + v55];
      [v53 setObject:v56 forKeyedSubscript:v91];

      v57 = [v53 objectForKeyedSubscript:@"Count"];
      v23 = v91;
      v58 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v57 intValue] + 1);
      [v53 setObject:v58 forKeyedSubscript:@"Count"];
    }
    else
    {
      v59 = [*(id *)(a1 + 32) objectForKeyedSubscript:v4];
      v60 = [v59 objectForKeyedSubscript:v5];
      v61 = [v60 objectForKey:v7];

      if (!v61)
      {
        id v62 = objc_alloc_init((Class)NSMutableDictionary);
        v63 = [*(id *)(a1 + 32) objectForKeyedSubscript:v4];
        v64 = [v63 objectForKeyedSubscript:v5];
        [v64 setObject:v62 forKeyedSubscript:v7];

        v65 = [*(id *)(a1 + 32) objectForKeyedSubscript:v4];
        v66 = [v65 objectForKeyedSubscript:v5];
        v67 = [v66 objectForKeyedSubscript:v7];
        [v67 setObject:&off_100015C60 forKeyedSubscript:@"Duration"];

        v68 = [*(id *)(a1 + 32) objectForKeyedSubscript:v4];
        v69 = [v68 objectForKeyedSubscript:v5];
        v70 = [v69 objectForKeyedSubscript:v7];
        [v70 setObject:&off_100015C00 forKeyedSubscript:@"Count"];
      }
      v71 = [*(id *)(a1 + 32) objectForKeyedSubscript:v4];
      v72 = [v71 objectForKeyedSubscript:v5];
      v53 = [v72 objectForKeyedSubscript:v7];

      v73 = [v53 objectForKeyedSubscript:@"Duration"];
      [v73 doubleValue];
      v75 = +[NSNumber numberWithDouble:v74 + v21];
      [v53 setObject:v75 forKeyedSubscript:@"Duration"];

      v57 = [v53 objectForKeyedSubscript:@"Count"];
      v58 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v57 intValue] + 1);
      [v53 setObject:v58 forKeyedSubscript:@"Count"];
      v33 = 0;
      v23 = 0;
    }

LABEL_29:
    v76 = PLLogSignpostReader();
    if (os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG))
    {
      CFStringRef v80 = &stru_1000149C0;
      if (v33) {
        CFStringRef v80 = v33;
      }
      CFStringRef v85 = v80;
      v89 = [*(id *)(a1 + 32) objectForKeyedSubscript:v4];
      v88 = [v89 objectForKeyedSubscript:v5];
      v87 = [v88 objectForKeyedSubscript:v7];
      v84 = [v87 objectForKeyedSubscript:@"Duration"];
      v86 = [*(id *)(a1 + 32) objectForKeyedSubscript:v4];
      v81 = [v86 objectForKeyedSubscript:v5];
      [v81 objectForKeyedSubscript:v7];
      v82 = v92 = v23;
      [v82 objectForKeyedSubscript:@"Count"];
      v83 = v90 = v33;
      *(_DWORD *)buf = 138413826;
      v94 = v4;
      __int16 v95 = 2112;
      v96 = v5;
      __int16 v97 = 2112;
      v98 = v7;
      __int16 v99 = 2112;
      CFStringRef v100 = v85;
      __int16 v101 = 2048;
      double v102 = v21;
      __int16 v103 = 2112;
      v104 = v84;
      __int16 v105 = 2112;
      v106 = v83;
      _os_log_debug_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEBUG, "Got signpostInterval %@,%@,%@,%@: %.3f (total = %@) (count = %@)", buf, 0x48u);

      v33 = v90;
      v23 = v92;
    }
    v77 = PLLogSignpostReader();
    if (os_log_type_enabled(v77, OS_LOG_TYPE_DEBUG)) {
      sub_10000D4A8(v3, v77);
    }

    v78 = PLLogSignpostReader();
    if (os_log_type_enabled(v78, OS_LOG_TYPE_DEBUG)) {
      sub_10000D404(v3, v78);
    }

    uint64_t v13 = 1;
    goto LABEL_35;
  }
LABEL_36:

  return v13;
}

void sub_100008E28(_Unwind_Exception *a1)
{
}

uint64_t sub_100008E98(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) signpostIntervalData:a2 forTaskingConfig:*(void *)(a1 + 40)];
  [*(id *)(a1 + 48) addObject:v3];
  if ((unint64_t)[*(id *)(a1 + 48) count] >= 0xC8) {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [*(id *)(a1 + 32) writeSignpostFile:*(void *)(a1 + 56) withOrder:*(unsigned int *)(*(void *)(*(void *)(a1 + 64) + 8)+ 24) withData:*(void *)(a1 + 48)];
  }

  return 1;
}

void sub_100008F18(id *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = PLLogSignpostReader();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v5 = [a1[4] name];
    *(_DWORD *)buf = 138412290;
    v66 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[WR] Completing workflow event tracker for workflow '%@'...", buf, 0xCu);
  }
  v43 = [a1[5] workflowDataForEventTracker:v3];
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  v40 = v3;
  id obj = [v3 allSignpostTrackers];
  id v44 = [obj countByEnumeratingWithState:&v59 objects:v70 count:16];
  if (v44)
  {
    uint64_t v42 = *(void *)v60;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v60 != v42) {
          objc_enumerationMutation(obj);
        }
        uint64_t v45 = v6;
        uint64_t v7 = *(void **)(*((void *)&v59 + 1) + 8 * v6);
        id v8 = [v43 mutableCopy];
        uint64_t v9 = [a1[5] workflowDataForSignpostTracker:v7];
        [v8 addEntriesFromDictionary:v9];

        long long v57 = 0u;
        long long v58 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        v46 = v7;
        unsigned __int8 v10 = [v7 emits];
        id v11 = [v10 countByEnumeratingWithState:&v55 objects:v69 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v56;
          do
          {
            for (i = 0; i != v12; i = (char *)i + 1)
            {
              if (*(void *)v56 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = *(void *)(*((void *)&v55 + 1) + 8 * i);
              id v16 = [v8 mutableCopy];
              id v17 = [a1[5] workflowDataForWREvent:v15];
              [v16 addEntriesFromDictionary:v17];

              id v18 = PLLogSignpostReader();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                id v19 = [a1[4] name];
                *(_DWORD *)buf = 138412546;
                v66 = v19;
                __int16 v67 = 2112;
                id v68 = v16;
                _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "[WR] Event processed for workflow '%@': %@", buf, 0x16u);
              }
              [a1[6] addObject:v16];
            }
            id v12 = [v10 countByEnumeratingWithState:&v55 objects:v69 count:16];
          }
          while (v12);
        }

        long long v53 = 0u;
        long long v54 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        long long v20 = [v46 intervals];
        id v21 = [v20 countByEnumeratingWithState:&v51 objects:v64 count:16];
        if (v21)
        {
          id v22 = v21;
          uint64_t v23 = *(void *)v52;
          do
          {
            for (j = 0; j != v22; j = (char *)j + 1)
            {
              if (*(void *)v52 != v23) {
                objc_enumerationMutation(v20);
              }
              uint64_t v25 = *(void *)(*((void *)&v51 + 1) + 8 * (void)j);
              id v26 = [v8 mutableCopy];
              v27 = [a1[5] workflowDataForWRInterval:v25];
              [v26 addEntriesFromDictionary:v27];

              v28 = PLLogSignpostReader();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                v29 = [a1[4] name];
                *(_DWORD *)buf = 138412546;
                v66 = v29;
                __int16 v67 = 2112;
                id v68 = v26;
                _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "[WR] Interval processed for workflow '%@': %@", buf, 0x16u);
              }
              [a1[6] addObject:v26];
            }
            id v22 = [v20 countByEnumeratingWithState:&v51 objects:v64 count:16];
          }
          while (v22);
        }

        long long v49 = 0u;
        long long v50 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        id v30 = [v46 incompleteIntervalStarts];
        id v31 = [v30 countByEnumeratingWithState:&v47 objects:v63 count:16];
        if (v31)
        {
          id v32 = v31;
          uint64_t v33 = *(void *)v48;
          do
          {
            for (k = 0; k != v32; k = (char *)k + 1)
            {
              if (*(void *)v48 != v33) {
                objc_enumerationMutation(v30);
              }
              uint64_t v35 = *(void *)(*((void *)&v47 + 1) + 8 * (void)k);
              id v36 = [v8 mutableCopy];
              v37 = [a1[5] workflowDataForWRIncompleteInterval:v35];
              [v36 addEntriesFromDictionary:v37];

              id v38 = PLLogSignpostReader();
              if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
              {
                v39 = [a1[4] name];
                *(_DWORD *)buf = 138412546;
                v66 = v39;
                __int16 v67 = 2112;
                id v68 = v36;
                _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "[WR] Incomplete Interval processed for workflow '%@': %@", buf, 0x16u);
              }
              [a1[6] addObject:v36];
            }
            id v32 = [v30 countByEnumeratingWithState:&v47 objects:v63 count:16];
          }
          while (v32);
        }

        uint64_t v6 = v45 + 1;
      }
      while ((id)(v45 + 1) != v44);
      id v44 = [obj countByEnumeratingWithState:&v59 objects:v70 count:16];
    }
    while (v44);
  }
}

uint64_t sub_1000094B0(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v20 = a1;
  id obj = *(id *)(a1 + 32);
  id v4 = [obj countByEnumeratingWithState:&v23 objects:v35 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v22 = *(void *)v24;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v24 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v23 + 1) + 8 * (void)v6);
        uint64_t v9 = [v7 workflow];
        unsigned __int8 v10 = [v9 allowListForAllSignposts];
        id v11 = [v3 subsystem];
        id v12 = [v3 category];
        unsigned int v13 = [v10 passesSubsystem:v11 category:v12];

        if (v13)
        {
          float v14 = PLLogSignpostReader();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v15 = [v3 subsystem];
            id v16 = [v3 category];
            id v17 = [v7 workflow];
            id v18 = [v17 name];
            *(_DWORD *)buf = 138413058;
            v28 = v15;
            __int16 v29 = 2112;
            id v30 = v16;
            __int16 v31 = 2112;
            id v32 = v18;
            __int16 v33 = 2112;
            id v34 = v3;
            _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "[WR] Processing signpost object (%@:%@) for workflow '%@': %@", buf, 0x2Au);
          }
          [v7 handleSignpost:v3];
        }
        uint64_t v6 = (char *)v6 + 1;
      }
      while (v5 != v6);
      id v5 = [obj countByEnumeratingWithState:&v23 objects:v35 count:16];
    }
    while (v5);
  }

  if ((unint64_t)[*(id *)(v20 + 40) count] >= 0xC8) {
    *(_DWORD *)(*(void *)(*(void *)(v20 + 64) + 8) + 24) = [*(id *)(v20 + 48) writeSignpostFile:*(void *)(v20 + 56) withOrder:*(unsigned int *)(*(void *)(*(void *)(v20 + 64) + 8) + 24) withData:*(void *)(v20 + 40)];
  }

  return 1;
}

uint64_t sub_100009748(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)a1[4];
  id v5 = [v3 subsystem];
  uint64_t v6 = [v3 category];
  LODWORD(v4) = [v4 passesSubsystem:v5 category:v6];

  if (v4) {
    (*(void (**)(void))(a1[6] + 16))();
  }
  uint64_t v7 = (void *)a1[5];
  id v8 = [v3 subsystem];
  uint64_t v9 = [v3 category];
  LODWORD(v7) = [v7 passesSubsystem:v8 category:v9];

  if (v7) {
    (*(void (**)(void))(a1[7] + 16))();
  }

  return 1;
}

uint64_t sub_100009834(uint64_t a1)
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v1 = *(id *)(a1 + 32);
  id v2 = [v1 countByEnumeratingWithState:&v9 objects:v15 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v10;
    do
    {
      id v5 = 0;
      do
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v1);
        }
        uint64_t v6 = *(void **)(*((void *)&v9 + 1) + 8 * (void)v5);
        uint64_t v7 = PLLogSignpostReader();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
          sub_10000D8C4(v13, v6, &v14, v7);
        }

        objc_msgSend(v6, "reset", (void)v9);
        id v5 = (char *)v5 + 1;
      }
      while (v3 != v5);
      id v3 = [v1 countByEnumeratingWithState:&v9 objects:v15 count:16];
    }
    while (v3);
  }

  return 1;
}

void sub_10000B670(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000B6AC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = PLLogSignpostReader();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_10000DD50();
  }

  if (v6)
  {
    id v8 = PLLogSignpostReader();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10000DCE8();
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  }
  long long v9 = PLLogSignpostReader();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    long long v10 = [*(id *)(a1 + 32) path];
    int v13 = 138412290;
    uint64_t v14 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Remove after upload completion: %@", (uint8_t *)&v13, 0xCu);
  }
  [*(id *)(a1 + 40) removeFile:*(void *)(a1 + 48)];
  long long v11 = PLLogSignpostReader();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    long long v12 = *(void **)(a1 + 32);
    int v13 = 138412290;
    uint64_t v14 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Finished iCloud upload for %@", (uint8_t *)&v13, 0xCu);
  }
}

void sub_10000B894(id a1)
{
  id v1 = (void *)MGCopyAnswerWithError();
  byte_100019648 = [v1 isEqual:@"iPad"];
}

BOOL sub_10000BB64(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 beginEvent];
  id v5 = [v4 name];
  unsigned int v6 = [v5 isEqualToString:@"HangInterval"];

  if (v6)
  {
    uint64_t v7 = *(void **)(a1 + 32);
    id v8 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"hangDurations"];
    [v7 updateHangsData:v8 withInterval:v3];
  }
  long long v9 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"hangDurations"];
  id v10 = [v9 count];
  if ((unint64_t)v10 >= 0x5DD)
  {
    long long v11 = PLLogSignpostReader();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[RAPID] Exceeded max hang signpost count", v13, 2u);
    }
  }
  return (unint64_t)v10 < 0x5DD;
}

void sub_10000C588(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_10000C5D4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (*(unsigned char *)(a1 + 64)
    || (HIDWORD(v5) = -858993459 * *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24),
        LODWORD(v5) = HIDWORD(v5),
        (v5 >> 1) <= 0x19999999))
  {
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    double v6 = *(double *)(a1 + 56) - kCFAbsoluteTimeIntervalSince1970;
    uint64_t v7 = *(void **)(a1 + 32);
    xpc_object_t xdata = v4;
    id v8 = objc_alloc((Class)NSData);
    bytes_ptr = xpc_data_get_bytes_ptr(xdata);
    id v10 = [v8 initWithBytes:bytes_ptr length:xpc_data_get_length(xdata)];
    [v7 addMicrostackshotsFromData:v10 ofTypes:17 inTimeRangeStart:0xFFFFFFFFLL end:0 onlyPid:0.0 onlyTid:v6];

    id v4 = xdata;
  }
}

void sub_10000C820(id a1)
{
  mach_timebase_info info = 0;
  if (mach_timebase_info(&info))
  {
    _os_assumes_log();
    double v1 = 1.0;
  }
  else
  {
    double v1 = (double)(info.numer / info.denom);
  }
  qword_100019660 = *(void *)&v1;
}

void sub_10000CA5C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_10000CA84(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void sub_10000CA9C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_10000CABC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_10000CAD8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_10000CB28(os_log_t log)
{
  *(_WORD *)double v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "'signpost_reader_idle_exit' feature flag enabled, setting event handlers for incoming connection...", v1, 2u);
}

void sub_10000CB6C(os_log_t log)
{
  v1[0] = 67109120;
  v1[1] = 60;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Exit handler triggered! Attempting to exit in %d seconds...", (uint8_t *)v1, 8u);
}

void sub_10000CBEC(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Disabling CPU exceptions for PID %d", (uint8_t *)v2, 8u);
}

void sub_10000CC64()
{
  sub_10000CA78();
  sub_10000CA5C((void *)&_mh_execute_header, v0, v1, "Process %@ Exited", v2, v3, v4, v5, v6);
}

void sub_10000CCCC(void *a1)
{
  uint64_t v2 = [a1 endEvent];
  uint64_t v3 = [v2 processName];
  uint64_t v4 = [a1 number1Value];
  sub_10000CAF8();
  sub_10000CA9C((void *)&_mh_execute_header, v5, v6, "Process: %@ is a %@ Launch", v7, v8, v9, v10, v11);
}

void sub_10000CD80(void *a1)
{
  uint64_t v2 = [a1 endEvent];
  uint64_t v3 = [v2 processName];
  uint64_t v4 = [a1 string2Value];
  [v4 isEqualToString:@"YES"];
  sub_10000CA9C((void *)&_mh_execute_header, v5, v6, "Process: %@ is a %@ Extended Launch", v7, v8, v9, v10, 2u);
}

void sub_10000CE68(void *a1)
{
  uint64_t v2 = [a1 endEvent];
  uint64_t v3 = [v2 processName];
  uint64_t v4 = [a1 number1Value];
  sub_10000CAF8();
  sub_10000CA9C((void *)&_mh_execute_header, v5, v6, "Process: %@ is a %@ activation", v7, v8, v9, v10, v11);
}

void sub_10000CF1C(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 endEvent];
  uint64_t v4 = [v3 processName];
  sub_10000CA78();
  sub_10000CA84((void *)&_mh_execute_header, a2, v5, "Process: %@ is an App Resume", v6);
}

void sub_10000CFC0(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 endEvent];
  uint64_t v4 = [v3 processName];
  sub_10000CA78();
  sub_10000CA84((void *)&_mh_execute_header, a2, v5, "Process: %@ is an App Hang", v6);
}

void sub_10000D064(void *a1)
{
  uint64_t v1 = [a1 beginEvent];
  uint64_t v2 = [v1 name];
  sub_10000CB10();
  sub_10000CA9C((void *)&_mh_execute_header, v3, v4, "Got signpostInterval (%@) : %@", v5, v6, v7, v8, v9);
}

void sub_10000D104(void *a1)
{
  if (a1)
  {
    id v1 = [a1 localizedDescription];
    [v1 UTF8String];
  }
  sub_10000CA78();
  sub_10000CAD8((void *)&_mh_execute_header, v3, v4, "## Unable to serialize to %s", v5, v6, v7, v8, v9);
  if (a1) {
}
  }

void sub_10000D1B4()
{
  sub_10000CA78();
  sub_10000CA5C((void *)&_mh_execute_header, v0, v1, "adding %@,nil to signpost allowlist", v2, v3, v4, v5, v6);
}

void sub_10000D21C(void *a1)
{
  if (a1)
  {
    id v1 = [a1 localizedDescription];
    [v1 UTF8String];
  }
  sub_10000CA78();
  sub_10000CAD8((void *)&_mh_execute_header, v3, v4, "Unable to process signpost: %s", v5, v6, v7, v8, v9);
  if (a1) {
}
  }

void sub_10000D2CC()
{
  sub_10000CA78();
  sub_10000CA5C((void *)&_mh_execute_header, v0, v1, "\t allowlist = %@", v2, v3, v4, v5, v6);
}

void sub_10000D334()
{
  sub_10000CA78();
  sub_10000CA5C((void *)&_mh_execute_header, v0, v1, "\t endDate = %@", v2, v3, v4, v5, v6);
}

void sub_10000D39C()
{
  sub_10000CA78();
  sub_10000CA5C((void *)&_mh_execute_header, v0, v1, "\t startDate = %@", v2, v3, v4, v5, v6);
}

void sub_10000D404(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 endEvent];
  uint64_t v4 = [v3 metadata];
  sub_10000CA78();
  sub_10000CA84((void *)&_mh_execute_header, a2, v5, "\t endEvent.metadata = %@", v6);
}

void sub_10000D4A8(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 beginEvent];
  uint64_t v4 = [v3 metadata];
  sub_10000CA78();
  sub_10000CA84((void *)&_mh_execute_header, a2, v5, "\t beginEvent.metadata = %@", v6);
}

void sub_10000D54C()
{
  sub_10000CA78();
  sub_10000CA5C((void *)&_mh_execute_header, v0, v1, "\t Received signpost name = %@", v2, v3, v4, v5, v6);
}

void sub_10000D5B4(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 endEvent];
  uint8_t v9 = [v2 processName];
  sub_10000CA9C((void *)&_mh_execute_header, v3, v4, "!! process name (%@) mismatch with (%@)", v5, v6, v7, v8, 2u);
}

void sub_10000D668()
{
  sub_10000CA78();
  sub_10000CA5C((void *)&_mh_execute_header, v0, v1, "\t uuid = %@", v2, v3, v4, v5, v6);
}

void sub_10000D6D0()
{
  sub_10000CA78();
  sub_10000CA5C((void *)&_mh_execute_header, v0, v1, "\t tagConfig = %@", v2, v3, v4, v5, v6);
}

void sub_10000D738()
{
  sub_10000CA78();
  sub_10000CABC((void *)&_mh_execute_header, v0, v1, "Directory already exists at %@", v2, v3, v4, v5, v6);
}

void sub_10000D7A0()
{
  sub_10000CA78();
  sub_10000CA5C((void *)&_mh_execute_header, v0, v1, "Using allowlist for signpost reading: %@", v2, v3, v4, v5, v6);
}

void sub_10000D808()
{
  sub_10000CA78();
  sub_10000CA5C((void *)&_mh_execute_header, v0, v1, "[WR] Appending allowlist for workflow responsiveness: %@", v2, v3, v4, v5, v6);
}

void sub_10000D870(void *a1, uint8_t *a2, void *a3, NSObject *a4)
{
  *(_DWORD *)a2 = 138412290;
  *a3 = a1;
  sub_10000CA84((void *)&_mh_execute_header, a4, (uint64_t)a3, "[WR] Setting up tracker for workflow '%@'...", a2);
}

void sub_10000D8C4(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  uint64_t v7 = [a2 workflow];
  uint64_t v8 = [v7 name];
  *(_DWORD *)a1 = 138412290;
  *a3 = v8;
  _os_log_debug_impl((void *)&_mh_execute_header, a4, OS_LOG_TYPE_DEBUG, "[WR] Resetting event tracker for workflow '%@' due to device reboot", a1, 0xCu);
}

void sub_10000D954(void *a1, NSObject *a2)
{
  uint64_t v4 = [a1 objectForKeyedSubscript:@"Category"];
  uint64_t v5 = [a1 objectForKeyedSubscript:@"Name"];
  uint8_t v6 = [a1 objectForKeyedSubscript:@"EndProcessName"];
  if (v6) {
    CFStringRef v7 = @"EndProcessName";
  }
  else {
    CFStringRef v7 = @"BeginProcessName";
  }
  uint64_t v8 = [a1 objectForKeyedSubscript:v7];
  int v9 = 138412802;
  uint64_t v10 = v4;
  __int16 v11 = 2112;
  long long v12 = v5;
  __int16 v13 = 2112;
  uint64_t v14 = v8;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Got signpostInterval %@_%@: %@", (uint8_t *)&v9, 0x20u);
}

void sub_10000DA7C(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v4 = [a1 localizedDescription];
  sub_10000CB10();
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Failed to create tag file: %@ (%@)", v5, 0x16u);
}

void sub_10000DB1C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "No signpost file to create tag file.", v1, 2u);
}

void sub_10000DB60()
{
  sub_10000CA78();
  sub_10000CA5C((void *)&_mh_execute_header, v0, v1, "Successfully removed file %@ after upload", v2, v3, v4, v5, v6);
}

void sub_10000DBC8(uint64_t a1, void *a2, NSObject *a3)
{
  int v5 = 138412802;
  uint64_t v6 = a1;
  __int16 v7 = 2048;
  id v8 = [a2 code];
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Could not remove %@.Error [%ld] %@ ", (uint8_t *)&v5, 0x20u);
}

void sub_10000DC80()
{
  sub_10000CA78();
  sub_10000CABC((void *)&_mh_execute_header, v0, v1, "Failed to create CloudKit asset for %@", v2, v3, v4, v5, v6);
}

void sub_10000DCE8()
{
  sub_10000CA78();
  sub_10000CABC((void *)&_mh_execute_header, v0, v1, "Error saving attachmentRecord: %@", v2, v3, v4, v5, v6);
}

void sub_10000DD50()
{
  sub_10000CA78();
  sub_10000CA5C((void *)&_mh_execute_header, v0, v1, "Saved attachmentRecord: %@", v2, v3, v4, v5, v6);
}

void sub_10000DDB8(void *a1)
{
  if (a1)
  {
    id v1 = [a1 localizedDescription];
    [v1 UTF8String];
  }
  sub_10000CA78();
  sub_10000CAD8((void *)&_mh_execute_header, v3, v4, "[RAPID] Unable to serialize signpost: %s", v5, v6, v7, v8, v9);
  if (a1) {
}
  }

void sub_10000DE68()
{
  sub_10000CA78();
  sub_10000CABC((void *)&_mh_execute_header, v0, v1, "Failed to open at %@", v2, v3, v4, v5, v6);
}

uint64_t ADClientSetValueForScalarKey()
{
  return _ADClientSetValueForScalarKey();
}

uint64_t MGCopyAnswerWithError()
{
  return _MGCopyAnswerWithError();
}

void NSLog(NSString *format, ...)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_assumes_log()
{
  return __os_assumes_log();
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

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
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

void exit(int a1)
{
}

int fclose(FILE *a1)
{
  return _fclose(a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return _fopen(__filename, __mode);
}

pid_t getpid(void)
{
  return _getpid();
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return _mach_timebase_info(info);
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

void objc_enumerationMutation(id obj)
{
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t proc_disable_cpumon()
{
  return _proc_disable_cpumon();
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

uint64_t systemstats_get_microstackshots()
{
  return _systemstats_get_microstackshots();
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return _xpc_data_get_bytes_ptr(xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return _xpc_data_get_length(xdata);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return _xpc_dictionary_create_empty();
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

uint64_t xpc_transaction_exit_clean()
{
  return _xpc_transaction_exit_clean();
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_allSignpostTrackers(void *a1, const char *a2, ...)
{
  return [a1 allSignpostTrackers];
}

id objc_msgSend_allWorkflows(void *a1, const char *a2, ...)
{
  return [a1 allWorkflows];
}

id objc_msgSend_allowListForAllSignposts(void *a1, const char *a2, ...)
{
  return [a1 allowListForAllSignposts];
}

id objc_msgSend_argument(void *a1, const char *a2, ...)
{
  return [a1 argument];
}

id objc_msgSend_argumentObject(void *a1, const char *a2, ...)
{
  return [a1 argumentObject];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_attributes(void *a1, const char *a2, ...)
{
  return [a1 attributes];
}

id objc_msgSend_beginDate(void *a1, const char *a2, ...)
{
  return [a1 beginDate];
}

id objc_msgSend_beginEvent(void *a1, const char *a2, ...)
{
  return [a1 beginEvent];
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

id objc_msgSend_category(void *a1, const char *a2, ...)
{
  return [a1 category];
}

id objc_msgSend_clearCaches(void *a1, const char *a2, ...)
{
  return [a1 clearCaches];
}

id objc_msgSend_clearSACaches(void *a1, const char *a2, ...)
{
  return [a1 clearSACaches];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return [a1 configuration];
}

id objc_msgSend_contextualTelemetryEnabled(void *a1, const char *a2, ...)
{
  return [a1 contextualTelemetryEnabled];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_cpuInstructionsKI(void *a1, const char *a2, ...)
{
  return [a1 cpuInstructionsKI];
}

id objc_msgSend_cpuTimeNsec(void *a1, const char *a2, ...)
{
  return [a1 cpuTimeNsec];
}

id objc_msgSend_dataGatheringOptions(void *a1, const char *a2, ...)
{
  return [a1 dataGatheringOptions];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_dirtyMemoryKB(void *a1, const char *a2, ...)
{
  return [a1 dirtyMemoryKB];
}

id objc_msgSend_dirtyMemoryLifetimePeakKB(void *a1, const char *a2, ...)
{
  return [a1 dirtyMemoryLifetimePeakKB];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_durationSeconds(void *a1, const char *a2, ...)
{
  return [a1 durationSeconds];
}

id objc_msgSend_emits(void *a1, const char *a2, ...)
{
  return [a1 emits];
}

id objc_msgSend_enableImmediateCleanupOfCSSymbolOwners(void *a1, const char *a2, ...)
{
  return [a1 enableImmediateCleanupOfCSSymbolOwners];
}

id objc_msgSend_end(void *a1, const char *a2, ...)
{
  return [a1 end];
}

id objc_msgSend_endEvent(void *a1, const char *a2, ...)
{
  return [a1 endEvent];
}

id objc_msgSend_endMachContinuousTime(void *a1, const char *a2, ...)
{
  return [a1 endMachContinuousTime];
}

id objc_msgSend_endMs(void *a1, const char *a2, ...)
{
  return [a1 endMs];
}

id objc_msgSend_environment(void *a1, const char *a2, ...)
{
  return [a1 environment];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_eventEnd(void *a1, const char *a2, ...)
{
  return [a1 eventEnd];
}

id objc_msgSend_eventStart(void *a1, const char *a2, ...)
{
  return [a1 eventStart];
}

id objc_msgSend_getMetricDictionary(void *a1, const char *a2, ...)
{
  return [a1 getMetricDictionary];
}

id objc_msgSend_glitches(void *a1, const char *a2, ...)
{
  return [a1 glitches];
}

id objc_msgSend_incompleteIntervalStarts(void *a1, const char *a2, ...)
{
  return [a1 incompleteIntervalStarts];
}

id objc_msgSend_individuationIdentifier(void *a1, const char *a2, ...)
{
  return [a1 individuationIdentifier];
}

id objc_msgSend_initForLiveSampling(void *a1, const char *a2, ...)
{
  return [a1 initForLiveSampling];
}

id objc_msgSend_initializeMetrics(void *a1, const char *a2, ...)
{
  return [a1 initializeMetrics];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_intervals(void *a1, const char *a2, ...)
{
  return [a1 intervals];
}

id objc_msgSend_isiPad(void *a1, const char *a2, ...)
{
  return [a1 isiPad];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_logAggdTelemetry(void *a1, const char *a2, ...)
{
  return [a1 logAggdTelemetry];
}

id objc_msgSend_machContTimeNs(void *a1, const char *a2, ...)
{
  return [a1 machContTimeNs];
}

id objc_msgSend_metadata(void *a1, const char *a2, ...)
{
  return [a1 metadata];
}

id objc_msgSend_metadataSegments(void *a1, const char *a2, ...)
{
  return [a1 metadataSegments];
}

id objc_msgSend_metrics(void *a1, const char *a2, ...)
{
  return [a1 metrics];
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

id objc_msgSend_numSamples(void *a1, const char *a2, ...)
{
  return [a1 numSamples];
}

id objc_msgSend_number1Name(void *a1, const char *a2, ...)
{
  return [a1 number1Name];
}

id objc_msgSend_number1Value(void *a1, const char *a2, ...)
{
  return [a1 number1Value];
}

id objc_msgSend_number2Name(void *a1, const char *a2, ...)
{
  return [a1 number2Name];
}

id objc_msgSend_number2Value(void *a1, const char *a2, ...)
{
  return [a1 number2Value];
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return [a1 options];
}

id objc_msgSend_packageMXSignpostData(void *a1, const char *a2, ...)
{
  return [a1 packageMXSignpostData];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_placeholderTokens(void *a1, const char *a2, ...)
{
  return [a1 placeholderTokens];
}

id objc_msgSend_postprocess(void *a1, const char *a2, ...)
{
  return [a1 postprocess];
}

id objc_msgSend_processID(void *a1, const char *a2, ...)
{
  return [a1 processID];
}

id objc_msgSend_processImagePath(void *a1, const char *a2, ...)
{
  return [a1 processImagePath];
}

id objc_msgSend_processName(void *a1, const char *a2, ...)
{
  return [a1 processName];
}

id objc_msgSend_publicCloudDatabase(void *a1, const char *a2, ...)
{
  return [a1 publicCloudDatabase];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return [a1 reset];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_signpost(void *a1, const char *a2, ...)
{
  return [a1 signpost];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_startMachContinuousTime(void *a1, const char *a2, ...)
{
  return [a1 startMachContinuousTime];
}

id objc_msgSend_startMs(void *a1, const char *a2, ...)
{
  return [a1 startMs];
}

id objc_msgSend_storageDirtiedKB(void *a1, const char *a2, ...)
{
  return [a1 storageDirtiedKB];
}

id objc_msgSend_string1Name(void *a1, const char *a2, ...)
{
  return [a1 string1Name];
}

id objc_msgSend_string1Value(void *a1, const char *a2, ...)
{
  return [a1 string1Value];
}

id objc_msgSend_string2Name(void *a1, const char *a2, ...)
{
  return [a1 string2Name];
}

id objc_msgSend_string2Value(void *a1, const char *a2, ...)
{
  return [a1 string2Value];
}

id objc_msgSend_stringByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingLastPathComponent];
}

id objc_msgSend_subsystem(void *a1, const char *a2, ...)
{
  return [a1 subsystem];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSince1970];
}

id objc_msgSend_timebaseRatio(void *a1, const char *a2, ...)
{
  return [a1 timebaseRatio];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_workflow(void *a1, const char *a2, ...)
{
  return [a1 workflow];
}

id objc_msgSend_writeToFile_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFile:options:error:");
}