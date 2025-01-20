@interface _LTDDaemon
+ (id)buildDateWithError:(id *)a3;
+ (id)realPathFor:(id)a3 error:(id *)a4;
+ (void)initialize;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_LTDDaemon)init;
- (id)_cacheDirectoryPath;
- (void)_cacheDirectoryPath;
- (void)_setupMemoryWarningListener;
- (void)clientConnectionClosed:(id)a3;
- (void)run;
@end

@implementation _LTDDaemon

+ (void)initialize
{
}

+ (id)buildDateWithError:(id *)a3
{
  v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v5 = [v4 bundleURL];
  v6 = [v5 lastPathComponent];
  v7 = [v6 stringByDeletingPathExtension];

  v8 = [v5 URLByAppendingPathComponent:v7];
  v9 = [MEMORY[0x263F08850] defaultManager];
  v10 = [v8 path];
  id v15 = 0;
  v11 = [v9 attributesOfItemAtPath:v10 error:&v15];
  id v12 = v15;

  if (a3 && v12)
  {
    v13 = 0;
    *a3 = v12;
  }
  else
  {
    v13 = [v11 objectForKeyedSubscript:*MEMORY[0x263F08048]];
    if (!v13)
    {
      v13 = [v11 objectForKeyedSubscript:*MEMORY[0x263F08008]];
    }
  }

  return v13;
}

- (_LTDDaemon)init
{
  v12.receiver = self;
  v12.super_class = (Class)_LTDDaemon;
  v2 = [(_LTDDaemon *)&v12 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF980] array];
    connections = v2->_connections;
    v2->_connections = (NSMutableArray *)v3;

    v5 = objc_alloc_init(_LTTranslationServer);
    server = v2->_server;
    v2->_server = v5;

    +[_LTDAssetService setCleanupScheduler:v2->_server];
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.translation.daemon.listener", 0);
    listenerQueue = v2->_listenerQueue;
    v2->_listenerQueue = (OS_dispatch_queue *)v7;

    +[_LTDAssetService bootstrapWithCompletion:0];
    v9 = [MEMORY[0x263EFFA40] standardUserDefaults];
    [v9 registerDefaults:&unk_270C337A0];

    v10 = v2;
  }

  return v2;
}

- (void)run
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if ((_set_user_dir_suffix() & 1) == 0)
  {
    uint64_t v3 = _LTOSLogSandbox();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = v3;
      v5 = __error();
      v6 = strerror(*v5);
      int v12 = 136446210;
      v13 = v6;
      _os_log_error_impl(&dword_2600DC000, v4, OS_LOG_TYPE_ERROR, "Failed to set user dir suffix: %{public}s", (uint8_t *)&v12, 0xCu);
    }
  }
  [(_LTDDaemon *)self _enterSandbox];
  [(_LTDDaemon *)self _setupMemoryWarningListener];
  dispatch_queue_t v7 = (NSXPCListener *)[objc_alloc(MEMORY[0x263F08D88]) initWithMachServiceName:@"com.apple.translationd"];
  translationListener = self->_translationListener;
  self->_translationListener = v7;

  [(NSXPCListener *)self->_translationListener _setQueue:self->_listenerQueue];
  [(NSXPCListener *)self->_translationListener setDelegate:self];
  [(NSXPCListener *)self->_translationListener resume];
  v9 = (NSXPCListener *)[objc_alloc(MEMORY[0x263F08D88]) initWithMachServiceName:@"com.apple.translation.text"];
  textTranslationListener = self->_textTranslationListener;
  self->_textTranslationListener = v9;

  [(NSXPCListener *)self->_textTranslationListener _setQueue:self->_listenerQueue];
  [(NSXPCListener *)self->_textTranslationListener setDelegate:self];
  [(NSXPCListener *)self->_textTranslationListener resume];
  v11 = [MEMORY[0x263EFF9F0] currentRunLoop];
  [v11 run];

  exit(1);
}

- (void)_setupMemoryWarningListener
{
  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __41___LTDDaemon__setupMemoryWarningListener__block_invoke;
  v2[3] = &unk_265545E20;
  objc_copyWeak(&v3, &location);
  if (_setupMemoryWarningListener_once != -1) {
    dispatch_once(&_setupMemoryWarningListener_once, v2);
  }
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

- (id)_cacheDirectoryPath
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (!confstr(65538, v5, 0x400uLL))
  {
    v4 = _LTOSLogSandbox();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[_LTDDaemon _cacheDirectoryPath](v4);
    }
    exit(1);
  }
  v2 = [NSString stringWithUTF8String:v5];
  return v2;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v6 = (NSXPCListener *)a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_listenerQueue);
  translationListener = self->_translationListener;
  if (translationListener != v6)
  {
    if (self->_textTranslationListener == v6) {
      goto LABEL_5;
    }
LABEL_8:
    BOOL v12 = 0;
    goto LABEL_9;
  }
  v9 = [v7 valueForEntitlement:@"com.apple.private.translation"];
  char v10 = [v9 BOOLValue];

  if ((v10 & 1) == 0)
  {
    v13 = _LTOSLogXPC();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[_LTDDaemon listener:shouldAcceptNewConnection:](v13, v7);
    }
    goto LABEL_8;
  }
LABEL_5:
  v11 = [[_LTClientConnection alloc] initWithConnection:v7 server:self->_server trusted:translationListener == v6];
  [(_LTClientConnection *)v11 setDelegate:self];
  [(NSMutableArray *)self->_connections addObject:v11];
  [v7 resume];

  BOOL v12 = 1;
LABEL_9:

  return v12;
}

- (void)clientConnectionClosed:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  listenerQueue = self->_listenerQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37___LTDDaemon_clientConnectionClosed___block_invoke;
  block[3] = &unk_265545C70;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(listenerQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

+ (id)realPathFor:(id)a3 error:(id *)a4
{
  v5 = realpath_DARWIN_EXTSN((const char *)[a3 UTF8String], 0);
  if (v5)
  {
    id v6 = v5;
    id v7 = [NSString stringWithUTF8String:v5];
    free(v6);
  }
  else if (a4)
  {
    [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:*__error() userInfo:0];
    id v7 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_server, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_listenerQueue, 0);
  objc_storeStrong((id *)&self->_textTranslationListener, 0);
  objc_storeStrong((id *)&self->_translationListener, 0);
}

- (void)_cacheDirectoryPath
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v1 = a1;
  v2 = __error();
  id v3 = strerror(*v2);
  int v4 = 136446210;
  v5 = v3;
  _os_log_error_impl(&dword_2600DC000, v1, OS_LOG_TYPE_ERROR, "Failed to get cache directory: %{public}s", (uint8_t *)&v4, 0xCu);
}

- (void)listener:(void *)a1 shouldAcceptNewConnection:(void *)a2 .cold.1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a1;
  v4[0] = 67109378;
  v4[1] = [a2 processIdentifier];
  __int16 v5 = 2114;
  uint64_t v6 = @"com.apple.private.translation";
  _os_log_error_impl(&dword_2600DC000, v3, OS_LOG_TYPE_ERROR, "Rejected Translation client with PID %d lacking the appropriate entitlement (%{public}@).", (uint8_t *)v4, 0x12u);
}

@end