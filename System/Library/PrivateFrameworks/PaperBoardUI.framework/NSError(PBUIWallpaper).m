@interface NSError(PBUIWallpaper)
- (uint64_t)pbui_isFileNotFoundError;
@end

@implementation NSError(PBUIWallpaper)

- (uint64_t)pbui_isFileNotFoundError
{
  v2 = [a1 domain];
  uint64_t v3 = [a1 code];
  if ([v2 isEqualToString:*MEMORY[0x1E4F28798]])
  {
    uint64_t v4 = v3 == 2;
  }
  else
  {
    unsigned int v5 = [v2 isEqualToString:*MEMORY[0x1E4F281F8]];
    if (v3 == 4) {
      uint64_t v4 = v5;
    }
    else {
      uint64_t v4 = 0;
    }
  }

  return v4;
}

@end