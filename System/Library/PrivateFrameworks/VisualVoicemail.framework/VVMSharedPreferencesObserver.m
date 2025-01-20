@interface VVMSharedPreferencesObserver
+ (id)sharedPreferencesObserver;
- (BOOL)isAirplaneMode;
- (VVMSharedPreferencesObserver)init;
- (void)addDelegate:(id)a3 queue:(id)a4;
- (void)checkAirplaneModePreference;
- (void)dealloc;
- (void)handleRadioPreferencesChanged:(id)a3;
- (void)notifyAirplaneModeChanged_sync:(BOOL)a3;
- (void)removeDelegate:(id)a3;
- (void)setAirplaneMode:(BOOL)a3;
- (void)setupAirplaneModeCallback;
@end

@implementation VVMSharedPreferencesObserver

+ (id)sharedPreferencesObserver
{
  if (qword_1000E07B0 != -1) {
    dispatch_once(&qword_1000E07B0, &stru_1000C1620);
  }
  v2 = (void *)qword_1000E07A8;
  return v2;
}

- (VVMSharedPreferencesObserver)init
{
  v3 = sub_1000090E4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v19 = "";
    __int16 v20 = 2080;
    v21 = "";
    __int16 v22 = 2112;
    id v23 = (id)objc_opt_class();
    __int16 v24 = 2048;
    v25 = self;
    id v4 = v23;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#I %s%s%@ %p Creating", buf, 0x2Au);
  }
  v17.receiver = self;
  v17.super_class = (Class)VVMSharedPreferencesObserver;
  v5 = [(VVMSharedPreferencesObserver *)&v17 init];
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

    v6->preferences = 0;
    v6->airplane = 0;
    uint64_t v14 = +[NSMapTable weakToWeakObjectsMapTable];
    delegates = v6->delegates;
    v6->delegates = (NSMapTable *)v14;

    [(VVMSharedPreferencesObserver *)v6 setupAirplaneModeCallback];
    [(VVMSharedPreferencesObserver *)v6 checkAirplaneModePreference];
  }
  return v6;
}

- (void)dealloc
{
  v3 = sub_1000090E4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = "";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "";
    *(_WORD *)&buf[22] = 2112;
    *(void *)&buf[24] = objc_opt_class();
    LOWORD(v8[0]) = 2048;
    *(void *)((char *)v8 + 2) = self;
    id v4 = *(id *)&buf[24];
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#I %s%s%@ %p Deleting", buf, 0x2Au);
  }
  preferences = self->preferences;
  if (preferences)
  {
    *(_OWORD *)buf = unk_1000C1640;
    *(_OWORD *)&buf[16] = *(_OWORD *)algn_1000C1650;
    v8[0] = 0;
    SCPreferencesSetCallback(preferences, 0, (SCPreferencesContext *)buf);
    SCPreferencesSetDispatchQueue(self->preferences, 0);
    CFRelease(self->preferences);
    self->preferences = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)VVMSharedPreferencesObserver;
  [(VVMSharedPreferencesObserver *)&v6 dealloc];
}

- (void)setupAirplaneModeCallback
{
  v3 = SCPreferencesCreate(kCFAllocatorDefault, @"com.apple.voicemail:registerForAirplaneModeNotifications", @"com.apple.radios.plist");
  self->preferences = v3;
  if (v3)
  {
    *(_OWORD *)&v6.version = unk_1000C1640;
    memset(&v6.retain, 0, 24);
    SCPreferencesSetCallback(v3, (SCPreferencesCallBack)sub_100009428, &v6);
    SCPreferencesSetDispatchQueue(self->preferences, (dispatch_queue_t)self->queue);
  }
  else
  {
    id v4 = sub_1000090E4();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = SCError();
      LODWORD(v6.version) = 136315650;
      *(CFIndex *)((char *)&v6.version + 4) = (CFIndex)"";
      WORD2(v6.info) = 2080;
      *(void **)((char *)&v6.info + 6) = "";
      HIWORD(v6.retain) = 2080;
      v6.release = (void (__cdecl *)(const void *))SCErrorString(v5);
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#I %s%sUnable to create airplane mode preferences session: %s", (uint8_t *)&v6, 0x20u);
    }
  }
}

- (void)checkAirplaneModePreference
{
  preferences = self->preferences;
  if (!preferences)
  {
    v10 = sub_1000090E4();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315394;
      dispatch_queue_t v12 = "";
      __int16 v13 = 2080;
      uint64_t v14 = "";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#I %s%sAirplaneMode preferences session is null", (uint8_t *)&v11, 0x16u);
    }
    goto LABEL_15;
  }
  SCPreferencesSynchronize(preferences);
  CFBooleanRef Value = (const __CFBoolean *)SCPreferencesGetValue(self->preferences, @"AirplaneMode");
  if (!Value)
  {
    v10 = sub_1000090E4();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315394;
      dispatch_queue_t v12 = "";
      __int16 v13 = 2080;
      uint64_t v14 = "";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#I %s%sAirplaneMode key not found", (uint8_t *)&v11, 0x16u);
    }
    goto LABEL_15;
  }
  CFBooleanRef v5 = Value;
  CFTypeID v6 = CFGetTypeID(Value);
  if (v6 != CFBooleanGetTypeID())
  {
    v10 = sub_1000090E4();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315394;
      dispatch_queue_t v12 = "";
      __int16 v13 = 2080;
      uint64_t v14 = "";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#I %s%sAirplaneMode is not BOOLean", (uint8_t *)&v11, 0x16u);
    }
LABEL_15:

    return;
  }
  int v7 = CFBooleanGetValue(v5);
  v8 = sub_1000090E4();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = asNSStringBOOL();
    int v11 = 136315650;
    dispatch_queue_t v12 = "";
    __int16 v13 = 2080;
    uint64_t v14 = "";
    __int16 v15 = 2112;
    v16 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#I %s%sAirplaneMode is %@", (uint8_t *)&v11, 0x20u);
  }
  [(VVMSharedPreferencesObserver *)self setAirplaneMode:v7 != 0];
}

- (void)handleRadioPreferencesChanged:(id)a3
{
  id v4 = a3;
  CFBooleanRef v5 = sub_1000090E4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315906;
    int v11 = "";
    __int16 v12 = 2080;
    __int16 v13 = "";
    __int16 v14 = 2112;
    id v15 = (id)objc_opt_class();
    __int16 v16 = 2112;
    id v17 = v4;
    id v6 = v15;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#I %s%s%@ is handling RadioPreferencesChanged with info <%@>", (uint8_t *)&v10, 0x2Au);
  }
  if ([v4 isEqualToString:@"AirplaneMode"])
  {
    [(VVMSharedPreferencesObserver *)self checkAirplaneModePreference];
  }
  else
  {
    int v7 = sub_1000090E4();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_opt_class();
      int v10 = 136315906;
      int v11 = "";
      __int16 v12 = 2080;
      __int16 v13 = "";
      __int16 v14 = 2112;
      id v15 = v8;
      __int16 v16 = 2112;
      id v17 = v4;
      id v9 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#I %s%s%@ is suppressing notification for %@", (uint8_t *)&v10, 0x2Au);
    }
  }
}

- (BOOL)isAirplaneMode
{
  v2 = self;
  p_lock = &self->lock;
  os_unfair_lock_lock(&self->lock);
  LOBYTE(v2) = v2->airplane;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setAirplaneMode:(BOOL)a3
{
  BOOL v3 = a3;
  p_lock = &self->lock;
  os_unfair_lock_lock(&self->lock);
  if (self->airplane != v3)
  {
    self->airplane = v3;
    [(VVMSharedPreferencesObserver *)self notifyAirplaneModeChanged_sync:v3];
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)notifyAirplaneModeChanged_sync:(BOOL)a3
{
  CFBooleanRef v5 = sub_1000090E4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    NSUInteger v6 = [(NSMapTable *)self->delegates count];
    *(_DWORD *)buf = 136315650;
    v21 = "";
    __int16 v22 = 2080;
    id v23 = "";
    __int16 v24 = 2048;
    NSUInteger v25 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#I %s%sSending AirplaneModeChanged to %lu delegates", buf, 0x20u);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  obj = self->delegates;
  id v7 = [(NSMapTable *)obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v16;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        int v11 = [(NSMapTable *)self->delegates objectForKey:v10];
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100009CD4;
        block[3] = &unk_1000C1670;
        block[4] = v10;
        BOOL v14 = a3;
        dispatch_async(v11, block);
      }
      id v7 = [(NSMapTable *)obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
}

- (void)addDelegate:(id)a3 queue:(id)a4
{
  p_lock = &self->lock;
  id v7 = a4;
  id v8 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSMapTable *)self->delegates setObject:v7 forKey:v8];

  os_unfair_lock_unlock(p_lock);
}

- (void)removeDelegate:(id)a3
{
  p_lock = &self->lock;
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