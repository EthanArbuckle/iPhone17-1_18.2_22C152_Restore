@interface OTRamp
- (BOOL)cachedFeatureAllowed;
- (BOOL)checkRampStateWithError:(id *)a3;
- (CKContainer)container;
- (CKDatabase)database;
- (CKKSAccountStateTracker)accountTracker;
- (CKKSLockStateTracker)lockStateTracker;
- (CKKSReachabilityTracker)reachabilityTracker;
- (CKRecordZone)zone;
- (CKRecordZoneID)zoneID;
- (Class)fetchRecordRecordsOperationClass;
- (NSDate)lastFetch;
- (NSString)localSettingName;
- (NSString)recordName;
- (OTRamp)initWithRecordName:(id)a3 localSettingName:(id)a4 container:(id)a5 database:(id)a6 zoneID:(id)a7 accountTracker:(id)a8 lockStateTracker:(id)a9 reachabilityTracker:(id)a10 fetchRecordRecordsOperationClass:(Class)a11;
- (double)retryAfter;
- (int64_t)accountStatus;
- (void)fetchRampRecordWithReply:(id)a3;
- (void)setAccountStatus:(int64_t)a3;
- (void)setAccountTracker:(id)a3;
- (void)setCachedFeatureAllowed:(BOOL)a3;
- (void)setContainer:(id)a3;
- (void)setDatabase:(id)a3;
- (void)setLastFetch:(id)a3;
- (void)setLocalSettingName:(id)a3;
- (void)setLockStateTracker:(id)a3;
- (void)setReachabilityTracker:(id)a3;
- (void)setRecordName:(id)a3;
- (void)setRetryAfter:(double)a3;
- (void)setZone:(id)a3;
- (void)setZoneID:(id)a3;
@end

@implementation OTRamp

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastFetch, 0);
  objc_storeStrong((id *)&self->_fetchRecordRecordsOperationClass, 0);
  objc_storeStrong((id *)&self->_reachabilityTracker, 0);
  objc_storeStrong((id *)&self->_lockStateTracker, 0);
  objc_storeStrong((id *)&self->_accountTracker, 0);
  objc_storeStrong((id *)&self->_localSettingName, 0);
  objc_storeStrong((id *)&self->_recordName, 0);
  objc_storeStrong((id *)&self->_zoneID, 0);
  objc_storeStrong((id *)&self->_zone, 0);
  objc_storeStrong((id *)&self->_database, 0);

  objc_storeStrong((id *)&self->_container, 0);
}

- (void)setCachedFeatureAllowed:(BOOL)a3
{
  self->_cachedFeatureAllowed = a3;
}

- (BOOL)cachedFeatureAllowed
{
  return self->_cachedFeatureAllowed;
}

- (void)setRetryAfter:(double)a3
{
  self->_retryAfter = a3;
}

- (double)retryAfter
{
  return self->_retryAfter;
}

- (void)setLastFetch:(id)a3
{
}

- (NSDate)lastFetch
{
  return (NSDate *)objc_getProperty(self, a2, 104, 1);
}

- (Class)fetchRecordRecordsOperationClass
{
  return (Class)objc_getProperty(self, a2, 96, 1);
}

- (void)setAccountStatus:(int64_t)a3
{
  self->_accountStatus = a3;
}

- (int64_t)accountStatus
{
  return self->_accountStatus;
}

- (void)setReachabilityTracker:(id)a3
{
}

- (CKKSReachabilityTracker)reachabilityTracker
{
  return self->_reachabilityTracker;
}

- (void)setLockStateTracker:(id)a3
{
}

- (CKKSLockStateTracker)lockStateTracker
{
  return self->_lockStateTracker;
}

- (void)setAccountTracker:(id)a3
{
}

- (CKKSAccountStateTracker)accountTracker
{
  return self->_accountTracker;
}

- (void)setLocalSettingName:(id)a3
{
}

- (NSString)localSettingName
{
  return self->_localSettingName;
}

- (void)setRecordName:(id)a3
{
}

- (NSString)recordName
{
  return self->_recordName;
}

- (void)setZoneID:(id)a3
{
}

- (CKRecordZoneID)zoneID
{
  return self->_zoneID;
}

- (void)setZone:(id)a3
{
}

- (CKRecordZone)zone
{
  return self->_zone;
}

- (void)setDatabase:(id)a3
{
}

- (CKDatabase)database
{
  return self->_database;
}

- (void)setContainer:(id)a3
{
}

- (CKContainer)container
{
  return self->_container;
}

- (BOOL)checkRampStateWithError:(id *)a3
{
  uint64_t v82 = 0;
  v83 = &v82;
  uint64_t v84 = 0x2020000000;
  char v85 = 0;
  uint64_t v76 = 0;
  v77 = &v76;
  uint64_t v78 = 0x3032000000;
  v79 = sub_10012E1B4;
  v80 = sub_10012E1C4;
  id v81 = 0;
  uint64_t v72 = 0;
  v73 = &v72;
  uint64_t v74 = 0x2020000000;
  uint64_t v75 = 0;
  v5 = [(OTRamp *)self localSettingName];
  CFBooleanRef v6 = (CFBooleanRef)CFPreferencesCopyValue(v5, @"com.apple.security", kCFPreferencesCurrentUser, kCFPreferencesAnyHost);

  v7 = sub_10000B070("octagon");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = [(OTRamp *)self localSettingName];
    if (v6) {
      v9 = "True";
    }
    else {
      v9 = "False";
    }
    if (v6)
    {
      CFTypeID v10 = CFGetTypeID(v6);
      CFTypeID TypeID = CFBooleanGetTypeID();
      v12 = "False";
      if (v10 == TypeID && v6 == kCFBooleanTrue) {
        v12 = "True";
      }
    }
    else
    {
      v12 = "False";
    }
    *(_DWORD *)buf = 138413058;
    CFStringRef v99 = v8;
    __int16 v100 = 2080;
    v101 = "False";
    __int16 v102 = 2080;
    v103 = v9;
    __int16 v104 = 2080;
    v105 = v12;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@ Defaults availability: SecCKKSTestsEnabled[%s] DefaultsPointer[%s] DefaultsValue[%s]", buf, 0x2Au);
  }
  if (!v6)
  {
LABEL_20:
    id v19 = objc_alloc_init((Class)NSDate);
    v20 = [(OTRamp *)self lastFetch];
    [v19 timeIntervalSinceDate:v20];
    double v22 = v21;
    [(OTRamp *)self retryAfter];
    BOOL v24 = v22 < v23;

    if (v24)
    {
      unsigned __int8 v14 = [(OTRamp *)self cachedFeatureAllowed];
LABEL_54:

      goto LABEL_55;
    }
    v25 = [(OTRamp *)self lockStateTracker];
    unsigned int v26 = [v25 isLocked];

    if (v26)
    {
      v27 = sub_10000B070("octagon");
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "device is locked! can't check ramp state", buf, 2u);
      }

      NSErrorUserInfoKey v96 = NSLocalizedDescriptionKey;
      CFStringRef v97 = @"device is locked";
      v28 = +[NSDictionary dictionaryWithObjects:&v97 forKeys:&v96 count:1];
      uint64_t v29 = +[NSError errorWithDomain:kCFErrorDomainOSStatus code:-25308 userInfo:v28];
      v30 = (void *)v77[5];
      v77[5] = v29;

      if (a3)
      {
LABEL_52:
        unsigned __int8 v14 = 0;
        *a3 = (id) v77[5];
        goto LABEL_54;
      }
    }
    else
    {
      v31 = [(OTRamp *)self accountTracker];
      v32 = [v31 ckAccountInfoInitialized];
      [v32 wait:5000000000];

      v33 = [(OTRamp *)self accountTracker];
      v34 = [v33 currentCKAccountInfo];
      BOOL v35 = [v34 accountStatus] == (id)1;

      if (v35)
      {
        v36 = [(OTRamp *)self reachabilityTracker];
        unsigned __int8 v37 = [v36 currentReachability];

        if (v37)
        {
          v38 = +[CKKSAnalytics logger];
          v39 = [v38 logSystemMetricsForActivityNamed:@"CKKSActivityOTFetchRampState" withAction:0];
          dispatch_semaphore_t v40 = dispatch_semaphore_create(0);
          [v39 start];
          v64 = _NSConcreteStackBlock;
          uint64_t v65 = 3221225472;
          v66 = sub_10012E1CC;
          v67 = &unk_1002FB1C0;
          v69 = &v82;
          v70 = &v72;
          v71 = &v76;
          v41 = v40;
          v68 = v41;
          [(OTRamp *)self fetchRampRecordWithReply:&v64];
          dispatch_time_t v42 = dispatch_time(0, 65000000000);
          if (dispatch_semaphore_wait(v41, v42))
          {
            v43 = sub_10000B070("octagon");
            if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "timed out waiting for response from CloudKit\n", buf, 2u);
            }

            NSErrorUserInfoKey v90 = NSLocalizedDescriptionKey;
            CFStringRef v91 = @"timed out waiting for response from CloudKit";
            v44 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v91, &v90, 1, v64, v65, v66, v67);
            uint64_t v45 = +[NSError errorWithDomain:@"com.apple.security.octagon" code:23 userInfo:v44];
            v46 = (void *)v77[5];
            v77[5] = v45;

            uint64_t v47 = v77[5];
            CFStringRef v88 = @"OTFailureReason";
            CFStringRef v89 = @"cloud kit timed out";
            v48 = +[NSDictionary dictionaryWithObjects:&v89 forKeys:&v88 count:1];
            [v38 logUnrecoverableError:v47 forEvent:@"OctagonEventRamp" withAttributes:v48];
          }
          [v39 stop:v64, v65, v66, v67];
          if (v73[3] >= 1)
          {
            v49 = sub_10000B070("octagon");
            if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
            {
              CFStringRef v50 = (const __CFString *)v73[3];
              *(_DWORD *)buf = 134217984;
              CFStringRef v99 = v50;
              _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "cloud kit asked security to retry: %lu", buf, 0xCu);
            }

            [(OTRamp *)self setRetryAfter:(double)v73[3]];
          }
          if (v77[5])
          {
            v51 = sub_10000B070("SecError");
            if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
            {
              CFStringRef v52 = (const __CFString *)v77[5];
              *(_DWORD *)buf = 138412290;
              CFStringRef v99 = v52;
              _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "octagon: had an error fetching ramp state: %@", buf, 0xCu);
            }

            uint64_t v53 = v77[5];
            CFStringRef v86 = @"OTFailureReason";
            CFStringRef v87 = @"fetching ramp state";
            v54 = +[NSDictionary dictionaryWithObjects:&v87 forKeys:&v86 count:1];
            [v38 logUnrecoverableError:v53 forEvent:@"OctagonEventRamp" withAttributes:v54];

            if (a3) {
              *a3 = (id) v77[5];
            }
          }
          if (*((unsigned char *)v83 + 24)) {
            [v38 logSuccessForEventNamed:@"OctagonEventRamp"];
          }
          [(OTRamp *)self setLastFetch:v19];
          [(OTRamp *)self setCachedFeatureAllowed:*((unsigned __int8 *)v83 + 24)];
          unsigned __int8 v14 = *((unsigned char *)v83 + 24) != 0;

          goto LABEL_54;
        }
        v59 = sub_10000B070("octagon");
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "no network! can't check ramp state", buf, 2u);
        }

        NSErrorUserInfoKey v92 = NSLocalizedDescriptionKey;
        CFStringRef v93 = @"no network";
        v60 = +[NSDictionary dictionaryWithObjects:&v93 forKeys:&v92 count:1];
        uint64_t v61 = +[NSError errorWithDomain:@"com.apple.security.octagon" code:24 userInfo:v60];
        v62 = (void *)v77[5];
        v77[5] = v61;

        if (a3) {
          goto LABEL_52;
        }
      }
      else
      {
        v55 = sub_10000B070("octagon");
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "not signed in! can't check ramp state", buf, 2u);
        }

        NSErrorUserInfoKey v94 = NSLocalizedDescriptionKey;
        CFStringRef v95 = @"not signed in";
        v56 = +[NSDictionary dictionaryWithObjects:&v95 forKeys:&v94 count:1];
        uint64_t v57 = +[NSError errorWithDomain:@"com.apple.security.octagon" code:25 userInfo:v56];
        v58 = (void *)v77[5];
        v77[5] = v57;

        if (a3) {
          goto LABEL_52;
        }
      }
    }
    unsigned __int8 v14 = 0;
    goto LABEL_54;
  }
  CFTypeID v13 = CFGetTypeID(v6);
  if (v13 != CFBooleanGetTypeID())
  {
    CFRelease(v6);
    goto LABEL_20;
  }
  unsigned __int8 v14 = v6 == kCFBooleanTrue;
  v15 = sub_10000B070("octagon");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = [(OTRamp *)self recordName];
    v17 = (void *)v16;
    CFStringRef v18 = @"disabled";
    if (v6 == kCFBooleanTrue) {
      CFStringRef v18 = @"enabled";
    }
    *(_DWORD *)buf = 138412546;
    CFStringRef v99 = v18;
    __int16 v100 = 2112;
    v101 = (const char *)v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "feature is %@: %@ (local config)", buf, 0x16u);
  }
  CFRelease(v6);
LABEL_55:
  _Block_object_dispose(&v72, 8);
  _Block_object_dispose(&v76, 8);

  _Block_object_dispose(&v82, 8);
  return v14;
}

- (void)fetchRampRecordWithReply:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)CKOperationConfiguration);
  [v5 setAllowsCellularAccess:1];
  [v5 setIsCloudKitSupportOperation:1];
  id v6 = [objc_alloc((Class)CKRecordID) initWithRecordName:self->_recordName zoneID:self->_zoneID];
  [(OTRamp *)self fetchRecordRecordsOperationClass];
  id v7 = objc_alloc((Class)objc_opt_class());
  id v20 = v6;
  v8 = +[NSArray arrayWithObjects:&v20 count:1];
  id v9 = [v7 initWithRecordIDs:v8];

  v19[0] = @"FeatureAllowed";
  v19[1] = @"FeaturePromoted";
  v19[2] = @"FeatureVisible";
  v19[3] = @"RetryAfter";
  CFTypeID v10 = +[NSArray arrayWithObjects:v19 count:4];
  [v9 setDesiredKeys:v10];

  [v9 setConfiguration:v5];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10012E53C;
  v16[3] = &unk_1002FB198;
  id v17 = v6;
  id v18 = v4;
  id v11 = v4;
  id v12 = v6;
  [v9 setFetchRecordsCompletionBlock:v16];
  CFTypeID v13 = [(OTRamp *)self database];
  [v13 addOperation:v9];

  unsigned __int8 v14 = sub_10000B070("octagon");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Attempting to fetch ramp state from CloudKit", v15, 2u);
  }
}

- (OTRamp)initWithRecordName:(id)a3 localSettingName:(id)a4 container:(id)a5 database:(id)a6 zoneID:(id)a7 accountTracker:(id)a8 lockStateTracker:(id)a9 reachabilityTracker:(id)a10 fetchRecordRecordsOperationClass:(Class)a11
{
  id v33 = a3;
  id v32 = a4;
  id v17 = a5;
  id v18 = a6;
  id v31 = a7;
  id v30 = a8;
  id v29 = a9;
  id v19 = a10;
  v34.receiver = self;
  v34.super_class = (Class)OTRamp;
  id v20 = [(OTRamp *)&v34 init];
  double v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_container, a5);
    double v22 = (NSString *)[v33 copy];
    recordName = v21->_recordName;
    v21->_recordName = v22;

    BOOL v24 = (NSString *)[v32 copy];
    localSettingName = v21->_localSettingName;
    v21->_localSettingName = v24;

    objc_storeStrong((id *)&v21->_database, a6);
    objc_storeStrong((id *)&v21->_zoneID, a7);
    objc_storeStrong((id *)&v21->_accountTracker, a8);
    objc_storeStrong((id *)&v21->_lockStateTracker, a9);
    objc_storeStrong((id *)&v21->_reachabilityTracker, a10);
    objc_storeStrong((id *)&v21->_fetchRecordRecordsOperationClass, a11);
    uint64_t v26 = +[NSDate distantPast];
    lastFetch = v21->_lastFetch;
    v21->_lastFetch = (NSDate *)v26;

    v21->_retryAfter = 86400.0;
    v21->_cachedFeatureAllowed = 0;
  }

  return v21;
}

@end