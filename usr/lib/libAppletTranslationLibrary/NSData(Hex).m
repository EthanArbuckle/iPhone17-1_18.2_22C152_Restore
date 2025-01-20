@interface NSData(Hex)
+ (id)dataWithHexString:()Hex;
- (id)asHexString;
@end

@implementation NSData(Hex)

- (id)asHexString
{
  v2 = [MEMORY[0x1E4F28E78] stringWithCapacity:2 * [a1 length]];
  if ([a1 length])
  {
    unint64_t v3 = 0;
    do
    {
      id v4 = a1;
      [v2 appendFormat:@"%02X", *(unsigned __int8 *)(objc_msgSend(v4, "bytes") + v3++)]
    }
    while (v3 < [v4 length]);
  }

  return v2;
}

+ (id)dataWithHexString:()Hex
{
  id v3 = a3;
  uint64_t v4 = [v3 UTF8String];
  v5 = 0;
  if (v3)
  {
    uint64_t v6 = v4;
    if (v4)
    {
      if (([v3 length] & 1) == 0)
      {
        if ([v3 length])
        {
          char v13 = 0;
          v7 = malloc_type_malloc((unint64_t)[v3 length] >> 1, 0x2FE6748EuLL);
          bzero(v7, (unint64_t)[v3 length] >> 1);
          if ([v3 length])
          {
            unint64_t v8 = 0;
            uint64_t v9 = MEMORY[0x1E4F14390];
            while (1)
            {
              *(_WORD *)__str = *(_WORD *)(v6 + v8);
              if (__str[0] < 0
                || (*(_DWORD *)(v9 + 4 * __str[0] + 60) & 0x10000) == 0
                || *(__int16 *)__str < 0
                || (*(_DWORD *)(v9 + ((4 * __str[1]) & 0x3FFFFFFFCLL) + 60) & 0x10000) == 0)
              {
                break;
              }
              *((unsigned char *)v7 + (v8 >> 1)) = strtoul(__str, 0, 16);
              v8 += 2;
              if (v8 >= [v3 length]) {
                goto LABEL_12;
              }
            }
            free(v7);
            goto LABEL_16;
          }
LABEL_12:
          uint64_t v10 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v7 length:objc_msgSend(v3, "length") >> 1 freeWhenDone:1];
        }
        else
        {
          uint64_t v10 = [MEMORY[0x1E4F1C9B8] dataWithBytes:0 length:0];
        }
        v5 = (void *)v10;
        goto LABEL_17;
      }
LABEL_16:
      v5 = 0;
    }
  }
LABEL_17:

  return v5;
}

@end