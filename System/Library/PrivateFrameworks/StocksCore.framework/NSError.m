@interface NSError
@end

@implementation NSError

BOOL __51__NSError_SCWAdditions__sc_hasUnderlyingErrorCode___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 domain];
  if ([v4 isEqualToString:*MEMORY[0x1E4F19C40]]) {
    BOOL v5 = [v3 code] == *(void *)(a1 + 32);
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

@end