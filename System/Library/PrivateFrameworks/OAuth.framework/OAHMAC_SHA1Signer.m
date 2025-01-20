@interface OAHMAC_SHA1Signer
+ (id)signatureForText:(id)a3 withKey:(id)a4;
@end

@implementation OAHMAC_SHA1Signer

+ (id)signatureForText:(id)a3 withKey:(id)a4
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v5 = (void *)[a4 dataUsingEncoding:4];
  v6 = (void *)[a3 dataUsingEncoding:4];
  CCHmac(0, (const void *)[v5 bytes], objc_msgSend(v5, "length"), (const void *)objc_msgSend(v6, "bytes"), objc_msgSend(v6, "length"), macOut);
  return (id)objc_msgSend((id)objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", macOut, 20), "base64EncodedStringWithOptions:", 0);
}

@end