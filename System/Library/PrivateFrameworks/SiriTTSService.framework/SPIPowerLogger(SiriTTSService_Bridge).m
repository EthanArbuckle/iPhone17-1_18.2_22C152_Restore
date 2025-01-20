@interface SPIPowerLogger(SiriTTSService_Bridge)
+ (id)loggerForCurrentProcess;
@end

@implementation SPIPowerLogger(SiriTTSService_Bridge)

+ (id)loggerForCurrentProcess
{
  v0 = (void *)[objc_alloc(MEMORY[0x1E4FA3C38]) initWithCurrentProcess];
  return v0;
}

@end