@interface _DASActivityCompletionDependencyGroup
+ (id)groupFromPersistence:(id)a3;
+ (id)groupFromPersistenceWithoutCreation:(id)a3;
+ (void)resetDependenciesContainingSubstring:(id)a3;
- (BMStream)completionStream;
- (BOOL)hasDependencyRun;
- (BOOL)isDependencySatisfiedForActivity:(id)a3;
- (BOOL)isPersistenceAvailableWithFileProtection:(id)a3;
- (NSMutableSet)dependents;
- (NSMutableSet)haveRunActivities;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)trackedActivityIdentifier;
- (OS_dispatch_queue)queue;
- (OS_os_log)log;
- (_DASActivityCompletionDependencyGroup)initWithTrackedActivityIdentifier:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionary;
- (void)deregisterDependent:(id)a3;
- (void)handleActivitySubmission:(id)a3;
- (void)persistActivityDidConsume:(id)a3;
- (void)persistTrackedActivityDidRun:(id)a3;
- (void)pruneStreamOfGroup;
- (void)reportDependentActivityDidRun:(id)a3;
- (void)reportTrackedActivityDidRun:(id)a3;
- (void)resetAccumulation;
- (void)setCompletionStream:(id)a3;
- (void)setDependents:(id)a3;
- (void)setHasDependencyRun:(BOOL)a3;
- (void)setHaveRunActivities:(id)a3;
- (void)setLog:(id)a3;
- (void)setQueue:(id)a3;
- (void)updateStreamForTrackedActivityDidRun:(id)a3;
@end

@implementation _DASActivityCompletionDependencyGroup

+ (id)groupFromPersistence:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)objc_opt_class()) initWithTrackedActivityIdentifier:v3];
  v5 = +[_DASDaemonLogger logForCategory:@"DependencyGroupPersistence"];
  v6 = BiomeLibrary();
  v7 = [v6 ActivityScheduler];
  v8 = [v7 Dependency];
  v9 = [v8 Completion];
  v10 = [v9 publisher];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000AA728;
  v24[3] = &unk_1001777F8;
  id v25 = v3;
  id v11 = v3;
  v12 = [v10 filterWithIsIncluded:v24];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000AA784;
  v22[3] = &unk_100177438;
  id v23 = v5;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000AA7E0;
  v19[3] = &unk_100177A00;
  id v20 = v23;
  id v13 = v4;
  id v21 = v13;
  id v14 = v23;
  id v15 = [v12 sinkWithCompletion:v22 receiveInput:v19];

  v16 = v21;
  id v17 = v13;

  return v17;
}

- (_DASActivityCompletionDependencyGroup)initWithTrackedActivityIdentifier:(id)a3
{
  id v5 = a3;
  v25.receiver = self;
  v25.super_class = (Class)_DASActivityCompletionDependencyGroup;
  v6 = [(_DASActivityCompletionDependencyGroup *)&v25 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_trackedActivityIdentifier, a3);
    uint64_t v8 = +[NSMutableSet set];
    dependents = v7->_dependents;
    v7->_dependents = (NSMutableSet *)v8;

    uint64_t v10 = +[NSMutableSet set];
    haveRunActivities = v7->_haveRunActivities;
    v7->_haveRunActivities = (NSMutableSet *)v10;

    v7->_hasDependencyRun = 0;
    v12 = BiomeLibrary();
    id v13 = [v12 ActivityScheduler];
    id v14 = [v13 Dependency];
    uint64_t v15 = [v14 Completion];
    completionStream = v7->_completionStream;
    v7->_completionStream = (BMStream *)v15;

    id v17 = +[NSString stringWithFormat:@"com.apple.dasd.CompletionDependencyGroup.%@", v5];
    v18 = (const char *)[v17 UTF8String];
    v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v20 = dispatch_queue_create(v18, v19);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v20;

    os_log_t v22 = os_log_create("com.apple.duetactivityscheduler", "CompletionDependencyGroup");
    log = v7->_log;
    v7->_log = (OS_os_log *)v22;
  }
  return v7;
}

- (BOOL)isPersistenceAvailableWithFileProtection:(id)a3
{
  completionStream = self->_completionStream;
  id v4 = a3;
  id v5 = [(BMStream *)completionStream configuration];
  v6 = [v5 storeConfig];
  id v7 = [v6 protectionClass];

  id v8 = [v4 asBiomeProtectionClass];
  return v8 <= v7;
}

- (void)handleActivitySubmission:(id)a3
{
  id v4 = a3;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
  {
    trackedActivityIdentifier = self->_trackedActivityIdentifier;
    *(_DWORD *)buf = 136315650;
    v12 = "-[_DASActivityCompletionDependencyGroup handleActivitySubmission:]";
    __int16 v13 = 2112;
    id v14 = v4;
    __int16 v15 = 2112;
    v16 = trackedActivityIdentifier;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "%s: Adding %@ to tracked dependents for %@", buf, 0x20u);
  }
  queue = self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000AABF4;
  v9[3] = &unk_100175570;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_sync(queue, v9);
}

- (void)deregisterDependent:(id)a3
{
  id v4 = a3;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
  {
    trackedActivityIdentifier = self->_trackedActivityIdentifier;
    *(_DWORD *)buf = 136315650;
    v12 = "-[_DASActivityCompletionDependencyGroup deregisterDependent:]";
    __int16 v13 = 2112;
    id v14 = v4;
    __int16 v15 = 2112;
    v16 = trackedActivityIdentifier;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "%s: Removing %@ from tracked dependents for %@", buf, 0x20u);
  }
  queue = self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000AAD38;
  v9[3] = &unk_100175570;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_sync(queue, v9);
}

- (void)reportTrackedActivityDidRun:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000AADDC;
  v7[3] = &unk_100175570;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (void)reportDependentActivityDidRun:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000AAEC0;
  v7[3] = &unk_100175570;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (BOOL)isDependencySatisfiedForActivity:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  __int16 v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000AB00C;
  block[3] = &unk_100175B30;
  id v11 = &v12;
  block[4] = self;
  id v6 = v4;
  id v10 = v6;
  dispatch_sync(queue, block);
  BOOL hasDependencyRun = 0;
  if (!*((unsigned char *)v13 + 24)) {
    BOOL hasDependencyRun = self->_hasDependencyRun;
  }

  _Block_object_dispose(&v12, 8);
  return hasDependencyRun;
}

- (void)resetAccumulation
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000AB0E8;
  block[3] = &unk_1001754F8;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (id)dictionary
{
  id v3 = +[NSMutableArray array];
  id v4 = +[NSMutableArray array];
  queue = self->_queue;
  uint64_t v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  uint64_t v14 = sub_1000AB2D4;
  char v15 = &unk_100175548;
  v16 = self;
  id v17 = v3;
  id v18 = v4;
  id v6 = v4;
  id v7 = v3;
  dispatch_sync(queue, &v12);
  trackedActivityIdentifier = self->_trackedActivityIdentifier;
  v19[0] = @"trackedActivityIdentifier";
  v19[1] = @"dependents";
  v20[0] = trackedActivityIdentifier;
  v20[1] = v7;
  v20[2] = v6;
  v19[2] = @"haveRunIdentifiers";
  v19[3] = @"hasDependencyRun";
  v9 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_hasDependencyRun, v12, v13, v14, v15, v16);
  v20[3] = v9;
  id v10 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:4];

  return v10;
}

+ (void)resetDependenciesContainingSubstring:(id)a3
{
  id v3 = a3;
  id v4 = BiomeLibrary();
  id v5 = [v4 ActivityScheduler];
  id v6 = [v5 Dependency];
  id v7 = [v6 Completion];

  id v8 = [v7 pruner];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000AB578;
  v10[3] = &unk_1001778E8;
  id v11 = v3;
  id v9 = v3;
  [v8 deleteEventsPassingTest:v10];
}

- (void)updateStreamForTrackedActivityDidRun:(id)a3
{
  id v4 = a3;
  [(_DASActivityCompletionDependencyGroup *)self pruneStreamOfGroup];
  [(_DASActivityCompletionDependencyGroup *)self persistTrackedActivityDidRun:v4];
}

- (void)pruneStreamOfGroup
{
  id v3 = [(BMStream *)self->_completionStream pruner];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000AB700;
  v4[3] = &unk_1001778E8;
  v4[4] = self;
  [v3 deleteEventsPassingTest:v4];
}

- (void)persistTrackedActivityDidRun:(id)a3
{
  id v5 = [objc_alloc((Class)BMActivitySchedulerDependencyCompletion) initWithIdentifier:self->_trackedActivityIdentifier consumerIdentifier:0 type:1];
  id v4 = [(BMStream *)self->_completionStream source];
  [v4 sendEvent:v5];
}

- (void)persistActivityDidConsume:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)BMActivitySchedulerDependencyCompletion);
  trackedActivityIdentifier = self->_trackedActivityIdentifier;
  id v7 = [v4 name];

  id v9 = [v5 initWithIdentifier:trackedActivityIdentifier consumerIdentifier:v7 type:2];
  id v8 = [(BMStream *)self->_completionStream source];
  [v8 sendEvent:v9];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) initWithTrackedActivityIdentifier:self->_trackedActivityIdentifier];
  id v6 = [(NSMutableSet *)self->_dependents copyWithZone:a3];
  [v5 setDependents:v6];

  id v7 = [(NSMutableSet *)self->_haveRunActivities copyWithZone:a3];
  [v5 setHaveRunActivities:v7];

  [v5 setHasDependencyRun:self->_hasDependencyRun];
  return v5;
}

- (NSString)description
{
  id v3 = +[NSMutableString stringWithFormat:@"<%@: %p> Identifier: %@, ", objc_opt_class(), self, self->_trackedActivityIdentifier];
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000AB9FC;
  block[3] = &unk_100175570;
  id v5 = v3;
  id v9 = v5;
  id v10 = self;
  dispatch_sync(queue, block);
  id v6 = v5;

  return (NSString *)v6;
}

- (NSString)debugDescription
{
  id v3 = +[NSMutableString stringWithFormat:@"<%@: %p> Identifier: %@, ", objc_opt_class(), self, self->_trackedActivityIdentifier];
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000ABB48;
  block[3] = &unk_100175570;
  id v5 = v3;
  id v9 = v5;
  id v10 = self;
  dispatch_sync(queue, block);
  id v6 = v5;

  return (NSString *)v6;
}

- (NSString)trackedActivityIdentifier
{
  return self->_trackedActivityIdentifier;
}

- (NSMutableSet)dependents
{
  return self->_dependents;
}

- (void)setDependents:(id)a3
{
}

- (NSMutableSet)haveRunActivities
{
  return self->_haveRunActivities;
}

- (void)setHaveRunActivities:(id)a3
{
}

- (BOOL)hasDependencyRun
{
  return self->_hasDependencyRun;
}

- (void)setHasDependencyRun:(BOOL)a3
{
  self->_BOOL hasDependencyRun = a3;
}

- (BMStream)completionStream
{
  return self->_completionStream;
}

- (void)setCompletionStream:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48, 1);
}

- (void)setQueue:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_completionStream, 0);
  objc_storeStrong((id *)&self->_haveRunActivities, 0);
  objc_storeStrong((id *)&self->_dependents, 0);

  objc_storeStrong((id *)&self->_trackedActivityIdentifier, 0);
}

+ (id)groupFromPersistenceWithoutCreation:(id)a3
{
  id v3 = a3;
  id v4 = +[_DASDaemonLogger logForCategory:@"DependencyGroupPersistence"];
  uint64_t v21 = 0;
  os_log_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  id v5 = BiomeLibrary();
  id v6 = [v5 ActivityScheduler];
  id v7 = [v6 Dependency];
  id v8 = [v7 Completion];
  id v9 = [v8 publisher];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000ABF28;
  v19[3] = &unk_1001777F8;
  id v10 = v3;
  id v20 = v10;
  id v11 = [v9 filterWithIsIncluded:v19];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000ABF84;
  v17[3] = &unk_100177438;
  id v12 = v4;
  id v18 = v12;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000ABFE0;
  v16[3] = &unk_100177938;
  v16[4] = &v21;
  id v13 = [v11 sinkWithCompletion:v17 shouldContinue:v16];

  if (*((unsigned char *)v22 + 24))
  {
    uint64_t v14 = [(id)objc_opt_class() groupFromPersistence:v10];
  }
  else
  {
    uint64_t v14 = 0;
  }

  _Block_object_dispose(&v21, 8);

  return v14;
}

@end