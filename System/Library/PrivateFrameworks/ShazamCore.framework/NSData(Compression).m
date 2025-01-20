@interface NSData(Compression)
- (uint64_t)sh_rangeOfData:()Compression;
@end

@implementation NSData(Compression)

- (uint64_t)sh_rangeOfData:()Compression
{
  id v4 = a3;
  id v5 = a1;
  uint64_t v6 = [v5 bytes];
  uint64_t v7 = [v5 length];
  id v8 = v4;
  uint64_t v9 = [v8 bytes];
  unint64_t v10 = [v8 length];
  if (v7)
  {
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
    while (1)
    {
      if (*(unsigned __int8 *)(v6 + v11) == *(unsigned __int8 *)(v9 + v12))
      {
        if (v13 == 0x7FFFFFFFFFFFFFFFLL) {
          uint64_t v13 = v11;
        }
        if (++v12 >= v10) {
          goto LABEL_12;
        }
      }
      else
      {
        uint64_t v12 = 0;
        uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
      }
      if (v7 == ++v11) {
        goto LABEL_12;
      }
    }
  }
  uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_12:

  return v13;
}

@end