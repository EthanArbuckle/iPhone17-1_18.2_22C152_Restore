@interface NSEnumerator(NAAdditions)
- (BOOL)na_all:()NAAdditions;
- (BOOL)na_any:()NAAdditions;
- (NAFilterEnumerator)na_filter:()NAAdditions;
- (NAFlatMapEnumerator)na_map:()NAAdditions;
- (id)na_firstObjectPassingTest:()NAAdditions;
- (void)na_each:()NAAdditions;
@end

@implementation NSEnumerator(NAAdditions)

- (void)na_each:()NAAdditions
{
  v7 = a3;
  uint64_t v4 = [a1 nextObject];
  if (v4)
  {
    v5 = (void *)v4;
    do
    {
      v7[2](v7, v5);
      uint64_t v6 = [a1 nextObject];

      v5 = (void *)v6;
    }
    while (v6);
  }
}

- (id)na_firstObjectPassingTest:()NAAdditions
{
  uint64_t v4 = a3;
  v5 = 0;
  while (1)
  {
    uint64_t v6 = v5;
    v5 = [a1 nextObject];

    if (!v5) {
      break;
    }
    if (v4[2](v4, v5))
    {
      id v7 = v5;
      break;
    }
  }

  return v5;
}

- (NAFilterEnumerator)na_filter:()NAAdditions
{
  id v4 = a3;
  v5 = [[NAFilterEnumerator alloc] initWithEnumerator:a1 filter:v4];

  return v5;
}

- (NAFlatMapEnumerator)na_map:()NAAdditions
{
  id v4 = a3;
  v5 = [[NAFlatMapEnumerator alloc] initWithEnumerator:a1 map:v4];

  return v5;
}

- (BOOL)na_any:()NAAdditions
{
  id v4 = a3;
  v5 = 0;
  do
  {
    uint64_t v6 = v5;
    v5 = [a1 nextObject];
  }
  while (v5 && !v4[2](v4, v5));

  return v5 != 0;
}

- (BOOL)na_all:()NAAdditions
{
  id v4 = a3;
  v5 = 0;
  do
  {
    uint64_t v6 = v5;
    v5 = [a1 nextObject];
  }
  while (v5 && (v4[2](v4, v5) & 1) != 0);

  return v5 == 0;
}

@end