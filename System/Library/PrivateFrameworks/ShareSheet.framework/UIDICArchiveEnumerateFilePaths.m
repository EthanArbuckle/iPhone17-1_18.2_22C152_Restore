@interface UIDICArchiveEnumerateFilePaths
@end

@implementation UIDICArchiveEnumerateFilePaths

void ___UIDICArchiveEnumerateFilePaths_block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  v3 = [v7 fileType];
  v4 = (void *)*MEMORY[0x1E4F283C8];

  if (v3 == v4)
  {
    v5 = *(void **)(a1 + 32);
    v6 = [v7 pathInArchive];
    [v5 addObject:v6];
  }
}

@end