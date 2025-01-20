@interface Daemon
+ (id)sharedInstance;
- (BOOL)isInternalBuild;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSString)machServiceName;
- (NSXPCListener)listener;
- (id)_verifyLaunchEventsConfiguration;
- (id)xpcDarwinEventHandlers;
- (id)xpcDistributedEventHandlers;
- (void)registerSignalHandlers;
- (void)registerXPCEventHandlers;
- (void)run;
- (void)setIsInternalBuild:(BOOL)a3;
- (void)setListener:(id)a3;
- (void)startup;
@end

@implementation Daemon

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100024920;
  block[3] = &unk_1000A1440;
  block[4] = a1;
  if (qword_1000BB770 != -1) {
    dispatch_once(&qword_1000BB770, block);
  }
  v2 = (void *)qword_1000BB778;

  return v2;
}

- (BOOL)isInternalBuild
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000249F4;
  block[3] = &unk_1000A14E8;
  block[4] = self;
  if (qword_1000BB780 != -1) {
    dispatch_once(&qword_1000BB780, block);
  }
  return self->_isInternalBuild;
}

- (void)run
{
  [(Daemon *)self registerSignalHandlers];
  [(Daemon *)self startup];
  [(Daemon *)self registerXPCEventHandlers];
  [(Daemon *)self addObservers];
  id v3 = +[FMFIDSMessageController sharedInstance];
  id v4 = [(Daemon *)self listener];
  [v4 resume];
}

- (void)startup
{
  id v5 = [(Daemon *)self machServiceName];
  if (v5)
  {
    id v3 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:v5];
    [(Daemon *)self setListener:v3];

    id v4 = [(Daemon *)self listener];
    [v4 setDelegate:self];
  }
}

- (id)xpcDarwinEventHandlers
{
  return &__NSDictionary0__struct;
}

- (id)xpcDistributedEventHandlers
{
  return &__NSDictionary0__struct;
}

- (void)registerXPCEventHandlers
{
  id v4 = [(Daemon *)self xpcDarwinEventHandlers];
  if (v4) {
    +[FMFXPCNotificationsUtil handleDarwinNotificationsWithHandlers:v4];
  }
  id v3 = [(Daemon *)self xpcDistributedEventHandlers];
  if (v3) {
    +[FMFXPCNotificationsUtil handleDistributedNotificationsWithHandlers:v3];
  }
}

- (void)registerSignalHandlers
{
  signal(20, (void (__cdecl *)(int))sub_100024D2C);
  if ([(Daemon *)self isInternalBuild])
  {
    signal(30, (void (__cdecl *)(int))sub_100024D2C);
    signal(31, (void (__cdecl *)(int))sub_100024D2C);
    id v3 = dispatch_get_global_queue(0, 0);
    dispatch_source_t v4 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0x1EuLL, 0, v3);
    id v5 = (void *)qword_1000BB788;
    qword_1000BB788 = (uint64_t)v4;

    dispatch_source_set_event_handler((dispatch_source_t)qword_1000BB788, &stru_1000A22A8);
    dispatch_resume((dispatch_object_t)qword_1000BB788);
    dispatch_source_t v6 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0x1FuLL, 0, v3);
    v7 = (void *)qword_1000BB790;
    qword_1000BB790 = (uint64_t)v6;

    dispatch_source_set_event_handler((dispatch_source_t)qword_1000BB790, &stru_1000A22E8);
    v8 = qword_1000BB790;
    dispatch_resume(v8);
  }
}

- (id)_verifyLaunchEventsConfiguration
{
  id v3 = +[NSDictionary dictionaryWithContentsOfFile:@"/System/Library/LaunchDaemons/com.apple.icloud.fmfd.plist"];
  dispatch_source_t v4 = v3;
  if (v3)
  {
    v44 = self;
    id v5 = [v3 objectForKeyedSubscript:@"LaunchEvents"];
    dispatch_source_t v6 = [v5 objectForKeyedSubscript:@"com.apple.notifyd.matching"];

    v7 = +[NSMutableSet set];
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id v8 = v6;
    id v9 = [v8 countByEnumeratingWithState:&v55 objects:v60 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v56;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v56 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v55 + 1) + 8 * i);
          [v7 addObject:v13];
          v14 = [v8 objectForKeyedSubscript:v13];
          id v15 = [v14 objectForKeyedSubscript:@"Notification"];

          if (![v13 isEqualToString:v15])
          {
            id v20 = +[NSString stringWithFormat:@"Darwin event key %@ does not match with its notification name %@", v13, v15];
            v16 = v8;
            goto LABEL_37;
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v55 objects:v60 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    v16 = [(Daemon *)v44 xpcDarwinEventHandlers];
    +[NSMutableSet set];
    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3221225472;
    v53[2] = sub_100025444;
    v53[3] = &unk_1000A21F0;
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    id v54 = v15;
    [v16 enumerateKeysAndObjectsUsingBlock:v53];
    v17 = +[NSMutableString string];
    id v18 = [v7 mutableCopy];
    [v18 minusSet:v15];
    if ([v18 count]) {
      [v17 appendFormat:@"launchd plist has these darwin notifications that don't have a handler defined in code: %@\n", v18];
    }
    id v19 = [v15 mutableCopy];
    [v19 minusSet:v7];
    if ([v19 count]) {
      [v17 appendFormat:@"launchd plist does not have these darwin notifications but, they have a handler defined in code: %@\n", v19];
    }
    if ([v17 length])
    {
      id v20 = v17;
    }
    else
    {
      id v40 = v19;
      id v41 = v18;
      v42 = v17;
      v43 = v16;
      v39 = v4;
      v21 = [v4 objectForKeyedSubscript:@"LaunchEvents"];
      v22 = [v21 objectForKeyedSubscript:@"com.apple.distnoted.matching"];

      v46 = +[NSMutableSet set];
      long long v49 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      id v23 = v22;
      id v24 = [v23 countByEnumeratingWithState:&v49 objects:v59 count:16];
      if (v24)
      {
        id v25 = v24;
        uint64_t v26 = *(void *)v50;
        while (2)
        {
          for (j = 0; j != v25; j = (char *)j + 1)
          {
            if (*(void *)v50 != v26) {
              objc_enumerationMutation(v23);
            }
            v28 = *(void **)(*((void *)&v49 + 1) + 8 * (void)j);
            [v46 addObject:v28];
            v29 = [v23 objectForKeyedSubscript:v28];
            id v30 = [v29 objectForKeyedSubscript:@"Name"];

            if (![v28 isEqualToString:v30])
            {
              id v20 = +[NSString stringWithFormat:@"Distributed event key %@ does not match with its notification name %@", v28, v30];
              v35 = v23;
              dispatch_source_t v4 = v39;
              v17 = v42;
              v16 = v43;
              goto LABEL_35;
            }
          }
          id v25 = [v23 countByEnumeratingWithState:&v49 objects:v59 count:16];
          if (v25) {
            continue;
          }
          break;
        }
      }

      v31 = [(Daemon *)v44 xpcDistributedEventHandlers];
      +[NSMutableSet set];
      v47[0] = _NSConcreteStackBlock;
      v47[1] = 3221225472;
      v47[2] = sub_1000254DC;
      v47[3] = &unk_1000A21F0;
      id v30 = (id)objc_claimAutoreleasedReturnValue();
      id v48 = v30;
      v45 = v31;
      [v31 enumerateKeysAndObjectsUsingBlock:v47];
      v32 = +[NSMutableString string];
      id v33 = [v46 mutableCopy];
      [v33 minusSet:v30];
      if ([v33 count]) {
        [v32 appendFormat:@"launchd plist has these distributed notifications that don't have a handler defined in code: %@\n", v33];
      }
      v38 = v33;
      id v34 = [v30 mutableCopy];
      [v34 minusSet:v46];
      v17 = v42;
      v16 = v43;
      if ([v34 count]) {
        [v32 appendFormat:@"launchd plist does not have these distributed notifications but, they have a handler defined in code: %@\n", v34];
      }
      v37 = v32;
      if ([v32 length]) {
        id v20 = v32;
      }
      else {
        id v20 = 0;
      }
      dispatch_source_t v4 = v39;

      v35 = v45;
LABEL_35:

      id v19 = v40;
      id v18 = v41;
    }

LABEL_37:
  }
  else
  {
    id v20 = +[NSString stringWithFormat:@"Could not load %@", 0];
  }

  return v20;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  return 0;
}

- (NSString)machServiceName
{
  return self->_machServiceName;
}

- (void)setIsInternalBuild:(BOOL)a3
{
  self->_isInternalBuild = a3;
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);

  objc_storeStrong((id *)&self->_machServiceName, 0);
}

@end