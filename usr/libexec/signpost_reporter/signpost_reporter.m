void sub_100001D94(id a1, WRWorkflowEventTracker *a2)
{
  [(WRWorkflowEventTracker *)a2 generateTelemetry];
}

void sub_100001E34(id a1, WRWorkflowEventTracker *a2)
{
}

uint64_t sub_1000022CC(uint64_t a1, uint64_t a2)
{
  return 1;
}

uint64_t sub_1000022F0(uint64_t a1, uint64_t a2)
{
  return 1;
}

uint64_t sub_100002314(uint64_t a1, uint64_t a2)
{
  return 1;
}

uint64_t sub_100002338(uint64_t a1)
{
  return 1;
}

double sub_10000236C()
{
  if (qword_100015B40 != -1) {
    dispatch_once(&qword_100015B40, &stru_1000104A0);
  }
  return *(double *)&qword_100015B38;
}

void sub_1000023B0(id a1)
{
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  double v1 = 1.0;
  if (info.numer != info.denom) {
    double v1 = (double)info.numer / (double)info.denom;
  }
  qword_100015B38 = *(void *)&v1;
}

uint64_t sub_1000023FC(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"macOS"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"iPhoneOS"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:@"watchOS"])
  {
    uint64_t v2 = 3;
  }
  else if ([v1 isEqualToString:@"tvOS"])
  {
    uint64_t v2 = 4;
  }
  else if ([v1 isEqualToString:@"bridgeOS"])
  {
    uint64_t v2 = 5;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

CFStringRef sub_1000024B0(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 4) {
    return @"Unknown";
  }
  else {
    return *(&off_1000104C0 + a1 - 1);
  }
}

uint64_t sub_1000024D8()
{
  return 2;
}

uint64_t sub_1000024E0()
{
  return 1;
}

void sub_1000024E8(void *a1)
{
  if (a1)
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v1 = [a1 executablePathToStallAggregation];
    uint64_t v2 = [v1 objectEnumerator];

    id v3 = [v2 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (!v3) {
      goto LABEL_39;
    }
    id v4 = v3;
    uint64_t v5 = *(void *)v29;
    while (1)
    {
      v6 = 0;
      do
      {
        if (*(void *)v29 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(id *)(*((void *)&v28 + 1) + 8 * (void)v6);
        v8 = [v7 processExecutablePath];

        if (!v8)
        {
          v11 = 0;
          if ((sub_100004378(0, v9) & 1) == 0) {
            goto LABEL_31;
          }
LABEL_24:
          v14 = sub_100002D74();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
            sub_1000094F4((uint64_t)v34, (uint64_t)v7);
          }
          v11 = 0;
          goto LABEL_30;
        }
        v10 = [v7 processExecutablePath];
        v11 = sub_10000405C(v10);

        if ((sub_100004378(v11, v12) & 1) == 0)
        {
          if (!v11) {
            goto LABEL_31;
          }
          v14 = sub_100002D74();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v36 = v11;
            _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Skipping non-internal bundle ID %@.", buf, 0xCu);
          }
          goto LABEL_30;
        }
        if (!v11) {
          goto LABEL_24;
        }
        v13 = [v7 longCommitStats];
        if (v13) {
          goto LABEL_19;
        }
        v13 = [v7 longTransactionLifetimeStats];
        if (v13) {
          goto LABEL_19;
        }
        v13 = [v7 longTransactionLifetimeStats];
        if (v13) {
          goto LABEL_19;
        }
        v13 = [v7 longResponsibleFrameLifetimeStats];
        if (v13) {
          goto LABEL_19;
        }
        v13 = [v7 responsibleGlitchStats];
        if (v13) {
          goto LABEL_19;
        }
        v13 = [v7 glitchStats];
        if (v13
          || ([v7 responsibleFirstFrameGlitchStats],
              (v13 = objc_claimAutoreleasedReturnValue()) != 0)
          || ([v7 firstFrameGlitchStats], (v13 = objc_claimAutoreleasedReturnValue()) != 0)
          || ([v7 responsibleNonFirstFrameNonSkipGlitchStats],
              (v13 = objc_claimAutoreleasedReturnValue()) != 0))
        {
LABEL_19:

LABEL_20:
          v14 = +[NSMutableDictionary dictionary];
          [v14 setObject:v11 forKeyedSubscript:@"BundleID"];
          v15 = [v7 longCommitStats];
          sub_1000029EC(@"Commit", v15, v14);

          v16 = [v7 longTransactionLifetimeStats];
          sub_1000029EC(@"TransactionLifetime", v16, v14);

          v17 = [v7 longHIDLatencyStats];
          sub_1000029EC(@"HIDLatency", v17, v14);

          v18 = [v7 longResponsibleFrameLifetimeStats];
          sub_1000029EC(@"FrameLifetime", v18, v14);

          v19 = [v7 responsibleGlitchStats];
          sub_1000029EC(@"GlitchLongPole", v19, v14);

          v20 = [v7 glitchStats];
          sub_1000029EC(@"GlitchContributor", v20, v14);

          v21 = [v7 responsibleFirstFrameGlitchStats];
          sub_1000029EC(@"FirstFrameGlitchLongPole", v21, v14);

          v22 = [v7 firstFrameGlitchStats];
          sub_1000029EC(@"FirstFrameGlitchContributor", v22, v14);

          v23 = [v7 responsibleNonFirstFrameNonSkipGlitchStats];
          sub_1000029EC(@"NonFirstFrameNonSkipGlitchLongPole", v23, v14);

          v24 = [v7 responsibleNonFirstFrameNonSkipPerceivedGlitchStats];
          sub_1000029EC(@"NonFirstFrameNonSkipPerceivedGlitchLongPole", v24, v14);

          v25 = sub_100002D74();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
            sub_100009550((uint64_t)v33, (uint64_t)v14);
          }

          j__AnalyticsSendEvent();
LABEL_30:

          goto LABEL_31;
        }
        v26 = [v7 responsibleNonFirstFrameNonSkipPerceivedGlitchStats];

        if (v26) {
          goto LABEL_20;
        }
LABEL_31:

        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v27 = [v2 countByEnumeratingWithState:&v28 objects:v32 count:16];
      id v4 = v27;
      if (!v27) {
        goto LABEL_39;
      }
    }
  }
  uint64_t v2 = sub_100002D74();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_1000094B0(v2);
  }
LABEL_39:
}

void sub_1000029EC(void *a1, void *a2, void *a3)
{
  if (a2)
  {
    id v5 = a3;
    id v6 = a2;
    id v7 = a1;
    id v12 = +[NSString stringWithFormat:@"%@Count", v7];
    v8 = +[NSString stringWithFormat:@"%@TotalMs", v7];

    v9 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v6 intervalCount]);
    [v5 setObject:v9 forKeyedSubscript:v12];

    unint64_t v10 = (unint64_t)[v6 totalIntervalDurationNs];
    v11 = +[NSNumber numberWithUnsignedLongLong:v10 / 0xF4240];
    [v5 setObject:v11 forKeyedSubscript:v8];
  }
}

void sub_100002B30(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_debug_impl(a1, v4, OS_LOG_TYPE_DEBUG, a4, v5, 0xCu);
}

uint64_t sub_100002B50(uint64_t a1, uint64_t a2)
{
  return a2;
}

id sub_100002B64(uint64_t a1)
{
  if (a1 == 2)
  {
    if (qword_100015B60 != -1) {
      dispatch_once(&qword_100015B60, &stru_100010508);
    }
    id v1 = &qword_100015B58;
    goto LABEL_9;
  }
  if (a1 == 1)
  {
    if (qword_100015B50 != -1) {
      dispatch_once(&qword_100015B50, &stru_1000104E8);
    }
    id v1 = &qword_100015B48;
LABEL_9:
    id v2 = (id)*v1;
    goto LABEL_11;
  }
  id v2 = 0;
LABEL_11:

  return v2;
}

void sub_100002C0C(id a1)
{
  id v1 = [SRSubsystemCategoryNameFilter alloc];
  if (qword_100015B70 != -1) {
    dispatch_once(&qword_100015B70, &stru_100010528);
  }
  id v4 = (id)qword_100015B68;
  id v2 = [(SRSubsystemCategoryNameFilter *)v1 initWithDictionaryArray:v4];
  id v3 = (void *)qword_100015B48;
  qword_100015B48 = (uint64_t)v2;
}

void sub_100002CA8(id a1)
{
  id v1 = [SRSubsystemCategoryNameFilter alloc];
  if (qword_100015B80 != -1) {
    dispatch_once(&qword_100015B80, &stru_100010548);
  }
  id v4 = (id)qword_100015B78;
  id v2 = [(SRSubsystemCategoryNameFilter *)v1 initWithDictionaryArray:v4];
  id v3 = (void *)qword_100015B58;
  qword_100015B58 = (uint64_t)v2;
}

void sub_100002D44(id a1)
{
  id v1 = (void *)qword_100015B68;
  qword_100015B68 = (uint64_t)&off_100012618;
}

void sub_100002D5C(id a1)
{
  id v1 = (void *)qword_100015B78;
  qword_100015B78 = (uint64_t)&off_100012630;
}

id sub_100002D74()
{
  if (qword_100015B88 != -1) {
    dispatch_once(&qword_100015B88, &stru_100010568);
  }
  v0 = (void *)qword_100015B90;

  return v0;
}

void sub_100002DC8(id a1)
{
  qword_100015B90 = (uint64_t)os_log_create("com.apple.SignpostSupport", "signpost_reporter");

  _objc_release_x1();
}

void sub_1000039AC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

uint64_t sub_1000039C8(void *a1, uint64_t a2)
{
  id v3 = a1;
  id v4 = v3;
  if (a2 == 2)
  {
    id v5 = [v3 string1Name];
    if ([v5 isEqualToString:@"<workflowID>"])
    {
      uint64_t v6 = [v4 subsystem];
      unsigned int v7 = [v6 isEqualToString:@"com.apple.CoreIDV.telemetry"];

      if (v7)
      {
        v8 = [v4 category];
        unsigned int v9 = [v8 isEqualToString:@"api"];

        if (v9)
        {
          unint64_t v10 = [v4 name];
          if (qword_100015BB0 != -1) {
            dispatch_once(&qword_100015BB0, &stru_1000105A8);
          }
          v11 = (void *)qword_100015BA8;
LABEL_25:
          uint64_t v27 = (uint64_t)[v11 containsObject:v10];

          goto LABEL_26;
        }
        long long v28 = [v4 category];
        unsigned int v29 = [v28 isEqualToString:@"requests"];

        if (v29)
        {
          unint64_t v10 = [v4 name];
          if (qword_100015BC0 != -1) {
            dispatch_once(&qword_100015BC0, &stru_1000105C8);
          }
          v11 = (void *)qword_100015BB8;
          goto LABEL_25;
        }
        long long v30 = [v4 category];
        unsigned int v31 = [v30 isEqualToString:@"library"];

        if (v31)
        {
          unint64_t v10 = [v4 name];
          if (qword_100015BD0 != -1) {
            dispatch_once(&qword_100015BD0, &stru_1000105E8);
          }
          v11 = (void *)qword_100015BC8;
          goto LABEL_25;
        }
      }
    }
    else
    {
    }
  }
  if (sub_100003C14(v4))
  {
    id v12 = sub_100003D54();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_100009694(v12, v13, v14, v15, v16, v17, v18, v19);
    }
  }
  else
  {
    if (!sub_100003E70(v4))
    {
      uint64_t v27 = 0;
      goto LABEL_26;
    }
    id v12 = sub_100003D54();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_1000096CC(v12, v20, v21, v22, v23, v24, v25, v26);
    }
  }

  uint64_t v27 = 1;
LABEL_26:

  return v27;
}

BOOL sub_100003C14(void *a1)
{
  id v1 = a1;
  if (qword_100015BA0 != -1) {
    dispatch_once(&qword_100015BA0, &stru_100010588);
  }
  id v2 = [v1 string1Name];
  if ([@"AppVersion" isEqualToString:v2])
  {
    id v3 = (void *)qword_100015B98;
    id v4 = [v1 name];
    if ([v3 containsObject:v4])
    {
      id v5 = off_100015A30;
      uint64_t v6 = [v1 category];
      if ([(__CFString *)v5 isEqualToString:v6])
      {
        unsigned int v7 = off_100015A38;
        v8 = [v1 subsystem];
        if ([(__CFString *)v7 isEqualToString:v8]) {
          BOOL v9 = [v1 durationMachContinuousTime] != 0;
        }
        else {
          BOOL v9 = 0;
        }
      }
      else
      {
        BOOL v9 = 0;
      }
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

id sub_100003D54()
{
  if (qword_100015BD8 != -1) {
    dispatch_once(&qword_100015BD8, &stru_100010608);
  }
  v0 = (void *)qword_100015BE0;

  return v0;
}

id sub_100003DAC(void *a1)
{
  id v1 = sub_100003E70(a1);
  if (v1)
  {
    id v2 = sub_100003D54();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      sub_100009704(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  return v1;
}

void sub_100003E00(id a1)
{
  qword_100015B98 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", off_100015A40, off_100015A48, off_100015A50, off_100015A58, 0);

  _objc_release_x1();
}

id sub_100003E70(void *a1)
{
  id v1 = a1;
  id v2 = off_100015A70;
  uint64_t v3 = [v1 name];
  if ([(__CFString *)v2 isEqualToString:v3])
  {
    uint64_t v4 = off_100015A68;
    uint64_t v5 = [v1 category];
    if ([(__CFString *)v4 isEqualToString:v5])
    {
      uint64_t v6 = off_100015A60;
      uint64_t v7 = [v1 subsystem];
      id v8 = [(__CFString *)v6 isEqualToString:v7];
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

void sub_100003F3C(id a1)
{
  qword_100015BA8 = +[NSSet setWithArray:&off_100012648];

  _objc_release_x1();
}

void sub_100003F84(id a1)
{
  qword_100015BB8 = +[NSSet setWithArray:&off_100012660];

  _objc_release_x1();
}

void sub_100003FCC(id a1)
{
  qword_100015BC8 = +[NSSet setWithArray:&off_100012678];

  _objc_release_x1();
}

void sub_100004014(id a1)
{
  qword_100015BE0 = (uint64_t)os_log_create("com.apple.SignpostSupport", "TelemetryStringAllowlistingExemption");

  _objc_release_x1();
}

id sub_10000405C(void *a1)
{
  id v1 = a1;
  id v2 = v1;
  if (qword_100015BF0 != -1)
  {
    dispatch_once(&qword_100015BF0, &stru_100010628);
    if (v2) {
      goto LABEL_3;
    }
LABEL_26:
    id v5 = 0;
    goto LABEL_27;
  }
  if (!v1) {
    goto LABEL_26;
  }
LABEL_3:
  uint64_t v3 = [(id)qword_100015BE8 objectForKeyedSubscript:v2];
  uint64_t v4 = +[NSNull null];

  if (v3 == v4)
  {
    id v5 = 0;
  }
  else if (v3)
  {
    id v5 = v3;
  }
  else
  {
    uint64_t v6 = [v2 lastPathComponent];
    uint64_t v7 = +[NSString stringWithFormat:@"%@.", v6];

    id v8 = [v2 stringByDeletingLastPathComponent];
    if (v8)
    {
      unint64_t v9 = 0;
      while (([v8 isEqualToString:&stru_100011260] & 1) == 0
           && ([v8 isEqualToString:@"/"] & 1) == 0
           && v9 <= 0x63)
      {
        unint64_t v10 = [v8 lastPathComponent];
        if ([v10 hasPrefix:v7])
        {
          id v8 = v8;

          uint64_t v13 = +[NSBundle bundleWithPath:v8];
          uint64_t v14 = v13;
          if (!v13) {
            goto LABEL_23;
          }
          uint64_t v15 = [v13 bundleIdentifier];

          if (!v15) {
            goto LABEL_23;
          }
          uint64_t v16 = [v14 bundleIdentifier];
          [(id)qword_100015BE8 setObject:v16 forKeyedSubscript:v2];

          id v5 = [v14 bundleIdentifier];
          uint64_t v17 = sub_100002D74();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
            sub_10000973C((uint64_t)v5, (uint64_t)v2, v17);
          }

          if (v5)
          {
            [(id)qword_100015BE8 setObject:v5 forKeyedSubscript:v2];
          }
          else
          {
LABEL_23:
            uint64_t v18 = +[NSNull null];
            [(id)qword_100015BE8 setObject:v18 forKeyedSubscript:v2];

            id v5 = 0;
          }

          goto LABEL_15;
        }
        ++v9;
        uint64_t v11 = [v8 stringByDeletingLastPathComponent];

        id v8 = (id)v11;
        if (!v11) {
          break;
        }
      }
    }
    id v12 = +[NSNull null];
    [(id)qword_100015BE8 setObject:v12 forKeyedSubscript:v2];

    id v5 = 0;
LABEL_15:
  }
LABEL_27:

  return v5;
}

void sub_100004338(id a1)
{
  qword_100015BE8 = +[NSMutableDictionary dictionary];

  _objc_release_x1();
}

void *sub_100004378(void *a1, const char *a2)
{
  if (a1) {
    return [a1 hasPrefix:@"com.apple."];
  }
  return a1;
}

uint64_t sub_100004860(void *a1)
{
  id v1 = a1;
  id v2 = [v1 attributes];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"BundleIdOverride"];

  if (v3)
  {
    id v4 = v1;
    id v5 = [v4 subsystem];
    unsigned int v6 = [v5 isEqualToString:@"com.apple.runningboard"];

    if (v6
      && ([v4 category],
          uint64_t v7 = objc_claimAutoreleasedReturnValue(),
          unsigned int v8 = [v7 isEqualToString:@"sp_telemetry"],
          v7,
          v8))
    {
      if (qword_100015C20 != -1) {
        dispatch_once(&qword_100015C20, &stru_1000106A8);
      }
      uint64_t v9 = qword_100015C18;
      unint64_t v10 = [v4 name];
      LOBYTE(v9) = [(id)v9 containsObject:v10];

      if (v9) {
        goto LABEL_17;
      }
    }
    else
    {
    }
    uint64_t v11 = [v4 subsystem];
    unsigned __int8 v12 = [v11 isEqualToString:@"com.apple.spindump"];

    if (v12)
    {
LABEL_17:
      uint64_t v3 = 1;
      goto LABEL_28;
    }
    uint64_t v13 = [v4 subsystem];
    if ([v13 isEqualToString:@"com.apple.SplashBoard"])
    {
      uint64_t v14 = [v4 category];
      unsigned __int8 v15 = [v14 isEqualToString:@"Snapshot"];

      if (v15) {
        goto LABEL_17;
      }
    }
    else
    {
    }
    uint64_t v16 = [v4 subsystem];
    if ([v16 isEqualToString:@"com.apple.SplashBoard"])
    {
      uint64_t v17 = [v4 category];
      if ([v17 isEqualToString:@"Memory"])
      {
        uint64_t v18 = [v4 name];
        unsigned __int8 v19 = [v18 isEqualToString:@"OverMemoryLimit"];

        if (v19) {
          goto LABEL_17;
        }
LABEL_20:
        id v20 = v4;
        uint64_t v21 = [v20 name];
        if ([v21 isEqualToString:@"HangInterval"])
        {
          uint64_t v22 = [v20 subsystem];
          unsigned int v23 = [v22 isEqualToString:@"com.apple.hangtracer"];

          if (v23)
          {
            uint64_t v24 = [v20 category];
            unsigned __int8 v25 = [v24 isEqualToString:@"signpost_hang"];

            if ((v25 & 1) != 0
              || ([v20 category],
                  uint64_t v26 = objc_claimAutoreleasedReturnValue(),
                  unsigned __int8 v27 = [v26 isEqualToString:@"always_on_hang"],
                  v26,
                  (v27 & 1) != 0))
            {
              uint64_t v3 = 1;
LABEL_27:

              goto LABEL_28;
            }
          }
        }
        else
        {
        }
        uint64_t v3 = 0;
        goto LABEL_27;
      }
    }
    goto LABEL_20;
  }
LABEL_28:

  return v3;
}

void start()
{
  dispatch_queue_t v1 = dispatch_queue_create("signpost_reporter processing queue", 0);
  id v2 = (void *)qword_100015BF8;
  qword_100015BF8 = (uint64_t)v1;

  dispatch_queue_t v3 = dispatch_queue_create("signpost_reporter CoreAnalytics reporting queue", 0);
  id v4 = (void *)qword_100015C00;
  qword_100015C00 = (uint64_t)v3;

  dispatch_source_t v5 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 2uLL, 0, (dispatch_queue_t)qword_100015BF8);
  unsigned int v6 = (void *)qword_100015C08;
  qword_100015C08 = (uint64_t)v5;

  dispatch_source_set_event_handler((dispatch_source_t)qword_100015C08, &stru_100010648);
  xpc_activity_register("com.apple.signpost.signpost_reporter_activity", XPC_ACTIVITY_CHECK_IN, &stru_100010688);
  dispatch_resume((dispatch_object_t)qword_100015C08);
  dispatch_main();
}

void sub_1000050EC(id a1)
{
}

void sub_100005100(id a1, OS_xpc_object *a2)
{
  id v2 = a2;
  dispatch_queue_t v3 = (void *)os_transaction_create();
  xpc_activity_state_t state = xpc_activity_get_state(v2);
  if (state == 2)
  {
    if (xpc_activity_should_defer(v2) && xpc_activity_set_state(v2, 3))
    {
      unsigned int v6 = sub_100002D74();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf.f_bsize) = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Deferred signpost_reporter\n", (uint8_t *)&buf, 2u);
      }
      goto LABEL_13;
    }
    v79 = v2;
    if (os_variant_has_internal_diagnostics())
    {
      uint64_t v7 = sub_100002D74();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf.f_bsize) = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Reporting based on os_variant result", (uint8_t *)&buf, 2u);
      }

      BOOL v8 = 1;
    }
    else
    {
      dispatch_queue_t v9 = dispatch_queue_create("signpost_reporter configuration observing queue", 0);
      dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
      v104 = 0;
      uint64_t v105 = (uint64_t)&v104;
      uint64_t v106 = 0x2020000000;
      LOBYTE(v107) = 0;
      id v11 = objc_alloc_init((Class)AnalyticsConfigurationObserver);
      unsigned __int8 v12 = [SignpostReporterConfigObserverDelegate alloc];
      *(void *)&buf.f_bsize = _NSConcreteStackBlock;
      buf.f_blocks = 3221225472;
      buf.f_bfree = (uint64_t)sub_100007F1C;
      buf.f_bavail = (uint64_t)&unk_100010838;
      buf.f_ffree = (uint64_t)&v104;
      uint64_t v13 = v10;
      buf.f_files = (uint64_t)v13;
      uint64_t v14 = [(SignpostReporterConfigObserverDelegate *)v12 initWithCallbackBlock:&buf];
      [v11 setConfigurationObserverDelegate:v14 queue:v9];
      [v11 startObservingConfigurationType:@"com.apple.performance.signpost_reporter_tasking"];
      dispatch_time_t v15 = dispatch_time(0, 5000000000);
      if (dispatch_semaphore_wait(v13, v15))
      {
        uint64_t v16 = sub_100002D74();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v96 = 0;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Not reporting based on not being tasked-on by CoreAnalytics (Timeout waiting for config)", v96, 2u);
        }

        BOOL v8 = 0;
      }
      else
      {
        BOOL v8 = *(unsigned char *)(v105 + 24) != 0;
      }

      _Block_object_dispose(&v104, 8);
    }
    byte_100015C28 = v8;
    uint64_t v17 = sub_100002D74();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      buf.f_bsize = 138412802;
      if (byte_100015C28) {
        CFStringRef v18 = @"Enabled";
      }
      else {
        CFStringRef v18 = @"Disabled";
      }
      *(void *)&buf.f_iosize = v18;
      WORD2(buf.f_blocks) = 2112;
      *(uint64_t *)((char *)&buf.f_blocks + 6) = @"Enabled";
      HIWORD(buf.f_bfree) = 2112;
      buf.f_bavail = @"Enabled";
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "os_signpost CA Telemetry: %@, aggregation CA telemetry: %@, CAMetalLayer CA telemetry: %@", (uint8_t *)&buf, 0x20u);
    }

    if (sub_100005F8C())
    {
      unsigned __int8 v19 = sub_100002D74();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf.f_bsize) = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Bailing due to cookie file", (uint8_t *)&buf, 2u);
      }

      sub_100006024();
      goto LABEL_62;
    }
    id v20 = +[NSFileManager defaultManager];
    if (sub_100005F8C())
    {

LABEL_62:
      goto LABEL_63;
    }
    unsigned int v21 = [v20 createFileAtPath:@"/var/run/signpost_reporter_running" contents:0 attributes:0];
    uint64_t v22 = sub_100002D74();
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
    if (!v21)
    {
      if (v23)
      {
        LOWORD(buf.f_bsize) = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Could not create cookie file", (uint8_t *)&buf, 2u);
      }

      goto LABEL_62;
    }
    if (v23)
    {
      LOWORD(buf.f_bsize) = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Created cookie file", (uint8_t *)&buf, 2u);
    }

    uint64_t v73 = mach_continuous_time();
    id v24 = objc_alloc_init((Class)SignpostSupportObjectExtractor);
    if (!byte_100015C28)
    {
      id v77 = 0;
      v72 = 0;
      CFStringRef v26 = 0;
      id v27 = 0;
      +[SignpostWorkflowResponsiveness allWorkflows];
      v38 = LABEL_51:;
      id v39 = [objc_alloc((Class)SignpostAggregationAccumulator) initWithIncludeRawIntervals:0];
      id v40 = [objc_alloc((Class)SSCAMetalLayerClientSessionAccumulator) initWithIncludeTimelines:0];
      v41 = sub_100002D74();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        buf.f_bsize = 138412290;
        *(void *)&buf.f_iosize = v26;
        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Boot disk type: %@", (uint8_t *)&buf, 0xCu);
      }

      v104 = _NSConcreteStackBlock;
      uint64_t v105 = 3221225472;
      uint64_t v106 = (uint64_t)sub_100006450;
      v107 = &unk_100010720;
      id v71 = v39;
      id v108 = v71;
      id v42 = v77;
      id v109 = v42;
      id v43 = v38;
      id v110 = v43;
      id v44 = v27;
      id v112 = v44;
      id v45 = v40;
      id v111 = v45;
      [v24 setIntervalCompletionProcessingBlock:&v104];
      *(void *)v96 = _NSConcreteStackBlock;
      uint64_t v97 = 3221225472;
      v98 = sub_1000065C4;
      v99 = &unk_100010748;
      id v46 = v42;
      id v100 = v46;
      id v47 = v43;
      id v101 = v47;
      id v76 = v44;
      id v103 = v76;
      id v48 = v45;
      id v102 = v48;
      [v24 setEmitEventProcessingBlock:v96];
      v92[0] = _NSConcreteStackBlock;
      v92[1] = 3221225472;
      v92[2] = sub_100006708;
      v92[3] = &unk_100010770;
      id v78 = v46;
      id v93 = v78;
      id v75 = v47;
      id v94 = v75;
      id v70 = v48;
      id v95 = v70;
      [v24 setDeviceRebootProcessingBlock:v92];

      if (byte_100015C28)
      {
        v90[0] = _NSConcreteStackBlock;
        v90[1] = 3221225472;
        v90[2] = sub_100006818;
        v90[3] = &unk_100010798;
        id v91 = v76;
        [v24 setAnimationIntervalCompletionProcessingBlock:v90];
        v87[0] = _NSConcreteStackBlock;
        v87[1] = 3221225472;
        v87[2] = sub_100006840;
        v87[3] = &unk_1000107C0;
        id v88 = v78;
        id v89 = v75;
        [v24 setBeginEventProcessingBlock:v87];
        [v24 setBuildSkyLightAnimationCompositeIntervalTimelines:0];
      }
      v85[0] = 0;
      v85[1] = v85;
      v85[2] = 0x2020000000;
      char v86 = 0;
      v49 = +[NSDate dateWithTimeIntervalSinceNow:-86400.0];
      v50 = +[NSDate date];
      v51 = dispatch_queue_create("signpost_reporter defer polling queue", 0);
      dispatch_source_t v52 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v51);
      v53 = (void *)qword_100015C10;
      qword_100015C10 = (uint64_t)v52;

      dispatch_source_set_timer((dispatch_source_t)qword_100015C10, 0, 0x9502F900uLL, 0x9502F900uLL);
      objc_initWeak((id *)&buf, v24);
      v54 = qword_100015C10;
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_100006950;
      handler[3] = &unk_1000107E8;
      v82 = v79;
      objc_copyWeak(&v84, (id *)&buf);
      v83 = v85;
      dispatch_source_set_event_handler(v54, handler);
      dispatch_resume((dispatch_object_t)qword_100015C10);
      objc_destroyWeak(&v84);

      objc_destroyWeak((id *)&buf);
      id v80 = 0;
      LOBYTE(v54) = [v24 processLogArchiveWithPath:0 startDate:v49 endDate:v50 errorOut:&v80];
      id v74 = v80;
      if ((v54 & 1) == 0)
      {
        v55 = sub_100002D74();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
        {
          v56 = [v74 localizedDescription];
          buf.f_bsize = 138412290;
          *(void *)&buf.f_iosize = v56;
          _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "Failed to process signpost data due to error: %@", (uint8_t *)&buf, 0xCu);
        }
      }
      unint64_t v57 = mach_continuous_time() - v73;
      if (qword_100015C68 != -1) {
        dispatch_once(&qword_100015C68, &stru_100010878);
      }
      float v58 = *(double *)&qword_100015C70 * (double)v57;
      v59 = qword_100015C00;
      *(void *)&buf.f_bsize = _NSConcreteStackBlock;
      buf.f_blocks = 3221225472;
      buf.f_bfree = (uint64_t)sub_100006A5C;
      buf.f_bavail = (uint64_t)&unk_100010810;
      id v60 = v71;
      buf.f_files = (uint64_t)v60;
      id v61 = v70;
      buf.f_ffree = (uint64_t)v61;
      v62 = v72;
      buf.f_fsid = (fsid_t)v62;
      id v63 = v78;
      *(void *)&buf.f_owner = v63;
      *(float *)&buf.f_mntonname[16] = v58;
      id v64 = v24;
      *(void *)&buf.f_mntonname[8] = v85;
      *(void *)&buf.f_flags = v64;
      *(void *)buf.f_fstypename = 0;
      id v65 = v49;
      *(void *)&buf.f_fstypename[8] = v65;
      id v66 = v50;
      *(void *)buf.f_mntonname = v66;
      dispatch_sync(v59, &buf);
      sub_100006024();

      _Block_object_dispose(v85, 8);
      goto LABEL_62;
    }
    if (sub_1000024E0())
    {
      id v77 = objc_alloc_init((Class)SignpostCAStallAggregationBuilder);
      LODWORD(v25) = dword_100015A28;
      [v77 setMaxDurationSec:v25];
    }
    else
    {
      id v77 = 0;
    }
    long long v28 = objc_alloc_init(SignpostReporterObjectFilter);
    bzero(&buf, 0x878uLL);
    if (statfs("/", &buf))
    {
      unsigned int v29 = sub_100002D74();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
LABEL_48:
      }
        sub_10000994C(v29, v30, v31, v32, v33, v34, v35, v36);
    }
    else
    {
      v37 = +[NSString stringWithCString:buf.f_fstypename encoding:4];
      unsigned int v29 = sub_100002D74();
      BOOL v67 = os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG);
      if (v37)
      {
        if (v67) {
          sub_100009984((uint64_t)v37, v29);
        }
        goto LABEL_50;
      }
      if (v67) {
        goto LABEL_48;
      }
    }
    v37 = 0;
LABEL_50:

    v113[0] = _NSConcreteStackBlock;
    v113[1] = 3221225472;
    v113[2] = sub_100006100;
    v113[3] = &unk_1000106F8;
    v72 = v28;
    v114 = v72;
    id v69 = v37;
    id v115 = v69;
    v116 = @"SSD";
    id v27 = objc_retainBlock(v113);

    CFStringRef v26 = @"SSD";
    +[SignpostWorkflowResponsiveness allWorkflows];
    goto LABEL_51;
  }
  xpc_activity_state_t v5 = state;
  if (state)
  {
    unsigned int v6 = sub_100002D74();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      buf.f_bsize = 134217984;
      *(void *)&buf.f_iosize = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Unknown state %ld\n", (uint8_t *)&buf, 0xCu);
    }
  }
  else
  {
    unsigned int v6 = sub_100002D74();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf.f_bsize) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Checking in\n", (uint8_t *)&buf, 2u);
    }
  }
LABEL_13:

LABEL_63:
  xpc_transaction_exit_clean();
}

void sub_100005EFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_100005F44(id a1)
{
  qword_100015C18 = +[NSSet setWithArray:&off_100012690];

  _objc_release_x1();
}

id sub_100005F8C()
{
  v0 = +[NSFileManager defaultManager];
  char v12 = 0;
  id v1 = [v0 fileExistsAtPath:@"/var/run/signpost_reporter_running" isDirectory:&v12];
  if (v1) {
    BOOL v2 = v12 == 0;
  }
  else {
    BOOL v2 = 1;
  }
  if (!v2)
  {
    dispatch_queue_t v3 = sub_100002D74();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      sub_1000099FC(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  return v1;
}

void sub_100006024()
{
  if (sub_100005F8C())
  {
    v0 = +[NSFileManager defaultManager];
    id v6 = 0;
    unsigned int v1 = [v0 removeItemAtPath:@"/var/run/signpost_reporter_running" error:&v6];
    id v2 = v6;
    dispatch_queue_t v3 = sub_100002D74();
    uint64_t v4 = v3;
    if (v1)
    {
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v5 = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Cleared cookie file", v5, 2u);
      }
    }
    else if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      sub_100009A34(v2, v4);
    }
  }
}

void sub_100006100(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) shouldReportSignpostObject:v3 classificationOut:0])
  {
    uint64_t v4 = [v3 coreAnalyticsPayload];
    uint64_t v5 = v4;
    if (v4)
    {
      uint64_t v6 = *(void *)(a1 + 40);
      if (v6) {
        [v4 setObject:v6 forKeyedSubscript:@"BootPartitionFS"];
      }
      [v5 setObject:*(void *)(a1 + 48) forKeyedSubscript:@"BootDiskType"];
      sub_10000623C();
      uint64_t v7 = qword_100015C00;
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_10000633C;
      v9[3] = &unk_1000106D0;
      uint64_t v10 = v3;
      id v11 = v5;
      dispatch_async(v7, v9);

      uint64_t v8 = v10;
    }
    else
    {
      uint64_t v8 = sub_100002D74();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        sub_100009AF0(v3, v8);
      }
    }
  }
}

void sub_10000623C()
{
  if (qword_100015C30 != -1) {
    dispatch_once(&qword_100015C30, &stru_100010858);
  }
  if ((unint64_t)++qword_100015C50 >= 0xA)
  {
    double v0 = *(double *)&qword_100015C38 * (double)(mach_continuous_time() - qword_100015C48);
    if (v0 < *(float *)&dword_100015C40)
    {
      unsigned int v1 = (*(float *)&dword_100015C40 - v0);
      id v2 = sub_100002D74();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
        sub_100009BD0(v1, v2);
      }

      usleep(v1);
      qword_100015C58 += v1;
      ++qword_100015C60;
    }
    qword_100015C50 = 0;
    qword_100015C48 = mach_continuous_time();
  }
}

void sub_10000633C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) subsystem];
  id v3 = [*(id *)(a1 + 32) category];
  uint64_t v4 = [*(id *)(a1 + 32) name];
  v9[0] = @"sp";
  v9[1] = v2;
  v9[2] = v3;
  v9[3] = v4;
  id v5 = v2;
  id v6 = v3;
  uint64_t v7 = +[NSArray arrayWithObjects:v9 count:4];

  uint64_t v8 = [v7 componentsJoinedByString:@"__"];

  AnalyticsSendEvent();
}

uint64_t sub_100006450(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 subsystem];
  unsigned int v5 = [v4 isEqualToString:@"com.apple.Telemetry.PeriodicAggregations"];

  if (v5) {
    [*(id *)(a1 + 32) handleInterval:v3];
  }
  if (byte_100015C28)
  {
    [*(id *)(a1 + 40) handleSignpostInterval:v3];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = *(id *)(a1 + 48);
    id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v12 + 1) + 8 * i) handleSignpostInterval:v3];
        }
        id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  [*(id *)(a1 + 56) processInterval:v3];

  return 1;
}

uint64_t sub_1000065C4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (byte_100015C28)
  {
    [*(id *)(a1 + 32) handleSignpostEvent:v3];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v4 = *(id *)(a1 + 40);
    id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v10 + 1) + 8 * i) handleSignpostEmitEvent:v3, (void)v10];
        }
        id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  [*(id *)(a1 + 48) processEvent:v3];

  return 1;
}

uint64_t sub_100006708(id *a1)
{
  if (byte_100015C28)
  {
    [a1[4] handleDeviceReboot];
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    id v2 = a1[5];
    id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v3)
    {
      id v4 = v3;
      uint64_t v5 = *(void *)v9;
      do
      {
        for (i = 0; i != v4; i = (char *)i + 1)
        {
          if (*(void *)v9 != v5) {
            objc_enumerationMutation(v2);
          }
          [*(id *)(*((void *)&v8 + 1) + 8 * i) handleDeviceReboot:v8];
        }
        id v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v4);
    }
  }
  [a1[6] processDeviceReboot:v8];
  return 1;
}

uint64_t sub_100006818(uint64_t a1)
{
  return 1;
}

uint64_t sub_100006840(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) handleSignpostIntervalBegin:v3];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = *(id *)(a1 + 40);
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      long long v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v8) handleSignpostIntervalBegin:v3, (void)v10];
        long long v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  return 1;
}

void sub_100006950(uint64_t a1)
{
  BOOL should_defer = xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32));
  id v3 = sub_100002D74();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (should_defer)
  {
    if (v4)
    {
      *(_WORD *)statfs buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Trying to stop in-flight reporting work.", buf, 2u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained stopProcessing];

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    id v3 = sub_100002D74();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v8 = 0;
      id v6 = "Concluding processing due to deferral request";
      uint64_t v7 = (uint8_t *)&v8;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
    }
  }
  else if (v4)
  {
    *(_WORD *)long long v9 = 0;
    id v6 = "Deferral not requested, continuing.";
    uint64_t v7 = v9;
    goto LABEL_8;
  }
}

void sub_100006A5C(uint64_t a1)
{
  id v144 = *(id *)(a1 + 32);
  if (v144)
  {
    unsigned int v1 = sub_100002D74();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
    {
      id v2 = [v144 signatureToAccumulatorEntry];
      *(_DWORD *)statfs buf = 134217984;
      CFStringRef v181 = (const __CFString *)[v2 count];
      _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Accumulated information on %llu aggregations", buf, 0xCu);
    }
    long long v217 = 0u;
    long long v218 = 0u;
    long long v215 = 0u;
    long long v216 = 0u;
    id v3 = [v144 signatureToAccumulatorEntry];
    BOOL v4 = [v3 allValues];

    id v5 = [v4 countByEnumeratingWithState:&v215 objects:buf count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v216;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v216 != v6) {
            objc_enumerationMutation(v4);
          }
          __int16 v8 = *(void **)(*((void *)&v215 + 1) + 8 * i);
          long long v9 = [v8 accumulatedAggregation];
          if ([v9 telemetryEnabled])
          {
            long long v10 = [v9 _coreAnalyticsEventPayloadDictionary];
            long long v11 = sub_100002D74();
            long long v12 = v11;
            if (v10)
            {
              if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
              {
                long long v13 = [v8 aggregationSignature];
                LODWORD(v214[0]) = 138412290;
                *(void *)((char *)v214 + 4) = v13;
                _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Submitting CA event payload for %@", (uint8_t *)v214, 0xCu);
              }
              long long v12 = [v9 _coreAnalyticsEventName];
              AnalyticsSendEvent();
            }
            else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            {
              sub_100009C48(v178, v9, &v179, v12);
            }
          }
          else
          {
            long long v10 = sub_100002D74();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
            {
              long long v14 = [v8 aggregationSignature];
              LODWORD(v214[0]) = 138412290;
              *(void *)((char *)v214 + 4) = v14;
              _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%@ is not telemetry enabled", (uint8_t *)v214, 0xCu);
            }
          }
        }
        id v5 = [v4 countByEnumeratingWithState:&v215 objects:buf count:16];
      }
      while (v5);
    }
  }
  id v15 = *(id *)(a1 + 40);
  uint64_t v16 = v15;
  if (v15)
  {
    uint64_t v17 = [v15 coreAnalyticsEvents];
    CFStringRef v18 = sub_100002D74();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v19 = (const __CFString *)[v17 count];
      id v20 = [v16 processingErrors];
      CFStringRef v21 = (const __CFString *)[v20 count];
      *(_DWORD *)statfs buf = 134218240;
      CFStringRef v181 = v19;
      __int16 v182 = 2048;
      CFStringRef v183 = v21;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Reporting information on %llu CAMetalLayer clients with %llu errors encountered", buf, 0x16u);
    }
    long long v217 = 0u;
    long long v218 = 0u;
    long long v215 = 0u;
    long long v216 = 0u;
    id v22 = v17;
    BOOL v23 = (char *)[v22 countByEnumeratingWithState:&v215 objects:buf count:16];
    if (v23)
    {
      uint64_t v24 = *(void *)v216;
      do
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(void *)v216 != v24) {
            objc_enumerationMutation(v22);
          }
          CFStringRef v26 = +[SSCAMetalLayerClientSessionAccumulator coreAnalyticsEventName];
          AnalyticsSendEvent();
        }
        BOOL v23 = (char *)[v22 countByEnumeratingWithState:&v215 objects:buf count:16];
      }
      while (v23);
    }

    v213[0] = @"ErrorCount";
    id v27 = [v16 processingErrors];
    long long v28 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v27 count]);
    *(void *)&v214[0] = v28;
    v213[1] = @"CAMetalLayerSessionCount";
    unsigned int v29 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v22 count]);
    *((void *)&v214[0] + 1) = v29;
    uint64_t v30 = +[NSDictionary dictionaryWithObjects:v214 forKeys:v213 count:2];

    uint64_t v31 = +[SSCAMetalLayerClientSessionAccumulator coreAnalyticsProcessingMetadataName];
    AnalyticsSendEvent();
  }
  uint64_t v33 = *(void **)(a1 + 48);
  uint64_t v32 = *(void **)(a1 + 56);
  float v34 = *(float *)(a1 + 104);
  id v141 = [*(id *)(a1 + 64) processedEventCount];
  int v140 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 96) + 8) + 24);
  uint64_t v143 = *(void *)(a1 + 72);
  if (v143)
  {
    int v142 = 0;
    uint64_t v35 = @"log archive end";
    uint64_t v36 = @"log archive begin";
  }
  else
  {
    uint64_t v36 = +[NSDateFormatter localizedStringFromDate:*(void *)(a1 + 80) dateStyle:1 timeStyle:2];
    if (*(void *)(a1 + 72))
    {
      int v142 = 0;
      uint64_t v35 = @"log archive end";
    }
    else
    {
      uint64_t v35 = +[NSDateFormatter localizedStringFromDate:*(void *)(a1 + 88) dateStyle:1 timeStyle:2];
      int v142 = 1;
    }
  }
  id v148 = v33;
  id v147 = v32;
  v138 = v36;
  v145 = v36;
  v37 = v35;
  if (byte_100015C28)
  {
    v139 = v37;
    uint64_t v174 = 0;
    v175 = &v174;
    uint64_t v176 = 0x2020000000;
    uint64_t v177 = 0;
    v173[0] = _NSConcreteStackBlock;
    v173[1] = 3221225472;
    v173[2] = sub_100008388;
    v173[3] = &unk_1000108A0;
    v173[4] = &v174;
    v38 = objc_retainBlock(v173);
    id v39 = sub_100002D74();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      id v40 = [v148 allInspectedSignpostObjectsAggregation];
      CFStringRef v41 = (const __CFString *)[v40 totalCount];
      *(_DWORD *)statfs buf = 134217984;
      CFStringRef v181 = v41;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "**************\nTotal signpost object count: %llu", buf, 0xCu);
    }
    id v42 = [v148 allInspectedSignpostObjectsAggregation];
    id v43 = [v42 keysInDescendingCountOrder];

    v175[3] = 0;
    long long v169 = 0u;
    long long v170 = 0u;
    long long v171 = 0u;
    long long v172 = 0u;
    id v44 = v43;
    id v45 = [v44 countByEnumeratingWithState:&v169 objects:&v215 count:16];
    id v46 = v35;
    if (v45)
    {
      uint64_t v47 = *(void *)v170;
      do
      {
        for (k = 0; k != v45; k = (char *)k + 1)
        {
          if (*(void *)v170 != v47) {
            objc_enumerationMutation(v44);
          }
          uint64_t v49 = *(void *)(*((void *)&v169 + 1) + 8 * (void)k);
          v50 = [v148 allInspectedSignpostObjectsAggregation];
          ((void (*)(void *, uint64_t, void *, const __CFString *))v38[2])(v38, v49, v50, @"AllInspected");
        }
        uint64_t v35 = v46;
        id v45 = [v44 countByEnumeratingWithState:&v169 objects:&v215 count:16];
      }
      while (v45);
    }

    v51 = sub_100002D74();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      dispatch_source_t v52 = [v148 telemetryReportedAggregation];
      CFStringRef v53 = (const __CFString *)[v52 totalCount];
      *(_DWORD *)statfs buf = 134217984;
      CFStringRef v181 = v53;
      _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "**************\nReported signpost object count: %llu", buf, 0xCu);
    }
    v54 = [v148 telemetryReportedAggregation];
    v55 = [v54 keysInDescendingCountOrder];

    v175[3] = 0;
    long long v165 = 0u;
    long long v166 = 0u;
    long long v167 = 0u;
    long long v168 = 0u;
    id v56 = v55;
    id v57 = [v56 countByEnumeratingWithState:&v165 objects:v214 count:16];
    if (v57)
    {
      uint64_t v58 = *(void *)v166;
      do
      {
        for (m = 0; m != v57; m = (char *)m + 1)
        {
          if (*(void *)v166 != v58) {
            objc_enumerationMutation(v56);
          }
          uint64_t v60 = *(void *)(*((void *)&v165 + 1) + 8 * (void)m);
          id v61 = [v148 telemetryReportedAggregation];
          ((void (*)(void *, uint64_t, void *, const __CFString *))v38[2])(v38, v60, v61, @"Reported");
        }
        uint64_t v35 = v46;
        id v57 = [v56 countByEnumeratingWithState:&v165 objects:v214 count:16];
      }
      while (v57);
    }

    v62 = sub_100002D74();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
    {
      id v63 = [v148 telemetryReportedEventsAggregation];
      CFStringRef v64 = (const __CFString *)[v63 totalCount];
      *(_DWORD *)statfs buf = 134217984;
      CFStringRef v181 = v64;
      _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "**************\nReported signpost event count: %llu", buf, 0xCu);
    }
    id v65 = [v148 telemetryReportedEventsAggregation];
    id v66 = [v65 keysInDescendingCountOrder];

    v175[3] = 0;
    long long v161 = 0u;
    long long v162 = 0u;
    long long v163 = 0u;
    long long v164 = 0u;
    id v67 = v66;
    id v68 = [v67 countByEnumeratingWithState:&v161 objects:v213 count:16];
    if (v68)
    {
      uint64_t v69 = *(void *)v162;
      do
      {
        for (n = 0; n != v68; n = (char *)n + 1)
        {
          if (*(void *)v162 != v69) {
            objc_enumerationMutation(v67);
          }
          uint64_t v71 = *(void *)(*((void *)&v161 + 1) + 8 * (void)n);
          v72 = [v148 telemetryReportedEventsAggregation];
          ((void (*)(void *, uint64_t, void *, const __CFString *))v38[2])(v38, v71, v72, @"ReportedEvents");
        }
        uint64_t v35 = v46;
        id v68 = [v67 countByEnumeratingWithState:&v161 objects:v213 count:16];
      }
      while (v68);
    }

    uint64_t v73 = sub_100002D74();
    if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
    {
      id v74 = [v148 telemetryNotReportedFailedSCFilterAggregation];
      CFStringRef v75 = (const __CFString *)[v74 totalCount];
      *(_DWORD *)statfs buf = 134217984;
      CFStringRef v181 = v75;
      _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_DEFAULT, "**************\nSubsystem/category filtered signpost object count: %llu", buf, 0xCu);
    }
    id v76 = [v148 telemetryNotReportedFailedSCFilterAggregation];
    id v77 = [v76 keysInDescendingCountOrder];

    v175[3] = 0;
    long long v157 = 0u;
    long long v158 = 0u;
    long long v159 = 0u;
    long long v160 = 0u;
    id v78 = v77;
    id v79 = [v78 countByEnumeratingWithState:&v157 objects:v212 count:16];
    if (v79)
    {
      uint64_t v80 = *(void *)v158;
      do
      {
        for (ii = 0; ii != v79; ii = (char *)ii + 1)
        {
          if (*(void *)v158 != v80) {
            objc_enumerationMutation(v78);
          }
          uint64_t v82 = *(void *)(*((void *)&v157 + 1) + 8 * (void)ii);
          v83 = [v148 telemetryNotReportedFailedSCFilterAggregation];
          ((void (*)(void *, uint64_t, void *, const __CFString *))v38[2])(v38, v82, v83, @"SubsystemCategoryFiltered");
        }
        uint64_t v35 = v46;
        id v79 = [v78 countByEnumeratingWithState:&v157 objects:v212 count:16];
      }
      while (v79);
    }

    id v84 = sub_100002D74();
    if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
    {
      v85 = [v148 telemetryNotReportedDurationThresholdAggregation];
      CFStringRef v86 = (const __CFString *)[v85 totalCount];
      *(_DWORD *)statfs buf = 134217984;
      CFStringRef v181 = v86;
      _os_log_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_DEFAULT, "**************\nDuration filtered signpost object count: %llu", buf, 0xCu);
    }
    v87 = [v148 telemetryNotReportedDurationThresholdAggregation];
    id v88 = [v87 keysInDescendingCountOrder];

    v175[3] = 0;
    long long v153 = 0u;
    long long v154 = 0u;
    long long v155 = 0u;
    long long v156 = 0u;
    id v89 = v88;
    id v90 = [v89 countByEnumeratingWithState:&v153 objects:v211 count:16];
    if (v90)
    {
      uint64_t v91 = *(void *)v154;
      do
      {
        for (jj = 0; jj != v90; jj = (char *)jj + 1)
        {
          if (*(void *)v154 != v91) {
            objc_enumerationMutation(v89);
          }
          uint64_t v93 = *(void *)(*((void *)&v153 + 1) + 8 * (void)jj);
          id v94 = [v148 telemetryNotReportedDurationThresholdAggregation];
          ((void (*)(void *, uint64_t, void *, const __CFString *))v38[2])(v38, v93, v94, @"DurationThresholdFiltered");
        }
        uint64_t v35 = v46;
        id v90 = [v89 countByEnumeratingWithState:&v153 objects:v211 count:16];
      }
      while (v90);
    }

    id v95 = sub_100002D74();
    if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
    {
      v96 = [v148 telemetryNotReportedFailedStringAllowlistAggregation];
      CFStringRef v97 = (const __CFString *)[v96 totalCount];
      *(_DWORD *)statfs buf = 134217984;
      CFStringRef v181 = v97;
      _os_log_impl((void *)&_mh_execute_header, v95, OS_LOG_TYPE_DEFAULT, "**************\nString allowlist filtered signpost object count: %llu", buf, 0xCu);
    }
    v98 = [v148 telemetryNotReportedFailedStringAllowlistAggregation];
    v99 = [v98 keysInDescendingCountOrder];

    v175[3] = 0;
    long long v149 = 0u;
    long long v150 = 0u;
    long long v151 = 0u;
    long long v152 = 0u;
    id v100 = v99;
    id v101 = [v100 countByEnumeratingWithState:&v149 objects:v210 count:16];
    if (v101)
    {
      uint64_t v102 = *(void *)v150;
      do
      {
        for (kk = 0; kk != v101; kk = (char *)kk + 1)
        {
          if (*(void *)v150 != v102) {
            objc_enumerationMutation(v100);
          }
          uint64_t v104 = *(void *)(*((void *)&v149 + 1) + 8 * (void)kk);
          uint64_t v105 = [v148 telemetryNotReportedFailedStringAllowlistAggregation];
          ((void (*)(void *, uint64_t, void *, const __CFString *))v38[2])(v38, v104, v105, @"StringWhitelistFiltered");
        }
        uint64_t v35 = v46;
        id v101 = [v100 countByEnumeratingWithState:&v149 objects:v210 count:16];
      }
      while (v101);
    }

    uint64_t v106 = +[NSMutableDictionary dictionary];
    *(float *)&double v107 = v34;
    id v108 = +[NSNumber numberWithFloat:v107];
    [v106 setObject:v108 forKeyedSubscript:@"ProcessingDurationInSeconds"];

    id v109 = +[NSNumber numberWithUnsignedLongLong:v141];
    [v106 setObject:v109 forKeyedSubscript:@"LogObjectsProcessed"];

    id v110 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v148 totalReportedAnimationCount]);
    [v106 setObject:v110 forKeyedSubscript:@"AnimationsReported"];

    id v111 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v148 totalReportedIntervalCount]);
    [v106 setObject:v111 forKeyedSubscript:@"IntervalsReported"];

    id v112 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v148 totalReportedEventCount]);
    [v106 setObject:v112 forKeyedSubscript:@"EventsReported"];

    v113 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v148 totalUnreportedAnimationCount]);
    [v106 setObject:v113 forKeyedSubscript:@"AnimationsNotReported"];

    v114 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v148 totalUnreportedIntervalCount]);
    [v106 setObject:v114 forKeyedSubscript:@"IntervalsNotReported"];

    id v115 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v148 totalUnreportedEventCount]);
    [v106 setObject:v115 forKeyedSubscript:@"EventsNotReported"];

    v116 = +[NSNumber numberWithBool:v140 != 0];
    [v106 setObject:v116 forKeyedSubscript:@"WasInterrupted"];

    AnalyticsSendEvent();
    v117 = sub_100002D74();
    if (os_log_type_enabled(v117, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v136 = (const __CFString *)[v148 totalReportedEventCount];
      CFStringRef v135 = (const __CFString *)[v148 totalUnreportedEventCount];
      CFStringRef v134 = (const __CFString *)[v148 totalReportedIntervalCount];
      double v133 = COERCE_DOUBLE([v148 totalUnreportedIntervalCount]);
      id v132 = [v148 totalReportedAnimationCount];
      id v131 = [v148 totalUnreportedAnimationCount];
      v137 = [v148 telemetryNotReportedFailedSCFilterAggregation];
      id v118 = [v137 totalCount];
      v119 = [v148 telemetryNotReportedDurationThresholdAggregation];
      id v120 = [v119 totalCount];
      v121 = [v148 telemetryNotReportedFailedStringAllowlistAggregation];
      id v122 = [v121 totalCount];
      v123 = [v148 telemetryDisabledAggregation];
      id v124 = [v123 totalCount];
      *(_DWORD *)statfs buf = 134221570;
      v125 = "";
      CFStringRef v181 = v136;
      __int16 v182 = 2048;
      if (v140) {
        v125 = " (Interrupted by deferral)";
      }
      CFStringRef v183 = v135;
      __int16 v184 = 2048;
      CFStringRef v185 = v134;
      __int16 v186 = 2048;
      double v187 = v133;
      __int16 v188 = 2048;
      id v189 = v132;
      __int16 v190 = 2048;
      id v191 = v131;
      __int16 v192 = 2048;
      id v193 = v118;
      __int16 v194 = 2048;
      id v195 = v120;
      __int16 v196 = 2048;
      id v197 = v122;
      __int16 v198 = 2048;
      id v199 = v124;
      __int16 v200 = 2048;
      id v201 = v141;
      __int16 v202 = 2048;
      double v203 = v34;
      __int16 v204 = 2112;
      v205 = v145;
      __int16 v206 = 2112;
      v207 = v139;
      __int16 v208 = 2080;
      v209 = v125;
      _os_log_impl((void *)&_mh_execute_header, v117, OS_LOG_TYPE_DEFAULT, "Done processing %llu reported and %llu unreported events, %llu reported and %llu unreported intervals and %llu reported and %llu unreported animations (%llu blocklisted, %llu too short, %llu allowlisted, %llu telemetry not enabled) from %llu log events in %.2fs between %@ and %@%s\n", buf, 0x98u);

      uint64_t v35 = v46;
    }

    if (qword_100015C60)
    {
      v126 = sub_100002D74();
      if (os_log_type_enabled(v126, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)statfs buf = 134218240;
        CFStringRef v181 = (const __CFString *)qword_100015C60;
        __int16 v182 = 2048;
        CFStringRef v183 = (const __CFString *)qword_100015C58;
        _os_log_impl((void *)&_mh_execute_header, v126, OS_LOG_TYPE_DEFAULT, "Throttled %llu times for a total of %llu usec", buf, 0x16u);
      }
    }
    if (v147)
    {
      v127 = [v147 stallAggregationSnapshot];
      sub_1000024E8(v127);
    }
    _Block_object_dispose(&v174, 8);
    v37 = v139;
  }

  if (v142) {
  if (!v143)
  }

  v128 = sub_100002D74();
  if (os_log_type_enabled(v128, OS_LOG_TYPE_DEFAULT))
  {
    float v129 = *(float *)(a1 + 104);
    if (byte_100015C28) {
      CFStringRef v130 = @"Enabled";
    }
    else {
      CFStringRef v130 = @"Disabled";
    }
    *(_DWORD *)statfs buf = 138413058;
    CFStringRef v181 = v130;
    __int16 v182 = 2112;
    CFStringRef v183 = @"Enabled";
    __int16 v184 = 2112;
    CFStringRef v185 = @"Enabled";
    __int16 v186 = 2048;
    double v187 = v129;
    _os_log_impl((void *)&_mh_execute_header, v128, OS_LOG_TYPE_DEFAULT, "Processing for:\n\tos_signpost CA telemetry: %@\n\tAggregation CA telemetry: %@\n\tCAMetalLayer CA telemetry: %@ took %.2f seconds", buf, 0x2Au);
  }
}

void sub_100007E60(_Unwind_Exception *a1)
{
}

void sub_100007F1C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v5;
  __int16 v8 = (__CFString *)v6;
  if ([(__CFString *)v8 isEqualToString:@"com.apple.performance.signpost_reporter_tasking"])
  {
    if (v7)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v9 = [v7 objectForKeyedSubscript:@"TaskedOn"];
        if (v9)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            unsigned int v10 = [v9 BOOLValue];
            long long v11 = sub_100002D74();
            BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
            if (v10)
            {
              if (v12)
              {
                LOWORD(v1_Block_object_dispose(&STACK[0x240], 8) = 0;
                _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Reporting based on being tasked-on by CoreAnalytics", (uint8_t *)&v18, 2u);
              }
              char v13 = 1;
              goto LABEL_28;
            }
            if (v12)
            {
              int v18 = 138412290;
              CFStringRef v19 = @"TaskedOn";
              uint64_t v17 = "Not reporting based on not being tasked-on by CoreAnalytics ('%@' is false)";
              goto LABEL_26;
            }
LABEL_27:
            char v13 = 0;
LABEL_28:

            goto LABEL_19;
          }
          long long v11 = sub_100002D74();
          if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_27;
          }
          int v18 = 138412290;
          CFStringRef v19 = @"TaskedOn";
          uint64_t v17 = "Not reporting since not tasked-on by CoreAnalytics (Wrong value class for class for %@)";
        }
        else
        {
          long long v11 = sub_100002D74();
          if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_27;
          }
          int v18 = 138412290;
          CFStringRef v19 = @"TaskedOn";
          uint64_t v17 = "Not reporting since is not tasked-on by CoreAnalytics (nil value for %@ key)";
        }
LABEL_26:
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v18, 0xCu);
        goto LABEL_27;
      }
      long long v9 = sub_100002D74();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v1_Block_object_dispose(&STACK[0x240], 8) = 0;
        long long v14 = "Not reporting based on not being tasked-on by CoreAnalytics (Non-NSDictionary configuration object)";
        goto LABEL_16;
      }
    }
    else
    {
      long long v9 = sub_100002D74();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v1_Block_object_dispose(&STACK[0x240], 8) = 0;
        long long v14 = "Not reporting based on not being tasked-on by CoreAnalytics (nil configuration object)";
LABEL_16:
        id v15 = v9;
        uint32_t v16 = 2;
        goto LABEL_17;
      }
    }
  }
  else
  {
    long long v9 = sub_100002D74();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412290;
      CFStringRef v19 = v8;
      long long v14 = "Not reporting based on not being tasked-on by CoreAnalytics (unexpected type string: '%@')";
      id v15 = v9;
      uint32_t v16 = 12;
LABEL_17:
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v18, v16);
    }
  }
  char v13 = 0;
LABEL_19:

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v13;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10000821C(id a1)
{
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  LODWORD(v2) = info.denom;
  LODWORD(v1) = info.numer;
  *(double *)&qword_100015C38 = (double)v1 / (double)v2 / 1000.0;
  dword_100015C40 = 1207182336;
  id v3 = sub_100002D74();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)statfs buf = 134218496;
    uint64_t v6 = 0x40FE848000000000;
    __int16 v7 = 2048;
    double v8 = 125000.0 / *(double *)&qword_100015C38;
    __int16 v9 = 1024;
    int v10 = 10;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%f us, %f mach time units per quantum of %u reported events", buf, 0x1Cu);
  }

  qword_100015C48 = mach_continuous_time();
}

void sub_10000833C(id a1)
{
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  LODWORD(v2) = info.denom;
  LODWORD(v1) = info.numer;
  *(double *)&qword_100015C70 = (double)v1 * 0.000000001 / (double)v2;
}

void sub_100008388(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  sub_10000623C();
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) > 4uLL)
  {
    uint64_t v17 = sub_100002D74();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v23 = [v7 description];
      uint64_t v24 = [v8 aggregationDictionary];
      double v25 = [v24 objectForKeyedSubscript:v7];
      *(_DWORD *)statfs buf = 138412546;
      *(void *)&uint8_t buf[4] = v23;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = [v25 unsignedLongLongValue];
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%@:\t%llu (Count not reported)", buf, 0x16u);
    }
  }
  else
  {
    v28[0] = @"Subsystem";
    id v10 = v7;
    id v27 = v8;
    id v11 = v8;
    id v26 = v9;
    id v12 = v9;
    char v13 = [v10 subsystem];
    *(void *)statfs buf = v13;
    v28[1] = @"Category";
    long long v14 = [v10 category];
    *(void *)&buf[8] = v14;
    v28[2] = @"Count";
    id v15 = [v11 aggregationDictionary];

    uint32_t v16 = [v15 objectForKeyedSubscript:v10];

    v28[3] = @"Classification";
    *(void *)&uint8_t buf[16] = v16;
    id v30 = v12;
    uint64_t v17 = +[NSDictionary dictionaryWithObjects:buf forKeys:v28 count:4];

    AnalyticsSendEvent();
    int v18 = sub_100002D74();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v19 = [v10 description];
      id v20 = [v11 aggregationDictionary];
      CFStringRef v21 = [v20 objectForKeyedSubscript:v10];
      id v22 = [v21 unsignedLongLongValue];
      *(_DWORD *)statfs buf = 138412546;
      *(void *)&uint8_t buf[4] = v19;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v22;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%@:\t%llu (Count reported to CoreAnalytics)", buf, 0x16u);
    }
    id v9 = v26;
    id v8 = v27;
  }

  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
}

void sub_1000086B8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x2Au);
}

int64_t sub_100008BB0(id a1, NSNumber *a2, NSNumber *a3)
{
  return [(NSNumber *)a3 compare:a2];
}

void sub_1000094B0(os_log_t log)
{
  *(_WORD *)unint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Nil CA stall aggregation stats", v1, 2u);
}

void sub_1000094F4(uint64_t a1, uint64_t a2)
{
  BOOL v4 = [sub_100002B50(a1, a2) processExecutablePath];
  *id v3 = 138412290;
  *unint64_t v2 = v4;
  sub_100002B30((void *)&_mh_execute_header, v5, v6, "Could not find bundle ID for %@. Skipping");
}

void sub_100009550(uint64_t a1, uint64_t a2)
{
  BOOL v4 = [[sub_100002B50(a1, a2) description];
  *id v3 = 138412290;
  *unint64_t v2 = v4;
  sub_100002B30((void *)&_mh_execute_header, v5, v6, "CA Stall Aggregation:\n%@");
}

void sub_1000095AC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000095E4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000961C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100009654(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *statfs buf = 0;
  *a2 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Missing required downsample ratio", buf, 2u);
}

void sub_100009694(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000096CC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100009704(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000973C(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Found bundle ID: \"%@\" for path:\"%@\"", (uint8_t *)&v3, 0x16u);
}

void sub_1000097C4(void *a1)
{
  unint64_t v2 = [a1 subsystem];
  int v3 = [a1 category];
  uint64_t v4 = [a1 name];
  sub_100008690();
  sub_1000086B8((void *)&_mh_execute_header, v5, v6, "%@/%@/%@: Overriding bundle ID on event to %@", v7, v8, v9, v10, v11);
}

void sub_100009888(void *a1)
{
  unint64_t v2 = [a1 subsystem];
  int v3 = [a1 category];
  uint64_t v4 = [a1 name];
  sub_100008690();
  sub_1000086B8((void *)&_mh_execute_header, v5, v6, "%@/%@/%@: Overriding bundle ID on interval to %@", v7, v8, v9, v10, v11);
}

void sub_10000994C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100009984(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Filesystem for '/': %@", (uint8_t *)&v2, 0xCu);
}

void sub_1000099FC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100009A34(void *a1, os_log_t log)
{
  if (a1)
  {
    uint64_t v4 = [a1 localizedDescription];
  }
  else
  {
    uint64_t v4 = @"Unknown error";
  }
  int v5 = 138412290;
  uint64_t v6 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Could not clear cookie file: %@", (uint8_t *)&v5, 0xCu);
  if (a1) {
}
  }

void sub_100009AF0(void *a1, NSObject *a2)
{
  uint64_t v4 = [a1 subsystem];
  int v5 = [a1 category];
  uint64_t v6 = [a1 name];
  int v7 = 138412802;
  uint64_t v8 = v4;
  __int16 v9 = 2112;
  uint64_t v10 = v5;
  __int16 v11 = 2112;
  id v12 = v6;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Failed to create payload for %@/%@%@", (uint8_t *)&v7, 0x20u);
}

void sub_100009BD0(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Sleeping for %u us", (uint8_t *)v2, 8u);
}

void sub_100009C48(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  int v7 = [a2 _coreAnalyticsEventName];
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl((void *)&_mh_execute_header, a4, OS_LOG_TYPE_ERROR, "Could not generate telemetry payload for %@", a1, 0xCu);
}

uint64_t AnalyticsSendEvent()
{
  return _AnalyticsSendEvent();
}

uint64_t IsPerfLoggingInterval()
{
  return _IsPerfLoggingInterval();
}

uint64_t PassesPerfLoggingAllowlist()
{
  return _PassesPerfLoggingAllowlist();
}

uint64_t SignpostReporterShouldUseAllowlist()
{
  return _SignpostReporterShouldUseAllowlist();
}

uint64_t StringPassesSignpostReporterStringAllowlist()
{
  return _StringPassesSignpostReporterStringAllowlist();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
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

void bzero(void *a1, size_t a2)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_main(void)
{
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

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
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
  return _dispatch_time(when, delta);
}

void exit(int a1)
{
}

uint64_t mach_continuous_time(void)
{
  return _mach_continuous_time();
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

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
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

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

uint64_t os_variant_has_internal_diagnostics()
{
  return _os_variant_has_internal_diagnostics();
}

int statfs(const char *a1, statfs *a2)
{
  return _statfs(a1, a2);
}

int usleep(useconds_t a1)
{
  return _usleep(a1);
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

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return _xpc_activity_should_defer(activity);
}

uint64_t xpc_transaction_exit_clean()
{
  return _xpc_transaction_exit_clean();
}

id objc_msgSend__coreAnalyticsEventName(void *a1, const char *a2, ...)
{
  return [a1 _coreAnalyticsEventName];
}

id objc_msgSend__coreAnalyticsEventPayloadDictionary(void *a1, const char *a2, ...)
{
  return [a1 _coreAnalyticsEventPayloadDictionary];
}

id objc_msgSend__init(void *a1, const char *a2, ...)
{
  return [a1 _init];
}

id objc_msgSend_accumulatedAggregation(void *a1, const char *a2, ...)
{
  return [a1 accumulatedAggregation];
}

id objc_msgSend_aggregationDictionary(void *a1, const char *a2, ...)
{
  return [a1 aggregationDictionary];
}

id objc_msgSend_aggregationSignature(void *a1, const char *a2, ...)
{
  return [a1 aggregationSignature];
}

id objc_msgSend_allInspectedSignpostObjectsAggregation(void *a1, const char *a2, ...)
{
  return [a1 allInspectedSignpostObjectsAggregation];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_allWorkflows(void *a1, const char *a2, ...)
{
  return [a1 allWorkflows];
}

id objc_msgSend_allowListForAllSignposts(void *a1, const char *a2, ...)
{
  return [a1 allowListForAllSignposts];
}

id objc_msgSend_attributes(void *a1, const char *a2, ...)
{
  return [a1 attributes];
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

id objc_msgSend_callbackBlock(void *a1, const char *a2, ...)
{
  return [a1 callbackBlock];
}

id objc_msgSend_canGenerateCoreAnalyticsPayload(void *a1, const char *a2, ...)
{
  return [a1 canGenerateCoreAnalyticsPayload];
}

id objc_msgSend_cap(void *a1, const char *a2, ...)
{
  return [a1 cap];
}

id objc_msgSend_category(void *a1, const char *a2, ...)
{
  return [a1 category];
}

id objc_msgSend_childTiers(void *a1, const char *a2, ...)
{
  return [a1 childTiers];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_coreAnalyticsEventName(void *a1, const char *a2, ...)
{
  return [a1 coreAnalyticsEventName];
}

id objc_msgSend_coreAnalyticsEvents(void *a1, const char *a2, ...)
{
  return [a1 coreAnalyticsEvents];
}

id objc_msgSend_coreAnalyticsPayload(void *a1, const char *a2, ...)
{
  return [a1 coreAnalyticsPayload];
}

id objc_msgSend_coreAnalyticsProcessingMetadataName(void *a1, const char *a2, ...)
{
  return [a1 coreAnalyticsProcessingMetadataName];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_downsampleEntry(void *a1, const char *a2, ...)
{
  return [a1 downsampleEntry];
}

id objc_msgSend_downsampleRatio(void *a1, const char *a2, ...)
{
  return [a1 downsampleRatio];
}

id objc_msgSend_durationMachContinuousTime(void *a1, const char *a2, ...)
{
  return [a1 durationMachContinuousTime];
}

id objc_msgSend_durationSeconds(void *a1, const char *a2, ...)
{
  return [a1 durationSeconds];
}

id objc_msgSend_endEvent(void *a1, const char *a2, ...)
{
  return [a1 endEvent];
}

id objc_msgSend_eventsReported(void *a1, const char *a2, ...)
{
  return [a1 eventsReported];
}

id objc_msgSend_eventsSeen(void *a1, const char *a2, ...)
{
  return [a1 eventsSeen];
}

id objc_msgSend_executablePathToStallAggregation(void *a1, const char *a2, ...)
{
  return [a1 executablePathToStallAggregation];
}

id objc_msgSend_filterTreeRoot(void *a1, const char *a2, ...)
{
  return [a1 filterTreeRoot];
}

id objc_msgSend_firstFrameGlitchStats(void *a1, const char *a2, ...)
{
  return [a1 firstFrameGlitchStats];
}

id objc_msgSend_glitchStats(void *a1, const char *a2, ...)
{
  return [a1 glitchStats];
}

id objc_msgSend_glitchTimeRatio(void *a1, const char *a2, ...)
{
  return [a1 glitchTimeRatio];
}

id objc_msgSend_glitchTimeRatioMsPerS(void *a1, const char *a2, ...)
{
  return [a1 glitchTimeRatioMsPerS];
}

id objc_msgSend_handleDeviceReboot(void *a1, const char *a2, ...)
{
  return [a1 handleDeviceReboot];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_intervalCount(void *a1, const char *a2, ...)
{
  return [a1 intervalCount];
}

id objc_msgSend_keysInDescendingCountOrder(void *a1, const char *a2, ...)
{
  return [a1 keysInDescendingCountOrder];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_longCommitStats(void *a1, const char *a2, ...)
{
  return [a1 longCommitStats];
}

id objc_msgSend_longHIDLatencyStats(void *a1, const char *a2, ...)
{
  return [a1 longHIDLatencyStats];
}

id objc_msgSend_longResponsibleFrameLifetimeStats(void *a1, const char *a2, ...)
{
  return [a1 longResponsibleFrameLifetimeStats];
}

id objc_msgSend_longTransactionLifetimeStats(void *a1, const char *a2, ...)
{
  return [a1 longTransactionLifetimeStats];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_newChildInstance(void *a1, const char *a2, ...)
{
  return [a1 newChildInstance];
}

id objc_msgSend_nonFirstFrameContributedGlitchTimeRatioAdjustedMsPerS(void *a1, const char *a2, ...)
{
  return [a1 nonFirstFrameContributedGlitchTimeRatioAdjustedMsPerS];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
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

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return [a1 objectEnumerator];
}

id objc_msgSend_platform(void *a1, const char *a2, ...)
{
  return [a1 platform];
}

id objc_msgSend_processDeviceReboot(void *a1, const char *a2, ...)
{
  return [a1 processDeviceReboot];
}

id objc_msgSend_processExecutablePath(void *a1, const char *a2, ...)
{
  return [a1 processExecutablePath];
}

id objc_msgSend_processImagePath(void *a1, const char *a2, ...)
{
  return [a1 processImagePath];
}

id objc_msgSend_processName(void *a1, const char *a2, ...)
{
  return [a1 processName];
}

id objc_msgSend_processedEventCount(void *a1, const char *a2, ...)
{
  return [a1 processedEventCount];
}

id objc_msgSend_processingErrors(void *a1, const char *a2, ...)
{
  return [a1 processingErrors];
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return [a1 reset];
}

id objc_msgSend_responsibleFirstFrameGlitchStats(void *a1, const char *a2, ...)
{
  return [a1 responsibleFirstFrameGlitchStats];
}

id objc_msgSend_responsibleGlitchStats(void *a1, const char *a2, ...)
{
  return [a1 responsibleGlitchStats];
}

id objc_msgSend_responsibleNonFirstFrameNonSkipGlitchStats(void *a1, const char *a2, ...)
{
  return [a1 responsibleNonFirstFrameNonSkipGlitchStats];
}

id objc_msgSend_responsibleNonFirstFrameNonSkipPerceivedGlitchStats(void *a1, const char *a2, ...)
{
  return [a1 responsibleNonFirstFrameNonSkipPerceivedGlitchStats];
}

id objc_msgSend_scnFilter(void *a1, const char *a2, ...)
{
  return [a1 scnFilter];
}

id objc_msgSend_shouldReportThisTime(void *a1, const char *a2, ...)
{
  return [a1 shouldReportThisTime];
}

id objc_msgSend_signatureToAccumulatorEntry(void *a1, const char *a2, ...)
{
  return [a1 signatureToAccumulatorEntry];
}

id objc_msgSend_signpostType(void *a1, const char *a2, ...)
{
  return [a1 signpostType];
}

id objc_msgSend_stallAggregationSnapshot(void *a1, const char *a2, ...)
{
  return [a1 stallAggregationSnapshot];
}

id objc_msgSend_stopProcessing(void *a1, const char *a2, ...)
{
  return [a1 stopProcessing];
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

id objc_msgSend_telemetryDisabledAggregation(void *a1, const char *a2, ...)
{
  return [a1 telemetryDisabledAggregation];
}

id objc_msgSend_telemetryEnabled(void *a1, const char *a2, ...)
{
  return [a1 telemetryEnabled];
}

id objc_msgSend_telemetryNotReportedClassNotSupportedAggregation(void *a1, const char *a2, ...)
{
  return [a1 telemetryNotReportedClassNotSupportedAggregation];
}

id objc_msgSend_telemetryNotReportedDurationThresholdAggregation(void *a1, const char *a2, ...)
{
  return [a1 telemetryNotReportedDurationThresholdAggregation];
}

id objc_msgSend_telemetryNotReportedFailedSCFilterAggregation(void *a1, const char *a2, ...)
{
  return [a1 telemetryNotReportedFailedSCFilterAggregation];
}

id objc_msgSend_telemetryNotReportedFailedStringAllowlistAggregation(void *a1, const char *a2, ...)
{
  return [a1 telemetryNotReportedFailedStringAllowlistAggregation];
}

id objc_msgSend_telemetryReportedAggregation(void *a1, const char *a2, ...)
{
  return [a1 telemetryReportedAggregation];
}

id objc_msgSend_telemetryReportedEventsAggregation(void *a1, const char *a2, ...)
{
  return [a1 telemetryReportedEventsAggregation];
}

id objc_msgSend_totalCount(void *a1, const char *a2, ...)
{
  return [a1 totalCount];
}

id objc_msgSend_totalIntervalDurationNs(void *a1, const char *a2, ...)
{
  return [a1 totalIntervalDurationNs];
}

id objc_msgSend_totalReportedAnimationCount(void *a1, const char *a2, ...)
{
  return [a1 totalReportedAnimationCount];
}

id objc_msgSend_totalReportedEventCount(void *a1, const char *a2, ...)
{
  return [a1 totalReportedEventCount];
}

id objc_msgSend_totalReportedIntervalCount(void *a1, const char *a2, ...)
{
  return [a1 totalReportedIntervalCount];
}

id objc_msgSend_totalUnreportedAnimationCount(void *a1, const char *a2, ...)
{
  return [a1 totalUnreportedAnimationCount];
}

id objc_msgSend_totalUnreportedEventCount(void *a1, const char *a2, ...)
{
  return [a1 totalUnreportedEventCount];
}

id objc_msgSend_totalUnreportedIntervalCount(void *a1, const char *a2, ...)
{
  return [a1 totalUnreportedIntervalCount];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_workflow(void *a1, const char *a2, ...)
{
  return [a1 workflow];
}

id objc_msgSend_workflowEventTracker(void *a1, const char *a2, ...)
{
  return [a1 workflowEventTracker];
}

id objc_msgSend_workflowWithName_(void *a1, const char *a2, ...)
{
  return [a1 workflowWithName:];
}