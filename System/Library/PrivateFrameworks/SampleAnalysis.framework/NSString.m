@interface NSString
- (void)copyLastPathComponent;
@end

@implementation NSString

- (void)copyLastPathComponent
{
  v1 = a1;
  if (a1)
  {
    unint64_t v2 = [a1 length];
    v3 = (char *)malloc_type_malloc(2 * v2, 0x1000040BDFB0063uLL);
    objc_msgSend(v1, "getCharacters:range:", v3, 0, v2);
    if (v2 >= 2)
    {
      uint64_t v5 = 0;
      v6 = &v3[2 * v2];
      while (v2 - 1 != v5)
      {
        int v7 = *((unsigned __int16 *)v6 - 2);
        v6 -= 2;
        ++v5;
        if (v7 == 47)
        {
          id v4 = (id)[[NSString alloc] initWithCharacters:v6 length:v5];
          goto LABEL_8;
        }
      }
    }
    id v4 = v1;
LABEL_8:
    v1 = v4;
    free(v3);
  }
  return v1;
}

@end