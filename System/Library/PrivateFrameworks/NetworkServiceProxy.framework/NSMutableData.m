@interface NSMutableData
- (void)appendType:(unsigned __int16)a3 length:(uint64_t)a4 value:;
- (void)enumerateTLVsUsingBlock:(void *)a1;
@end

@implementation NSMutableData

- (void)appendType:(unsigned __int16)a3 length:(uint64_t)a4 value:
{
  char v7 = a2;
  unsigned __int16 v6 = a3;
  if (result)
  {
    v5 = result;
    [result appendBytes:&v7 length:1];
    [v5 appendBytes:&v6 length:2];
    return (void *)[v5 appendBytes:a4 length:v6];
  }
  return result;
}

- (void)enumerateTLVsUsingBlock:(void *)a1
{
  v11 = a2;
  if (a1)
  {
    uint64_t v3 = 0;
    do
    {
      if (v3 + 3 > (unint64_t)[a1 length]) {
        break;
      }
      id v4 = a1;
      uint64_t v5 = *(unsigned __int8 *)([v4 bytes] + v3);
      id v6 = v4;
      uint64_t v7 = *(unsigned __int16 *)([v6 bytes] + v3 + 1);
      id v8 = v6;
      uint64_t v9 = [v8 bytes];
      if (v3 + 3 + v7 > (unint64_t)[v8 length]) {
        break;
      }
      char v10 = v11[2](v11, v5, v7, v9 + v3 + 3);
      v3 += 3 + v7;
    }
    while ((v10 & 1) != 0);
  }
}

@end