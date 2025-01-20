@interface NSData(SBHexRepresentation)
- (char)sbf_hexadecimalEncodedString;
@end

@implementation NSData(SBHexRepresentation)

- (char)sbf_hexadecimalEncodedString
{
  uint64_t v2 = [a1 length];
  if (v2 < 0)
  {
    v5 = 0;
  }
  else
  {
    uint64_t v3 = v2;
    uint64_t v4 = 2 * v2;
    v5 = (char *)malloc_type_malloc(2 * v2, 0x23A589DEuLL);
    if (v5)
    {
      v6 = v5;
      v7 = (unsigned __int8 *)[a1 bytes];
      if (v3)
      {
        v8 = v6 + 1;
        do
        {
          unsigned int v9 = *v7++;
          *(v8 - 1) = a0123456789abcd[(unint64_t)v9 >> 4];
          unsigned char *v8 = a0123456789abcd[v9 & 0xF];
          v8 += 2;
          --v3;
        }
        while (v3);
      }
      v5 = (char *)[[NSString alloc] initWithBytesNoCopy:v6 length:v4 encoding:1 freeWhenDone:1];
    }
  }
  return v5;
}

@end