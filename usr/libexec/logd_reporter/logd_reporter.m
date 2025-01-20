id sub_1000024EC()
{
  void *v0;
  uint64_t vars8;

  if (qword_10000C780 != -1) {
    dispatch_once(&qword_10000C780, &stru_1000082D8);
  }
  v0 = (void *)qword_10000C788;

  return v0;
}

void sub_100002540(id a1)
{
  qword_10000C788 = (uint64_t)os_log_create("com.apple.logd_reporter", "ReadStatistics");

  _objc_release_x1();
}

id sub_100002B64(void *a1, uint64_t a2)
{
  v2 = [a1 objectForKeyedSubscript:a2];
  if (v2)
  {
    objc_opt_class();
    sub_100002C64(v2);
    id v3 = (id)objc_claimAutoreleasedReturnValue();

    if (v3) {
      id v3 = v2;
    }
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

id sub_100002BE4(void *a1, uint64_t a2)
{
  v2 = [a1 objectForKeyedSubscript:a2];
  if (v2)
  {
    objc_opt_class();
    sub_100002C64(v2);
    id v3 = (id)objc_claimAutoreleasedReturnValue();

    if (v3) {
      id v3 = v2;
    }
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

id sub_100002C64(void *a1)
{
  id v1 = a1;
  if (objc_opt_isKindOfClass()) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

void start()
{
}

size_t sub_100003634()
{
  bzero(v4, 0x400uLL);
  if (!_set_user_dir_suffix() || (size_t result = confstr(65537, v4, 0x400uLL)) == 0)
  {
    id v1 = sub_1000048A4();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    {
      int v2 = *__error();
      v3[0] = 67109120;
      v3[1] = v2;
      _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "failed to initialize temporary directory: %{darwin.errno}d", (uint8_t *)v3, 8u);
    }

    exit(1);
  }
  return result;
}

void sub_100003714(id a1, OS_xpc_object *a2)
{
  int v2 = a2;
  id v3 = (void *)os_transaction_create();
  xpc_activity_state_t state = xpc_activity_get_state(v2);
  if (state != 2)
  {
    xpc_activity_state_t v5 = state;
    if (state)
    {
      v6 = sub_1000048A4();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf[0]) = 134217984;
        *(void *)((char *)buf + 4) = v5;
        v7 = "Encountered unexpected activity state: %ld";
        v8 = v6;
        uint32_t v9 = 12;
        goto LABEL_14;
      }
    }
    else
    {
      v6 = sub_1000048A4();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        v7 = "Checking in for: \"com.apple.logd_reporter.report_statistics\"";
LABEL_5:
        v8 = v6;
        uint32_t v9 = 2;
LABEL_14:
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)buf, v9);
        goto LABEL_86;
      }
    }
    goto LABEL_86;
  }
  v10 = sub_1000048A4();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Activity eligible to run", (uint8_t *)buf, 2u);
  }

  v11 = v2;
  if (!xpc_activity_should_defer(v11))
  {

LABEL_16:
    v13 = sub_1000048A4();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Statistics report requested", (uint8_t *)buf, 2u);
    }

    v14 = sub_10000493C();
    if (os_signpost_enabled(v14))
    {
      LOWORD(buf[0]) = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ReportingStatisticsDirectory", "Reporting from statistics directory", (uint8_t *)buf, 2u);
    }

    time_t v15 = time(0);
    v16 = [[StatisticsParser alloc] initWithUnixTimeBoundFrom:v15 - 86400 to:v15];
    v149 = (char *)0xAAAAAAAAAAAAAAAALL;
    v150 = (char *)0xAAAAAAAAAAAAAAAALL;
    v17 = (const char *)_os_trace_persistdir_path();
    asprintf(&v150, "%s/%s", v17, "logdata.statistics.0.jsonl");
    int v18 = *__error();
    v19 = (const char *)_os_trace_persistdir_path();
    asprintf(&v149, "%s/%s", v19, "logdata.statistics.1.jsonl");
    int v20 = *__error();
    if (v150 && v149)
    {
      v130 = v3;
      v131 = v2;
      sub_1000049D4((uint64_t)v149, v16);
      sub_1000049D4((uint64_t)v150, v16);
      v138 = v16;
      for (uint64_t i = 0; i != 5; ++i)
      {
        v22 = objc_opt_new();
        v23 = [(StatisticsParser *)v138 topEmitters];
        v24 = [v23 objectAtIndexedSubscript:i];

        v25 = [(StatisticsParser *)v138 totalBytes];
        v26 = [v25 objectAtIndexedSubscript:i];

        unint64_t v27 = (unint64_t)[v26 unsignedLongLongValue];
        CFStringRef v155 = @"elapsedSeconds";
        unint64_t v28 = v27 / 0x15180;
        v29 = +[NSNumber numberWithLong:86400];
        v158 = v29;
        uint64_t v159 = (uint64_t)v26;
        v140 = v26;
        CFStringRef v156 = @"totalPayloadBytes";
        CFStringRef v157 = @"bytesPerSecond";
        v30 = +[NSNumber numberWithUnsignedLongLong:v28];
        v160 = v30;
        v31 = +[NSDictionary dictionaryWithObjects:&v158 forKeys:&v155 count:3];
        v142 = v22;
        [v22 addEntriesFromDictionary:v31];

        v32 = [v24 keysSortedByValueUsingComparator:&stru_1000083B8];
        long long v162 = 0u;
        long long v163 = 0u;
        long long v164 = 0u;
        long long v165 = 0u;
        id obj = v32;
        id v33 = [v32 countByEnumeratingWithState:&v162 objects:buf count:16];
        if (v33)
        {
          id v34 = v33;
          uint64_t v35 = 0;
          uint64_t v36 = *(void *)v163;
LABEL_25:
          uint64_t v37 = 0;
          while (1)
          {
            if (*(void *)v163 != v36) {
              objc_enumerationMutation(obj);
            }
            uint64_t v38 = *(void *)(*((void *)&v162 + 1) + 8 * v37);
            v153[0] = @"book";
            v39 = +[NSNumber numberWithUnsignedLong:i];
            v154[0] = v39;
            v154[1] = v38;
            v153[1] = @"ProcessName";
            v153[2] = @"PayloadBytes";
            v40 = [v24 objectForKeyedSubscript:v38];
            v154[2] = v40;
            v41 = +[NSDictionary dictionaryWithObjects:v154 forKeys:v153 count:3];
            AnalyticsSendEvent();

            if (v35 + v37 == 29) {
              break;
            }
            if (v34 == (id)++v37)
            {
              v35 += v37;
              id v34 = [obj countByEnumeratingWithState:&v162 objects:buf count:16];
              if (v34) {
                goto LABEL_25;
              }
              break;
            }
          }
        }
        CFStringRef v151 = @"book";
        v42 = +[NSNumber numberWithUnsignedLong:i];
        v152 = v42;
        v43 = +[NSDictionary dictionaryWithObjects:&v152 forKeys:&v151 count:1];
        [v142 addEntriesFromDictionary:v43];

        AnalyticsSendEvent();
      }

      v44 = v138;
      v45 = [(StatisticsParser *)v44 snapshotClients];
      v46 = [v45 keysSortedByValueUsingComparator:&stru_1000083D8];

      long long v164 = 0u;
      long long v165 = 0u;
      long long v162 = 0u;
      long long v163 = 0u;
      id v47 = v46;
      id v48 = [v47 countByEnumeratingWithState:&v162 objects:buf count:16];
      if (v48)
      {
        id v49 = v48;
        uint64_t v50 = 0;
        uint64_t v51 = *(void *)v163;
LABEL_34:
        uint64_t v52 = 0;
        while (1)
        {
          if (*(void *)v163 != v51) {
            objc_enumerationMutation(v47);
          }
          v158 = *(void **)(*((void *)&v162 + 1) + 8 * v52);
          v53 = v158;
          CFStringRef v155 = @"snapshotClientName";
          CFStringRef v156 = @"snapshotCount";
          v54 = [(StatisticsParser *)v44 snapshotClients];
          v55 = [v54 objectForKeyedSubscript:v53];
          uint64_t v159 = (uint64_t)v55;
          v56 = +[NSDictionary dictionaryWithObjects:&v158 forKeys:&v155 count:2];
          AnalyticsSendEvent();

          if (v50 + v52 == 4) {
            break;
          }
          if (v49 == (id)++v52)
          {
            v50 += v52;
            id v49 = [v47 countByEnumeratingWithState:&v162 objects:buf count:16];
            if (v49) {
              goto LABEL_34;
            }
            break;
          }
        }
      }

      v6 = v44;
      long long v162 = 0u;
      long long v163 = 0u;
      long long v164 = 0u;
      long long v165 = 0u;
      v57 = [v6 quarantinedClients];
      v58 = [v57 allKeys];

      id obja = v58;
      id v59 = [v58 countByEnumeratingWithState:&v162 objects:buf count:16];
      if (v59)
      {
        id v60 = v59;
        uint64_t v61 = *(void *)v163;
        do
        {
          for (j = 0; j != v60; j = (char *)j + 1)
          {
            if (*(void *)v163 != v61) {
              objc_enumerationMutation(obja);
            }
            v63 = *(void **)(*((void *)&v162 + 1) + 8 * (void)j);
            v64 = objc_opt_new();
            v65 = [v6 quarantinedClients];
            v66 = [v65 objectForKeyedSubscript:v63];
            v67 = [v66 objectForKeyedSubscript:@"quarantineCount"];

            CFStringRef v155 = @"ProcessName";
            CFStringRef v156 = @"quarantineCount";
            v158 = v63;
            uint64_t v159 = (uint64_t)v67;
            v68 = +[NSDictionary dictionaryWithObjects:&v158 forKeys:&v155 count:2];
            [v64 addEntriesFromDictionary:v68];

            AnalyticsSendEvent();
          }
          id v60 = [obja countByEnumeratingWithState:&v162 objects:buf count:16];
        }
        while (v60);
      }

      id v3 = v130;
      int v2 = v131;
      if (_os_trace_is_development_build() && &_DRSubmitLog)
      {
        v69 = v6;
        if (_os_feature_enabled_impl())
        {
          v132 = sub_100004CA0();
          if (v132)
          {
            v126 = v6;
            long long v164 = 0u;
            long long v165 = 0u;
            long long v162 = 0u;
            long long v163 = 0u;
            v70 = [v69 quarantinedClients];
            v71 = [v70 allKeys];

            id v135 = v71;
            id v143 = [v71 countByEnumeratingWithState:&v162 objects:buf count:16];
            if (v143)
            {
              uint64_t v128 = 0;
              uint64_t v141 = *(void *)v163;
              v133 = v69;
              do
              {
                v72 = 0;
                v129 = (void *)(4 - v128);
                v128 += (uint64_t)v143;
                do
                {
                  if (*(void *)v163 != v141) {
                    objc_enumerationMutation(v135);
                  }
                  uint64_t v73 = *(void *)(*((void *)&v162 + 1) + 8 * (void)v72);
                  v74 = [v69 quarantinedClients];
                  v75 = [v74 objectForKeyedSubscript:v73];
                  id v76 = [v75 mutableCopy];

                  v77 = [v76 objectForKeyedSubscript:@"fileName"];
                  uint64_t v78 = +[NSPredicate predicateWithFormat:@"process == %@", v73];
                  id v79 = objc_alloc((Class)NSDateInterval);
                  v80 = +[NSDate distantPast];
                  v81 = (void *)v78;
                  v82 = +[NSDate date];
                  id v83 = [v79 initWithStartDate:v80 endDate:v82];

                  CFStringRef v155 = v77;
                  v84 = +[NSArray arrayWithObjects:&v155 count:1];
                  v85 = sub_100004DB8(v84, v81, v83);

                  if (v85 && [v85 eventCount])
                  {
                    v139 = v81;
                    v86 = [v83 endDate];
                    uint64_t v87 = sub_100005038(v86);

                    v136 = [v85 aggregationsForTier:5];
                    v88 = [v136 sortedArrayUsingComparator:&stru_100008418];
                    v89 = [v88 firstObject];
                    v90 = [v89 label];

                    v137 = (void *)v87;
                    if (v90)
                    {
                      v91 = [(__CFString *)v77 pathComponents];
                      v92 = [v91 objectAtIndexedSubscript:0];
                      [v76 setObject:v92 forKey:@"book"];

                      [v76 setObject:v73 forKey:@"process"];
                      [v76 setObject:v90 forKey:@"subsystem"];
                      uint64_t v93 = +[NSString stringWithFormat:@"quarantine_report_%@_%@.json", v73, v87];
                      v158 = v132;
                      uint64_t v159 = v93;
                      v134 = (void *)v93;
                      v94 = +[NSArray arrayWithObjects:&v158 count:2];
                      v95 = +[NSString pathWithComponents:v94];

                      if (sub_1000050D8(v85, v95))
                      {
                        v96 = +[NSString stringWithFormat:@"Quarantined %@ with top subsystem %@", v73, v90];
                        sub_100005208(@"Quarantine", v96, v76, v95);
                        int v97 = 2 * (v129 == v72);
                      }
                      else
                      {
                        int v97 = 3;
                      }
                      v69 = v133;
                      v98 = objb;
                    }
                    else
                    {
                      int v97 = 3;
                      v69 = v133;
                      v98 = objb;
                    }

                    if (v97 != 3 && v97) {
                      goto LABEL_69;
                    }
                  }
                  else
                  {
                  }
                  v72 = (char *)v72 + 1;
                }
                while (v143 != v72);
                id v143 = [v135 countByEnumeratingWithState:&v162 objects:buf count:16];
              }
              while (v143);
            }
LABEL_69:

            id v3 = v130;
            int v2 = v131;
            v6 = v126;
          }
        }
        if (_os_feature_enabled_impl())
        {
          v99 = sub_100004CA0();
          if (v99)
          {
            v127 = v6;
            uint32_t v101 = arc4random_uniform(0x90u);
            v102 = +[NSDate date];
            v103 = [v102 dateByAddingTimeInterval:(double)(int)(-600 * v101)];

            id v104 = [objc_alloc((Class)NSDateInterval) initWithStartDate:v103 duration:600.0];
            v105 = sub_100004DB8(0, 0, v104);
            v106 = [v104 endDate];
            v107 = sub_100005038(v106);

            v108 = +[NSString stringWithFormat:@"logging_sample_%@.json", v107];
            *(void *)&buf[0] = v99;
            *((void *)&buf[0] + 1) = v108;
            v109 = +[NSArray arrayWithObjects:buf count:2];
            v110 = +[NSString pathWithComponents:v109];

            if (sub_1000050D8(v105, v110))
            {
              id v111 = v105;
              id objc = v105;
              id v112 = v104;
              v113 = +[NSMutableDictionary dictionary];
              [v112 startDate];
              v114 = v144 = v108;
              v115 = sub_100005038(v114);
              [v113 setValue:v115 forKey:@"start_time"];

              v116 = [v112 endDate];

              v117 = sub_100005038(v116);
              [v113 setValue:v117 forKey:@"end_time"];

              [v113 setValue:&off_100008A98 forKey:@"interval_size"];
              v118 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v111 eventCount]);
              [v113 setValue:v118 forKey:@"total_count"];

              id v119 = [v111 eventBytes];
              v120 = +[NSNumber numberWithUnsignedLongLong:v119];
              [v113 setValue:v120 forKey:@"total_bytes"];

              id v121 = [v113 copy];
              v122 = +[NSString stringWithFormat:@"Logging sample from %@", v107];
              sub_100005208(@"LoggingSample", v122, v121, v110);

              v105 = objc;
              v108 = v144;
            }

            id v3 = v130;
            int v2 = v131;
            v6 = v127;
          }
        }
      }
      v123 = sub_10000493C();
      if (os_signpost_enabled(v123))
      {
        LOWORD(buf[0]) = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v123, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ReportingStatisticsDirectory", "Success!", (uint8_t *)buf, 2u);
      }

      free(v150);
      free(v149);
    }
    else
    {
      v124 = sub_1000048A4();
      if (os_log_type_enabled(v124, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf[0]) = 67109376;
        DWORD1(buf[0]) = v18;
        WORD4(buf[0]) = 1024;
        *(_DWORD *)((char *)buf + 10) = v20;
        _os_log_error_impl((void *)&_mh_execute_header, v124, OS_LOG_TYPE_ERROR, "Unable to generate strings for paths to statistics files: %{darwin.errno}d and %{darwin.errno}d", (uint8_t *)buf, 0xEu);
      }

      free(v150);
      free(v149);
      v125 = sub_10000493C();
      if (os_signpost_enabled(v125))
      {
        LOWORD(buf[0]) = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v125, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ReportingStatisticsDirectory", "Encountered error", (uint8_t *)buf, 2u);
      }

      v6 = sub_1000048A4();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf[0]) = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Statistics report could not be generated", (uint8_t *)buf, 2u);
      }
    }
    goto LABEL_86;
  }
  BOOL v12 = xpc_activity_set_state(v11, 3);

  if (!v12) {
    goto LABEL_16;
  }
  v6 = sub_1000048A4();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    v7 = "Asked to defer immediately";
    goto LABEL_5;
  }
LABEL_86:

  xpc_transaction_exit_clean();
}

id sub_1000048A4()
{
  if (qword_10000C790 != -1) {
    dispatch_once(&qword_10000C790, &stru_100008358);
  }
  v0 = (void *)qword_10000C798;

  return v0;
}

void sub_1000048F8(id a1)
{
  qword_10000C798 = (uint64_t)os_log_create("com.apple.logd_reporter", "Main");

  _objc_release_x1();
}

id sub_10000493C()
{
  if (qword_10000C7A0 != -1) {
    dispatch_once(&qword_10000C7A0, &stru_100008378);
  }
  v0 = (void *)qword_10000C7A8;

  return v0;
}

void sub_100004990(id a1)
{
  qword_10000C7A8 = (uint64_t)os_log_create("com.apple.logd_reporter", "ReportStatistics");

  _objc_release_x1();
}

void sub_1000049D4(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = sub_10000493C();
  if (os_signpost_enabled(v4))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v23 = a1;
  }

  xpc_activity_state_t v5 = [LineReader alloc];
  v6 = +[NSString stringWithUTF8String:a1];
  v7 = [(LineReader *)v5 initWithFile:v6];

  uint64_t v9 = [(LineReader *)v7 nextLine];
  if (v9)
  {
    v11 = (void *)v9;
    char v12 = 0;
    int v13 = 1;
    *(void *)&long long v10 = 136446978;
    long long v20 = v10;
    do
    {
      id v21 = 0;
      unsigned __int8 v14 = [v3 feedJSONLine:v11 error:&v21];
      id v15 = v21;
      if ((v14 & 1) == 0 && (v12 & 1) == 0)
      {
        v16 = sub_10000493C();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          id v17 = [v11 UTF8String];
          *(_DWORD *)buf = v20;
          uint64_t v23 = a1;
          __int16 v24 = 1024;
          int v25 = v13;
          __int16 v26 = 2082;
          id v27 = v17;
          __int16 v28 = 2114;
          id v29 = v15;
        }

        char v12 = 1;
      }

      v11 = [(LineReader *)v7 nextLine];
      ++v13;
    }
    while (v11);
    if (v12)
    {
      int v18 = sub_10000493C();
      if (os_signpost_enabled(v18))
      {
        *(_WORD *)buf = 0;
        v19 = "Encountered error";
LABEL_17:
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ReportingStatisticsFile", v19, buf, 2u);
        goto LABEL_18;
      }
      goto LABEL_18;
    }
  }
  else
  {
  }
  int v18 = sub_10000493C();
  if (os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    v19 = "Success!";
    goto LABEL_17;
  }
LABEL_18:
}

CFStringRef sub_100004CA0()
{
  v0 = +[NSFileManager defaultManager];
  id v7 = 0;
  CFStringRef v1 = @"/private/var/mobile/Library/Logs/com.apple.logd_reporter";
  unsigned __int8 v2 = [v0 createDirectoryAtPath:@"/private/var/mobile/Library/Logs/com.apple.logd_reporter" withIntermediateDirectories:1 attributes:0 error:&v7];
  id v3 = v7;

  if ((v2 & 1) == 0)
  {
    v4 = sub_10000493C();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = [v3 localizedDescription];
      *(_DWORD *)buf = 138412290;
      uint64_t v9 = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Error initialising output directory for quarantine reports: %@", buf, 0xCu);
    }
    CFStringRef v1 = 0;
  }

  return v1;
}

NSObject *sub_100004DB8(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = a1;
  id v23 = 0;
  id v8 = [objc_alloc((Class)OSLogStatistics) initWithLogArchivePath:0 forRelativePaths:v7 errorOut:&v23];

  id v9 = v23;
  if (v8)
  {
    long long v10 = [v6 startDate];
    v11 = [v6 endDate];
    id v22 = v9;
    char v12 = [v8 aggregationForStartDate:v10 endDate:v11 predicate:v5 withOptions:7 errorOut:&v22];
    id v13 = v22;

    if (v12)
    {
      unsigned __int8 v14 = v12;
      id v15 = v14;
    }
    else
    {
      v16 = sub_10000493C();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        long long v20 = [v5 description];
        id v21 = [v13 localizedDescription];
        *(_DWORD *)buf = 138412546;
        int v25 = v20;
        __int16 v26 = 2112;
        id v27 = v21;
        _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Error during aggregations of OSLogStatistics for predicate %@ : %@", buf, 0x16u);
      }
      unsigned __int8 v14 = 0;
      id v15 = 0;
    }
  }
  else
  {
    unsigned __int8 v14 = sub_10000493C();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v18 = [v5 description];
      v19 = [v9 localizedDescription];
      *(_DWORD *)buf = 138412546;
      int v25 = v18;
      __int16 v26 = 2112;
      id v27 = v19;
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Error during initialisation of OSLogStatistics for predicate %@: %@", buf, 0x16u);
    }
    id v15 = 0;
    id v13 = v9;
  }

  return v15;
}

id sub_100005038(void *a1)
{
  id v1 = a1;
  unsigned __int8 v2 = +[NSTimeZone defaultTimeZone];
  id v3 = objc_alloc_init((Class)NSDateFormatter);
  [v3 setTimeZone:v2];
  [v3 setDateFormat:@"yyyy-MM-dd-HHmm"];
  v4 = [v3 stringFromDate:v1];

  return v4;
}

id sub_1000050D8(void *a1, void *a2)
{
  id v3 = a2;
  v4 = [a1 jsonDescription:0];
  id v10 = 0;
  id v5 = [v4 writeToFile:v3 atomically:0 encoding:4 error:&v10];
  id v6 = v10;
  if ((v5 & 1) == 0)
  {
    id v7 = sub_10000493C();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v9 = [v6 localizedDescription];
      *(_DWORD *)buf = 138412546;
      id v12 = v3;
      __int16 v13 = 2112;
      unsigned __int8 v14 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Error writing aggregations at path %@: %@", buf, 0x16u);
    }
  }

  return v5;
}

void sub_100005208(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = a4;
  id v9 = a3;
  id v10 = a2;
  v11 = +[NSFileManager defaultManager];
  NSFileAttributeKey v29 = NSFileGroupOwnerAccountName;
  uint64_t v36 = @"_analyticsusers";
  id v12 = +[NSDictionary dictionaryWithObjects:&v36 forKeys:&v29 count:1];
  id v28 = 0;
  unsigned __int8 v13 = [v11 setAttributes:v12 ofItemAtPath:v8 error:&v28];
  id v14 = v28;

  if ((v13 & 1) == 0)
  {
    id v15 = sub_10000493C();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      __int16 v26 = [v14 localizedDescription];
      *(_DWORD *)buf = 138412290;
      v31 = v26;
      _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "setAttributes: %@", buf, 0xCu);
    }
  }

  char v16 = DRSubmitLog();
  id v17 = 0;
  if ((v16 & 1) == 0)
  {
    int v18 = sub_10000493C();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v27 = [v17 localizedDescription];
      *(_DWORD *)buf = 138412546;
      v31 = v7;
      __int16 v32 = 2112;
      uint64_t v33 = (uint64_t)v27;
      _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Error during submission of %@ report : %@", buf, 0x16u);
    }
  }
  id v19 = v8;
  long long v20 = (const char *)[v19 fileSystemRepresentation];
  uint64_t v36 = 65540;
  int v21 = fsctl(v20, 0xC0084A44uLL, &v36, 0);
  id v22 = sub_10000493C();
  id v23 = v22;
  if (v21)
  {
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      __int16 v24 = __error();
      int v25 = strerror(*v24);
      *(_DWORD *)buf = 136315650;
      v31 = v20;
      __int16 v32 = 2080;
      uint64_t v33 = (uint64_t)v25;
      __int16 v34 = 2048;
      uint64_t v35 = v36;
      _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Failed to mark %s as purgeable %s (flags 0x%llx)\n", buf, 0x20u);
    }
  }
  else if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v31 = v20;
    __int16 v32 = 2048;
    uint64_t v33 = v36;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Marked %s purgeable with flags 0x%llx\n", buf, 0x16u);
  }
}

int64_t sub_100005564(id a1, OSLogStatisticsAggregation *a2, OSLogStatisticsAggregation *a3)
{
  v4 = a2;
  id v5 = a3;
  id v6 = [(OSLogStatisticsAggregation *)v4 eventBytes];
  if (v6 <= [(OSLogStatisticsAggregation *)v5 eventBytes])
  {
    id v8 = [(OSLogStatisticsAggregation *)v4 eventBytes];
    int64_t v7 = v8 != [(OSLogStatisticsAggregation *)v5 eventBytes];
  }
  else
  {
    int64_t v7 = -1;
  }

  return v7;
}

int64_t sub_1000055E8(id a1, id a2, id a3)
{
  return (int64_t)[a3 compare:a2];
}

int64_t sub_1000055F4(id a1, id a2, id a3)
{
  return (int64_t)[a3 compare:a2];
}

uint64_t AnalyticsSendEvent()
{
  return _AnalyticsSendEvent();
}

uint64_t DRSubmitLog()
{
  return _DRSubmitLog();
}

int *__error(void)
{
  return ___error();
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
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

uint64_t _os_trace_is_development_build()
{
  return __os_trace_is_development_build();
}

uint64_t _os_trace_persistdir_path()
{
  return __os_trace_persistdir_path();
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return _arc4random_uniform(__upper_bound);
}

int asprintf(char **a1, const char *a2, ...)
{
  return _asprintf(a1, a2);
}

void bzero(void *a1, size_t a2)
{
}

size_t confstr(int a1, char *a2, size_t a3)
{
  return _confstr(a1, a2, a3);
}

void dispatch_main(void)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void exit(int a1)
{
}

void free(void *a1)
{
}

int fsctl(const char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  return _fsctl(a1, a2, a3, a4);
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

BOOL os_signpost_enabled(os_log_t log)
{
  return _os_signpost_enabled(log);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

time_t time(time_t *a1)
{
  return _time(a1);
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

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__readNextChunk(void *a1, const char *a2, ...)
{
  return [a1 _readNextChunk];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_closeFile(void *a1, const char *a2, ...)
{
  return [a1 closeFile];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
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

id objc_msgSend_defaultTimeZone(void *a1, const char *a2, ...)
{
  return [a1 defaultTimeZone];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_distantPast(void *a1, const char *a2, ...)
{
  return [a1 distantPast];
}

id objc_msgSend_endDate(void *a1, const char *a2, ...)
{
  return [a1 endDate];
}

id objc_msgSend_eventBytes(void *a1, const char *a2, ...)
{
  return [a1 eventBytes];
}

id objc_msgSend_eventCount(void *a1, const char *a2, ...)
{
  return [a1 eventCount];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return [a1 label];
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

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_nextLine(void *a1, const char *a2, ...)
{
  return [a1 nextLine];
}

id objc_msgSend_pathComponents(void *a1, const char *a2, ...)
{
  return [a1 pathComponents];
}

id objc_msgSend_quarantinedClients(void *a1, const char *a2, ...)
{
  return [a1 quarantinedClients];
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return [a1 removeLastObject];
}

id objc_msgSend_snapshotClients(void *a1, const char *a2, ...)
{
  return [a1 snapshotClients];
}

id objc_msgSend_startDate(void *a1, const char *a2, ...)
{
  return [a1 startDate];
}

id objc_msgSend_topEmitters(void *a1, const char *a2, ...)
{
  return [a1 topEmitters];
}

id objc_msgSend_totalBytes(void *a1, const char *a2, ...)
{
  return [a1 totalBytes];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongValue];
}

id objc_msgSend_writeToFile_atomically_encoding_error_(void *a1, const char *a2, ...)
{
  return [a1 writeToFile:x0 atomically:x1 encoding:x2 error:x3];
}