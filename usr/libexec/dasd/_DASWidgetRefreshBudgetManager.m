@interface _DASWidgetRefreshBudgetManager
+ (id)budgetNameFromWidgetBudgetID:(id)a3;
+ (id)sharedInstance;
+ (id)widgetBudgetIDFromBudgetName:(id)a3;
- (BOOL)managesBudgetWithName:(id)a3;
- (NSMutableDictionary)managedBudgets;
- (OS_dispatch_queue)queue;
- (OS_os_log)log;
- (_CDContext)context;
- (_DASBudgetModulator)widgetBudgetModulator;
- (_DASDataProtectionStateMonitor)lockStateMonitor;
- (_DASDefaultsBudgetPersistence)defaultsPersistence;
- (_DASWidgetRefreshBudgetManager)init;
- (_DASWidgetRefreshUsageTracker)widgetRefreshUsageTracker;
- (double)balanceForBudgetWithName:(id)a3;
- (double)balanceForWidgetBudgetID:(id)a3;
- (double)capacityForBudgetWithName:(id)a3;
- (id)allBudgets;
- (id)locked_instantiateBudgetsInto:(id)a3 withRemovals:(id)a4;
- (id)requiredBudgetsInfo;
- (void)decrementBy:(double)a3 forBudgetWithName:(id)a4;
- (void)locked_reinstantiateConfiguredBudgets;
- (void)reinstantiateConfiguredBudgets;
- (void)reportActivityNoLongerRunning:(id)a3;
- (void)reportActivityRunning:(id)a3;
- (void)resetBudgets;
- (void)setBalance:(double)a3 forBudgetWithName:(id)a4;
- (void)setCapacity:(double)a3 forBudgetWithName:(id)a4;
- (void)setContext:(id)a3;
- (void)setDefaultsPersistence:(id)a3;
- (void)setLockStateMonitor:(id)a3;
- (void)setLog:(id)a3;
- (void)setManagedBudgets:(id)a3;
- (void)setQueue:(id)a3;
- (void)setWidgetBudgetModulator:(id)a3;
- (void)setWidgetRefreshUsageTracker:(id)a3;
- (void)updateBudget:(id)a3;
@end

@implementation _DASWidgetRefreshBudgetManager

- (_DASWidgetRefreshBudgetManager)init
{
  v37.receiver = self;
  v37.super_class = (Class)_DASWidgetRefreshBudgetManager;
  id v2 = [(_DASWidgetRefreshBudgetManager *)&v37 init];
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.duetactivityscheduler", "widgetBudgetManager");
    v4 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.dasd.widgetBudgetManagement", v6);
    v8 = (void *)*((void *)v2 + 8);
    *((void *)v2 + 8) = v7;

    uint64_t v9 = +[_CDClientContext userContext];
    v10 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v9;

    uint64_t v11 = +[_DASDefaultsBudgetPersistence persistence];
    v12 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = v11;

    uint64_t v13 = +[_DASWidgetRefreshUsageTracker sharedInstance];
    v14 = (void *)*((void *)v2 + 6);
    *((void *)v2 + 6) = v13;

    id v15 = objc_alloc_init((Class)NSMutableDictionary);
    v16 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v15;

    uint64_t v17 = *((void *)v2 + 5);
    uint64_t v18 = *((void *)v2 + 8);
    v19 = +[_DKKnowledgeStore knowledgeStore];
    uint64_t v20 = +[_DASBudgetModulator modulatorForBudgetTypes:@"Widgets" withBudgets:0 persistence:v17 withQueue:v18 withStore:v19];
    v21 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = v20;

    v22 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, *((dispatch_queue_t *)v2 + 8));
    dispatch_time_t v23 = dispatch_walltime(0, 0);
    dispatch_source_set_timer(v22, v23, 0x4E94914F0000uLL, 0x8BB2C97000uLL);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100030894;
    block[3] = &unk_1001754F8;
    v24 = (id *)v2;
    v36 = v24;
    dispatch_block_t v25 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_INHERIT_QOS_CLASS, QOS_CLASS_UTILITY, 0, block);
    dispatch_source_set_event_handler(v22, v25);

    dispatch_activate(v22);
    uint64_t v26 = objc_opt_new();
    id v27 = v24[7];
    v24[7] = (id)v26;

    if (([v24[7] unnotifiedIsDataAvailableForClassC] & 1) == 0)
    {
      objc_initWeak(&location, v24);
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_10003089C;
      v32[3] = &unk_100175430;
      objc_copyWeak(&v33, &location);
      [v24[7] setChangeHandler:v32];
      objc_destroyWeak(&v33);
      objc_destroyWeak(&location);
    }
    v28 = *((void *)v2 + 8);
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_100030A7C;
    v30[3] = &unk_1001754F8;
    v31 = v24;
    dispatch_async(v28, v30);
  }
  return (_DASWidgetRefreshBudgetManager *)v2;
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100030B80;
  block[3] = &unk_1001753E0;
  void block[4] = a1;
  if (qword_1001C3BB0 != -1) {
    dispatch_once(&qword_1001C3BB0, block);
  }
  id v2 = (void *)qword_1001C3BB8;

  return v2;
}

+ (id)budgetNameFromWidgetBudgetID:(id)a3
{
  return +[NSString stringWithFormat:@"%@_%@", @"com.apple.dasd.widget", a3];
}

+ (id)widgetBudgetIDFromBudgetName:(id)a3
{
  id v3 = a3;
  v4 = [v3 substringFromIndex:[@"com.apple.dasd.widget" length] + 1];

  return v4;
}

- (BOOL)managesBudgetWithName:(id)a3
{
  return [a3 hasPrefix:@"com.apple.dasd.widget"];
}

- (id)allBudgets
{
  id v3 = +[NSMutableArray array];
  queue = self->_queue;
  v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  v10 = sub_100030D28;
  uint64_t v11 = &unk_100175570;
  v12 = self;
  id v13 = v3;
  id v5 = v3;
  dispatch_sync(queue, &v8);
  id v6 = [v5 copy:v8, v9, v10, v11, v12];

  return v6;
}

- (void)reinstantiateConfiguredBudgets
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100030F70;
  block[3] = &unk_1001754F8;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)locked_reinstantiateConfiguredBudgets
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = +[NSMutableArray array];
  id v3 = [(_DASWidgetRefreshBudgetManager *)self managedBudgets];
  v4 = [(_DASWidgetRefreshBudgetManager *)self locked_instantiateBudgetsInto:v3 withRemovals:v5];

  if ([v4 count] || objc_msgSend(v5, "count")) {
    [(_DASBudgetModulator *)self->_widgetBudgetModulator locked_updateBudgetsToBeModulatedAdditions:v4 removals:v5];
  }
}

- (id)locked_instantiateBudgetsInto:(id)a3 withRemovals:(id)a4
{
  id v6 = a3;
  id v117 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  dispatch_queue_t v7 = [(_DASWidgetRefreshBudgetManager *)self widgetRefreshUsageTracker];
  [v7 invalidateComputedBudgetCache];

  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEBUG)) {
    sub_1000F460C(log, v9, v10, v11, v12, v13, v14, v15);
  }
  v16 = [(_DASWidgetRefreshBudgetManager *)self requiredBudgetsInfo];
  uint64_t v17 = self->_log;
  if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)v17, OS_LOG_TYPE_DEBUG, "requiredInfo", buf, 2u);
    v150[0] = _NSConcreteStackBlock;
    v150[1] = 3221225472;
    v150[2] = sub_100031E78;
    v150[3] = &unk_100175498;
    v150[4] = self;
    [v16 enumerateKeysAndObjectsUsingBlock:v150];
  }
  v124 = [v16 allKeys];
  defaultsPersistence = self->_defaultsPersistence;
  v116 = v16;
  v19 = [v16 allKeys];
  uint64_t v20 = +[NSSet setWithArray:v19];
  v21 = [(_DASDefaultsBudgetPersistence *)defaultsPersistence loadBudgetsWithExpectedNames:v20];

  v22 = self->_log;
  if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v153 = v21;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v22, OS_LOG_TYPE_DEFAULT, "Stored: %@", buf, 0xCu);
  }
  id v23 = objc_alloc_init((Class)NSMutableDictionary);
  long long v146 = 0u;
  long long v147 = 0u;
  long long v148 = 0u;
  long long v149 = 0u;
  id v24 = v21;
  id v25 = [v24 countByEnumeratingWithState:&v146 objects:v160 count:16];
  if (v25)
  {
    id v26 = v25;
    uint64_t v27 = *(void *)v147;
    do
    {
      for (i = 0; i != v26; i = (char *)i + 1)
      {
        if (*(void *)v147 != v27) {
          objc_enumerationMutation(v24);
        }
        v29 = *(void **)(*((void *)&v146 + 1) + 8 * i);
        v30 = [v29 name];
        [v23 setObject:v29 forKeyedSubscript:v30];
      }
      id v26 = [v24 countByEnumeratingWithState:&v146 objects:v160 count:16];
    }
    while (v26);
  }

  v122 = v23;
  v31 = [v23 allKeys];
  context = self->_context;
  id v33 = +[_CDContextualKeyPath keyPathWithKey:kDASWidgetOverrideKeyPath];
  v34 = [(_CDContext *)context objectForKeyedSubscript:v33];

  v35 = self->_log;
  if (os_log_type_enabled((os_log_t)v35, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)v35, OS_LOG_TYPE_DEBUG, "override list:", buf, 2u);
    v145[0] = _NSConcreteStackBlock;
    v145[1] = 3221225472;
    v145[2] = sub_100031EE8;
    v145[3] = &unk_100175B08;
    v145[4] = self;
    [v34 enumerateObjectsUsingBlock:v145];
  }
  id v36 = objc_alloc_init((Class)NSMutableArray);
  long long v141 = 0u;
  long long v142 = 0u;
  long long v143 = 0u;
  long long v144 = 0u;
  id v37 = v34;
  id v38 = [v37 countByEnumeratingWithState:&v141 objects:v159 count:16];
  if (v38)
  {
    id v39 = v38;
    uint64_t v40 = *(void *)v142;
    do
    {
      for (j = 0; j != v39; j = (char *)j + 1)
      {
        if (*(void *)v142 != v40) {
          objc_enumerationMutation(v37);
        }
        v42 = +[_DASWidgetRefreshBudgetManager budgetNameFromWidgetBudgetID:*(void *)(*((void *)&v141 + 1) + 8 * (void)j)];
        [v36 addObject:v42];
      }
      id v39 = [v37 countByEnumeratingWithState:&v141 objects:v159 count:16];
    }
    while (v39);
  }
  v114 = v37;
  v115 = v24;

  v43 = self->_log;
  if (os_log_type_enabled((os_log_t)v43, OS_LOG_TYPE_DEBUG)) {
    sub_1000F45D4(v43, v44, v45, v46, v47, v48, v49, v50);
  }
  long long v139 = 0u;
  long long v140 = 0u;
  long long v137 = 0u;
  long long v138 = 0u;
  id obj = v31;
  id v51 = [obj countByEnumeratingWithState:&v137 objects:v158 count:16];
  if (v51)
  {
    id v52 = v51;
    uint64_t v53 = *(void *)v138;
    do
    {
      for (k = 0; k != v52; k = (char *)k + 1)
      {
        if (*(void *)v138 != v53) {
          objc_enumerationMutation(obj);
        }
        v55 = *(void **)(*((void *)&v137 + 1) + 8 * (void)k);
        v56 = self->_log;
        if (os_log_type_enabled((os_log_t)v56, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v153 = v55;
          _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)v56, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
        if (([v36 containsObject:v55] & 1) == 0
          && ([v124 containsObject:v55] & 1) == 0)
        {
          [v122 removeObjectForKey:v55];
          v57 = self->_log;
          if (os_log_type_enabled((os_log_t)v57, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v153 = v55;
            _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)v57, OS_LOG_TYPE_DEBUG, "Purged inactive widget budget %@ from stored budgets", buf, 0xCu);
          }
        }
      }
      id v52 = [obj countByEnumeratingWithState:&v137 objects:v158 count:16];
    }
    while (v52);
  }

  v58 = self->_log;
  if (os_log_type_enabled((os_log_t)v58, OS_LOG_TYPE_DEBUG)) {
    sub_1000F459C(v58, v59, v60, v61, v62, v63, v64, v65);
  }
  [v6 allKeys];
  long long v133 = 0u;
  long long v134 = 0u;
  long long v135 = 0u;
  long long v136 = 0u;
  id v118 = (id)objc_claimAutoreleasedReturnValue();
  id v66 = [v118 countByEnumeratingWithState:&v133 objects:v157 count:16];
  if (v66)
  {
    id v67 = v66;
    uint64_t v68 = *(void *)v134;
    do
    {
      for (m = 0; m != v67; m = (char *)m + 1)
      {
        if (*(void *)v134 != v68) {
          objc_enumerationMutation(v118);
        }
        v70 = *(void **)(*((void *)&v133 + 1) + 8 * (void)m);
        v71 = self->_log;
        if (os_log_type_enabled((os_log_t)v71, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v153 = v70;
          _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)v71, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
        if (([v36 containsObject:v70] & 1) == 0
          && ([v124 containsObject:v70] & 1) == 0)
        {
          uint64_t v72 = [v6 objectForKeyedSubscript:v70];
          v73 = (void *)v72;
          if (v117 && v72) {
            [v117 addObject:v72];
          }
          [v6 removeObjectForKey:v70];
          v74 = self->_log;
          if (os_log_type_enabled((os_log_t)v74, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v153 = v70;
            _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)v74, OS_LOG_TYPE_DEBUG, "Purged inactive widget budget %@ from managed budgets", buf, 0xCu);
          }
        }
      }
      id v67 = [v118 countByEnumeratingWithState:&v133 objects:v157 count:16];
    }
    while (v67);
  }
  id v123 = objc_alloc_init((Class)NSMutableArray);
  long long v129 = 0u;
  long long v130 = 0u;
  long long v131 = 0u;
  long long v132 = 0u;
  id v119 = [v116 allKeys];
  id v75 = [v119 countByEnumeratingWithState:&v129 objects:v156 count:16];
  if (v75)
  {
    id v76 = v75;
    uint64_t v77 = *(void *)v130;
    do
    {
      for (n = 0; n != v76; n = (char *)n + 1)
      {
        if (*(void *)v130 != v77) {
          objc_enumerationMutation(v119);
        }
        v79 = *(void **)(*((void *)&v129 + 1) + 8 * (void)n);
        v80 = [v116 objectForKeyedSubscript:v79];
        [v80 doubleValue];
        double v82 = v81;

        v83 = [v6 objectForKeyedSubscript:v79];

        if (v83)
        {
          v84 = [v6 objectForKeyedSubscript:v79];
          [v84 capacity];
          if (v85 != v82)
          {
            v86 = self->_log;
            if (os_log_type_enabled((os_log_t)v86, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138543618;
              v153 = v84;
              __int16 v154 = 2048;
              double v155 = v82;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)v86, OS_LOG_TYPE_INFO, "budget %{public}@ updating capacity to %f", buf, 0x16u);
            }
            [v84 setCapacity:v82];
            [v84 setAllocationType:4];
          }
        }
        else
        {
          v87 = [v122 objectForKeyedSubscript:v79];

          if (v87)
          {
            v84 = [v122 objectForKeyedSubscript:v79];
            [v84 capacity];
            if (v88 == v82)
            {
              v96 = self->_log;
              if (os_log_type_enabled((os_log_t)v96, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138543362;
                v153 = v84;
                v90 = v96;
                v91 = "Loaded: %{public}@";
                uint32_t v92 = 12;
LABEL_79:
                _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_INFO, v91, buf, v92);
              }
            }
            else
            {
              [v84 setCapacity:v82];
              v89 = self->_log;
              if (os_log_type_enabled((os_log_t)v89, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138543618;
                v153 = v84;
                __int16 v154 = 2048;
                double v155 = v82;
                v90 = v89;
                v91 = "Updated: %{public}@, Capacity=%f";
                uint32_t v92 = 22;
                goto LABEL_79;
              }
            }
            [v84 setAllocationType:4];
            [v6 setObject:v84 forKeyedSubscript:v79];
            [v123 addObject:v84];
            goto LABEL_81;
          }
          v84 = +[_DASWidgetRefreshBudgetManager widgetBudgetIDFromBudgetName:v79];
          if (!v84)
          {
            v93 = self->_log;
            if (os_log_type_enabled((os_log_t)v93, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v153 = v79;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)v93, OS_LOG_TYPE_DEFAULT, "Somehow couldn't find widget for budget: %@", buf, 0xCu);
            }
          }
          v94 = +[_DASWidgetRefreshBudget budgetWithName:v79 widgetBudgetID:v84 capacity:4 balance:v82 allocationType:0.0];
          [v6 setObject:v94 forKeyedSubscript:v79];
          [v123 addObject:v94];
          v95 = self->_log;
          if (os_log_type_enabled((os_log_t)v95, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            v153 = v94;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)v95, OS_LOG_TYPE_INFO, "budget %{public}@ init - newly created", buf, 0xCu);
          }
        }
LABEL_81:
      }
      id v76 = [v119 countByEnumeratingWithState:&v129 objects:v156 count:16];
    }
    while (v76);
  }

  long long v127 = 0u;
  long long v128 = 0u;
  long long v125 = 0u;
  long long v126 = 0u;
  id v120 = v114;
  id v97 = [v120 countByEnumeratingWithState:&v125 objects:v151 count:16];
  if (v97)
  {
    id v98 = v97;
    uint64_t v99 = *(void *)v126;
    do
    {
      for (ii = 0; ii != v98; ii = (char *)ii + 1)
      {
        if (*(void *)v126 != v99) {
          objc_enumerationMutation(v120);
        }
        v101 = *(void **)(*((void *)&v125 + 1) + 8 * (void)ii);
        v102 = self->_log;
        if (os_log_type_enabled((os_log_t)v102, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v153 = v101;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)v102, OS_LOG_TYPE_INFO, "managing override list widget %@", buf, 0xCu);
        }
        v103 = +[_DASWidgetRefreshBudgetManager budgetNameFromWidgetBudgetID:v101];
        double v104 = (double)[(_DASWidgetRefreshUsageTracker *)self->_widgetRefreshUsageTracker maxWidgetRefreshBudgetForIndividualDaily];
        double v105 = v104 * 0.125;
        v106 = [v6 objectForKeyedSubscript:v103];

        if (v106)
        {
          v107 = [v6 objectForKeyedSubscript:v103];
          [v107 setCapacity:v104];
          [v107 balance];
          if (v108 > v105)
          {
            [v107 balance];
            double v105 = v109;
          }
          [v107 setBalance:v105];
          [v107 setAllocationType:1];
          v110 = self->_log;
          if (os_log_type_enabled((os_log_t)v110, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            v153 = v107;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)v110, OS_LOG_TYPE_INFO, "Modified capacity and allocation type of override list widget budget %{public}@", buf, 0xCu);
          }
        }
        else
        {
          v107 = +[_DASWidgetRefreshBudget budgetWithName:v103 widgetBudgetID:v101 capacity:1 balance:v104 allocationType:v105];
          v111 = self->_log;
          if (os_log_type_enabled((os_log_t)v111, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            v153 = v107;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)v111, OS_LOG_TYPE_INFO, "budget %{public}@ init - newly created override list widget budget", buf, 0xCu);
          }
          [v6 setObject:v107 forKeyedSubscript:v103];
          [v123 addObject:v107];
        }
      }
      id v98 = [v120 countByEnumeratingWithState:&v125 objects:v151 count:16];
    }
    while (v98);
  }

  v112 = self->_log;
  if (os_log_type_enabled((os_log_t)v112, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v112, OS_LOG_TYPE_INFO, "Instantiation complete", buf, 2u);
  }

  return v123;
}

- (void)resetBudgets
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100031FB0;
  block[3] = &unk_1001754F8;
  void block[4] = self;
  dispatch_sync(queue, block);
}

- (id)requiredBudgetsInfo
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = [(_DASWidgetRefreshUsageTracker *)self->_widgetRefreshUsageTracker dailyBudgetsForAllWidgets];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [v4 allKeys];
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v11 = +[_DASWidgetRefreshBudgetManager budgetNameFromWidgetBudgetID:v10];
        uint64_t v12 = [v4 objectForKeyedSubscript:v10];
        [v3 setObject:v12 forKeyedSubscript:v11];
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v3;
}

- (double)balanceForBudgetWithName:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = (double *)&v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000322AC;
  block[3] = &unk_100175B30;
  id v10 = v4;
  uint64_t v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  double v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (double)capacityForBudgetWithName:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = (double *)&v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000323F0;
  block[3] = &unk_100175B30;
  id v10 = v4;
  uint64_t v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  double v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (double)balanceForWidgetBudgetID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = (double *)&v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100032534;
  block[3] = &unk_100175948;
  void block[4] = self;
  id v10 = v4;
  uint64_t v11 = &v12;
  id v6 = v4;
  dispatch_sync(queue, block);
  double v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)setBalance:(double)a3 forBudgetWithName:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003268C;
  block[3] = &unk_100175B58;
  void block[4] = self;
  id v10 = v6;
  double v11 = a3;
  id v8 = v6;
  dispatch_sync(queue, block);
}

- (void)decrementBy:(double)a3 forBudgetWithName:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000328A4;
  block[3] = &unk_100175B58;
  void block[4] = self;
  id v10 = v6;
  double v11 = a3;
  id v8 = v6;
  dispatch_sync(queue, block);
}

- (void)setCapacity:(double)a3 forBudgetWithName:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100032AD0;
  block[3] = &unk_100175B58;
  void block[4] = self;
  id v10 = v6;
  double v11 = a3;
  id v8 = v6;
  dispatch_sync(queue, block);
}

- (void)updateBudget:(id)a3
{
}

- (void)reportActivityNoLongerRunning:(id)a3
{
  id v4 = a3;
  [(_DASWidgetRefreshUsageTracker *)self->_widgetRefreshUsageTracker stopTrackingActivity:v4];
  if (v5 > 0.0)
  {
    double v6 = v5;
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = log;
      uint64_t v9 = [v4 widgetBudgetID];
      int v12 = 138543618;
      uint64_t v13 = v9;
      __int16 v14 = 2048;
      double v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Attempting to decrement widget refresh budget for  %{public}@ by %lf", (uint8_t *)&v12, 0x16u);
    }
    id v10 = [v4 widgetBudgetID];
    double v11 = +[_DASWidgetRefreshBudgetManager budgetNameFromWidgetBudgetID:v10];
    [(_DASWidgetRefreshBudgetManager *)self decrementBy:v11 forBudgetWithName:v6];
  }
}

- (void)reportActivityRunning:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100032E20;
  v7[3] = &unk_100175570;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (_CDContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (NSMutableDictionary)managedBudgets
{
  return self->_managedBudgets;
}

- (void)setManagedBudgets:(id)a3
{
}

- (_DASBudgetModulator)widgetBudgetModulator
{
  return self->_widgetBudgetModulator;
}

- (void)setWidgetBudgetModulator:(id)a3
{
}

- (_DASDefaultsBudgetPersistence)defaultsPersistence
{
  return self->_defaultsPersistence;
}

- (void)setDefaultsPersistence:(id)a3
{
}

- (_DASWidgetRefreshUsageTracker)widgetRefreshUsageTracker
{
  return self->_widgetRefreshUsageTracker;
}

- (void)setWidgetRefreshUsageTracker:(id)a3
{
}

- (_DASDataProtectionStateMonitor)lockStateMonitor
{
  return self->_lockStateMonitor;
}

- (void)setLockStateMonitor:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_lockStateMonitor, 0);
  objc_storeStrong((id *)&self->_widgetRefreshUsageTracker, 0);
  objc_storeStrong((id *)&self->_defaultsPersistence, 0);
  objc_storeStrong((id *)&self->_widgetBudgetModulator, 0);
  objc_storeStrong((id *)&self->_managedBudgets, 0);
  objc_storeStrong((id *)&self->_context, 0);

  objc_storeStrong((id *)&self->_log, 0);
}

@end