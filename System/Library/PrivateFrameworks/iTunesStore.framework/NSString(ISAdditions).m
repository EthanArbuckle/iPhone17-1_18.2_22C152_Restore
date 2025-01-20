@interface NSString(ISAdditions)
- (uint64_t)copyUTF8StringOfLength:()ISAdditions;
@end

@implementation NSString(ISAdditions)

- (uint64_t)copyUTF8StringOfLength:()ISAdditions
{
  v5 = malloc_type_malloc(a3 + 1, 0x100004077774924uLL);
  if (!v5) {
    return 0;
  }
  v6 = v5;
  uint64_t v10 = 0;
  int v7 = objc_msgSend(a1, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v5, a3, &v10, 4, 0, 0, objc_msgSend(a1, "length"), 0);
  uint64_t v8 = 0;
  if (v7)
  {
    v6[v10] = 0;
    uint64_t v8 = [[NSString alloc] initWithUTF8String:v6];
  }
  free(v6);
  return v8;
}

@end