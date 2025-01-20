@interface NSData(Hexadecimal)
+ (id)mb_dataFromHexadecimalString:()Hexadecimal;
- (id)mb_base64EncodedFileSystemPathString;
- (id)mb_hexadecimalString;
@end

@implementation NSData(Hexadecimal)

+ (id)mb_dataFromHexadecimalString:()Hexadecimal
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = [v3 lowercaseString];

    v4 = objc_opt_new();
    __int16 v13 = 0;
    uint64_t v6 = [v5 length];
    unint64_t v7 = v6 - 1;
    if (v6 != 1)
    {
      unint64_t v8 = 0;
      do
      {
        unint64_t v9 = v8 + 1;
        unsigned __int8 v10 = [v5 characterAtIndex:v8];
        if ((char)v10 >= 48 && v10 <= 0x66u && v10 - 58 >= 0x27)
        {
          __str[0] = v10;
          __str[1] = [v5 characterAtIndex:v8 + 1];
          HIBYTE(v13) = strtol(__str, 0, 16);
          [v4 appendBytes:(char *)&v13 + 1 length:1];
          unint64_t v9 = v8 + 2;
        }
        unint64_t v8 = v9;
      }
      while (v9 < v7);
    }
  }
  return v4;
}

- (id)mb_hexadecimalString
{
  id v1 = a1;
  uint64_t v2 = [v1 bytes];
  if (v2)
  {
    id v3 = (unsigned __int8 *)v2;
    uint64_t v4 = [v1 length];
    for (i = [MEMORY[0x1E4F28E78] stringWithCapacity:2 * v4];
    {
      unsigned int v6 = *v3++;
      unint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"%02lx", v6);
      [i appendString:v7];
    }
    unint64_t v8 = [NSString stringWithString:i];
  }
  else
  {
    unint64_t v8 = [NSString string];
  }
  return v8;
}

- (id)mb_base64EncodedFileSystemPathString
{
  id v1 = [a1 base64EncodedStringWithOptions:0];
  uint64_t v2 = [v1 stringByReplacingOccurrencesOfString:@"+" withString:@"-"];

  id v3 = [v2 stringByReplacingOccurrencesOfString:@"/" withString:@"_"];

  return v3;
}

@end