@interface IMAPServiceActivityController
+ (unsigned)remainingBodyRetries;
+ (void)setRemainingBodyRetries:(unsigned int)a3;
- (BOOL)__is_my_activity:(id)a3;
- (BOOL)bodyFetchPendingForRecord:(void *)a3;
- (BOOL)is_my_activity:(id)a3;
- (BOOL)taskOfTypeExists:(int64_t)a3;
- (id)bodyFetchActivityForRecord:(void *)a3;
- (id)initForService:(id)a3;
- (int64_t)currentTaskType;
- (void)__removeScheduledActivity:(id)a3;
- (void)_activityEnded:(id)a3;
- (void)_activityStarted:(id)a3;
- (void)_postNotificationName:(id)a3 userInfo:(id)a4;
- (void)_primaryTargetChanged:(id)a3;
- (void)_targetsAdded:(id)a3;
- (void)addScheduledActivity:(id)a3;
- (void)dealloc;
- (void)invalidate;
@end

@implementation IMAPServiceActivityController

- (int64_t)currentTaskType
{
  [(IMAPServiceActivityController *)self mf_lock];
  v3 = +[MFActivityMonitor currentTracebleMonitor];
  id v4 = [v3 voicemailTaskType:self->_activityToTaskType];

  [(IMAPServiceActivityController *)self mf_unlock];
  v5 = sub_1000295DC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    mambaID = self->mambaID;
    int v8 = 136315650;
    v9 = mambaID;
    __int16 v10 = 2080;
    v11 = " ";
    __int16 v12 = 1024;
    int v13 = (int)v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#I %s%s[IVM] currentTaskType: %d", (uint8_t *)&v8, 0x1Cu);
  }

  return (int64_t)v4;
}

+ (void)setRemainingBodyRetries:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = sub_1000295DC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#I [IVM] setRemainingBodyRetries: %u", (uint8_t *)v8, 8u);
  }

  v5 = +[NSThread currentThread];
  v6 = [v5 threadDictionary];

  if (v3)
  {
    id v7 = [objc_alloc((Class)NSNumber) initWithUnsignedInt:v3];
    [v6 setObject:v7 forKey:@"_VVIMAPBodyRetries"];
  }
  else
  {
    [v6 removeObjectForKey:@"_VVIMAPBodyRetries"];
  }
}

+ (unsigned)remainingBodyRetries
{
  v2 = +[NSThread currentThread];
  uint64_t v3 = [v2 threadDictionary];

  id v4 = [v3 objectForKey:@"_VVIMAPBodyRetries"];
  unsigned int v5 = [v4 unsignedIntValue];
  v6 = sub_1000295DC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#I [IVM] remainingBodyRetries: %u", (uint8_t *)v8, 8u);
  }

  return v5;
}

- (id)initForService:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)IMAPServiceActivityController;
  unsigned int v5 = [(IMAPServiceActivityController *)&v12 init];
  if (v5)
  {
    v5->mambaID = (const char *)[v4 getServiceObjLogPrefix];
    v6 = sub_1000295DC();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      mambaID = v5->mambaID;
      *(_DWORD *)buf = 136316162;
      v14 = mambaID;
      __int16 v15 = 2080;
      v16 = " ";
      __int16 v17 = 2048;
      v18 = v5;
      __int16 v19 = 2112;
      id v20 = v4;
      __int16 v21 = 2112;
      v22 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#I %s%s[IVM] %p IMAPServiceActivityController::initForService: %@: -> %@", buf, 0x34u);
    }

    objc_storeWeak((id *)&v5->_service, v4);
    int v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    activityToTaskType = v5->_activityToTaskType;
    v5->_activityToTaskType = v8;

    __int16 v10 = +[NSNotificationCenter defaultCenter];
    [v10 addObserver:v5 selector:"_activityStarted:" name:MonitoredActivityStarted object:0];
    [v10 addObserver:v5 selector:"_activityEnded:" name:MonitoredActivityEnded object:0];
    [v10 addObserver:v5 selector:"_primaryTargetChanged:" name:MonitoredActivityPrimaryTargetChanged object:0];
    [v10 addObserver:v5 selector:"_targetsAdded:" name:MonitoredActivityDidAddActivityTarget object:0];
  }
  return v5;
}

- (void)addScheduledActivity:(id)a3
{
  id v4 = a3;
  [(IMAPServiceActivityController *)self mf_lock];
  scheduledActivities = self->_scheduledActivities;
  if (!scheduledActivities)
  {
    v6 = (NSMutableDictionary *)objc_opt_new();
    id v7 = self->_scheduledActivities;
    self->_scheduledActivities = v6;

    scheduledActivities = self->_scheduledActivities;
  }
  int v8 = [v4 taskName];
  v9 = +[NSValue valueWithPointer:v4];
  [(NSMutableDictionary *)scheduledActivities setObject:v8 forKey:v9];

  __int16 v10 = sub_1000295DC();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    mambaID = self->mambaID;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_service);
    int v13 = 136316162;
    v14 = mambaID;
    __int16 v15 = 2080;
    v16 = " ";
    __int16 v17 = 2048;
    id v18 = v4;
    __int16 v19 = 2112;
    id v20 = v4;
    __int16 v21 = 2112;
    id v22 = WeakRetained;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#I %s%s[IVM] added monitor %p.'%@' for %@ service", (uint8_t *)&v13, 0x34u);
  }
  [(IMAPServiceActivityController *)self mf_unlock];
}

- (BOOL)__is_my_activity:(id)a3
{
  id v4 = a3;
  scheduledActivities = self->_scheduledActivities;
  if (scheduledActivities)
  {
    v6 = +[NSValue valueWithPointer:v4];
    id v7 = [(NSMutableDictionary *)scheduledActivities objectForKey:v6];
    LOBYTE(scheduledActivities) = v7 != 0;
  }
  return (char)scheduledActivities;
}

- (BOOL)is_my_activity:(id)a3
{
  id v4 = a3;
  [(IMAPServiceActivityController *)self mf_lock];
  scheduledActivities = self->_scheduledActivities;
  if (scheduledActivities)
  {
    v6 = +[NSValue valueWithPointer:v4];
    id v7 = [(NSMutableDictionary *)scheduledActivities objectForKey:v6];
    LOBYTE(scheduledActivities) = v7 != 0;
  }
  [(IMAPServiceActivityController *)self mf_unlock];

  return (char)scheduledActivities;
}

- (void)__removeScheduledActivity:(id)a3
{
  id v4 = a3;
  scheduledActivities = self->_scheduledActivities;
  if (scheduledActivities)
  {
    v6 = +[NSValue valueWithPointer:v4];
    [(NSMutableDictionary *)scheduledActivities removeObjectForKey:v6];

    id v7 = sub_1000295DC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      mambaID = self->mambaID;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_service);
      int v10 = 136316162;
      v11 = mambaID;
      __int16 v12 = 2080;
      int v13 = " ";
      __int16 v14 = 2048;
      id v15 = v4;
      __int16 v16 = 2112;
      id v17 = v4;
      __int16 v18 = 2112;
      id v19 = WeakRetained;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#I %s%s[IVM] removed monitor %p.'%@' for %@service", (uint8_t *)&v10, 0x34u);
    }
  }
}

- (void)invalidate
{
  uint64_t v3 = sub_1000295DC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    mambaID = self->mambaID;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_service);
    int v6 = 136315650;
    id v7 = mambaID;
    __int16 v8 = 2080;
    v9 = " ";
    __int16 v10 = 2112;
    id v11 = WeakRetained;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#I %s%s[IVM] invalidate: %@", (uint8_t *)&v6, 0x20u);
  }
  objc_storeWeak((id *)&self->_service, 0);
}

- (void)dealloc
{
  [(IMAPServiceActivityController *)self mf_lock];
  uint64_t v3 = sub_1000295DC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    mambaID = self->mambaID;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_service);
    *(_DWORD *)buf = 136315650;
    __int16 v10 = mambaID;
    __int16 v11 = 2080;
    __int16 v12 = " ";
    __int16 v13 = 2112;
    id v14 = WeakRetained;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#I %s%s[IVM] dealloc: %@", buf, 0x20u);
  }
  int v6 = +[NSNotificationCenter defaultCenter];
  [v6 removeObserver:self];

  activeActivities = self->_activeActivities;
  if (activeActivities) {
    CFRelease(activeActivities);
  }
  [(IMAPServiceActivityController *)self mf_unlock];
  v8.receiver = self;
  v8.super_class = (Class)IMAPServiceActivityController;
  [(IMAPServiceActivityController *)&v8 dealloc];
}

- (BOOL)taskOfTypeExists:(int64_t)a3
{
  unsigned int v5 = sub_1000295DC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    mambaID = self->mambaID;
    int v12 = 136315650;
    __int16 v13 = mambaID;
    __int16 v14 = 2080;
    id v15 = " ";
    __int16 v16 = 1024;
    int v17 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#I %s%s[IVM] currentTaskType: %d", (uint8_t *)&v12, 0x1Cu);
  }

  [(IMAPServiceActivityController *)self mf_lock];
  activeActivities = self->_activeActivities;
  if (activeActivities)
  {
    objc_super v8 = CFDictionaryGetValue(activeActivities, +[NSNumber numberWithInteger:a3]);
    LODWORD(activeActivities) = [v8 count] != 0;
  }
  [(IMAPServiceActivityController *)self mf_unlock];
  v9 = sub_1000295DC();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v10 = self->mambaID;
    int v12 = 136315906;
    __int16 v13 = v10;
    __int16 v14 = 2080;
    id v15 = " ";
    __int16 v16 = 1024;
    int v17 = a3;
    __int16 v18 = 1024;
    int v19 = (int)activeActivities;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#I %s%s[IVM] taskOfTypeExists: %d -> %d", (uint8_t *)&v12, 0x22u);
  }

  return (char)activeActivities;
}

- (id)bodyFetchActivityForRecord:(void *)a3
{
  [(IMAPServiceActivityController *)self mf_lock];
  if (self->_activeActivities
    && [(NSMutableSet *)self->_inProcessRecords containsObject:a3])
  {
    unsigned int v5 = CFDictionaryGetValue(self->_activeActivities, &off_1000C84E0);
    int v6 = v5;
    if (v5)
    {
      id v7 = [v5 allObjects];
      id v8 = [v7 count];
      if (v8)
      {
        unint64_t v9 = 1;
        while (1)
        {
          __int16 v10 = [v7 objectAtIndex:v9 - 1];
          __int16 v11 = [v10 activityTargets];
          int v12 = v11;
          if (v11)
          {
            if ([v11 containsObject:a3]) {
              goto LABEL_8;
            }
          }
          else
          {
            __int16 v14 = [v10 activityTarget];

            if (v14 == a3)
            {
LABEL_8:
              id v13 = v10;
              goto LABEL_11;
            }
          }
          id v13 = 0;
LABEL_11:

          if (v9 < (unint64_t)v8)
          {
            ++v9;
            if (!v13) {
              continue;
            }
          }
          goto LABEL_17;
        }
      }
      id v13 = 0;
LABEL_17:
    }
    else
    {
      id v13 = 0;
    }

    id v15 = v13;
  }
  else
  {
    id v15 = 0;
  }
  [(IMAPServiceActivityController *)self mf_unlock];
  __int16 v16 = sub_1000295DC();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    mambaID = self->mambaID;
    int v19 = 136315650;
    id v20 = mambaID;
    __int16 v21 = 2080;
    id v22 = " ";
    __int16 v23 = 2112;
    v24 = v15;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "#I %s%s[IVM] bodyFetchActivityForRecord: %@", (uint8_t *)&v19, 0x20u);
  }

  return v15;
}

- (BOOL)bodyFetchPendingForRecord:(void *)a3
{
  unsigned int v5 = sub_1000295DC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    mambaID = self->mambaID;
    id v7 = (void *)sub_10006E7DC(a3);
    int v9 = 136315650;
    __int16 v10 = mambaID;
    __int16 v11 = 2080;
    int v12 = " ";
    __int16 v13 = 2112;
    __int16 v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#I %s%s[IVM] bodyFetchPendingForRecord: %@", (uint8_t *)&v9, 0x20u);
  }
  return [(NSMutableSet *)self->_inProcessRecords containsObject:a3];
}

- (void)_postNotificationName:(id)a3 userInfo:(id)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002A758;
  block[3] = &unk_1000C1C58;
  block[4] = self;
  id v8 = a3;
  id v9 = a4;
  id v5 = v9;
  id v6 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_activityStarted:(id)a3
{
  id v4 = a3;
  [(IMAPServiceActivityController *)self mf_lock];
  id v5 = [v4 object];
  if ([(IMAPServiceActivityController *)self __is_my_activity:v5])
  {
    id v6 = [v5 voicemailTaskType:self->_activityToTaskType];
    id v7 = sub_1000295DC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      mambaID = self->mambaID;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_service);
      *(_DWORD *)buf = 136316162;
      v24 = mambaID;
      __int16 v25 = 2080;
      v26 = " ";
      __int16 v27 = 2112;
      id v28 = v4;
      __int16 v29 = 2112;
      id v30 = WeakRetained;
      __int16 v31 = 2048;
      v32 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#I %s%s[IVM] _activityStarted: %@ service %@ monitor %p", buf, 0x34u);
    }
    if (v6)
    {
      activeActivities = self->_activeActivities;
      if (!activeActivities)
      {
        activeActivities = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        self->_activeActivities = activeActivities;
      }
      Value = (void *)CFDictionaryGetValue(activeActivities, +[NSNumber numberWithInteger:v6]);
      if (!Value)
      {
        Value = objc_opt_new();
        CFDictionarySetValue(self->_activeActivities, +[NSNumber numberWithInteger:v6], Value);
        CFRelease(Value);
      }
      CFSetAddValue((CFMutableSetRef)Value, v5);
      activityToTaskType = self->_activityToTaskType;
      __int16 v13 = [v5 taskName];
      __int16 v14 = +[NSValue valueWithPointer:v5];
      [(NSMutableDictionary *)activityToTaskType setObject:v13 forKey:v14];

      [(IMAPServiceActivityController *)self mf_unlock];
      if (v6 == (id)2)
      {
        id v15 = [v4 name];
        unsigned int v16 = [v15 isEqualToString:MonitoredActivityStarted];

        if (v16)
        {
          int v17 = sub_1000295DC();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v18 = self->mambaID;
            *(_DWORD *)buf = 136315394;
            v24 = v18;
            __int16 v25 = 2080;
            v26 = " ";
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "#I %s%s[IVM] _activityStarted: bail", buf, 0x16u);
          }
          goto LABEL_18;
        }
        id v20 = [v4 userInfo];
        int v19 = [v20 objectForKey:MonitoredActivityNewPrimaryTarget];
      }
      else
      {
        int v19 = 0;
      }
      id v21 = objc_alloc((Class)NSDictionary);
      id v22 = +[NSNumber numberWithInteger:v6];
      int v17 = objc_msgSend(v21, "initWithObjectsAndKeys:", v22, @"VVTaskType", v19, @"VVRecord", 0);

      [(IMAPServiceActivityController *)self _postNotificationName:@"VVServiceTaskStartedNotification" userInfo:v17];
LABEL_18:

      goto LABEL_19;
    }
    [(IMAPServiceActivityController *)self mf_unlock];
  }
  else
  {
    [(IMAPServiceActivityController *)self mf_unlock];
  }
LABEL_19:
}

- (void)_activityEnded:(id)a3
{
  id v4 = a3;
  [(IMAPServiceActivityController *)self mf_lock];
  id v5 = [v4 object];
  if ([(IMAPServiceActivityController *)self __is_my_activity:v5])
  {
    id v6 = [v5 voicemailTaskType:self->_activityToTaskType];
    id v7 = sub_1000295DC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      mambaID = self->mambaID;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_service);
      *(_DWORD *)buf = 136316162;
      v44 = mambaID;
      __int16 v45 = 2080;
      v46 = " ";
      __int16 v47 = 2112;
      id v48 = v4;
      __int16 v49 = 2112;
      id v50 = WeakRetained;
      __int16 v51 = 2048;
      id v52 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#I %s%s[IVM] _activityEnded %@ service %@ monitor %p", buf, 0x34u);
    }
    [(IMAPServiceActivityController *)self mf_unlock];
    id v10 = objc_loadWeakRetained((id *)&self->_service);
    [v10 imapTransactionEnded];

    [(IMAPServiceActivityController *)self mf_lock];
    if (!v6) {
      goto LABEL_41;
    }
    activeActivities = self->_activeActivities;
    if (!activeActivities
      || (int v12 = (id)CFDictionaryGetValue(activeActivities, +[NSNumber numberWithInteger:v6])) == 0)
    {
      __int16 v13 = sub_1000295DC();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v18 = self->mambaID;
        *(_DWORD *)buf = 136315394;
        v44 = v18;
        __int16 v45 = 2080;
        v46 = " ";
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#I %s%s[IVM] _activityEnded: not posting", buf, 0x16u);
      }
      goto LABEL_40;
    }
    __int16 v13 = v12;
    [v12 removeObject:v5];
    if (v6 == (id)2)
    {
      __int16 v14 = [v4 name];
      unsigned int v15 = [v14 isEqualToString:MonitoredActivityEnded];

      if (v15)
      {
        id v16 = [v5 primaryTarget];
        if (v16)
        {
LABEL_16:
          id v39 = v16;
          -[NSMutableSet removeObject:](self->_inProcessRecords, "removeObject:");
          goto LABEL_18;
        }
        id v17 = [v5 activityTarget];
      }
      else
      {
        int v19 = [v4 userInfo];
        id v17 = [v19 objectForKey:MonitoredActivityOldPrimaryTarget];
      }
      id v16 = v17;
      if (v17) {
        goto LABEL_16;
      }
    }
    id v39 = 0;
LABEL_18:
    [(IMAPServiceActivityController *)self mf_unlock];
    if (v6 == (id)2)
    {
      id v20 = [v5 taskName];
      unsigned __int8 v21 = [v20 isEqualToString:@"Caching Bodies"];
    }
    else
    {
      unsigned __int8 v21 = 0;
    }
    v41 = [v5 error];
    v42 = sub_1000293B8(v41);
    if (v42)
    {
      id v22 = objc_alloc((Class)NSNumber);
      if (v21) {
        uint64_t v23 = 1;
      }
      else {
        uint64_t v23 = [v42 shouldPresentErrorForTaskType:v6] ^ 1;
      }
      id v40 = [v22 initWithBool:v23];
    }
    else
    {
      id v40 = 0;
    }
    id v24 = objc_alloc((Class)NSMutableDictionary);
    __int16 v25 = +[NSNumber numberWithInteger:v6];
    id v26 = objc_msgSend(v24, "initWithObjectsAndKeys:", v25, @"VVTaskType", v42, @"VVError", v40, @"VVSuppressError", 0);

    unsigned int v27 = [v5 shouldCancel];
    id v28 = &off_1000C2338;
    if (!v27) {
      id v28 = &off_1000C2330;
    }
    __int16 v29 = *v28;
    if (!v41) {
      goto LABEL_37;
    }
    id v30 = [v41 domain];
    if ([v30 isEqualToString:MFMessageErrorDomain])
    {
      BOOL v31 = [v41 code] == (id)1032;

      if (!v31)
      {
LABEL_34:
        v32 = sub_1000295DC();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          v37 = self->mambaID;
          id v38 = [v41 domain];
          id v36 = [v41 code];
          v35 = [v41 localizedDescription];
          *(_DWORD *)buf = 136316418;
          v44 = v37;
          __int16 v45 = 2080;
          v46 = " ";
          __int16 v47 = 2048;
          id v48 = v6;
          __int16 v49 = 2112;
          id v50 = v38;
          __int16 v51 = 2048;
          id v52 = v36;
          __int16 v53 = 2112;
          v54 = v35;
          _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "#E %s%s[IVM] Error (%ld) - %@/%ld - %@", buf, 0x3Eu);
        }
LABEL_37:
        if (v39) {
          [v26 setObject:v39 forKey:@"VVRecord"];
        }
        [(IMAPServiceActivityController *)self _postNotificationName:v29 userInfo:v26];
        [(IMAPServiceActivityController *)self mf_lock];

LABEL_40:
LABEL_41:
        activityToTaskType = self->_activityToTaskType;
        v34 = +[NSValue valueWithPointer:v5];
        [(NSMutableDictionary *)activityToTaskType removeObjectForKey:v34];

        [(IMAPServiceActivityController *)self __removeScheduledActivity:v5];
        [(IMAPServiceActivityController *)self mf_unlock];
        goto LABEL_42;
      }
      id v30 = objc_loadWeakRetained((id *)&self->_service);
      [v30 _authenticationFailed];
    }

    goto LABEL_34;
  }
  [(IMAPServiceActivityController *)self mf_unlock];
LABEL_42:
}

- (void)_primaryTargetChanged:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000295DC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    mambaID = self->mambaID;
    int v12 = 136315650;
    __int16 v13 = mambaID;
    __int16 v14 = 2080;
    unsigned int v15 = " ";
    __int16 v16 = 2112;
    id v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#I %s%s[IVM] _primaryTargetChanged: %@", (uint8_t *)&v12, 0x20u);
  }

  id v7 = [v4 object];
  if ([(IMAPServiceActivityController *)self is_my_activity:v7])
  {
    id v8 = [v4 userInfo];
    id v9 = [v8 objectForKey:MonitoredActivityOldPrimaryTarget];

    if (v9) {
      [(IMAPServiceActivityController *)self _activityEnded:v4];
    }
    id v10 = [v8 objectForKey:MonitoredActivityNewPrimaryTarget];
    BOOL v11 = v10 == 0;

    if (!v11)
    {
      if (v9) {
        [(IMAPServiceActivityController *)self addScheduledActivity:v7];
      }
      [(IMAPServiceActivityController *)self _activityStarted:v4];
    }
  }
}

- (void)_targetsAdded:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000295DC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    mambaID = self->mambaID;
    int v12 = 136315650;
    __int16 v13 = mambaID;
    __int16 v14 = 2080;
    unsigned int v15 = " ";
    __int16 v16 = 2112;
    id v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#I %s%s[IVM] _targetsAdded: %@", (uint8_t *)&v12, 0x20u);
  }

  id v7 = [v4 object];
  [(IMAPServiceActivityController *)self mf_lock];
  if ([(IMAPServiceActivityController *)self __is_my_activity:v7]
    && [v7 voicemailTaskType:self->_activityToTaskType] == (id)2)
  {
    inProcessRecords = self->_inProcessRecords;
    if (!inProcessRecords)
    {
      id v9 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
      id v10 = self->_inProcessRecords;
      self->_inProcessRecords = v9;

      inProcessRecords = self->_inProcessRecords;
    }
    BOOL v11 = [v7 activityTargets];
    [(NSMutableSet *)inProcessRecords addObjectsFromArray:v11];
  }
  [(IMAPServiceActivityController *)self mf_unlock];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityToTaskType, 0);
  objc_storeStrong((id *)&self->_inProcessRecords, 0);
  objc_destroyWeak((id *)&self->_service);
  objc_storeStrong((id *)&self->_scheduledActivities, 0);
}

@end