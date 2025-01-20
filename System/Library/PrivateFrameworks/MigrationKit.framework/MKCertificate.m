@interface MKCertificate
- (MKCertificate)init;
- (MKCertificate)initWithPEM:(id)a3;
- (MKCertificate)initWithTrust:(__SecTrust *)a3;
- (NSData)certificate;
- (NSData)digest;
- (__SecIdentity)identity;
- (id)dataFromPEMFormattedData:(id)a3;
- (id)encodedCertificate;
- (id)pemFormattedCertificateData:(id)a3;
- (void)_appendBase64Data:(id)a3 toString:(id)a4;
- (void)dealloc;
- (void)generateCertificate;
- (void)setCertificate:(id)a3;
- (void)setDigest:(id)a3;
- (void)setIdentity:(__SecIdentity *)a3;
@end

@implementation MKCertificate

- (MKCertificate)init
{
  v5.receiver = self;
  v5.super_class = (Class)MKCertificate;
  v2 = [(MKCertificate *)&v5 init];
  v3 = v2;
  if (v2) {
    [(MKCertificate *)v2 generateCertificate];
  }
  return v3;
}

- (MKCertificate)initWithPEM:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MKCertificate;
  objc_super v5 = [(MKCertificate *)&v9 init];
  if (v5)
  {
    v6 = (const void *)SecCertificateCreateWithPEM();
    v7 = (void *)SecCertificateCopySHA256Digest();
    [(MKCertificate *)v5 setDigest:v7];

    CFRelease(v6);
  }

  return v5;
}

- (MKCertificate)initWithTrust:(__SecTrust *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)MKCertificate;
  id v4 = [(MKCertificate *)&v8 init];
  if (v4)
  {
    CFArrayRef v5 = SecTrustCopyCertificateChain(a3);
    if (CFArrayGetCount(v5) >= 1)
    {
      CFArrayGetValueAtIndex(v5, 0);
      v6 = (void *)SecCertificateCopySHA256Digest();
      [(MKCertificate *)v4 setDigest:v6];
    }
    CFRelease(v5);
  }
  return v4;
}

- (void)dealloc
{
  identity = self->_identity;
  if (identity) {
    CFRelease(identity);
  }
  v4.receiver = self;
  v4.super_class = (Class)MKCertificate;
  [(MKCertificate *)&v4 dealloc];
}

- (id)encodedCertificate
{
  return [(MKCertificate *)self pemFormattedCertificateData:self->_certificate];
}

- (void)generateCertificate
{
  v23[2] = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263F16FE0];
  uint64_t v4 = *MEMORY[0x263F16F98];
  v22[0] = *MEMORY[0x263F16FA8];
  v22[1] = v4;
  v23[0] = v3;
  CFArrayRef v5 = [NSNumber numberWithInt:2048];
  v23[1] = v5;
  CFDictionaryRef v6 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:2];

  RandomKey = SecKeyCreateRandomKey(v6, 0);
  SecKeyRef v8 = SecKeyCopyPublicKey(RandomKey);
  values[0] = *(void **)MEMORY[0x263F17430];
  values[1] = @"Apple Inc.";
  CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFTypeRef v17 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (const void **)values, 2, 0);
  v20[0] = *(void **)MEMORY[0x263F17420];
  v20[1] = @"Move to iOS";
  CFTypeRef v16 = CFArrayCreate(v9, (const void **)v20, 2, 0);
  CFTypeRef cf = CFArrayCreate(v9, &v17, 1, 0);
  CFTypeRef v19 = CFArrayCreate(v9, &v16, 1, 0);
  CFArrayRef v10 = CFArrayCreate(v9, &cf, 2, 0);
  id v11 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v12 = [NSNumber numberWithUnsignedInt:127];
  [v11 setObject:v12 forKey:*MEMORY[0x263F171B0]];

  [v11 setObject:*MEMORY[0x263F17160] forKey:*MEMORY[0x263F17180]];
  SelfSignedCertificate = (__SecCertificate *)SecGenerateSelfSignedCertificate();
  CFDataRef v14 = SecCertificateCopyData(SelfSignedCertificate);
  [(MKCertificate *)self setCertificate:v14];

  v15 = (void *)SecCertificateCopySHA256Digest();
  [(MKCertificate *)self setDigest:v15];

  [(MKCertificate *)self setIdentity:SecIdentityCreate()];
  if (SelfSignedCertificate) {
    CFRelease(SelfSignedCertificate);
  }
  if (v10) {
    CFRelease(v10);
  }
  if (cf) {
    CFRelease(cf);
  }
  if (v19) {
    CFRelease(v19);
  }
  if (v16) {
    CFRelease(v16);
  }
  if (v17) {
    CFRelease(v17);
  }
  if (v8) {
    CFRelease(v8);
  }
  if (RandomKey) {
    CFRelease(RandomKey);
  }
}

- (id)pemFormattedCertificateData:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x263F089D8];
  id v5 = a3;
  CFDictionaryRef v6 = [v4 string];
  [v6 appendString:@"-----BEGIN CERTIFICATE-----\n"];
  [(MKCertificate *)self _appendBase64Data:v5 toString:v6];

  [v6 appendString:@"\n-----END CERTIFICATE-----\n"];
  v7 = [v6 dataUsingEncoding:4];

  return v7;
}

- (void)_appendBase64Data:(id)a3 toString:(id)a4
{
  id v5 = a4;
  id v6 = [a3 base64EncodedStringWithOptions:33];
  [v5 appendString:v6];
}

- (id)dataFromPEMFormattedData:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = (void *)[[NSString alloc] initWithData:v3 encoding:4];
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
        v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
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

- (__SecIdentity)identity
{
  return self->_identity;
}

- (void)setIdentity:(__SecIdentity *)a3
{
  self->_identity = a3;
}

- (NSData)certificate
{
  return self->_certificate;
}

- (void)setCertificate:(id)a3
{
}

- (NSData)digest
{
  return self->_digest;
}

- (void)setDigest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_digest, 0);
  objc_storeStrong((id *)&self->_certificate, 0);
}

@end