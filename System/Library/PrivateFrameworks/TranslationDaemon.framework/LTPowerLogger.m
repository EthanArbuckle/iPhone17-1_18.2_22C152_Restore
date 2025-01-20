@interface LTPowerLogger
@end

@implementation LTPowerLogger

uint64_t __32___LTPowerLogger_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance = objc_alloc_init(_LTPowerLogger);
  return MEMORY[0x270F9A758]();
}

void __65___LTPowerLogger_logTranslateRequestEvent_requestType_routeType___block_invoke(void *a1)
{
  v6[2] = *MEMORY[0x263EF8340];
  v1 = &stru_270C008E8;
  v2 = (void *)a1[5];
  if (a1[4]) {
    v1 = (__CFString *)a1[4];
  }
  v6[0] = v1;
  v5[0] = @"processName";
  v5[1] = @"requestType";
  v3 = [v2 _maskForRequestType:a1[6]];
  v6[1] = v3;
  v4 = [NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];

  PLLogRegisteredEvent();
}

@end