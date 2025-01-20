@interface LSApplicationRecord(SBHSimpleApplicationDataSource)
- (uint64_t)sbh_isValidType;
@end

@implementation LSApplicationRecord(SBHSimpleApplicationDataSource)

- (uint64_t)sbh_isValidType
{
  v1 = [a1 typeForInstallMachinery];
  if ([v1 isEqualToString:*MEMORY[0x1E4F22390]]) {
    uint64_t v2 = 1;
  }
  else {
    uint64_t v2 = [v1 isEqualToString:*MEMORY[0x1E4F22380]];
  }

  return v2;
}

@end