@interface NSString(HexString)
- (id)hexStringAsData;
@end

@implementation NSString(HexString)

- (id)hexStringAsData
{
  id v1 = a1;
  v2 = [MEMORY[0x263EFF990] dataWithCapacity:((unint64_t)[v1 length]) >> 1];
  __int16 v11 = 0;
  if ((unint64_t)[v1 length] >= 2)
  {
    unint64_t v4 = 0;
    uint64_t v5 = 1;
    uint64_t v6 = MEMORY[0x263EF8318];
    while (1)
    {
      unsigned __int8 v7 = [v1 characterAtIndex:v5 - 1];
      __str[0] = v7;
      char v8 = [v1 characterAtIndex:v5];
      __str[1] = v8;
      if ((v7 & 0x80) != 0) {
        break;
      }
      id v3 = 0;
      if ((*(_DWORD *)(v6 + 4 * v7 + 60) & 0x10000) == 0 || v8 < 0) {
        goto LABEL_11;
      }
      if ((*(_DWORD *)(v6 + 4 * v8 + 60) & 0x10000) == 0) {
        break;
      }
      HIBYTE(v11) = strtol(__str, 0, 16);
      [v2 appendBytes:(char *)&v11 + 1 length:1];
      ++v4;
      v5 += 2;
      if (v4 >= (unint64_t)[v1 length] >> 1) {
        goto LABEL_2;
      }
    }
    id v3 = 0;
  }
  else
  {
LABEL_2:
    id v3 = v2;
  }
LABEL_11:

  return v3;
}

@end