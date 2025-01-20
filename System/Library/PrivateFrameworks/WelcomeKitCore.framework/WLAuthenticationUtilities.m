@interface WLAuthenticationUtilities
+ (id)dataFromPEMFormattedData:(id)a3;
+ (id)hashWithString:(id)a3;
+ (id)pemFormattedCertificateData:(id)a3;
+ (void)_appendBase64Data:(id)a3 toString:(id)a4;
+ (void)generateSelfSignedCertificateWithOrganization:(id)a3 commonName:(id)a4 completion:(id)a5;
@end

@implementation WLAuthenticationUtilities

+ (id)hashWithString:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = [a3 dataUsingEncoding:4];
  CC_SHA1((const void *)[v3 bytes], objc_msgSend(v3, "length"), md);
  v4 = [MEMORY[0x263F089D8] string];
  for (uint64_t i = 0; i != 20; ++i)
    objc_msgSend(v4, "appendFormat:", @"%02x", md[i]);
  v6 = (void *)[v4 copy];

  return v6;
}

+ (void)generateSelfSignedCertificateWithOrganization:(id)a3 commonName:(id)a4 completion:(id)a5
{
  values[2] = *(void **)MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = (void (**)(id, uint64_t, SecKeyRef, __SecKey *))a5;
  v10 = NSDictionary;
  uint64_t v11 = *MEMORY[0x263F16FE0];
  uint64_t v12 = *MEMORY[0x263F16FA8];
  v13 = [NSNumber numberWithInt:2048];
  objc_msgSend(v10, "dictionaryWithObjectsAndKeys:", v11, v12, v13, *MEMORY[0x263F16F98], 0);
  CFDictionaryRef v14 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  RandomKey = SecKeyCreateRandomKey(v14, 0);
  SecKeyRef v16 = SecKeyCopyPublicKey(RandomKey);
  values[0] = *(void **)MEMORY[0x263F17430];
  values[1] = v7;
  v26[0] = *(void **)MEMORY[0x263F17420];
  v26[1] = v8;
  CFAllocatorRef v17 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFTypeRef v23 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (const void **)values, 2, 0);
  CFTypeRef v22 = CFArrayCreate(v17, (const void **)v26, 2, 0);
  CFTypeRef cf = CFArrayCreate(v17, &v23, 1, 0);
  CFTypeRef v25 = CFArrayCreate(v17, &v22, 1, 0);
  CFArrayRef v18 = CFArrayCreate(v17, &cf, 2, 0);
  id v19 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v20 = [NSNumber numberWithUnsignedInt:127];
  [v19 setObject:v20 forKey:*MEMORY[0x263F171B0]];

  [v19 setObject:*MEMORY[0x263F17160] forKey:*MEMORY[0x263F17180]];
  uint64_t SelfSignedCertificate = SecGenerateSelfSignedCertificate();
  if (cf) {
    CFRelease(cf);
  }
  if (v25) {
    CFRelease(v25);
  }
  if (v18) {
    CFRelease(v18);
  }
  if (v22) {
    CFRelease(v22);
  }
  if (v23) {
    CFRelease(v23);
  }
  if (v9) {
    v9[2](v9, SelfSignedCertificate, v16, RandomKey);
  }
}

+ (id)pemFormattedCertificateData:(id)a3
{
  v4 = (void *)MEMORY[0x263F089D8];
  id v5 = a3;
  v6 = [v4 string];
  [v6 appendString:@"-----BEGIN CERTIFICATE-----\n"];
  [a1 _appendBase64Data:v5 toString:v6];

  [v6 appendString:@"\n-----END CERTIFICATE-----\n"];
  id v7 = [v6 dataUsingEncoding:4];

  return v7;
}

+ (void)_appendBase64Data:(id)a3 toString:(id)a4
{
  id v5 = a4;
  id v6 = [a3 base64EncodedStringWithOptions:33];
  [v5 appendString:v6];
}

+ (id)dataFromPEMFormattedData:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = (void *)[[NSString alloc] initWithData:v3 encoding:4];
  id v5 = [v4 componentsSeparatedByString:@"\n"];
  id v6 = objc_msgSend(MEMORY[0x263F089D8], "stringWithCapacity:", objc_msgSend(v3, "length"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ((objc_msgSend(v12, "hasPrefix:", @"-----", (void)v15) & 1) == 0) {
          [v6 appendString:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  v13 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v6 options:1];
  return v13;
}

@end