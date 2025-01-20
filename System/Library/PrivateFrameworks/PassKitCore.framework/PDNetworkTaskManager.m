@interface PDNetworkTaskManager
- (BOOL)containsTaskPassingTest:(id)a3;
- (PDNetworkTaskManager)initWithDelegate:(id)a3 archiveName:(id)a4;
- (void)_activateOrScheduleEligibleTasksWithNetworkConnectivity:(BOOL)a3;
- (void)_activateTask:(id)a3;
- (void)_archiveTasks;
- (void)_createPowerAssertion;
- (void)_enqueueTask:(id)a3;
- (void)_lock_deactivateTask:(id)a3;
- (void)_releasePowerAssertion;
- (void)_tryToDequeueTasks;
- (void)_unarchiveTasks;
- (void)cancelTasksPassingTest:(id)a3;
- (void)dealloc;
- (void)nukeArchive;
- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4;
- (void)performTask:(id)a3;
- (void)task:(id)a3 encounteredError:(id)a4;
- (void)task:(id)a3 encounteredWarnings:(id)a4;
- (void)task:(id)a3 gotResult:(id)a4;
- (void)taskFailed:(id)a3;
- (void)taskFailedForAuthentication:(id)a3;
- (void)taskSucceeded:(id)a3;
@end

@implementation PDNetworkTaskManager

- (PDNetworkTaskManager)initWithDelegate:(id)a3 archiveName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v28.receiver = self;
  v28.super_class = (Class)PDNetworkTaskManager;
  v9 = [(PDNetworkTaskManager *)&v28 init];
  v10 = v9;
  if (v9)
  {
    v9->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v9->_delegate, a3);
    v11 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    enqueuedTasks = v10->_enqueuedTasks;
    v10->_enqueuedTasks = v11;

    v13 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    scheduledTasks = v10->_scheduledTasks;
    v10->_scheduledTasks = v13;

    v15 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    activeTasks = v10->_activeTasks;
    v10->_activeTasks = v15;

    v17 = +[NSString stringWithFormat:@"%@_v%lu", v8, 6];
    v18 = [v17 stringByAppendingPathExtension:@"archive"];

    v19 = PKHomeDirectoryPath();
    uint64_t v20 = [v19 stringByAppendingPathComponent:v18];
    archivePath = v10->_archivePath;
    v10->_archivePath = (NSString *)v20;

    v22 = (NSString *)[objc_alloc((Class)NSString) initWithFormat:@"PDNetworkTaskManager.%@", v8];
    scheduledActivityClientIdentifier = v10->_scheduledActivityClientIdentifier;
    v10->_scheduledActivityClientIdentifier = v22;

    v24 = (NSString *)[objc_alloc((Class)NSString) initWithFormat:@"PDNetworkTaskManager.%@", v8];
    powerAssertionName = v10->_powerAssertionName;
    v10->_powerAssertionName = v24;

    v26 = PDDefaultQueue();
    PDScheduledActivityClientRegister();

    [(PDNetworkTaskManager *)v10 _unarchiveTasks];
    if ((PDScheduledActivityExists() & 1) == 0) {
      [(PDNetworkTaskManager *)v10 _tryToDequeueTasks];
    }
  }
  return v10;
}

- (void)dealloc
{
  delegate = self->_delegate;
  self->_delegate = 0;

  [(PDNetworkTaskManager *)self _releasePowerAssertion];
  v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)PDNetworkTaskManager;
  [(PDNetworkTaskManager *)&v5 dealloc];
}

- (void)performTask:(id)a3
{
  [(PDNetworkTaskManager *)self _enqueueTask:a3];
  [(PDNetworkTaskManager *)self _tryToDequeueTasks];
}

- (void)cancelTasksPassingTest:(id)a3
{
  v4 = (uint64_t (**)(id, void))a3;
  id v5 = objc_alloc_init((Class)NSMutableSet);
  os_unfair_lock_lock(&self->_lock);
  [(NSMutableArray *)self->_enqueuedTasks arrayByAddingObjectsFromArray:self->_scheduledTasks];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [obj countByEnumeratingWithState:&v24 objects:v31 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v25;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        int v11 = v4[2](v4, v10);
        v12 = PKLogFacilityTypeGetObject();
        BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
        if (v11)
        {
          if (v13)
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v30 = v10;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Canceling Task: %@", buf, 0xCu);
          }

          [v5 addObject:v10];
          [(PDNetworkTaskManager *)self _lock_deactivateTask:v10];
          [(NSMutableArray *)self->_enqueuedTasks removeObject:v10];
          [(NSMutableArray *)self->_scheduledTasks removeObject:v10];
        }
        else
        {
          if (v13)
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v30 = v10;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Letting Task Continue: %@", buf, 0xCu);
          }
        }
      }
      id v7 = [obj countByEnumeratingWithState:&v24 objects:v31 count:16];
    }
    while (v7);
  }
  os_unfair_lock_unlock(&self->_lock);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v14 = v5;
  id v15 = [v14 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v21;
    do
    {
      for (j = 0; j != v16; j = (char *)j + 1)
      {
        if (*(void *)v21 != v17) {
          objc_enumerationMutation(v14);
        }
        [*(id *)(*((void *)&v20 + 1) + 8 * (void)j) cancel];
      }
      id v16 = [v14 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v16);
  }

  [(PDNetworkTaskManager *)self _tryToDequeueTasks];
}

- (BOOL)containsTaskPassingTest:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  BOOL v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v6 = [(NSMutableArray *)self->_enqueuedTasks arrayByAddingObjectsFromArray:self->_scheduledTasks];
  os_unfair_lock_unlock(p_lock);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1001C9500;
  v9[3] = &unk_10073DD00;
  int v11 = &v12;
  id v7 = v4;
  id v10 = v7;
  [v6 enumerateObjectsUsingBlock:v9];
  LOBYTE(p_lock) = *((unsigned char *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return (char)p_lock;
}

- (void)nukeArchive
{
  id v3 = objc_alloc_init((Class)NSMutableSet);
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(NSMutableArray *)self->_enqueuedTasks arrayByAddingObjectsFromArray:self->_scheduledTasks];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        [v3 addObject:v9];
        [(PDNetworkTaskManager *)self _lock_deactivateTask:v9];
      }
      id v6 = [v4 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v6);
  }
  [(NSMutableSet *)self->_activeTasks removeAllObjects];
  [(NSMutableArray *)self->_scheduledTasks removeAllObjects];
  [(NSMutableArray *)self->_enqueuedTasks removeAllObjects];
  os_unfair_lock_unlock(&self->_lock);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v10 = v3;
  id v11 = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      for (j = 0; j != v12; j = (char *)j + 1)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * (void)j), "cancel", (void)v16);
      }
      id v12 = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v12);
  }

  char v15 = +[NSFileManager defaultManager];
  [v15 removeItemAtPath:self->_archivePath error:0];

  PDScheduledActivityRemove();
}

- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4
{
  if (objc_msgSend(a3, "isEqualToString:", @"PDNetworkTaskManagerActivateEligibleTasksActivityIdentifier", a4))
  {
    [(PDNetworkTaskManager *)self _activateOrScheduleEligibleTasksWithNetworkConnectivity:1];
  }
}

- (void)_enqueueTask:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v6 = (uint64_t)[(NSMutableArray *)self->_enqueuedTasks count];
  if (v6 < 1)
  {
LABEL_11:
    uint64_t v14 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 138412290;
      id v25 = v4;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "New task [%@] does not interact with any enqueued tasks", (uint8_t *)&v24, 0xCu);
    }

LABEL_14:
    [(NSMutableArray *)self->_enqueuedTasks addObject:v4];
  }
  else
  {
    unint64_t v7 = v6;
    do
    {
      unint64_t v8 = v7 - 1;
      uint64_t v9 = [(NSMutableArray *)self->_enqueuedTasks objectAtIndex:v7 - 1];
      if ([v4 coalescesWithTaskSubclass:objc_opt_class()]) {
        id v10 = [v4 actionForInactiveTask:v9];
      }
      else {
        id v10 = 0;
      }

      if (v7 < 2) {
        break;
      }
      --v7;
    }
    while (!v10);
    switch((unint64_t)v10)
    {
      case 1uLL:
        long long v18 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          long long v19 = [(NSMutableArray *)self->_enqueuedTasks objectAtIndex:v8];
          int v24 = 138412546;
          id v25 = v4;
          __int16 v26 = 2112;
          long long v27 = v19;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "New task [%@] supplants enqueued task [%@]", (uint8_t *)&v24, 0x16u);
        }
        [(NSMutableArray *)self->_enqueuedTasks replaceObjectAtIndex:v8 withObject:v4];
        goto LABEL_31;
      case 2uLL:
      case 3uLL:
        id v11 = PKLogFacilityTypeGetObject();
        if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_30;
        }
        id v12 = [(NSMutableArray *)self->_enqueuedTasks objectAtIndex:v8];
        int v24 = 138412546;
        id v25 = v4;
        __int16 v26 = 2112;
        long long v27 = v12;
        uint64_t v13 = "New task [%@] coalesces with enqueued task [%@]";
        break;
      case 4uLL:
        char v15 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          long long v16 = [(NSMutableArray *)self->_enqueuedTasks objectAtIndex:v8];
          int v24 = 138412546;
          id v25 = v4;
          __int16 v26 = 2112;
          long long v27 = v16;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "New task [%@] merges with enqueued task [%@]", (uint8_t *)&v24, 0x16u);
        }
        long long v17 = [(NSMutableArray *)self->_enqueuedTasks objectAtIndex:v8];
        [v17 mergeWithNewerTask:v4];

        goto LABEL_31;
      case 5uLL:
        long long v20 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          long long v21 = [(NSMutableArray *)self->_enqueuedTasks objectAtIndex:v8];
          int v24 = 138412546;
          id v25 = v4;
          __int16 v26 = 2112;
          long long v27 = v21;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "New task [%@] enqueues behind enqueued task [%@]", (uint8_t *)&v24, 0x16u);
        }
        goto LABEL_14;
      case 6uLL:
        long long v22 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          long long v23 = [(NSMutableArray *)self->_enqueuedTasks objectAtIndex:v8];
          int v24 = 138412546;
          id v25 = v4;
          __int16 v26 = 2112;
          long long v27 = v23;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "New task [%@] is enqueues in font of enqueued task [%@]", (uint8_t *)&v24, 0x16u);
        }
        [(NSMutableArray *)self->_enqueuedTasks insertObject:v4 atIndex:v8];
        goto LABEL_31;
      case 7uLL:
        id v11 = PKLogFacilityTypeGetObject();
        if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_30;
        }
        id v12 = [(NSMutableArray *)self->_enqueuedTasks objectAtIndex:v8];
        int v24 = 138412546;
        id v25 = v4;
        __int16 v26 = 2112;
        long long v27 = v12;
        uint64_t v13 = "New task [%@] is forced to drop by enqueued task [%@]";
        break;
      default:
        goto LABEL_11;
    }
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v24, 0x16u);

LABEL_30:
  }
LABEL_31:
  os_unfair_lock_unlock(p_lock);
}

- (void)_tryToDequeueTasks
{
  id v36 = objc_alloc_init((Class)NSMutableSet);
  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v3 = [(NSMutableArray *)self->_enqueuedTasks copy];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id obj = v3;
  id v4 = [obj countByEnumeratingWithState:&v47 objects:v57 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v38 = *(void *)v48;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v48 != v38) {
          objc_enumerationMutation(obj);
        }
        unint64_t v7 = *(void **)(*((void *)&v47 + 1) + 8 * (void)v6);
        long long v43 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        unint64_t v8 = self->_scheduledTasks;
        id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v43, v56, 16, lock);
        if (v9)
        {
          id v10 = v9;
          id v11 = 0;
          uint64_t v12 = *(void *)v44;
          while (2)
          {
            uint64_t v13 = 0;
            uint64_t v14 = v11;
            do
            {
              if (*(void *)v44 != v12) {
                objc_enumerationMutation(v8);
              }
              id v11 = *(id *)(*((void *)&v43 + 1) + 8 * (void)v13);

              if ([v7 coalescesWithTaskSubclass:objc_opt_class()])
              {
                id v15 = [(NSMutableSet *)self->_activeTasks containsObject:v11]
                    ? [v7 actionForActiveTask:v11]
                    : [v7 actionForInactiveTask:v11];
                id v16 = v15;
                if (v15)
                {

                  switch((unint64_t)v16)
                  {
                    case 1uLL:
                      long long v19 = PKLogFacilityTypeGetObject();
                      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 138412546;
                        v53 = v7;
                        __int16 v54 = 2112;
                        id v55 = v11;
                        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Enqueued task [%@] supplants scheduled task [%@]", buf, 0x16u);
                      }

                      [v36 addObject:v11];
                      [(PDNetworkTaskManager *)self _lock_deactivateTask:v11];
                      [(NSMutableArray *)self->_scheduledTasks removeObject:v11];
                      goto LABEL_22;
                    case 2uLL:
                      long long v20 = PKLogFacilityTypeGetObject();
                      if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
                        goto LABEL_38;
                      }
                      *(_DWORD *)buf = 138412546;
                      v53 = v7;
                      __int16 v54 = 2112;
                      id v55 = v11;
                      long long v21 = v20;
                      long long v22 = "Enqueued task [%@] coalesces with scheduled task [%@]";
                      goto LABEL_37;
                    case 3uLL:
                      long long v23 = PKLogFacilityTypeGetObject();
                      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 138412546;
                        v53 = v7;
                        __int16 v54 = 2112;
                        id v55 = v11;
                        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Enqueued task [%@] coalesces with and renews scheduled task [%@]", buf, 0x16u);
                      }

                      goto LABEL_42;
                    case 4uLL:
                      id v25 = PKLogFacilityTypeGetObject();
                      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 138412546;
                        v53 = v7;
                        __int16 v54 = 2112;
                        id v55 = v11;
                        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Enqueued task [%@] merges with scheduled task [%@]", buf, 0x16u);
                      }

                      [v11 mergeWithNewerTask:v7];
LABEL_42:
                      [(NSMutableArray *)self->_enqueuedTasks removeObject:v7];
                      __int16 v26 = +[NSDate date];
                      [v11 setNextStartDate:v26];

                      [v11 resetBackoff];
                      goto LABEL_43;
                    case 6uLL:
                      long long v27 = PKLogFacilityTypeGetObject();
                      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 138412546;
                        v53 = v7;
                        __int16 v54 = 2112;
                        id v55 = v11;
                        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Enqueued task [%@] should precede scheduled task [%@], dequeueing ASAP", buf, 0x16u);
                      }

                      objc_super v28 = +[NSDate date];
                      [v11 setNextStartDate:v28];

                      [v11 resetBackoff];
                      goto LABEL_22;
                    case 7uLL:
                      long long v20 = PKLogFacilityTypeGetObject();
                      if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
                        goto LABEL_38;
                      }
                      *(_DWORD *)buf = 138412546;
                      v53 = v7;
                      __int16 v54 = 2112;
                      id v55 = v11;
                      long long v21 = v20;
                      long long v22 = "Enqueued task [%@] is forced to drop by scheduled task [%@]";
LABEL_37:
                      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, v22, buf, 0x16u);
LABEL_38:

                      [(NSMutableArray *)self->_enqueuedTasks removeObject:v7];
                      break;
                    default:
                      int v24 = PKLogFacilityTypeGetObject();
                      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 138412546;
                        v53 = v7;
                        __int16 v54 = 2112;
                        id v55 = v11;
                        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Enqueued task [%@] remains enqueued behind scheduled task [%@]", buf, 0x16u);
                      }

                      goto LABEL_43;
                  }
                  goto LABEL_43;
                }
              }
              uint64_t v13 = (char *)v13 + 1;
              uint64_t v14 = v11;
            }
            while (v10 != v13);
            id v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v43 objects:v56 count:16];
            if (v10) {
              continue;
            }
            break;
          }
        }
        long long v17 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v53 = v7;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Enqueued task [%@] does not interact with any scheduled tasks, dequeueing", buf, 0xCu);
        }

        id v11 = 0;
LABEL_22:
        [v7 setManager:self];
        long long v18 = +[NSDate date];
        [v7 setNextStartDate:v18];

        [v7 resetBackoff];
        [(NSMutableArray *)self->_enqueuedTasks removeObject:v7];
        [(NSMutableArray *)self->_scheduledTasks addObject:v7];
LABEL_43:

        uint64_t v6 = (char *)v6 + 1;
      }
      while (v6 != v5);
      id v29 = [obj countByEnumeratingWithState:&v47 objects:v57 count:16];
      id v5 = v29;
    }
    while (v29);
  }

  os_unfair_lock_unlock(lock);
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v30 = v36;
  id v31 = [v30 countByEnumeratingWithState:&v39 objects:v51 count:16];
  if (v31)
  {
    id v32 = v31;
    uint64_t v33 = *(void *)v40;
    do
    {
      for (i = 0; i != v32; i = (char *)i + 1)
      {
        if (*(void *)v40 != v33) {
          objc_enumerationMutation(v30);
        }
        objc_msgSend(*(id *)(*((void *)&v39 + 1) + 8 * i), "cancel", lock);
      }
      id v32 = [v30 countByEnumeratingWithState:&v39 objects:v51 count:16];
    }
    while (v32);
  }

  [(PDNetworkTaskManager *)self _archiveTasks];
  [(PDNetworkTaskManager *)self _activateOrScheduleEligibleTasksWithNetworkConnectivity:PKNetworkConnectivityAvailable() != 0];
}

- (void)_activateOrScheduleEligibleTasksWithNetworkConnectivity:(BOOL)a3
{
  BOOL v3 = a3;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  scheduledTasks = self->_scheduledTasks;
  unint64_t v7 = [(NSMutableSet *)self->_activeTasks allObjects];
  unint64_t v8 = [(NSMutableArray *)scheduledTasks pk_arrayByRemovingObjectsInArray:v7];

  os_unfair_lock_unlock(p_lock);
  PDScheduledActivityRemove();
  if ([v8 count])
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v9 = v8;
    id v10 = [v9 countByEnumeratingWithState:&v27 objects:v33 count:16];
    if (v10)
    {
      id v11 = v10;
      __int16 v26 = v8;
      uint64_t v12 = 0;
      uint64_t v13 = *(void *)v28;
      char v14 = 1;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v28 != v13) {
            objc_enumerationMutation(v9);
          }
          id v16 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          if (v3
            && ([*(id *)(*((void *)&v27 + 1) + 8 * i) nextStartDate],
                long long v17 = objc_claimAutoreleasedReturnValue(),
                [v17 timeIntervalSinceNow],
                double v19 = v18,
                v17,
                v19 < 10.0))
          {
            [(PDNetworkTaskManager *)self _activateTask:v16];
            char v14 = 0;
          }
          else
          {
            long long v20 = [v16 nextStartDate];
            uint64_t v21 = PKEarlierDate();

            uint64_t v12 = (void *)v21;
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v27 objects:v33 count:16];
      }
      while (v11);

      unint64_t v8 = v26;
      if ((v14 & 1) == 0) {
        goto LABEL_19;
      }
    }
    else
    {

      uint64_t v12 = 0;
    }
    long long v22 = +[NSDate date];
    long long v23 = PKLaterDate();

    int v24 = +[PDScheduledActivityCriteria maintenanceActivityCriteriaWithStartDate:v23];
    [v24 setRequireNetworkConnectivity:1];
    id v25 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v32 = v23;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Scheduling Activate Tasks Activity with a start date of: %@", buf, 0xCu);
    }

    PDScheduledActivityRegister();
LABEL_19:
  }
}

- (void)_activateTask:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  if ([(NSMutableSet *)self->_activeTasks containsObject:v4])
  {
LABEL_11:
    os_unfair_lock_unlock(&self->_lock);
    goto LABEL_12;
  }
  if (![v4 isValid])
  {
    unint64_t v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100516950((uint64_t)v4, v8);
    }

    [(NSMutableArray *)self->_scheduledTasks removeObject:v4];
    [(PDNetworkTaskManager *)self _archiveTasks];
    goto LABEL_11;
  }
  if (![(NSMutableSet *)self->_activeTasks count])
  {
    [(PDNetworkTaskManager *)self _createPowerAssertion];
    SBSSetStatusBarShowsActivityForApplication();
    id v5 = (OS_os_transaction *)PDOSTransactionCreate("PDNetworkTaskManager.active_tasks");
    activeTasksTransaction = self->_activeTasksTransaction;
    self->_activeTasksTransaction = v5;
  }
  unint64_t v7 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Activating task %@", (uint8_t *)&v9, 0xCu);
  }

  [(NSMutableSet *)self->_activeTasks addObject:v4];
  os_unfair_lock_unlock(&self->_lock);
  [v4 start:1];
LABEL_12:
}

- (void)_lock_deactivateTask:(id)a3
{
  id v4 = a3;
  if ([(NSMutableSet *)self->_activeTasks containsObject:v4])
  {
    activeTasksTransaction = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(activeTasksTransaction, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      id v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, activeTasksTransaction, OS_LOG_TYPE_DEFAULT, "Deactivating task %@", (uint8_t *)&v13, 0xCu);
    }

    [(NSMutableSet *)self->_activeTasks removeObject:v4];
    id v6 = [(NSMutableSet *)self->_activeTasks count];
    BOOL v7 = os_log_type_enabled(activeTasksTransaction, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v7)
      {
        unint64_t v8 = (objc_class *)objc_opt_class();
        int v9 = NSStringFromClass(v8);
        activeTasks = self->_activeTasks;
        int v13 = 138543874;
        id v14 = v9;
        __int16 v15 = 2048;
        id v16 = self;
        __int16 v17 = 2112;
        double v18 = activeTasks;
        _os_log_impl((void *)&_mh_execute_header, activeTasksTransaction, OS_LOG_TYPE_DEFAULT, "%{public}@ %p: remaining active tasks: %@", (uint8_t *)&v13, 0x20u);
      }
    }
    else
    {
      if (v7)
      {
        id v11 = (objc_class *)objc_opt_class();
        uint64_t v12 = NSStringFromClass(v11);
        int v13 = 138543618;
        id v14 = v12;
        __int16 v15 = 2048;
        id v16 = self;
        _os_log_impl((void *)&_mh_execute_header, activeTasksTransaction, OS_LOG_TYPE_DEFAULT, "No tasks remain in %{public}@ %p", (uint8_t *)&v13, 0x16u);
      }
      [(PDNetworkTaskManager *)self _releasePowerAssertion];
      SBSSetStatusBarShowsActivityForApplication();
      activeTasksTransaction = self->_activeTasksTransaction;
      self->_activeTasksTransaction = 0;
    }
  }
}

- (void)_createPowerAssertion
{
  [(PDNetworkTaskManager *)self _releasePowerAssertion];
  IOPMAssertionID AssertionID = 0;
  v19[0] = @"AssertType";
  v19[1] = @"AssertLevel";
  v20[0] = @"NetworkClientActive";
  v20[1] = &off_10078B010;
  powerAssertionName = self->_powerAssertionName;
  v19[2] = @"AssertName";
  v19[3] = @"TimeoutSeconds";
  v20[2] = powerAssertionName;
  v20[3] = &off_10078B028;
  CFDictionaryRef v4 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:4];
  if (!IOPMAssertionCreateWithProperties(v4, &AssertionID))
  {
    self->_unsigned int powerAssertionIdentifier = AssertionID;
    id v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = (objc_class *)objc_opt_class();
      BOOL v7 = NSStringFromClass(v6);
      unint64_t v8 = self->_powerAssertionName;
      unsigned int powerAssertionIdentifier = self->_powerAssertionIdentifier;
      *(_DWORD *)buf = 138544130;
      uint64_t v12 = v7;
      __int16 v13 = 2048;
      id v14 = v8;
      __int16 v15 = 2112;
      id v16 = self;
      __int16 v17 = 1024;
      unsigned int v18 = powerAssertionIdentifier;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ %p: Created power assertion: %@ (%d)", buf, 0x26u);
    }
  }
}

- (void)_releasePowerAssertion
{
  if (self->_powerAssertionIdentifier)
  {
    BOOL v3 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      CFDictionaryRef v4 = (objc_class *)objc_opt_class();
      id v5 = NSStringFromClass(v4);
      powerAssertionName = self->_powerAssertionName;
      unsigned int powerAssertionIdentifier = self->_powerAssertionIdentifier;
      int v8 = 138544130;
      int v9 = v5;
      __int16 v10 = 2048;
      id v11 = self;
      __int16 v12 = 2112;
      __int16 v13 = powerAssertionName;
      __int16 v14 = 1024;
      unsigned int v15 = powerAssertionIdentifier;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ %p: Released power assertion: %@ (%d)", (uint8_t *)&v8, 0x26u);
    }
    IOPMAssertionRelease(self->_powerAssertionIdentifier);
    self->_unsigned int powerAssertionIdentifier = 0;
  }
}

- (void)_archiveTasks
{
  if (!self->_archivePending)
  {
    BOOL v3 = (void *)PDOSTransactionCreate("PDNetworkTaskManager");
    dispatch_time_t v4 = dispatch_time(0, 5000000000);
    id v5 = PDDefaultQueue();
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1001CAD48;
    v7[3] = &unk_10072E198;
    id v8 = v3;
    int v9 = self;
    id v6 = v3;
    dispatch_after(v4, v5, v7);

    self->_archivePending = 1;
  }
}

- (void)_unarchiveTasks
{
  BOOL v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Unarchiving tasks...", buf, 2u);
  }

  dispatch_time_t v4 = +[NSDictionary dictionaryWithContentsOfFile:self->_archivePath];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    os_unfair_lock_t lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    long long v38 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v35 = 0u;
    long long v28 = v4;
    id v5 = [v4 PKArrayForKey:@"scheduled"];
    id v6 = [v5 countByEnumeratingWithState:&v35 objects:v44 count:16];
    if (!v6) {
      goto LABEL_19;
    }
    id v7 = v6;
    uint64_t v8 = *(void *)v36;
    while (1)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v36 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v35 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v11 = objc_opt_class();
          id v34 = 0;
          __int16 v12 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", v11, v10, &v34, lock);
          __int16 v13 = v34;
          if (v12)
          {
            [v12 setManager:self];
            [(NSMutableArray *)self->_scheduledTasks addObject:v12];
            if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
            {
              __int16 v14 = [v12 nextStartDate];
              *(_DWORD *)buf = 138412546;
              long long v41 = v12;
              __int16 v42 = 2112;
              long long v43 = v14;
              _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "     --> scheduled task: %@ (%@)", buf, 0x16u);
            }
            goto LABEL_17;
          }
        }
        else
        {
          __int16 v13 = 0;
        }
        __int16 v12 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          long long v41 = v13;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "PDNetworkTaskmanager: error occurred while trying to unarchive scheduled task. The data will be discarded. %@.", buf, 0xCu);
        }
LABEL_17:
      }
      id v7 = [v5 countByEnumeratingWithState:&v35 objects:v44 count:16];
      if (!v7)
      {
LABEL_19:

        long long v32 = 0u;
        long long v33 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        unsigned int v15 = [v28 PKArrayForKey:@"enqueued"];
        id v16 = [v15 countByEnumeratingWithState:&v30 objects:v39 count:16];
        if (!v16) {
          goto LABEL_34;
        }
        id v17 = v16;
        uint64_t v18 = *(void *)v31;
        while (1)
        {
          for (j = 0; j != v17; j = (char *)j + 1)
          {
            if (*(void *)v31 != v18) {
              objc_enumerationMutation(v15);
            }
            uint64_t v20 = *(void *)(*((void *)&v30 + 1) + 8 * (void)j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v21 = objc_opt_class();
              id v29 = 0;
              long long v22 = +[NSKeyedUnarchiver unarchivedObjectOfClass:v21 fromData:v20 error:&v29];
              long long v23 = v29;
              if (v22)
              {
                [(NSMutableArray *)self->_enqueuedTasks addObject:v22];
                if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  long long v41 = v22;
                  _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "     --> enqueued task: %@", buf, 0xCu);
                }

                goto LABEL_32;
              }
            }
            else
            {
              long long v23 = 0;
            }
            long long v22 = PKLogFacilityTypeGetObject();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              long long v41 = v23;
              _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "PDNetworkTaskmanager: error occurred while trying to unarchive enqueued task. The data will be discarded. %@.", buf, 0xCu);
            }
LABEL_32:
          }
          id v17 = [v15 countByEnumeratingWithState:&v30 objects:v39 count:16];
          if (!v17)
          {
LABEL_34:

            os_unfair_lock_unlock(lock);
            dispatch_time_t v4 = v28;
            goto LABEL_38;
          }
        }
      }
    }
  }
  int v24 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    id v25 = (objc_class *)objc_opt_class();
    __int16 v26 = NSStringFromClass(v25);
    *(_DWORD *)buf = 138543362;
    long long v41 = v26;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "PDNetworkTaskmanager: unexpected class detected while trying to unarchive tasks - %{public}@. The data will be discarded.", buf, 0xCu);
  }
LABEL_38:
}

- (void)task:(id)a3 gotResult:(id)a4
{
}

- (void)taskSucceeded:(id)a3
{
  delegate = self->_delegate;
  id v5 = a3;
  [(PDNetworkTaskDelegate *)delegate taskSucceeded:v5];
  os_unfair_lock_lock(&self->_lock);
  [(PDNetworkTaskManager *)self _lock_deactivateTask:v5];
  [(NSMutableArray *)self->_scheduledTasks removeObject:v5];

  os_unfair_lock_unlock(&self->_lock);
  [(PDNetworkTaskManager *)self _tryToDequeueTasks];
}

- (void)taskFailed:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  [(PDNetworkTaskManager *)self _lock_deactivateTask:v4];
  os_unfair_lock_unlock(&self->_lock);
  if ([v4 backoffComplete])
  {
    [(PDNetworkTaskDelegate *)self->_delegate taskFailed:v4];
    os_unfair_lock_lock(&self->_lock);
    [(NSMutableArray *)self->_scheduledTasks removeObject:v4];
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    [v4 nextBackoffInterval];
    double v6 = v5;
    [v4 incrementBackoff];
    [(PDNetworkTaskDelegate *)self->_delegate task:v4 willRetryAfterMinimumDelay:v6];
    id v7 = +[NSDate date];
    uint64_t v8 = [v7 dateByAddingTimeInterval:v6];
    [v4 setNextStartDate:v8];
  }
  int v9 = PDDefaultQueue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001CB858;
  block[3] = &unk_10072E1E8;
  block[4] = self;
  dispatch_async(v9, block);
}

- (void)taskFailedForAuthentication:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  [(PDNetworkTaskManager *)self _lock_deactivateTask:v4];
  [(NSMutableArray *)self->_scheduledTasks removeObject:v4];
  os_unfair_lock_unlock(&self->_lock);
  [(PDNetworkTaskDelegate *)self->_delegate taskFailed:v4];
  if [v4 canRequestReauthentication] && (objc_opt_respondsToSelector()) {
    [(PDNetworkTaskDelegate *)self->_delegate taskRequestedReauthentication:v4];
  }
  [v4 setCanRequestReauthentication:0];
  double v5 = PDDefaultQueue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001CB96C;
  block[3] = &unk_10072E1E8;
  block[4] = self;
  dispatch_async(v5, block);
}

- (void)task:(id)a3 encounteredError:(id)a4
{
}

- (void)task:(id)a3 encounteredWarnings:(id)a4
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_powerAssertionName, 0);
  objc_storeStrong((id *)&self->_scheduledActivityClientIdentifier, 0);
  objc_storeStrong((id *)&self->_archivePath, 0);
  objc_storeStrong((id *)&self->_activeTasksTransaction, 0);
  objc_storeStrong((id *)&self->_activeTasks, 0);
  objc_storeStrong((id *)&self->_scheduledTasks, 0);
  objc_storeStrong((id *)&self->_enqueuedTasks, 0);
}

@end