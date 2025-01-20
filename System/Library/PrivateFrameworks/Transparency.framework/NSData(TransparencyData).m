@interface NSData(TransparencyData)
+ (id)kt_dataWithHexString:()TransparencyData;
+ (id)kt_dataWithUint64:()TransparencyData length:;
+ (id)kt_random;
- (__CFString)kt_hexString;
- (id)kt_sha256;
- (id)kt_sha256WithSalt:()TransparencyData;
@end

@implementation NSData(TransparencyData)

+ (id)kt_dataWithHexString:()TransparencyData
{
  if (__s)
  {
    char v13 = 0;
    *(_WORD *)__str = 0;
    size_t v4 = strlen(__s);
    v5 = malloc_type_malloc(v4 >> 1, 0xB89A162EuLL);
    v6 = v5;
    if (v4)
    {
      size_t v7 = 0;
      v8 = v5;
      do
      {
        *(_WORD *)__str = *(_WORD *)&__s[v7];
        v11 = 0;
        *v8++ = strtol(__str, &v11, 16);
        v7 += 2;
      }
      while (v7 < v4);
    }
    v9 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:v6 length:v4 >> 1];
    free(v6);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (__CFString)kt_hexString
{
  if ([a1 length])
  {
    objc_msgSend(MEMORY[0x263F089D8], "stringWithCapacity:", 2 * objc_msgSend(a1, "length"));
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if ([a1 length])
    {
      unint64_t v3 = 0;
      do
      {
        id v4 = a1;
        -[__CFString appendFormat:](v2, "appendFormat:", @"%02X", *(unsigned __int8 *)([v4 bytes] + v3++));
      }
      while (v3 < [v4 length]);
    }
  }
  else
  {
    v2 = &stru_26DA0B3F0;
  }

  return v2;
}

- (id)kt_sha256
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  ccsha256_di();
  objc_msgSend(a1, "length", (unsigned __int128)0, (unsigned __int128)0);
  [a1 bytes];
  ccdigest();
  v2 = [MEMORY[0x263EFF8F8] dataWithBytes:&v4 length:32];

  return v2;
}

- (id)kt_sha256WithSalt:()TransparencyData
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x263EFF990] data];
    v6 = objc_msgSend(MEMORY[0x263EFF8F8], "kt_dataWithUint64:length:", objc_msgSend(v4, "length"), 8);
    [v5 appendData:v6];

    [v5 appendData:v4];
    size_t v7 = objc_msgSend(MEMORY[0x263EFF8F8], "kt_dataWithUint64:length:", objc_msgSend(a1, "length"), 8);
    [v5 appendData:v7];

    [v5 appendData:a1];
    v8 = objc_msgSend(v5, "kt_sha256");
  }
  else
  {
    v8 = objc_msgSend(a1, "kt_sha256");
  }

  return v8;
}

+ (id)kt_random
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  memset(v2, 0, sizeof(v2));
  SecRandomCopyBytes((SecRandomRef)*MEMORY[0x263F17510], 0x20uLL, v2);
  v0 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:v2 length:32];

  return v0;
}

+ (id)kt_dataWithUint64:()TransparencyData length:
{
  v6 = [MEMORY[0x263EFF990] dataWithLength:a4];
  uint64_t v7 = 8;
  if (a4 < 8) {
    uint64_t v7 = a4;
  }
  if (v7)
  {
    uint64_t v8 = 0;
    uint64_t v9 = 8 * v7;
    unint64_t v10 = a4 - 1;
    do
    {
      char v12 = a3 >> v8;
      objc_msgSend(v6, "replaceBytesInRange:withBytes:", v10, 1, &v12);
      v8 += 8;
      --v10;
    }
    while (v9 != v8);
  }

  return v6;
}

@end