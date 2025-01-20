@interface GTFile
@end

@implementation GTFile

uint64_t __GTFile_append_block_invoke(uint64_t a1, int a2, int a3, void *__buf, size_t __nbyte)
{
  return 1;
}

uint64_t __GTFile_write_block_invoke(uint64_t a1, int a2, uint64_t a3, void *__buf, size_t __nbyte)
{
  return 1;
}

@end