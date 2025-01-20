@interface ACAccount(RTExtensions)
- (uint64_t)coreRoutineDataclassEnabled;
@end

@implementation ACAccount(RTExtensions)

- (uint64_t)coreRoutineDataclassEnabled
{
  v1 = [a1 provisionedDataclasses];
  uint64_t v2 = [v1 containsObject:*MEMORY[0x1E4F17AA8]];

  return v2;
}

@end