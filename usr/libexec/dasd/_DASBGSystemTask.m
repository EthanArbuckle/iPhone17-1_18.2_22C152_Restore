@interface _DASBGSystemTask
+ (BOOL)hasFastPassRun:(id)a3 semanticVersion:(int64_t)a4;
+ (BOOL)resetFastPass:(id)a3 resetAll:(BOOL)a4;
+ (id)allFastPassIdentifiers;
+ (id)resourcesDescriptionFromBitmap:(int64_t)a3;
+ (id)taskNameWithIdentifier:(id)a3 UID:(unsigned int)a4;
+ (void)garbageCollectActivityDates;
+ (void)initialize;
+ (void)markFastPassActivityDone:(id)a3 semanticVersion:(int64_t)a4;
- (BOOL)app_refresh;
- (BOOL)backlogged;
- (BOOL)beforeApplicationLaunch;
- (BOOL)blockRebootActivitiesForSU;
- (BOOL)bypassBatteryAging;
- (BOOL)bypassPeakPower;
- (BOOL)communicates_with_paired_device;
- (BOOL)data_budgeted;
- (BOOL)duet_power_budgeted;
- (BOOL)hasInstallActivityRun;
- (BOOL)magneticInterferenceSensitivity;
- (BOOL)mailFetch;
- (BOOL)may_reboot_device;
- (BOOL)overrideRateLimiting;
- (BOOL)post_install;
- (BOOL)power_nap;
- (BOOL)prevents_device_sleep;
- (BOOL)reRun;
- (BOOL)repeating;
- (BOOL)requestsApplicationLaunch;
- (BOOL)requiresExternalPower;
- (BOOL)requiresRemoteDeviceWake;
- (BOOL)requiresUserInactivity;
- (BOOL)requires_buddy_complete;
- (BOOL)requires_inexpensive_network;
- (BOOL)requires_network_connectivity;
- (BOOL)requires_significant_user_inactivity;
- (BOOL)requires_unconstrained_network;
- (BOOL)resource_intensive;
- (BOOL)runOnAppForeground;
- (BOOL)shouldWakeDevice;
- (BOOL)useStatisticalModelForTriggersRestart;
- (BOOL)user_requested_backup_task;
- (BOOL)validateFastPassSubmissionForActivity:(id)a3 featureCodes:(id)a4 service:(id)a5;
- (BOOL)validateFeatureCodes:(id)a3 forToken:(unint64_t)a4;
- (NSArray)featureCodes;
- (NSArray)involved_processes;
- (NSArray)processingTaskIdentifiers;
- (NSArray)related_applications;
- (NSDate)baseTime;
- (NSDate)startTime;
- (NSSet)dependencies;
- (NSSet)produced_result_identifiers;
- (NSString)dataBudgetName;
- (NSString)diskVolume;
- (NSString)group_name;
- (NSString)identifier;
- (NSString)name;
- (NSString)rateLimitConfigurationName;
- (NSString)remoteDevice;
- (NSString)serviceName;
- (OS_dispatch_source)dispatchSourceProcessExit;
- (OS_nw_endpoint)network_endpoint;
- (OS_nw_parameters)network_parameters;
- (OS_xpc_object)descriptor;
- (_DASActivity)scheduler_activity;
- (_DASBGSystemTask)initWithDescriptor:(id)a3 withToken:(unint64_t)a4 withUID:(unsigned int)a5 withService:(id)a6 staticSubmission:(BOOL)a7;
- (_DASBGSystemTask)initWithDescriptor:(id)a3 withToken:(unint64_t)a4 withUID:(unsigned int)a5 withService:(id)a6 staticSubmission:(BOOL)a7 task:(id)a8;
- (double)expected_duration;
- (double)initialDelay;
- (double)interval;
- (double)minDurationBetweenInstances;
- (double)random_initial_delay;
- (double)startAfter;
- (double)tempDelay;
- (double)trySchedulingBefore;
- (id)aboutMe;
- (id)deadlineTime;
- (id)description;
- (id)eligibleTime;
- (id)getActivityBaseTime;
- (id)resourcesDescription;
- (id)stateString;
- (int)pid;
- (int64_t)expected_network_download_size_bytes;
- (int64_t)expected_network_upload_size_bytes;
- (int64_t)priority;
- (int64_t)requires_protection_class;
- (int64_t)resources;
- (int64_t)run_on_motion_state;
- (int64_t)semanticVersion;
- (int64_t)state;
- (int64_t)targetDevice;
- (int64_t)type;
- (unint64_t)group_concurrency_limit;
- (unint64_t)requiresMinimumBatteryLevel;
- (unint64_t)requiresMinimumDataBudgetPercentage;
- (unint64_t)suspensionReason;
- (unint64_t)token;
- (unsigned)uid;
- (void)adjustBaseTimeByOffset:(double)a3;
- (void)advanceBaseTime;
- (void)loadBaseTime;
- (void)markInstallActivityDone;
- (void)markStarted:(id)a3;
- (void)markStopped:(id)a3;
- (void)resetBaseTime;
- (void)saveActivityBaseTime:(id)a3;
- (void)setBacklogged:(BOOL)a3;
- (void)setBlockRebootActivitiesForSU:(BOOL)a3;
- (void)setBypassBatteryAging:(BOOL)a3;
- (void)setBypassPeakPower:(BOOL)a3;
- (void)setDispatchSourceProcessExit:(id)a3;
- (void)setFeatureCodes:(id)a3;
- (void)setMagneticInterferenceSensitivity:(BOOL)a3;
- (void)setMailFetch:(BOOL)a3;
- (void)setOverrideRateLimiting:(BOOL)a3;
- (void)setPid:(int)a3;
- (void)setProcessingTaskIdentifiers:(id)a3;
- (void)setReRun:(BOOL)a3;
- (void)setRequiresMinimumBatteryLevel:(unint64_t)a3;
- (void)setRequiresMinimumDataBudgetPercentage:(unint64_t)a3;
- (void)setScheduler_activity:(id)a3;
- (void)setSemanticVersion:(int64_t)a3;
- (void)setState:(int64_t)a3;
- (void)setSuspensionReason:(unint64_t)a3;
- (void)setUseStatisticalModelForTriggersRestart:(BOOL)a3;
- (void)updateFeatureCodesForActivity:(id)a3;
@end

@implementation _DASBGSystemTask

+ (void)initialize
{
  uint64_t v3 = +[_DASDaemonLogger logForCategory:@"BGST"];
  v4 = (void *)qword_1001C4028;
  qword_1001C4028 = v3;

  id v5 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.bg.system.task"];
  v6 = (void *)qword_1001C4030;
  qword_1001C4030 = (uint64_t)v5;

  v7 = [(id)qword_1001C4030 dictionaryForKey:@"ActivityBaseDates"];
  v8 = v7;
  if (v7)
  {
    id v9 = [v7 mutableCopy];
    v10 = (void *)qword_1001C4038;
    qword_1001C4038 = (uint64_t)v9;

    +[_DASBGSystemTask garbageCollectActivityDates];
  }
  else
  {
    uint64_t v11 = +[NSMutableDictionary dictionary];
    v12 = (void *)qword_1001C4038;
    qword_1001C4038 = v11;
  }
  v13 = +[_DASBGSystemTaskHelper activityQueue];
  dispatch_source_t v14 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v13);
  v15 = (void *)qword_1001C4040;
  qword_1001C4040 = (uint64_t)v14;

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100068428;
  handler[3] = &unk_1001753E0;
  handler[4] = a1;
  dispatch_source_set_event_handler((dispatch_source_t)qword_1001C4040, handler);
  v16 = qword_1001C4040;
  dispatch_time_t v17 = dispatch_time(0, 86400000000000);
  dispatch_source_set_timer(v16, v17, 0x4E94914F0000uLL, 0x13A52453C000uLL);
  dispatch_activate((dispatch_object_t)qword_1001C4040);
}

+ (void)garbageCollectActivityDates
{
  if ([(id)qword_1001C4038 count])
  {
    v2 = +[NSDate date];
    uint64_t v3 = [v2 dateByAddingTimeInterval:-4838400.0];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    v4 = [qword_1001C4038 allKeys];
    id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * i);
          v10 = [(id)qword_1001C4038 objectForKeyedSubscript:v9];
          if ([v10 compare:v3] == (id)-1)
          {
            [(id)qword_1001C4038 removeObjectForKey:v9];
          }
          else if ([v10 compare:v2] == (id)1)
          {
            [(id)qword_1001C4038 setObject:v2 forKeyedSubscript:v9];
          }
        }
        id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }
  }
}

- (_DASBGSystemTask)initWithDescriptor:(id)a3 withToken:(unint64_t)a4 withUID:(unsigned int)a5 withService:(id)a6 staticSubmission:(BOOL)a7
{
  return [(_DASBGSystemTask *)self initWithDescriptor:a3 withToken:a4 withUID:*(void *)&a5 withService:a6 staticSubmission:a7 task:0];
}

- (_DASBGSystemTask)initWithDescriptor:(id)a3 withToken:(unint64_t)a4 withUID:(unsigned int)a5 withService:(id)a6 staticSubmission:(BOOL)a7 task:(id)a8
{
  BOOL v9 = a7;
  id v14 = a3;
  id v128 = a6;
  id v129 = a8;
  v134.receiver = self;
  v134.super_class = (Class)_DASBGSystemTask;
  v15 = [(_DASBGSystemTask *)&v134 init];

  if (xpc_get_type(v14) != (xpc_type_t)&_xpc_type_dictionary) {
    sub_1000F745C();
  }
  memset(v139, 0, sizeof(v139));
  if ((xpc_get_event_name() & 1) == 0)
  {
    v21 = qword_1001C4028;
    if (os_log_type_enabled((os_log_t)qword_1001C4028, OS_LOG_TYPE_ERROR)) {
      sub_1000F7418(v21);
    }
    goto LABEL_9;
  }
  uint64_t v16 = +[NSString stringWithUTF8String:v139];
  identifier = v15->_identifier;
  v15->_identifier = (NSString *)v16;

  v15->_token = a4;
  v15->_uid = a5;
  objc_storeStrong((id *)&v15->_serviceName, a6);
  v15->_suspensionReason = -1;
  if (xpc_dictionary_get_BOOL(v14, "PostInstall"))
  {
    if ([(_DASBGSystemTask *)v15 hasInstallActivityRun])
    {
      v18 = (void *)qword_1001C4028;
      if (os_log_type_enabled((os_log_t)qword_1001C4028, OS_LOG_TYPE_DEFAULT))
      {
        v19 = v18;
        v20 = [(_DASBGSystemTask *)v15 name];
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = v20;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: postinstall activity has already run on this build", buf, 0xCu);
      }
      goto LABEL_9;
    }
    v15->_post_install = 1;
  }
  v24 = xpc_dictionary_get_dictionary(v14, "RepeatingTask");
  v25 = v24;
  if (!v24 || xpc_get_type(v24) != (xpc_type_t)&_xpc_type_dictionary)
  {
    v15->_type = 1;
    v15->_double startAfter = 0.0;
    v15->_trySchedulingBefore = 0.0;
    v26 = xpc_dictionary_get_dictionary(v14, "NonRepeatingTask");

    if (!v26 || xpc_get_type(v26) != (xpc_type_t)&_xpc_type_dictionary) {
      goto LABEL_46;
    }
    v125 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    v126 = [v125 objectForKey:@"FastPassTask"];
    if (!v126)
    {
LABEL_45:
      v49 = [v125 objectForKeyedSubscript:@"ScheduleAfter"];
      v15->_double startAfter = (double)(int)[v49 intValue];

      v50 = [v125 objectForKeyedSubscript:@"TrySchedulingBefore"];
      v15->_trySchedulingBefore = (double)(int)[v50 intValue];

LABEL_46:
      double startAfter = v15->_startAfter;
      if (v15->_trySchedulingBefore < startAfter) {
        v15->_trySchedulingBefore = startAfter;
      }
      v25 = v26;
      goto LABEL_49;
    }
    v27 = [v126 objectForKey:@"SemanticVersion"];
    v15->_semanticVersion = (int)[v27 intValue];

    v28 = [v126 objectForKey:@"ReRun"];
    v15->_reRun = [v28 BOOLValue];

    if (v9)
    {
      if (v15->_reRun)
      {
        v29 = (void *)qword_1001C4028;
        if (os_log_type_enabled((os_log_t)qword_1001C4028, OS_LOG_TYPE_ERROR)) {
          sub_1000F7238(v29, v15);
        }
LABEL_34:

LABEL_9:
        v22 = 0;
        goto LABEL_10;
      }
    }
    else if (v15->_reRun)
    {
LABEL_39:
      v43 = (id)qword_1001C4028;
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        id v44 = [(_DASBGSystemTask *)v15 name];
        unsigned int v45 = [(_DASBGSystemTask *)v15 semanticVersion];
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v44;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v45;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "%{public}@ v%d: Allowing FastPass resubmission", buf, 0x12u);
      }
      v46 = objc_opt_class();
      v47 = [(_DASBGSystemTask *)v15 name];
      [v46 resetFastPass:v47 resetAll:0];

LABEL_42:
      v48 = [v126 objectForKey:@"ProcessingTaskIdentifiers"];
      if ([v48 count]) {
        objc_storeStrong((id *)&v15->_processingTaskIdentifiers, v48);
      }
      v15->_type = 3;

      goto LABEL_45;
    }
    v36 = objc_opt_class();
    v37 = [(_DASBGSystemTask *)v15 name];
    LODWORD(v36) = [v36 hasFastPassRun:v37 semanticVersion:_DASBGSystemTask semanticVersion:v15];

    if (v36)
    {
      v38 = (void *)qword_1001C4028;
      if (os_log_type_enabled((os_log_t)qword_1001C4028, OS_LOG_TYPE_DEFAULT))
      {
        v39 = v38;
        v40 = [(_DASBGSystemTask *)v15 name];
        unsigned int v41 = [(_DASBGSystemTask *)v15 semanticVersion];
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v40;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v41;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "%{public}@ v%d: FastPass activity has already run on this release", buf, 0x12u);
      }
      goto LABEL_34;
    }
    if (!v15->_reRun) {
      goto LABEL_42;
    }
    goto LABEL_39;
  }
  if (v15->_post_install)
  {
    v30 = (void *)qword_1001C4028;
    if (os_log_type_enabled((os_log_t)qword_1001C4028, OS_LOG_TYPE_ERROR)) {
      sub_1000F7378(v30, v15);
    }

    goto LABEL_9;
  }
  v31 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  v15->_type = 2;
  v32 = [v31 objectForKeyedSubscript:@"Interval"];
  v15->_double interval = (double)(int)[v32 intValue];

  v33 = [v31 objectForKeyedSubscript:@"MinDurationBetweenInstances"];
  v15->_double minDurationBetweenInstances = (double)(int)[v33 intValue];

  double interval = v15->_interval;
  if (interval < 300.0)
  {
    v42 = (void *)qword_1001C4028;
    if (os_log_type_enabled((os_log_t)qword_1001C4028, OS_LOG_TYPE_ERROR)) {
      sub_1000F72D8(v42, v15);
    }

    goto LABEL_9;
  }
  double minDurationBetweenInstances = v15->_minDurationBetweenInstances;
  if (minDurationBetweenInstances == 0.0 || minDurationBetweenInstances > interval) {
    v15->_double minDurationBetweenInstances = interval * 0.8;
  }

LABEL_49:
  v52 = xpc_dictionary_get_array(v14, "FeatureCodes");

  if (v52 && xpc_get_type(v52) == (xpc_type_t)&_xpc_type_array)
  {
    v57 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    if ([v57 count])
    {
      if ([(_DASBGSystemTask *)v15 validateFeatureCodes:v57 forToken:a4])
      {
        objc_storeStrong((id *)&v15->_featureCodes, v57);

        goto LABEL_51;
      }
      if (os_log_type_enabled((os_log_t)qword_1001C4028, OS_LOG_TYPE_ERROR)) {
        sub_1000F71D0();
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_1001C4028, OS_LOG_TYPE_ERROR))
    {
      sub_1000F7168();
    }

    goto LABEL_9;
  }
LABEL_51:
  if (v15->_type != 3) {
    goto LABEL_55;
  }
  featureCodes = v15->_featureCodes;
  if (!featureCodes)
  {
    if (os_log_type_enabled((os_log_t)qword_1001C4028, OS_LOG_TYPE_ERROR)) {
      sub_1000F6D2C();
    }
    goto LABEL_69;
  }
  if (![(_DASBGSystemTask *)v15 validateFastPassSubmissionForActivity:v15->_identifier featureCodes:featureCodes service:v128])
  {
    if (os_log_type_enabled((os_log_t)qword_1001C4028, OS_LOG_TYPE_ERROR)) {
      sub_1000F7100();
    }
LABEL_69:

    goto LABEL_9;
  }
  [(_DASBGSystemTask *)v15 updateFeatureCodesForActivity:v15->_identifier];
LABEL_55:
  v15->_priority = 1;
  v15->_requiresExternalPower = 1;
  string = xpc_dictionary_get_string(v14, "Priority");
  v55 = string;
  if (!string)
  {
    if (v15->_type != 3) {
      goto LABEL_80;
    }
    goto LABEL_66;
  }
  if (!strcmp(string, "Maintenance")) {
    goto LABEL_80;
  }
  if (!strcmp(v55, "Utility"))
  {
LABEL_66:
    uint64_t v58 = 2;
LABEL_79:
    v15->_priority = v58;
    v15->_requiresExternalPower = 0;
    goto LABEL_80;
  }
  if (!strcmp(v55, "UserInitiated"))
  {
    uint64_t v58 = 3;
    goto LABEL_79;
  }
  v56 = (id)qword_1001C4028;
  if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
    sub_1000F700C(v15, (uint64_t)v55, v56);
  }

LABEL_80:
  v59 = xpc_dictionary_get_value(v14, "RequiresExternalPower");

  if (v59) {
    v15->_requiresExternalPower = xpc_BOOL_get_value(v59);
  }
  v15->_random_initial_delay = (double)xpc_dictionary_get_int64(v14, "RandomInitialDelay");
  v15->_expected_duration = (double)xpc_dictionary_get_int64(v14, "ExpectedDuration");
  v60 = xpc_dictionary_get_array(v14, "RelatedApplications");

  if (v60 && xpc_get_type(v60) == (xpc_type_t)&_xpc_type_array)
  {
    uint64_t v61 = _CFXPCCreateCFObjectFromXPCObject();
    related_applications = v15->_related_applications;
    v15->_related_applications = (NSArray *)v61;
  }
  v63 = xpc_dictionary_get_array(v14, "InvolvedProcesses");

  if (v63 && xpc_get_type(v63) == (xpc_type_t)&_xpc_type_array)
  {
    uint64_t v64 = _CFXPCCreateCFObjectFromXPCObject();
    involved_processes = v15->_involved_processes;
    v15->_involved_processes = (NSArray *)v64;
  }
  v66 = xpc_dictionary_get_value(v14, "RunOnAppForeground");

  if (v66)
  {
    if (xpc_get_type(v66) == (xpc_type_t)&_xpc_type_BOOL)
    {
      BOOL value = xpc_BOOL_get_value(v66);
      BOOL v68 = value;
      if (value)
      {
        if (![(NSArray *)v15->_related_applications count])
        {
          v111 = (void *)qword_1001C4028;
          if (os_log_type_enabled((os_log_t)qword_1001C4028, OS_LOG_TYPE_ERROR)) {
            sub_1000F6F6C(v111, v15);
          }
          goto LABEL_164;
        }
        v15->_runOnAppForeground = v68;
      }
    }
  }
  v69 = xpc_dictionary_get_value(v14, "RequestsApplicationLaunch");

  if (v69)
  {
    if (xpc_get_type(v69) == (xpc_type_t)&_xpc_type_BOOL)
    {
      BOOL v70 = xpc_BOOL_get_value(v69);
      BOOL v71 = v70;
      if (v70)
      {
        if (![(NSArray *)v15->_related_applications count])
        {
          v112 = (void *)qword_1001C4028;
          if (os_log_type_enabled((os_log_t)qword_1001C4028, OS_LOG_TYPE_ERROR)) {
            sub_1000F6ECC(v112, v15);
          }

          goto LABEL_9;
        }
        v15->_requestsApplicationLaunch = v71;
      }
    }
  }
  v66 = xpc_dictionary_get_value(v14, "BeforeApplicationLaunch");

  if (v66)
  {
    if (xpc_get_type(v66) == (xpc_type_t)&_xpc_type_BOOL)
    {
      BOOL v72 = xpc_BOOL_get_value(v66);
      BOOL v73 = v72;
      if (v72)
      {
        if ([(NSArray *)v15->_related_applications count])
        {
          v15->_beforeApplicationLaunch = v73;
          goto LABEL_103;
        }
        v113 = (void *)qword_1001C4028;
        if (os_log_type_enabled((os_log_t)qword_1001C4028, OS_LOG_TYPE_ERROR)) {
          sub_1000F6E2C(v113, v15);
        }
LABEL_164:

        goto LABEL_9;
      }
    }
  }
LABEL_103:
  v74 = xpc_dictionary_get_value(v14, "UserRequestedBackupTask");

  if (v74) {
    v15->_user_requested_backup_task = xpc_BOOL_get_value(v74);
  }
  v75 = xpc_dictionary_get_dictionary(v14, "NetworkEndpoint");

  if (v75 && xpc_get_type(v75) == (xpc_type_t)&_xpc_type_dictionary)
  {
    uint64_t v76 = nw_endpoint_create_from_dictionary();
    network_endpoint = v15->_network_endpoint;
    v15->_network_endpoint = (OS_nw_endpoint *)v76;
  }
  v78 = xpc_dictionary_get_dictionary(v14, "NetworkParameters");

  if (v78 && xpc_get_type(v78) == (xpc_type_t)&_xpc_type_dictionary)
  {
    uint64_t v79 = nw_parameters_create_from_dictionary();
    network_parameters = v15->_network_parameters;
    v15->_network_parameters = (OS_nw_parameters *)v79;
  }
  v15->_requires_buddy_complete = xpc_dictionary_get_BOOL(v14, "RequiresBuddyComplete");
  v81 = xpc_dictionary_get_string(v14, "GroupName");
  if (v81)
  {
    uint64_t v82 = +[NSString stringWithUTF8String:v81];
    group_name = v15->_group_name;
    v15->_group_name = (NSString *)v82;
  }
  if (v15->_group_name)
  {
    uint64_t v84 = xpc_dictionary_get_value(v14, "GroupConcurrencyLimit");

    if (v84) {
      int64_t int64 = xpc_dictionary_get_int64(v14, "GroupConcurrencyLimit");
    }
    else {
      int64_t int64 = 1;
    }
    v15->_group_concurrency_limit = int64;
    v78 = (void *)v84;
  }
  v86 = xpc_dictionary_get_string(v14, "RateLimitConfigurationName");
  if (v86)
  {
    uint64_t v87 = +[NSString stringWithUTF8String:v86];
    rateLimitConfigurationName = v15->_rateLimitConfigurationName;
    v15->_rateLimitConfigurationName = (NSString *)v87;
  }
  v15->_requires_significant_user_inactivity = xpc_dictionary_get_BOOL(v14, "RequiresSignificantUserInactivity");
  v15->_requiresUserInactivity = xpc_dictionary_get_BOOL(v14, "RequiresUserInactivity");
  v15->_power_nap = xpc_dictionary_get_BOOL(v14, "PowerNap");
  v15->_app_refresh = xpc_dictionary_get_BOOL(v14, "AppRefresh");
  v15->_prevents_device_sleep = xpc_dictionary_get_BOOL(v14, "PreventsDeviceSleep");
  v15->_resource_intensive = xpc_dictionary_get_BOOL(v14, "ResourceIntensive");
  unint64_t v89 = xpc_dictionary_get_int64(v14, "Resources");
  if (v89 <= 1) {
    uint64_t v90 = 1;
  }
  else {
    uint64_t v90 = v89;
  }
  v15->_resources = v90;
  v15->_requires_inexpensive_network = xpc_dictionary_get_BOOL(v14, "RequiresInexpensiveNetworkConnectivity");
  v15->_requires_unconstrained_network = xpc_dictionary_get_BOOL(v14, "RequiresUnconstrainedNetworkConnectivity");
  BOOL v91 = xpc_dictionary_get_BOOL(v14, "RequiresNetworkConnectivity")
     || v15->_requires_inexpensive_network
     || v15->_requires_unconstrained_network;
  v15->_requires_network_connectivity = v91;
  v15->_expected_network_download_size_bytes = xpc_dictionary_get_int64(v14, "NetworkDownloadSize");
  v15->_expected_network_upload_size_bytes = xpc_dictionary_get_int64(v14, "NetworkUploadSize");
  v15->_may_reboot_device = xpc_dictionary_get_BOOL(v14, "MayRebootDevice");
  v92 = xpc_dictionary_get_array(v14, "ProducedResultIdentifiers");

  if (v92 && xpc_get_type(v92) == (xpc_type_t)&_xpc_type_array)
  {
    v93 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    if (v93)
    {
      uint64_t v94 = +[NSSet setWithArray:v93];
      produced_result_identifiers = v15->_produced_result_identifiers;
      v15->_produced_result_identifiers = (NSSet *)v94;
    }
  }
  v96 = xpc_dictionary_get_array(v14, "Dependencies");

  if (v96 && xpc_get_type(v96) == (xpc_type_t)&_xpc_type_array)
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v136 = sub_1000699D4;
    v137 = sub_1000699E4;
    id v138 = +[NSMutableSet set];
    applier[0] = _NSConcreteStackBlock;
    applier[1] = 3221225472;
    applier[2] = sub_1000699EC;
    applier[3] = &unk_100176888;
    v97 = v15;
    unsigned int v133 = a5;
    v131 = v97;
    v132 = buf;
    if (!xpc_array_apply(v96, applier))
    {

      _Block_object_dispose(buf, 8);
      goto LABEL_9;
    }
    objc_storeStrong(v97 + 41, *(id *)(*(void *)&buf[8] + 40));

    _Block_object_dispose(buf, 8);
  }
  v98 = xpc_dictionary_get_string(v14, "DiskVolume");
  if (v98)
  {
    if (!v15->_expected_network_download_size_bytes)
    {
      v104 = (id)qword_1001C4028;
      if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR)) {
        sub_1000F6D94(v15, v104);
      }

      goto LABEL_9;
    }
    uint64_t v99 = +[NSString stringWithUTF8String:v98];
    diskVolume = v15->_diskVolume;
    v15->_diskVolume = (NSString *)v99;
  }
  v15->_communicates_with_paired_device = xpc_dictionary_get_BOOL(v14, "CommunicatesWithPairedDevice");
  v15->_targetDevice = 0;
  v101 = xpc_dictionary_get_string(v14, "TargetDevice");
  v102 = v101;
  if (v101)
  {
    if (!strncmp(v101, "TargetDeviceDefaultPaired", 0x19uLL))
    {
      uint64_t v103 = 1;
    }
    else if (!strncmp(v102, "TargetDeviceAllPaired", 0x15uLL))
    {
      uint64_t v103 = 2;
    }
    else
    {
      if (strncmp(v102, "TargetDeviceRemote", 0x12uLL)) {
        goto LABEL_151;
      }
      uint64_t v103 = 3;
    }
    v15->_targetDevice = v103;
  }
LABEL_151:
  v105 = xpc_dictionary_get_string(v14, "RemoteDeviceIdentifier");
  if (v105)
  {
    uint64_t v106 = +[NSString stringWithUTF8String:v105];
    remoteDevice = v15->_remoteDevice;
    v15->_remoteDevice = (NSString *)v106;
  }
  v15->_requiresRemoteDeviceWake = xpc_dictionary_get_BOOL(v14, "RequiresRemoteDeviceWake");
  v108 = xpc_dictionary_get_string(v14, "RunOnMotionState");
  if (!v108) {
    goto LABEL_179;
  }
  v109 = +[NSString stringWithUTF8String:v108];
  if ([v109 isEqualToString:@"Stationary"])
  {
    uint64_t v110 = 1;
LABEL_177:
    v15->_run_on_motion_state = v110;
    goto LABEL_178;
  }
  if ([v109 isEqualToString:@"Walking"])
  {
    uint64_t v110 = 2;
    goto LABEL_177;
  }
  if ([v109 isEqualToString:@"Running"])
  {
    uint64_t v110 = 3;
    goto LABEL_177;
  }
  if ([v109 isEqualToString:@"Cycling"])
  {
    uint64_t v110 = 4;
    goto LABEL_177;
  }
  if ([v109 isEqualToString:@"Automotive"])
  {
    uint64_t v110 = 5;
    goto LABEL_177;
  }
  if ([v109 isEqualToString:@"AutomotiveMoving"])
  {
    uint64_t v110 = 6;
    goto LABEL_177;
  }
  if ([v109 isEqualToString:@"AutomotiveStationary"])
  {
    uint64_t v110 = 7;
    goto LABEL_177;
  }
LABEL_178:

LABEL_179:
  v15->_duet_power_budgeted = xpc_dictionary_get_BOOL(v14, "PowerBudgeted");
  v15->_data_budgeted = xpc_dictionary_get_BOOL(v14, "DataBudgeted");
  v114 = xpc_dictionary_get_string(v14, "DataBudgetName");
  if (v114 && v15->_data_budgeted)
  {
    uint64_t v115 = +[NSString stringWithUTF8String:v114];
    dataBudgetName = v15->_dataBudgetName;
    v15->_dataBudgetName = (NSString *)v115;
  }
  v15->_shouldWakeDevice = xpc_dictionary_get_BOOL(v14, "ShouldWakeDevice");
  v15->_requires_protection_class = 3;
  v117 = xpc_dictionary_get_string(v14, "RequiresProtectionClass");
  if (v117 && (*v117 - 65) <= 3u) {
    v15->_requires_protection_class = (*v117 - 65) + 1;
  }
  v15->_overrideRateLimiting = xpc_dictionary_get_BOOL(v14, "OverrideRateLimiting");
  v15->_magneticInterferenceSensitivity = xpc_dictionary_get_BOOL(v14, "MagneticInterferenceSensitivity");
  v15->_mailFetch = xpc_dictionary_get_BOOL(v14, "MailFetch");
  v15->_bypassPeakPower = xpc_dictionary_get_BOOL(v14, "BypassPeakPower");
  v15->_bypassBatteryAging = xpc_dictionary_get_BOOL(v14, "BypassBatteryAging");
  v15->_backlogged = xpc_dictionary_get_BOOL(v14, "Backlogged");
  v15->_requiresMinimumBatteryLevel = xpc_dictionary_get_int64(v14, "RequiresMinimumBatteryLevel");
  v15->_blockRebootActivitiesForSU = xpc_dictionary_get_BOOL(v14, "BlockRebootActivitiesForSU");
  if (v15->_requiresMinimumBatteryLevel >= 0x65) {
    v15->_requiresMinimumBatteryLevel = 0;
  }
  unint64_t v118 = xpc_dictionary_get_int64(v14, "RequiresMinimumDataBudgetPercentage");
  if (v118 <= 0x64) {
    unint64_t v119 = v118;
  }
  else {
    unint64_t v119 = 0;
  }
  v15->_requiresMinimumDataBudgetPercentage = v119;
  v15->_state = 0;
  if (v129)
  {
    uint64_t v120 = [v129 baseTime];
    baseTime = v15->_baseTime;
    v15->_baseTime = (NSDate *)v120;

    [v129 tempDelay];
    v15->_tempDelay = v122;
    if (v15->_type == 2)
    {
      v123 = +[NSDate date];
      v124 = [v123 dateByAddingTimeInterval:-v15->_interval];
      if ([(NSDate *)v15->_baseTime compare:v124] == NSOrderedAscending) {
        objc_storeStrong((id *)&v15->_baseTime, v124);
      }
    }
    v15->_state = (int64_t)[v129 state];
  }
  else
  {
    [(_DASBGSystemTask *)v15 loadBaseTime];
  }
  objc_storeStrong((id *)&v15->_descriptor, a3);
  v22 = v15;

LABEL_10:
  return v22;
}

- (BOOL)validateFeatureCodes:(id)a3 forToken:(unint64_t)a4
{
  id v4 = a3;
  id v5 = +[_DASPlistParser sharedInstance];
  id v6 = [v5 dictionaryForPlist:2];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = [*(id *)(*((void *)&v16 + 1) + 8 * i) stringValue:v16];
        long long v13 = [v6 objectForKey:v12];

        if (!v13)
        {
          BOOL v14 = 0;
          goto LABEL_11;
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  BOOL v14 = 1;
LABEL_11:

  return v14;
}

- (void)updateFeatureCodesForActivity:(id)a3
{
  id v4 = a3;
  if (self->_featureCodes)
  {
    id v5 = +[_DASPlistParser sharedInstance];
    id v6 = [v5 dictionaryForPlist:0];

    id v7 = [v6 objectForKeyedSubscript:v4];
    id v8 = v7;
    if (!v7)
    {
      if (os_log_type_enabled((os_log_t)qword_1001C4028, OS_LOG_TYPE_ERROR)) {
        sub_1000F7630();
      }
      goto LABEL_20;
    }
    id v9 = [v7 objectForKeyedSubscript:@"FeatureCodes"];
    id v10 = [(NSArray *)self->_featureCodes mutableCopy];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v11 = v9;
    id v12 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
    long long v13 = v11;
    if (v12)
    {
      id v14 = v12;
      v22 = v6;
      char v15 = 0;
      uint64_t v16 = *(void *)v24;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v24 != v16) {
            objc_enumerationMutation(v11);
          }
          uint64_t v18 = *(void *)(*((void *)&v23 + 1) + 8 * i);
          if (([v10 containsObject:v18] & 1) == 0)
          {
            [v10 addObject:v18];
            char v15 = 1;
          }
        }
        id v14 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v14);

      id v6 = v22;
      if ((v15 & 1) == 0) {
        goto LABEL_15;
      }
      long long v19 = self->_featureCodes;
      long long v13 = +[NSMutableSet setWithArray:v19];
      [v13 addObjectsFromArray:v10];
      v20 = [v13 allObjects];
      featureCodes = self->_featureCodes;
      self->_featureCodes = v20;
    }
LABEL_15:

LABEL_20:
    goto LABEL_21;
  }
  if (os_log_type_enabled((os_log_t)qword_1001C4028, OS_LOG_TYPE_ERROR)) {
    sub_1000F75C8();
  }
LABEL_21:
}

- (BOOL)validateFastPassSubmissionForActivity:(id)a3 featureCodes:(id)a4 service:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = +[_DASPlistParser sharedInstance];
  id v11 = [v10 dictionaryForPlist:0];

  id v12 = [v11 objectForKeyedSubscript:v7];
  long long v13 = v12;
  if (!v12)
  {
    if (os_log_type_enabled((os_log_t)qword_1001C4028, OS_LOG_TYPE_ERROR)) {
      sub_1000F7630();
    }
    goto LABEL_16;
  }
  id v14 = [v12 objectForKeyedSubscript:@"Service"];
  unsigned __int8 v15 = [v9 isEqualToString:v14];

  if ((v15 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)qword_1001C4028, OS_LOG_TYPE_ERROR)) {
      sub_1000F774C();
    }
LABEL_16:
    BOOL v23 = 0;
    goto LABEL_23;
  }
  uint64_t v16 = [v13 objectForKeyedSubscript:@"FeatureCodes"];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v17 = v8;
  id v18 = [v17 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v18)
  {
    id v19 = v18;
    id v26 = v8;
    uint64_t v20 = *(void *)v28;
    while (2)
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v28 != v20) {
          objc_enumerationMutation(v17);
        }
        v22 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        if (([v16 containsObject:v22] & 1) == 0)
        {
          long long v24 = (void *)qword_1001C4028;
          if (os_log_type_enabled((os_log_t)qword_1001C4028, OS_LOG_TYPE_ERROR)) {
            sub_1000F7698(v24, v22, (uint64_t)v7);
          }
          BOOL v23 = 0;
          goto LABEL_20;
        }
      }
      id v19 = [v17 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v19) {
        continue;
      }
      break;
    }
    BOOL v23 = 1;
LABEL_20:
    id v8 = v26;
  }
  else
  {
    BOOL v23 = 1;
  }

LABEL_23:
  return v23;
}

+ (id)taskNameWithIdentifier:(id)a3 UID:(unsigned int)a4
{
  id v4 = a3;

  return v4;
}

- (NSString)name
{
  uint64_t v3 = objc_opt_class();
  identifier = self->_identifier;
  uint64_t uid = self->_uid;

  return (NSString *)[v3 taskNameWithIdentifier:identifier UID:uid];
}

+ (BOOL)hasFastPassRun:(id)a3 semanticVersion:(int64_t)a4
{
  id v5 = a3;
  if (qword_1001C4048) {
    goto LABEL_2;
  }
  if (!sysctlbyname_get_data_np())
  {
    id v11 = +[NSString stringWithUTF8String:0];
    free(0);
    id v8 = [v11 componentsSeparatedByString:@"."];
    if ([v8 count])
    {
      id v6 = [v8 objectAtIndexedSubscript:0];
    }
    else
    {
      id v6 = &stru_100179948;
    }

    uint64_t v12 = [(id)qword_1001C4030 stringForKey:@"ProductRelease"];
    long long v13 = (void *)v12;
    if (v12) {
      id v14 = (__CFString *)v12;
    }
    else {
      id v14 = &stru_100179948;
    }
    unsigned __int8 v15 = v14;

    uint64_t v16 = qword_1001C4028;
    if (os_log_type_enabled((os_log_t)qword_1001C4028, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)uint64_t v20 = v6;
      *(_WORD *)&v20[8] = 2112;
      v21 = v15;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Product release: Current %@, Previous %@", buf, 0x16u);
    }
    id v17 = [(id)qword_1001C4030 integerForKey:@"DASFastPassSemanticVersion"];
    id v18 = qword_1001C4028;
    if (os_log_type_enabled((os_log_t)qword_1001C4028, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)uint64_t v20 = 1;
      *(_WORD *)&v20[4] = 1024;
      *(_DWORD *)&v20[6] = v17;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "DAS FastPass Semantic Version: Current %d, Previous %d", buf, 0xEu);
    }
    if (![(__CFString *)v15 isEqualToString:v6] || v17 != (id)1)
    {
      [(id)qword_1001C4030 removeObjectForKey:@"FastPassActivitiesRun"];
      [(id)qword_1001C4030 setObject:v6 forKey:@"ProductRelease"];
      [(id)qword_1001C4030 setInteger:1 forKey:@"DASFastPassSemanticVersion"];
      [(id)qword_1001C4030 synchronize];

      BOOL v9 = 0;
      goto LABEL_4;
    }

LABEL_2:
    id v6 = [(id)qword_1001C4030 dictionaryForKey:@"FastPassActivitiesRun"];
    id v7 = [(__CFString *)v6 objectForKey:v5];

    if (!v7)
    {
      BOOL v9 = 0;
      goto LABEL_8;
    }
    id v8 = [(__CFString *)v6 objectForKey:v5];
    BOOL v9 = (int)[v8 intValue] == a4;
LABEL_4:

LABEL_8:
    goto LABEL_9;
  }
  BOOL v9 = 1;
LABEL_9:

  return v9;
}

+ (void)markFastPassActivityDone:(id)a3 semanticVersion:(int64_t)a4
{
  id v5 = (void *)qword_1001C4030;
  id v6 = a3;
  id v7 = [v5 dictionaryForKey:@"FastPassActivitiesRun"];
  id v11 = v7;
  if (v7)
  {
    id v8 = [v7 mutableCopy];
  }
  else
  {
    id v8 = +[NSMutableDictionary dictionary];
  }
  BOOL v9 = v8;
  id v10 = +[NSNumber numberWithInteger:a4];
  [v9 setValue:v10 forKey:v6];

  [(id)qword_1001C4030 setObject:v9 forKey:@"FastPassActivitiesRun"];
  [(id)qword_1001C4030 synchronize];
}

+ (BOOL)resetFastPass:(id)a3 resetAll:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = [(id)qword_1001C4030 dictionaryForKey:@"FastPassActivitiesRun"];
  id v7 = v6;
  if (v6)
  {
    id v8 = [v6 mutableCopy];
  }
  else
  {
    id v8 = +[NSMutableDictionary dictionary];
  }
  BOOL v9 = v8;
  if (v4)
  {
    [v8 removeAllObjects];
    id v11 = +[_DASFeatureDurationTracker sharedInstance];
    [v11 resetFeatureDurations];

    id v10 = +[_DASActivityDependencyManager sharedInstance];
    [v10 resetFastPassDependencies];
    LOBYTE(v11) = 1;
  }
  else
  {
    uint64_t v12 = [v8 objectForKey:v5];
    LODWORD(v11) = v12 != 0;

    if (v12) {
      [v9 removeObjectForKey:v5];
    }
    [v9 removeObjectForKey:v5];
    id v10 = +[_DASActivityDependencyManager sharedInstance];
    [v10 resetFastPassDependenciesForActivity:v5];
  }

  [(id)qword_1001C4030 setObject:v9 forKey:@"FastPassActivitiesRun"];
  [(id)qword_1001C4030 synchronize];

  return (char)v11;
}

+ (id)allFastPassIdentifiers
{
  v2 = +[_DASPlistParser sharedInstance];
  uint64_t v3 = [v2 dictionaryForPlist:0];

  BOOL v4 = [v3 allKeys];
  id v5 = +[NSSet setWithArray:v4];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = +[NSSet set];
  }
  id v8 = v7;

  return v8;
}

- (id)stateString
{
  unint64_t state = self->_state;
  if (state > 8) {
    return &stru_100179948;
  }
  else {
    return *(&off_1001768A8 + state);
  }
}

- (id)aboutMe
{
  uint64_t v3 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  id v4 = [v3 mutableCopy];

  id v5 = +[NSMutableDictionary dictionary];
  if (v4)
  {
    uint64_t v6 = _DASResourcesKey;
    id v7 = [v4 objectForKeyedSubscript:_DASResourcesKey];

    if (v7)
    {
      id v8 = objc_opt_class();
      BOOL v9 = [v4 objectForKeyedSubscript:v6];
      id v10 = [v8 resourcesDescriptionFromBitmap:[v9 integerValue]];
      [v4 setObject:v10 forKeyedSubscript:v6];
    }
    id v11 = +[NSMutableDictionary dictionaryWithDictionary:v4];
    [v5 setObject:v11 forKeyedSubscript:@"Criteria"];
    uint64_t v12 = [(_DASBGSystemTask *)self name];
    [v5 setObject:v12 forKeyedSubscript:@"ActivityName"];

    long long v13 = +[NSMutableDictionary dictionary];
    id v14 = objc_alloc_init((Class)NSDateFormatter);
    [v14 setDateFormat:@"yyyy-MM-dd HH:mm:ss ZZZZ"];
    unsigned __int8 v15 = +[NSLocale currentLocale];
    [v14 setLocale:v15];

    if (self->_type == 2)
    {
      uint64_t v16 = [v14 stringFromDate:self->_baseTime];
      [v13 setObject:v16 forKeyedSubscript:@"BaseTime"];
    }
    id v17 = [(_DASBGSystemTask *)self scheduler_activity];
    id v18 = [v17 startAfter];
    id v19 = [v14 stringFromDate:v18];
    [v13 setObject:v19 forKeyedSubscript:@"ScheduleAfter"];

    uint64_t v20 = [(_DASBGSystemTask *)self scheduler_activity];
    v21 = [v20 startBefore];
    v22 = [v14 stringFromDate:v21];
    [v13 setObject:v22 forKeyedSubscript:@"ScheduleBefore"];

    [v5 setObject:v13 forKeyedSubscript:@"Timings"];
    BOOL v23 = [(_DASBGSystemTask *)self stateString];
    [v5 setObject:v23 forKeyedSubscript:@"State"];
  }

  return v5;
}

- (id)resourcesDescription
{
  uint64_t v3 = objc_opt_class();
  int64_t v4 = [(_DASBGSystemTask *)self resources];

  return [v3 resourcesDescriptionFromBitmap:v4];
}

+ (id)resourcesDescriptionFromBitmap:(int64_t)a3
{
  char v3 = a3;
  int64_t v4 = +[NSMutableArray array];
  id v5 = v4;
  if (v3)
  {
    [v4 addObject:@"CPU"];
    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((v3 & 2) == 0)
  {
    goto LABEL_3;
  }
  [v5 addObject:@"Memory"];
  if ((v3 & 4) == 0)
  {
LABEL_4:
    if ((v3 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  [v5 addObject:@"Disk"];
  if ((v3 & 8) == 0)
  {
LABEL_5:
    if ((v3 & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  [v5 addObject:@"ANE"];
  if ((v3 & 0x10) != 0) {
LABEL_6:
  }
    [v5 addObject:@"GPU"];
LABEL_7:
  uint64_t v6 = [v5 componentsJoinedByString:@", "];

  return v6;
}

- (BOOL)hasInstallActivityRun
{
  v2 = [(_DASBGSystemTask *)self name];
  if (!qword_1001C4050)
  {
    if (sysctlbyname_get_data_np())
    {
      unsigned __int8 v4 = 1;
      goto LABEL_5;
    }
    uint64_t v6 = +[NSString stringWithUTF8String:0];
    free(0);
    id v7 = [(id)qword_1001C4030 stringForKey:@"ProductBuildVersion"];
    if (([v7 isEqualToString:v6] & 1) == 0)
    {
      [(id)qword_1001C4030 removeObjectForKey:@"VersionSpecificActivitiesRun"];
      [(id)qword_1001C4030 setObject:v6 forKey:@"ProductBuildVersion"];
    }
  }
  char v3 = [(id)qword_1001C4030 arrayForKey:@"VersionSpecificActivitiesRun"];
  unsigned __int8 v4 = [v3 containsObject:v2];

LABEL_5:
  return v4;
}

- (void)markInstallActivityDone
{
  char v3 = [(id)qword_1001C4030 arrayForKey:@"VersionSpecificActivitiesRun"];
  id v7 = v3;
  if (v3) {
    id v4 = [v3 mutableCopy];
  }
  else {
    id v4 = [objc_alloc((Class)NSMutableArray) initWithCapacity:1];
  }
  id v5 = v4;
  uint64_t v6 = [(_DASBGSystemTask *)self name];
  [v5 addObject:v6];

  [(id)qword_1001C4030 setObject:v5 forKey:@"VersionSpecificActivitiesRun"];
}

- (double)initialDelay
{
  double random_initial_delay = self->_random_initial_delay;
  if (random_initial_delay == 0.0) {
    return 0.0;
  }
  else {
    return (double)arc4random_uniform(random_initial_delay);
  }
}

- (void)saveActivityBaseTime:(id)a3
{
  if (a3)
  {
    id v4 = (void *)qword_1001C4038;
    id v5 = a3;
    uint64_t v6 = [(_DASBGSystemTask *)self name];
    [v4 setValue:v5 forKey:v6];
  }
  id v7 = (void *)qword_1001C4030;
  uint64_t v8 = qword_1001C4038;

  [v7 setObject:v8 forKey:@"ActivityBaseDates"];
}

- (id)getActivityBaseTime
{
  char v3 = (void *)qword_1001C4038;
  id v4 = [(_DASBGSystemTask *)self name];
  id v5 = [v3 valueForKey:v4];

  uint64_t v6 = +[NSDate date];
  id v7 = [v6 dateByAddingTimeInterval:-4838400.0];
  if (!v5 || [v5 compare:v7] == (id)-1 || objc_msgSend(v5, "compare:", v6) == (id)1)
  {
    [(_DASBGSystemTask *)self initialDelay];
    [v6 dateByAddingTimeInterval:];
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    [(_DASBGSystemTask *)self saveActivityBaseTime:v8];
  }
  else
  {
    id v8 = v5;
  }

  return v8;
}

- (void)loadBaseTime
{
  id v8 = +[NSDate date];
  if (self->_type == 2)
  {
    uint64_t v3 = [(_DASBGSystemTask *)self getActivityBaseTime];
    baseTime = self->_baseTime;
    p_baseTime = (id *)&self->_baseTime;
    id *p_baseTime = (id)v3;

    uint64_t v6 = [v8 dateByAddingTimeInterval:-*((double *)p_baseTime - 7)];
    if ([*p_baseTime compare:v6] == (id)-1) {
      objc_storeStrong(p_baseTime, v6);
    }
  }
  else
  {
    [(_DASBGSystemTask *)self initialDelay];
    [v8 dateByAddingTimeInterval:];
    id v7 = (NSDate *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = self->_baseTime;
    self->_baseTime = v7;
  }
}

- (void)advanceBaseTime
{
  uint64_t v3 = +[NSDate date];
  if (self->_type != 2)
  {
    objc_storeStrong((id *)&self->_baseTime, v3);
    self->_tempDelay = 0.0;
    goto LABEL_19;
  }
  id v4 = [(NSDate *)self->_baseTime dateByAddingTimeInterval:self->_interval];
  id v5 = [(NSDate *)v3 dateByAddingTimeInterval:self->_interval * -2.0];
  uint64_t v6 = [(NSDate *)v3 dateByAddingTimeInterval:self->_interval + self->_interval];
  if ([(NSDate *)v4 compare:v5] == NSOrderedAscending)
  {
    id v7 = v5;

    uint64_t v12 = (void *)qword_1001C4028;
    if (os_log_type_enabled((os_log_t)qword_1001C4028, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v9 = v12;
      id v10 = [(_DASBGSystemTask *)self name];
      *(_DWORD *)long long v24 = 138543362;
      *(void *)&v24[4] = v10;
      id v11 = "Base Time is earlier than 2 * interval ago, moving forward for %{public}@";
      goto LABEL_9;
    }
  }
  else
  {
    if ((id)[(NSDate *)v4 compare:v6] != (id)1)
    {
      id v7 = v4;
      goto LABEL_11;
    }
    id v7 = v6;

    id v8 = (void *)qword_1001C4028;
    if (os_log_type_enabled((os_log_t)qword_1001C4028, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v9 = v8;
      id v10 = [(_DASBGSystemTask *)self name];
      *(_DWORD *)long long v24 = 138543362;
      *(void *)&v24[4] = v10;
      id v11 = "Base Time is later than 2 * interval from now, moving back for %{public}@";
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v11, v24, 0xCu);
    }
  }
LABEL_11:
  startTime = self->_startTime;
  if (!startTime) {
    startTime = v3;
  }
  id v14 = startTime;
  unsigned __int8 v15 = v14;
  double v16 = 0.0;
  if (self->_minDurationBetweenInstances != 0.0 && (id)[(NSDate *)v14 compare:v7] == (id)1)
  {
    id v17 = [(NSDate *)v15 dateByAddingTimeInterval:self->_minDurationBetweenInstances];
    [v17 timeIntervalSinceDate:v7];
    double v16 = v18;
    id v19 = (void *)qword_1001C4028;
    if (os_log_type_enabled((os_log_t)qword_1001C4028, OS_LOG_TYPE_INFO))
    {
      uint64_t v20 = v19;
      v21 = [(_DASBGSystemTask *)self name];
      *(_DWORD *)long long v24 = 134218242;
      *(void *)&v24[4] = (uint64_t)v16;
      *(_WORD *)&v24[12] = 2114;
      *(void *)&v24[14] = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Using temporary delay of %lld seconds to account for late fire of %{public}@", v24, 0x16u);
    }
  }
  -[_DASBGSystemTask saveActivityBaseTime:](self, "saveActivityBaseTime:", v7, *(_OWORD *)v24);
  baseTime = self->_baseTime;
  self->_baseTime = v7;
  BOOL v23 = v7;

  self->_tempDelay = v16;
LABEL_19:
}

- (void)resetBaseTime
{
  uint64_t v3 = +[NSDate date];
  [(_DASBGSystemTask *)self saveActivityBaseTime:v3];
  baseTime = self->_baseTime;
  self->_baseTime = v3;
  uint64_t v6 = v3;

  startTime = self->_startTime;
  self->_startTime = 0;
}

- (id)eligibleTime
{
  if (self->_type == 2)
  {
    double tempDelay = self->_tempDelay;
    if (tempDelay == 0.0) {
      double tempDelay = self->_minDurationBetweenInstances;
    }
    baseTime = self->_baseTime;
  }
  else
  {
    double tempDelay = self->_startAfter;
    baseTime = self->_baseTime;
  }
  id v4 = [(NSDate *)baseTime dateByAddingTimeInterval:tempDelay];

  return v4;
}

- (void)adjustBaseTimeByOffset:(double)a3
{
  self->_baseTime = [(NSDate *)self->_baseTime dateByAddingTimeInterval:a3];

  _objc_release_x1();
}

- (id)deadlineTime
{
  uint64_t v3 = [(_DASBGSystemTask *)self eligibleTime];
  uint64_t v4 = 120;
  if (self->_type == 2) {
    uint64_t v4 = 96;
  }
  id v5 = [(NSDate *)self->_baseTime dateByAddingTimeInterval:*(double *)((char *)&self->super.isa + v4)];
  if ([v5 compare:v3] == (id)1) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = v3;
  }
  id v7 = v6;

  return v7;
}

- (void)markStarted:(id)a3
{
}

- (void)markStopped:(id)a3
{
  self->_startTime = 0;
  _objc_release_x1();
}

- (id)description
{
  uint64_t v3 = [(_DASBGSystemTask *)self name];
  uint64_t v4 = +[NSString stringWithFormat:@"%@ (%p)", v3, self];

  return v4;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_unint64_t state = a3;
}

- (unint64_t)token
{
  return self->_token;
}

- (OS_xpc_object)descriptor
{
  return self->_descriptor;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (int64_t)type
{
  return self->_type;
}

- (double)interval
{
  return self->_interval;
}

- (double)minDurationBetweenInstances
{
  return self->_minDurationBetweenInstances;
}

- (double)startAfter
{
  return self->_startAfter;
}

- (double)trySchedulingBefore
{
  return self->_trySchedulingBefore;
}

- (double)expected_duration
{
  return self->_expected_duration;
}

- (double)random_initial_delay
{
  return self->_random_initial_delay;
}

- (double)tempDelay
{
  return self->_tempDelay;
}

- (NSDate)baseTime
{
  return self->_baseTime;
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (_DASActivity)scheduler_activity
{
  return self->_scheduler_activity;
}

- (void)setScheduler_activity:(id)a3
{
}

- (unint64_t)suspensionReason
{
  return self->_suspensionReason;
}

- (void)setSuspensionReason:(unint64_t)a3
{
  self->_suspensionReason = a3;
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (unsigned)uid
{
  return self->_uid;
}

- (NSArray)related_applications
{
  return self->_related_applications;
}

- (NSArray)involved_processes
{
  return self->_involved_processes;
}

- (BOOL)runOnAppForeground
{
  return self->_runOnAppForeground;
}

- (BOOL)requestsApplicationLaunch
{
  return self->_requestsApplicationLaunch;
}

- (BOOL)beforeApplicationLaunch
{
  return self->_beforeApplicationLaunch;
}

- (int64_t)priority
{
  return self->_priority;
}

- (int64_t)requires_protection_class
{
  return self->_requires_protection_class;
}

- (BOOL)repeating
{
  return self->_repeating;
}

- (BOOL)requires_significant_user_inactivity
{
  return self->_requires_significant_user_inactivity;
}

- (BOOL)requiresUserInactivity
{
  return self->_requiresUserInactivity;
}

- (BOOL)requiresExternalPower
{
  return self->_requiresExternalPower;
}

- (BOOL)power_nap
{
  return self->_power_nap;
}

- (BOOL)app_refresh
{
  return self->_app_refresh;
}

- (BOOL)resource_intensive
{
  return self->_resource_intensive;
}

- (int64_t)resources
{
  return self->_resources;
}

- (BOOL)may_reboot_device
{
  return self->_may_reboot_device;
}

- (BOOL)post_install
{
  return self->_post_install;
}

- (BOOL)user_requested_backup_task
{
  return self->_user_requested_backup_task;
}

- (BOOL)requires_buddy_complete
{
  return self->_requires_buddy_complete;
}

- (BOOL)prevents_device_sleep
{
  return self->_prevents_device_sleep;
}

- (BOOL)requires_network_connectivity
{
  return self->_requires_network_connectivity;
}

- (BOOL)requires_inexpensive_network
{
  return self->_requires_inexpensive_network;
}

- (BOOL)requires_unconstrained_network
{
  return self->_requires_unconstrained_network;
}

- (int64_t)expected_network_download_size_bytes
{
  return self->_expected_network_download_size_bytes;
}

- (int64_t)expected_network_upload_size_bytes
{
  return self->_expected_network_upload_size_bytes;
}

- (OS_nw_endpoint)network_endpoint
{
  return self->_network_endpoint;
}

- (OS_nw_parameters)network_parameters
{
  return self->_network_parameters;
}

- (BOOL)communicates_with_paired_device
{
  return self->_communicates_with_paired_device;
}

- (int64_t)run_on_motion_state
{
  return self->_run_on_motion_state;
}

- (BOOL)shouldWakeDevice
{
  return self->_shouldWakeDevice;
}

- (BOOL)duet_power_budgeted
{
  return self->_duet_power_budgeted;
}

- (BOOL)data_budgeted
{
  return self->_data_budgeted;
}

- (NSString)dataBudgetName
{
  return self->_dataBudgetName;
}

- (NSString)rateLimitConfigurationName
{
  return self->_rateLimitConfigurationName;
}

- (NSString)group_name
{
  return self->_group_name;
}

- (unint64_t)group_concurrency_limit
{
  return self->_group_concurrency_limit;
}

- (BOOL)overrideRateLimiting
{
  return self->_overrideRateLimiting;
}

- (void)setOverrideRateLimiting:(BOOL)a3
{
  self->_overrideRateLimiting = a3;
}

- (BOOL)magneticInterferenceSensitivity
{
  return self->_magneticInterferenceSensitivity;
}

- (void)setMagneticInterferenceSensitivity:(BOOL)a3
{
  self->_magneticInterferenceSensitivity = a3;
}

- (BOOL)mailFetch
{
  return self->_mailFetch;
}

- (void)setMailFetch:(BOOL)a3
{
  self->_mailFetch = a3;
}

- (BOOL)bypassBatteryAging
{
  return self->_bypassBatteryAging;
}

- (void)setBypassBatteryAging:(BOOL)a3
{
  self->_bypassBatteryAging = a3;
}

- (BOOL)bypassPeakPower
{
  return self->_bypassPeakPower;
}

- (void)setBypassPeakPower:(BOOL)a3
{
  self->_bypassPeakPower = a3;
}

- (BOOL)backlogged
{
  return self->_backlogged;
}

- (void)setBacklogged:(BOOL)a3
{
  self->_backlogged = a3;
}

- (BOOL)blockRebootActivitiesForSU
{
  return self->_blockRebootActivitiesForSU;
}

- (void)setBlockRebootActivitiesForSU:(BOOL)a3
{
  self->_blockRebootActivitiesForSU = a3;
}

- (BOOL)useStatisticalModelForTriggersRestart
{
  return self->_useStatisticalModelForTriggersRestart;
}

- (void)setUseStatisticalModelForTriggersRestart:(BOOL)a3
{
  self->_useStatisticalModelForTriggersRestart = a3;
}

- (unint64_t)requiresMinimumBatteryLevel
{
  return self->_requiresMinimumBatteryLevel;
}

- (void)setRequiresMinimumBatteryLevel:(unint64_t)a3
{
  self->_requiresMinimumBatteryLevel = a3;
}

- (unint64_t)requiresMinimumDataBudgetPercentage
{
  return self->_requiresMinimumDataBudgetPercentage;
}

- (void)setRequiresMinimumDataBudgetPercentage:(unint64_t)a3
{
  self->_requiresMinimumDataBudgetPercentage = a3;
}

- (OS_dispatch_source)dispatchSourceProcessExit
{
  return self->_dispatchSourceProcessExit;
}

- (void)setDispatchSourceProcessExit:(id)a3
{
}

- (NSSet)produced_result_identifiers
{
  return self->_produced_result_identifiers;
}

- (NSSet)dependencies
{
  return self->_dependencies;
}

- (NSArray)processingTaskIdentifiers
{
  return self->_processingTaskIdentifiers;
}

- (void)setProcessingTaskIdentifiers:(id)a3
{
}

- (int64_t)semanticVersion
{
  return self->_semanticVersion;
}

- (void)setSemanticVersion:(int64_t)a3
{
  self->_semanticVersion = a3;
}

- (BOOL)reRun
{
  return self->_reRun;
}

- (void)setReRun:(BOOL)a3
{
  self->_reRun = a3;
}

- (NSArray)featureCodes
{
  return self->_featureCodes;
}

- (void)setFeatureCodes:(id)a3
{
}

- (NSString)diskVolume
{
  return self->_diskVolume;
}

- (NSString)remoteDevice
{
  return self->_remoteDevice;
}

- (int64_t)targetDevice
{
  return self->_targetDevice;
}

- (BOOL)requiresRemoteDeviceWake
{
  return self->_requiresRemoteDeviceWake;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteDevice, 0);
  objc_storeStrong((id *)&self->_diskVolume, 0);
  objc_storeStrong((id *)&self->_featureCodes, 0);
  objc_storeStrong((id *)&self->_processingTaskIdentifiers, 0);
  objc_storeStrong((id *)&self->_dependencies, 0);
  objc_storeStrong((id *)&self->_produced_result_identifiers, 0);
  objc_storeStrong((id *)&self->_dispatchSourceProcessExit, 0);
  objc_storeStrong((id *)&self->_group_name, 0);
  objc_storeStrong((id *)&self->_rateLimitConfigurationName, 0);
  objc_storeStrong((id *)&self->_dataBudgetName, 0);
  objc_storeStrong((id *)&self->_network_parameters, 0);
  objc_storeStrong((id *)&self->_network_endpoint, 0);
  objc_storeStrong((id *)&self->_involved_processes, 0);
  objc_storeStrong((id *)&self->_related_applications, 0);
  objc_storeStrong((id *)&self->_scheduler_activity, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_baseTime, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_descriptor, 0);
}

@end