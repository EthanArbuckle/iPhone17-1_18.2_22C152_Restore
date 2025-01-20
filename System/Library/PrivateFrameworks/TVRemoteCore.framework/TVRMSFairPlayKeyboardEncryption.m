@interface TVRMSFairPlayKeyboardEncryption
- (BOOL)_verifyCert:(id)a3;
- (BOOL)isTrusted;
- (id)_convertDataToString:(id)a3;
- (id)_convertStringToData:(id)a3;
- (id)encryptString:(id)a3;
- (void)dealloc;
- (void)reset;
- (void)setChallengeString:(id)a3;
- (void)setLeafString:(id)a3;
@end

@implementation TVRMSFairPlayKeyboardEncryption

- (void)dealloc
{
  pubKeyRef = self->_pubKeyRef;
  if (pubKeyRef) {
    CFRelease(pubKeyRef);
  }
  v4.receiver = self;
  v4.super_class = (Class)TVRMSFairPlayKeyboardEncryption;
  [(TVRMSFairPlayKeyboardEncryption *)&v4 dealloc];
}

- (id)encryptString:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 length])
  {
    v5 = [v4 dataUsingEncoding:4];
    *(_OWORD *)plainText = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    *(_OWORD *)cipherText = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    NSUInteger v6 = [(NSData *)self->_challenge length];
    size_t v7 = [v5 length] + v6;
    if (v7 > 0x7F) {
      goto LABEL_5;
    }
    [(NSData *)self->_challenge bytes];
    [(NSData *)self->_challenge length];
    __memcpy_chk();
    v8 = &plainText[[(NSData *)self->_challenge length]];
    id v9 = v5;
    memcpy(v8, (const void *)[v9 bytes], objc_msgSend(v9, "length"));
    plainText[0] = 1;
    size_t cipherTextLen = 128;
    pubKeyRef = self->_pubKeyRef;
    if (!pubKeyRef) {
      goto LABEL_5;
    }
    if (!SecKeyEncrypt(pubKeyRef, 1u, plainText, v7, cipherText, &cipherTextLen))
    {
      v13 = [MEMORY[0x263EFF8F8] dataWithBytes:cipherText length:cipherTextLen];
      v14 = [(TVRMSFairPlayKeyboardEncryption *)self _convertDataToString:v13];
      v11 = [v14 dataUsingEncoding:4];
    }
    else
    {
LABEL_5:
      v11 = 0;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)setLeafString:(id)a3
{
  if (!self->_certIsTrusted)
  {
    id v4 = [(TVRMSFairPlayKeyboardEncryption *)self _convertStringToData:a3];
    if ([v4 length]) {
      self->_certIsTrusted = [(TVRMSFairPlayKeyboardEncryption *)self _verifyCert:v4];
    }
  }
}

- (void)setChallengeString:(id)a3
{
  p_challenge = &self->_challenge;
  challenge = self->_challenge;
  self->_challenge = 0;
  id v6 = a3;

  id obj = [(TVRMSFairPlayKeyboardEncryption *)self _convertStringToData:v6];

  if ([obj length]) {
    objc_storeStrong((id *)p_challenge, obj);
  }
}

- (BOOL)isTrusted
{
  return self->_certIsTrusted;
}

- (void)reset
{
  challenge = self->_challenge;
  self->_challenge = 0;

  self->_certIsTrusted = 0;
}

- (id)_convertStringToData:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [v3 length];
  unint64_t v5 = v4 >> 1;
  id v6 = (char *)malloc_type_malloc((v4 >> 1) + 4, 0xD188F7D0uLL);
  size_t v7 = v6;
  if (v4 >= 2)
  {
    uint64_t v8 = 0;
    if (v5 <= 1) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = v5;
    }
    v10 = v6;
    do
    {
      v11 = objc_msgSend(v3, "substringWithRange:", v8, 2);
      v12 = [MEMORY[0x263F08B08] scannerWithString:v11];
      [v12 scanHexInt:v10];

      ++v10;
      v8 += 2;
      --v9;
    }
    while (v9);
  }
  v13 = [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:v7 length:v5];

  return v13;
}

- (id)_convertDataToString:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 length];
  id v5 = v3;
  id v6 = (unsigned __int8 *)[v5 bytes];
  for (i = [MEMORY[0x263F089D8] stringWithCapacity:2 * v4];
  {
    unsigned int v8 = *v6++;
    uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"%02X", v8);
    [i appendString:v9];
  }

  return i;
}

- (BOOL)_verifyCert:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  CFDataRef v4 = (const __CFData *)a3;
  id v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v6 = [v5 pathForResource:@"6e1fcd66-79ec-430e-b5f5-42ee88a7a3c4" ofType:@"der"];

  if (v6)
  {
    size_t v7 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v6];
    unsigned int v8 = v7;
    if (!v7 || ![v7 length])
    {
      BOOL v14 = 0;
LABEL_33:

      goto LABEL_34;
    }
    uint64_t v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v10 = [v9 pathForResource:@"b1b56718-0ea0-4953-8027-f60a618e56fd" ofType:@"der"];

    if (!v10)
    {
      BOOL v14 = 0;
LABEL_32:

      goto LABEL_33;
    }
    CFDataRef v11 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v10];
    CFDataRef v12 = v11;
    if (v11)
    {
      uint64_t v13 = [(__CFData *)v11 length];
      BOOL v14 = 0;
      if (!v4 || !v13) {
        goto LABEL_31;
      }
      if ([(__CFData *)v4 length])
      {
        values = 0;
        CFTypeRef v22 = 0;
        CFTypeRef cf = 0;
        SecTrustRef trust = 0;
        int v19 = 0;
        CFAllocatorRef v15 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
        CFTypeRef cf = SecCertificateCreateWithData((CFAllocatorRef)*MEMORY[0x263EFFB08], v12);
        if (cf
          && (CFTypeRef v22 = SecCertificateCreateWithData(v15, (CFDataRef)v8)) != 0
          && (values = SecCertificateCreateWithData(v15, v4)) != 0
          && (CFArrayRef v16 = CFArrayCreate(0, (const void **)&values, 3, 0)) != 0)
        {
          SecPolicyRef BasicX509 = SecPolicyCreateBasicX509();
          BOOL v14 = BasicX509
             && !SecTrustCreateWithCertificates(v16, BasicX509, &trust)
             && MEMORY[0x22A658D00](trust, &v19) == 0;
          CFRelease(v16);
        }
        else
        {
          SecPolicyRef BasicX509 = 0;
          BOOL v14 = 0;
        }
        if (cf) {
          CFRelease(cf);
        }
        if (v22) {
          CFRelease(v22);
        }
        if (values) {
          CFRelease(values);
        }
        if (BasicX509) {
          CFRelease(BasicX509);
        }
        if (trust)
        {
          self->_pubKeyRef = (__SecKey *)MEMORY[0x22A658CE0]();
          CFRelease(trust);
        }
        goto LABEL_31;
      }
    }
    BOOL v14 = 0;
LABEL_31:

    goto LABEL_32;
  }
  BOOL v14 = 0;
LABEL_34:

  return v14;
}

- (void).cxx_destruct
{
}

@end