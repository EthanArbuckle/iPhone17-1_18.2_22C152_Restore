@interface DIDeviceHandle
+ (BOOL)supportsSecureCoding;
- (BOOL)addToRefCountWithError:(id *)a3;
- (BOOL)handleRefCount;
- (BOOL)updateBSDNameWithBlockDevice:(id)a3 error:(id *)a4;
- (BOOL)waitForDeviceWithError:(id *)a3;
- (BOOL)waitForQuietWithService:(unsigned int)a3 error:(id *)a4;
- (DIClient2IODaemonXPCHandler)client2IOhandler;
- (DIDeviceHandle)initWithCoder:(id)a3;
- (DIDeviceHandle)initWithRegEntryID:(unint64_t)a3;
- (DIDeviceHandle)initWithRegEntryID:(unint64_t)a3 xpcEndpoint:(id)a4;
- (NSString)BSDName;
- (NSXPCListenerEndpoint)xpcEndpoint;
- (id)description;
- (unint64_t)regEntryID;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setBSDName:(id)a3;
- (void)setClient2IOhandler:(id)a3;
- (void)setHandleRefCount:(BOOL)a3;
- (void)setXpcEndpoint:(id)a3;
@end

@implementation DIDeviceHandle

- (DIDeviceHandle)initWithRegEntryID:(unint64_t)a3 xpcEndpoint:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)DIDeviceHandle;
  v8 = [(DIDeviceHandle *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_regEntryID = a3;
    objc_storeStrong((id *)&v8->_xpcEndpoint, a4);
  }

  return v9;
}

- (DIDeviceHandle)initWithRegEntryID:(unint64_t)a3
{
  return [(DIDeviceHandle *)self initWithRegEntryID:a3 xpcEndpoint:0];
}

- (void)dealloc
{
  v3 = [(DIDeviceHandle *)self client2IOhandler];

  if (v3)
  {
    int v4 = *__error();
    if (sub_1000D29A0())
    {
      uint64_t v12 = 0;
      v5 = sub_1000D2920();
      os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
      *(_DWORD *)buf = 68157954;
      int v14 = 25;
      __int16 v15 = 2080;
      v16 = "-[DIDeviceHandle dealloc]";
      int v10 = 18;
      v9 = buf;
      v6 = (char *)_os_log_send_and_compose_impl();

      if (v6)
      {
        fprintf(__stderrp, "%s\n", v6);
        free(v6);
      }
    }
    else
    {
      id v7 = sub_1000D2920();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68157954;
        int v14 = 25;
        __int16 v15 = 2080;
        v16 = "-[DIDeviceHandle dealloc]";
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%.*s: DIDeviceHandle object is deallocating, invalidating connection", buf, 0x12u);
      }
    }
    *__error() = v4;
    v8 = [(DIDeviceHandle *)self client2IOhandler];
    [v8 closeConnection];
  }
  v11.receiver = self;
  v11.super_class = (Class)DIDeviceHandle;
  [(DIDeviceHandle *)&v11 dealloc];
}

- (BOOL)updateBSDNameWithBlockDevice:(id)a3 error:(id *)a4
{
  id v6 = [a3 copyIOMediaWithError:a4];
  id v7 = v6;
  if (v6)
  {
    v8 = [v6 BSDName];
    [(DIDeviceHandle *)self setBSDName:v8];

    v9 = [(DIDeviceHandle *)self BSDName];

    if (v9)
    {
      int v10 = *__error();
      if (sub_1000D29A0())
      {
        objc_super v11 = sub_1000D2920();
        os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
        [(DIDeviceHandle *)self BSDName];
        *(_DWORD *)buf = 68158210;
        int v18 = 53;
        __int16 v19 = 2080;
        v20 = "-[DIDeviceHandle updateBSDNameWithBlockDevice:error:]";
        __int16 v21 = 2114;
        id v22 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v12 = (char *)_os_log_send_and_compose_impl();

        if (v12)
        {
          fprintf(__stderrp, "%s\n", v12);
          free(v12);
        }
      }
      else
      {
        int v14 = sub_1000D2920();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v15 = [(DIDeviceHandle *)self BSDName];
          *(_DWORD *)buf = 68158210;
          int v18 = 53;
          __int16 v19 = 2080;
          v20 = "-[DIDeviceHandle updateBSDNameWithBlockDevice:error:]";
          __int16 v21 = 2114;
          id v22 = v15;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%.*s: BSD name: %{public}@", buf, 0x1Cu);
        }
      }
      *__error() = v10;
      BOOL v13 = 1;
    }
    else
    {
      BOOL v13 = +[DIError failWithEnumValue:153 verboseInfo:@"Cannot find BSD name in IO media service" error:a4];
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (BOOL)waitForQuietWithService:(unsigned int)a3 error:(id *)a4
{
  mach_timespec_t waitTime = (mach_timespec_t)30;
  while (1)
  {
    uint64_t v5 = IOServiceWaitQuiet(a3, &waitTime);
    if (v5 != -536870186) {
      break;
    }
    int v6 = *__error();
    if (sub_1000D29A0())
    {
      id v7 = sub_1000D2920();
      os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
      *(_DWORD *)buf = 68157954;
      int v20 = 48;
      __int16 v21 = 2080;
      id v22 = "-[DIDeviceHandle waitForQuietWithService:error:]";
      v8 = (char *)_os_log_send_and_compose_impl();

      if (v8)
      {
        fprintf(__stderrp, "%s\n", v8);
        free(v8);
      }
    }
    else
    {
      v9 = sub_1000D2920();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 68157954;
        int v20 = 48;
        __int16 v21 = 2080;
        id v22 = "-[DIDeviceHandle waitForQuietWithService:error:]";
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%.*s: IOServiceWaitQuiet timeout occurred, retrying.", buf, 0x12u);
      }
    }
    *__error() = v6;
  }
  if (v5)
  {
    BOOL v13 = +[NSString stringWithFormat:@"IOServiceWaitQuiet error 0x%x", v5];
    BOOL v14 = +[DIError failWithEnumValue:154 verboseInfo:v13 error:a4];
  }
  else
  {
    int v10 = *__error();
    if (sub_1000D29A0())
    {
      objc_super v11 = sub_1000D2920();
      os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
      *(_DWORD *)buf = 68157954;
      int v20 = 48;
      __int16 v21 = 2080;
      id v22 = "-[DIDeviceHandle waitForQuietWithService:error:]";
      uint64_t v12 = (char *)_os_log_send_and_compose_impl();

      if (v12)
      {
        fprintf(__stderrp, "%s\n", v12);
        free(v12);
      }
    }
    else
    {
      __int16 v15 = sub_1000D2920();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68157954;
        int v20 = 48;
        __int16 v21 = 2080;
        id v22 = "-[DIDeviceHandle waitForQuietWithService:error:]";
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%.*s: IOServiceWaitQuiet done", buf, 0x12u);
      }
    }
    *__error() = v10;
    return 1;
  }
  return v14;
}

- (BOOL)waitForDeviceWithError:(id *)a3
{
  BOOL v21 = 0;
  io_iterator_t notification = 0;
  id v5 = +[DIBlockDevice copyUnmatchedDiskImageWithRegEntryID:[(DIDeviceHandle *)self regEntryID] error:a3];
  int v6 = v5;
  if (v5)
  {
    refCon[0] = &v21;
    refCon[1] = [v5 ioObj];
    id v7 = +[NSRunLoop currentRunLoop];
    v8 = (__CFRunLoop *)[v7 getCFRunLoop];
    if (!-[DIDeviceHandle waitForQuietWithService:error:](self, "waitForQuietWithService:error:", [v6 ioObj], a3))goto LABEL_15; {
    v9 = IONotificationPortCreate(kIOMainPortDefault);
    }
    if (v9)
    {
      int v10 = v9;
      RunLoopSource = IONotificationPortGetRunLoopSource(v9);
      if (RunLoopSource)
      {
        uint64_t v12 = RunLoopSource;
        CFStringRef v13 = kCFRunLoopDefaultMode;
        CFRunLoopAddSource(v8, RunLoopSource, kCFRunLoopDefaultMode);
        CFDictionaryRef v14 = IOServiceMatching("IOMedia");
        if (!IOServiceAddMatchingNotification(v10, "IOServiceMatched", v14, (IOServiceMatchingCallback)sub_100007518, refCon, &notification))
        {
          CFRunLoopMode v18 = kCFRunLoopDefaultMode;
          sub_100007518((uint64_t)refCon, notification);
          while (!v21)
          {
            __int16 v15 = +[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 1.0, v18);
            [v7 runMode:NSDefaultRunLoopMode beforeDate:v15];
          }
          IOObjectRelease(notification);
          CFStringRef v13 = v18;
        }
        CFRunLoopRemoveSource(v8, v12, v13);
      }
      else
      {
        +[DIError failWithEnumValue:153 verboseInfo:@"Failed getting runloop source" error:0];
      }
      IONotificationPortDestroy(v10);
    }
    if (v21)
    {
      BOOL v16 = [(DIDeviceHandle *)self updateBSDNameWithBlockDevice:v6 error:a3];
      BOOL v21 = v16;
    }
    else
    {
LABEL_15:
      BOOL v16 = 0;
    }
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DIDeviceHandle)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)DIDeviceHandle;
  id v5 = [(DIDeviceHandle *)&v12 init];
  if (v5)
  {
    v5->_regEntryID = (unint64_t)[v4 decodeInt64ForKey:@"regEntryID"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"xpcEndpoint"];
    xpcEndpoint = v5->_xpcEndpoint;
    v5->_xpcEndpoint = (NSXPCListenerEndpoint *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"BSDname"];
    BSDName = v5->_BSDName;
    v5->_BSDName = (NSString *)v8;

    unsigned int v10 = [v4 decodeBoolForKey:@"handleRefCount"];
    v5->_handleRefCount = v10;
    if (v10)
    {
      if (v5->_xpcEndpoint) {
        [(DIDeviceHandle *)v5 addToRefCountWithError:0];
      }
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  [v6 encodeInt64:-[DIDeviceHandle regEntryID](self, "regEntryID") forKey:@"regEntryID"];
  id v4 = [(DIDeviceHandle *)self xpcEndpoint];
  [v6 encodeObject:v4 forKey:@"xpcEndpoint"];

  id v5 = [(DIDeviceHandle *)self BSDName];
  [v6 encodeObject:v5 forKey:@"BSDname"];

  [v6 encodeBool:-[DIDeviceHandle handleRefCount](self, "handleRefCount") forKey:@"handleRefCount"];
}

- (BOOL)addToRefCountWithError:(id *)a3
{
  [(DIDeviceHandle *)self setHandleRefCount:1];
  id v5 = [DIClient2IODaemonXPCHandler alloc];
  id v6 = [(DIDeviceHandle *)self xpcEndpoint];
  id v7 = [(DIClient2IODaemonXPCHandler *)v5 initWithEndpoint:v6];
  [(DIDeviceHandle *)self setClient2IOhandler:v7];

  uint64_t v8 = [(DIDeviceHandle *)self client2IOhandler];
  LODWORD(v6) = [v8 connectWithError:a3];

  if (!v6) {
    return 0;
  }
  v9 = [(DIDeviceHandle *)self client2IOhandler];
  unsigned __int8 v10 = [v9 addToRefCountWithError:a3];

  return v10;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = [(DIDeviceHandle *)self BSDName];
  id v6 = [(DIDeviceHandle *)self xpcEndpoint];
  CFStringRef v7 = @"managed";
  if (!v6) {
    CFStringRef v7 = @"unmanaged";
  }
  uint64_t v8 = +[NSString stringWithFormat:@"%@[%@, %@]", v4, v5, v7];

  return v8;
}

- (NSString)BSDName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBSDName:(id)a3
{
}

- (DIClient2IODaemonXPCHandler)client2IOhandler
{
  return self->_client2IOhandler;
}

- (void)setClient2IOhandler:(id)a3
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

- (unint64_t)regEntryID
{
  return self->_regEntryID;
}

- (NSXPCListenerEndpoint)xpcEndpoint
{
  return self->_xpcEndpoint;
}

- (void)setXpcEndpoint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcEndpoint, 0);
  objc_storeStrong((id *)&self->_client2IOhandler, 0);

  objc_storeStrong((id *)&self->_BSDName, 0);
}

@end