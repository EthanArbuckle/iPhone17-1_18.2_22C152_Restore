@interface NSData
- (id)hexString;
@end

@implementation NSData

- (id)hexString
{
  NSUInteger v3 = [(NSData *)self length];
  v4 = (char *)malloc_type_malloc(2 * v3, 0x193D21A2uLL);
  if (v4)
  {
    v5 = v4;
    if (v3)
    {
      uint64_t v6 = 0;
      v7 = v4 + 1;
      do
      {
        v8 = self;
        unsigned int v9 = *((unsigned __int8 *)[(NSData *)v8 bytes] + v6);
        if (v9 <= 0x9F) {
          char v10 = 48;
        }
        else {
          char v10 = 55;
        }
        *(v7 - 1) = v10 + (v9 >> 4);
        unsigned int v11 = *((unsigned char *)[(NSData *)v8 bytes] + v6) & 0xF;
        if (v11 <= 9) {
          char v12 = 48;
        }
        else {
          char v12 = 55;
        }
        unsigned char *v7 = v12 + v11;
        v7 += 2;
        ++v6;
      }
      while (v3 != v6);
    }
    id v13 = [objc_alloc((Class)NSString) initWithBytes:v5 length:2 * v3 encoding:1];
    free(v5);
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

@end