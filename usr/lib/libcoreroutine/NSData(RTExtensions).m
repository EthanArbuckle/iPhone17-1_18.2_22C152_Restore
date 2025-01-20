@interface NSData(RTExtensions)
- (id)hexDescription;
- (id)hexString;
- (id)hmacSha1WithKey:()RTExtensions;
- (id)md5;
- (void)initWithHexString:()RTExtensions;
@end

@implementation NSData(RTExtensions)

- (id)hexDescription
{
  id v1 = a1;
  uint64_t v2 = [v1 bytes];
  v3 = [MEMORY[0x1E4F28E78] stringWithCapacity:2 * [v1 length] + 2];
  [v3 appendFormat:@"0x"];
  if ([v1 length])
  {
    unint64_t v4 = 0;
    do
      [v3 appendFormat:@"%02x", *(unsigned __int8 *)(v2 + v4++)]
    while ([v1 length] > v4);
  }
  v5 = [NSString stringWithString:v3];

  return v5;
}

- (id)hexString
{
  id v1 = a1;
  uint64_t v2 = [v1 bytes];
  v3 = [MEMORY[0x1E4F28E78] stringWithCapacity:2 * [v1 length]];
  if ([v1 length])
  {
    unint64_t v4 = 0;
    do
      [v3 appendFormat:@"%02x", *(unsigned __int8 *)(v2 + v4++)];
    while ([v1 length] > v4);
  }
  v5 = [NSString stringWithString:v3];

  return v5;
}

- (id)md5
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  CC_MD5((const void *)[v1 bytes], [v1 length], md);
  uint64_t v2 = [MEMORY[0x1E4F1C9B8] dataWithBytes:md length:16];

  return v2;
}

- (id)hmacSha1WithKey:()RTExtensions
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v4 = a3;
    uint64_t v5 = (const void *)[v4 bytes];
    size_t v6 = [v4 length];

    id v7 = a1;
    CCHmac(0, v5, v6, (const void *)[v7 bytes], [v7 length], macOut);
    v8 = [MEMORY[0x1E4F1C9B8] dataWithBytes:macOut length:20];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)initWithHexString:()RTExtensions
{
  id v4 = [a3 stringByReplacingOccurrencesOfString:@" " withString:&stru_1F33EAD88];
  uint64_t v5 = objc_opt_new();
  __int16 v10 = 0;
  if ((unint64_t)[v4 length] >= 2)
  {
    unint64_t v6 = 0;
    uint64_t v7 = 1;
    do
    {
      __str[0] = [v4 characterAtIndex:v7 - 1];
      __str[1] = [v4 characterAtIndex:v7];
      HIBYTE(v10) = strtol(__str, 0, 16);
      [v5 appendBytes:(char *)&v10 + 1 length:1];
      ++v6;
      v7 += 2;
    }
    while (v6 < (unint64_t)[v4 length] >> 1);
  }

  return v5;
}

@end