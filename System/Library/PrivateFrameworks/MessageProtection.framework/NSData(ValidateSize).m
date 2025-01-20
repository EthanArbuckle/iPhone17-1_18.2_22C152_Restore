@interface NSData(ValidateSize)
- (id)lengthValidatedBuffer;
@end

@implementation NSData(ValidateSize)

- (id)lengthValidatedBuffer
{
  unsigned __int16 v7 = 0;
  id v1 = a1;
  uint64_t v6 = [v1 bytes];
  unint64_t v5 = [v1 length];
  int v2 = readSize(&v6, (uint64_t *)&v5, &v7, 0);
  v3 = 0;
  if (!v2)
  {
    if (v5 >= v7)
    {
      v3 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", v6);
    }
    else
    {
      v3 = 0;
    }
  }
  return v3;
}

@end