@interface _DASActivity
+ (_DASActivity)activityWithCTSActivity:(id)a3;
- (void)linkToCTSActivity:(id)a3;
@end

@implementation _DASActivity

- (void)linkToCTSActivity:(id)a3
{
  id v4 = a3;
  id location = 0;
  objc_initWeak(&location, v4);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_6440;
  v7[3] = &unk_10860;
  objc_copyWeak(&v8, &location);
  [(_DASActivity *)self setStartHandler:v7];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_65C4;
  v5[3] = &unk_10860;
  objc_copyWeak(&v6, &location);
  [(_DASActivity *)self setSuspendHandler:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

+ (_DASActivity)activityWithCTSActivity:(id)a3
{
  id v3 = a3;
  unsigned int v4 = [v3 priority];
  v5 = (uint64_t *)&_DASSchedulingPriorityUtility;
  if (v4 != 1) {
    v5 = (uint64_t *)&_DASSchedulingPriorityMaintenance;
  }
  uint64_t v6 = *v5;
  sub_3E78((uint64_t)[v3 eligibleTime]);
  v7 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
  sub_3E78((uint64_t)[v3 deadlineTime]);
  id v8 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
  v9 = [v3 name];
  v10 = +[_DASActivity activityWithName:priority:duration:startingAfter:startingBefore:](_DASActivity, "activityWithName:priority:duration:startingAfter:startingBefore:", v9, v6, objc_msgSend(v3, "expected_duration"), v7, v8);
  v11 = [v3 serviceName];
  [v10 setServiceName:v11];

  v12 = objc_msgSend(v3, "bundle_id");
  [v10 setBundleId:v12];

  v13 = objc_msgSend(v3, "related_applications");
  [v10 setRelatedApplications:v13];

  v14 = objc_msgSend(v3, "involved_processes");
  [v10 setInvolvedProcesses:v14];

  objc_msgSend(v10, "setRunOnAppForeground:", objc_msgSend(v3, "runOnAppForeground"));
  objc_msgSend(v10, "setBudgeted:", objc_msgSend(v3, "duet_power_budgeted"));
  objc_msgSend(v10, "setDataBudgeted:", objc_msgSend(v3, "data_budgeted"));
  if ([v3 repeating]) {
    objc_msgSend(v10, "setInterval:", (double)(uint64_t)objc_msgSend(v3, "interval"));
  }
  if (objc_msgSend(v3, "requires_protection_class") == 1)
  {
    uint64_t v15 = +[_DASFileProtection complete];
  }
  else if (objc_msgSend(v3, "requires_protection_class") == 2)
  {
    uint64_t v15 = +[_DASFileProtection completeUnlessOpen];
  }
  else
  {
    if (objc_msgSend(v3, "requires_protection_class") != 3) {
      goto LABEL_12;
    }
    uint64_t v15 = +[_DASFileProtection completeUntilFirstUserAuthentication];
  }
  v16 = (void *)v15;
  [v10 setFileProtection:v15];

LABEL_12:
  objc_msgSend(v10, "setRequiresBuddyComplete:", objc_msgSend(v3, "requires_buddy_complete"));
  if (objc_msgSend(v3, "schedule_rtc_wake")) {
    [v10 setSchedulingPriority:_DASSchedulingPriorityDefault];
  }
  objc_msgSend(v10, "setDarkWakeEligible:", objc_msgSend(v3, "power_nap"));
  objc_msgSend(v10, "setBeforeDaysFirstActivity:", objc_msgSend(v3, "app_refresh"));
  objc_msgSend(v10, "setRequiresDeviceInactivity:", objc_msgSend(v3, "requires_screen_sleep"));
  objc_msgSend(v10, "setRequiresSignificantUserInactivity:", objc_msgSend(v3, "requires_significant_user_inactivity"));
  objc_msgSend(v10, "setPreventDeviceSleep:", objc_msgSend(v3, "prevents_device_sleep"));
  objc_msgSend(v10, "setRequiresPlugin:", objc_msgSend(v3, "allow_battery") ^ 1);
  objc_msgSend(v10, "setTriggersRestart:", objc_msgSend(v3, "may_reboot_device"));
  objc_msgSend(v10, "setMemoryIntensive:", objc_msgSend(v3, "memory_intensive"));
  objc_msgSend(v10, "setCpuIntensive:", objc_msgSend(v3, "cpu_intensive"));
  objc_msgSend(v10, "setDiskIntensive:", objc_msgSend(v3, "disk_intensive"));
  objc_msgSend(v10, "setRequiresNetwork:", objc_msgSend(v3, "requires_network_connectivity"));
  objc_msgSend(v10, "setRequiresInexpensiveNetworking:", objc_msgSend(v3, "requires_inexpensive_network"));
  if (objc_msgSend(v3, "expected_network_download_size_bytes")) {
    objc_msgSend(v10, "setDownloadSize:", (uint64_t)objc_msgSend(v3, "expected_network_download_size_bytes") / 1024);
  }
  if (objc_msgSend(v3, "expected_network_upload_size_bytes")) {
    objc_msgSend(v10, "setUploadSize:", (uint64_t)objc_msgSend(v3, "expected_network_upload_size_bytes") / 1024);
  }
  v17 = objc_msgSend(v3, "network_endpoint");

  if (v17)
  {
    id v18 = objc_alloc_init((Class)NSMutableDictionary);
    v19 = objc_msgSend(v3, "network_endpoint");
    v20 = +[NWEndpoint endpointWithCEndpoint:v19];
    [v18 setObject:v20 forKeyedSubscript:kNWEndpointKey];

    v21 = objc_msgSend(v3, "network_parameters");

    if (v21)
    {
      v22 = objc_msgSend(v3, "network_parameters");
      v23 = +[NWParameters parametersWithCParameters:v22];
      [v18 setObject:v23 forKeyedSubscript:kNWParametersKey];
    }
    [v10 setUserInfo:v18];
  }
  objc_msgSend(v10, "setUserRequestedBackupTask:", objc_msgSend(v3, "user_requested_backup_task"));
  if (objc_msgSend(v3, "communicates_with_paired_device")) {
    [v10 setTargetDevice:1];
  }
  id v24 = objc_msgSend(v3, "desired_motion_state");
  if (v24 == (id)XPC_ACTIVITY_MOTION_STATE_STATIONARY)
  {
    v31 = &_DASMotionStateStationary;
  }
  else
  {
    id v25 = objc_msgSend(v3, "desired_motion_state");
    if (v25 == (id)XPC_ACTIVITY_MOTION_STATE_WALKING)
    {
      v31 = &_DASMotionStateWalking;
    }
    else
    {
      id v26 = objc_msgSend(v3, "desired_motion_state");
      if (v26 == (id)XPC_ACTIVITY_MOTION_STATE_RUNNING)
      {
        v31 = &_DASMotionStateRunning;
      }
      else
      {
        id v27 = objc_msgSend(v3, "desired_motion_state");
        if (v27 == (id)XPC_ACTIVITY_MOTION_STATE_CYCLING)
        {
          v31 = &_DASMotionStateCycling;
        }
        else
        {
          id v28 = objc_msgSend(v3, "desired_motion_state");
          if (v28 == (id)XPC_ACTIVITY_MOTION_STATE_AUTOMOTIVE)
          {
            v31 = &_DASMotionStateAutomotive;
          }
          else
          {
            id v29 = objc_msgSend(v3, "desired_motion_state");
            if (v29 == (id)XPC_ACTIVITY_MOTION_STATE_AUTOMOTIVE_MOVING)
            {
              v31 = &_DASMotionStateAutomotiveMoving;
            }
            else
            {
              id v30 = objc_msgSend(v3, "desired_motion_state");
              if (v30 != (id)XPC_ACTIVITY_MOTION_STATE_AUTOMOTIVE_STATIONARY) {
                goto LABEL_39;
              }
              v31 = &_DASMotionStateAutomotiveStationary;
            }
          }
        }
      }
    }
  }
  [v10 setMotionState:*v31];
LABEL_39:
  v32 = objc_msgSend(v3, "das_data");

  if (v32)
  {
    v33 = objc_msgSend(v3, "das_data");
    [v10 setConstraintsWithXPCDictionary:v33];
  }
  [v10 setHandlerQueue:qword_15468];
  [v10 setDelayedStart:1];
  [v10 linkToCTSActivity:v3];
  objc_msgSend(v3, "setDas_eligible:", 0);
  objc_msgSend(v3, "setDas_started:", 0);

  return (_DASActivity *)v10;
}

@end