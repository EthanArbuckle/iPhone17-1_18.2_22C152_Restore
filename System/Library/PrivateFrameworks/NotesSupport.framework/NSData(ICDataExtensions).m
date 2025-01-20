@interface NSData(ICDataExtensions)
+ (id)ic_dataFromHexString:()ICDataExtensions;
+ (id)ic_dataWithUnsignedInteger:()ICDataExtensions;
+ (id)ic_randomDataOfLength:()ICDataExtensions error:;
+ (uint64_t)ic_dataWithBoolean:()ICDataExtensions;
+ (uint64_t)ic_nullableData:()ICDataExtensions isEqualToNullableData:;
+ (uint64_t)ic_random128BitData:()ICDataExtensions;
+ (uint64_t)ic_random256BitData:()ICDataExtensions;
- (BOOL)ic_BOOLValue;
- (id)ic_md5;
- (id)ic_sha256;
- (id)ic_stringValue;
- (uint64_t)ic_unsignedIntegerValue;
@end

@implementation NSData(ICDataExtensions)

- (id)ic_md5
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  memset(&c, 0, sizeof(c));
  CC_MD5_Init(&c);
  id v2 = a1;
  CC_MD5_Update(&c, (const void *)[v2 bytes], objc_msgSend(v2, "length"));
  CC_MD5_Final(md, &c);
  v3 = [MEMORY[0x263F089D8] string];
  for (uint64_t i = 0; i != 16; ++i)
  {
    unsigned int v5 = md[i];
    LODWORD(v6) = (v5 >> 4) + 87;
    if (v5 >= 0xA0) {
      uint64_t v6 = v6;
    }
    else {
      uint64_t v6 = (v5 >> 4) | 0x30;
    }
    unsigned int v7 = v5 & 0xF;
    LODWORD(v8) = v7 + 87;
    if (v7 >= 0xA) {
      uint64_t v8 = v8;
    }
    else {
      uint64_t v8 = v7 | 0x30;
    }
    objc_msgSend(v3, "appendFormat:", @"%c%c", v6, v8);
  }
  return v3;
}

- (id)ic_sha256
{
  id v2 = [MEMORY[0x263EFF990] dataWithLength:32];
  id v3 = a1;
  v4 = (const void *)[v3 bytes];
  LODWORD(v3) = [v3 length];
  id v5 = v2;
  CC_SHA256(v4, (CC_LONG)v3, (unsigned __int8 *)[v5 mutableBytes]);
  uint64_t v6 = [v5 base64EncodedStringWithOptions:0];

  return v6;
}

- (id)ic_stringValue
{
  v1 = (void *)[[NSString alloc] initWithData:a1 encoding:4];
  return v1;
}

- (BOOL)ic_BOOLValue
{
  return objc_msgSend(a1, "ic_unsignedIntegerValue") != 0;
}

+ (uint64_t)ic_dataWithBoolean:()ICDataExtensions
{
  return objc_msgSend(a1, "ic_dataWithUnsignedInteger:", a3);
}

- (uint64_t)ic_unsignedIntegerValue
{
  uint64_t v4 = 0;
  uint64_t v2 = [a1 length];
  uint64_t result = 0;
  if (v2 == 8)
  {
    [a1 getBytes:&v4 length:8];
    return v4;
  }
  return result;
}

+ (id)ic_dataWithUnsignedInteger:()ICDataExtensions
{
  uint64_t v5 = a3;
  id v3 = [MEMORY[0x263EFF8F8] dataWithBytes:&v5 length:8];
  return v3;
}

+ (uint64_t)ic_nullableData:()ICDataExtensions isEqualToNullableData:
{
  if (a3 | a4) {
    return [(id)a3 isEqualToData:a4];
  }
  else {
    return 1;
  }
}

+ (id)ic_randomDataOfLength:()ICDataExtensions error:
{
  uint64_t v6 = objc_msgSend(MEMORY[0x263EFF990], "dataWithLength:");
  unsigned int v7 = (const __SecRandom *)*MEMORY[0x263F17510];
  id v8 = v6;
  if (SecRandomCopyBytes(v7, a3, (void *)[v8 mutableBytes]))
  {
    if (a4)
    {
      [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:*__error() userInfo:0];
      id v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
  }
  else if ([v8 length] == a3)
  {
    id v9 = v8;
    goto LABEL_7;
  }
  id v9 = 0;
LABEL_7:

  return v9;
}

+ (uint64_t)ic_random128BitData:()ICDataExtensions
{
  uint64_t v4 = objc_opt_class();
  return objc_msgSend(v4, "ic_randomDataOfLength:error:", 16, a3);
}

+ (uint64_t)ic_random256BitData:()ICDataExtensions
{
  uint64_t v4 = objc_opt_class();
  return objc_msgSend(v4, "ic_randomDataOfLength:error:", 32, a3);
}

+ (id)ic_dataFromHexString:()ICDataExtensions
{
  id v3 = [a3 stringByReplacingOccurrencesOfString:@" " withString:&stru_26C13B138];
  if ([v3 length]) {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "hexString.length % 2 == 0", "+[NSData(ICDataExtensions) ic_dataFromHexString:]", 1, 0, @"Hex string must have an even length");
  }
  id v4 = objc_alloc_init(MEMORY[0x263EFF990]);
  __int16 v9 = 0;
  if ((unint64_t)[v3 length] >= 2)
  {
    unint64_t v5 = 0;
    uint64_t v6 = 1;
    do
    {
      __str[0] = [v3 characterAtIndex:v6 - 1];
      __str[1] = [v3 characterAtIndex:v6];
      HIBYTE(v9) = strtol(__str, 0, 16);
      [v4 appendBytes:(char *)&v9 + 1 length:1];
      ++v5;
      v6 += 2;
    }
    while (v5 < (unint64_t)[v3 length] >> 1);
  }

  return v4;
}

@end