@interface NSFileWrapper(SBFFileSizeCalculation)
- (uint64_t)sb_fileSize;
@end

@implementation NSFileWrapper(SBFFileSizeCalculation)

- (uint64_t)sb_fileSize
{
  if ([a1 isDirectory])
  {
    uint64_t v8 = 0;
    v9 = &v8;
    uint64_t v10 = 0x2020000000;
    uint64_t v11 = 0;
    v2 = [a1 fileWrappers];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __52__NSFileWrapper_SBFFileSizeCalculation__sb_fileSize__block_invoke;
    v7[3] = &unk_1E548D4F8;
    v7[4] = &v8;
    [v2 enumerateKeysAndObjectsUsingBlock:v7];

    uint64_t v3 = v9[3];
    _Block_object_dispose(&v8, 8);
  }
  else
  {
    if ([a1 isRegularFile])
    {
      v4 = [a1 regularFileContents];
      uint64_t v5 = [v4 length];

      return v5;
    }
    return 0;
  }
  return v3;
}

@end