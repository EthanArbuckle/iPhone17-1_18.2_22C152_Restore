@interface NSPointerArray(SystemApertureAdditions)
- (uint64_t)sa_compact;
- (uint64_t)sa_lastPointer;
@end

@implementation NSPointerArray(SystemApertureAdditions)

- (uint64_t)sa_compact
{
  uint64_t result = [a1 count];
  if (result)
  {
    char v3 = 0;
    uint64_t v4 = result - 1;
    do
    {
      if (![a1 pointerAtIndex:v4])
      {
        [a1 removePointerAtIndex:v4];
        char v3 = 1;
      }
      --v4;
    }
    while (v4 != -1);
    return v3 & 1;
  }
  return result;
}

- (uint64_t)sa_lastPointer
{
  objc_msgSend(a1, "sa_compact");
  uint64_t result = [a1 count];
  if (result)
  {
    return [a1 pointerAtIndex:result - 1];
  }
  return result;
}

@end