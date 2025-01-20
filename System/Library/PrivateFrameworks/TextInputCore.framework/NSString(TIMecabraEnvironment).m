@interface NSString(TIMecabraEnvironment)
- (__CFString)longestCommonSubstring:()TIMecabraEnvironment backwards:;
- (uint64_t)TI_hasTruePrefix:()TIMecabraEnvironment;
- (uint64_t)TI_hasTrueSuffix:()TIMecabraEnvironment;
- (void)characters;
@end

@implementation NSString(TIMecabraEnvironment)

- (uint64_t)TI_hasTrueSuffix:()TIMecabraEnvironment
{
  id v4 = a3;
  unint64_t v5 = [a1 length];
  if (v5 <= [v4 length]) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = [a1 hasSuffix:v4];
  }

  return v6;
}

- (uint64_t)TI_hasTruePrefix:()TIMecabraEnvironment
{
  id v4 = a3;
  unint64_t v5 = [a1 length];
  if (v5 <= [v4 length]) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = [a1 hasPrefix:v4];
  }

  return v6;
}

- (__CFString)longestCommonSubstring:()TIMecabraEnvironment backwards:
{
  id v4 = a3;
  unint64_t v5 = [a1 length];
  uint64_t v6 = [v4 length];
  v7 = &stru_1F3F7A998;
  if (v5)
  {
    unint64_t v8 = v6;
    if (v6)
    {
      v9 = (unsigned __int16 *)[a1 characters];
      uint64_t v10 = [v4 characters];
      v11 = (void *)v10;
      unint64_t v12 = 0;
      unint64_t v13 = 0;
      uint64_t v14 = 0;
      uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
      do
      {
        int v16 = v9[v13];
        int v17 = *(unsigned __int16 *)(v10 + 2 * v12);
        if (v15 == 0x7FFFFFFFFFFFFFFFLL) {
          uint64_t v18 = v13;
        }
        else {
          uint64_t v18 = v15;
        }
        if (v16 == v17) {
          uint64_t v15 = v18;
        }
        else {
          uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
        }
        if (v16 == v17) {
          ++v14;
        }
        else {
          uint64_t v14 = 0;
        }
        if (v16 == v17) {
          ++v12;
        }
        else {
          unint64_t v12 = 0;
        }
        ++v13;
      }
      while (v13 < v5 && v12 < v8);
      if (v15 == 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v19 = 0;
      }
      else {
        uint64_t v19 = v14;
      }
      if (v19) {
        BOOL v20 = v15 == 0x7FFFFFFFFFFFFFFFLL;
      }
      else {
        BOOL v20 = 1;
      }
      if (v20 || v15 + v19 > (unint64_t)[a1 length])
      {
        v7 = &stru_1F3F7A998;
      }
      else
      {
        objc_msgSend(a1, "substringWithRange:", v15, v19);
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      free(v9);
      free(v11);
    }
  }

  return v7;
}

- (void)characters
{
  uint64_t v2 = [a1 length];
  v3 = malloc_type_malloc(2 * v2, 0x1000040BDFB0063uLL);
  objc_msgSend(a1, "getCharacters:range:", v3, 0, v2);
  return v3;
}

@end