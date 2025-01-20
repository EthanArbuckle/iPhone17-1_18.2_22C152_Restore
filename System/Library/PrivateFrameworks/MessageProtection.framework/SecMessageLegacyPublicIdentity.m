@interface SecMessageLegacyPublicIdentity
+ (id)identityWithIdentityData:(id)a3 error:(id *)a4;
- (BOOL)verifySignature:(id)a3 ofData:(id)a4;
- (LegacySigningKeyPublic)signingKey;
- (SecKeyRSAPublic)encryptionKey;
- (SecMessageLegacyPublicIdentity)initWithEncryptionKey:(id)a3 signingKey:(id)a4;
- (_SecMPPublicIdentity)asRef;
- (__SecKey)publicSigningKeyForTerminusMigration;
- (id)encryptData:(id)a3;
- (id)identityData;
- (id)publicIDCanonicalHash;
- (id)publicIDHash;
- (id)sealMessage:(id)a3 signedByFullIdentity:(id)a4 error:(id *)a5;
- (unint64_t)encryptionSize;
@end

@implementation SecMessageLegacyPublicIdentity

- (SecMessageLegacyPublicIdentity)initWithEncryptionKey:(id)a3 signingKey:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SecMessageLegacyPublicIdentity;
  v9 = [(SecMessageLegacyPublicIdentity *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_signingKey, a4);
    objc_storeStrong((id *)&v10->_encryptionKey, a3);
  }

  return v10;
}

+ (id)identityWithIdentityData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  [v5 length];
  id v6 = v5;
  [v6 bytes];

  if (ccder_decode_sequence_tl() && (uint64_t v7 = ccder_decode_tl()) != 0)
  {
    id v8 = [MEMORY[0x263EFF8F8] dataWithBytes:v7 length:0];
    v9 = [v8 lengthValidatedBuffer];

    v10 = [[LegacySigningKeyPublic alloc] initWithData:v9 error:a4];
    if (v10)
    {
      v11 = [MEMORY[0x263EFF8F8] dataWithBytes:ccder_decode_tl() length:0];
      objc_super v12 = [SecKeyRSAPublic alloc];
      v13 = [v11 lengthValidatedBuffer];
      v14 = [(SecKeyRSAPublic *)v12 initWithData:v13 error:a4];

      if (v14) {
        v15 = [[SecMessageLegacyPublicIdentity alloc] initWithEncryptionKey:v14 signingKey:v10];
      }
      else {
        v15 = 0;
      }
    }
    else
    {
      v15 = 0;
    }
  }
  else
  {
    v15 = 0;
  }
  return v15;
}

- (id)identityData
{
  v3 = [MEMORY[0x263EFF990] data];
  v4 = [MEMORY[0x263EFF990] data];
  id v5 = [(SecMessageLegacyPublicIdentity *)self signingKey];
  id v6 = [v5 dataRepresentation];
  [v3 appendDataAndSize:v6];

  uint64_t v7 = [(SecMessageLegacyPublicIdentity *)self encryptionKey];
  id v8 = [v7 dataRepresentation];
  [v4 appendDataAndSize:v8];

  [v3 length];
  ccder_sizeof();
  [v4 length];
  ccder_sizeof();
  id v9 = [MEMORY[0x263EFF990] dataWithLength:ccder_sizeof()];
  uint64_t v10 = [v9 mutableBytes];
  [v3 length];
  id v11 = v3;
  [v11 bytes];
  [v4 length];
  id v12 = v4;
  [v12 bytes];
  ccder_encode_implicit_raw_octet_string();
  ccder_encode_implicit_raw_octet_string();
  if (ccder_encode_constructed_tl() == v10) {
    id v13 = v9;
  }
  else {
    id v13 = 0;
  }

  return v13;
}

- (id)encryptData:(id)a3
{
  id v4 = a3;
  id v5 = [(SecMessageLegacyPublicIdentity *)self encryptionKey];
  id v6 = [v5 encryptData:v4 error:0];

  return v6;
}

- (id)sealMessage:(id)a3 signedByFullIdentity:(id)a4 error:(id *)a5
{
  id v16 = 0;
  id v8 = (void *)MEMORY[0x263EFF990];
  id v9 = a4;
  CFDataRef v10 = (const __CFData *)a3;
  CFDataRef v11 = [v8 data];
  id v12 = [(SecMessageLegacyPublicIdentity *)self asRef];
  id v13 = (const void *)[v9 asRef];

  LODWORD(v9) = SecMPSignAndProtectMessage(v10, (uint64_t)v13, (uint64_t)v12, v11, (CFErrorRef *)&v16);
  CFRelease(v12);
  CFRelease(v13);
  if (v9)
  {
    CFDataRef v14 = v11;
  }
  else
  {
    CFDataRef v14 = 0;
    if (a5) {
      *a5 = v16;
    }
  }

  return v14;
}

- (id)publicIDHash
{
  v3 = (void *)[objc_alloc(MEMORY[0x263EFF990]) initWithLength:20];
  id v4 = [(SecMessageLegacyPublicIdentity *)self identityData];
  id v5 = (const void *)[v4 bytes];
  CC_LONG v6 = [v4 length];
  id v7 = v3;
  CC_SHA1(v5, v6, (unsigned __int8 *)[v7 mutableBytes]);

  return v7;
}

- (id)publicIDCanonicalHash
{
  v3 = (void *)[objc_alloc(MEMORY[0x263EFF990]) initWithLength:32];
  id v4 = [MEMORY[0x263EFF990] data];
  id v5 = [(SecMessageLegacyPublicIdentity *)self signingKey];
  CC_LONG v6 = [v5 dataRepresentation];
  [v4 appendDataAndSize:v6];

  id v7 = [(SecMessageLegacyPublicIdentity *)self encryptionKey];
  id v8 = [v7 dataRepresentation];
  [v4 appendDataAndSize:v8];

  id v9 = v4;
  CFDataRef v10 = (const void *)[v9 bytes];
  LODWORD(v8) = [v9 length];
  id v11 = v3;
  CC_SHA256(v10, (CC_LONG)v8, (unsigned __int8 *)[v11 mutableBytes]);

  return v11;
}

- (unint64_t)encryptionSize
{
  v2 = [(SecMessageLegacyPublicIdentity *)self encryptionKey];
  v3 = [v2 secKeyRef];
  unint64_t Size = SecKeyGetSize();

  return Size;
}

- (BOOL)verifySignature:(id)a3 ofData:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SecMessageLegacyPublicIdentity *)self signingKey];
  char v9 = [v8 verifySignature:v7 ofData:v6];

  return v9;
}

- (_SecMPPublicIdentity)asRef
{
  SecMPPublicIdentityGetTypeID();
  Instance = (_SecMPPublicIdentity *)_CFRuntimeCreateInstance();
  Instance->var3 = (id)CFRetain(self);
  id v4 = [(SecMessageLegacyPublicIdentity *)self encryptionKey];
  id v5 = [v4 secKeyRef];
  Instance->var2 = v5;

  id v6 = [(SecMessageLegacyPublicIdentity *)self signingKey];
  id v7 = [v6 secKeyRef];
  Instance->var1 = v7;

  return Instance;
}

- (__SecKey)publicSigningKeyForTerminusMigration
{
  v2 = [(SecMessageLegacyPublicIdentity *)self signingKey];
  v3 = [v2 secKeyRef];

  return v3;
}

- (LegacySigningKeyPublic)signingKey
{
  return self->_signingKey;
}

- (SecKeyRSAPublic)encryptionKey
{
  return self->_encryptionKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptionKey, 0);
  objc_storeStrong((id *)&self->_signingKey, 0);
}

@end