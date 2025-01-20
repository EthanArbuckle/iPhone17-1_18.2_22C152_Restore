@interface DYEmbeddedDaemon
- (BOOL)bringAppToForeground:(id)a3;
- (BOOL)createInferiorTransportAndSetEnvironment:(id)a3 uniqueIdentifier:(id)a4 error:(id *)a5;
- (BOOL)launchInferior:(id)a3 finalEnvironment:(id *)a4 error:(id *)a5;
- (BOOL)launchUIServer:(id)a3 error:(id *)a4;
- (DYEmbeddedDaemon)initWithTransport:(id)a3 terminationHandler:(id)a4;
- (id)captureAPISupportForAPI:(unsigned int)a3;
- (id)getApplications;
- (id)processApplication:(id)a3;
- (int)launchInferiorWithIdentifer:(id)a3 environment:(id)a4 arguments:(id)a5 error:(id *)a6;
- (int)launchInferiorWithPath:(id)a3 arguments:(id)a4 environment:(id)a5 workingDirectory:(id)a6 error:(id *)a7;
- (void)cacheInferiorAppIdentifier;
- (void)handleMessage:(id)a3;
- (void)terminate:(int)a3;
@end

@implementation DYEmbeddedDaemon

- (DYEmbeddedDaemon)initWithTransport:(id)a3 terminationHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)DYEmbeddedDaemon;
  v8 = [(DYEmbeddedDaemon *)&v19 init];
  v9 = v8;
  if (v8)
  {
    [(DYEmbeddedDaemon *)v8 setTransport:v6];
    id v10 = objc_retainBlock(v7);
    id terminationHandler = v9->_terminationHandler;
    v9->_id terminationHandler = v10;

    v12 = [(DYEmbeddedDaemon *)v9 transport];
    if (!v12) {
      __assert_rtn("-[DYEmbeddedDaemon initWithTransport:terminationHandler:]", ", 0, "self.transport"");
    }

    v13 = [(DYEmbeddedDaemon *)v9 transport];
    [v13 setPrioritizeOutgoingMessages:1];

    v14 = dispatch_get_global_queue(-2, 0);
    dispatch_queue_t v15 = dispatch_queue_create_with_target_V2("symbolicator", 0, v14);
    symbolicatorQueue = v9->_symbolicatorQueue;
    v9->_symbolicatorQueue = (OS_dispatch_queue *)v15;

    v17 = v9;
  }

  return v9;
}

- (id)captureAPISupportForAPI:(unsigned int)a3
{
  if (!a3)
  {
    v3 = &off_10000C488;
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    v3 = &off_10000C4A8;
LABEL_5:
    id v4 = [objc_alloc(*v3) initWithAPI:*(void *)&a3];
    goto LABEL_7;
  }
  id v4 = 0;
LABEL_7:

  return v4;
}

- (BOOL)createInferiorTransportAndSetEnvironment:(id)a3 uniqueIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [v8 objectForKey:@"METAL_LOAD_INTERPOSER"];
  if ([v10 BOOLValue])
  {
    uint64_t v11 = 1;
  }
  else
  {
    v12 = [v8 objectForKey:@"METAL_DIAGNOSTICS_ENABLED"];
    uint64_t v11 = (uint64_t)[v12 BOOLValue];
  }
  v13 = [(DYEmbeddedDaemon *)self captureAPISupportForAPI:1];
  v14 = [v13 interposeDylibPath];
  [v8 setObject:v14 forKeyedSubscript:@"DYMTL_TOOLS_DYLIB_PATH"];

  unsigned __int8 v15 = [(DYEmbeddedDaemon *)self createInferiorTransportAndSetEnvironment:v8 withAPI:v11 uniqueIdentifier:v9 error:a5];
  return v15;
}

- (void)cacheInferiorAppIdentifier
{
  v3 = +[RBSProcessIdentifier identifierWithPid:[(DYEmbeddedDaemon *)self inferiorPid]];
  id v7 = +[RBSProcessHandle handleForIdentifier:v3 error:0];

  if (v7)
  {
    id v4 = [v7 bundle];
    v5 = [v4 identifier];
    guestAppIdentifier = self->_guestAppIdentifier;
    self->_guestAppIdentifier = v5;
  }
  else
  {
    [(DYEmbeddedDaemon *)self inferiorPid];
    DYLog();
  }
}

- (BOOL)bringAppToForeground:(id)a3
{
  id v3 = a3;
  if (sub_10000280C((uint64_t)v3) == -1)
  {
    unsigned __int8 v7 = 0;
  }
  else
  {
    id v4 = +[DYFuture future];
    v5 = +[FBSOpenApplicationService serviceWithDefaultShellEndpoint];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000028A8;
    v9[3] = &unk_10000C670;
    id v6 = v4;
    id v10 = v6;
    [v5 openApplication:v3 withOptions:0 completion:v9];
    unsigned __int8 v7 = [v6 BOOLResult];
  }
  return v7;
}

- (int)launchInferiorWithPath:(id)a3 arguments:(id)a4 environment:(id)a5 workingDirectory:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (([(DYEmbeddedDaemon *)self isAppleInternal] & 1) == 0)
  {
    [(DYEmbeddedDaemon *)self terminate:1];
    int v31 = 0;
    goto LABEL_27;
  }
  if ([v15 length])
  {
    char v47 = 0;
    v16 = +[NSFileManager defaultManager];
    unsigned __int8 v17 = [v16 fileExistsAtPath:v15 isDirectory:&v47];

    unsigned __int8 v18 = v47 ? v17 : 0;
    if ((v18 & 1) == 0)
    {
      NSErrorUserInfoKey v50 = NSLocalizedDescriptionKey;
      v34 = +[NSString stringWithFormat:@"Working directory doesn't exist. %@", v15];
      v51 = v34;
      v35 = +[NSDictionary dictionaryWithObjects:&v51 forKeys:&v50 count:1];
      *a7 = +[DYError errorWithDomain:DYErrorDomain code:1 userInfo:v35];

      goto LABEL_18;
    }
  }
  objc_super v19 = +[NSFileManager defaultManager];
  unsigned __int8 v20 = [v19 fileExistsAtPath:v12];

  if ((v20 & 1) == 0)
  {
    NSErrorUserInfoKey v48 = NSLocalizedDescriptionKey;
    v32 = +[NSString stringWithFormat:@"Binary Launch Path doesn't exist. %@", v12];
    v49 = v32;
    v33 = +[NSDictionary dictionaryWithObjects:&v49 forKeys:&v48 count:1];
    *a7 = +[DYError errorWithDomain:DYErrorDomain code:1 userInfo:v33];

LABEL_18:
    int v31 = -1;
    goto LABEL_27;
  }
  v21 = (DYTransport *)[objc_alloc((Class)DYUNIXDomainSocketTransport) initWithMode:1];
  helperTransport = self->_helperTransport;
  self->_helperTransport = v21;

  v23 = +[NSURL fileURLWithPath:@"/var/run/gputoolsdhelper.sock" isDirectory:0];
  [(DYTransport *)self->_helperTransport setUrl:v23];

  id v24 = [(DYTransport *)self->_helperTransport newSourceWithQueue:&_dispatch_main_q];
  v25 = v24;
  if (v24)
  {
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472;
    v46[2] = sub_1000030B4;
    v46[3] = &unk_10000C698;
    v46[4] = self;
    [v24 setCancellationHandler:v46];
    [v25 resume];
    v43 = [(DYTransport *)self->_helperTransport connect];
    [v43 timeoutAfter:0 label:500.0];
    if ([v43 BOOLResult])
    {
      v41 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v12, kDYGuestAppLaunchPathKey, v14, kDYGuestAppLaunchEnvironmentKey, v13, kDYGuestAppLaunchArgumentsKey, v15, kDYGuestAppLaunchCurrentDirectoryKey, 0);
      v42 = +[DYTransportMessage messageWithKind:plistPayload:](DYTransportMessage, "messageWithKind:plistPayload:", 1291);
      if (v42)
      {
        uint64_t v26 = +[DYFuture future];
        v27 = self->_helperTransport;
        v28 = dispatch_get_global_queue(0, 0);
        v44[0] = _NSConcreteStackBlock;
        v44[1] = 3221225472;
        v44[2] = sub_100003198;
        v44[3] = &unk_10000C6C0;
        id v40 = (id)v26;
        id v45 = v40;
        LOBYTE(v26) = [(DYTransport *)v27 send:v42 error:a7 replyQueue:v28 timeout:0 handler:v44];

        v29 = v43;
        if (v26)
        {
          v30 = [v40 result];
          if (a7)
          {
            *a7 = [v40 error];
          }
          int v31 = [v30 intValue];
        }
        else
        {
          DYLog();
          [(DYEmbeddedDaemon *)self terminate:1];
          int v31 = 0;
        }
      }
      else
      {
        DYLog();
        [(DYEmbeddedDaemon *)self terminate:1];
        int v31 = 0;
        v29 = v43;
      }
    }
    else
    {
      DYLog();
      [(DYEmbeddedDaemon *)self terminate:1];
      int v31 = 0;
      v29 = v43;
    }
  }
  else
  {
    v36 = [(DYTransport *)self->_helperTransport error];
    id v37 = [v36 description];
    id v39 = [v37 UTF8String];
    DYLog();

    -[DYEmbeddedDaemon terminate:](self, "terminate:", 1, v39);
    int v31 = 0;
  }

LABEL_27:
  return v31;
}

- (int)launchInferiorWithIdentifer:(id)a3 environment:(id)a4 arguments:(id)a5 error:(id *)a6
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = g_signpostLog;
  if (os_signpost_enabled(g_signpostLog))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Agent-LaunchInferior", (const char *)&unk_10000BB0E, buf, 2u);
  }
  *(void *)buf = 0;
  v35 = buf;
  uint64_t v36 = 0x2020000000;
  int v37 = 0;
  while (1)
  {
    pid_t v12 = sub_10000280C((uint64_t)v8);
    *((_DWORD *)v35 + 6) = v12;
    if (v12 == -1) {
      break;
    }
    kill(v12, 9);
    usleep(0x7A120u);
  }
  v38[0] = FBSDebugOptionKeyWaitForDebugger;
  v38[1] = FBSDebugOptionKeyEnvironment;
  v39[0] = &__kCFBooleanTrue;
  v39[1] = v9;
  v38[2] = FBSDebugOptionKeyArguments;
  v39[2] = v10;
  v40[0] = FBSOpenApplicationOptionKeyDebuggingOptions;
  id v13 = +[NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:3];
  v40[1] = FBSOpenApplicationOptionKeyUnlockDevice;
  v41[0] = v13;
  v41[1] = &__kCFBooleanTrue;
  id v14 = +[NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:2];

  dispatch_semaphore_t v15 = dispatch_semaphore_create(0);
  v16 = +[FBSOpenApplicationService serviceWithDefaultShellEndpoint];
  unsigned __int8 v17 = +[FBSOpenApplicationOptions optionsWithDictionary:v14];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_100003734;
  v31[3] = &unk_10000C6E8;
  v33 = buf;
  unsigned __int8 v18 = v15;
  v32 = v18;
  [v16 openApplication:v8 withOptions:v17 completion:v31];

  dispatch_time_t v19 = dispatch_time(0, 30000000000);
  dispatch_semaphore_wait(v18, v19);
  if (*((_DWORD *)v35 + 6) == -1)
  {
    id v23 = [v8 description];
    id v27 = [v23 UTF8String];
    DYLog();

    if (a6)
    {
      id v24 = +[NSDictionary dictionaryWithObject:@"Timed-out waiting for the application to launch.", NSLocalizedDescriptionKey, v27 forKey];
      *a6 = +[DYError errorWithDomain:DYErrorDomain code:5 userInfo:v24];
    }
    goto LABEL_14;
  }
  if ((sub_10000381C(v8) & 1) == 0)
  {
    mach_port_name_t v30 = 0;
    mach_error_t v20 = task_for_pid(mach_task_self_, *((_DWORD *)v35 + 6), &v30);
    if (v20)
    {
      uint64_t v26 = *((unsigned int *)v35 + 6);
      v28 = mach_error_string(v20);
      DYLog();
      kill(*((_DWORD *)v35 + 6), 9);
      if (a6)
      {
        v21 = +[NSDictionary dictionaryWithObject:@"Failed to get the application's task port.", NSLocalizedDescriptionKey, v26, v28 forKey];
        *a6 = +[DYError errorWithDomain:DYErrorDomain code:29 userInfo:v21];
      }
LABEL_14:
      int v22 = 0;
      goto LABEL_15;
    }
  }
  int v22 = *((_DWORD *)v35 + 6);
LABEL_15:

  _Block_object_dispose(buf, 8);
  sub_100003884();

  return v22;
}

- (BOOL)launchUIServer:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if (([(DYEmbeddedDaemon *)self isAppleInternal] & 1) == 0) {
    [(DYEmbeddedDaemon *)self terminate:1];
  }
  id v8 = +[NSMutableDictionary dictionary];
  id v9 = [v7 objectForKey:kDYGuestAppLaunchEnvironmentKey];
  if (v9) {
    [v8 addEntriesFromDictionary:v9];
  }
  id v10 = [v7 objectForKey:kDYGuestAppLaunchReplayer];
  if (v10)
  {
    id v4 = [v7 objectForKeyedSubscript:kDYGuestAppLaunchCapture];
    uint64_t v11 = (uint64_t)[v4 BOOLValue];
  }
  else
  {
    uint64_t v11 = 1;
  }
  [(DYEmbeddedDaemon *)self setShouldLoadCapture:v11];
  if (v10) {

  }
  pid_t v12 = [v7 objectForKeyedSubscript:kDYGuestAppLaunchDiagnostics];
  -[DYEmbeddedDaemon setShouldLoadDiagnostics:](self, "setShouldLoadDiagnostics:", [v12 BOOLValue]);

  BOOL v13 = [(DYEmbeddedDaemon *)self createInferiorTransportAndSetEnvironment:v8 uniqueIdentifier:0 error:a4];
  if (v13)
  {
    id v14 = (DYTransport *)[objc_alloc((Class)DYUNIXDomainSocketTransport) initWithMode:1];
    helperTransport = self->_helperTransport;
    self->_helperTransport = v14;

    v16 = +[NSURL fileURLWithPath:@"/var/run/gputoolsdhelper.sock" isDirectory:0];
    [(DYTransport *)self->_helperTransport setUrl:v16];

    id v17 = [(DYTransport *)self->_helperTransport newSourceWithQueue:&_dispatch_main_q];
    if (!v17)
    {
      unsigned __int8 v18 = [(DYTransport *)self->_helperTransport error];
      id v19 = [v18 description];
      id v23 = [v19 UTF8String];
      DYLog();

      -[DYEmbeddedDaemon terminate:](self, "terminate:", 1, v23);
    }
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_100003D00;
    v29[3] = &unk_10000C698;
    v29[4] = self;
    [v17 setCancellationHandler:v29];
    [v17 resume];
    mach_error_t v20 = [(DYTransport *)self->_helperTransport connect];
    [v20 timeoutAfter:0 label:500.0];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100003E9C;
    v24[3] = &unk_10000C710;
    id v21 = v20;
    id v25 = v21;
    uint64_t v26 = self;
    id v27 = v8;
    id v28 = v7;
    [v21 notifyOnQueue:&_dispatch_main_q handler:v24];
  }
  return v13;
}

- (BOOL)launchInferior:(id)a3 finalEnvironment:(id *)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = [v8 objectForKey:kDYGuestAppLaunchBundleIdentifierKey];
  v44 = [v8 objectForKey:kDYGuestAppLaunchPathKey];
  id v10 = [v8 objectForKey:kDYGuestAppLaunchEnvironmentKey];
  id v11 = [v10 mutableCopy];

  pid_t v12 = [v8 objectForKey:kDYGuestAppLaunchArgumentsKey];
  id v42 = [v12 mutableCopy];

  BOOL v13 = [v8 objectForKey:kDYGuestAppLaunchCurrentDirectoryKey];
  id v41 = [v13 mutableCopy];

  unsigned int v14 = [(__CFString *)v9 isEqualToString:@"com.apple.gputools.ui-server"];
  if ([(__CFString *)v9 isEqualToString:@"com.apple.gputools.BinaryLaunch"])
  {
    BOOL v13 = [v11 objectForKey:@"BINARY_LAUNCH_PATH"];

    id v9 = 0;
    v44 = v13;
  }
  v43 = [v8 objectForKey:kDYGuestAppLaunchReplayer];
  if (v43)
  {
    BOOL v13 = [v8 objectForKeyedSubscript:kDYGuestAppLaunchCapture];
    uint64_t v15 = (uint64_t)[v13 BOOLValue];
  }
  else
  {
    uint64_t v15 = 1;
  }
  [(DYEmbeddedDaemon *)self setShouldLoadCapture:v15];
  if (v43) {

  }
  v16 = [v8 objectForKeyedSubscript:kDYGuestAppLaunchDiagnostics];
  -[DYEmbeddedDaemon setShouldLoadDiagnostics:](self, "setShouldLoadDiagnostics:", [v16 BOOLValue]);

  if (v14)
  {
    id v17 = [v11 objectForKey:@"GT_HOST_URL_MTL"];
    if (v17)
    {
      id v38 = v11;
      id v40 = [v11 objectForKey:@"GT_HOST_URL_MTL_DIAGNOSTICS"];
      unsigned __int8 v18 = +[NSURL URLWithString:v17];
      id v19 = +[NSURL URLWithString:v40];
      mach_error_t v20 = [(DYEmbeddedDaemon *)self transport];
      id v21 = v18;
      id v22 = v19;
      id v23 = [(DYEmbeddedDaemon *)self shouldLoadCapture];
      id v24 = [(DYEmbeddedDaemon *)self shouldLoadDiagnostics];
      if (v20)
      {
        self = (DYEmbeddedDaemon *)[v20 createNewSharedMemoryTransportWithURLs:v21 uniqueIdentifier:v22 loadCapture:0 loadDiagnostics:v23];
      }
      else
      {
      }
      BOOL v34 = 1;
      id v11 = v38;
      goto LABEL_45;
    }
LABEL_29:

    BOOL v34 = 0;
LABEL_45:

    return v34;
  }
  if (sub_10000381C(v9))
  {
    uint64_t v26 = 0;
  }
  else
  {
    uint64_t v26 = [v11 objectForKey:@"GPUTOOLS_LOAD_GTMTLCAPTURE"];
  }
  [v26 intValue];
  DYSetGTMTLCaptureMode();
  if (![(DYEmbeddedDaemon *)self createInferiorTransportAndSetEnvironment:v11 uniqueIdentifier:0 error:a5])
  {

    goto LABEL_29;
  }
  DYModifyEnvironmentForDualCaptureSupport();

  if (v9)
  {
    if (sub_10000381C(v9))
    {
      id v39 = v11;
      id v27 = [v11 objectForKeyedSubscript:@"GPUTOOLS_LOAD_GTMTLREPLAYER2"];
      id v28 = v27;
      if (!v27 || [v27 BOOLValue])
      {
        uint64_t v45 = 0;
        v29 = +[FBSSystemService sharedService];
        unsigned int v30 = [v29 canOpenApplication:@"com.apple.MTLReplayer" reason:&v45];
        if (v45 == 4) {
          int v31 = v30;
        }
        else {
          int v31 = 1;
        }

        if (v31 == 1)
        {

          id v9 = @"com.apple.MTLReplayer";
          id v11 = v39;
          [v39 removeObjectForKey:@"METAL_LOAD_INTERPOSER"];
          v32 = [v39 objectForKeyedSubscript:@"METAL_DEBUG_ERROR_MODE"];
          v33 = v32;
          if (v32 && [v32 intValue] == 4) {
            [v39 removeObjectForKey:@"METAL_DEVICE_WRAPPER_TYPE"];
          }
        }
        else
        {
          id v11 = v39;
        }
      }
      [v11 removeObjectForKey:@"DYLD_INSERT_LIBRARIES"];
      v35 = +[NSUserDefaults standardUserDefaults];
      uint64_t v36 = [v35 dictionaryForKey:@"GPUDebugger.ReplayerEnvironment"];

      id v11 = v39;
      if (v36) {
        [v39 addEntriesFromDictionary:v36];
      }
    }
    [(DYEmbeddedDaemon *)self setInferiorPid:[(DYEmbeddedDaemon *)self launchInferiorWithIdentifer:v9 environment:v11 arguments:v42 error:a5]];
    if ((int)[(DYEmbeddedDaemon *)self inferiorPid] >= 1) {
      objc_storeStrong((id *)&self->_guestAppIdentifier, v9);
    }
    goto LABEL_40;
  }
  if (v44)
  {
    id v9 = 0;
    [(DYEmbeddedDaemon *)self setInferiorPid:[(DYEmbeddedDaemon *)self launchInferiorWithPath:v44 arguments:v42 environment:v11 workingDirectory:v41 error:a5]];
LABEL_40:
    if ((int)[(DYEmbeddedDaemon *)self inferiorPid] >= 1)
    {
      if (a4) {
        *a4 = v11;
      }
      [(DYEmbeddedDaemon *)self setOwnsInferior:1];
      [(DYEmbeddedDaemon *)self observeInferior];
      kill((pid_t)[(DYEmbeddedDaemon *)self inferiorPid], 19);
    }
    BOOL v34 = (int)[(DYEmbeddedDaemon *)self inferiorPid] > 0;

    goto LABEL_45;
  }
  BOOL result = dy_abort();
  __break(1u);
  return result;
}

- (id)processApplication:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  v5 = [v3 bundleURL];
  id v6 = [v5 path];

  id v7 = [v3 bundleIdentifier];
  [v4 setObject:v7 forKeyedSubscript:@"bundleIdentifier"];

  id v8 = [v3 localizedName];
  [v4 setObject:v8 forKeyedSubscript:@"title"];

  if (v6) {
    [v4 setObject:v6 forKeyedSubscript:@"fullpath"];
  }
  if (!CFStringGetFileSystemRepresentation(v6, buffer, 1024) || stat(buffer, &v22) == -1)
  {
    CFURLRef v11 = 0;
  }
  else
  {
    size_t v9 = strlen(buffer);
    CFURLRef v10 = CFURLCreateFromFileSystemRepresentation(kCFAllocatorDefault, (const UInt8 *)buffer, v9, (v22.st_mode & 0xF000) == 0x4000);
    CFURLRef v11 = v10;
    if (v10)
    {
      CFDictionaryRef v12 = CFBundleCopyInfoDictionaryForURL(v10);
      if (v12)
      {
        CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_100004CDC;
        v21[3] = &unk_10000C730;
        v21[4] = v12;
        v21[5] = Mutable;
        unsigned int v14 = objc_retainBlock(v21);
        ((void (*)(void *, const CFStringRef))v14[2])(v14, kCFBundleInfoDictionaryVersionKey);
        ((void (*)(void *, const CFStringRef))v14[2])(v14, kCFBundleExecutableKey);
        ((void (*)(void *, const CFStringRef))v14[2])(v14, kCFBundleIdentifierKey);
        ((void (*)(void *, const CFStringRef))v14[2])(v14, kCFBundleVersionKey);
        ((void (*)(void *, const CFStringRef))v14[2])(v14, kCFBundleDevelopmentRegionKey);
        ((void (*)(void *, const CFStringRef))v14[2])(v14, kCFBundleNameKey);
        ((void (*)(void *, const __CFString *))v14[2])(v14, @"CFBundleDisplayName");
        ((void (*)(void *, const __CFString *))v14[2])(v14, @"CFBundleSupportedPlatforms");
        ((void (*)(void *, const __CFString *))v14[2])(v14, @"DTCompiler");
        ((void (*)(void *, const __CFString *))v14[2])(v14, @"DTPlatformBuild");
        ((void (*)(void *, const __CFString *))v14[2])(v14, @"DTPlatformName");
        ((void (*)(void *, const __CFString *))v14[2])(v14, @"DTPlatformVersion");
        ((void (*)(void *, const __CFString *))v14[2])(v14, @"DTSDKName");
        ((void (*)(void *, const __CFString *))v14[2])(v14, @"DTXcode");
        ((void (*)(void *, const __CFString *))v14[2])(v14, @"DTXcodeBuild");
        ((void (*)(void *, const __CFString *))v14[2])(v14, @"LSRequiresIPhoneOS");
        ((void (*)(void *, const __CFString *))v14[2])(v14, @"MinimumOSVersion");
        ((void (*)(void *, const __CFString *))v14[2])(v14, @"UIDeviceFamily");
        ((void (*)(void *, const __CFString *))v14[2])(v14, @"UIRequiredDeviceCapabilities");
        CFDataRef Data = CFPropertyListCreateData(kCFAllocatorDefault, Mutable, kCFPropertyListBinaryFormat_v1_0, 0, 0);
        if (Data)
        {
          [v4 setObject:Mutable forKey:@"info plist"];
          CFRelease(Data);
        }
        CFRelease(v12);
        CFRelease(Mutable);
      }
      CFURLRef PathComponent = CFURLCreateCopyDeletingLastPathComponent(kCFAllocatorDefault, v11);
      CFURLRef v17 = CFURLCreateCopyAppendingPathComponent(kCFAllocatorDefault, PathComponent, @"iTunesMetadata.plist", 0);
      CFRelease(PathComponent);
      unsigned __int8 v18 = CFReadStreamCreateWithFile(kCFAllocatorDefault, v17);
      CFRelease(v17);
      if (v18)
      {
        if (CFReadStreamOpen(v18))
        {
          CFPropertyListRef v19 = CFPropertyListCreateWithStream(kCFAllocatorDefault, v18, 0, 0, 0, 0);
          CFReadStreamClose(v18);
          if (v19)
          {
            [v4 setObject:v19 forKey:@"itunes metadata"];
            CFRelease(v19);
          }
        }
        CFRelease(v18);
      }
      CFRelease(v11);
      CFURLRef v11 = v4;
    }
  }

  return v11;
}

- (id)getApplications
{
  id v3 = +[NSMutableArray array];
  id v4 = +[LSApplicationWorkspace defaultWorkspace];
  CFDictionaryRef v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  unsigned int v14 = sub_100004F24;
  uint64_t v15 = &unk_10000C758;
  v16 = self;
  id v5 = v3;
  id v17 = v5;
  [v4 enumerateBundlesOfType:1 block:&v12];

  if ([(DYEmbeddedDaemon *)self isAppleInternal])
  {
    id v6 = objc_opt_new();
    [v5 addObject:v6];
    [v6 setObject:@"com.apple.gputools.ui-server" forKey:@"bundleIdentifier"];
    [v6 setObject:@"UI Server" forKey:@"title"];
    id v7 = objc_alloc((Class)NSDictionary);
    id v8 = [v7 initWithObjectsAndKeys:@"Binary Launch", @"title", @"com.apple.gputools.BinaryLaunch", @"bundleIdentifier", 0, v12, v13, v14, v15, v16];
    [v5 addObject:v8];
  }
  size_t v9 = v17;
  id v10 = v5;

  return v10;
}

- (void)handleMessage:(id)a3
{
  id v4 = a3;
  int v5 = [v4 kind];
  if (v5 > 1537)
  {
    if (v5 == 1538)
    {
      if ([(DYEmbeddedDaemon *)self inferiorPid])
      {
        symbolicatorQueue = self->_symbolicatorQueue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1000058E4;
        block[3] = &unk_10000C780;
        block[4] = self;
        id v52 = v4;
        dispatch_async((dispatch_queue_t)symbolicatorQueue, block);
      }
    }
    else if (v5 == 2304)
    {
      id v10 = DYMobileArchivesDirectory();
      id v7 = +[NSURL fileURLWithPath:v10 isDirectory:1];

      id v11 = objc_alloc((Class)DYFSStreamer);
      CFDictionaryRef v12 = [(DYEmbeddedDaemon *)self transport];
      id v8 = [v11 initWithURL:v7 transport:v12 asSender:0];

      if (v8)
      {
        [v8 setOwner:@"mobile"];
        size_t v9 = [v8 receiveTransfer:v4];
      }
      else
      {
        size_t v9 = [(DYEmbeddedDaemon *)self transport];
        +[DYFSStreamer denyTransfer:v4 transport:v9];
      }
LABEL_47:

LABEL_48:
LABEL_49:
    }
    else
    {
LABEL_13:
      v50.receiver = self;
      v50.super_class = (Class)DYEmbeddedDaemon;
      [(DYEmbeddedDaemon *)&v50 handleMessage:v4];
    }
  }
  else
  {
    switch(v5)
    {
      case 1288:
        break;
      case 1289:
        BOOL v6 = [(DYEmbeddedDaemon *)self bringAppToForeground:self->_guestAppIdentifier];
        id v7 = [(DYEmbeddedDaemon *)self transport];
        id v8 = +[NSNumber numberWithBool:v6];
        size_t v9 = +[DYTransportMessage messageWithKind:1289 attributes:0 objectPayload:v8];
        [v7 send:v9 inReplyTo:v4 error:0];
        goto LABEL_47;
      case 1290:
        id v7 = +[NSBundle bundleWithIdentifier:@"com.apple.GPUTools"];
        id v8 = [v7 URLForResource:@"version" withExtension:@"plist"];
        if (v8) {
          id v49 = [objc_alloc((Class)NSDictionary) initWithContentsOfURL:v8];
        }
        else {
          id v49 = 0;
        }
        DYGetGLInterposeDylibPath();
        unsigned int v36 = DYMachOGetDylibCompatibilityVersion();
        if (v36) {
          uint64_t v37 = v36;
        }
        else {
          uint64_t v37 = 1572864;
        }
        DYGetMTLInterposeDylibPath();
        uint64_t v38 = DYMachOGetDylibCompatibilityVersion();
        uint64_t v39 = DYCheckGLDispatchTableSize();
        id v40 = +[NSNumber numberWithUnsignedInt:v38];
        id v41 = +[NSNumber numberWithUnsignedInt:v37];
        id v42 = +[NSNumber numberWithBool:v39];
        v43 = [v7 infoDictionary];
        v44 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:v40, @"interpose_version_metal", v41, @"interpose_version", v42, @"gl-dispatch-table-size-matches", v43, @"info", v49, @"version", 0];

        plist_filter(v44);
        uint64_t v45 = +[DYTransportMessage messageWithKind:1290 plistPayload:v44];
        v46 = [(DYEmbeddedDaemon *)self transport];
        [v46 send:v45 inReplyTo:v4 error:0];

        goto LABEL_48;
      case 1291:
      case 1293:
        goto LABEL_13;
      case 1292:
        id v7 = [v4 objectPayload];
        id v18 = [v7 intValue];
        if (v18 != [(DYEmbeddedDaemon *)self inferiorPid]
          && (int)[(DYEmbeddedDaemon *)self inferiorPid] > 0
          || !v18)
        {
          DYLog();
          -[DYEmbeddedDaemon terminate:](self, "terminate:", 1, v18);
        }
        if (v18 == [(DYEmbeddedDaemon *)self inferiorPid])
        {
          if (!self->_guestAppIdentifier) {
            [(DYEmbeddedDaemon *)self cacheInferiorAppIdentifier];
          }
        }
        else
        {
          v53[0] = 0;
          mach_error_t v33 = task_for_pid(mach_task_self_, (int)v18, v53);
          if (v33)
          {
            id v47 = v18;
            NSErrorUserInfoKey v48 = mach_error_string(v33);
            DYLog();
          }
          -[DYEmbeddedDaemon setInferiorPid:](self, "setInferiorPid:", v18, v47, v48);
          [(DYEmbeddedDaemon *)self observeInferior];
          BOOL v34 = objc_alloc_init(DYGPUStatsReport);
          statsReport = self->_statsReport;
          self->_statsReport = v34;

          [(DYGPUStatsReport *)self->_statsReport setup];
          [(DYGPUStatsReport *)self->_statsReport startCollectingStats];
          if (!self->_guestAppIdentifier) {
            [(DYEmbeddedDaemon *)self cacheInferiorAppIdentifier];
          }
        }
        goto LABEL_49;
      case 1294:
        id v7 = objc_opt_new();
        id v8 = (id)objc_opt_new();
        for (uint64_t i = 0; i != 5; ++i)
        {
          mach_error_t v20 = off_10000C7A0[i];
          id v21 = (void *)MGCopyAnswer();
          if (v21) {
            [v8 setObject:v21 forKey:v20];
          }
        }
        if ([v8 count]) {
          [v7 setObject:v8 forKey:@"screen-dimensions"];
        }
        stat v22 = [v4 attributeForKey:@"enable-metal-info"];
        unsigned int v23 = [v22 BOOLValue];

        id v24 = copy_metal_version();
        [v7 setObject:v24 forKey:@"metal_version"];

        size_t v9 = +[NSMutableArray array];
        uint64_t v25 = 0;
        int v26 = 1;
        do
        {
          char v27 = v26;
          if (((v23 | v26) & 1) == 0) {
            break;
          }
          id v28 = [(DYEmbeddedDaemon *)self captureAPISupportForAPI:*((unsigned int *)&unk_100009DA8 + v25)];
          v29 = [v28 graphicsAPIInfo];
          if (v29) {
            [v9 addObjectsFromArray:v29];
          }

          int v26 = 0;
          uint64_t v25 = 1;
        }
        while ((v27 & 1) != 0);
        [v7 setObject:v9 forKey:@"gputools.contexts-info"];
        [v7 setObject:&off_10000D2C0 forKeyedSubscript:@"nativePointerSize"];
        unsigned int v30 = +[DYTransportMessage messageWithKind:1294 objectPayload:v7];
        int v31 = [(DYEmbeddedDaemon *)self transport];
        [v31 send:v30 inReplyTo:v4 error:0];

        goto LABEL_47;
      default:
        if (v5 == 264)
        {
          uint64_t v13 = self->_statsReport;
          if (v13)
          {
            unsigned int v14 = [(DYGPUStatsReport *)v13 lastStatsReport];
            id v15 = [v14 copy];

            if (v15)
            {
              v16 = +[DYTransportMessage messageWithKind:1296 objectPayload:v15];
              id v17 = [(DYEmbeddedDaemon *)self transport];
              [v17 send:v16 error:0];
            }
          }
        }
        goto LABEL_13;
    }
  }
}

- (void)terminate:(int)a3
{
  DYLog();
  pid_t v4 = [(DYEmbeddedDaemon *)self inferiorPid];
  [(DYEmbeddedDaemon *)self setInferiorPid:0];
  statsReport = self->_statsReport;
  if (statsReport)
  {
    [(DYGPUStatsReport *)statsReport stopCollectingStats];
    BOOL v6 = self->_statsReport;
    self->_statsReport = 0;
  }
  if (v4 >= 1)
  {
    if ([(DYEmbeddedDaemon *)self ownsInferior]) {
      kill(v4, 9);
    }
    if ([(DYEmbeddedDaemon *)self capturingInferior]) {
      kill(v4, 9);
    }
  }
  [(DYTransport *)self->_helperTransport invalidate];
  id v7 = [(DYEmbeddedDaemon *)self transport];
  [v7 destroySharedMemoryTransport];

  id v8 = [(DYEmbeddedDaemon *)self transport];
  [v8 invalidate];

  v10.receiver = self;
  v10.super_class = (Class)DYEmbeddedDaemon;
  [(DYEmbeddedDaemon *)&v10 invalidate];
  (*((void (**)(void))self->_terminationHandler + 2))();
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_terminationHandler, 0);
  objc_storeStrong((id *)&self->_statsReport, 0);
  objc_storeStrong((id *)&self->_guestAppIdentifier, 0);
  objc_storeStrong((id *)&self->_helperTransport, 0);

  objc_storeStrong((id *)&self->_symbolicatorQueue, 0);
}

@end