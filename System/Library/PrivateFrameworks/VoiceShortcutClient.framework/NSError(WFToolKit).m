@interface NSError(WFToolKit)
+ (uint64_t)wfCancelledStepError;
- (BOOL)wf_isCancelledStepError;
@end

@implementation NSError(WFToolKit)

- (BOOL)wf_isCancelledStepError
{
  v2 = [a1 domain];
  if ([v2 isEqualToString:@"WFToolKitErrorDomain"]) {
    BOOL v3 = [a1 code] == 0;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

+ (uint64_t)wfCancelledStepError
{
  return [MEMORY[0x1E4F28C58] errorWithDomain:@"WFToolKitErrorDomain" code:0 userInfo:0];
}

@end