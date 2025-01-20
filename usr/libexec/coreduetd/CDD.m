@interface CDD
+ (CDD)sharedInstance;
- (BOOL)classCLocked;
- (BOOL)isClassCLocked;
- (BOOL)isLocked;
- (BOOL)passcodeLocked;
- (BOOL)readConfigParamsFromPlist;
- (BOOL)saveForecast:(id)a3 queryParameters:(id *)a4 deviceIdentifier:(id)a5 error:(id *)a6;
- (CDD)init;
- (CDDCommunicator)communicator;
- (CDDConfig)config;
- (CDDPrivacyMonitor)privacyMonitor;
- (CDDWatchUpdateController)watchUpdate;
- (id)computeDatabaseAge;
- (id)histogramOfCountsFromForecast:(id)a3;
- (id)knowledgeStore;
- (id)pmfOverHourOfDayWithParams:(id *)a3;
- (id)retrieveHistogram;
- (unint64_t)calculateActualStartEpoch:(unint64_t)a3 endepoch:(unint64_t)a4 recurrenceInterval:(unint64_t)a5;
- (void)classCAndPasscodeCheck;
- (void)dumpAll;
- (void)loadParamsFromDict:(id)a3 userDefaults:(id)a4;
- (void)saveRemoteInBedTimes:(id)a3;
- (void)setDatabaseAge:(id)a3;
- (void)setDefaultConfigParams;
- (void)setupCommunicator;
@end

@implementation CDD

+ (CDD)sharedInstance
{
  if (qword_100040F88 != -1) {
    dispatch_once(&qword_100040F88, &stru_100039358);
  }
  v2 = (void *)qword_100040F80;

  return (CDD *)v2;
}

- (CDD)init
{
  v3 = +[_CDLogging knowledgeSignpost];
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "CDDinit", " enableTelemetry=YES ", buf, 2u);
  }

  v23.receiver = self;
  v23.super_class = (Class)CDD;
  v4 = [(CDD *)&v23 init];
  if (v4)
  {
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.coreduetdLogQueue", v6);
    logQueue = v4->logQueue;
    v4->logQueue = (OS_dispatch_queue *)v7;

    v9 = objc_alloc_init(CDDConfig);
    config = v4->config;
    v4->config = v9;

    if (![(CDD *)v4 readConfigParamsFromPlist]) {
      [(CDD *)v4 setDefaultConfigParams];
    }
    if (objc_opt_class())
    {
      v11 = [[CDDCommunicator alloc] initWithCDDinstance:v4];
      p_super = &v4->communicator->super;
      v4->communicator = v11;
    }
    else
    {
      p_super = +[_CDLogging admissionCheckChannel];
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
        sub_1000230C8(p_super);
      }
    }

    [(CDD *)v4 classCAndPasscodeCheck];
    v13 = [[CDDPrivacyMonitor alloc] initWithCDDinstance:v4];
    privacyMonitor = v4->privacyMonitor;
    v4->privacyMonitor = v13;

    v15 = [[CDDWatchUpdateController alloc] initWithCDDinstance:v4];
    watchUpdate = v4->watchUpdate;
    v4->watchUpdate = v15;

    if (!v4->privacyMonitor)
    {
      v17 = +[_CDLogging admissionCheckChannel];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_100023084(v17);
      }
    }
    v18 = [(CDD *)v4 config];
    v19 = [(CDD *)v4 computeDatabaseAge];
    [v18 setAgeOfDatabase:v19];

    [(CDD *)v4 setupCommunicator];
    [(CDD *)v4 dumpAll];
  }
  v20 = +[_CDLogging admissionCheckChannel];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Done with CDD init.", buf, 2u);
  }

  v21 = +[_CDLogging knowledgeSignpost];
  if (os_signpost_enabled(v21))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v21, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "CDDinit", "", buf, 2u);
  }

  return v4;
}

- (void)classCAndPasscodeCheck
{
  if (!MKBDeviceFormattedForContentProtection())
  {
    v5 = +[_CDLogging admissionCheckChannel];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LOWORD(out_token[0]) = 0;
      v6 = "Device is not formatted for content protection. Not checking for Class C lock state.";
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, v6, (uint8_t *)out_token, 2u);
    }
LABEL_11:

    self->classCLocked = 0;
    goto LABEL_12;
  }
  if (![(CDD *)self isClassCLocked])
  {
    v5 = +[_CDLogging admissionCheckChannel];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LOWORD(out_token[0]) = 0;
      v6 = "Device is already Class-C-unlocked...";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  out_token[0] = 0;
  v3 = +[_CDLogging admissionCheckChannel];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Device is Class-C-locked. Setting handler for first unlock...", buf, 2u);
  }

  logQueue = self->logQueue;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10001F05C;
  handler[3] = &unk_100039380;
  handler[4] = self;
  int v11 = 0;
  notify_register_dispatch("com.apple.mobile.keybagd.first_unlock", out_token, logQueue, handler);
  self->classCLocked = [(CDD *)self isClassCLocked];
LABEL_12:
  out_token[0] = 0;
  dispatch_queue_t v7 = +[_CDLogging admissionCheckChannel];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Setting handler for lock status changes...", buf, 2u);
  }

  v8 = self->logQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10001F0EC;
  v9[3] = &unk_100038C60;
  v9[4] = self;
  notify_register_dispatch("com.apple.mobile.keybagd.lock_status", out_token, v8, v9);
  self->passcodeLocked = [(CDD *)self isLocked];
}

- (id)knowledgeStore
{
  v2 = +[CDKnowledgeDaemon defaultDaemon];
  v3 = [v2 storage];

  return v3;
}

- (void)setupCommunicator
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001F1F8;
  block[3] = &unk_100038A78;
  block[4] = self;
  if (qword_100040F90 != -1) {
    dispatch_once(&qword_100040F90, block);
  }
}

- (BOOL)isClassCLocked
{
  if (MKBDeviceUnlockedSinceBoot()) {
    return 0;
  }
  CFBooleanRef v3 = (CFBooleanRef)MGCopyAnswer();
  BOOL v2 = v3 == kCFBooleanTrue;
  if (v3)
  {
    CFRelease(v3);
  }
  else
  {
    v4 = +[_CDLogging admissionCheckChannel];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "No response from MobileGestalt.", v6, 2u);
    }
  }
  return v2;
}

- (BOOL)isLocked
{
  CFBooleanRef v2 = (const __CFBoolean *)MGCopyAnswer();
  CFBooleanRef v3 = v2;
  if (v2)
  {
    CFRelease(v2);
  }
  else
  {
    v4 = +[_CDLogging admissionCheckChannel];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "No response from MobileGestalt.", v6, 2u);
    }
  }
  return v3 == kCFBooleanTrue;
}

- (unint64_t)calculateActualStartEpoch:(unint64_t)a3 endepoch:(unint64_t)a4 recurrenceInterval:(unint64_t)a5
{
  v8 = [(CDD *)self config];
  v9 = [v8 ageOfDatabase];
  [v9 timeIntervalSinceReferenceDate];
  unint64_t v11 = (unint64_t)v10;

  if (v11 - a3 > 0x15180 && a4 > v11 && a4 > a3 && v11 >= a3)
  {
    if (a5) {
      unint64_t v15 = a5;
    }
    else {
      unint64_t v15 = 86400;
    }
    if ((a4 - v11) >> 7 > 0xD2E || (unint64_t v11 = a4 - 432000, a4 - 432000 >= a3)) {
      a3 += (v11 - a3) / v15 * v15;
    }
  }
  return a3;
}

- (id)pmfOverHourOfDayWithParams:(id *)a3
{
  unint64_t var3 = a3->var3;
  unint64_t var5 = a3->var5;
  if (!var5)
  {
    a3->unint64_t var5 = 86400;
    unint64_t var5 = 86400;
  }
  if (!a3->var6) {
    a3->unint64_t var6 = 86400;
  }
  unint64_t v7 = [(CDD *)self calculateActualStartEpoch:var3 endepoch:a3->var4 recurrenceInterval:var5];
  v8 = (void *)os_transaction_create();
  xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
  unint64_t v11 = v10;
  id v12 = 0;
  if (!a3->var13)
  {
    v116 = (unsigned char *)v7;
    v107 = v8;
    v108 = self;
    v109 = a3;
    xpc_object_t xdict = v10;
    v106 = v9;
    unint64_t var4 = a3->var4;
    unint64_t var7 = a3->var7;
    id v15 = objc_alloc_init((Class)NSMutableArray);
    id v16 = objc_alloc_init((Class)NSMutableArray);
    v17 = +[NSTimeZone systemTimeZone];
    v18 = +[NSNumber numberWithUnsignedLongLong:var3];
    [v18 doubleValue];
    uint64_t v19 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");

    v114 = v17;
    v105 = (void *)v19;
    v20 = (char *)[v17 secondsFromGMTForDate:v19] + var3;
    bzero(__b, 0x300uLL);
    for (uint64_t i = 0; i != 96; ++i)
    {
      id v22 = objc_alloc_init((Class)NSMutableSet);
      [v15 insertObject:v22 atIndex:i];

      id v23 = objc_alloc_init((Class)NSMutableSet);
      [v16 insertObject:v23 atIndex:i];
    }
    v115 = v15;
    v118 = v16;
    if (v109->var8 == 20499)
    {
      unint64_t v112 = (unint64_t)v20;
      v24 = v116;
      v25 = +[NSNumber numberWithUnsignedLongLong:v116];
      [v25 doubleValue];
      uint64_t v26 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");

      v27 = +[NSNumber numberWithUnsignedLongLong:var4];
      [v27 doubleValue];
      uint64_t v28 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");

      v102 = (void *)v28;
      v103 = (void *)v26;
      uint64_t v29 = +[_DKQuery predicateForEventsWithStartInDateRangeFrom:v26 to:v28];
      if (v109->var14 && v109->var2)
      {
        v30 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:");
        uint64_t v31 = +[_DKQuery predicateForEventsWithStringValue:v30];
      }
      else
      {
        v30 = +[_DKApplicationMetadataKey extensionHostIdentifier];
        v32 = +[_DKQuery predicateForObjectsWithMetadataKey:v30];
        uint64_t v31 = +[NSCompoundPredicate notPredicateWithSubpredicate:v32];
      }
      v100 = (void *)v31;
      v101 = (void *)v29;
      v132[0] = v29;
      v132[1] = v31;
      v33 = +[NSArray arrayWithObjects:v132 count:2];
      uint64_t v34 = +[NSCompoundPredicate andPredicateWithSubpredicates:v33];

      v35 = +[_DKSystemEventStreams appInFocusStream];
      v131 = v35;
      v36 = +[NSArray arrayWithObjects:&v131 count:1];
      v37 = +[NSSortDescriptor sortDescriptorWithKey:@"startDate" ascending:1];
      v130 = v37;
      v38 = +[NSArray arrayWithObjects:&v130 count:1];
      v99 = (void *)v34;
      v39 = +[_DKEventQuery eventQueryWithPredicate:v34 eventStreams:v36 offset:0 limit:var7 sortDescriptors:v38];

      v40 = +[NSString stringWithUTF8String:"CDD.m"];
      v41 = [v40 stringByAppendingFormat:@":%d", 498];
      [v39 setClientName:v41];

      [v39 setTracker:&stru_1000393C0];
      v42 = [(CDD *)v108 knowledgeStore];
      v98 = v39;
      v43 = [v42 executeQuery:v39 error:0];

      id value = [v43 count];
      if (v43)
      {
        long long v126 = 0u;
        long long v127 = 0u;
        long long v124 = 0u;
        long long v125 = 0u;
        v97 = v43;
        id obj = v43;
        id v44 = [obj countByEnumeratingWithState:&v124 objects:v129 count:16];
        if (v44)
        {
          id v45 = v44;
          unint64_t v113 = v112 % 0x15180;
          uint64_t v46 = *(void *)v125;
          do
          {
            for (j = 0; j != v45; j = (char *)j + 1)
            {
              if (*(void *)v125 != v46) {
                objc_enumerationMutation(obj);
              }
              v48 = *(void **)(*((void *)&v124 + 1) + 8 * (void)j);
              v49 = [v48 stringValue];

              if (v49)
              {
                v50 = [v48 startDate];
                id v51 = [v114 secondsFromGMTForDate:v50];
                v52 = [v48 startDate];
                [v52 timeIntervalSinceReferenceDate];
                v53 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
                unint64_t v54 = ((unint64_t)v51 + (unint64_t)[v53 integerValue]) % 0x15180;

                uint64_t v55 = v54 - v113;
                if (v54 < v113) {
                  uint64_t v55 = v54 - v113 + 86400;
                }
                unint64_t v56 = v55;
                v57 = [v48 startDate];
                [v57 timeIntervalSinceReferenceDate];
                v58 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
                unint64_t v59 = ((unsigned char *)[v58 unsignedIntegerValue] - v116) / 0x15180uLL;

                v60 = [v115 objectAtIndex:v56 / 0x384];
                v61 = [v118 objectAtIndex:v56 / 0x384];
                v62 = [v48 stringValue];
                [v60 addObject:v62];

                v63 = [v48 stringValue];
                v64 = +[NSString stringWithFormat:@"%s%03llu", "XQW90", v59];
                v65 = [v63 stringByAppendingString:v64];
                [v61 addObject:v65];
              }
            }
            id v45 = [obj countByEnumeratingWithState:&v124 objects:v129 count:16];
          }
          while (v45);
        }

        v24 = v116;
        v43 = v97;
      }
    }
    else
    {
      id value = 0;
      v24 = v116;
    }
    unint64_t v67 = v109->var5;
    unint64_t var6 = v109->var6;
    unint64_t v68 = v109->var4;
    v69 = v115;
    if (v67 == 86400 && var6 == 86400)
    {
      unint64_t v70 = (v68 - (unint64_t)v24) / 0x15180;
      if (!((v68 - (unint64_t)v24) % 0x15180))
      {
        uint64_t v77 = 0;
        int64x2_t v78 = vdupq_n_s64(v70);
        do
        {
          *(int64x2_t *)&__b[v77] = v78;
          v77 += 2;
        }
        while (v77 != 96);
LABEL_50:
        for (uint64_t k = 0; k != 96; ++k)
        {
          xpc_object_t v80 = xpc_dictionary_create(0, 0, 0);
          long long v120 = 0u;
          long long v121 = 0u;
          long long v122 = 0u;
          long long v123 = 0u;
          id v117 = [v69 objectAtIndex:k];
          id v81 = [v117 countByEnumeratingWithState:&v120 objects:v128 count:16];
          if (v81)
          {
            id v82 = v81;
            uint64_t v83 = *(void *)v121;
            do
            {
              for (m = 0; m != v82; m = (char *)m + 1)
              {
                if (*(void *)v121 != v83) {
                  objc_enumerationMutation(v117);
                }
                v85 = *(void **)(*((void *)&v120 + 1) + 8 * (void)m);
                v86 = [v118 objectAtIndex:k];
                v119[0] = _NSConcreteStackBlock;
                v119[1] = 3221225472;
                v119[2] = sub_10001FF50;
                v119[3] = &unk_1000393E8;
                v119[4] = v85;
                v87 = [v86 objectsPassingTest:v119];
                id v88 = [v87 count];

                unint64_t v89 = __b[k];
                v90 = (const char *)[v85 UTF8String];
                if (v89) {
                  double v91 = (double)(unint64_t)v88 / (double)v89;
                }
                else {
                  double v91 = 0.0;
                }
                xpc_dictionary_set_double(v80, v90, v91);
              }
              id v82 = [v117 countByEnumeratingWithState:&v120 objects:v128 count:16];
            }
            while (v82);
          }

          xpc_dictionary_set_value(xdict, off_100039408[k], v80);
          v69 = v115;
        }
        unint64_t v11 = xdict;
        xpc_dictionary_set_uint64(xdict, "itemsInForecast", (uint64_t)value);
        v92 = [(CDD *)v108 config];
        v93 = [v92 ageOfDatabase];
        [v93 timeIntervalSinceReferenceDate];
        uint64_t v95 = (unint64_t)v94;

        xpc_dictionary_set_uint64(xdict, "databaseEpochSeconds", v95);
        id v12 = xdict;

        v9 = v106;
        v8 = v107;
        goto LABEL_63;
      }
      if (v68 == -1025)
      {
        memset_pattern16(__b, &unk_100031E20, 0x300uLL);
        goto LABEL_50;
      }
    }
    if (v68 > (unint64_t)v24)
    {
      int v71 = 0;
      unint64_t v72 = (unint64_t)&v24[var6];
      if (v67 > var6) {
        unint64_t var6 = v109->var5;
      }
      v73 = v24;
      do
      {
        ++__b[v71];
        BOOL v74 = (unint64_t)(v24 + 900) >= v72;
        v75 = &v73[var6];
        if ((unint64_t)(v24 + 900) < v72)
        {
          v24 += 900;
        }
        else
        {
          v73 += var6;
          v24 = v75;
        }
        if (v74) {
          v72 += var6;
        }
        if (v74) {
          int v76 = var6 / 0x384;
        }
        else {
          int v76 = 1;
        }
        int v71 = (v76 + v71) % 96;
      }
      while ((unint64_t)v24 < v68);
    }
    goto LABEL_50;
  }
LABEL_63:

  return v12;
}

- (void)saveRemoteInBedTimes:(id)a3
{
  id v4 = a3;
  if ([v4 count] == (id)2)
  {
    v5 = +[_DKSystemEventStreams remoteDeviceInBedTimesStream];
    v6 = [v4 firstObject];
    unint64_t v7 = [v4 lastObject];
    v8 = +[_DKEvent eventWithStream:v5 startDate:v6 endDate:v7 categoryIntegerValue:1 metadata:0];

    v9 = [(CDD *)self knowledgeStore];
    v18 = v8;
    xpc_object_t v10 = +[NSArray arrayWithObjects:&v18 count:1];
    id v13 = 0;
    LODWORD(v7) = [v9 saveObjects:v10 error:&v13];
    id v11 = v13;

    if (!v7 || v11)
    {
      id v12 = +[_CDLogging admissionCheckChannel];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v15 = v8;
        __int16 v16 = 2112;
        id v17 = v11;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Unable to save event: %@, Error: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    v8 = +[_CDLogging admissionCheckChannel];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Not enough dates for expected in bed times", buf, 2u);
    }
  }
}

- (id)histogramOfCountsFromForecast:(id)a3
{
  id v3 = a3;
  +[NSMutableDictionary dictionary];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100020324;
  v8[3] = &unk_100039738;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = v4;
  [v3 enumerateKeysAndObjectsUsingBlock:v8];

  v5 = +[_CDLogging communicatorChannel];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Counts are: %@", buf, 0xCu);
  }

  id v6 = [v4 copy];

  return v6;
}

- (id)retrieveHistogram
{
  id v3 = objc_alloc((Class)NSDateInterval);
  id v4 = +[NSDate distantPast];
  v5 = +[NSDate distantFuture];
  id v6 = [v3 initWithStartDate:v4 endDate:v5];

  unint64_t v7 = +[_DKSystemEventStreams pairedDeviceForecastStream];
  v8 = +[NSPredicate predicateWithValue:1];
  id v9 = +[_DKHistogramQuery histogramQueryForStream:v7 interval:v6 withPredicate:v8];

  [v9 setIncludeLocalResults:0];
  [v9 setIncludeRemoteResults:1];
  [v9 setRemoteHistogramLimit:1];
  xpc_object_t v10 = +[_CDLogging communicatorChannel];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    id v15 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Query is: %@", (uint8_t *)&v14, 0xCu);
  }

  id v11 = [(CDD *)self knowledgeStore];
  id v12 = [v11 executeQuery:v9 error:0];

  return v12;
}

- (BOOL)saveForecast:(id)a3 queryParameters:(id *)a4 deviceIdentifier:(id)a5 error:(id *)a6
{
  id v7 = a3;
  v8 = (void *)os_transaction_create();
  id v9 = [(CDD *)self histogramOfCountsFromForecast:v7];

  id v10 = [objc_alloc((Class)_DKHistogram) initWithHistogram:v9];
  id v11 = +[_DKSystemEventStreams pairedDeviceForecastStream];
  [v10 setStream:v11];

  id v12 = +[NSDate date];
  id v13 = objc_alloc((Class)NSDateInterval);
  int v14 = [v12 dateByAddingTimeInterval:-86400.0];
  id v15 = [v13 initWithStartDate:v14 endDate:v12];
  [v10 setInterval:v15];

  __int16 v16 = [(CDD *)self retrieveHistogram];
  id v17 = +[_CDLogging admissionCheckChannel];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v30 = v16;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Retrieved histogram: %@", buf, 0xCu);
  }

  v18 = +[_CDLogging communicatorChannel];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v30 = v10;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Replacing with: %@", buf, 0xCu);
  }

  uint64_t v19 = +[CDKnowledgeDaemon defaultDaemon];
  v20 = [v19 storage];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10002087C;
  v25[3] = &unk_100039760;
  id v26 = v8;
  id v27 = v10;
  id v28 = v16;
  id v21 = v16;
  id v22 = v10;
  id v23 = v8;
  [v20 saveHistogram:v22 responseQueue:0 withCompletion:v25];

  return 1;
}

- (id)computeDatabaseAge
{
  id v3 = (void *)os_transaction_create();
  v5 = +[NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:1];
  id v6 = +[_DKSystemEventStreams deviceBatteryPercentageStream];
  id v23 = v6;
  id v7 = +[NSArray arrayWithObjects:&v23 count:1];
  id v22 = v5;
  v8 = +[NSArray arrayWithObjects:&v22 count:1];
  id v9 = +[_DKEventQuery eventQueryWithPredicate:0 eventStreams:v7 offset:0 limit:1 sortDescriptors:v8];

  id v10 = +[NSString stringWithUTF8String:"CDD.m"];
  id v11 = [v10 stringByAppendingFormat:@":%d", 710];
  [v9 setClientName:v11];

  [v9 setTracker:&stru_100039780];
  id v12 = [(CDD *)self knowledgeStore];
  id v21 = 0;
  id v13 = [v12 executeQuery:v9 error:&v21];
  id v14 = v21;

  if (v14
    || ([v13 firstObject],
        id v15 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v15,
        (isKindOfClass & 1) == 0))
  {
    uint64_t v19 = +[_CDLogging admissionCheckChannel];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_100023184((uint64_t)v14, v13, v19);
    }

    v18 = +[NSDate date];
  }
  else
  {
    id v17 = [v13 firstObject];
    v18 = [v17 startDate];
  }

  return v18;
}

- (void)setDatabaseAge:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(CDD *)self config];
    [v5 setAgeOfDatabase:v4];
  }
}

- (void)dumpAll
{
  id v3 = +[_CDLogging admissionCheckChannel];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LOWORD(v22) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "--------------", (uint8_t *)&v22, 2u);
  }

  id v4 = +[_CDLogging admissionCheckChannel];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    LOWORD(v22) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "coreduetd: Dump.", (uint8_t *)&v22, 2u);
  }

  id v5 = +[_CDLogging admissionCheckChannel];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LOWORD(v22) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "", (uint8_t *)&v22, 2u);
  }

  id v6 = +[_CDLogging admissionCheckChannel];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    LOWORD(v22) = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "\tCurrent config parameters:", (uint8_t *)&v22, 2u);
  }

  id v7 = +[_CDLogging admissionCheckChannel];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = [(CDD *)self config];
    unsigned int v9 = [v8 verbose];
    int v22 = 67109120;
    unsigned int v23 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "\t\tverbose: %d", (uint8_t *)&v22, 8u);
  }
  id v10 = +[_CDLogging admissionCheckChannel];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    LOWORD(v22) = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "", (uint8_t *)&v22, 2u);
  }

  id v11 = +[_CDLogging admissionCheckChannel];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    LOWORD(v22) = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "\tCurrent CDDCommunicator parameters:", (uint8_t *)&v22, 2u);
  }

  id v12 = +[_CDLogging admissionCheckChannel];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    id v13 = [(CDD *)self config];
    unsigned int v14 = [v13 commEnabled];
    int v22 = 67109120;
    unsigned int v23 = v14;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "\t\tcommEnabled: %d\n", (uint8_t *)&v22, 8u);
  }
  id v15 = +[_CDLogging admissionCheckChannel];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    __int16 v16 = [(CDD *)self config];
    unsigned int v17 = [v16 commMinClientGranularity];
    int v22 = 67109120;
    unsigned int v23 = v17;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "\t\tcommMinClientGranularity: %d\n", (uint8_t *)&v22, 8u);
  }
  v18 = +[_CDLogging admissionCheckChannel];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    uint64_t v19 = [(CDD *)self config];
    unsigned int v20 = [v19 commSyncBoundarySeconds];
    int v22 = 67109120;
    unsigned int v23 = v20;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "\t\tcommSyncBoundarySeconds: %d\n", (uint8_t *)&v22, 8u);
  }
  id v21 = +[_CDLogging admissionCheckChannel];
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    LOWORD(v22) = 0;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "--------------", (uint8_t *)&v22, 2u);
  }
}

- (BOOL)readConfigParamsFromPlist
{
  id v3 = +[CDDPaths CDDConfigurationBundlePath];
  id v4 = +[NSBundle bundleWithPath:v3];

  if ((v4
     || (+[CDDPaths CDDConfigurationBundlePathDefault],
         id v5 = objc_claimAutoreleasedReturnValue(),
         +[NSBundle bundleWithPath:v5],
         id v4 = objc_claimAutoreleasedReturnValue(),
         v5,
         v4))
    && ([v4 objectForInfoDictionaryKey:@"CoreDuetDaemonConfigKeyString"],
        (uint64_t v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v7 = (void *)v6;
    id v8 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.CoreDuet"];
    [(CDD *)self loadParamsFromDict:v7 userDefaults:v8];

    BOOL v9 = 1;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)setDefaultConfigParams
{
  id v3 = [(CDD *)self config];
  [v3 setVerbose:0];

  id v4 = [(CDD *)self config];
  [v4 setBatteryMonitorExchangeTimerDelta:900];

  id v5 = [(CDD *)self config];
  [v5 setBatteryMonitorExchangeBattDelta:1];

  uint64_t v6 = [(CDD *)self config];
  [v6 setCommEnabled:0];

  id v7 = [(CDD *)self config];
  [v7 setCommMinClientGranularity:900];

  id v8 = [(CDD *)self config];
  [v8 setCommSyncBoundarySeconds:86400];

  id v10 = [(CDD *)self config];
  BOOL v9 = +[NSDate date];
  [v10 setAgeOfDatabase:v9];
}

- (void)loadParamsFromDict:(id)a3 userDefaults:(id)a4
{
  id v23 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v6
    && ([v6 objectForKey:@"CDDVerboseKeyString"],
        id v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v8))
  {
    id v9 = [v7 BOOLForKey:@"CDDVerboseKeyString"];
    id v10 = [(CDD *)self config];
    [v10 setVerbose:v9];
  }
  else
  {
    uint64_t v11 = [v23 valueForKey:@"CDDVerboseKeyString"];
    if (!v11) {
      goto LABEL_7;
    }
    id v10 = (void *)v11;
    id v12 = [(CDD *)self config];
    [v12 setVerbose:[v10 BOOLValue]];
  }
LABEL_7:
  id v13 = [v23 valueForKey:@"CDDBatteryMonitorExchangeTimerDeltaString"];
  if (v13)
  {
    unsigned int v14 = [(CDD *)self config];
    [v14 setBatteryMonitorExchangeTimerDelta:[v13 intValue]];
  }
  id v15 = [v23 valueForKey:@"CDDBatteryMonitorExchangeBattDeltaString"];

  if (v15)
  {
    __int16 v16 = [(CDD *)self config];
    [v16 setBatteryMonitorExchangeBattDelta:[v15 intValue]];
  }
  unsigned int v17 = [v23 valueForKey:@"CDDCEnabledString"];

  if (v17)
  {
    v18 = [(CDD *)self config];
    [v18 setCommEnabled:[v17 BOOLValue]];
  }
  uint64_t v19 = [v23 valueForKey:@"CDDCMinClientGranularityString"];

  if (v19)
  {
    unsigned int v20 = [(CDD *)self config];
    [v20 setCommMinClientGranularity:[v19 intValue]];
  }
  id v21 = [v23 valueForKey:@"CDDCSyncBoundarySecondsString"];

  if (v21)
  {
    int v22 = [(CDD *)self config];
    [v22 setCommSyncBoundarySeconds:[v21 intValue]];
  }
}

- (CDDConfig)config
{
  return self->config;
}

- (CDDCommunicator)communicator
{
  return self->communicator;
}

- (CDDPrivacyMonitor)privacyMonitor
{
  return self->privacyMonitor;
}

- (CDDWatchUpdateController)watchUpdate
{
  return self->watchUpdate;
}

- (BOOL)classCLocked
{
  return self->classCLocked;
}

- (BOOL)passcodeLocked
{
  return self->passcodeLocked;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->watchUpdate, 0);
  objc_storeStrong((id *)&self->config, 0);
  objc_storeStrong((id *)&self->logQueue, 0);
  objc_storeStrong((id *)&self->cullingTimer, 0);
  objc_storeStrong((id *)&self->cullingTimerQueue, 0);
  objc_storeStrong((id *)&self->privacyMonitor, 0);

  objc_storeStrong((id *)&self->communicator, 0);
}

@end