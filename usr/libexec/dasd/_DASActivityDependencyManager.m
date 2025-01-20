@interface _DASActivityDependencyManager
+ (_DASActivityDependencyManager)sharedInstance;
- (BOOL)areDependenciesSatisfiedFor:(id)a3;
- (BOOL)isDependentActivity:(id)a3;
- (BOOL)reportActivity:(id)a3 consumedResults:(id)a4 error:(id *)a5;
- (BOOL)reportActivity:(id)a3 producedResults:(id)a4 error:(id *)a5;
- (BOOL)resetDependenciesForIdentifier:(id)a3 byActivity:(id)a4 error:(id *)a5;
- (BOOL)shouldMonitorDependenciesForActivity:(id)a3;
- (NSMutableDictionary)dependencyGroups;
- (OS_dispatch_queue)queue;
- (OS_os_log)log;
- (_DASActivityDependencyManager)init;
- (id)dastool_queryStatusOfResultIdentifier:(id)a3;
- (id)queue_checkedCompletionDependencyGroupForIdentifier:(id)a3;
- (id)queue_checkedResultDependencyGroupForIdentifier:(id)a3;
- (id)queue_dependencyGroup:(id)a3;
- (id)queue_dependencyGroupCreateIfDoesNotExist:(id)a3;
- (void)addActivityToDependencyGroups:(id)a3;
- (void)beginDependencyMonitoringForActivity:(id)a3;
- (void)dastool_forceResetOfResultIdentifier:(id)a3;
- (void)endDependencyMonitoringForActivity:(id)a3;
- (void)refreshGroupsWithFileProtection:(id)a3;
- (void)removeActivityFromDependencyGroups:(id)a3;
- (void)reportActivityDidFinishRunning:(id)a3;
- (void)resetFastPassDependencies;
- (void)resetFastPassDependenciesForActivity:(id)a3;
- (void)setDependencyGroups:(id)a3;
- (void)setLog:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation _DASActivityDependencyManager

- (void)beginDependencyMonitoringForActivity:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(_DASActivityDependencyManager *)self shouldMonitorDependenciesForActivity:v4];
  log = self->_log;
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v4;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Beginning dependencies monitoring for %@", (uint8_t *)&v7, 0xCu);
    }
    [(_DASActivityDependencyManager *)self addActivityToDependencyGroups:v4];
  }
  else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG))
  {
    sub_1000F79FC();
  }
}

- (BOOL)isDependentActivity:(id)a3
{
  v3 = [a3 dependencies];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (BOOL)shouldMonitorDependenciesForActivity:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 dependencies];
  if ([v4 count])
  {
    BOOL v5 = 1;
  }
  else
  {
    v6 = [v3 producedResultIdentifiers];
    BOOL v5 = [v6 count] != 0;
  }
  return v5;
}

+ (_DASActivityDependencyManager)sharedInstance
{
  if (qword_1001C40F8 != -1) {
    dispatch_once(&qword_1001C40F8, &stru_1001769F8);
  }
  v2 = (void *)qword_1001C4100;

  return (_DASActivityDependencyManager *)v2;
}

- (_DASActivityDependencyManager)init
{
  v11.receiver = self;
  v11.super_class = (Class)_DASActivityDependencyManager;
  v2 = [(_DASActivityDependencyManager *)&v11 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableDictionary dictionary];
    dependencyGroups = v2->_dependencyGroups;
    v2->_dependencyGroups = (NSMutableDictionary *)v3;

    BOOL v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.dasd.DependencyManager", v5);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;

    os_log_t v8 = os_log_create("com.apple.duetactivityscheduler", "DependencyManager");
    log = v2->_log;
    v2->_log = (OS_os_log *)v8;
  }
  return v2;
}

- (void)refreshGroupsWithFileProtection:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100071B58;
  v7[3] = &unk_100175570;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (void)addActivityToDependencyGroups:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100071EE0;
  v7[3] = &unk_100175570;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (void)endDependencyMonitoringForActivity:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(_DASActivityDependencyManager *)self shouldMonitorDependenciesForActivity:v4];
  BOOL v6 = os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v6) {
      sub_1000F7A64();
    }
    [(_DASActivityDependencyManager *)self removeActivityFromDependencyGroups:v4];
  }
  else if (v6)
  {
    sub_1000F7ACC();
  }
}

- (void)removeActivityFromDependencyGroups:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100072288;
  v7[3] = &unk_100175570;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (BOOL)reportActivity:(id)a3 consumedResults:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 1;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = sub_100072834;
  v26 = sub_100072844;
  id v27 = 0;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v33 = "-[_DASActivityDependencyManager reportActivity:consumedResults:error:]";
    __int16 v34 = 2112;
    id v35 = v8;
    __int16 v36 = 2112;
    id v37 = v9;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "%s: %@ reporting result consumption: %@", buf, 0x20u);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007284C;
  block[3] = &unk_100176A48;
  id v12 = v9;
  id v17 = v12;
  v20 = &v22;
  id v13 = v8;
  v21 = &v28;
  id v18 = v13;
  v19 = self;
  dispatch_sync(queue, block);
  if (!*((unsigned char *)v29 + 24) || v23[5])
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
    {
      sub_1000F7B34();
      if (!a5) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
    if (a5) {
LABEL_7:
    }
      *a5 = (id) v23[5];
  }
LABEL_8:
  char v14 = *((unsigned char *)v29 + 24);

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v14;
}

- (BOOL)reportActivity:(id)a3 producedResults:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 1;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = sub_100072834;
  v26 = sub_100072844;
  id v27 = 0;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v33 = "-[_DASActivityDependencyManager reportActivity:producedResults:error:]";
    __int16 v34 = 2112;
    id v35 = v8;
    __int16 v36 = 2112;
    id v37 = v9;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "%s: %@ reporting result production: %@", buf, 0x20u);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100072F44;
  block[3] = &unk_100176A48;
  id v12 = v9;
  id v17 = v12;
  v20 = &v22;
  id v13 = v8;
  v21 = &v28;
  id v18 = v13;
  v19 = self;
  dispatch_sync(queue, block);
  if (!*((unsigned char *)v29 + 24) || v23[5])
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
    {
      sub_1000F7C4C();
      if (!a5) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
    if (a5) {
LABEL_7:
    }
      *a5 = (id) v23[5];
  }
LABEL_8:
  char v14 = *((unsigned char *)v29 + 24);

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v14;
}

- (void)reportActivityDidFinishRunning:(id)a3
{
  id v4 = a3;
  if ([(_DASActivityDependencyManager *)self shouldMonitorDependenciesForActivity:v4])
  {
    queue = self->_queue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000733E0;
    v6[3] = &unk_100175570;
    v6[4] = self;
    id v7 = v4;
    dispatch_sync(queue, v6);
  }
  else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG))
  {
    sub_1000F7D64();
  }
}

- (BOOL)areDependenciesSatisfiedFor:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 dependencies];
  if (v5
    && (id v6 = (void *)v5,
        [v4 dependencies],
        id v7 = objc_claimAutoreleasedReturnValue(),
        id v8 = [v7 count],
        v7,
        v6,
        v8))
  {
    if (![v4 dependenciesPreCleared])
    {
      uint64_t v16 = 0;
      id v17 = &v16;
      uint64_t v18 = 0x2020000000;
      char v19 = 0;
      queue = self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100073770;
      block[3] = &unk_100175948;
      id v13 = v4;
      char v14 = self;
      v15 = &v16;
      dispatch_sync(queue, block);
      BOOL v9 = *((unsigned char *)v17 + 24) != 0;

      _Block_object_dispose(&v16, 8);
      goto LABEL_9;
    }
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG)) {
      sub_1000F7EE8();
    }
  }
  else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG))
  {
    sub_1000F7E68();
  }
  BOOL v9 = 1;
LABEL_9:

  return v9;
}

- (BOOL)resetDependenciesForIdentifier:(id)a3 byActivity:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v16 = "-[_DASActivityDependencyManager resetDependenciesForIdentifier:byActivity:error:]";
    __int16 v17 = 2112;
    id v18 = v8;
    __int16 v19 = 2112;
    id v20 = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "%s: %@ resetting result production: %@", buf, 0x20u);
  }
  queue = self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100073BE0;
  v13[3] = &unk_100175570;
  v13[4] = self;
  id v14 = v7;
  id v11 = v7;
  dispatch_sync(queue, v13);

  return 1;
}

- (void)resetFastPassDependencies
{
  v2 = [(id)objc_opt_class() allFastPassIdentifiers];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v8 + 1) + 8 * (void)v6);
        [(id)objc_opt_class() resetDependenciesContainingSubstring:v7];
        [(id)objc_opt_class() resetDependenciesContainingSubstring:v7];
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)resetFastPassDependenciesForActivity:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() allFastPassIdentifiers];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
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
        uint64_t v9 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        if ([v3 containsString:v9])
        {
          [(id)objc_opt_class() resetDependenciesContainingSubstring:v9];
          [(id)objc_opt_class() resetDependenciesContainingSubstring:v9];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (id)queue_dependencyGroupCreateIfDoesNotExist:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  dependencyGroups = self->_dependencyGroups;
  id v6 = [v4 identifier];
  uint64_t v7 = [(NSMutableDictionary *)dependencyGroups objectForKeyedSubscript:v6];

  if (!v7)
  {
    if ([v4 isActivityCompletionBased]) {
      long long v8 = _DASActivityCompletionDependencyGroup;
    }
    else {
      long long v8 = _DASActivityResultDependencyGroup;
    }
    uint64_t v9 = [v4 identifier];
    uint64_t v7 = [(__objc2_class *)v8 groupFromPersistence:v9];

    long long v10 = self->_dependencyGroups;
    long long v11 = [v4 identifier];
    [(NSMutableDictionary *)v10 setObject:v7 forKeyedSubscript:v11];
  }

  return v7;
}

- (id)queue_checkedResultDependencyGroupForIdentifier:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = [(NSMutableDictionary *)self->_dependencyGroups objectForKeyedSubscript:v4];
  if (!v5)
  {
    id v5 = +[_DASActivityResultDependencyGroup groupFromPersistence:v4];
    [(NSMutableDictionary *)self->_dependencyGroups setObject:v5 forKeyedSubscript:v4];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  return v6;
}

- (id)queue_checkedCompletionDependencyGroupForIdentifier:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = [(NSMutableDictionary *)self->_dependencyGroups objectForKeyedSubscript:v4];
  if (!v5)
  {
    id v5 = +[_DASActivityCompletionDependencyGroup groupFromPersistence:v4];
    [(NSMutableDictionary *)self->_dependencyGroups setObject:v5 forKeyedSubscript:v4];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  return v6;
}

- (NSMutableDictionary)dependencyGroups
{
  return self->_dependencyGroups;
}

- (void)setDependencyGroups:(id)a3
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

  objc_storeStrong((id *)&self->_dependencyGroups, 0);
}

- (id)queue_dependencyGroup:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_dependencyGroups objectForKeyedSubscript:v4];
  if (!v5)
  {
    id v5 = +[_DASActivityResultDependencyGroup groupFromDefaultsWithoutCreation:v4];
    if (!v5)
    {
      id v5 = +[_DASActivityCompletionDependencyGroup groupFromPersistenceWithoutCreation:v4];
    }
  }
  id v6 = v5;

  return v6;
}

- (void)dastool_forceResetOfResultIdentifier:(id)a3
{
  id v4 = a3;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    long long v11 = "-[_DASActivityDependencyManager(Dastool) dastool_forceResetOfResultIdentifier:]";
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "%s: resetting result production/consumption on behalf of dastool: %@", buf, 0x16u);
  }
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100074340;
  v8[3] = &unk_100175570;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_sync(queue, v8);
}

- (id)dastool_queryStatusOfResultIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = sub_100072834;
  uint64_t v16 = sub_100072844;
  id v17 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100074498;
  block[3] = &unk_100175948;
  void block[4] = self;
  id v10 = v4;
  long long v11 = &v12;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

@end