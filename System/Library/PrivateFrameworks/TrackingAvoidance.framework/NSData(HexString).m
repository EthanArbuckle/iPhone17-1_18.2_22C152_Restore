@interface NSData(HexString)
+ (id)dataWithHexString:()HexString;
- (__CFString)hexString;
@end

@implementation NSData(HexString)

+ (id)dataWithHexString:()HexString
{
  v3 = [a3 stringByReplacingOccurrencesOfString:@" " withString:&stru_26D677430];
  __str[2] = 0;
  v4 = malloc_type_malloc((unint64_t)[v3 length] >> 1, 0xC66B897uLL);
  if ([v3 length])
  {
    unint64_t v5 = 0;
    v6 = v4;
    do
    {
      __str[0] = [v3 characterAtIndex:v5];
      __str[1] = [v3 characterAtIndex:v5 + 1];
      v9 = 0;
      *v6++ = strtol(__str, &v9, 16);
      v5 += 2;
    }
    while (v5 < [v3 length]);
  }
  v7 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytesNoCopy:length:freeWhenDone:", v4, (unint64_t)objc_msgSend(v3, "length") >> 1, 1);

  return v7;
}

- (__CFString)hexString
{
  uint64_t v2 = [a1 length];
  if (v2 && (uint64_t v3 = v2, v4 = a1, [v4 bytes]))
  {
    uint64_t v5 = 2 * [v4 length];
    uint64_t v6 = 2 * v3;
    v7 = (char *)malloc_type_malloc((2 * v3) | 1, 0xC667C41CuLL);
    v7[v5] = 0;
    id v8 = v4;
    uint64_t v9 = [v8 bytes];
    if ([v8 length])
    {
      unint64_t v10 = 0;
      v11 = v7;
      do
      {
        sprintf(v11, "%02X", *(unsigned __int8 *)(v9 + v10++));
        v11 += 2;
      }
      while ([v8 length] > v10);
    }
    v12 = (__CFString *)[[NSString alloc] initWithBytesNoCopy:v7 length:v6 encoding:1 freeWhenDone:1];
  }
  else
  {
    v12 = &stru_26D677430;
  }
  return v12;
}

@end