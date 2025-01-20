@interface LivefsSettings
- (BOOL)load:(id *)a3;
- (BOOL)save:(id *)a3;
- (FSResourceManager)resourceManager;
- (LivefsSettings)init;
- (NSArray)mounts;
- (NSMutableDictionary)tasks;
- (NSMutableSet)taskUpdateClients;
- (NSString)bootUUID;
- (id)addMountNamed:(id)a3 displayName:(id)a4 mountID:(unsigned int)a5 mountedOn:(id)a6 provider:(id)a7 fpStorage:(id)a8 domainError:(id)a9 how:(int)a10 isReAdd:(BOOL)a11;
- (id)deserializedError:(id)a3;
- (id)removeMountNamed:(id)a3 provider:(id)a4;
- (id)serializedError:(id)a3;
- (id)updateMountEntry:(id)a3 provider:(id)a4 settingsDictionary:(id *)a5 updateBlock:(id)a6;
- (void)cleanupConfigFromLastBoot;
- (void)initFresh;
- (void)removeReferencesToTask:(id)a3;
- (void)setIdleTimer:(BOOL)a3;
- (void)setIdleTimerLocked:(BOOL)a3;
- (void)setResourceManager:(id)a3;
- (void)setTaskUpdateClients:(id)a3;
- (void)setTasks:(id)a3;
- (void)startedWork;
- (void)startedWorkLocked;
- (void)taskSetChanged;
@end

@implementation LivefsSettings

- (void)initFresh
{
  v3 = (NSMutableArray *)objc_opt_new();
  mounts = self->_mounts;
  self->_mounts = v3;

  self->_needsLoad = 1;

  [(LivefsSettings *)self setIdleTimer:0];
}

- (LivefsSettings)init
{
  v15.receiver = self;
  v15.super_class = (Class)LivefsSettings;
  v2 = [(LivefsSettings *)&v15 init];
  v3 = v2;
  if (v2)
  {
    [(LivefsSettings *)v2 initFresh];
    uint64_t v4 = getBootUUID();
    bootUUID = v3->_bootUUID;
    v3->_bootUUID = (NSString *)v4;

    uint64_t v6 = objc_opt_new();
    tasks = v3->_tasks;
    v3->_tasks = (NSMutableDictionary *)v6;

    uint64_t v8 = objc_opt_new();
    taskUpdateClients = v3->_taskUpdateClients;
    v3->_taskUpdateClients = (NSMutableSet *)v8;

    uint64_t v10 = objc_opt_new();
    resourceManager = v3->_resourceManager;
    v3->_resourceManager = (FSResourceManager *)v10;

    v12 = livefs_std_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = v3->_bootUUID;
      *(_DWORD *)buf = 138412290;
      v17 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Got boot UUID %@", buf, 0xCu);
    }
  }
  return v3;
}

- (NSArray)mounts
{
  if (self->_needsLoad)
  {
    uint64_t v5 = 0;
    [(LivefsSettings *)self load:&v5];
  }
  id v3 = [(NSMutableArray *)self->_mounts copy];

  return (NSArray *)v3;
}

- (void)startedWorkLocked
{
  idleTimerSource = self->_idleTimerSource;
  if (idleTimerSource)
  {
    dispatch_time_t v3 = dispatch_time(0, 10000000000);
    dispatch_source_set_timer(idleTimerSource, v3, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
  }
}

- (void)setIdleTimerLocked:(BOOL)a3
{
  idleTimerSource = self->_idleTimerSource;
  if (a3)
  {
    if (idleTimerSource)
    {
      dispatch_source_cancel(idleTimerSource);
      uint64_t v5 = self->_idleTimerSource;
      self->_idleTimerSource = 0;
    }
  }
  else if (!idleTimerSource)
  {
    uint64_t v6 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, 0);
    v7 = self->_idleTimerSource;
    self->_idleTimerSource = v6;

    dispatch_source_set_timer((dispatch_source_t)self->_idleTimerSource, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_source_set_event_handler((dispatch_source_t)self->_idleTimerSource, &stru_100059B90);
    dispatch_resume((dispatch_object_t)self->_idleTimerSource);
    [(LivefsSettings *)self startedWorkLocked];
    uint64_t v8 = livefs_std_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_10004064C(v8);
    }
  }
}

- (void)setIdleTimer:(BOOL)a3
{
  BOOL v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  [(LivefsSettings *)obj setIdleTimerLocked:v3];
  objc_sync_exit(obj);
}

- (void)taskSetChanged
{
  obj = self;
  objc_sync_enter(obj);
  BOOL v2 = [(NSMutableArray *)obj->_mounts count]
    || [(NSMutableDictionary *)obj->_tasks count]
    || [(NSMutableSet *)obj->_taskUpdateClients count] != 0;
  [(LivefsSettings *)obj setIdleTimerLocked:v2];
  objc_sync_exit(obj);
}

- (void)startedWork
{
  obj = self;
  objc_sync_enter(obj);
  [(LivefsSettings *)obj startedWorkLocked];
  objc_sync_exit(obj);
}

- (void)cleanupConfigFromLastBoot
{
  BOOL v3 = +[NSMutableArray array];
  uint64_t v4 = livefs_std_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_1000406D0(v4);
  }

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v13 = self;
  uint64_t v5 = self->_mounts;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
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
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v11 = [v10 objectForKeyedSubscript:LiveFSMounterVolumeProviderNameKey];
        unsigned __int8 v12 = [v11 isEqualToString:@"com.apple.SMBClientProvider.FileProvider"];

        if ((v12 & 1) == 0) {
          [v3 addObject:v10];
        }
      }
      id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  [(NSMutableArray *)v13->_mounts removeObjectsInArray:v3];
  [(LivefsSettings *)v13 save:0];
}

- (BOOL)load:(id *)a3
{
  id v23 = 0;
  uint64_t v5 = +[LiveFSClient supportDirURL:14 forURL:0 daemonPrefName:@"livefsd" error:&v23];
  id v6 = v23;
  if (!v6)
  {
    uint64_t v10 = [v5 URLByAppendingPathComponent:@"settings.plist"];

    v11 = +[NSFileManager defaultManager];
    unsigned __int8 v12 = [v10 path];
    unsigned __int8 v13 = [v11 fileExistsAtPath:v12];

    if (v13)
    {
      id v22 = 0;
      uint64_t v8 = +[NSDictionary dictionaryWithContentsOfURL:v10 error:&v22];
      id v14 = v22;
      id v7 = v14;
      if (v14 || !v8)
      {
        if (a3)
        {
          id v7 = v14;
          BOOL v9 = 0;
          *a3 = v7;
        }
        else
        {
          BOOL v9 = 0;
        }
        goto LABEL_25;
      }
      long long v15 = [v8 objectForKeyedSubscript:@"mounts"];
      DeepCopy = (NSMutableArray *)CFPropertyListCreateDeepCopy(kCFAllocatorDefault, v15, 1uLL);
      mounts = self->_mounts;
      self->_mounts = DeepCopy;

      v18 = [v8 objectForKey:@"bootUUID"];
      bootUUID = self->_bootUUID;
      if (bootUUID)
      {
        if (!v18 || ![(NSString *)bootUUID isEqualToString:v18]) {
          [(LivefsSettings *)self cleanupConfigFromLastBoot];
        }
      }
      else
      {
        v20 = livefs_std_log();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          sub_100040714(v20);
        }
      }
      if (self->_needsLoad) {
        self->_needsLoad = 0;
      }
      [(LivefsSettings *)self taskSetChanged];

      id v7 = 0;
    }
    else
    {
      if (!self->_needsLoad) {
        [(LivefsSettings *)self initFresh];
      }
      id v7 = 0;
      uint64_t v8 = 0;
      self->_needsLoad = 0;
    }
    BOOL v9 = 1;
    goto LABEL_25;
  }
  id v7 = v6;
  if (a3)
  {
    id v7 = v6;
    uint64_t v8 = 0;
    BOOL v9 = 0;
    *a3 = v7;
  }
  else
  {
    uint64_t v8 = 0;
    BOOL v9 = 0;
  }
  uint64_t v10 = v5;
LABEL_25:

  return v9;
}

- (BOOL)save:(id *)a3
{
  id v19 = 0;
  uint64_t v5 = +[LiveFSClient supportDirURL:14 forURL:0 daemonPrefName:@"livefsd" error:&v19];
  id v6 = v19;
  if (v6)
  {
    id v7 = v6;
    if (a3)
    {
      id v7 = v6;
      BOOL v8 = 0;
      *a3 = v7;
    }
    else
    {
      BOOL v8 = 0;
    }
    BOOL v9 = v5;
  }
  else
  {
    BOOL v9 = [v5 URLByAppendingPathComponent:@"settings.plist"];

    if ([(NSMutableArray *)self->_mounts count])
    {
      bootUUID = (__CFString *)self->_bootUUID;
      if (!bootUUID) {
        bootUUID = &stru_10005A670;
      }
      v11 = bootUUID;
      mounts = self->_mounts;
      v20[0] = @"mounts";
      v20[1] = @"bootUUID";
      v21[0] = mounts;
      v21[1] = v11;
      unsigned __int8 v13 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];
      id v17 = 0;
      [v13 writeToURL:v9 error:&v17];
      id v14 = v17;
      id v7 = v14;
      if (a3 && v14)
      {
        *a3 = v14;
      }
      else if (!v14)
      {
        [(LivefsSettings *)self setIdleTimer:1];
      }
      BOOL v8 = v7 == 0;
    }
    else
    {
      [(LivefsSettings *)self taskSetChanged];
      long long v15 = +[NSFileManager defaultManager];
      id v18 = 0;
      [v15 removeItemAtURL:v9 error:&v18];
      id v7 = v18;

      if (v7 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v23 = v7;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Error deleting preference file: %@", buf, 0xCu);
      }
      BOOL v8 = 1;
    }
  }

  return v8;
}

- (id)serializedError:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 userInfo];

  if (v4)
  {
    v13[0] = @"errorDomain";
    uint64_t v5 = [v3 domain];
    v14[0] = v5;
    v13[1] = @"errorCode";
    id v6 = +[NSNumber numberWithLong:](NSNumber, "numberWithLong:", [v3 code]);
    v14[1] = v6;
    v13[2] = @"errorInfo";
    id v7 = [v3 userInfo];

    v14[2] = v7;
    BOOL v8 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:3];
  }
  else
  {
    v11[0] = @"errorDomain";
    uint64_t v5 = [v3 domain];
    v11[1] = @"errorCode";
    v12[0] = v5;
    id v9 = [v3 code];

    id v6 = +[NSNumber numberWithLong:v9];
    v12[1] = v6;
    BOOL v8 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];
  }

  return v8;
}

- (id)deserializedError:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 objectForKeyedSubscript:@"errorCode"];
  uint64_t v5 = [v3 objectForKeyedSubscript:@"errorInfo"];
  id v6 = [v3 objectForKeyedSubscript:@"errorDomain"];

  id v7 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v6, [v4 longValue], v5);

  return v7;
}

- (id)addMountNamed:(id)a3 displayName:(id)a4 mountID:(unsigned int)a5 mountedOn:(id)a6 provider:(id)a7 fpStorage:(id)a8 domainError:(id)a9 how:(int)a10 isReAdd:(BOOL)a11
{
  uint64_t v14 = *(void *)&a5;
  id v17 = a3;
  id v40 = a4;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v41 = a9;
  v21 = self;
  objc_sync_enter(v21);
  uint64_t v50 = 0;
  v51 = &v50;
  uint64_t v52 = 0x2020000000;
  uint64_t v53 = -1;
  id v22 = +[NSNumber numberWithInt:v14];
  mounts = v21->_mounts;
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_10002D7C4;
  v43[3] = &unk_100059BB8;
  id v24 = v19;
  id v44 = v24;
  id v25 = v18;
  id v45 = v25;
  id v26 = v22;
  id v46 = v26;
  id v27 = v20;
  id v47 = v27;
  id v28 = v17;
  id v48 = v28;
  v49 = &v50;
  [(NSMutableArray *)mounts enumerateObjectsUsingBlock:v43];
  if (v51[3] == -1 || a11)
  {
    v31 = v40;
    v32 = objc_opt_new();
    [v32 setObject:v28 forKey:LiveFSMounterVolumeNameKey];
    [v32 setObject:v40 forKey:LiveFSMounterDisplayNameKey];
    [v32 setObject:v25 forKey:LiveFSMounterMountedOnKey];
    [v32 setObject:v26 forKey:LiveFSMounterMountIDKey];
    [v32 setObject:v24 forKey:LiveFSMounterVolumeProviderNameKey];
    [v32 setObject:v27 forKey:LiveFSMounterDomainStorageKey];
    if (v41)
    {
      v33 = [(LivefsSettings *)v21 serializedError:v41];
      [v32 setObject:v33 forKey:LiveFSMounterDomainErrorKey];
    }
    if ((a10 & 0x20) != 0) {
      [v32 setObject:&__kCFBooleanTrue forKey:LiveFSMounterDomainContainsPhotos];
    }
    if ((a10 & 0x80) != 0) {
      [v32 setObject:&__kCFBooleanTrue forKey:LiveFSMounterDomainHidden];
    }
    if ((a10 & 0x1000) != 0) {
      [v32 setObject:&__kCFBooleanTrue forKey:LiveFSMounterDomainErasable];
    }
    uint64_t v34 = v51[3];
    v35 = v21->_mounts;
    if (v34 == -1) {
      [(NSMutableArray *)v35 addObject:v32];
    }
    else {
      [(NSMutableArray *)v35 replaceObjectAtIndex:v34 withObject:v32];
    }
    if (v21->_needsLoad) {
      v21->_needsLoad = 0;
    }
    id v42 = 0;
    unsigned int v36 = [(LivefsSettings *)v21 save:&v42];
    id v37 = v42;
    id v29 = v37;
    if (v36) {
      v38 = 0;
    }
    else {
      v38 = v37;
    }
    id v30 = v38;
  }
  else
  {
    id v29 = +[NSError errorWithDomain:NSCocoaErrorDomain code:516 userInfo:0];
    id v30 = v29;
    v31 = v40;
  }

  _Block_object_dispose(&v50, 8);
  objc_sync_exit(v21);

  return v30;
}

- (id)updateMountEntry:(id)a3 provider:(id)a4 settingsDictionary:(id *)a5 updateBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  unsigned __int8 v12 = (void (**)(id, void *))a6;
  unsigned __int8 v13 = self;
  objc_sync_enter(v13);
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x2020000000;
  uint64_t v40 = -1;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  uint64_t v34 = sub_10002DBD4;
  v35 = sub_10002DBE4;
  id v36 = 0;
  mounts = v13->_mounts;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10002DBEC;
  v26[3] = &unk_100059BE0;
  id v15 = v11;
  id v27 = v15;
  id v16 = v10;
  id v28 = v16;
  id v29 = &v37;
  id v30 = &v31;
  [(NSMutableArray *)mounts enumerateObjectsUsingBlock:v26];
  if (v38[3] == -1)
  {
    id v21 = +[NSError errorWithDomain:NSCocoaErrorDomain code:0x7FFFFFFFFFFFFFFFLL userInfo:0];
    id v23 = v21;
  }
  else
  {
    id v17 = +[NSMutableDictionary dictionaryWithDictionary:v32[5]];
    v12[2](v12, v17);
    [(NSMutableArray *)v13->_mounts replaceObjectAtIndex:v38[3] withObject:v17];
    id v18 = v17;
    *a5 = v18;
    id v25 = 0;
    unsigned int v19 = [(LivefsSettings *)v13 save:&v25];
    id v20 = v25;
    id v21 = v20;
    if (v19) {
      id v22 = 0;
    }
    else {
      id v22 = v20;
    }
    id v23 = v22;
  }
  _Block_object_dispose(&v31, 8);

  _Block_object_dispose(&v37, 8);
  objc_sync_exit(v13);

  return v23;
}

- (id)removeMountNamed:(id)a3 provider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = self;
  objc_sync_enter(v8);
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = -1;
  mounts = v8->_mounts;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10002DE8C;
  v18[3] = &unk_100059C08;
  id v10 = v7;
  id v19 = v10;
  id v11 = v6;
  id v20 = v11;
  id v21 = &v22;
  [(NSMutableArray *)mounts enumerateObjectsUsingBlock:v18];
  if (v23[3] == -1)
  {
    id v13 = +[NSError errorWithDomain:NSCocoaErrorDomain code:0x7FFFFFFFFFFFFFFFLL userInfo:0];
    uint64_t v14 = v13;
  }
  else
  {
    -[NSMutableArray removeObjectAtIndex:](v8->_mounts, "removeObjectAtIndex:");
    id v17 = 0;
    unsigned int v12 = [(LivefsSettings *)v8 save:&v17];
    id v13 = v17;
    uint64_t v14 = v13;
    if (v12) {
      id v13 = 0;
    }
  }
  id v15 = v13;

  _Block_object_dispose(&v22, 8);
  objc_sync_exit(v8);

  return v15;
}

- (void)removeReferencesToTask:(id)a3
{
  id v6 = a3;
  uint64_t v4 = self->_tasks;
  objc_sync_enter(v4);
  [(NSMutableDictionary *)self->_tasks removeObjectForKey:v6];
  objc_sync_exit(v4);

  uint64_t v5 = self->_resourceManager;
  objc_sync_enter(v5);
  [(FSResourceManager *)self->_resourceManager removeTaskUUID:v6];
  objc_sync_exit(v5);
}

- (NSString)bootUUID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSMutableDictionary)tasks
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTasks:(id)a3
{
}

- (NSMutableSet)taskUpdateClients
{
  return (NSMutableSet *)objc_getProperty(self, a2, 48, 1);
}

- (void)setTaskUpdateClients:(id)a3
{
}

- (FSResourceManager)resourceManager
{
  return (FSResourceManager *)objc_getProperty(self, a2, 56, 1);
}

- (void)setResourceManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceManager, 0);
  objc_storeStrong((id *)&self->_taskUpdateClients, 0);
  objc_storeStrong((id *)&self->_tasks, 0);
  objc_storeStrong((id *)&self->_bootUUID, 0);
  objc_storeStrong((id *)&self->_idleTimerSource, 0);

  objc_storeStrong((id *)&self->_mounts, 0);
}

@end