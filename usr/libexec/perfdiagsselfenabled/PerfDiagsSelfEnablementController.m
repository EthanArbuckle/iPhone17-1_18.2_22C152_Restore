@interface PerfDiagsSelfEnablementController
+ (BOOL)getKillSwitchSettingForPrefix:(id)a3;
+ (BOOL)hasTimeoutExpiredForPrefix:(id)a3;
+ (BOOL)isAnyModeActive;
+ (double)getTimeoutForPrefix:(id)a3;
+ (id)clientClasses;
+ (id)timeoutPrefNameForPrefix:(id)a3;
+ (void)evaluateSelfEnablement;
@end

@implementation PerfDiagsSelfEnablementController

+ (BOOL)isAnyModeActive
{
  v16[0] = @"PDSEHangTracer";
  v16[1] = @"PDSEHTThirdParty";
  v16[2] = @"PDSESentry";
  v16[3] = @"PDSEAppLaunch";
  v16[4] = @"PDSEWorkflowResponsiveness";
  +[NSArray arrayWithObjects:v16 count:5];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    id v4 = v3;
    char v5 = 0;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v2);
        }
        v8 = sub_1000038F0(@"com.apple.da", @"mobile", *(void *)(*((void *)&v11 + 1) + 8 * i));
        id v9 = [v8 count:v11];

        v5 |= v9 != 0;
      }
      id v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
  else
  {
    char v5 = 0;
  }

  return v5 & 1;
}

+ (id)clientClasses
{
  if (qword_10001E520 != -1) {
    dispatch_once(&qword_10001E520, &stru_100018820);
  }
  id v2 = (void *)qword_10001E518;

  return v2;
}

+ (void)evaluateSelfEnablement
{
  uint64_t v80 = tailspin_config_create_with_default_config();
  long long v118 = 0u;
  long long v119 = 0u;
  long long v120 = 0u;
  long long v121 = 0u;
  id v3 = [a1 clientClasses];
  id v4 = [v3 countByEnumeratingWithState:&v118 objects:v128 count:16];
  char v5 = &off_100011000;
  uint64_t v6 = &off_100011000;
  id v92 = a1;
  if (!v4)
  {

    LOBYTE(v22) = 0;
LABEL_26:
    long long v107 = 0u;
    long long v108 = 0u;
    long long v105 = 0u;
    long long v106 = 0u;
    id obj = [a1 clientClasses];
    id v87 = [obj countByEnumeratingWithState:&v105 objects:v126 count:16];
    if (!v87) {
      goto LABEL_108;
    }
    uint64_t v23 = 0;
    uint64_t v85 = *(void *)v106;
    v78 = v94;
    v79 = v95;
    v24 = (mach_header_64 *)&_mh_execute_header;
    int v90 = *((void *)v5 + 163);
    uint64_t v25 = *((void *)v6 + 167);
    while (1)
    {
      v26 = 0;
      do
      {
        if (*(void *)v106 != v85) {
          objc_enumerationMutation(obj);
        }
        v27 = *(void **)(*((void *)&v105 + 1) + 8 * (void)v26);
        v28 = [v27 prefixForDefaults];
        unsigned int v29 = [a1 getKillSwitchSettingForPrefix:v28];
        int v30 = DiagnosticLogSubmissionEnabled();
        v31 = sub_10000DCE8();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138413058;
          CFStringRef v123 = v28;
          __int16 v124 = 1024;
          *(_DWORD *)v125 = v29;
          *(_WORD *)&v125[4] = 1024;
          *(_DWORD *)&v125[6] = v30;
          *(_WORD *)&v125[10] = 1024;
          *(_DWORD *)&v125[12] = v23 & 1;
          _os_log_impl(v24, v31, OS_LOG_TYPE_DEFAULT, "PDSE: evaluateSelfEnablement %@: kill switch setting = %{BOOL}i, diagCollectionEnable = %{BOOL}i, haveEnabledClientAlready = %{BOOL}i", buf, 0x1Eu);
        }

        char v32 = v29 | ~(_BYTE)v30;
        if ([v27 isEqual:objc_opt_class()]) {
          char v33 = v29;
        }
        else {
          char v33 = v32;
        }
        char v34 = v33 | v23;
        v35 = sub_10000DCE8();
        BOOL v36 = os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT);
        if (v34)
        {
          if (v36)
          {
            *(_DWORD *)buf = v90;
            CFStringRef v123 = v28;
            _os_log_impl(v24, v35, OS_LOG_TYPE_DEFAULT, "PDSE: evaluateSelfEnablement %@: shouldDisable == TRUE, do not enable today", buf, 0xCu);
          }
          unsigned int v37 = 0;
        }
        else
        {
          if (v36)
          {
            *(_DWORD *)buf = v90;
            CFStringRef v123 = v28;
            _os_log_impl(v24, v35, OS_LOG_TYPE_DEFAULT, "PDSE: evaluateSelfEnablement %@: calling client's to determine if it wantsEnablement", buf, 0xCu);
          }

          unsigned int v37 = [v27 wantsEnablement];
          v35 = sub_10000DCE8();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            CFStringRef v38 = @"NO";
            if (v37) {
              CFStringRef v38 = @"YES";
            }
            CFStringRef v123 = v28;
            __int16 v124 = 2112;
            *(void *)v125 = v38;
            _os_log_impl(v24, v35, OS_LOG_TYPE_DEFAULT, "PDSE: evaluateSelfEnablement %@: client's wantsEnablement returned %@", buf, 0x16u);
          }
        }

        v39 = sub_1000038F0(@"com.apple.da", @"mobile", (uint64_t)v28);
        id v40 = [v39 count];

        v41 = sub_10000DCE8();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138413058;
          CFStringRef v123 = v28;
          __int16 v124 = 1024;
          *(_DWORD *)v125 = v40 != 0;
          *(_WORD *)&v125[4] = 2048;
          *(void *)&v125[6] = v40;
          *(_WORD *)&v125[14] = 2112;
          *(void *)&v125[16] = v28;
          _os_log_impl(v24, v41, OS_LOG_TYPE_DEFAULT, "PDSE: evaluateSelfEnablement %@: client enabled state = %{BOOL}i, found %lu settings with prefix %@", buf, 0x26u);
        }

        if (v40) {
          char v42 = 1;
        }
        else {
          char v42 = v37;
        }
        if ((v42 & 1) == 0)
        {
          v43 = sub_10000DCE8();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v90;
            CFStringRef v123 = v28;
            _os_log_impl(v24, v43, OS_LOG_TYPE_INFO, "PDSE: evaluateSelfEnablement %@: Transition from Disable to Disable", buf, 0xCu);
          }

          +[NSString stringWithFormat:@"com.apple.pdse.%@.DisableToDisable", v28, v78, v79];
          j__ADClientAddValueForScalarKey();
          v100 = _NSConcreteStackBlock;
          uint64_t v101 = v25;
          v102 = sub_1000060D8;
          v103 = &unk_100018848;
          v104 = v28;
          AnalyticsSendEventLazy();
        }
        uint64_t v44 = v23;
        v45 = v24;
        int v46 = v37 ^ 1;
        if (v40 || (v46 & 1) != 0)
        {
          BOOL v57 = v40 == 0;
          if (v40) {
            char v58 = v37;
          }
          else {
            char v58 = 1;
          }
          if (v58)
          {
            a1 = v92;
          }
          else
          {
            v59 = sub_10000DCE8();
            a1 = v92;
            if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v90;
              CFStringRef v123 = v28;
              _os_log_impl(v45, v59, OS_LOG_TYPE_DEFAULT, "PDSE: evaluateSelfEnablement %@: Transition from Enable to Disable", buf, 0xCu);
            }

            +[NSString stringWithFormat:@"com.apple.pdse.%@.EnableToDisable", v28];
            j__ADClientAddValueForScalarKey();
            CFPreferencesSetValue((CFStringRef)[v92 timeoutPrefNameForPrefix:v28], 0, @"com.apple.da", @"mobile", kCFPreferencesAnyHost);
            unsigned __int8 v60 = [v27 didDisableDiagnostics];
            v61 = sub_10000DCE8();
            BOOL v62 = os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT);
            if (v60)
            {
              if (v62)
              {
                *(_DWORD *)buf = v90;
                CFStringRef v123 = v28;
                _os_log_impl(v45, v61, OS_LOG_TYPE_DEFAULT, "PDSE: evaluateSelfEnablement %@: Successful Transition from Enable to Disable", buf, 0xCu);
              }
            }
            else
            {
              if (v62)
              {
                *(_DWORD *)buf = v90;
                CFStringRef v123 = v28;
                _os_log_impl(v45, v61, OS_LOG_TYPE_DEFAULT, "PDSE: evaluateSelfEnablement %@: FAILED Transition from Enable to Disable", buf, 0xCu);
              }

              +[NSString stringWithFormat:@"com.apple.pdse.%@.EnableToDisable.Failed", v28];
              j__ADClientAddValueForScalarKey();
            }
            v94[3] = _NSConcreteStackBlock;
            v94[4] = v25;
            v95[0] = sub_100006248;
            v95[1] = &unk_100018870;
            v96 = v28;
            unsigned __int8 v97 = v60;
            AnalyticsSendEventLazy();

            BOOL v57 = 0;
            LOBYTE(v22) = 1;
          }
          if ((v57 | v46))
          {
            v24 = v45;
            uint64_t v23 = v44;
            if (!v37) {
              goto LABEL_89;
            }
            goto LABEL_97;
          }
          v65 = sub_10000DCE8();
          v24 = v45;
          if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v90;
            CFStringRef v123 = v28;
            _os_log_impl(v45, v65, OS_LOG_TYPE_INFO, "PDSE: evaluateSelfEnablement %@: Transition from Enable to Enable", buf, 0xCu);
          }

          +[NSString stringWithFormat:@"com.apple.pdse.%@.EnableToEnable", v28];
          j__ADClientAddValueForScalarKey();
          v63 = v93;
          v93[0] = _NSConcreteStackBlock;
          v93[1] = v25;
          v94[0] = sub_100006320;
          v94[1] = &unk_100018848;
          v94[2] = v28;
          uint64_t v23 = v44;
        }
        else
        {
          v47 = sub_10000DCE8();
          v24 = v45;
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            CFStringRef v123 = v28;
            __int16 v124 = 2112;
            *(void *)v125 = v28;
            _os_log_impl(v45, v47, OS_LOG_TYPE_DEFAULT, "PDSE: evaluateSelfEnablement %@: Transition from Disable to Enable, calling %@'s willEnableDiagnostics", buf, 0x16u);
          }

          +[NSString stringWithFormat:@"com.apple.pdse.%@.DisableToEnable", v28];
          j__ADClientAddValueForScalarKey();
          [v27 timeoutDurationSec];
          if (v48 <= 432000.0) {
            double v49 = v48;
          }
          else {
            double v49 = 432000.0;
          }
          v50 = +[NSDate date];
          [v50 timeIntervalSinceReferenceDate];
          double v52 = v49 + v51;

          a1 = v92;
          CFPreferencesSetValue((CFStringRef)[v92 timeoutPrefNameForPrefix:v28], +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v52), @"com.apple.da", @"mobile", kCFPreferencesAnyHost);
          v53 = sub_10000DCE8();
          uint64_t v23 = v44;
          if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
          {
            v54 = [v92 timeoutPrefNameForPrefix:v28];
            *(_DWORD *)buf = 138413058;
            CFStringRef v123 = v28;
            __int16 v124 = 2112;
            *(void *)v125 = v54;
            *(_WORD *)&v125[8] = 2048;
            *(double *)&v125[10] = v52;
            *(_WORD *)&v125[18] = 2048;
            *(double *)&v125[20] = v49;
            _os_log_impl(v24, v53, OS_LOG_TYPE_DEFAULT, "PDSE: evaluateSelfEnablement %@: set setting %@ to %f secs_after_ref_date, which is %f seconds in the future", buf, 0x2Au);
          }
          unsigned int v22 = [v27 willEnableDiagnostics];
          v55 = sub_10000DCE8();
          BOOL v56 = os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT);
          if (v22)
          {
            if (v56)
            {
              *(_DWORD *)buf = v90;
              CFStringRef v123 = v28;
              _os_log_impl(v24, v55, OS_LOG_TYPE_DEFAULT, "PDSE: evaluateSelfEnablement %@: Successful Transition from Disable to Enable", buf, 0xCu);
            }
          }
          else
          {
            if (v56)
            {
              *(_DWORD *)buf = v90;
              CFStringRef v123 = v28;
              _os_log_impl(v24, v55, OS_LOG_TYPE_DEFAULT, "PDSE: evaluateSelfEnablement %@: FAILED Transition from Disable to Enable", buf, 0xCu);
            }

            +[NSString stringWithFormat:@"com.apple.pdse.%@.DisableToEnable.Failed", v28];
            j__ADClientAddValueForScalarKey();
          }
          v63 = v98;
          v98[0] = _NSConcreteStackBlock;
          v98[1] = v25;
          v98[2] = sub_100006170;
          v98[3] = &unk_100018870;
          v98[4] = v28;
          char v99 = v22;
        }
        AnalyticsSendEventLazy();

        if (!v37)
        {
LABEL_89:
          +[NSString stringWithFormat:@"com.apple.pdse.%@.EnableToday", v28];
          j__ADClientSetValueForScalarKey();
          if (![(__CFString *)v28 isEqualToString:@"PDSEHangTracer"]) {
            goto LABEL_91;
          }
LABEL_90:
          j__ADClientSetValueForScalarKey();
          goto LABEL_91;
        }
LABEL_97:
        v66 = +[HTPrefs sharedPrefs];
        unsigned int v67 = [v66 pdseAllowEnableTailspin];

        v68 = sub_10000DCE8();
        BOOL v69 = os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT);
        if (v67)
        {
          if (v69)
          {
            *(_DWORD *)buf = v90;
            CFStringRef v123 = v28;
            _os_log_impl(v24, v68, OS_LOG_TYPE_DEFAULT, "PDSE: evaluateSelfEnablement %@: get desired tailspin config", buf, 0xCu);
          }

          id v70 = [v27 desiredTailspinConfig];
          a1 = v92;
          if (v70)
          {
            uint64_t v71 = (uint64_t)v70;
            tailspin_config_free();
            uint64_t v80 = v71;
          }
        }
        else
        {
          if (v69)
          {
            *(_WORD *)buf = 0;
            _os_log_impl(v24, v68, OS_LOG_TYPE_DEFAULT, "PDSE: evaluateSelfEnablement: will NOT enable tailspin due to PDSE Enable Tailspin is FALSE", buf, 2u);
          }

          a1 = v92;
        }
        +[NSString stringWithFormat:@"com.apple.pdse.%@.EnableToday", v28];
        j__ADClientSetValueForScalarKey();
        uint64_t v23 = 1;
        if ([(__CFString *)v28 isEqualToString:@"PDSEHangTracer"]) {
          goto LABEL_90;
        }
LABEL_91:
        v64 = v28;
        AnalyticsSendEventLazy();

        v26 = (char *)v26 + 1;
      }
      while (v87 != v26);
      id v72 = [obj countByEnumeratingWithState:&v105 objects:v126 count:16];
      id v87 = v72;
      if (!v72)
      {
LABEL_108:

        goto LABEL_109;
      }
    }
  }
  char v83 = 0;
  char v7 = 0;
  uint64_t v88 = *(void *)v119;
  id v8 = v4;
  v82 = v3;
  do
  {
    id v9 = 0;
    id v84 = v8;
    do
    {
      if (*(void *)v119 != v88) {
        objc_enumerationMutation(v3);
      }
      v89 = *(void **)(*((void *)&v118 + 1) + 8 * (void)v9);
      v10 = [v89 prefixForDefaults];
      if ([a1 hasTimeoutExpiredForPrefix:v10])
      {
        v86 = v9;
        long long v116 = 0u;
        long long v117 = 0u;
        long long v114 = 0u;
        long long v115 = 0u;
        userName = v10;
        long long v11 = sub_1000038F0(@"com.apple.da", @"mobile", (uint64_t)v10);
        id v12 = [v11 countByEnumeratingWithState:&v114 objects:v127 count:16];
        if (v12)
        {
          id v13 = v12;
          uint64_t v14 = *(void *)v115;
          do
          {
            for (i = 0; i != v13; i = (char *)i + 1)
            {
              if (*(void *)v115 != v14) {
                objc_enumerationMutation(v11);
              }
              CFStringRef v16 = *(const __CFString **)(*((void *)&v114 + 1) + 8 * i);
              CFPreferencesSetValue(v16, 0, @"com.apple.da", @"mobile", kCFPreferencesAnyHost);
              v17 = sub_10000DCE8();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                CFStringRef v123 = v16;
                _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "PDSE: Timeout Force Disable, delete setting %@", buf, 0xCu);
              }
            }
            id v13 = [v11 countByEnumeratingWithState:&v114 objects:v127 count:16];
          }
          while (v13);
        }

        a1 = v92;
        CFPreferencesSetValue((CFStringRef)[v92 timeoutPrefNameForPrefix:userName], 0, @"com.apple.da", @"mobile", kCFPreferencesAnyHost);
        v18 = sub_10000DCE8();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          v19 = [v92 timeoutPrefNameForPrefix:userName];
          *(_DWORD *)buf = 138412290;
          CFStringRef v123 = v19;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "PDSE: Timeout Force Disable, delete timeout setting %@", buf, 0xCu);
        }
        CFPreferencesSynchronize(@"com.apple.da", @"mobile", kCFPreferencesAnyHost);
        +[NSString stringWithFormat:@"com.apple.pdse.%@.TimeoutForceDisable", userName];
        j__ADClientAddValueForScalarKey();
        v109 = _NSConcreteStackBlock;
        uint64_t v110 = 3221225472;
        v111 = sub_100006054;
        v112 = &unk_100018848;
        v20 = userName;
        v113 = v20;
        AnalyticsSendEventLazy();
        v21 = sub_10000DCE8();
        id v3 = v82;
        id v8 = v84;
        id v9 = v86;
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          CFStringRef v123 = v20;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "PDSE: Timeout Force Disable, call %@'s didDisableDiagnostics method", buf, 0xCu);
        }

        [v89 didDisableDiagnostics];
        char v83 = 1;
        char v7 = 1;
        v10 = userName;
      }

      id v9 = (char *)v9 + 1;
    }
    while (v9 != v8);
    id v8 = [v3 countByEnumeratingWithState:&v118 objects:v128 count:16];
  }
  while (v8);

  uint64_t v6 = &off_100011000;
  char v5 = &off_100011000;
  LOBYTE(v22) = v7;
  if ((v83 & 1) == 0) {
    goto LABEL_26;
  }
LABEL_109:
  v73 = +[HTPrefs sharedPrefs];
  unsigned __int8 v74 = [v73 isInternal];

  v75 = sub_10000DCE8();
  BOOL v76 = os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT);
  if (v74)
  {
    if (v76)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_DEFAULT, "PDSE: evaluateSelfEnablement: will NOT configure tailspin for internal install", buf, 2u);
    }
  }
  else
  {
    if (v76)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_DEFAULT, "PDSE: evaluateSelfEnablement: configure tailspin for desired tailspin config", buf, 2u);
    }

    sub_10000CC48(v80);
  }
  tailspin_config_free();
  if (v22)
  {
    v77 = sub_10000DCE8();
    if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_INFO, "PDSE: Posting notification regarding enablement state change", buf, 2u);
    }

    notify_post(off_10001E510);
  }
}

+ (BOOL)getKillSwitchSettingForPrefix:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PDSEHangTracer"])
  {
    id v4 = +[HTPrefs sharedPrefs];
    unsigned __int8 v5 = [v4 pdseHangTracerKillSwitch];
  }
  else if ([v3 isEqualToString:@"PDSEHTBadDay"])
  {
    id v4 = +[HTPrefs sharedPrefs];
    unsigned __int8 v5 = [v4 pdseHTBadDayKillSwitch];
  }
  else if ([v3 isEqualToString:@"PDSEHTRateOnly"])
  {
    id v4 = +[HTPrefs sharedPrefs];
    unsigned __int8 v5 = [v4 pdseHTRateOnlyKillSwitch];
  }
  else if ([v3 isEqualToString:@"PDSEHTThirdParty"])
  {
    id v4 = +[HTPrefs sharedPrefs];
    unsigned __int8 v5 = [v4 pdseHTThirdPartyKillSwitch];
  }
  else if ([v3 isEqualToString:@"PDSESentry"])
  {
    id v4 = +[HTPrefs sharedPrefs];
    unsigned __int8 v5 = [v4 pdseSentryKillSwitch];
  }
  else if ([v3 isEqualToString:@"PDSEWorkflowResponsiveness"])
  {
    id v4 = +[HTPrefs sharedPrefs];
    unsigned __int8 v5 = [v4 pdseWorkflowResponsivenessKillSwitch];
  }
  else if ([v3 isEqualToString:@"PDSECATailspin"])
  {
    id v4 = +[HTPrefs sharedPrefs];
    unsigned __int8 v5 = [v4 pdseCATailspinKillSwitch];
  }
  else
  {
    if (![v3 isEqualToString:@"PDSEAppLaunch"])
    {
      BOOL v6 = 1;
      goto LABEL_18;
    }
    id v4 = +[HTPrefs sharedPrefs];
    unsigned __int8 v5 = [v4 pdseAppLaunchKillSwitch];
  }
  BOOL v6 = v5;

LABEL_18:
  return v6;
}

+ (id)timeoutPrefNameForPrefix:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PDSEHangTracer"])
  {
    id v4 = &off_1000186C8;
LABEL_17:
    unsigned __int8 v5 = *v4;
    goto LABEL_18;
  }
  if ([v3 isEqualToString:@"PDSEHTBadDay"])
  {
    id v4 = &off_1000186D0;
    goto LABEL_17;
  }
  if ([v3 isEqualToString:@"PDSEHTRateOnly"])
  {
    id v4 = &off_1000186D8;
    goto LABEL_17;
  }
  if ([v3 isEqualToString:@"PDSEHTThirdParty"])
  {
    id v4 = &off_1000186E0;
    goto LABEL_17;
  }
  if ([v3 isEqualToString:@"PDSESentry"])
  {
    id v4 = &off_1000186E8;
    goto LABEL_17;
  }
  if ([v3 isEqualToString:@"PDSEWorkflowResponsiveness"])
  {
    id v4 = &off_100018700;
    goto LABEL_17;
  }
  if ([v3 isEqualToString:@"PDSECATailspin"])
  {
    id v4 = &off_1000186F0;
    goto LABEL_17;
  }
  if ([v3 isEqualToString:@"PDSEAppLaunch"])
  {
    id v4 = &off_1000186F8;
    goto LABEL_17;
  }
  unsigned __int8 v5 = @"PDSEUnknownPrefixTimeout";
LABEL_18:

  return v5;
}

+ (double)getTimeoutForPrefix:(id)a3
{
  id v3 = (void *)CFPreferencesCopyValue((CFStringRef)[a1 timeoutPrefNameForPrefix:a3], @"com.apple.da", @"mobile", kCFPreferencesAnyHost);
  double v4 = 0.0;
  if (objc_opt_respondsToSelector())
  {
    [v3 doubleValue];
    double v4 = v5;
  }

  return v4;
}

+ (BOOL)hasTimeoutExpiredForPrefix:(id)a3
{
  id v4 = a3;
  [a1 getTimeoutForPrefix:v4];
  double v6 = v5;
  char v7 = sub_10000DCE8();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v18 = 138412546;
    id v19 = v4;
    __int16 v20 = 2048;
    double v21 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "PDSE: Fetching timeout for %@, it has value = %f", (uint8_t *)&v18, 0x16u);
  }

  if (v6 == 0.0
    || (+[NSDate date],
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v8 timeIntervalSinceReferenceDate],
        double v10 = v9,
        v8,
        v10 < v6))
  {
    long long v11 = sub_10000DCE8();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = +[NSDate date];
      [v12 timeIntervalSinceReferenceDate];
      int v18 = 138412802;
      id v19 = v4;
      __int16 v20 = 2048;
      double v21 = v6;
      __int16 v22 = 2048;
      uint64_t v23 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "PDSE: Timeout for %@ has not expired (timeout = %f, current time = %f)", (uint8_t *)&v18, 0x20u);
    }
    BOOL v14 = 0;
  }
  else
  {
    long long v11 = sub_10000DCE8();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v16 = +[NSDate date];
      [v16 timeIntervalSinceReferenceDate];
      int v18 = 138412802;
      id v19 = v4;
      __int16 v20 = 2048;
      double v21 = v6;
      __int16 v22 = 2048;
      uint64_t v23 = v17;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "PDSE: Timeout for %@ has EXPIRED! (timeout = %f, current time = %f)", (uint8_t *)&v18, 0x20u);
    }
    BOOL v14 = 1;
  }

  return v14;
}

@end