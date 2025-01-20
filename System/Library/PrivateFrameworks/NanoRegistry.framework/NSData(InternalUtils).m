@interface NSData(InternalUtils)
- (uint64_t)matchesDataAtFilePath:()InternalUtils;
@end

@implementation NSData(InternalUtils)

- (uint64_t)matchesDataAtFilePath:()InternalUtils
{
  id v4 = a3;
  if (v4
    && ([MEMORY[0x1E4F28CB8] defaultManager],
        v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 fileExistsAtPath:v4],
        v5,
        v6))
  {
    v7 = [MEMORY[0x1E4F28CB0] fileHandleForReadingAtPath:v4];
    unsigned int v8 = 0;
    do
    {
      v9 = (void *)MEMORY[0x1A624A5B0]();
      unsigned int v10 = v8;
      [v7 seekToOffset:v8 error:0];
      v11 = [v7 readDataOfLength:1024];
      uint64_t v12 = [a1 length];
      uint64_t v13 = 1024;
      if (v12 - (unint64_t)v8 <= 0x400) {
        uint64_t v13 = [a1 length] - v8;
      }
      v14 = objc_msgSend(a1, "subdataWithRange:", v8, v13);
      int v15 = [v11 length];
      uint64_t v16 = [v11 isEqualToData:v14];

      if (!v16) {
        break;
      }
      unsigned int v8 = v15 + v10;
    }
    while ([a1 length] > (unint64_t)v8);
  }
  else
  {
    uint64_t v16 = 0;
  }

  return v16;
}

@end