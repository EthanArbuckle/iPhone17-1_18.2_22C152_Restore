@interface NSError(WFActionEnvironment)
+ (id)wfUnsupportedEnvironmentError;
- (BOOL)wf_isUnsupportedEnvironmentError;
@end

@implementation NSError(WFActionEnvironment)

- (BOOL)wf_isUnsupportedEnvironmentError
{
  v2 = [a1 domain];
  if ([v2 isEqualToString:@"WFActionErrorDomain"]) {
    BOOL v3 = [a1 code] == 2;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

+ (id)wfUnsupportedEnvironmentError
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *MEMORY[0x1E4F28568];
  v0 = WFLocalizedString(@"This action cannot be run in the current environment.");
  v5[0] = v0;
  v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WFActionErrorDomain" code:2 userInfo:v1];

  return v2;
}

@end