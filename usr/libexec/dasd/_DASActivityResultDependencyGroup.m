@interface _DASActivityResultDependencyGroup
+ (id)groupFromDefaultsWithoutCreation:(id)a3;
+ (id)groupFromPersistence:(id)a3;
+ (void)resetDependenciesContainingSubstring:(id)a3;
- (BMStream)resultStream;
- (BOOL)deregisterProducer:(id)a3 error:(id *)a4;
- (BOOL)isDependencySatisfiedForActivity:(id)a3;
- (BOOL)isPersistenceAvailableWithFileProtection:(id)a3;
- (BOOL)queue_isConsumerActivity:(id)a3;
- (BOOL)queue_isProducerActivity:(id)a3;
- (BOOL)registerProducer:(id)a3 error:(id *)a4;
- (BOOL)reportActivity:(id)a3 consumedResult:(id)a4 error:(id *)a5;
- (BOOL)reportActivity:(id)a3 producedResult:(id)a4 error:(id *)a5;
- (NSMutableDictionary)cumulativeResultConsumption;
- (NSMutableSet)consumers;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)resultIdentifier;
- (OS_dispatch_queue)queue;
- (OS_os_log)log;
- (_DASActivity)producer;
- (_DASActivityResult)cumulativelyProducedResult;
- (_DASActivityResultDependencyGroup)initWithIdentifier:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionary;
- (id)queue_aggregateResultConsumptionForActivity:(id)a3;
- (int64_t)computeNumberOfAvailableResultsForActivity:(id)a3;
- (void)deregisterDependent:(id)a3;
- (void)handleActivitySubmission:(id)a3;
- (void)persistUpdatedResultConsumptionBy:(id)a3 result:(id)a4;
- (void)persistUpdatedResultProductionBy:(id)a3;
- (void)pruneConsumptionEventsForActivityIdentifier:(id)a3;
- (void)resetAccumulation;
- (void)setConsumers:(id)a3;
- (void)setCumulativeResultConsumption:(id)a3;
- (void)setCumulativelyProducedResult:(id)a3;
- (void)setLog:(id)a3;
- (void)setProducer:(id)a3;
- (void)setQueue:(id)a3;
- (void)setResultStream:(id)a3;
- (void)updateDependenciesPreClearedOnActivity:(id)a3 withValue:(BOOL)a4;
@end

@implementation _DASActivityResultDependencyGroup

+ (id)groupFromPersistence:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)objc_opt_class()) initWithIdentifier:v3];
  v5 = +[_DASDaemonLogger logForCategory:@"DependencyGroupPersistence"];
  v6 = BiomeLibrary();
  v7 = [v6 ActivityScheduler];
  v8 = [v7 Dependency];
  v9 = [v8 Result];
  v10 = [v9 publisher];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1000A2CFC;
  v26[3] = &unk_1001777F8;
  id v11 = v3;
  id v27 = v11;
  v12 = [v10 filterWithIsIncluded:v26];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000A2D58;
  v24[3] = &unk_100177438;
  id v25 = v5;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000A2DB4;
  v20[3] = &unk_100177820;
  id v21 = v25;
  id v13 = v4;
  id v22 = v13;
  id v23 = v11;
  id v14 = v11;
  id v15 = v25;
  id v16 = [v12 sinkWithCompletion:v24 receiveInput:v20];

  v17 = v23;
  id v18 = v13;

  return v18;
}

- (_DASActivityResultDependencyGroup)initWithIdentifier:(id)a3
{
  id v5 = a3;
  v28.receiver = self;
  v28.super_class = (Class)_DASActivityResultDependencyGroup;
  v6 = [(_DASActivityResultDependencyGroup *)&v28 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_resultIdentifier, a3);
    v8 = (_DASActivityResult *)[objc_alloc((Class)_DASActivityResult) initWithIdentifier:v5];
    cumulativelyProducedResult = v7->_cumulativelyProducedResult;
    v7->_cumulativelyProducedResult = v8;

    uint64_t v10 = +[NSMutableDictionary dictionary];
    cumulativeResultConsumption = v7->_cumulativeResultConsumption;
    v7->_cumulativeResultConsumption = (NSMutableDictionary *)v10;

    uint64_t v12 = +[NSMutableSet set];
    consumers = v7->_consumers;
    v7->_consumers = (NSMutableSet *)v12;

    producer = v7->_producer;
    v7->_producer = 0;

    id v15 = BiomeLibrary();
    id v16 = [v15 ActivityScheduler];
    v17 = [v16 Dependency];
    uint64_t v18 = [v17 Result];
    resultStream = v7->_resultStream;
    v7->_resultStream = (BMStream *)v18;

    id v20 = +[NSString stringWithFormat:@"com.apple.dasd.DependencyGroup.%@", v7->_resultIdentifier];
    id v21 = (const char *)[v20 UTF8String];
    id v22 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v23 = dispatch_queue_create(v21, v22);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v23;

    os_log_t v25 = os_log_create("com.apple.duetactivityscheduler", "ResultDependencyGroup");
    log = v7->_log;
    v7->_log = (OS_os_log *)v25;
  }
  return v7;
}

- (BOOL)isPersistenceAvailableWithFileProtection:(id)a3
{
  resultStream = self->_resultStream;
  id v4 = a3;
  id v5 = [(BMStream *)resultStream configuration];
  v6 = [v5 storeConfig];
  id v7 = [v6 protectionClass];

  id v8 = [v4 asBiomeProtectionClass];
  return v8 <= v7;
}

- (void)handleActivitySubmission:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000A31C8;
  v7[3] = &unk_100175570;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (BOOL)registerProducer:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 1;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = sub_1000A3364;
  v19 = sub_1000A3374;
  id v20 = 0;
  queue = self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000A337C;
  v11[3] = &unk_100177848;
  v11[4] = self;
  id v13 = &v21;
  id v14 = &v15;
  id v8 = v6;
  id v12 = v8;
  dispatch_sync(queue, v11);
  if (!*((unsigned char *)v22 + 24) || v16[5])
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
    {
      sub_1000FD3C4();
      if (!a4) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
    if (a4) {
LABEL_5:
    }
      *a4 = (id) v16[5];
  }
LABEL_6:
  char v9 = *((unsigned char *)v22 + 24);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

- (void)deregisterDependent:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000A3600;
  v7[3] = &unk_100175570;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (BOOL)deregisterProducer:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 1;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = sub_1000A3364;
  v19 = sub_1000A3374;
  id v20 = 0;
  queue = self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000A379C;
  v11[3] = &unk_100177870;
  v11[4] = self;
  id v8 = v6;
  id v12 = v8;
  id v13 = &v21;
  id v14 = &v15;
  dispatch_sync(queue, v11);
  if (!*((unsigned char *)v22 + 24) || v16[5])
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
    {
      sub_1000FD438();
      if (!a4) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
    if (a4) {
LABEL_5:
    }
      *a4 = (id) v16[5];
  }
LABEL_6:
  char v9 = *((unsigned char *)v22 + 24);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

- (BOOL)isDependencySatisfiedForActivity:(id)a3
{
  id v4 = a3;
  id v5 = [v4 dependencyForIdentifier:self->_resultIdentifier];
  if (v5)
  {
    id v6 = [v5 isSatisfiedByAvailableResultCount:-[_DASActivityResultDependencyGroup computeNumberOfAvailableResultsForActivity:](self, "computeNumberOfAvailableResultsForActivity:", v4)];
    [(_DASActivityResultDependencyGroup *)self updateDependenciesPreClearedOnActivity:v4 withValue:v6];
  }
  else
  {
    LOBYTE(v6) = 1;
  }

  return (char)v6;
}

- (BOOL)reportActivity:(id)a3 consumedResult:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 1;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = sub_1000A3364;
  char v24 = sub_1000A3374;
  id v25 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A3B68;
  block[3] = &unk_100177898;
  block[4] = self;
  id v11 = v8;
  id v16 = v11;
  uint64_t v18 = &v20;
  v19 = &v26;
  id v12 = v9;
  id v17 = v12;
  dispatch_sync(queue, block);
  if (!*((unsigned char *)v27 + 24))
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
    {
      sub_1000FD4AC();
      if (!a5) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
    if (a5) {
LABEL_4:
    }
      *a5 = (id) v21[5];
  }
LABEL_5:
  char v13 = *((unsigned char *)v27 + 24);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v13;
}

- (BOOL)reportActivity:(id)a3 producedResult:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 1;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = sub_1000A3364;
  char v24 = sub_1000A3374;
  id v25 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A3FE8;
  block[3] = &unk_1001778C0;
  block[4] = self;
  id v11 = v8;
  id v16 = v11;
  uint64_t v18 = &v20;
  id v12 = v9;
  id v17 = v12;
  v19 = &v26;
  dispatch_sync(queue, block);
  if (!*((unsigned char *)v27 + 24))
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
    {
      sub_1000FD528();
      if (!a5) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
    if (a5) {
LABEL_4:
    }
      *a5 = (id) v21[5];
  }
LABEL_5:
  char v13 = *((unsigned char *)v27 + 24);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v13;
}

+ (void)resetDependenciesContainingSubstring:(id)a3
{
  id v3 = a3;
  id v4 = BiomeLibrary();
  id v5 = [v4 ActivityScheduler];
  id v6 = [v5 Dependency];
  id v7 = [v6 Result];

  id v8 = [v7 pruner];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000A431C;
  v10[3] = &unk_1001778E8;
  id v11 = v3;
  id v9 = v3;
  [v8 deleteEventsPassingTest:v10];
}

- (void)persistUpdatedResultProductionBy:(id)a3
{
  resultStream = self->_resultStream;
  id v5 = a3;
  id v6 = [(BMStream *)resultStream pruner];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000A44F8;
  v13[3] = &unk_1001778E8;
  v13[4] = self;
  [v6 deleteEventsPassingTest:v13];

  id v7 = objc_alloc((Class)BMActivitySchedulerDependencyResult);
  resultIdentifier = self->_resultIdentifier;
  id v9 = [v5 name];

  uint64_t v10 = +[NSNumber numberWithInteger:[(_DASActivityResult *)self->_cumulativelyProducedResult count]];
  id v11 = [v7 initWithResultIdentifier:resultIdentifier activityIdentifier:v9 resultCount:v10 type:1];

  id v12 = [(BMStream *)self->_resultStream source];
  [v12 sendEvent:v11];
}

- (void)persistUpdatedResultConsumptionBy:(id)a3 result:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 name];
  [(_DASActivityResultDependencyGroup *)self pruneConsumptionEventsForActivityIdentifier:v8];

  id v9 = objc_alloc((Class)BMActivitySchedulerDependencyResult);
  resultIdentifier = self->_resultIdentifier;
  id v11 = [v7 name];

  id v12 = [v6 count];
  char v13 = +[NSNumber numberWithInteger:v12];
  id v15 = [v9 initWithResultIdentifier:resultIdentifier activityIdentifier:v11 resultCount:v13 type:2];

  id v14 = [(BMStream *)self->_resultStream source];
  [v14 sendEvent:v15];
}

- (void)pruneConsumptionEventsForActivityIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(BMStream *)self->_resultStream pruner];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000A475C;
  v7[3] = &unk_100177910;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  [v5 deleteEventsPassingTest:v7];
}

- (BOOL)queue_isConsumerActivity:(id)a3
{
  return [(NSMutableSet *)self->_consumers containsObject:a3];
}

- (BOOL)queue_isProducerActivity:(id)a3
{
  producer = self->_producer;
  id v4 = a3;
  id v5 = [(_DASActivity *)producer name];
  id v6 = [v4 name];

  LOBYTE(v4) = [v5 isEqualToString:v6];
  return (char)v4;
}

- (id)queue_aggregateResultConsumptionForActivity:(id)a3
{
  id v4 = a3;
  cumulativeResultConsumption = self->_cumulativeResultConsumption;
  id v6 = [v4 name];
  id v7 = [(NSMutableDictionary *)cumulativeResultConsumption objectForKeyedSubscript:v6];

  if (!v7)
  {
    id v7 = [objc_alloc((Class)_DASActivityResult) initWithIdentifier:self->_resultIdentifier];
    id v8 = self->_cumulativeResultConsumption;
    id v9 = [v4 name];
    [(NSMutableDictionary *)v8 setObject:v7 forKeyedSubscript:v9];
  }

  return v7;
}

- (int64_t)computeNumberOfAvailableResultsForActivity:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  char v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A4A2C;
  block[3] = &unk_100175948;
  block[4] = self;
  id v10 = v4;
  id v11 = &v12;
  id v6 = v4;
  dispatch_sync(queue, block);
  int64_t v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)updateDependenciesPreClearedOnActivity:(id)a3 withValue:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (([v6 dependenciesPreCleared] & 1) == 0 && v4)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = log;
      id v9 = [(_DASActivityResultDependencyGroup *)self description];
      int v10 = 136315650;
      id v11 = "-[_DASActivityResultDependencyGroup updateDependenciesPreClearedOnActivity:withValue:]";
      __int16 v12 = 2112;
      char v13 = v9;
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: %@ dependency has been satisfied on %@, marking as pre-cleared", (uint8_t *)&v10, 0x20u);
    }
  }
  [v6 setDependenciesPreCleared:[v6 dependenciesPreCleared] | v4];
}

- (void)resetAccumulation
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A4C28;
  block[3] = &unk_1001754F8;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (id)dictionary
{
  id v3 = +[NSMutableDictionary dictionary];
  BOOL v4 = +[NSMutableArray array];
  queue = self->_queue;
  __int16 v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  id v16 = sub_1000A4F78;
  id v17 = &unk_100175548;
  uint64_t v18 = self;
  id v6 = v3;
  id v19 = v6;
  id v7 = v4;
  id v20 = v7;
  dispatch_sync(queue, &v14);
  cumulativelyProducedResult = self->_cumulativelyProducedResult;
  v22[0] = self->_resultIdentifier;
  v21[0] = @"resultIdentifier";
  v21[1] = @"producedResults";
  id v9 = +[NSNumber numberWithInteger:[(_DASActivityResult *)cumulativelyProducedResult count]];
  v22[1] = v9;
  v22[2] = v6;
  v21[2] = @"consumedResults";
  v21[3] = @"registeredConsumers";
  v22[3] = v7;
  v21[4] = @"registeredProducer";
  int v10 = [(_DASActivity *)self->_producer name];
  id v11 = v10;
  if (!v10)
  {
    id v11 = +[NSNull null];
  }
  v22[4] = v11;
  __int16 v12 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:5];
  if (!v10) {

  }
  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) initWithIdentifier:self->_resultIdentifier];
  id v6 = [(_DASActivityResult *)self->_cumulativelyProducedResult copyWithZone:a3];
  [v5 setCumulativelyProducedResult:v6];

  id v7 = [(NSMutableDictionary *)self->_cumulativeResultConsumption copyWithZone:a3];
  [v5 setCumulativeResultConsumption:v7];

  id v8 = [(NSMutableSet *)self->_consumers copyWithZone:a3];
  [v5 setConsumers:v8];

  id v9 = [(_DASActivity *)self->_producer copyWithZone:a3];
  [v5 setProducer:v9];

  return v5;
}

- (NSString)description
{
  id v3 = +[NSMutableString stringWithFormat:@"<%@: %p> Identifier: %@, ", objc_opt_class(), self, self->_resultIdentifier];
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A5318;
  block[3] = &unk_100175570;
  id v5 = v3;
  id v9 = v5;
  int v10 = self;
  dispatch_sync(queue, block);
  id v6 = v5;

  return (NSString *)v6;
}

- (NSString)debugDescription
{
  id v3 = +[NSMutableString stringWithFormat:@"<%@: %p> Identifier: %@, ", objc_opt_class(), self, self->_resultIdentifier];
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A544C;
  block[3] = &unk_100175570;
  id v5 = v3;
  id v9 = v5;
  int v10 = self;
  dispatch_sync(queue, block);
  id v6 = v5;

  return (NSString *)v6;
}

- (NSString)resultIdentifier
{
  return self->_resultIdentifier;
}

- (_DASActivityResult)cumulativelyProducedResult
{
  return (_DASActivityResult *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCumulativelyProducedResult:(id)a3
{
}

- (NSMutableDictionary)cumulativeResultConsumption
{
  return self->_cumulativeResultConsumption;
}

- (void)setCumulativeResultConsumption:(id)a3
{
}

- (NSMutableSet)consumers
{
  return self->_consumers;
}

- (void)setConsumers:(id)a3
{
}

- (_DASActivity)producer
{
  return self->_producer;
}

- (void)setProducer:(id)a3
{
}

- (BMStream)resultStream
{
  return self->_resultStream;
}

- (void)setResultStream:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
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
  objc_storeStrong((id *)&self->_resultStream, 0);
  objc_storeStrong((id *)&self->_producer, 0);
  objc_storeStrong((id *)&self->_consumers, 0);
  objc_storeStrong((id *)&self->_cumulativeResultConsumption, 0);
  objc_storeStrong((id *)&self->_cumulativelyProducedResult, 0);

  objc_storeStrong((id *)&self->_resultIdentifier, 0);
}

+ (id)groupFromDefaultsWithoutCreation:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[_DASDaemonLogger logForCategory:@"DependencyGroupPersistence"];
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  id v5 = BiomeLibrary();
  id v6 = [v5 ActivityScheduler];
  id v7 = [v6 Dependency];
  id v8 = [v7 Result];
  id v9 = [v8 publisher];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000A585C;
  v19[3] = &unk_1001777F8;
  id v10 = v3;
  id v20 = v10;
  id v11 = [v9 filterWithIsIncluded:v19];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000A58B8;
  v17[3] = &unk_100177438;
  id v12 = v4;
  id v18 = v12;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000A5914;
  v16[3] = &unk_100177938;
  v16[4] = &v21;
  id v13 = [v11 sinkWithCompletion:v17 shouldContinue:v16];

  if (*((unsigned char *)v22 + 24))
  {
    __int16 v14 = [(id)objc_opt_class() groupFromPersistence:v10];
  }
  else
  {
    __int16 v14 = 0;
  }

  _Block_object_dispose(&v21, 8);

  return v14;
}

@end