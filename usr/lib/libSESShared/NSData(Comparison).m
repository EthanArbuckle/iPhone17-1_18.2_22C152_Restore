@interface NSData(Comparison)
- (BOOL)ses_isAllZero;
- (BOOL)ses_isEqualToBytes:()Comparison length:;
- (uint64_t)ses_isEqualToHexCString:()Comparison;
@end

@implementation NSData(Comparison)

- (BOOL)ses_isAllZero
{
  id v1 = a1;
  v2 = (unsigned char *)[v1 bytes];
  unint64_t v3 = [v1 length];
  if (!v3) {
    return 1;
  }
  if (*v2) {
    return 0;
  }
  uint64_t v5 = 1;
  do
  {
    unint64_t v6 = v5;
    if (v3 == v5) {
      break;
    }
    ++v5;
  }
  while (!v2[v6]);
  return v6 >= v3;
}

- (BOOL)ses_isEqualToBytes:()Comparison length:
{
  if ([a1 length] != a4) {
    return 0;
  }
  id v6 = a1;
  return memcmp((const void *)[v6 bytes], a3, [v6 length]) == 0;
}

- (uint64_t)ses_isEqualToHexCString:()Comparison
{
  if (!a3) {
    return 0;
  }
  uint64_t v5 = [a1 length];
  size_t v6 = strlen(a3);
  uint64_t result = 0;
  if ((v6 & 1) == 0 && v6 == 2 * v5)
  {
    char v14 = 0;
    uint64_t v8 = [a1 bytes];
    if (v6)
    {
      uint64_t v9 = v8;
      size_t v10 = 0;
      uint64_t v11 = MEMORY[0x263EF8318];
      while (1)
      {
        *(_WORD *)__str = *(_WORD *)&a3[v10];
        if (__str[0] < 0) {
          break;
        }
        uint64_t result = 0;
        if ((*(_DWORD *)(v11 + 4 * __str[0] + 60) & 0x10000) == 0 || *(__int16 *)__str < 0) {
          return result;
        }
        if ((*(_DWORD *)(v11 + ((4 * __str[1]) & 0x3FFFFFFFCLL) + 60) & 0x10000) == 0) {
          break;
        }
        int v12 = *(unsigned __int8 *)(v9 + (v10 >> 1));
        if (v12 != strtoul(__str, 0, 16)) {
          break;
        }
        v10 += 2;
        if (v10 >= v6) {
          return 1;
        }
      }
      return 0;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

@end