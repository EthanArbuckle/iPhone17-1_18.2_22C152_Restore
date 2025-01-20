@interface NSError(MFAccount)
- (uint64_t)mf_isInaccessibleAccountCredentialError;
- (uint64_t)mf_isMissingAccountCredentialError;
@end

@implementation NSError(MFAccount)

- (uint64_t)mf_isMissingAccountCredentialError
{
  v2 = (void *)[a1 domain];
  uint64_t result = [v2 isEqualToString:*MEMORY[0x1E4F178F0]];
  if (result) {
    return [a1 code] == 11;
  }
  return result;
}

- (uint64_t)mf_isInaccessibleAccountCredentialError
{
  v2 = (void *)[a1 domain];
  uint64_t result = [v2 isEqualToString:*MEMORY[0x1E4F178F0]];
  if (result) {
    return [a1 code] == 10;
  }
  return result;
}

@end