@interface NSFileHandle(mapped)
- (id)prs_mappedData;
@end

@implementation NSFileHandle(mapped)

- (id)prs_mappedData
{
  int v2 = [a1 fileDescriptor];
  memset(&v8, 0, sizeof(v8));
  if (fstat(v2, &v8) || (v4 = mmap(0, v8.st_size, 1, 1, v2, 0)) == 0)
  {
    v3 = [a1 readDataToEndOfFile];
  }
  else
  {
    v5 = v4;
    id v6 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    v3 = (void *)[v6 initWithBytesNoCopy:v5 length:v8.st_size deallocator:&__block_literal_global_0];
  }
  return v3;
}

@end