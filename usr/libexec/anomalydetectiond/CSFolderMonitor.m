@interface CSFolderMonitor
- (BOOL)scan:(id *)a3;
- (CSFolderMonitor)initWithFolder:(id)a3 fileExtension:(id)a4 queue:(id)a5 postfix:(id)a6 andAction:(id)a7;
- (NSString)extension;
- (NSString)postfix;
- (NSURL)folderURL;
- (OS_dispatch_group)scanGroup;
- (OS_dispatch_queue)actionQueue;
- (id)action;
- (void)registerForFolderMonitorActivity;
- (void)registerForFolderMonitorActivityWithCriteria:(id)a3;
- (void)setupRecurringScanningWithConfiguration:(id)a3 runNow:(BOOL)a4;
- (void)stopRecurringScanning;
@end

@implementation CSFolderMonitor

- (CSFolderMonitor)initWithFolder:(id)a3 fileExtension:(id)a4 queue:(id)a5 postfix:(id)a6 andAction:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v26.receiver = self;
  v26.super_class = (Class)CSFolderMonitor;
  v17 = [(CSFolderMonitor *)&v26 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_actionQueue, a5);
    v19 = (NSURL *)[objc_alloc((Class)NSURL) initFileURLWithPath:v12 isDirectory:1];
    folderURL = v18->_folderURL;
    v18->_folderURL = v19;

    objc_storeStrong((id *)&v18->_extension, a4);
    id v21 = objc_retainBlock(v16);
    id action = v18->_action;
    v18->_id action = v21;

    dispatch_group_t v23 = dispatch_group_create();
    scanGroup = v18->_scanGroup;
    v18->_scanGroup = (OS_dispatch_group *)v23;

    objc_storeStrong((id *)&v18->_postfix, a6);
  }

  return v18;
}

- (BOOL)scan:(id *)a3
{
  v4 = [(CSFolderMonitor *)self scanGroup];
  dispatch_group_enter(v4);

  dispatch_group_t v23 = +[NSFileManager defaultManager];
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x2020000000;
  char v42 = 0;
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = sub_10001D978;
  v37 = sub_10001D988;
  id v38 = 0;
  v5 = [(CSFolderMonitor *)self folderURL];
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_10001D990;
  v32[3] = &unk_10039B248;
  v32[4] = &v33;
  v32[5] = &v39;
  v6 = [v23 enumeratorAtURL:v5 includingPropertiesForKeys:0 options:5 errorHandler:v32];

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v6;
  id v7 = [obj countByEnumeratingWithState:&v28 objects:v43 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v29;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        v11 = [(CSFolderMonitor *)self extension];
        if ([v11 isEqualToString:&stru_1003BC4E8])
        {
        }
        else
        {
          id v12 = [v10 pathExtension];
          id v13 = [(CSFolderMonitor *)self extension];
          unsigned int v14 = [v12 isEqualToString:v13];

          if (!v14) {
            continue;
          }
        }
        id v15 = [(CSFolderMonitor *)self scanGroup];
        id v16 = [(CSFolderMonitor *)self actionQueue];
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10001D9E4;
        block[3] = &unk_10039B270;
        id v25 = v23;
        objc_super v26 = v10;
        v27 = self;
        dispatch_group_async(v15, v16, block);
      }
      id v7 = [obj countByEnumeratingWithState:&v28 objects:v43 count:16];
    }
    while (v7);
  }

  v17 = [(CSFolderMonitor *)self scanGroup];
  dispatch_group_leave(v17);

  v18 = [(CSFolderMonitor *)self scanGroup];
  dispatch_group_wait(v18, 0xFFFFFFFFFFFFFFFFLL);

  int v19 = *((unsigned __int8 *)v40 + 24);
  if (a3 && *((unsigned char *)v40 + 24)) {
    *a3 = (id) v34[5];
  }

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v39, 8);

  return v19 == 0;
}

- (void)setupRecurringScanningWithConfiguration:(id)a3 runNow:(BOOL)a4
{
  id v6 = a3;
  xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
  if (!a4) {
    xpc_dictionary_set_int64(v7, XPC_ACTIVITY_DELAY, (int64_t)[v6 periodInSeconds]);
  }
  xpc_dictionary_set_BOOL(v7, XPC_ACTIVITY_ALLOW_BATTERY, (BOOL)[v6 allowBattery]);
  xpc_dictionary_set_int64(v7, XPC_ACTIVITY_INTERVAL, (int64_t)[v6 periodInSeconds]);
  xpc_dictionary_set_BOOL(v7, XPC_ACTIVITY_REPEATING, 1);
  xpc_dictionary_set_string(v7, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
  NSFileProtectionType v8 = [v6 fileProtectionType];

  if (v8 == NSFileProtectionCompleteUnlessOpen)
  {
    id v13 = (const char **)&XPC_ACTIVITY_REQUIRES_CLASS_B;
LABEL_14:
    xpc_dictionary_set_BOOL(v7, *v13, 1);
    goto LABEL_15;
  }
  NSFileProtectionType v9 = [v6 fileProtectionType];

  if (v9 == NSFileProtectionCompleteUntilFirstUserAuthentication)
  {
    id v13 = (const char **)&XPC_ACTIVITY_REQUIRES_CLASS_C;
    goto LABEL_14;
  }
  NSFileProtectionType v10 = [v6 fileProtectionType];

  if (v10 == NSFileProtectionComplete)
  {
    id v13 = (const char **)&XPC_ACTIVITY_REQUIRES_CLASS_A;
    goto LABEL_14;
  }
  if (qword_1003DB7D0 != -1) {
    dispatch_once(&qword_1003DB7D0, &stru_10039B2B8);
  }
  v11 = (id)qword_1003DB7D8;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    id v12 = [v6 fileProtectionType];
    int v14 = 138412290;
    id v15 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Unsuported file protection type setting up recurring scan %@", (uint8_t *)&v14, 0xCu);
  }
LABEL_15:
  [(CSFolderMonitor *)self registerForFolderMonitorActivityWithCriteria:v7];
}

- (void)registerForFolderMonitorActivity
{
}

- (void)registerForFolderMonitorActivityWithCriteria:(id)a3
{
  id v5 = a3;
  id v6 = [(CSFolderMonitor *)self postfix];
  xpc_object_t v7 = [(CSFolderMonitor *)self extension];
  id v8 = [v7 length];
  if (v8)
  {
    v3 = [(CSFolderMonitor *)self extension];
    NSFileProtectionType v9 = [@"." stringByAppendingString:v3];
  }
  else
  {
    NSFileProtectionType v9 = &stru_1003BC4E8;
  }
  NSFileProtectionType v10 = +[NSString stringWithFormat:@"com.apple.anomalydetectiond.CSFolderMonitor%@%@", v6, v9];
  if (v8)
  {
  }
  objc_initWeak(&location, self);
  id v11 = v10;
  id v12 = (const char *)[v11 UTF8String];
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10001E2CC;
  handler[3] = &unk_10039B298;
  id v13 = v5;
  id v16 = v13;
  id v14 = v11;
  id v17 = v14;
  objc_copyWeak(&v18, &location);
  xpc_activity_register(v12, v13, handler);
  objc_destroyWeak(&v18);

  objc_destroyWeak(&location);
}

- (void)stopRecurringScanning
{
  id v6 = [(CSFolderMonitor *)self folderURL];
  v3 = [v6 path];
  v4 = [(CSFolderMonitor *)self extension];
  id v5 = +[NSString stringWithFormat:@"com.apple.anomalydetectiond.CSFolderMonitor.%@.%@", v3, v4];

  id v7 = v5;
  xpc_activity_unregister((const char *)[v7 UTF8String]);
}

- (NSURL)folderURL
{
  return self->_folderURL;
}

- (NSString)extension
{
  return self->_extension;
}

- (id)action
{
  return self->_action;
}

- (OS_dispatch_queue)actionQueue
{
  return self->_actionQueue;
}

- (OS_dispatch_group)scanGroup
{
  return self->_scanGroup;
}

- (NSString)postfix
{
  return self->_postfix;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postfix, 0);
  objc_storeStrong((id *)&self->_scanGroup, 0);
  objc_storeStrong((id *)&self->_actionQueue, 0);
  objc_storeStrong(&self->_action, 0);
  objc_storeStrong((id *)&self->_extension, 0);

  objc_storeStrong((id *)&self->_folderURL, 0);
}

@end