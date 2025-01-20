@interface PGObfuscation
+ (id)obfuscatedStringFromPlaintextDate:(id)a3 usingDateFormatter:(id)a4;
+ (id)obfuscatedStringFromPlaintextNumber:(id)a3;
+ (id)obfuscatedStringFromPlaintextString:(id)a3;
+ (id)plaintextDateFromObfuscatedString:(id)a3 usingDateFormatter:(id)a4;
+ (id)plaintextNumberFromObfuscatedString:(id)a3;
+ (id)plaintextStringFromObfuscatedString:(id)a3;
@end

@implementation PGObfuscation

+ (id)plaintextDateFromObfuscatedString:(id)a3 usingDateFormatter:(id)a4
{
  id v5 = a4;
  v6 = +[PGObfuscation plaintextStringFromObfuscatedString:a3];
  if (v6)
  {
    v7 = [v5 dateFromString:v6];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)obfuscatedStringFromPlaintextDate:(id)a3 usingDateFormatter:(id)a4
{
  if (a3)
  {
    v4 = objc_msgSend(a4, "stringFromDate:");
    id v5 = +[PGObfuscation obfuscatedStringFromPlaintextString:v4];
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

+ (id)plaintextNumberFromObfuscatedString:(id)a3
{
  id v3 = a3;
  v4 = [@"aE45Bhwo2Wf4re1A" dataUsingEncoding:4];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v3 options:0];

  v6 = objc_msgSend(MEMORY[0x1E4F1CA58], "dataWithLength:", objc_msgSend(v5, "length") + 16);
  size_t v18 = 0;
  id v7 = v4;
  v8 = (const void *)[v7 bytes];
  id v9 = v5;
  v10 = (const void *)[v9 bytes];
  size_t v11 = [v9 length];
  id v12 = v6;
  v13 = 0;
  if (!CCCrypt(1u, 0, 1u, v8, 0x10uLL, 0, v10, v11, (void *)[v12 bytes], objc_msgSend(v12, "length"), &v18))
  {
    [v12 setLength:v18];
    v14 = (void *)[[NSString alloc] initWithData:v12 encoding:4];
    v15 = v14;
    if (v14)
    {
      v16 = NSNumber;
      [v14 doubleValue];
      v13 = objc_msgSend(v16, "numberWithDouble:");
    }
    else
    {
      v13 = 0;
    }
  }
  return v13;
}

+ (id)obfuscatedStringFromPlaintextNumber:(id)a3
{
  id v3 = [a3 stringValue];
  v4 = [@"aE45Bhwo2Wf4re1A" dataUsingEncoding:4];
  id v5 = [v3 dataUsingEncoding:4];
  v6 = objc_msgSend(MEMORY[0x1E4F1CA58], "dataWithLength:", objc_msgSend(v5, "length") + 16);
  size_t v16 = 0;
  id v7 = v4;
  v8 = (const void *)[v7 bytes];
  id v9 = v5;
  v10 = (const void *)[v9 bytes];
  size_t v11 = [v9 length];
  id v12 = v6;
  CCCryptorStatus v13 = CCCrypt(0, 0, 1u, v8, 0x10uLL, 0, v10, v11, (void *)[v12 bytes], objc_msgSend(v12, "length"), &v16);
  v14 = 0;
  if (!v13)
  {
    [v12 setLength:v16];
    v14 = [v12 base64EncodedStringWithOptions:0];
  }

  return v14;
}

+ (id)plaintextStringFromObfuscatedString:(id)a3
{
  id v3 = a3;
  v4 = [@"aE45Bhwo2Wf4re1A" dataUsingEncoding:4];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v3 options:0];

  v6 = objc_msgSend(MEMORY[0x1E4F1CA58], "dataWithLength:", objc_msgSend(v5, "length") + 16);
  size_t v15 = 0;
  id v7 = v4;
  v8 = (const void *)[v7 bytes];
  id v9 = v5;
  v10 = (const void *)[v9 bytes];
  size_t v11 = [v9 length];
  id v12 = v6;
  CCCryptorStatus v13 = 0;
  if (!CCCrypt(1u, 0, 1u, v8, 0x10uLL, 0, v10, v11, (void *)[v12 bytes], objc_msgSend(v12, "length"), &v15))
  {
    [v12 setLength:v15];
    CCCryptorStatus v13 = (void *)[[NSString alloc] initWithData:v12 encoding:4];
  }

  return v13;
}

+ (id)obfuscatedStringFromPlaintextString:(id)a3
{
  id v3 = a3;
  v4 = [@"aE45Bhwo2Wf4re1A" dataUsingEncoding:4];
  id v5 = [v3 dataUsingEncoding:4];

  v6 = objc_msgSend(MEMORY[0x1E4F1CA58], "dataWithLength:", objc_msgSend(v5, "length") + 16);
  size_t v15 = 0;
  id v7 = v4;
  v8 = (const void *)[v7 bytes];
  id v9 = v5;
  v10 = (const void *)[v9 bytes];
  size_t v11 = [v9 length];
  id v12 = v6;
  CCCryptorStatus v13 = 0;
  if (!CCCrypt(0, 0, 1u, v8, 0x10uLL, 0, v10, v11, (void *)[v12 bytes], objc_msgSend(v12, "length"), &v15))
  {
    [v12 setLength:v15];
    CCCryptorStatus v13 = [v12 base64EncodedStringWithOptions:0];
  }

  return v13;
}

@end