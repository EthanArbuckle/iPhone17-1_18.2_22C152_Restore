@interface NSData(Comparison)
- (BOOL)isAlLFF;
- (BOOL)isAll00;
- (BOOL)isEqualToBytes:()Comparison length:;
- (uint64_t)compare:()Comparison;
@end

@implementation NSData(Comparison)

- (BOOL)isEqualToBytes:()Comparison length:
{
  return [a1 length] == a4
      && memcmp((const void *)[a1 bytes], a3, a4) == 0;
}

- (uint64_t)compare:()Comparison
{
  id v4 = a3;
  id v5 = a1;
  v6 = (const void *)[v5 bytes];
  id v7 = v4;
  v8 = (const void *)[v7 bytes];
  unint64_t v9 = [v5 length];
  if (v9 >= [v7 length]) {
    v10 = v7;
  }
  else {
    v10 = v5;
  }
  int v11 = memcmp(v6, v8, [v10 length]);
  if (v11)
  {
    if (v11 > 0) {
      uint64_t v12 = 1;
    }
    else {
      uint64_t v12 = -1;
    }
  }
  else
  {
    uint64_t v13 = [v5 length];
    if (v13 == [v7 length])
    {
      uint64_t v12 = 0;
    }
    else
    {
      unint64_t v14 = [v5 length];
      if (v14 < [v7 length]) {
        uint64_t v12 = -1;
      }
      else {
        uint64_t v12 = 1;
      }
    }
  }

  return v12;
}

- (BOOL)isAlLFF
{
  id v1 = a1;
  v2 = (unsigned __int8 *)[v1 bytes];
  unint64_t v3 = [v1 length];
  if (!v3) {
    return 1;
  }
  if (*v2 != 255) {
    return 0;
  }
  uint64_t v5 = 1;
  do
  {
    unint64_t v6 = v5;
    if (v3 == v5) {
      break;
    }
    int v7 = v2[v5++];
  }
  while (v7 == 255);
  return v6 >= v3;
}

- (BOOL)isAll00
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

@end