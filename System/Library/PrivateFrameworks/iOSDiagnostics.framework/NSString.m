@interface NSString
- (id)stringByReplacingReservedURLCharactersUsingEncoding:(unint64_t)a3;
@end

@implementation NSString

- (id)stringByReplacingReservedURLCharactersUsingEncoding:(unint64_t)a3
{
  NSUInteger v4 = [(NSString *)self lengthOfBytesUsingEncoding:1];
  v5 = malloc_type_malloc(v4 + 1, 0x503CCAE0uLL);
  if (v5)
  {
    v6 = v5;
    [(NSString *)self getCString:v5 maxLength:v4 + 1 encoding:1];
    if (v4)
    {
      v7 = v6;
      do
      {
        int v8 = *v7;
        if ((v8 - 45) >= 2 && v8 != 95 && v8 != 126)
        {
          unsigned int v9 = v8 - 48;
          unsigned int v10 = (v8 & 0xFFFFFFDF) - 65;
          if (v9 >= 0xA && v10 >= 0x1A) {
            unsigned char *v7 = 95;
          }
        }
        ++v7;
        --v4;
      }
      while (v4);
    }
    v12 = +[NSString stringWithCString:v6 encoding:1];
    free(v6);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

@end