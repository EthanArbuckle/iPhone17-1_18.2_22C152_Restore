@interface DIDiskArb
+ (DIDiskArb)diskArbWithError:(id *)a3;
- (BOOL)callbackReached;
- (BOOL)ejectWithBSDName:(id)a3 error:(id *)a4;
- (BOOL)unmountWithMountPoint:(id)a3 error:(id *)a4;
- (BOOL)waitForDAIdleWithError:(id *)a3;
- (DIDisappearedMountPointDelegate)delegate;
- (DIDiskArb)initWithError:(id *)a3;
- (NSArray)shadowMountedOnURLs;
- (NSError)operationError;
- (NSURL)inputMountedOnURL;
- (__DASession)daSession;
- (id)copyDescriptionWithBSDName:(id)a3;
- (void)addDisappearedCallbackWithMountPoint:(id)a3 shadowMountPoints:(id)a4 delegate:(id)a5;
- (void)onDiskDisappearedWithDisk:(__DADisk *)a3;
- (void)setCallbackReached:(BOOL)a3;
- (void)setDaSession:(__DASession *)a3;
- (void)setDelegate:(id)a3;
- (void)setInputMountedOnURL:(id)a3;
- (void)setOperationError:(id)a3;
- (void)setShadowMountedOnURLs:(id)a3;
- (void)stop;
@end

@implementation DIDiskArb

+ (DIDiskArb)diskArbWithError:(id *)a3
{
  v3 = [[DIDiskArb alloc] initWithError:0];
  if (!v3) {
    v3 = objc_alloc_init(DIDiskArbEmulation);
  }

  return (DIDiskArb *)v3;
}

- (DIDiskArb)initWithError:(id *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)DIDiskArb;
  v4 = [(DIDiskArb *)&v11 init];
  v5 = v4;
  if (!v4) {
    goto LABEL_5;
  }
  if (!&_DASessionCreate)
  {
    daSession = v4->_daSession;
    if (daSession) {
      goto LABEL_4;
    }
LABEL_7:
    v8 = +[DIError nilWithEnumValue:156 verboseInfo:@"Failed DA init" error:a3];
    goto LABEL_8;
  }
  daSession = DASessionCreate(0);
  v5->_daSession = daSession;
  if (!daSession) {
    goto LABEL_7;
  }
LABEL_4:
  Current = CFRunLoopGetCurrent();
  DASessionScheduleWithRunLoop(daSession, Current, kCFRunLoopDefaultMode);
LABEL_5:
  v8 = v5;
LABEL_8:
  v9 = v8;

  return v9;
}

- (void)stop
{
  context = self;
  objc_sync_enter(context);
  v2 = context;
  daSession = context->_daSession;
  if (daSession)
  {
    if (context->_inputMountedOnURL || context->_shadowMountedOnURLs)
    {
      DAUnregisterCallback(context->_daSession, sub_10002B894, context);
      daSession = context->_daSession;
    }
    Current = CFRunLoopGetCurrent();
    DASessionUnscheduleFromRunLoop(daSession, Current, kCFRunLoopDefaultMode);
    CFRelease(context->_daSession);
    v2 = context;
    context->_daSession = 0;
  }
  objc_sync_exit(v2);
}

- (void)onDiskDisappearedWithDisk:(__DADisk *)a3
{
  if ([(DIDiskArb *)self daSession])
  {
    CFDictionaryRef v5 = DADiskCopyDescription(a3);
    v6 = [(__CFDictionary *)v5 objectForKey:kDADiskDescriptionVolumePathKey];
    if (sub_1000D29B8())
    {
      int v7 = *__error();
      if (sub_1000D29A0())
      {
        uint64_t v45 = 0;
        v8 = sub_1000D2920();
        os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
        *(_DWORD *)buf = 68158210;
        int v48 = 39;
        __int16 v49 = 2080;
        v50 = "-[DIDiskArb onDiskDisappearedWithDisk:]";
        __int16 v51 = 2114;
        v52 = v6;
        LODWORD(v40) = 28;
        v39 = buf;
        v9 = (char *)_os_log_send_and_compose_impl();

        if (v9)
        {
          fprintf(__stderrp, "%s\n", v9);
          free(v9);
        }
      }
      else
      {
        v14 = sub_1000D2920();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 68158210;
          int v48 = 39;
          __int16 v49 = 2080;
          v50 = "-[DIDiskArb onDiskDisappearedWithDisk:]";
          __int16 v51 = 2114;
          v52 = v6;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "%.*s: Reached with diskURL=%{public}@", buf, 0x1Cu);
        }
      }
      *__error() = v7;
    }
    if (v6)
    {
      uint64_t v15 = [(DIDiskArb *)self inputMountedOnURL];
      if (v15)
      {
        v16 = (void *)v15;
        v17 = [(DIDiskArb *)self inputMountedOnURL];
        unsigned int v18 = [v6 isEqual:v17];

        if (v18)
        {
          int v19 = *__error();
          if (sub_1000D29A0())
          {
            uint64_t v45 = 0;
            v20 = sub_1000D2920();
            os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
            v21 = [v6 path:v39, v40];
            *(_DWORD *)buf = 68158211;
            int v48 = 39;
            __int16 v49 = 2080;
            v50 = "-[DIDiskArb onDiskDisappearedWithDisk:]";
            __int16 v51 = 2113;
            v52 = v21;
            LODWORD(v40) = 28;
            v39 = buf;
            v22 = (char *)_os_log_send_and_compose_impl();

            if (v22)
            {
              fprintf(__stderrp, "%s\n", v22);
              free(v22);
            }
          }
          else
          {
            v23 = sub_1000D2920();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              v24 = [v6 path];
              *(_DWORD *)buf = 68158211;
              int v48 = 39;
              __int16 v49 = 2080;
              v50 = "-[DIDiskArb onDiskDisappearedWithDisk:]";
              __int16 v51 = 2113;
              v52 = v24;
              _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%.*s: Mount point %{private}@ disappeared", buf, 0x1Cu);
            }
          }
          *__error() = v19;
          v25 = [(DIDiskArb *)self delegate];
          [v25 onDisappearedMountPoint];
        }
      }
      v26 = [(DIDiskArb *)self shadowMountedOnURLs];

      if (v26)
      {
        long long v43 = 0u;
        long long v44 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        v27 = [(DIDiskArb *)self shadowMountedOnURLs];
        id v28 = [v27 countByEnumeratingWithState:&v41 objects:v46 count:16];
        if (v28)
        {
          id v29 = v28;
          uint64_t v30 = *(void *)v42;
          while (2)
          {
            for (i = 0; i != v29; i = (char *)i + 1)
            {
              if (*(void *)v42 != v30) {
                objc_enumerationMutation(v27);
              }
              if ([v6 isEqual:*(void *)(*((void *)&v41 + 1) + 8 * i)])
              {
                int v32 = *__error();
                if (sub_1000D29A0())
                {
                  uint64_t v45 = 0;
                  v33 = sub_1000D2920();
                  os_log_type_enabled(v33, OS_LOG_TYPE_ERROR);
                  v34 = [v6 path];
                  *(_DWORD *)buf = 68158211;
                  int v48 = 39;
                  __int16 v49 = 2080;
                  v50 = "-[DIDiskArb onDiskDisappearedWithDisk:]";
                  __int16 v51 = 2113;
                  v52 = v34;
                  v35 = (char *)_os_log_send_and_compose_impl();

                  if (v35)
                  {
                    fprintf(__stderrp, "%s\n", v35);
                    free(v35);
                  }
                }
                else
                {
                  v36 = sub_1000D2920();
                  if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
                  {
                    v37 = [v6 path];
                    *(_DWORD *)buf = 68158211;
                    int v48 = 39;
                    __int16 v49 = 2080;
                    v50 = "-[DIDiskArb onDiskDisappearedWithDisk:]";
                    __int16 v51 = 2113;
                    v52 = v37;
                    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "%.*s: Mount point %{private}@ disappeared (shadow's mount point)", buf, 0x1Cu);
                  }
                }
                *__error() = v32;
                v38 = [(DIDiskArb *)self delegate];
                [v38 onDisappearedMountPoint];

                goto LABEL_44;
              }
            }
            id v29 = [v27 countByEnumeratingWithState:&v41 objects:v46 count:16];
            if (v29) {
              continue;
            }
            break;
          }
        }
LABEL_44:
      }
    }
  }
  else
  {
    int v10 = *__error();
    if (sub_1000D29A0())
    {
      uint64_t v45 = 0;
      objc_super v11 = sub_1000D2920();
      os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
      *(_DWORD *)buf = 68157954;
      int v48 = 39;
      __int16 v49 = 2080;
      v50 = "-[DIDiskArb onDiskDisappearedWithDisk:]";
      v12 = (char *)_os_log_send_and_compose_impl();

      if (v12)
      {
        fprintf(__stderrp, "%s\n", v12);
        free(v12);
      }
    }
    else
    {
      v13 = sub_1000D2920();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68157954;
        int v48 = 39;
        __int16 v49 = 2080;
        v50 = "-[DIDiskArb onDiskDisappearedWithDisk:]";
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%.*s: Ignoring, during shutdown", buf, 0x12u);
      }
    }
    *__error() = v10;
  }
}

- (BOOL)waitForDAIdleWithError:(id *)a3
{
  int v4 = *__error();
  if (sub_1000D29A0())
  {
    CFDictionaryRef v5 = sub_1000D2920();
    os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    *(_DWORD *)buf = 68157954;
    int v18 = 36;
    __int16 v19 = 2080;
    v20 = "-[DIDiskArb waitForDAIdleWithError:]";
    LODWORD(v16) = 18;
    uint64_t v15 = buf;
    v6 = (char *)_os_log_send_and_compose_impl();

    if (v6)
    {
      fprintf(__stderrp, "%s\n", v6);
      free(v6);
    }
  }
  else
  {
    int v7 = sub_1000D2920();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68157954;
      int v18 = 36;
      __int16 v19 = 2080;
      v20 = "-[DIDiskArb waitForDAIdleWithError:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%.*s: Waiting for disk arbitration idle", buf, 0x12u);
    }
  }
  *__error() = v4;
  [(DIDiskArb *)self setCallbackReached:0];
  [(DIDiskArb *)self daSession];
  DARegisterIdleCallback();
  v8 = +[NSRunLoop currentRunLoop];
  if (![(DIDiskArb *)self callbackReached])
  {
    do
    {
      v9 = +[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 1.0, v15, v16);
      [v8 runMode:NSDefaultRunLoopMode beforeDate:v9];
    }
    while (![(DIDiskArb *)self callbackReached]);
  }
  DAUnregisterCallback([(DIDiskArb *)self daSession], sub_10002C390, self);
  int v10 = *__error();
  if (sub_1000D29A0())
  {
    objc_super v11 = sub_1000D2920();
    os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    *(_DWORD *)buf = 68157954;
    int v18 = 36;
    __int16 v19 = 2080;
    v20 = "-[DIDiskArb waitForDAIdleWithError:]";
    v12 = (char *)_os_log_send_and_compose_impl();

    if (v12)
    {
      fprintf(__stderrp, "%s\n", v12);
      free(v12);
    }
  }
  else
  {
    v13 = sub_1000D2920();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68157954;
      int v18 = 36;
      __int16 v19 = 2080;
      v20 = "-[DIDiskArb waitForDAIdleWithError:]";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%.*s: Disk arbitration idle callback received", buf, 0x12u);
    }
  }
  *__error() = v10;

  return 1;
}

- (void)addDisappearedCallbackWithMountPoint:(id)a3 shadowMountPoints:(id)a4 delegate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    [(DIDiskArb *)self setInputMountedOnURL:v8];
    id v34 = v9;
    [(DIDiskArb *)self setShadowMountedOnURLs:v9];
    id v33 = v10;
    [(DIDiskArb *)self setDelegate:v10];
    int v11 = *__error();
    if (sub_1000D29A0())
    {
      uint64_t v41 = 0;
      v12 = sub_1000D2920();
      os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
      v13 = [v8 path];
      *(_DWORD *)buf = 68158211;
      int v44 = 77;
      __int16 v45 = 2080;
      v46 = "-[DIDiskArb addDisappearedCallbackWithMountPoint:shadowMountPoints:delegate:]";
      __int16 v47 = 2113;
      int v48 = v13;
      LODWORD(v31) = 28;
      id v29 = buf;
      v14 = (char *)_os_log_send_and_compose_impl();

      if (v14)
      {
        fprintf(__stderrp, "%s\n", v14);
        free(v14);
      }
    }
    else
    {
      uint64_t v15 = sub_1000D2920();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v16 = [v8 path];
        *(_DWORD *)buf = 68158211;
        int v44 = 77;
        __int16 v45 = 2080;
        v46 = "-[DIDiskArb addDisappearedCallbackWithMountPoint:shadowMountPoints:delegate:]";
        __int16 v47 = 2113;
        int v48 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%.*s: Registering DiskDisappearedCallback for %{private}@", buf, 0x1Cu);
      }
    }
    id v36 = v8;
    *__error() = v11;
  }
  else
  {
    if (![v9 count]) {
      goto LABEL_25;
    }
    id v36 = 0;
    [(DIDiskArb *)self setInputMountedOnURL:0];
    id v34 = v9;
    [(DIDiskArb *)self setShadowMountedOnURLs:v9];
    id v33 = v10;
    [(DIDiskArb *)self setDelegate:v10];
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  v35 = self;
  v17 = [(DIDiskArb *)self shadowMountedOnURLs];
  id v18 = [v17 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v38;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v38 != v20) {
          objc_enumerationMutation(v17);
        }
        v22 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        int v23 = *__error();
        if (sub_1000D29A0())
        {
          uint64_t v41 = 0;
          v24 = sub_1000D2920();
          os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
          v25 = [v22 path:v30, v32];
          *(_DWORD *)buf = 68158211;
          int v44 = 77;
          __int16 v45 = 2080;
          v46 = "-[DIDiskArb addDisappearedCallbackWithMountPoint:shadowMountPoints:delegate:]";
          __int16 v47 = 2113;
          int v48 = v25;
          LODWORD(v32) = 28;
          uint64_t v30 = buf;
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
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            id v28 = [v22 path];
            *(_DWORD *)buf = 68158211;
            int v44 = 77;
            __int16 v45 = 2080;
            v46 = "-[DIDiskArb addDisappearedCallbackWithMountPoint:shadowMountPoints:delegate:]";
            __int16 v47 = 2113;
            int v48 = v28;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%.*s: Registering DiskDisappearedCallback for %{private}@ (shadow's mount point)", buf, 0x1Cu);
          }
        }
        *__error() = v23;
      }
      id v19 = [v17 countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v19);
  }

  DARegisterDiskDisappearedCallback([(DIDiskArb *)v35 daSession], 0, (DADiskDisappearedCallback)sub_10002B894, v35);
  id v8 = v36;
  id v10 = v33;
  id v9 = v34;
LABEL_25:
}

- (BOOL)ejectWithBSDName:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int v7 = *__error();
  if (sub_1000D29A0())
  {
    id v8 = sub_1000D2920();
    os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    *(_DWORD *)buf = 68158210;
    int v26 = 36;
    __int16 v27 = 2080;
    id v28 = "-[DIDiskArb ejectWithBSDName:error:]";
    __int16 v29 = 2112;
    id v30 = v6;
    LODWORD(v24) = 28;
    int v23 = buf;
    id v9 = (char *)_os_log_send_and_compose_impl();

    if (v9)
    {
      fprintf(__stderrp, "%s\n", v9);
      free(v9);
    }
  }
  else
  {
    id v10 = sub_1000D2920();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68158210;
      int v26 = 36;
      __int16 v27 = 2080;
      id v28 = "-[DIDiskArb ejectWithBSDName:error:]";
      __int16 v29 = 2112;
      id v30 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%.*s: Ejecting %@", buf, 0x1Cu);
    }
  }
  *__error() = v7;
  int v11 = [(DIDiskArb *)self daSession];
  id v12 = v6;
  v13 = DADiskCreateFromBSDName(0, v11, (const char *)[v12 fileSystemRepresentation]);
  if (v13)
  {
    [(DIDiskArb *)self setCallbackReached:0];
    [(DIDiskArb *)self setOperationError:0];
    DADiskEject(v13, 0, (DADiskEjectCallback)sub_10002CCCC, self);
    v14 = +[NSRunLoop currentRunLoop];
    if (![(DIDiskArb *)self callbackReached])
    {
      do
      {
        uint64_t v15 = +[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 1.0, v23, v24);
        [v14 runMode:NSDefaultRunLoopMode beforeDate:v15];
      }
      while (![(DIDiskArb *)self callbackReached]);
    }
    uint64_t v16 = [(DIDiskArb *)self operationError];

    unsigned __int8 v17 = v16 == 0;
    if (v16)
    {
      if (a4)
      {
        *a4 = [(DIDiskArb *)self operationError];
      }
    }
    else
    {
      int v18 = *__error();
      if (sub_1000D29A0())
      {
        id v19 = sub_1000D2920();
        os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
        *(_DWORD *)buf = 68158210;
        int v26 = 36;
        __int16 v27 = 2080;
        id v28 = "-[DIDiskArb ejectWithBSDName:error:]";
        __int16 v29 = 2112;
        id v30 = v12;
        uint64_t v20 = (char *)_os_log_send_and_compose_impl();

        if (v20)
        {
          fprintf(__stderrp, "%s\n", v20);
          free(v20);
        }
      }
      else
      {
        v21 = sub_1000D2920();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 68158210;
          int v26 = 36;
          __int16 v27 = 2080;
          id v28 = "-[DIDiskArb ejectWithBSDName:error:]";
          __int16 v29 = 2112;
          id v30 = v12;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%.*s: %@ ejected successfully", buf, 0x1Cu);
        }
      }
      *__error() = v18;
    }
  }
  else
  {
    unsigned __int8 v17 = +[DIError failWithEnumValue:156 verboseInfo:@"Failed to create DADisk during eject" error:a4];
  }

  return v17;
}

- (BOOL)unmountWithMountPoint:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int v7 = *__error();
  if (sub_1000D29A0())
  {
    id v8 = sub_1000D2920();
    os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    *(_DWORD *)buf = 68158211;
    int v25 = 41;
    __int16 v26 = 2080;
    __int16 v27 = "-[DIDiskArb unmountWithMountPoint:error:]";
    __int16 v28 = 2113;
    id v29 = v6;
    LODWORD(v23) = 28;
    v22 = buf;
    id v9 = (char *)_os_log_send_and_compose_impl();

    if (v9)
    {
      fprintf(__stderrp, "%s\n", v9);
      free(v9);
    }
  }
  else
  {
    id v10 = sub_1000D2920();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68158211;
      int v25 = 41;
      __int16 v26 = 2080;
      __int16 v27 = "-[DIDiskArb unmountWithMountPoint:error:]";
      __int16 v28 = 2113;
      id v29 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%.*s: Unmounting %{private}@", buf, 0x1Cu);
    }
  }
  *__error() = v7;
  CFURLRef v11 = +[NSURL fileURLWithPath:v6];
  id v12 = DADiskCreateFromVolumePath(0, [(DIDiskArb *)self daSession], v11);
  if (v12)
  {
    [(DIDiskArb *)self setCallbackReached:0];
    [(DIDiskArb *)self setOperationError:0];
    DADiskUnmount(v12, 0, (DADiskUnmountCallback)sub_10002CCCC, self);
    v13 = +[NSRunLoop currentRunLoop];
    if (![(DIDiskArb *)self callbackReached])
    {
      do
      {
        v14 = +[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 1.0, v22, v23);
        [v13 runMode:NSDefaultRunLoopMode beforeDate:v14];
      }
      while (![(DIDiskArb *)self callbackReached]);
    }
    uint64_t v15 = [(DIDiskArb *)self operationError];

    unsigned __int8 v16 = v15 == 0;
    if (v15)
    {
      if (a4)
      {
        *a4 = [(DIDiskArb *)self operationError];
      }
    }
    else
    {
      int v17 = *__error();
      if (sub_1000D29A0())
      {
        int v18 = sub_1000D2920();
        os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
        *(_DWORD *)buf = 68158211;
        int v25 = 41;
        __int16 v26 = 2080;
        __int16 v27 = "-[DIDiskArb unmountWithMountPoint:error:]";
        __int16 v28 = 2113;
        id v29 = v6;
        id v19 = (char *)_os_log_send_and_compose_impl();

        if (v19)
        {
          fprintf(__stderrp, "%s\n", v19);
          free(v19);
        }
      }
      else
      {
        uint64_t v20 = sub_1000D2920();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 68158211;
          int v25 = 41;
          __int16 v26 = 2080;
          __int16 v27 = "-[DIDiskArb unmountWithMountPoint:error:]";
          __int16 v28 = 2113;
          id v29 = v6;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%.*s: %{private}@ unmounted successfully", buf, 0x1Cu);
        }
      }
      *__error() = v17;
    }
  }
  else
  {
    unsigned __int8 v16 = +[DIError failWithEnumValue:156 verboseInfo:@"Failed to create DADisk during unmount" error:a4];
  }

  return v16;
}

- (id)copyDescriptionWithBSDName:(id)a3
{
  id v4 = a3;
  CFDictionaryRef v5 = [(DIDiskArb *)self daSession];
  id v6 = v4;
  int v7 = (const char *)[v6 fileSystemRepresentation];

  id v8 = DADiskCreateFromBSDName(0, v5, v7);
  id v9 = v8;
  if (v8) {
    CFDictionaryRef v10 = DADiskCopyDescription(v8);
  }
  else {
    CFDictionaryRef v10 = 0;
  }

  return v10;
}

- (DIDisappearedMountPointDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (DIDisappearedMountPointDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (__DASession)daSession
{
  return self->_daSession;
}

- (void)setDaSession:(__DASession *)a3
{
  self->_daSession = a3;
}

- (NSURL)inputMountedOnURL
{
  return self->_inputMountedOnURL;
}

- (void)setInputMountedOnURL:(id)a3
{
}

- (NSArray)shadowMountedOnURLs
{
  return self->_shadowMountedOnURLs;
}

- (void)setShadowMountedOnURLs:(id)a3
{
}

- (BOOL)callbackReached
{
  return self->_callbackReached;
}

- (void)setCallbackReached:(BOOL)a3
{
  self->_callbackReached = a3;
}

- (NSError)operationError
{
  return self->_operationError;
}

- (void)setOperationError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationError, 0);
  objc_storeStrong((id *)&self->_shadowMountedOnURLs, 0);
  objc_storeStrong((id *)&self->_inputMountedOnURL, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end