@interface SUCoreLog
+ (id)sharedLogger;
- (NSString)category;
- (OS_os_log)oslog;
- (SUCoreLog)initWithCategory:(id)a3;
@end

@implementation SUCoreLog

uint64_t __25__SUCoreLog_sharedLogger__block_invoke()
{
  sharedLogger_logger = [[SUCoreLog alloc] initWithCategory:@"SU"];
  return MEMORY[0x1F41817F8]();
}

- (SUCoreLog)initWithCategory:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SUCoreLog;
  v6 = [(SUCoreLog *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_category, a3);
    v8 = +[SUCore sharedCore];
    id v9 = [v8 commonDomain];
    os_log_t v10 = os_log_create((const char *)[v9 UTF8String], (const char *)objc_msgSend(v5, "UTF8String"));
    oslog = v7->_oslog;
    v7->_oslog = (OS_os_log *)v10;
  }
  return v7;
}

- (OS_os_log)oslog
{
  return self->_oslog;
}

+ (id)sharedLogger
{
  if (sharedLogger_loggerOnce != -1) {
    dispatch_once(&sharedLogger_loggerOnce, &__block_literal_global_4);
  }
  v2 = (void *)sharedLogger_logger;
  return v2;
}

- (NSString)category
{
  return self->_category;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_oslog, 0);
}

@end