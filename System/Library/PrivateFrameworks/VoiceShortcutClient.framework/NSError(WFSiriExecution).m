@interface NSError(WFSiriExecution)
+ (uint64_t)wfSiriExecutionRequiresShortcutsJrError;
- (BOOL)wf_isRequiresShortcutsJrError;
@end

@implementation NSError(WFSiriExecution)

- (BOOL)wf_isRequiresShortcutsJrError
{
  v2 = [a1 domain];
  if ([v2 isEqualToString:@"WFSiriExecutionErrorDomain"]) {
    BOOL v3 = [a1 code] == 0;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

+ (uint64_t)wfSiriExecutionRequiresShortcutsJrError
{
  return [MEMORY[0x1E4F28C58] errorWithDomain:@"WFSiriExecutionErrorDomain" code:0 userInfo:0];
}

@end