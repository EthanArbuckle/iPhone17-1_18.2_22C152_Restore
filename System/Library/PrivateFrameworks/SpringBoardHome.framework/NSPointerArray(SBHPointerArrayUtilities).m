@interface NSPointerArray(SBHPointerArrayUtilities)
- (uint64_t)sbh_indexOfPointer:()SBHPointerArrayUtilities;
- (uint64_t)sbh_indexOfPointer:()SBHPointerArrayUtilities inRange:;
- (uint64_t)sbh_lastPointer;
- (uint64_t)sbh_removePointer:()SBHPointerArrayUtilities;
@end

@implementation NSPointerArray(SBHPointerArrayUtilities)

- (uint64_t)sbh_removePointer:()SBHPointerArrayUtilities
{
  uint64_t result = [a1 count];
  if (result)
  {
    uint64_t v6 = result;
    uint64_t v7 = 0;
    for (i = result; i != v7; uint64_t v6 = i - v7)
    {
      uint64_t result = objc_msgSend(a1, "sbh_indexOfPointer:inRange:", a3, v7, v6);
      if (result == 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      uint64_t v7 = result;
      uint64_t result = [a1 removePointerAtIndex:result];
      --i;
    }
  }
  return result;
}

- (uint64_t)sbh_indexOfPointer:()SBHPointerArrayUtilities
{
  uint64_t v5 = [a1 count];
  return objc_msgSend(a1, "sbh_indexOfPointer:inRange:", a3, 0, v5);
}

- (uint64_t)sbh_indexOfPointer:()SBHPointerArrayUtilities inRange:
{
  if (a4 >= a4 + a5) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v5 = a5;
  for (uint64_t i = a4; [a1 pointerAtIndex:i] != a3; ++i)
  {
    if (!--v5) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return i;
}

- (uint64_t)sbh_lastPointer
{
  uint64_t result = [a1 count];
  if (result)
  {
    return [a1 pointerAtIndex:result - 1];
  }
  return result;
}

@end