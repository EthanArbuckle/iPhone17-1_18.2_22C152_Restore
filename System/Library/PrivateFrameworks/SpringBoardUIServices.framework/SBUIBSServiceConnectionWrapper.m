@interface SBUIBSServiceConnectionWrapper
- (id)connectionWithEndpoint:(id)a3;
@end

@implementation SBUIBSServiceConnectionWrapper

- (id)connectionWithEndpoint:(id)a3
{
  return (id)[MEMORY[0x1E4F62880] connectionWithEndpoint:a3];
}

@end