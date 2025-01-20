@interface NSError(HDSPWakeUpResultsNotification)
+ (id)hdsp_insufficientSleepDataError;
- (BOOL)hdsp_isInsufficientSleepDataError;
@end

@implementation NSError(HDSPWakeUpResultsNotification)

+ (id)hdsp_insufficientSleepDataError
{
  v5[1] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263F087E8];
  uint64_t v4 = *MEMORY[0x263F08320];
  v5[0] = @"Query returned data insufficient to attempt wake up result computation";
  v1 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];
  v2 = [v0 errorWithDomain:@"HDSPWakeUpResultsNotificationErrorDomain" code:1 userInfo:v1];

  return v2;
}

- (BOOL)hdsp_isInsufficientSleepDataError
{
  v2 = [a1 domain];
  if ([v2 isEqualToString:@"HDSPWakeUpResultsNotificationErrorDomain"]) {
    BOOL v3 = [a1 code] == 1;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

@end