@interface STYSignpostsMonitorHelper
- (BOOL)isEnabled;
- (BOOL)needsEnablementChange;
- (BOOL)shouldBeEnabled;
- (BOOL)wantsAnimationFrameRate;
- (NSString)name;
- (OS_dispatch_queue)processingQueue;
- (OS_os_transaction)osTransaction;
- (STYSignpostsMonitorHelper)init;
- (SignpostSupportSubsystemCategoryAllowlist)allowList;
- (void)didEndMonitoring;
- (void)name;
- (void)setIsEnabled:(BOOL)a3;
- (void)setOsTransaction:(id)a3;
- (void)setProcessingQueue:(id)a3;
- (void)setShouldBeEnabled:(BOOL)a3;
- (void)takeTransaction;
- (void)willStartMonitoring;
@end

@implementation STYSignpostsMonitorHelper

- (STYSignpostsMonitorHelper)init
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)STYSignpostsMonitorHelper;
  v2 = [(STYSignpostsMonitorHelper *)&v8 init];
  v3 = v2;
  if (v2)
  {
    ClassName = object_getClassName(v2);
    snprintf(__str, 0x80uLL, "com.apple.sentry.signpostsMonitor.%s", ClassName);
    dispatch_queue_t v5 = dispatch_queue_create(__str, 0);
    processingQueue = v3->_processingQueue;
    v3->_processingQueue = (OS_dispatch_queue *)v5;
  }
  return v3;
}

- (void)takeTransaction
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = [(STYSignpostsMonitorHelper *)self osTransaction];

  if (!v3)
  {
    ClassName = object_getClassName(self);
    snprintf(__str, 0x80uLL, "com.apple.sentry.signpostsMonitor.%s", ClassName);
    dispatch_queue_t v5 = (void *)os_transaction_create();
    [(STYSignpostsMonitorHelper *)self setOsTransaction:v5];
  }
}

- (BOOL)wantsAnimationFrameRate
{
  return 0;
}

- (void)willStartMonitoring
{
  [(STYSignpostsMonitorHelper *)self setIsEnabled:1];
  [(STYSignpostsMonitorHelper *)self resetState];
  [(STYSignpostsMonitorHelper *)self takeTransaction];
}

- (void)didEndMonitoring
{
  [(STYSignpostsMonitorHelper *)self setOsTransaction:0];
  [(STYSignpostsMonitorHelper *)self resetState];
  [(STYSignpostsMonitorHelper *)self setIsEnabled:0];
}

- (BOOL)needsEnablementChange
{
  BOOL v3 = [(STYSignpostsMonitorHelper *)self isEnabled];
  return v3 ^ [(STYSignpostsMonitorHelper *)self shouldBeEnabled];
}

- (NSString)name
{
  BOOL v3 = +[STYFrameworkHelper sharedHelper];
  v4 = [v3 logHandle];

  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    -[STYSignpostsMonitorHelper name](self);
  }

  return (NSString *)@"Unnamed signpost monitor helper";
}

- (SignpostSupportSubsystemCategoryAllowlist)allowList
{
  BOOL v3 = +[STYFrameworkHelper sharedHelper];
  v4 = [v3 logHandle];

  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    -[STYSignpostsMonitorHelper name](self);
  }

  return 0;
}

- (BOOL)shouldBeEnabled
{
  return self->_shouldBeEnabled;
}

- (void)setShouldBeEnabled:(BOOL)a3
{
  self->_shouldBeEnabled = a3;
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (void)setIsEnabled:(BOOL)a3
{
  self->_isEnabled = a3;
}

- (OS_dispatch_queue)processingQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (void)setProcessingQueue:(id)a3
{
}

- (OS_os_transaction)osTransaction
{
  return (OS_os_transaction *)objc_getProperty(self, a2, 24, 1);
}

- (void)setOsTransaction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_osTransaction, 0);
  objc_storeStrong((id *)&self->_processingQueue, 0);
}

- (void)name
{
  object_getClassName(a1);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_14(&dword_1D3037000, v1, v2, "allowList need to be overridden by %s", v3, v4, v5, v6, v7);
}

@end