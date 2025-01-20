@interface SUControllerLogger
+ (id)sharedLogger;
- (SUControllerLogger)init;
- (int64_t)logLevel;
- (void)logAtLevel:(int64_t)a3 label:(const char *)a4 format:(id)a5;
- (void)setLogLevel:(int64_t)a3;
- (void)setLoglevel:(int64_t)a3;
@end

@implementation SUControllerLogger

+ (id)sharedLogger
{
  if (sharedLogger_loggerOnce != -1) {
    dispatch_once(&sharedLogger_loggerOnce, &__block_literal_global);
  }
  v2 = (void *)sharedLogger_logger;

  return v2;
}

uint64_t __34__SUControllerLogger_sharedLogger__block_invoke()
{
  sharedLogger_logger = objc_alloc_init(SUControllerLogger);

  return MEMORY[0x270F9A758]();
}

- (SUControllerLogger)init
{
  v11.receiver = self;
  v11.super_class = (Class)SUControllerLogger;
  v2 = [(SUControllerLogger *)&v11 init];
  v3 = v2;
  if (v2)
  {
    v2->_logLevel = 2;
    os_log_t v4 = os_log_create("com.apple.sucontroller", "Info");
    logInfo = v3->_logInfo;
    v3->_logInfo = (OS_os_log *)v4;

    os_log_t v6 = os_log_create("com.apple.sucontroller", "Notice");
    logNotice = v3->_logNotice;
    v3->_logNotice = (OS_os_log *)v6;

    os_log_t v8 = os_log_create("com.apple.sucontroller", "Error");
    logError = v3->_logError;
    v3->_logError = (OS_os_log *)v8;
  }
  return v3;
}

- (void)setLoglevel:(int64_t)a3
{
  self->_logLevel = a3;
}

- (void)logAtLevel:(int64_t)a3 label:(const char *)a4 format:(id)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  os_log_t v8 = (objc_class *)NSString;
  id v9 = a5;
  v10 = (void *)[[v8 alloc] initWithFormat:v9 arguments:&v21];

  if (a3 == 1)
  {
    logNotice = self->_logNotice;
    if (!os_log_type_enabled(logNotice, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_10;
    }
    *(_DWORD *)buf = 136446466;
    v17 = a4;
    __int16 v18 = 2114;
    v19 = v10;
    v13 = logNotice;
    os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
LABEL_9:
    _os_log_impl(&dword_25E01C000, v13, v14, "%{public}s: %{public}@", buf, 0x16u);
    goto LABEL_10;
  }
  if (a3)
  {
    logInfo = self->_logInfo;
    if (!os_log_type_enabled(logInfo, OS_LOG_TYPE_INFO)) {
      goto LABEL_10;
    }
    *(_DWORD *)buf = 136446466;
    v17 = a4;
    __int16 v18 = 2114;
    v19 = v10;
    v13 = logInfo;
    os_log_type_t v14 = OS_LOG_TYPE_INFO;
    goto LABEL_9;
  }
  logError = self->_logError;
  if (os_log_type_enabled(logError, OS_LOG_TYPE_ERROR)) {
    -[SUControllerLogger logAtLevel:label:format:]((uint64_t)a4, (uint64_t)v10, logError);
  }
LABEL_10:
}

- (int64_t)logLevel
{
  return self->_logLevel;
}

- (void)setLogLevel:(int64_t)a3
{
  self->_logLevel = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logError, 0);
  objc_storeStrong((id *)&self->_logNotice, 0);

  objc_storeStrong((id *)&self->_logInfo, 0);
}

- (void)logAtLevel:(uint64_t)a1 label:(uint64_t)a2 format:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 136446466;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_25E01C000, log, OS_LOG_TYPE_ERROR, "%{public}s: %{public}@", (uint8_t *)&v3, 0x16u);
}

@end