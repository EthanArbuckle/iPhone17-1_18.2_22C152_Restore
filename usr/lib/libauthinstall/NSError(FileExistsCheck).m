@interface NSError(FileExistsCheck)
- (BOOL)isFileExistsError;
@end

@implementation NSError(FileExistsCheck)

- (BOOL)isFileExistsError
{
  id v2 = (id)[a1 domain];
  if ([v2 isEqualToString:*MEMORY[0x263F08438]]) {
    BOOL v3 = [a1 code] == 17;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

@end