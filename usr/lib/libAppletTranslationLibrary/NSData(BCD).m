@interface NSData(BCD)
- (uint64_t)decodeBCD;
- (uint64_t)decodeBCDAtOffset:()BCD length:;
- (uint64_t)encodeBCD;
- (uint64_t)encodeBCDAtOffset:()BCD length:;
@end

@implementation NSData(BCD)

- (uint64_t)decodeBCDAtOffset:()BCD length:
{
  v6 = NSNumber;
  uint64_t v7 = [a1 bytes];
  uint64_t v8 = 0;
  if (a4)
  {
    v9 = (unsigned __int8 *)(v7 + a3);
    do
    {
      unsigned int v10 = *v9++;
      uint64_t v8 = (v10 & 0xF) + 100 * v8 + 10 * (v10 >> 4);
      --a4;
    }
    while (a4);
  }

  return [v6 numberWithUnsignedLongLong:v8];
}

- (uint64_t)decodeBCD
{
  v1 = NSNumber;
  id v2 = a1;
  v3 = (unsigned __int8 *)[v2 bytes];
  uint64_t v4 = [v2 length];
  for (uint64_t i = 0; v4; --v4)
  {
    unsigned int v6 = *v3++;
    uint64_t i = (v6 & 0xF) + 100 * i + 10 * (v6 >> 4);
  }

  return [v1 numberWithUnsignedLongLong:i];
}

- (uint64_t)encodeBCDAtOffset:()BCD length:
{
  uint64_t v4 = NSNumber;
  uint64_t v5 = EncodeBCD((unsigned __int8 *)([a1 bytes] + a3), a4);

  return [v4 numberWithUnsignedLongLong:v5];
}

- (uint64_t)encodeBCD
{
  v1 = NSNumber;
  id v2 = a1;
  uint64_t v3 = EncodeBCD((unsigned __int8 *)[v2 bytes], [v2 length]);

  return [v1 numberWithUnsignedLongLong:v3];
}

@end