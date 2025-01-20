@interface LegacySigningKeyPrivate
- (LegacySigningKeyPrivate)init;
- (LegacySigningKeyPrivate)initWithData:(id)a3 error:(id *)a4;
- (id)dataRepresentation;
- (id)publicKey;
- (id)secKeyRef;
- (id)signData:(id)a3 error:(id *)a4;
- (void)setSecKeyRef:(id)a3;
@end

@implementation LegacySigningKeyPrivate

- (LegacySigningKeyPrivate)init
{
  v13[4] = *MEMORY[0x263EF8340];
  v11.receiver = self;
  v11.super_class = (Class)LegacySigningKeyPrivate;
  v2 = [(LegacySigningKeyPrivate *)&v11 init];
  uint64_t v3 = *MEMORY[0x263F16FB8];
  uint64_t v4 = *MEMORY[0x263F16F68];
  v12[0] = *MEMORY[0x263F16FA8];
  v12[1] = v4;
  uint64_t v5 = *MEMORY[0x263F16F70];
  v13[0] = v3;
  v13[1] = v5;
  uint64_t v6 = *MEMORY[0x263F16F50];
  v12[2] = *MEMORY[0x263F16F98];
  v12[3] = v6;
  v13[2] = &unk_26C70CCF8;
  v13[3] = MEMORY[0x263EFFA80];
  SecKeyRef RandomKey = SecKeyCreateRandomKey((CFDictionaryRef)[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:4], 0);
  id secKeyRef = v2->_secKeyRef;
  v2->_id secKeyRef = RandomKey;

  if (v2->_secKeyRef) {
    v9 = v2;
  }
  else {
    v9 = 0;
  }

  return v9;
}

- (LegacySigningKeyPrivate)initWithData:(id)a3 error:(id *)a4
{
  v17[4] = *MEMORY[0x263EF8340];
  v15.receiver = self;
  v15.super_class = (Class)LegacySigningKeyPrivate;
  CFDataRef v4 = (const __CFData *)a3;
  uint64_t v5 = [(LegacySigningKeyPrivate *)&v15 init];
  uint64_t v6 = *MEMORY[0x263F16FB8];
  uint64_t v7 = *MEMORY[0x263F16F68];
  v16[0] = *MEMORY[0x263F16FA8];
  v16[1] = v7;
  uint64_t v8 = *MEMORY[0x263F16F70];
  v17[0] = v6;
  v17[1] = v8;
  uint64_t v9 = *MEMORY[0x263F16F50];
  v16[2] = *MEMORY[0x263F16F98];
  v16[3] = v9;
  v17[2] = &unk_26C70CCF8;
  v17[3] = MEMORY[0x263EFFA80];
  SecKeyRef v10 = SecKeyCreateWithData(v4, (CFDictionaryRef)[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:4], 0);

  id secKeyRef = v5->_secKeyRef;
  v5->_id secKeyRef = v10;

  if (v5->_secKeyRef) {
    v12 = v5;
  }
  else {
    v12 = 0;
  }
  v13 = v12;

  return v13;
}

- (id)signData:(id)a3 error:(id *)a4
{
  CFDataRef Signature = SecKeyCreateSignature((SecKeyRef)self->_secKeyRef, (SecKeyAlgorithm)*MEMORY[0x263F172D8], (CFDataRef)a3, 0);
  return Signature;
}

- (id)dataRepresentation
{
  CFDataRef v2 = SecKeyCopyExternalRepresentation((SecKeyRef)self->_secKeyRef, 0);
  return v2;
}

- (id)publicKey
{
  CFDataRef v2 = SecKeyCopyPublicKey((SecKeyRef)self->_secKeyRef);
  CFDataRef v3 = SecKeyCopyExternalRepresentation(v2, 0);
  CFDataRef v4 = [[LegacySigningKeyPublic alloc] initWithData:v3 error:0];

  return v4;
}

- (id)secKeyRef
{
  return self->_secKeyRef;
}

- (void)setSecKeyRef:(id)a3
{
}

- (void).cxx_destruct
{
}

@end