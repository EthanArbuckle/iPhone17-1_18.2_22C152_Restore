@interface NSError(HKSPXPCConnectionProvider)
- (BOOL)hksp_shouldRetryMessage;
@end

@implementation NSError(HKSPXPCConnectionProvider)

- (BOOL)hksp_shouldRetryMessage
{
  v2 = [a1 domain];
  int v3 = [v2 isEqualToString:*MEMORY[0x1E4F281F8]];

  return v3 && ([a1 code] & 0xFFFFFFFFFFFFFFFDLL) == 4097;
}

@end