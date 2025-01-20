@interface NSFileManager(Size)
- (uint64_t)mk_fileSizeAtPath:()Size;
@end

@implementation NSFileManager(Size)

- (uint64_t)mk_fileSizeAtPath:()Size
{
  uint64_t v8 = 0;
  v3 = [a1 attributesOfItemAtPath:a3 error:&v8];
  v4 = v3;
  uint64_t v5 = 0;
  if (!v8)
  {
    v6 = [v3 objectForKey:*MEMORY[0x263F080B8]];
    uint64_t v5 = [v6 unsignedLongLongValue];
  }
  return v5;
}

@end