@interface NSData(SynapseExtensions)
- (uint64_t)_sy_containsUnsignedShort:()SynapseExtensions inRange:;
@end

@implementation NSData(SynapseExtensions)

- (uint64_t)_sy_containsUnsignedShort:()SynapseExtensions inRange:
{
  if (!a5) {
    return 0;
  }
  id v8 = a1;
  uint64_t v9 = [v8 bytes];
  if (*(unsigned __int16 *)(v9 + 2 * (a4 + a5) - 2) < a3
    || *(unsigned __int16 *)(v9 + 2 * a4) > a3)
  {
    return 0;
  }
  unsigned int v12 = *(unsigned __int16 *)(v9 + 2 * (a4 + (a5 >> 1)));
  if (v12 <= a3)
  {
    if (v12 >= a3) {
      return 1;
    }
    unint64_t v13 = a5 - (a5 >> 1);
    a4 += a5 >> 1;
  }
  else
  {
    unint64_t v13 = a5 >> 1;
  }

  return objc_msgSend(v8, "_sy_containsUnsignedShort:inRange:", a3, a4, v13);
}

@end