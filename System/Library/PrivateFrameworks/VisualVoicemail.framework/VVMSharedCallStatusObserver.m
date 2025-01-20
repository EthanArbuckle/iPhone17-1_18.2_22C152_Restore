@interface VVMSharedCallStatusObserver
+ (id)sharedCallStatusObserver;
- (VVMSharedCallStatusObserver)init;
- (void)addDelegate:(id)a3 queue:(id)a4;
- (void)dealloc;
- (void)handleCallStatusChangedNotification:(id)a3;
- (void)notifyCallStatusDisconnected:(id)a3;
- (void)removeDelegate:(id)a3;
@end

@implementation VVMSharedCallStatusObserver

+ (id)sharedCallStatusObserver
{
  if (qword_1000E0900 != -1) {
    dispatch_once(&qword_1000E0900, &stru_1000C1FA0);
  }
  v2 = (void *)qword_1000E08F8;
  return v2;
}

- (VVMSharedCallStatusObserver)init
{
  v3 = sub_100033F40();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v27 = "";
    __int16 v28 = 2080;
    v29 = "";
    __int16 v30 = 2112;
    id v31 = (id)objc_opt_class();
    __int16 v32 = 2048;
    v33 = self;
    id v4 = v31;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#I %s%s%@ %p Creating", buf, 0x2Au);
  }
  v25.receiver = self;
  v25.super_class = (Class)VVMSharedCallStatusObserver;
  v5 = [(VVMSharedCallStatusObserver *)&v25 init];
  v6 = v5;
  if (v5)
  {
    v5->lock._os_unfair_lock_opaque = 0;
    v7 = +[NSBundle bundleForClass:objc_opt_class()];
    v8 = [v7 bundleIdentifier];
    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    id v11 = +[NSString stringWithFormat:@"%@.%@", v8, v10];
    dispatch_queue_t v12 = dispatch_queue_create((const char *)[v11 UTF8String], 0);
    queue = v6->queue;
    v6->queue = (OS_dispatch_queue *)v12;

    uint64_t v14 = +[NSMapTable weakToWeakObjectsMapTable];
    delegates = v6->delegates;
    v6->delegates = (NSMapTable *)v14;

    v16 = sub_100033F40();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = objc_opt_class();
      *(_DWORD *)buf = 136315650;
      v27 = "";
      __int16 v28 = 2080;
      v29 = "";
      __int16 v30 = 2112;
      id v31 = v17;
      id v18 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "#I %s%s%@ Creating TUCallCenter instance", buf, 0x20u);
    }
    id v19 = +[TUCallCenter sharedInstance];
    v20 = sub_100033F40();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = objc_opt_class();
      *(_DWORD *)buf = 136315650;
      v27 = "";
      __int16 v28 = 2080;
      v29 = "";
      __int16 v30 = 2112;
      id v31 = v21;
      id v22 = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "#I %s%s%@ Adding observer", buf, 0x20u);
    }
    v23 = +[NSNotificationCenter defaultCenter];
    [v23 addObserver:v6 selector:"handleCallStatusChangedNotification:" name:TUCallCenterCallStatusChangedNotification object:0];
  }
  return v6;
}

- (void)dealloc
{
  v3 = sub_100033F40();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v8 = "";
    __int16 v9 = 2080;
    v10 = "";
    __int16 v11 = 2112;
    id v12 = (id)objc_opt_class();
    __int16 v13 = 2048;
    uint64_t v14 = self;
    id v4 = v12;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#I %s%s%@ %p Deleting", buf, 0x2Au);
  }
  v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self];

  v6.receiver = self;
  v6.super_class = (Class)VVMSharedCallStatusObserver;
  [(VVMSharedCallStatusObserver *)&v6 dealloc];
}

- (void)handleCallStatusChangedNotification:(id)a3
{
  id v4 = a3;
  v5 = sub_100033F40();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (id)objc_opt_class();
    v7 = [v4 name];
    int v21 = 136315906;
    id v22 = "";
    __int16 v23 = 2080;
    v24 = "";
    __int16 v25 = 2112;
    id v26 = v6;
    __int16 v27 = 2112;
    __int16 v28 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#I %s%s%@ is handling <%@>", (uint8_t *)&v21, 0x2Au);
  }
  v8 = [v4 name];
  unsigned int v9 = [v8 isEqualToString:TUCallCenterCallStatusChangedNotification];

  if (v9)
  {
    v10 = [v4 object];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      __int16 v11 = [v4 object];
      id v12 = [v11 provider];
      unsigned int v13 = [v12 isTelephonyProvider];

      if (v13)
      {
        uint64_t v14 = sub_100033F40();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          id v15 = (id)objc_opt_class();
          unsigned int v16 = [v11 status];
          int v21 = 136315906;
          id v22 = "";
          __int16 v23 = 2080;
          v24 = "";
          __int16 v25 = 2112;
          id v26 = v15;
          __int16 v27 = 1024;
          LODWORD(v28) = v16;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#I %s%s%@ is handling CallStatus changed to %d", (uint8_t *)&v21, 0x26u);
        }
        if ([v11 status] == 6)
        {
          v17 = [v11 localSenderIdentityUUID];
          id v18 = sub_100033F40();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            id v19 = objc_opt_class();
            int v21 = 136315906;
            id v22 = "";
            __int16 v23 = 2080;
            v24 = "";
            __int16 v25 = 2112;
            id v26 = v19;
            __int16 v27 = 2112;
            __int16 v28 = v17;
            id v20 = v19;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "#I %s%s%@ is notifying delegate CallStatus Disconnected for uuid %@", (uint8_t *)&v21, 0x2Au);
          }
          [(VVMSharedCallStatusObserver *)self notifyCallStatusDisconnected:v17];
        }
      }
    }
  }
}

- (void)notifyCallStatusDisconnected:(id)a3
{
  id v4 = a3;
  os_unfair_lock_t lock = &self->lock;
  os_unfair_lock_lock(&self->lock);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  obj = self->delegates;
  id v5 = [(NSMapTable *)obj countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v15;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        unsigned int v9 = -[NSMapTable objectForKey:](self->delegates, "objectForKey:", v8, lock);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100034680;
        block[3] = &unk_1000C1FC8;
        block[4] = v8;
        id v13 = v4;
        dispatch_async(v9, block);
      }
      id v5 = [(NSMapTable *)obj countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }

  os_unfair_lock_unlock(lock);
}

- (void)addDelegate:(id)a3 queue:(id)a4
{
  p_os_unfair_lock_t lock = &self->lock;
  id v7 = a4;
  id v8 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSMapTable *)self->delegates setObject:v7 forKey:v8];

  os_unfair_lock_unlock(p_lock);
}

- (void)removeDelegate:(id)a3
{
  p_os_unfair_lock_t lock = &self->lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSMapTable *)self->delegates removeObjectForKey:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->delegates, 0);
  objc_storeStrong((id *)&self->queue, 0);
}

@end