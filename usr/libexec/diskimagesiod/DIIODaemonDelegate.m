@interface DIIODaemonDelegate
+ (id)requestsStatsToNSArrayWithArray:(DIRequestsStatsArray *)a3;
- (BOOL)createNotificationPortWithError:(id *)a3;
- (BOOL)handleRefCount;
- (BOOL)isRAM;
- (BOOL)setupNewConnection:(id)a3;
- (BOOL)setupTerminationNotificationWithError:(id *)a3;
- (BOOL)tryAttachWithParams:(id)a3 error:(id *)a4;
- (BOOL)validateDeserializationWithParams:(id)a3 reply:(id)a4;
- (DIDeviceHandle)deviceHandle;
- (DIDiskArb)diskArbDisappear;
- (DIIOClientDelegate)clientDelegate;
- (DIIODaemonDelegate)initWithIsRAM:(BOOL)a3;
- (IONotificationPort)notificationPort;
- (NSMutableSet)activeConnections;
- (OS_dispatch_source)sigtermHandler;
- (OS_os_transaction)attachedTransaction;
- (__CFRunLoopSource)runLoopSource;
- (id).cxx_construct;
- (id)sandboxProfile;
- (id)serviceName;
- (unsigned)notificationIterator;
- (void)attachToExistingDeviceWithParams:(id)a3 reply:(id)a4;
- (void)attachToNewDeviceWithParams:(id)a3 reply:(id)a4;
- (void)destroyNotificationPort;
- (void)exitDaemon;
- (void)exitWithUnmount;
- (void)onClientInvalidateWithConnection:(id)a3;
- (void)retrieveStatsWithParams:(id)a3 reply:(id)a4;
- (void)runIOmanager;
- (void)setActiveConnections:(id)a3;
- (void)setAttachedTransaction:(id)a3;
- (void)setClientDelegate:(id)a3;
- (void)setDeviceHandle:(id)a3;
- (void)setDiskArbDisappear:(id)a3;
- (void)setHandleRefCount:(BOOL)a3;
- (void)setNotificationPort:(IONotificationPort *)a3;
- (void)setRunLoopSource:(__CFRunLoopSource *)a3;
- (void)setSigtermHandler:(id)a3;
- (void)setupExitDaemonWatchdog;
- (void)setupSigtermHandler;
- (void)unmountAll;
- (void)validateConnection;
- (void)validateInstance;
@end

@implementation DIIODaemonDelegate

- (DIIODaemonDelegate)initWithIsRAM:(BOOL)a3
{
  v12.receiver = self;
  v12.super_class = (Class)DIIODaemonDelegate;
  v4 = [(DIBaseServiceDelegate *)&v12 init];
  v5 = v4;
  if (!v4) {
    goto LABEL_4;
  }
  atomic_store(0, (unsigned __int8 *)&v4->_unmountStarted);
  v4->_isRAM = a3;
  v6 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
  activeConnections = v5->_activeConnections;
  v5->_activeConnections = v6;

  [(DIIODaemonDelegate *)v5 validateInstance];
  if (![(DIIODaemonDelegate *)v5 createNotificationPortWithError:0]) {
    goto LABEL_5;
  }
  [(DIIODaemonDelegate *)v5 setupSigtermHandler];
  uint64_t v8 = +[DIDiskArb diskArbWithError:0];
  diskArbDisappear = v5->_diskArbDisappear;
  v5->_diskArbDisappear = (DIDiskArb *)v8;

  if (v5->_diskArbDisappear) {
LABEL_4:
  }
    v10 = v5;
  else {
LABEL_5:
  }
    v10 = 0;

  return v10;
}

- (void)setupExitDaemonWatchdog
{
  dispatch_time_t v3 = dispatch_time(0, 8000000000);
  v4 = [(DIBaseServiceDelegate *)self dispatchQueue];
  dispatch_after(v3, v4, &stru_100191630);
}

- (void)setupSigtermHandler
{
  signal(15, (void (__cdecl *)(int))1);
  dispatch_time_t v3 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, (dispatch_queue_t)&_dispatch_main_q);
  sigtermHandler = self->_sigtermHandler;
  self->_sigtermHandler = v3;

  v5 = self->_sigtermHandler;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100008A9C;
  handler[3] = &unk_100191658;
  handler[4] = self;
  dispatch_source_set_event_handler(v5, handler);
  dispatch_resume((dispatch_object_t)self->_sigtermHandler);
}

- (void)destroyNotificationPort
{
  if ([(DIIODaemonDelegate *)self runLoopSource])
  {
    Current = CFRunLoopGetCurrent();
    CFRunLoopRemoveSource(Current, [(DIIODaemonDelegate *)self runLoopSource], kCFRunLoopDefaultMode);
    [(DIIODaemonDelegate *)self setRunLoopSource:0];
  }
  if ([(DIIODaemonDelegate *)self notificationPort])
  {
    IONotificationPortDestroy([(DIIODaemonDelegate *)self notificationPort]);
    [(DIIODaemonDelegate *)self setNotificationPort:0];
  }
  io_object_t notificationIterator = self->_notificationIterator;
  if (notificationIterator)
  {
    IOObjectRelease(notificationIterator);
    self->_io_object_t notificationIterator = 0;
  }
}

- (BOOL)createNotificationPortWithError:(id *)a3
{
  [(DIIODaemonDelegate *)self setNotificationPort:IONotificationPortCreate(kIOMainPortDefault)];
  if ([(DIIODaemonDelegate *)self notificationPort])
  {
    [(DIIODaemonDelegate *)self setRunLoopSource:IONotificationPortGetRunLoopSource(self->_notificationPort)];
    if ([(DIIODaemonDelegate *)self runLoopSource])
    {
      Current = CFRunLoopGetCurrent();
      CFRunLoopAddSource(Current, [(DIIODaemonDelegate *)self runLoopSource], kCFRunLoopDefaultMode);
      return 1;
    }
    [(DIIODaemonDelegate *)self destroyNotificationPort];
    CFStringRef v7 = @"Failed getting runloop source";
  }
  else
  {
    CFStringRef v7 = @"Failed creating notification port";
  }

  return +[DIError failWithEnumValue:153 verboseInfo:v7 error:a3];
}

- (BOOL)setupTerminationNotificationWithError:(id *)a3
{
  CFDictionaryRef v5 = IOServiceMatching("AppleDiskImageDevice");
  if (IOServiceAddMatchingNotification(self->_notificationPort, "IOServiceTerminate", v5, (IOServiceMatchingCallback)sub_100008E84, self, &self->_notificationIterator))
  {
    return +[DIError failWithEnumValue:153 verboseInfo:@"Failed adding matching notification" error:a3];
  }
  else
  {
    sub_100008E84(self, self->_notificationIterator);
    return 1;
  }
}

- (void)exitDaemon
{
  int v4 = *__error();
  if (sub_1000D29A0())
  {
    CFDictionaryRef v5 = sub_1000D2920();
    os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    v6 = [(DIIODaemonDelegate *)self deviceHandle];
    if (v6)
    {
      v2 = [(DIIODaemonDelegate *)self deviceHandle];
      CFStringRef v7 = [v2 BSDName];
    }
    else
    {
      CFStringRef v7 = @"an unprepared device";
    }
    *(_DWORD *)buf = 68158210;
    int v38 = 32;
    __int16 v39 = 2080;
    v40 = "-[DIIODaemonDelegate exitDaemon]";
    __int16 v41 = 2114;
    v42 = v7;
    LODWORD(v36) = 28;
    v35 = buf;
    uint64_t v8 = (char *)_os_log_send_and_compose_impl();
    if (v6)
    {
    }
    if (v8)
    {
      fprintf(__stderrp, "%s\n", v8);
      free(v8);
    }
  }
  else
  {
    v9 = sub_1000D2920();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = [(DIIODaemonDelegate *)self deviceHandle];
      if (v10)
      {
        v2 = [(DIIODaemonDelegate *)self deviceHandle];
        v11 = [v2 BSDName];
      }
      else
      {
        v11 = @"an unprepared device";
      }
      *(_DWORD *)buf = 68158210;
      int v38 = 32;
      __int16 v39 = 2080;
      v40 = "-[DIIODaemonDelegate exitDaemon]";
      __int16 v41 = 2114;
      v42 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%.*s: IO daemon of %{public}@ is shutting down, stopping IO channels", buf, 0x1Cu);
      if (v10)
      {
      }
    }
  }
  *__error() = v4;
  [(DIIODaemonDelegate *)self setupExitDaemonWatchdog];
  objc_super v12 = self;
  objc_sync_enter(v12);
  v13 = [(DIBaseServiceDelegate *)v12 listener];
  [v13 invalidate];

  v14 = [(DIIODaemonDelegate *)v12 clientDelegate];
  BOOL v15 = v14 == 0;

  if (!v15)
  {
    v21 = [(DIIODaemonDelegate *)v12 clientDelegate];
    v22 = [v21 listener];
    [v22 invalidate];
  }
  int v16 = *__error();
  if (sub_1000D29A0())
  {
    v17 = sub_1000D2920();
    os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    v18 = [(DIIODaemonDelegate *)v12 activeConnections];
    v19 = (__CFString *)[v18 count];
    *(_DWORD *)buf = 68158210;
    int v38 = 32;
    __int16 v39 = 2080;
    v40 = "-[DIIODaemonDelegate exitDaemon]";
    __int16 v41 = 2048;
    v42 = v19;
    v20 = (char *)_os_log_send_and_compose_impl();

    if (v20)
    {
      fprintf(__stderrp, "%s\n", v20);
      free(v20);
    }
  }
  else
  {
    v23 = sub_1000D2920();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = [(DIIODaemonDelegate *)v12 activeConnections];
      v25 = (__CFString *)[v24 count];
      *(_DWORD *)buf = 68158210;
      int v38 = 32;
      __int16 v39 = 2080;
      v40 = "-[DIIODaemonDelegate exitDaemon]";
      __int16 v41 = 2048;
      v42 = v25;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%.*s: # client connections at time of daemon termination: %lu", buf, 0x1Cu);
    }
  }
  *__error() = v16;
  [(DIIODaemonDelegate *)v12 destroyNotificationPort];
  v26 = [(DIIODaemonDelegate *)v12 diskArbDisappear];
  [v26 stop];

  v27 = [(DIIODaemonDelegate *)v12 sigtermHandler];
  BOOL v28 = v27 == 0;

  if (!v28)
  {
    v33 = [(DIIODaemonDelegate *)v12 sigtermHandler];
    dispatch_source_cancel(v33);

    [(DIIODaemonDelegate *)v12 setSigtermHandler:0];
  }
  uint64_t ioManager = (uint64_t)v12->_ioManager;
  if (!ioManager)
  {
    int v30 = *__error();
    if (sub_1000D29A0())
    {
      v31 = sub_1000D2920();
      os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);
      *(_DWORD *)buf = 68157954;
      int v38 = 32;
      __int16 v39 = 2080;
      v40 = "-[DIIODaemonDelegate exitDaemon]";
      v32 = (char *)_os_log_send_and_compose_impl();

      if (v32)
      {
        fprintf(__stderrp, "%s\n", v32);
        free(v32);
      }
    }
    else
    {
      v34 = sub_1000D2920();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68157954;
        int v38 = 32;
        __int16 v39 = 2080;
        v40 = "-[DIIODaemonDelegate exitDaemon]";
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "%.*s: _ioManager was not initialized yet, quitting immediately", buf, 0x12u);
      }
    }
    *__error() = v30;
    exit(0);
  }
  sub_1000103CC(ioManager);
  while (1)
    sleep(0xAu);
}

- (void)validateInstance
{
  v2 = getenv("LaunchInstanceID");
  if (v2)
  {
    dispatch_time_t v3 = v2;
    int v4 = *__error();
    if (sub_1000D29A0())
    {
      CFDictionaryRef v5 = sub_1000D2920();
      os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
      *(_DWORD *)buf = 68158210;
      int v9 = 38;
      __int16 v10 = 2080;
      v11 = "-[DIIODaemonDelegate validateInstance]";
      __int16 v12 = 2082;
      v13 = v3;
      v6 = (char *)_os_log_send_and_compose_impl();

      if (v6)
      {
        fprintf(__stderrp, "%s\n", v6);
        free(v6);
      }
    }
    else
    {
      CFStringRef v7 = sub_1000D2920();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68158210;
        int v9 = 38;
        __int16 v10 = 2080;
        v11 = "-[DIIODaemonDelegate validateInstance]";
        __int16 v12 = 2082;
        v13 = v3;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%.*s: Instance ID: %{public}s", buf, 0x1Cu);
      }
    }
    *__error() = v4;
  }
}

- (id)serviceName
{
  if (getuid())
  {
    unsigned int v3 = [(DIIODaemonDelegate *)self isRAM];
    int v4 = @"com.apple.diskimagesiod";
    if (v3) {
      int v4 = @"com.apple.diskimagesiod.ram";
    }
    CFDictionaryRef v5 = v4;
  }
  else
  {
    CFDictionaryRef v5 = @"com.apple.diskimagesiod.spb";
  }

  return v5;
}

- (id)sandboxProfile
{
  return @"com.apple.diskimagesiod";
}

- (void)unmountAll
{
  v2 = self;
  objc_sync_enter(v2);
  unsigned int v3 = v2;
  int v4 = [(DIIODaemonDelegate *)v2 deviceHandle];
  if (!v4
    || ([(DIIODaemonDelegate *)v2 deviceHandle],
        CFDictionaryRef v5 = objc_claimAutoreleasedReturnValue(),
        [v5 BSDName],
        v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        v4,
        !v6))
  {
LABEL_38:
    objc_sync_exit(v3);
    goto LABEL_39;
  }
  uint64_t ioManager = v3->_ioManager;
  if (!ioManager || (ioManager[112] & 1) != 0)
  {
    int v32 = *__error();
    if (sub_1000D29A0())
    {
      uint64_t v45 = 0;
      v33 = sub_1000D2920();
      os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);
      *(_DWORD *)buf = 68157954;
      int v47 = 32;
      __int16 v48 = 2080;
      v49 = "-[DIIODaemonDelegate unmountAll]";
      v34 = (char *)_os_log_send_and_compose_impl();

      if (v34)
      {
        fprintf(__stderrp, "%s\n", v34);
        free(v34);
      }
    }
    else
    {
      v35 = sub_1000D2920();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68157954;
        int v47 = 32;
        __int16 v48 = 2080;
        v49 = "-[DIIODaemonDelegate unmountAll]";
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "%.*s: Device is already ejected, skipping unmount", buf, 0x12u);
      }
    }
    *__error() = v32;
    goto LABEL_38;
  }
  objc_sync_exit(v3);

  uint64_t v8 = [DIAttachedDeviceInfo alloc];
  int v9 = [(DIIODaemonDelegate *)v3 deviceHandle];
  __int16 v10 = [v9 BSDName];
  unsigned int v3 = [(DIAttachedDeviceInfo *)v8 initWithBSDName:v10 error:0];

  if (v3)
  {
    __int16 v39 = v3;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id obj = [(DIIODaemonDelegate *)v3 copyEntitiesList];
    id v11 = [obj countByEnumeratingWithState:&v41 objects:v54 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v42;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v42 != v12) {
            objc_enumerationMutation(obj);
          }
          v14 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          BOOL v15 = [v14 objectForKeyedSubscript:@"Mount Point" v37, v38];
          if (v15)
          {
            int v16 = *__error();
            if (sub_1000D29A0())
            {
              uint64_t v45 = 0;
              v17 = sub_1000D2920();
              os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
              v18 = [v14 objectForKeyedSubscript:@"BSD Name"];
              *(_DWORD *)buf = 68158467;
              int v47 = 32;
              __int16 v48 = 2080;
              v49 = "-[DIIODaemonDelegate unmountAll]";
              __int16 v50 = 2113;
              id v51 = v15;
              __int16 v52 = 2114;
              v53 = v18;
              LODWORD(v38) = 38;
              v37 = buf;
              v19 = (char *)_os_log_send_and_compose_impl();

              if (v19)
              {
                fprintf(__stderrp, "%s\n", v19);
                free(v19);
              }
            }
            else
            {
              v20 = sub_1000D2920();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
              {
                v21 = [v14 objectForKeyedSubscript:@"BSD Name"];
                *(_DWORD *)buf = 68158467;
                int v47 = 32;
                __int16 v48 = 2080;
                v49 = "-[DIIODaemonDelegate unmountAll]";
                __int16 v50 = 2113;
                id v51 = v15;
                __int16 v52 = 2114;
                v53 = v21;
                _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%.*s: Forcing unmount of %{private}@ (%{public}@)", buf, 0x26u);
              }
            }
            *__error() = v16;
            id v22 = v15;
            if (unmount((const char *)[v22 fileSystemRepresentation], 0x80000))
            {
              int v23 = *__error();
              if (sub_1000D29A0())
              {
                uint64_t v45 = 0;
                v24 = sub_1000D2920();
                os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
                int v25 = *__error();
                *(_DWORD *)buf = 68158467;
                int v47 = 32;
                __int16 v48 = 2080;
                v49 = "-[DIIODaemonDelegate unmountAll]";
                __int16 v50 = 2113;
                id v51 = v22;
                __int16 v52 = 1024;
                LODWORD(v53) = v25;
                LODWORD(v38) = 34;
                v37 = buf;
                v26 = (char *)_os_log_send_and_compose_impl();

                if (v26)
                {
                  fprintf(__stderrp, "%s\n", v26);
                  free(v26);
                }
              }
              else
              {
                v27 = sub_1000D2920();
                if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                {
                  int v28 = *__error();
                  *(_DWORD *)buf = 68158467;
                  int v47 = 32;
                  __int16 v48 = 2080;
                  v49 = "-[DIIODaemonDelegate unmountAll]";
                  __int16 v50 = 2113;
                  id v51 = v22;
                  __int16 v52 = 1024;
                  LODWORD(v53) = v28;
                  _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%.*s: Force unmount of %{private}@ failed with errno %d", buf, 0x22u);
                }
              }
              *__error() = v23;
            }
          }
        }
        id v11 = [obj countByEnumeratingWithState:&v41 objects:v54 count:16];
      }
      while (v11);
    }

    int v29 = *__error();
    if (sub_1000D29A0())
    {
      uint64_t v45 = 0;
      int v30 = sub_1000D2920();
      os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
      *(_DWORD *)buf = 68157954;
      int v47 = 32;
      __int16 v48 = 2080;
      v49 = "-[DIIODaemonDelegate unmountAll]";
      v31 = (char *)_os_log_send_and_compose_impl();

      if (v31)
      {
        fprintf(__stderrp, "%s\n", v31);
        free(v31);
      }
    }
    else
    {
      uint64_t v36 = sub_1000D2920();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68157954;
        int v47 = 32;
        __int16 v48 = 2080;
        v49 = "-[DIIODaemonDelegate unmountAll]";
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "%.*s: Unmount done", buf, 0x12u);
      }
    }
    *__error() = v29;

    unsigned int v3 = v39;
  }
LABEL_39:
}

- (void)exitWithUnmount
{
  char v2 = 0;
  atomic_compare_exchange_strong((atomic_uchar *volatile)&self->_unmountStarted.__a_.__a_value, (unsigned __int8 *)&v2, 1u);
  if (v2)
  {
    int v11 = *__error();
    if (sub_1000D29A0())
    {
      uint64_t v24 = 0;
      uint64_t v12 = sub_1000D2920();
      os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
      *(_DWORD *)buf = 68157954;
      int v26 = 37;
      __int16 v27 = 2080;
      int v28 = "-[DIIODaemonDelegate exitWithUnmount]";
      v13 = (char *)_os_log_send_and_compose_impl();

      if (v13)
      {
        fprintf(__stderrp, "%s\n", v13);
        free(v13);
      }
    }
    else
    {
      v14 = sub_1000D2920();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68157954;
        int v26 = 37;
        __int16 v27 = 2080;
        int v28 = "-[DIIODaemonDelegate exitWithUnmount]";
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%.*s: Exit already in progress", buf, 0x12u);
      }
    }
    *__error() = v11;
  }
  else
  {
    dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
    if (!v4)
    {
      int v16 = *__error();
      if (sub_1000D29A0())
      {
        uint64_t v24 = 0;
        v17 = sub_1000D2920();
        os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
        *(_DWORD *)buf = 68157954;
        int v26 = 37;
        __int16 v27 = 2080;
        int v28 = "-[DIIODaemonDelegate exitWithUnmount]";
        v18 = (char *)_os_log_send_and_compose_impl();

        if (v18)
        {
          fprintf(__stderrp, "%s\n", v18);
          free(v18);
        }
      }
      else
      {
        v19 = sub_1000D2920();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 68157954;
          int v26 = 37;
          __int16 v27 = 2080;
          int v28 = "-[DIIODaemonDelegate exitWithUnmount]";
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%.*s: Failed creating unmount done semaphore", buf, 0x12u);
        }
      }
      *__error() = v16;
      exit(0);
    }
    CFDictionaryRef v5 = [(DIBaseServiceDelegate *)self dispatchQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000A7E8;
    block[3] = &unk_100191680;
    block[4] = self;
    v6 = v4;
    int v23 = v6;
    dispatch_async(v5, block);

    dispatch_time_t v7 = dispatch_time(0, 30000000000);
    if (dispatch_semaphore_wait(v6, v7))
    {
      int v8 = *__error();
      if (sub_1000D29A0())
      {
        uint64_t v24 = 0;
        int v9 = sub_1000D2920();
        os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
        *(_DWORD *)buf = 68157954;
        int v26 = 37;
        __int16 v27 = 2080;
        int v28 = "-[DIIODaemonDelegate exitWithUnmount]";
        LODWORD(v21) = 18;
        v20 = buf;
        __int16 v10 = (char *)_os_log_send_and_compose_impl();

        if (v10)
        {
          fprintf(__stderrp, "%s\n", v10);
          free(v10);
        }
      }
      else
      {
        BOOL v15 = sub_1000D2920();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 68157954;
          int v26 = 37;
          __int16 v27 = 2080;
          int v28 = "-[DIIODaemonDelegate exitWithUnmount]";
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%.*s: Unmount timeout occurred", buf, 0x12u);
        }
      }
      *__error() = v8;
    }
    [(DIIODaemonDelegate *)self exitDaemon];
  }
}

- (void)onClientInvalidateWithConnection:(id)a3
{
  id v4 = a3;
  CFDictionaryRef v5 = self;
  objc_sync_enter(v5);
  v6 = [(DIIODaemonDelegate *)v5 activeConnections];
  [v6 removeObject:v4];

  dispatch_time_t v7 = [(DIIODaemonDelegate *)v5 deviceHandle];

  if (!v7)
  {
    int v8 = *__error();
    if (sub_1000D29A0())
    {
      int v9 = sub_1000D2920();
      os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
      *(_DWORD *)buf = 68157954;
      int v31 = 55;
      __int16 v32 = 2080;
      v33 = "-[DIIODaemonDelegate onClientInvalidateWithConnection:]";
      LODWORD(v29) = 18;
      int v28 = buf;
      __int16 v10 = (char *)_os_log_send_and_compose_impl();

      if (v10)
      {
        fprintf(__stderrp, "%s\n", v10);
        free(v10);
      }
    }
    else
    {
      int v11 = sub_1000D2920();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68157954;
        int v31 = 55;
        __int16 v32 = 2080;
        v33 = "-[DIIODaemonDelegate onClientInvalidateWithConnection:]";
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%.*s: Reached XPC invalidation/interruption before device initialization, quitting.", buf, 0x12u);
      }
    }
    *__error() = v8;
    [(DIIODaemonDelegate *)v5 exitDaemon];
  }
  if (![(DIIODaemonDelegate *)v5 handleRefCount])
  {
    int v14 = *__error();
    if (!sub_1000D29A0())
    {
      id v22 = sub_1000D2920();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        int v23 = [(DIIODaemonDelegate *)v5 activeConnections];
        id v24 = [v23 count];
        *(_DWORD *)buf = 68158210;
        int v31 = 55;
        __int16 v32 = 2080;
        v33 = "-[DIIODaemonDelegate onClientInvalidateWithConnection:]";
        __int16 v34 = 2048;
        id v35 = v24;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%.*s: Unmanaged attach, ignoring XPC disconnection (# open connections left: %lu)", buf, 0x1Cu);
      }
      goto LABEL_25;
    }
    v19 = sub_1000D2920();
    os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
    v20 = [(DIIODaemonDelegate *)v5 activeConnections];
    id v21 = [v20 count];
    *(_DWORD *)buf = 68158210;
    int v31 = 55;
    __int16 v32 = 2080;
    v33 = "-[DIIODaemonDelegate onClientInvalidateWithConnection:]";
    __int16 v34 = 2048;
    id v35 = v21;
    v18 = (char *)_os_log_send_and_compose_impl();

    if (v18)
    {
LABEL_13:
      fprintf(__stderrp, "%s\n", v18);
      free(v18);
    }
LABEL_25:
    *__error() = v14;
    objc_sync_exit(v5);

    goto LABEL_26;
  }
  uint64_t v12 = [(DIIODaemonDelegate *)v5 activeConnections];
  BOOL v13 = [v12 count] == 0;

  if (!v13)
  {
    int v14 = *__error();
    if (!sub_1000D29A0())
    {
      int v25 = sub_1000D2920();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        int v26 = [(DIIODaemonDelegate *)v5 activeConnections];
        id v27 = [v26 count];
        *(_DWORD *)buf = 68158210;
        int v31 = 55;
        __int16 v32 = 2080;
        v33 = "-[DIIODaemonDelegate onClientInvalidateWithConnection:]";
        __int16 v34 = 2048;
        id v35 = v27;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%.*s: XPC connection closed for a managed attach, # open connections left: %lu", buf, 0x1Cu);
      }
      goto LABEL_25;
    }
    BOOL v15 = sub_1000D2920();
    os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    int v16 = [(DIIODaemonDelegate *)v5 activeConnections];
    id v17 = [v16 count];
    *(_DWORD *)buf = 68158210;
    int v31 = 55;
    __int16 v32 = 2080;
    v33 = "-[DIIODaemonDelegate onClientInvalidateWithConnection:]";
    __int16 v34 = 2048;
    id v35 = v17;
    v18 = (char *)_os_log_send_and_compose_impl();

    if (v18) {
      goto LABEL_13;
    }
    goto LABEL_25;
  }
  objc_sync_exit(v5);

  [(DIIODaemonDelegate *)v5 exitWithUnmount];
LABEL_26:
}

- (void)runIOmanager
{
  sub_100010398((uint64_t *)self->_ioManager);
  if (self->_ioManager)
  {
    sub_100010394();
    operator delete();
  }
  int v3 = *__error();
  if (sub_1000D29A0())
  {
    id v4 = sub_1000D2920();
    os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    *(_DWORD *)buf = 68157954;
    int v8 = 34;
    __int16 v9 = 2080;
    __int16 v10 = "-[DIIODaemonDelegate runIOmanager]";
    CFDictionaryRef v5 = (char *)_os_log_send_and_compose_impl();

    if (v5)
    {
      fprintf(__stderrp, "%s\n", v5);
      free(v5);
    }
  }
  else
  {
    v6 = sub_1000D2920();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68157954;
      int v8 = 34;
      __int16 v9 = 2080;
      __int16 v10 = "-[DIIODaemonDelegate runIOmanager]";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%.*s: Shutdown is complete", buf, 0x12u);
    }
  }
  *__error() = v3;
  [(DIIODaemonDelegate *)self setAttachedTransaction:0];
  exit(0);
}

- (BOOL)tryAttachWithParams:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_initWeak(&location, self);
  -[DIIODaemonDelegate setHandleRefCount:](self, "setHandleRefCount:", [v6 handleRefCount]);
  if ([(DIIODaemonDelegate *)self handleRefCount])
  {
    dispatch_time_t v7 = [[DIIOClientDelegate alloc] initWithIODaemon:self];
    [(DIIODaemonDelegate *)self setClientDelegate:v7];

    int v8 = [(DIIODaemonDelegate *)self clientDelegate];
    [v8 startXPClistener];

    __int16 v9 = [DIDeviceHandle alloc];
    id v10 = [v6 regEntryID];
    int v11 = [(DIIODaemonDelegate *)self clientDelegate];
    uint64_t v12 = [(DIDeviceHandle *)v11 xpcEndpoint];
    BOOL v13 = [(DIDeviceHandle *)v9 initWithRegEntryID:v10 xpcEndpoint:v12];
    [(DIIODaemonDelegate *)self setDeviceHandle:v13];
  }
  else
  {
    int v11 = -[DIDeviceHandle initWithRegEntryID:]([DIDeviceHandle alloc], "initWithRegEntryID:", [v6 regEntryID]);
    [(DIIODaemonDelegate *)self setDeviceHandle:v11];
  }

  int v14 = [(DIIODaemonDelegate *)self deviceHandle];
  id v25 = +[DIBlockDevice copyUnmatchedDiskImageWithRegEntryID:error:](DIBlockDevice, "copyUnmatchedDiskImageWithRegEntryID:error:", [v14 regEntryID], a4);

  if (v25)
  {
    IOObjectRetain((io_object_t)[v25 ioObj]);
    if ([(DIIODaemonDelegate *)self setupTerminationNotificationWithError:a4])
    {
      BOOL v15 = [(DIIODaemonDelegate *)self diskArbDisappear];
      int v16 = [v6 inputStatFS];
      if (v16)
      {
        id v4 = [v6 inputStatFS];
        id v17 = [v4 mountedOnURL];
      }
      else
      {
        id v17 = 0;
      }
      v18 = [v6 shadowChain];
      v19 = [v18 mountPoints];
      [v15 addDisappearedCallbackWithMountPoint:v17 shadowMountPoints:v19 delegate:self];

      if (v16)
      {
      }
      int v20 = *__error();
      if (sub_1000D29A0())
      {
        id v21 = sub_1000D2920();
        os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
        *(_DWORD *)buf = 68157954;
        int v29 = 48;
        __int16 v30 = 2080;
        int v31 = "-[DIIODaemonDelegate tryAttachWithParams:error:]";
        id v22 = (char *)_os_log_send_and_compose_impl();

        if (v22)
        {
          fprintf(__stderrp, "%s\n", v22);
          free(v22);
        }
      }
      else
      {
        int v23 = sub_1000D2920();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 68157954;
          int v29 = 48;
          __int16 v30 = 2080;
          int v31 = "-[DIIODaemonDelegate tryAttachWithParams:error:]";
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%.*s: Dispatching DIIOManager", buf, 0x12u);
        }
      }
      *__error() = v20;
      operator new();
    }
  }

  objc_destroyWeak(&location);
  return 0;
}

- (BOOL)validateDeserializationWithParams:(id)a3 reply:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, void, id))a4;
  id v10 = 0;
  unsigned __int8 v7 = [v5 validateDeserializationWithError:&v10];
  id v8 = v10;
  if ((v7 & 1) == 0) {
    v6[2](v6, 0, v8);
  }

  return v7;
}

- (void)attachToNewDeviceWithParams:(id)a3 reply:(id)a4
{
  id v6 = a3;
  unsigned __int8 v7 = (void (**)(id, void, void *))a4;
  objc_initWeak(&location, self);
  if ([(DIIODaemonDelegate *)self validateDeserializationWithParams:v6 reply:v7])
  {
    int v8 = *__error();
    if (sub_1000D29A0())
    {
      v23[1] = 0;
      __int16 v9 = sub_1000D2920();
      os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
      id v10 = [v6 instanceID];
      id v11 = [v6 regEntryID];
      *(_DWORD *)buf = 68158466;
      int v26 = 56;
      __int16 v27 = 2080;
      int v28 = "-[DIIODaemonDelegate attachToNewDeviceWithParams:reply:]";
      __int16 v29 = 2114;
      __int16 v30 = v10;
      __int16 v31 = 2048;
      id v32 = v11;
      LODWORD(v19) = 38;
      v18 = buf;
      uint64_t v12 = (char *)_os_log_send_and_compose_impl();

      if (v12)
      {
        fprintf(__stderrp, "%s\n", v12);
        free(v12);
      }
    }
    else
    {
      BOOL v13 = sub_1000D2920();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = [v6 instanceID];
        id v15 = [v6 regEntryID];
        *(_DWORD *)buf = 68158466;
        int v26 = 56;
        __int16 v27 = 2080;
        int v28 = "-[DIIODaemonDelegate attachToNewDeviceWithParams:reply:]";
        __int16 v29 = 2114;
        __int16 v30 = v14;
        __int16 v31 = 2048;
        id v32 = v15;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%.*s: entry, instance ID = %{public}@, registry entry ID = 0x%llx", buf, 0x26u);
      }
    }
    *__error() = v8;
    if (!getuid() && ([v6 requiresRootDaemon] & 1) == 0)
    {
      int v16 = +[DIError errorWithPOSIXCode:1 verboseInfo:@"Root daemon connection denied"];
      v7[2](v7, 0, v16);
      [(DIIODaemonDelegate *)self exitDaemon];
    }
    id v17 = [(DIBaseServiceDelegate *)self dispatchQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000BF5C;
    block[3] = &unk_1001916D0;
    objc_copyWeak(v23, &location);
    id v22 = v7;
    id v21 = v6;
    dispatch_async(v17, block);

    objc_destroyWeak(v23);
  }
  objc_destroyWeak(&location);
}

- (void)attachToExistingDeviceWithParams:(id)a3 reply:(id)a4
{
  id v6 = a3;
  unsigned __int8 v7 = (void (**)(id, void, void *))a4;
  if ([(DIIODaemonDelegate *)self validateDeserializationWithParams:v6 reply:v7])
  {
    int v8 = *__error();
    if (sub_1000D29A0())
    {
      __int16 v9 = sub_1000D2920();
      os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
      id v10 = [v6 instanceID];
      *(_DWORD *)buf = 68158466;
      int v38 = 61;
      __int16 v39 = 2080;
      v40 = "-[DIIODaemonDelegate attachToExistingDeviceWithParams:reply:]";
      __int16 v41 = 2114;
      long long v42 = v10;
      __int16 v43 = 2048;
      id v44 = [v6 regEntryID];
      LODWORD(v36) = 38;
      id v35 = buf;
      id v11 = (char *)_os_log_send_and_compose_impl();

      if (v11)
      {
        fprintf(__stderrp, "%s\n", v11);
        free(v11);
      }
    }
    else
    {
      uint64_t v12 = sub_1000D2920();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v13 = [v6 instanceID];
        *(_DWORD *)buf = 68158466;
        int v38 = 61;
        __int16 v39 = 2080;
        v40 = "-[DIIODaemonDelegate attachToExistingDeviceWithParams:reply:]";
        __int16 v41 = 2114;
        long long v42 = v13;
        __int16 v43 = 2048;
        id v44 = [v6 regEntryID];
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%.*s: entry, instance ID = %{public}@, registry entry ID = 0x%llx", buf, 0x26u);
      }
    }
    *__error() = v8;
    int v14 = self;
    objc_sync_enter(v14);
    id v15 = [(DIIODaemonDelegate *)v14 deviceHandle];
    BOOL v16 = v15 == 0;

    if (v16)
    {
      int v23 = +[DIError errorWithEnumValue:155 verboseInfo:@"A controller XPC service attempted to connect to an existing device, but this daemon instance has no such device yet"];
      v7[2](v7, 0, v23);
    }
    else
    {
      id v17 = [v6 regEntryID];
      v18 = [(DIIODaemonDelegate *)v14 deviceHandle];
      LOBYTE(v17) = v17 == [v18 regEntryID];

      if (v17)
      {
        unsigned __int8 v19 = atomic_load((unsigned __int8 *)&v14->_unmountStarted);
        if (v19)
        {
          int v23 = +[DIError errorWithEnumValue:168 verboseInfo:@"Unmount already started, notifying controller to retry later"];
          v7[2](v7, 0, v23);
        }
        else
        {
          if ([v6 handleRefCount]
            && ![(DIIODaemonDelegate *)v14 handleRefCount])
          {
            int v24 = *__error();
            if (sub_1000D29A0())
            {
              id v25 = sub_1000D2920();
              os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
              *(_DWORD *)buf = 68157954;
              int v38 = 61;
              __int16 v39 = 2080;
              v40 = "-[DIIODaemonDelegate attachToExistingDeviceWithParams:reply:]";
              int v26 = (char *)_os_log_send_and_compose_impl();

              if (v26)
              {
                fprintf(__stderrp, "%s\n", v26);
                free(v26);
              }
            }
            else
            {
              __int16 v27 = sub_1000D2920();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 68157954;
                int v38 = 61;
                __int16 v39 = 2080;
                v40 = "-[DIIODaemonDelegate attachToExistingDeviceWithParams:reply:]";
                _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%.*s: Ignoring client reference counting request as a previous attach was performed without reference counting", buf, 0x12u);
              }
            }
            *__error() = v24;
          }
          else if ((objc_msgSend(v6, "handleRefCount", v35, v36) & 1) == 0 {
                 && [(DIIODaemonDelegate *)v14 handleRefCount])
          }
          {
            int v20 = *__error();
            if (sub_1000D29A0())
            {
              id v21 = sub_1000D2920();
              os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
              *(_DWORD *)buf = 68157954;
              int v38 = 61;
              __int16 v39 = 2080;
              v40 = "-[DIIODaemonDelegate attachToExistingDeviceWithParams:reply:]";
              id v22 = (char *)_os_log_send_and_compose_impl();

              if (v22)
              {
                fprintf(__stderrp, "%s\n", v22);
                free(v22);
              }
            }
            else
            {
              int v28 = sub_1000D2920();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 68157954;
                int v38 = 61;
                __int16 v39 = 2080;
                v40 = "-[DIIODaemonDelegate attachToExistingDeviceWithParams:reply:]";
                _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%.*s: Disabling reference counting", buf, 0x12u);
              }
            }
            *__error() = v20;
            [(DIIODaemonDelegate *)v14 setHandleRefCount:0];
            __int16 v29 = [(DIIODaemonDelegate *)v14 deviceHandle];
            [v29 setXpcEndpoint:0];
          }
          int v30 = *__error();
          if (sub_1000D29A0())
          {
            __int16 v31 = sub_1000D2920();
            os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);
            *(_DWORD *)buf = 68157954;
            int v38 = 61;
            __int16 v39 = 2080;
            v40 = "-[DIIODaemonDelegate attachToExistingDeviceWithParams:reply:]";
            id v32 = (char *)_os_log_send_and_compose_impl();

            if (v32)
            {
              fprintf(__stderrp, "%s\n", v32);
              free(v32);
            }
          }
          else
          {
            v33 = sub_1000D2920();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 68157954;
              int v38 = 61;
              __int16 v39 = 2080;
              v40 = "-[DIIODaemonDelegate attachToExistingDeviceWithParams:reply:]";
              _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "%.*s: Got connection to an existing disk image, returning its handle", buf, 0x12u);
            }
          }
          *__error() = v30;
          __int16 v34 = [(DIIODaemonDelegate *)v14 deviceHandle];
          ((void (**)(id, void *, void *))v7)[2](v7, v34, 0);

          int v23 = 0;
        }
      }
      else
      {
        int v23 = +[DIError errorWithEnumValue:150 verboseInfo:@"Registry entry ID mismatch between controller and daemon"];
        v7[2](v7, 0, v23);
      }
    }
    objc_sync_exit(v14);
  }
}

- (void)validateConnection
{
  if (!getenv("LaunchInstanceID"))
  {
    int v2 = *__error();
    if (sub_1000D29A0())
    {
      int v3 = sub_1000D2920();
      os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
      *(_DWORD *)buf = 68157954;
      int v7 = 40;
      __int16 v8 = 2080;
      __int16 v9 = "-[DIIODaemonDelegate validateConnection]";
      id v4 = (char *)_os_log_send_and_compose_impl();

      if (v4)
      {
        fprintf(__stderrp, "%s\n", v4);
        free(v4);
      }
    }
    else
    {
      id v5 = sub_1000D2920();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68157954;
        int v7 = 40;
        __int16 v8 = 2080;
        __int16 v9 = "-[DIIODaemonDelegate validateConnection]";
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%.*s: As we were launched without instance ID, rejecting the connection and killing the daemon.", buf, 0x12u);
      }
    }
    *__error() = v2;
    exit(1);
  }
}

- (BOOL)setupNewConnection:(id)a3
{
  id v4 = a3;
  id v5 = [v4 valueForEntitlement:@"com.apple.diskimages.creator-uc"];
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0 && ([v5 BOOLValue] & 1) != 0)
  {
    int v6 = *__error();
    if (sub_1000D29A0())
    {
      id location = 0;
      int v7 = sub_1000D2920();
      os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
      id buf = (id)0x2904100202;
      __int16 v36 = 2080;
      v37 = "-[DIIODaemonDelegate setupNewConnection:]";
      __int16 v8 = (char *)_os_log_send_and_compose_impl();

      if (v8)
      {
        fprintf(__stderrp, "%s\n", v8);
        free(v8);
      }
    }
    else
    {
      unsigned __int8 v19 = sub_1000D2920();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        id buf = (id)0x2904100202;
        __int16 v36 = 2080;
        v37 = "-[DIIODaemonDelegate setupNewConnection:]";
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%.*s: Connected client is entitled to attach a disk image", (uint8_t *)&buf, 0x12u);
      }
    }
    *__error() = v6;
    int v20 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___DIIODaemonProtocol];
    [v4 setExportedInterface:v20];

    [v4 setExportedObject:self];
    objc_initWeak(&buf, self);
    objc_initWeak(&location, v4);
    id v21 = self;
    objc_sync_enter(v21);
    unsigned __int8 v22 = atomic_load((unsigned __int8 *)&v21->_unmountStarted);
    if ((v22 & 1) == 0)
    {
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_10000D31C;
      v31[3] = &unk_1001916F8;
      objc_copyWeak(&v32, &buf);
      objc_copyWeak(&v33, &location);
      [v4 setInterruptionHandler:v31];
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_10000D4FC;
      v28[3] = &unk_1001916F8;
      objc_copyWeak(&v29, &buf);
      objc_copyWeak(&v30, &location);
      [v4 setInvalidationHandler:v28];
      int v23 = [(DIIODaemonDelegate *)v21 activeConnections];
      [v23 addObject:v4];

      objc_destroyWeak(&v30);
      objc_destroyWeak(&v29);
      objc_destroyWeak(&v33);
      objc_destroyWeak(&v32);
    }
    objc_sync_exit(v21);

    objc_destroyWeak(&location);
    objc_destroyWeak(&buf);
    BOOL v17 = 1;
  }
  else
  {
    int v9 = *__error();
    if (sub_1000D29A0())
    {
      id location = 0;
      id v10 = sub_1000D2920();
      os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
      id buf = (id)0x2904100202;
      __int16 v36 = 2080;
      v37 = "-[DIIODaemonDelegate setupNewConnection:]";
      id v11 = (char *)_os_log_send_and_compose_impl();

      if (v11)
      {
        fprintf(__stderrp, "%s\n", v11);
        free(v11);
      }
    }
    else
    {
      uint64_t v12 = sub_1000D2920();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id buf = (id)0x2904100202;
        __int16 v36 = 2080;
        v37 = "-[DIIODaemonDelegate setupNewConnection:]";
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%.*s: The connected client is not entitled to attach a disk image, rejecting", (uint8_t *)&buf, 0x12u);
      }
    }
    *__error() = v9;
    BOOL v13 = self;
    objc_sync_enter(v13);
    int v14 = [(DIIODaemonDelegate *)v13 deviceHandle];
    if (v14)
    {
    }
    else
    {
      id v15 = [(DIIODaemonDelegate *)v13 activeConnections];
      BOOL v16 = [v15 count] == 0;

      if (v16)
      {
        int v24 = *__error();
        if (sub_1000D29A0())
        {
          id location = 0;
          id v25 = sub_1000D2920();
          os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
          id buf = (id)0x2904100202;
          __int16 v36 = 2080;
          v37 = "-[DIIODaemonDelegate setupNewConnection:]";
          int v26 = (char *)_os_log_send_and_compose_impl();

          if (v26)
          {
            fprintf(__stderrp, "%s\n", v26);
            free(v26);
          }
        }
        else
        {
          __int16 v27 = sub_1000D2920();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            id buf = (id)0x2904100202;
            __int16 v36 = 2080;
            v37 = "-[DIIODaemonDelegate setupNewConnection:]";
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%.*s: The rejected connection caused a daemon instance to wake up. Killing it", (uint8_t *)&buf, 0x12u);
          }
        }
        *__error() = v24;
        exit(0);
      }
    }
    objc_sync_exit(v13);

    BOOL v17 = 0;
  }

  return v17;
}

- (void)retrieveStatsWithParams:(id)a3 reply:(id)a4
{
  id v6 = a3;
  int v7 = (void (**)(id, void *, id))a4;
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  id v16 = 0;
  unsigned int v8 = [v6 validateDeserializationWithError:&v16];
  id v9 = v16;
  if (v8)
  {
    if (sub_1000105D8((uint64_t)self->_ioManager, &v19, &v18) && sub_1000107B4((uint64_t)self->_ioManager, outputStruct))
    {
      id v10 = objc_alloc((Class)NSNumber);
      id v11 = [v10 initWithUnsignedLongLong:v19];
      id v12 = objc_alloc((Class)NSNumber);
      id v13 = [v12 initWithUnsignedLongLong:v18];
      int v14 = +[DIIODaemonDelegate requestsStatsToNSArrayWithArray:outputStruct];
      id v15 = +[NSDictionary dictionaryWithObjectsAndKeys:v11, @"hit", v13, @"miss", v14, @"pending_requests", 0];
    }
    else
    {
      id v15 = 0;
      +[DIError errorWithEnumValue:150 verboseInfo:@"Failed to fetch stats from driver"];
      id v11 = v9;
      id v9 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v15 = 0;
  }
  v7[2](v7, v15, v9);
}

+ (id)requestsStatsToNSArrayWithArray:(DIRequestsStatsArray *)a3
{
  id v15 = objc_alloc_init((Class)NSMutableArray);
  int v14 = a3;
  if (a3->var1)
  {
    unint64_t v4 = 0;
    p_var3 = &a3->var0[0].var3;
    do
    {
      id v6 = [objc_alloc((Class)NSNumber) initWithUnsignedInt:*((unsigned int *)p_var3 - 4)];
      id v7 = [objc_alloc((Class)NSNumber) initWithUnsignedLongLong:*(p_var3 - 1)];
      id v8 = [objc_alloc((Class)NSNumber) initWithUnsignedLongLong:*p_var3];
      id v9 = [objc_alloc((Class)NSNumber) initWithUnsignedLongLong:p_var3[1]];
      id v10 = [objc_alloc((Class)NSNumber) initWithUnsignedLongLong:p_var3[2]];
      id v11 = [objc_alloc((Class)NSNumber) initWithUnsignedShort:*((unsigned __int16 *)p_var3 - 6)];
      id v12 = +[NSDictionary dictionaryWithObjectsAndKeys:v6, @"index", v7, @"offset", v8, @"absolute_offset", v9, @"size", v10, @"total_size", v11, @"cmd", 0];

      [v15 addObject:v12];
      ++v4;
      p_var3 += 5;
    }
    while (v4 < v14->var1);
  }

  return v15;
}

- (IONotificationPort)notificationPort
{
  return self->_notificationPort;
}

- (void)setNotificationPort:(IONotificationPort *)a3
{
  self->_notificationPort = a3;
}

- (__CFRunLoopSource)runLoopSource
{
  return self->_runLoopSource;
}

- (void)setRunLoopSource:(__CFRunLoopSource *)a3
{
  self->_runLoopSource = a3;
}

- (unsigned)notificationIterator
{
  return self->_notificationIterator;
}

- (DIDeviceHandle)deviceHandle
{
  return (DIDeviceHandle *)objc_getProperty(self, a2, 56, 1);
}

- (void)setDeviceHandle:(id)a3
{
}

- (OS_os_transaction)attachedTransaction
{
  return self->_attachedTransaction;
}

- (void)setAttachedTransaction:(id)a3
{
}

- (BOOL)isRAM
{
  return self->_isRAM;
}

- (NSMutableSet)activeConnections
{
  return self->_activeConnections;
}

- (void)setActiveConnections:(id)a3
{
}

- (OS_dispatch_source)sigtermHandler
{
  return self->_sigtermHandler;
}

- (void)setSigtermHandler:(id)a3
{
}

- (DIDiskArb)diskArbDisappear
{
  return self->_diskArbDisappear;
}

- (void)setDiskArbDisappear:(id)a3
{
}

- (BOOL)handleRefCount
{
  return self->_handleRefCount;
}

- (void)setHandleRefCount:(BOOL)a3
{
  self->_handleRefCount = a3;
}

- (DIIOClientDelegate)clientDelegate
{
  return self->_clientDelegate;
}

- (void)setClientDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientDelegate, 0);
  objc_storeStrong((id *)&self->_diskArbDisappear, 0);
  objc_storeStrong((id *)&self->_sigtermHandler, 0);
  objc_storeStrong((id *)&self->_activeConnections, 0);
  objc_storeStrong((id *)&self->_attachedTransaction, 0);

  objc_storeStrong((id *)&self->_deviceHandle, 0);
}

- (id).cxx_construct
{
  *((unsigned char *)self + 32) = 0;
  return self;
}

@end