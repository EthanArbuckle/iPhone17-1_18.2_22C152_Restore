@interface NSData(Construction)
+ (id)dataWithIntBE:()Construction;
+ (id)dataWithLongBE:()Construction;
+ (id)dataWithReversedBytes:()Construction length:;
+ (id)dataWithShortBE:()Construction;
+ (uint64_t)randomData:()Construction;
@end

@implementation NSData(Construction)

+ (id)dataWithShortBE:()Construction
{
  __int16 v5 = __rev16(a3);
  v3 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v5 length:2];

  return v3;
}

+ (id)dataWithIntBE:()Construction
{
  unsigned int v5 = bswap32(a3);
  v3 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v5 length:4];

  return v3;
}

+ (id)dataWithLongBE:()Construction
{
  unint64_t v5 = bswap64(a3);
  v3 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v5 length:8];

  return v3;
}

+ (id)dataWithReversedBytes:()Construction length:
{
  id v4 = 0;
  if (a3)
  {
    uint64_t v5 = a4;
    if (a4)
    {
      id v4 = [MEMORY[0x1E4F1CA58] dataWithLength:a4];
      v7 = (unsigned char *)[v4 mutableBytes];
      do
        *v7++ = *(unsigned char *)(a3 - 1 + v5--);
      while (v5);
    }
  }

  return v4;
}

+ (uint64_t)randomData:()Construction
{
  id v4 = malloc_type_calloc(1uLL, size, 0xEC002F68uLL);
  arc4random_buf(v4, size);
  uint64_t v5 = (void *)MEMORY[0x1E4F1C9B8];

  return [v5 dataWithBytesNoCopy:v4 length:size freeWhenDone:1];
}

@end