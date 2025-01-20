@interface _DASActivityRecorder
+ (id)predicateForActivityWithName:(id)a3;
+ (id)predicateForActivityWithSubmitDate:(id)a3;
+ (id)predicateForLaunchActivities;
+ (id)predicateForPendingActivities;
+ (id)predicateForStartedActivities;
+ (id)predicateForUniqueRecord:(id)a3;
- (id)createNewActivity:(id)a3;
- (id)createOrUpdateActivity:(id)a3 context:(id)a4;
- (id)entityName;
- (id)fetchActivitiesUsingPredicate:(id)a3 context:(id)a4;
- (id)fetchActivity:(id)a3 context:(id)a4;
- (id)fetchAllActivities:(id)a3;
- (id)getActivityFromManagedObject:(id)a3;
- (void)copyActivity:(id)a3 toManagedObject:(id)a4;
- (void)deleteActivites:(id)a3 moc:(id)a4;
- (void)deleteActivitiesIfRequired:(id)a3;
- (void)deleteActivity:(id)a3 context:(id)a4;
- (void)deleteOldActivities:(id)a3;
- (void)updateActivity:(id)a3 value:(int)a4 context:(id)a5;
- (void)updateActivityCanceled:(id)a3 context:(id)a4;
- (void)updateActivityCompleted:(id)a3 context:(id)a4;
- (void)updateActivityStarted:(id)a3 context:(id)a4;
@end

@implementation _DASActivityRecorder

- (id)entityName
{
  return @"Activity";
}

+ (id)predicateForActivityWithName:(id)a3
{
  return +[NSPredicate predicateWithFormat:@"name == %@", a3];
}

+ (id)predicateForActivityWithSubmitDate:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = [v3 dateByAddingTimeInterval:-2.0];
    v6 = [v4 dateByAddingTimeInterval:2.0];
    v7 = +[NSPredicate predicateWithFormat:@"submitDate > %@ AND submitDate < %@", v5, v6];
  }
  else
  {
    v7 = +[NSPredicate predicateWithValue:1];
  }

  return v7;
}

+ (id)predicateForUniqueRecord:(id)a3
{
  id v3 = a3;
  v4 = [v3 name];
  v5 = +[_DASActivityRecorder predicateForActivityWithName:v4];

  v6 = [v3 submitDate];

  v7 = +[_DASActivityRecorder predicateForActivityWithSubmitDate:v6];

  v11[0] = v7;
  v11[1] = v5;
  v8 = +[NSArray arrayWithObjects:v11 count:2];
  v9 = +[NSCompoundPredicate andPredicateWithSubpredicates:v8];

  return v9;
}

+ (id)predicateForPendingActivities
{
  return +[NSPredicate predicateWithFormat:@"currentState == %d", 0];
}

+ (id)predicateForStartedActivities
{
  return +[NSPredicate predicateWithFormat:@"currentState == %d", 1];
}

+ (id)predicateForLaunchActivities
{
  v2 = +[NSPredicate predicateWithFormat:@"requestsApplicationLaunch == %d", 1];
  id v3 = +[NSPredicate predicateWithFormat:@"requestsExtensionLaunch == %d", 1];
  v7[0] = v2;
  v7[1] = v3;
  v4 = +[NSArray arrayWithObjects:v7 count:2];
  v5 = +[NSCompoundPredicate orPredicateWithSubpredicates:v4];

  return v5;
}

- (id)createNewActivity:(id)a3
{
  id v4 = a3;
  v5 = [(_DASActivityRecorder *)self entityName];
  v6 = +[NSEntityDescription insertNewObjectForEntityForName:v5 inManagedObjectContext:v4];

  return v6;
}

- (id)createOrUpdateActivity:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v8 = objc_opt_new();
    v9 = [(_DASActivityRecorder *)self entityName];
    v10 = +[NSEntityDescription entityForName:v9 inManagedObjectContext:v7];
    [v8 setEntity:v10];

    v11 = +[_DASActivityRecorder predicateForUniqueRecord:v6];
    [v8 setPredicate:v11];

    uint64_t v15 = 0;
    v12 = [v7 executeFetchRequest:v8 error:&v15];
    v13 = [v12 lastObject];

    if (!v13)
    {
      v13 = [(_DASActivityRecorder *)self createNewActivity:v7];
    }
    [(_DASActivityRecorder *)self copyActivity:v6 toManagedObject:v13];
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)fetchActivitiesUsingPredicate:(id)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_opt_new();
  v9 = [(_DASActivityRecorder *)self entityName];
  v10 = +[NSEntityDescription entityForName:v9 inManagedObjectContext:v6];
  [v8 setEntity:v10];

  [v8 setPredicate:v7];
  [v8 setFetchBatchSize:512];
  [v8 setFetchLimit:512];
  uint64_t v13 = 0;
  v11 = [v6 executeFetchRequest:v8 error:&v13];

  return v11;
}

- (id)fetchActivity:(id)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = +[_DASActivityRecorder predicateForUniqueRecord:a3];
  v8 = [(_DASActivityRecorder *)self fetchActivitiesUsingPredicate:v7 context:v6];

  v9 = [v8 lastObject];

  return v9;
}

- (id)fetchAllActivities:(id)a3
{
  return [(_DASActivityRecorder *)self fetchActivitiesUsingPredicate:0 context:a3];
}

- (id)getActivityFromManagedObject:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  v5 = [v3 name];
  [v4 setName:v5];

  id v6 = [v3 startAfter];
  [v4 setStartAfter:v6];

  id v7 = [v3 startBefore];
  [v4 setStartBefore:v7];

  v8 = [v3 submitDate];
  [v4 setSubmitDate:v8];

  [v4 setSchedulingPriority:[v3 schedulingPriority]];
  [v3 predictedOptimalScore];
  [v4 setPredictedOptimalScore:];
  v9 = [v3 predictedOptimalStartDate];
  [v4 setPredictedOptimalStartDate:v9];

  [v4 setSuspendable:[v3 suspendable]];
  [v4 setTargetDevice:[v3 targetDevice]];
  v10 = [v3 remoteDevice];
  [v4 setRemoteDevice:v10];

  [v4 setRequiresRemoteDeviceWake:[v3 requiresRemoteDeviceWake]];
  [v4 setCancelAfterDeadline:[v3 cancelAfterDeadline]];
  [v4 setDuration:[v3 duration]];
  [v4 setTransferSize:[v3 transferSize]];
  [v4 setTriggersRestart:[v3 triggersRestart]];
  [v4 setRequiresPlugin:[v3 requiresPlugin]];
  [v4 setRequiresNetwork:[v3 requiresNetwork]];
  [v4 setRequiresDeviceInactivity:[v3 requiresDeviceInactivity]];
  [v4 setRequiresInexpensiveNetworking:[v3 requiresInexpensiveNetworking]];
  [v4 setRequestsApplicationLaunch:[v3 requestsApplicationLaunch]];
  [v4 setRequestsExtensionLaunch:[v3 requestsExtensionLaunch]];
  [v4 setSupportsAnyApplication:[v3 supportsAnyApplication]];
  [v4 setCpuIntensive:[v3 cpuIntensive]];
  [v4 setDiskIntensive:[v3 diskIntensive]];
  [v4 setMemoryIntensive:[v3 memoryIntensive]];
  [v4 setBeforeUserIsActive:[v3 beforeUserIsActive]];
  v11 = [v3 bundleID];
  [v4 setBundleId:v11];

  v12 = [v3 rateLimitConfigurationName];
  [v4 setRateLimitConfigurationName:v12];

  [v4 setIsUpload:[v3 isUpload]];
  [v4 setBudgeted:[v3 budgeted]];
  [v4 setRelevancy:[v3 relevancy]];
  uint64_t v13 = [v3 launchReason];
  [v4 setLaunchReason:v13];

  id v14 = objc_alloc((Class)NSUUID);
  id v15 = [v3 uuid];
  id v16 = [v14 initWithUUIDBytes:[v15 bytes]];
  [v4 setUuid:v16];

  v17 = [v3 extensionIdentifier];
  [v4 setExtensionIdentifier:v17];

  uint64_t v18 = objc_opt_class();
  v19 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v18, objc_opt_class(), 0);
  v20 = [v3 relatedApplications];

  if (v20)
  {
    v21 = [v3 relatedApplications];
    v22 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v19 fromData:v21 error:0];
    [v4 setRelatedApplications:v22];
  }
  v23 = [v3 schedulerRecommendedApplications];

  if (v23)
  {
    v24 = [v3 schedulerRecommendedApplications];
    v25 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v19 fromData:v24 error:0];
    [v4 setSchedulerRecommendedApplications:v25];
  }
  v26 = [v3 userInfo];

  if (v26)
  {
    v27 = +[_DASActivity validClassesForUserInfoSerialization];
    v28 = [v3 userInfo];
    v29 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v27 fromData:v28 error:0];
    [v4 setUserInfo:v29];
  }

  return v4;
}

- (void)copyActivity:(id)a3 toManagedObject:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 name];
  [v6 setName:v7];

  v8 = [v5 startAfter];
  [v6 setStartAfter:v8];

  v9 = [v5 startBefore];
  [v6 setStartBefore:v9];

  v10 = [v5 submitDate];
  [v6 setSubmitDate:v10];

  [v6 setSchedulingPriority:(__int16)[v5 schedulingPriority]];
  [v5 predictedOptimalScore];
  [v6 setPredictedOptimalScore:];
  v11 = [v5 predictedOptimalStartDate];
  [v6 setPredictedOptimalStartDate:v11];

  [v6 setSuspendable:[v5 suspendable]];
  [v6 setTargetDevice:(__int16)[v5 targetDevice]];
  v12 = [v5 remoteDevice];
  [v6 setRemoteDevice:v12];

  [v6 setRequiresRemoteDeviceWake:[v5 requiresRemoteDeviceWake]];
  [v6 setCancelAfterDeadline:[v5 cancelAfterDeadline]];
  [v6 setDuration:[v5 duration]];
  [v6 setTransferSize:[v5 transferSize]];
  [v6 setTriggersRestart:[v5 triggersRestart]];
  [v6 setRequiresPlugin:[v5 requiresPlugin]];
  [v6 setRequiresNetwork:[v5 requiresNetwork]];
  [v6 setRequiresDeviceInactivity:[v5 requiresDeviceInactivity]];
  [v6 setRequiresInexpensiveNetworking:[v5 requiresInexpensiveNetworking]];
  [v6 setRequestsApplicationLaunch:[v5 requestsApplicationLaunch]];
  [v6 setRequestsExtensionLaunch:[v5 requestsExtensionLaunch]];
  [v6 setSupportsAnyApplication:[v5 supportsAnyApplication]];
  [v6 setCpuIntensive:[v5 cpuIntensive]];
  [v6 setDiskIntensive:[v5 diskIntensive]];
  [v6 setMemoryIntensive:[v5 memoryIntensive]];
  [v6 setBeforeUserIsActive:[v5 beforeUserIsActive]];
  uint64_t v13 = [v5 bundleId];
  [v6 setBundleID:v13];

  id v14 = [v5 rateLimitConfigurationName];
  [v6 setRateLimitConfigurationName:v14];

  [v6 setIsUpload:[v5 isUpload]];
  [v6 setBudgeted:[v5 budgeted]];
  [v6 setRelevancy:[v5 relevancy]];
  id v15 = [v5 launchReason];
  [v6 setLaunchReason:v15];

  [v6 setCurrentState:0];
  id v16 = [v5 extensionIdentifier];
  [v6 setExtensionIdentifier:v16];

  v28[0] = 0;
  v28[1] = 0;
  v17 = [v5 uuid];
  [v17 getUUIDBytes:v28];

  uint64_t v18 = +[NSData dataWithBytes:v28 length:16];
  [v6 setUuid:v18];

  v19 = [v5 relatedApplications];

  if (v19)
  {
    v20 = [v5 relatedApplications];
    v21 = +[NSKeyedArchiver archivedDataWithRootObject:v20 requiringSecureCoding:1 error:0];
    [v6 setRelatedApplications:v21];
  }
  v22 = [v5 schedulerRecommendedApplications];

  if (v22)
  {
    v23 = [v5 schedulerRecommendedApplications];
    v24 = +[NSKeyedArchiver archivedDataWithRootObject:v23 requiringSecureCoding:1 error:0];
    [v6 setSchedulerRecommendedApplications:v24];
  }
  v25 = [v5 userInfo];

  if (v25)
  {
    v26 = [v5 userInfo];
    v27 = +[NSKeyedArchiver archivedDataWithRootObject:v26 requiringSecureCoding:1 error:0];
    [v6 setUserInfo:v27];
  }
}

- (void)updateActivity:(id)a3 value:(int)a4 context:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v10 = a3;
  id v7 = -[_DASActivityRecorder fetchActivity:context:](self, "fetchActivity:context:");
  v8 = v7;
  if (v7)
  {
    [v7 setCurrentState:v5];
    if ((v5 - 2) >= 2)
    {
      if (v5 != 1) {
        goto LABEL_7;
      }
      v9 = [v10 startDate];
      [v8 setStartDate:v9];
    }
    else
    {
      v9 = +[NSDate date];
      [v8 setCompletedDate:v9];
    }
  }
LABEL_7:
}

- (void)updateActivityStarted:(id)a3 context:(id)a4
{
}

- (void)updateActivityCompleted:(id)a3 context:(id)a4
{
}

- (void)updateActivityCanceled:(id)a3 context:(id)a4
{
}

- (void)deleteActivity:(id)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v11 = (id)objc_opt_new();
  v8 = [(_DASActivityRecorder *)self entityName];
  v9 = +[NSEntityDescription entityForName:v8 inManagedObjectContext:v6];
  [v11 setEntity:v9];

  id v10 = +[_DASActivityRecorder predicateForUniqueRecord:v7];

  [v11 setPredicate:v10];
  [(_DASActivityRecorder *)self deleteActivites:v11 moc:v6];
}

- (void)deleteActivites:(id)a3 moc:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  [v6 setFetchBatchSize:512];
  id v7 = [objc_alloc((Class)NSBatchDeleteRequest) initWithFetchRequest:v6];

  uint64_t v9 = 0;
  id v8 = [v5 executeRequest:v7 error:&v9];
}

- (void)deleteOldActivities:(id)a3
{
  id v4 = a3;
  id v9 = +[NSDate dateWithTimeIntervalSinceNow:-432000.0];
  id v5 = +[NSPredicate predicateWithFormat:@"currentState <= %@ AND startBefore <= %@", &off_100186BE0, v9];
  id v6 = objc_alloc_init((Class)NSFetchRequest);
  id v7 = [(_DASActivityRecorder *)self entityName];
  id v8 = +[NSEntityDescription entityForName:v7 inManagedObjectContext:v4];
  [v6 setEntity:v8];

  [v6 setPredicate:v5];
  [(_DASActivityRecorder *)self deleteActivites:v6 moc:v4];
}

- (void)deleteActivitiesIfRequired:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSFetchRequest);
  id v6 = [(_DASActivityRecorder *)self entityName];
  id v7 = +[NSEntityDescription entityForName:v6 inManagedObjectContext:v4];
  [v5 setEntity:v7];

  uint64_t v8 = 0;
  if ((unint64_t)[v4 countForFetchRequest:v5 error:&v8] >= 0x201) {
    [(_DASActivityRecorder *)self deleteActivites:v5 moc:v4];
  }
}

@end