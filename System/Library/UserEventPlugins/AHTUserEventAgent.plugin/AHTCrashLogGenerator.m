@interface AHTCrashLogGenerator
- (AHTCrashLogGenerator)init;
- (AHTDeviceMatchingNotification)deviceAdded;
- (AHTDeviceMatchingNotification)interfaceAdded;
- (BOOL)clearMemoryDumps:(id)a3;
- (BOOL)getMemoryDumps:(id)a3;
- (BOOL)start:(id)a3 error:(id *)a4;
- (BOOL)stop:(id *)a3;
- (NSMutableArray)bootloaders;
- (NSMutableArray)sources;
- (OS_dispatch_queue)queue;
- (void)dealloc;
- (void)registerNotification:(id)a3 memoryDumpLevel:(id)a4;
- (void)setBootloaders:(id)a3;
- (void)setDeviceAdded:(id)a3;
- (void)setInterfaceAdded:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSources:(id)a3;
@end

@implementation AHTCrashLogGenerator

- (AHTCrashLogGenerator)init
{
  v29.receiver = self;
  v29.super_class = (Class)AHTCrashLogGenerator;
  v2 = [(AHTCrashLogGenerator *)&v29 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    sources = v2->_sources;
    v2->_sources = (NSMutableArray *)v3;

    CFMutableDictionaryRef v5 = IOServiceMatching("AppleHIDTransportDevice");
    v6 = [[AHTDeviceMatchingNotification alloc] initWithMatchingDictionary:v5 type:"IOServiceFirstPublish"];
    deviceAdded = v2->_deviceAdded;
    v2->_deviceAdded = v6;

    if (v2->_deviceAdded)
    {
      CFMutableDictionaryRef v8 = IOServiceMatching("AppleHIDTransportInterface");

      v9 = [[AHTDeviceMatchingNotification alloc] initWithMatchingDictionary:v8 type:"IOServiceFirstPublish"];
      interfaceAdded = v2->_interfaceAdded;
      v2->_interfaceAdded = v9;

      if (v2->_interfaceAdded)
      {
        v11 = v2;
      }
      else
      {
        BOOL v20 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
        if (v20) {
          sub_8C60(v20, v21, v22, v23, v24, v25, v26, v27);
        }
        v11 = 0;
      }
      CFMutableDictionaryRef v5 = v8;
    }
    else
    {
      BOOL v12 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v12) {
        sub_8C24(v12, v13, v14, v15, v16, v17, v18, v19);
      }
      v11 = 0;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)start:(id)a3 error:(id *)a4
{
  id v7 = a3;
  objc_initWeak(&location, self);
  objc_storeStrong((id *)&self->_queue, a3);
  CFMutableDictionaryRef v8 = +[NSUserDefaults standardUserDefaults];
  v9 = [v8 persistentDomainForName:@"com.apple.hid.memory-dump"];
  v10 = [v9 objectForKey:@"level"];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_5BC0;
  v20[3] = &unk_C330;
  objc_copyWeak(&v22, &location);
  id v11 = v10;
  id v21 = v11;
  BOOL v12 = objc_retainBlock(v20);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_5D18;
  v17[3] = &unk_C330;
  objc_copyWeak(&v19, &location);
  id v13 = v11;
  id v18 = v13;
  uint64_t v14 = objc_retainBlock(v17);
  if ([(AHTDeviceMatchingNotification *)self->_deviceAdded startWithDispatchQueue:v7 error:a4 action:v12])
  {
    BOOL v15 = [(AHTDeviceMatchingNotification *)self->_interfaceAdded startWithDispatchQueue:v7 error:a4 action:v14];
  }
  else
  {
    BOOL v15 = 0;
  }

  objc_destroyWeak(&v19);
  objc_destroyWeak(&v22);

  objc_destroyWeak(&location);
  return v15;
}

- (BOOL)stop:(id *)a3
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  CFMutableDictionaryRef v5 = self->_sources;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        dispatch_source_cancel(*(dispatch_source_t *)(*((void *)&v12 + 1) + 8 * (void)v9));
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  [(NSMutableArray *)self->_sources removeAllObjects];
  unsigned __int8 v10 = [(AHTDeviceMatchingNotification *)self->_deviceAdded stop:a3];
  return v10 & [(AHTDeviceMatchingNotification *)self->_interfaceAdded stop:a3];
}

- (void)registerNotification:(id)a3 memoryDumpLevel:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 supportsMemoryDump])
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_61B4;
    v17[3] = &unk_C358;
    void v17[4] = self;
    uint64_t v8 = objc_retainBlock(v17);
    queue = self->_queue;
    id v16 = 0;
    unsigned __int8 v10 = [v6 dispatchSourceForNotification:queue action:v8 error:&v16];
    id v11 = v16;
    if (v10)
    {
      dispatch_resume(v10);
      [(NSMutableArray *)self->_sources addObject:v10];
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_8D0C();
    }
    ((void (*)(void *, id, uint64_t))v8[2])(v8, v6, 1);
    if (v7)
    {
      id v12 = [v7 unsignedIntValue];
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        int v19 = (int)v12;
        _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Set memory dump level to 0x%X", buf, 8u);
      }
      id v15 = v11;
      unsigned __int8 v13 = [v6 setMemoryDumpLevel:v12 error:&v15];
      id v14 = v15;

      if ((v13 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_8C9C();
      }
    }
    else
    {
      id v14 = v11;
    }
  }
}

- (BOOL)getMemoryDumps:(id)a3
{
  id v4 = a3;
  id v38 = 0;
  id v39 = 0;
  unsigned __int8 v5 = [v4 getMemoryDumps:&v39 error:&v38];
  id v6 = v39;
  id v7 = v38;
  if ((v5 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_8E28();
    }
    char v20 = 0;
    goto LABEL_23;
  }
  if (!v6)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "No memory dumps available", buf, 2u);
    }
    char v20 = 1;
LABEL_23:
    id v19 = v7;
    goto LABEL_31;
  }
  v30 = self;
  uint64_t v8 = objc_opt_new();
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v9 = +[AHTDevice allDevices];
  id v10 = [v9 countByEnumeratingWithState:&v33 objects:v42 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v34;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v34 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        id v15 = [v14 reporterResults];
        if (v15)
        {
          id v16 = [v14 name];
          [v8 setObject:v15 forKeyedSubscript:v16];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v33 objects:v42 count:16];
    }
    while (v11);
  }

  v40[0] = @"MemoryDumps";
  v40[1] = @"ReporterResults";
  v41[0] = v6;
  v41[1] = v8;
  uint64_t v17 = +[NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:2];
  id v32 = 0;
  id v18 = +[NSPropertyListSerialization dataWithPropertyList:v17 format:100 options:0 error:&v32];
  id v19 = v32;

  if (v18)
  {
    id v31 = v18;
    char v20 = OSAWriteLogForSubmission();
    if (v20)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Crash log generated", buf, 2u);
      }
      [(AHTCrashLogGenerator *)v30 clearMemoryDumps:v4];
    }
    else
    {
      BOOL v21 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v21) {
        sub_8DEC(v21, v22, v23, v24, v25, v26, v27, v28);
      }
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_8D7C();
    }
    char v20 = 0;
  }

LABEL_31:
  return v20;
}

- (BOOL)clearMemoryDumps:(id)a3
{
  id v6 = 0;
  unsigned __int8 v3 = [a3 clearMemoryDumps:&v6];
  id v4 = v6;
  if ((v3 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_8E98();
  }

  return v3;
}

- (void)dealloc
{
  [(AHTCrashLogGenerator *)self stop:0];
  v3.receiver = self;
  v3.super_class = (Class)AHTCrashLogGenerator;
  [(AHTCrashLogGenerator *)&v3 dealloc];
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSMutableArray)sources
{
  return self->_sources;
}

- (void)setSources:(id)a3
{
}

- (NSMutableArray)bootloaders
{
  return self->_bootloaders;
}

- (void)setBootloaders:(id)a3
{
}

- (AHTDeviceMatchingNotification)deviceAdded
{
  return self->_deviceAdded;
}

- (void)setDeviceAdded:(id)a3
{
}

- (AHTDeviceMatchingNotification)interfaceAdded
{
  return self->_interfaceAdded;
}

- (void)setInterfaceAdded:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interfaceAdded, 0);
  objc_storeStrong((id *)&self->_deviceAdded, 0);
  objc_storeStrong((id *)&self->_bootloaders, 0);
  objc_storeStrong((id *)&self->_sources, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end