@interface SCROServer
+ (SCROServer)sharedServer;
- (BOOL)_ensureResourcesExist;
- (BOOL)_registerWithMachServiceName:(char *)a3;
- (BOOL)isRegisteredWithMach;
- (BOOL)registerWithMach;
- (SCROServer)init;
- (__CFRunLoopSource)serverSource;
- (__CFRunLoopTimer)_deathTimer;
- (id)delegate;
- (int)_registerForNotificationOnDeathPort:(unsigned int)a3;
- (int64_t)_clientCount;
- (int64_t)_incrementClientCount;
- (void)_deleteOldResources;
- (void)_setClientCount:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)unregisterWithMach;
@end

@implementation SCROServer

+ (SCROServer)sharedServer
{
  if (sharedServer_onceToken != -1) {
    dispatch_once(&sharedServer_onceToken, &__block_literal_global_11);
  }
  v2 = (void *)_sharedServer;

  return (SCROServer *)v2;
}

uint64_t __26__SCROServer_sharedServer__block_invoke()
{
  v0 = objc_alloc_init(SCROServer);
  _sharedServer = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0);
}

- (SCROServer)init
{
  v6.receiver = self;
  v6.super_class = (Class)SCROServer;
  v2 = [(SCROServer *)&v6 init];
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
    contentLock = v2->_contentLock;
    v2->_contentLock = v3;

    [(SCROServer *)v2 _deleteOldResources];
    [(SCROServer *)v2 _ensureResourcesExist];
  }
  return v2;
}

- (int64_t)_clientCount
{
  [(NSLock *)self->_contentLock lock];
  int64_t clientCount = self->_clientCount;
  [(NSLock *)self->_contentLock unlock];
  return clientCount;
}

- (int64_t)_incrementClientCount
{
  [(NSLock *)self->_contentLock lock];
  int64_t v3 = self->_clientCount + 1;
  self->_int64_t clientCount = v3;
  [(NSLock *)self->_contentLock unlock];
  return v3;
}

- (void)_setClientCount:(int64_t)a3
{
  [(NSLock *)self->_contentLock lock];
  self->_int64_t clientCount = a3;
  contentLock = self->_contentLock;

  [(NSLock *)contentLock unlock];
}

- (__CFRunLoopTimer)_deathTimer
{
  [(NSLock *)self->_contentLock lock];
  deathTimer = self->_deathTimer;
  [(NSLock *)self->_contentLock unlock];
  return deathTimer;
}

- (int)_registerForNotificationOnDeathPort:(unsigned int)a3
{
  kern_return_t v5;
  mach_port_t previous;

  previous = 0;
  [(NSLock *)self->_contentLock lock];
  v5 = mach_port_request_notification(*MEMORY[0x263EF8960], a3, 72, 0, self->_deathPort, 0x15u, &previous);
  [(NSLock *)self->_contentLock unlock];
  return v5;
}

- (void)setDelegate:(id)a3
{
}

- (id)delegate
{
  return self->_delegate;
}

- (BOOL)isRegisteredWithMach
{
  return self->_isRegisteredWithMach;
}

- (BOOL)registerWithMach
{
  return [(SCROServer *)self _registerWithMachServiceName:"com.apple.scrod"];
}

- (BOOL)_registerWithMachServiceName:(char *)a3
{
  if (self->_isRegisteredWithMach) {
    return 1;
  }
  mach_port_t special_port = 0;
  Current = CFRunLoopGetCurrent();
  v7 = (ipc_space_t *)MEMORY[0x263EF8960];
  uint64_t v8 = task_get_special_port(*MEMORY[0x263EF8960], 4, &special_port);
  if (v8)
  {
    NSLog(&cfstr_ErrorDCouldNot.isa, v8);
  }
  else
  {
    uint64_t v9 = bootstrap_check_in(special_port, a3, &self->_serverPort);
    if (v9)
    {
      NSLog(&cfstr_ErrorDCouldNot_0.isa, v9);
    }
    else
    {
      uint64_t v11 = MSHCreateMIGServerSource();
      if (v11)
      {
        v12 = (__CFRunLoopSource *)v11;
        [(NSLock *)self->_contentLock lock];
        self->_serverSource = v12;
        [(NSLock *)self->_contentLock unlock];
        mach_port_deallocate(*v7, special_port);
        BOOL v3 = 1;
        v13 = (__CFRunLoopSource *)MSHCreateMachServerSource();
        self->_deathSource = v13;
        if (v13)
        {
          context.version = 0;
          memset(&context.retain, 0, 24);
          context.info = self;
          [(NSLock *)self->_contentLock lock];
          self->_deathPort = MSHGetMachPortFromSource();
          CFStringRef v14 = (const __CFString *)*MEMORY[0x263EFFE78];
          CFRunLoopAddSource(Current, self->_deathSource, (CFRunLoopMode)*MEMORY[0x263EFFE78]);
          CFAbsoluteTime v15 = CFAbsoluteTimeGetCurrent();
          v16 = CFRunLoopTimerCreate(0, v15 + 3.0, 3.0, 0, 0, (CFRunLoopTimerCallBack)_deathTimerHandler, &context);
          self->_deathTimer = v16;
          CFRunLoopAddTimer(Current, v16, v14);
          [(NSLock *)self->_contentLock unlock];
          self->_isRegisteredWithMach = 1;
          return v3;
        }
        NSLog(&cfstr_ErrorCouldNotC_2.isa);
      }
      else
      {
        NSLog(&cfstr_ErrorCouldNotC_1.isa);
      }
    }
  }
  [(SCROServer *)self unregisterWithMach];
  return 0;
}

- (void)unregisterWithMach
{
  self->_isRegisteredWithMach = 0;
  [(NSLock *)self->_contentLock lock];
  deathTimer = self->_deathTimer;
  if (deathTimer)
  {
    CFRunLoopTimerInvalidate(deathTimer);
    CFRelease(self->_deathTimer);
    self->_deathTimer = 0;
  }
  serverSource = self->_serverSource;
  if (serverSource)
  {
    CFRelease(serverSource);
    self->_serverSource = 0;
  }
  [(NSLock *)self->_contentLock unlock];
  deathSource = self->_deathSource;
  if (deathSource)
  {
    CFRunLoopSourceInvalidate(deathSource);
    CFRelease(self->_deathSource);
    self->_deathSource = 0;
  }
  if (self->_serverPort) {
    self->_serverPort = 0;
  }
  [(NSLock *)self->_contentLock lock];
  if (self->_deathPort) {
    self->_deathPort = 0;
  }
  contentLock = self->_contentLock;

  [(NSLock *)contentLock unlock];
}

- (__CFRunLoopSource)serverSource
{
  [(NSLock *)self->_contentLock lock];
  serverSource = self->_serverSource;
  [(NSLock *)self->_contentLock unlock];
  return serverSource;
}

- (void)_deleteOldResources
{
  v2 = NSHomeDirectory();
  id v6 = [v2 stringByAppendingPathComponent:@"/Library/Accessibility/ktoa_u_kwa.dic"];

  BOOL v3 = [MEMORY[0x263F08850] defaultManager];
  int v4 = [v3 fileExistsAtPath:v6];

  if (v4)
  {
    v5 = [MEMORY[0x263F08850] defaultManager];
    [v5 removeItemAtPath:v6 error:0];
  }
}

- (BOOL)_ensureResourcesExist
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v2 = NSHomeDirectory();
  BOOL v3 = [v2 stringByAppendingPathComponent:@"/Library/Accessibility/ktoa_u_kwa_v5.dic"];

  int v4 = [MEMORY[0x263F08850] defaultManager];
  char v5 = [v4 fileExistsAtPath:v3];

  if ((v5 & 1) == 0)
  {
    archive_read_new();
    v7 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/ScreenReader/BrailleTables/BrailleNBSC.brailletable"];
    uint64_t v8 = [v7 resourcePath];
    id v9 = [v8 stringByAppendingString:@"/ktoa_u_kwa"];
    [v9 UTF8String];

    if (archive_read_support_format_zip())
    {
      v10 = _SCROD_LOG();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v25 = archive_error_string();
        uint64_t v11 = "NBSC Braille for text: (init) archive_read unable to set supported formats: %s.";
        v12 = v10;
        uint32_t v13 = 12;
LABEL_9:
        _os_log_impl(&dword_21C66E000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
        goto LABEL_10;
      }
      goto LABEL_10;
    }
    if (archive_read_open_filename())
    {
      v10 = _SCROD_LOG();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        uint64_t v11 = "NBSC Braille for text: (init) failed to unzip.";
        v12 = v10;
        uint32_t v13 = 2;
        goto LABEL_9;
      }
LABEL_10:

      BOOL v6 = 0;
      goto LABEL_11;
    }
    uint64_t v23 = 0;
    if (archive_read_next_header())
    {
      CFAbsoluteTime v15 = _SCROD_LOG();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21C66E000, v15, OS_LOG_TYPE_DEFAULT, "NBSC Braille for text: (init) failed to read header.", buf, 2u);
      }
      BOOL v6 = 0;
      goto LABEL_28;
    }
    CFAbsoluteTime v15 = [MEMORY[0x263EFF990] data];
    uint64_t v21 = 0;
    uint64_t v22 = 0;
    v20[1] = 0;
    while (1)
    {
      int data_block = archive_read_data_block();
      if (data_block) {
        break;
      }
      [v15 appendBytes:v22 length:v21];
    }
    if (data_block == 1)
    {
      v20[0] = 0;
      [v15 writeToFile:v3 options:1 error:v20];
      v17 = v20[0];
      BOOL v6 = v17 == 0;
      if (!v17)
      {
LABEL_27:

LABEL_28:
        goto LABEL_11;
      }
      v18 = _SCROD_LOG();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = [v17 localizedDescription];
        *(_DWORD *)buf = 138412290;
        uint64_t v25 = (uint64_t)v19;
        _os_log_impl(&dword_21C66E000, v18, OS_LOG_TYPE_DEFAULT, "NBSC Braille for text: writing the unzipped file of ktoa_u_kwa.zip failed: %@", buf, 0xCu);
      }
    }
    else
    {
      v17 = _SCROD_LOG();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v25 = archive_error_string();
        _os_log_impl(&dword_21C66E000, v17, OS_LOG_TYPE_DEFAULT, "NBSC Braille for text: can't read ktoa_u_kwp.zip: %s", buf, 0xCu);
      }
    }
    BOOL v6 = 0;
    goto LABEL_27;
  }
  BOOL v6 = 1;
LABEL_11:

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);

  objc_storeStrong((id *)&self->_contentLock, 0);
}

@end