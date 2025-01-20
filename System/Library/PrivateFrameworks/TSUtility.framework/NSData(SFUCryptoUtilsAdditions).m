@interface NSData(SFUCryptoUtilsAdditions)
+ (SFUFileInputStream)dataWithContentsOfURL:()SFUCryptoUtilsAdditions decryptionKey:;
- (BOOL)writeToURL:()SFUCryptoUtilsAdditions encryptionKey:;
@end

@implementation NSData(SFUCryptoUtilsAdditions)

- (BOOL)writeToURL:()SFUCryptoUtilsAdditions encryptionKey:
{
  v6 = -[SFUFileOutputStream initWithPath:]([SFUFileOutputStream alloc], "initWithPath:", [a3 path]);
  if (!v6) {
    return 0;
  }
  v7 = v6;
  id v8 = [[SFUCryptoOutputStream alloc] initForEncryptionWithOutputStream:v6 key:a4];
  BOOL v9 = v8 != 0;
  if (v8)
  {
    v10 = v8;
    objc_msgSend(v8, "writeBuffer:size:", objc_msgSend(a1, "bytes"), objc_msgSend(a1, "length"));
  }
  return v9;
}

+ (SFUFileInputStream)dataWithContentsOfURL:()SFUCryptoUtilsAdditions decryptionKey:
{
  uint64_t v14 = 0;
  v6 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F08850], "defaultManager"), "attributesOfItemAtPath:error:", objc_msgSend(a3, "path"), &v14);
  v7 = -[SFUFileInputStream initWithPath:offset:length:]([SFUFileInputStream alloc], "initWithPath:offset:length:", [a3 path], 0, objc_msgSend((id)objc_msgSend(v6, "objectForKey:", *MEMORY[0x263F080B8]), "unsignedLongLongValue"));
  if (v7)
  {
    id v8 = [[SFUCryptoInputStream alloc] initForDecryptionWithInputStream:v7 key:a4];

    if (v8)
    {
      v7 = (SFUFileInputStream *)objc_alloc_init(MEMORY[0x263EFF990]);
      BOOL v9 = [[SFUMemoryOutputStream alloc] initWithData:v7];
      v10 = malloc_type_malloc(0x40007uLL, 0x318AAE9AuLL);
      uint64_t v11 = [v8 readToBuffer:v10 size:262151];
      if (v11)
      {
        uint64_t v12 = v11;
        do
        {
          [(SFUMemoryOutputStream *)v9 writeBuffer:v10 size:v12];
          uint64_t v12 = [v8 readToBuffer:v10 size:262151];
        }
        while (v12);
      }
    }
    else
    {
      v7 = 0;
    }
  }
  return v7;
}

@end