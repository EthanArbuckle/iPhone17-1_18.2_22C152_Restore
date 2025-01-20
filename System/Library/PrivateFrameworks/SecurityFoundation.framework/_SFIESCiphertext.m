@interface _SFIESCiphertext
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSData)authenticationCode;
- (_SFECPublicKey)ephemeralSenderPublicKey;
- (_SFIESCiphertext)initWithCiphertext:(id)a3 ephemeralSenderPublicKey:(id)a4 authenticationCode:(id)a5;
- (_SFIESCiphertext)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _SFIESCiphertext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_SFIESCiphertext)initWithCiphertext:(id)a3 ephemeralSenderPublicKey:(id)a4 authenticationCode:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
LABEL_8:
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"SFEncryptionOperation.m", 365, @"Invalid parameter not satisfying: %@", @"ephemeralSenderPublicKey" object file lineNumber description];

    if (v11) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"SFEncryptionOperation.m", 364, @"Invalid parameter not satisfying: %@", @"ciphertext" object file lineNumber description];

  if (!v10) {
    goto LABEL_8;
  }
LABEL_3:
  if (v11) {
    goto LABEL_4;
  }
LABEL_9:
  v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"SFEncryptionOperation.m", 366, @"Invalid parameter not satisfying: %@", @"authenticationCode" object file lineNumber description];

LABEL_4:
  v19.receiver = self;
  v19.super_class = (Class)_SFIESCiphertext;
  v12 = [(_SFCiphertext *)&v19 initWithCiphertext:v9];
  if (v12)
  {
    v13 = objc_alloc_init(SFIESCiphertext_Ivars);
    id iesCiphertextInternal = v12->_iesCiphertextInternal;
    v12->_id iesCiphertextInternal = v13;

    objc_storeStrong((id *)v12->_iesCiphertextInternal + 1, a4);
    objc_storeStrong((id *)v12->_iesCiphertextInternal + 2, a5);
  }

  return v12;
}

- (_SFIESCiphertext)initWithCoder:(id)a3
{
  v30[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)_SFIESCiphertext;
  v5 = [(_SFCiphertext *)&v26 initWithCoder:v4];
  if (v5)
  {
    v6 = objc_alloc_init(SFIESCiphertext_Ivars);
    id iesCiphertextInternal = v5->_iesCiphertextInternal;
    v5->_id iesCiphertextInternal = v6;

    CFDataRef v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SFEphemeralSenderPublicKeyExternaRepresentation"];
    uint64_t v9 = *MEMORY[0x1E4F3B6D8];
    v29[0] = *MEMORY[0x1E4F3B718];
    v29[1] = v9;
    uint64_t v10 = *MEMORY[0x1E4F3B6F0];
    v30[0] = *MEMORY[0x1E4F3B730];
    v30[1] = v10;
    CFDictionaryRef v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:2];
    SecKeyRef v12 = SecKeyCreateWithData(v8, v11, 0);
    if (v12)
    {
      SecKeyRef v13 = v12;
      v14 = [(_SFPublicKey *)[_SFECPublicKey alloc] initWithSecKey:v12];
      v15 = v5->_iesCiphertextInternal;
      v16 = (void *)v15[1];
      v15[1] = v14;

      uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SFIESAuthenticationCode"];
      v18 = v5->_iesCiphertextInternal;
      objc_super v19 = (void *)v18[2];
      v18[2] = v17;

      CFRelease(v13);
    }
    v20 = v5->_iesCiphertextInternal;
    if (!v20[1] || !v20[2])
    {
      v21 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v27 = *MEMORY[0x1E4F28568];
      v22 = [NSString stringWithFormat:@"Failed to deserialize object of type %@", objc_opt_class()];
      v28 = v22;
      v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
      v24 = [v21 errorWithDomain:@"SFCryptoServicesErrorDomain" code:8 userInfo:v23];

      [v4 failWithError:v24];
    }
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_SFIESCiphertext;
  [(_SFCiphertext *)&v8 encodeWithCoder:v4];
  CFErrorRef error = 0;
  CFDataRef v5 = SecKeyCopyExternalRepresentation((SecKeyRef)[*((id *)self->_iesCiphertextInternal + 1) _secKey], &error);
  if (v5) {
    BOOL v6 = error == 0;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6)
  {
    [v4 encodeObject:v5 forKey:@"SFEphemeralSenderPublicKeyExternaRepresentation"];
    [v4 encodeObject:*((void *)self->_iesCiphertextInternal + 2) forKey:@"SFIESAuthenticationCode"];
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_SFIESCiphertext *)a3;
  CFDataRef v5 = v4;
  if (self == v4)
  {
    char v11 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    BOOL v6 = v5;
    v13.receiver = self;
    v13.super_class = (Class)_SFIESCiphertext;
    if ([(_SFCiphertext *)&v13 isEqual:v6])
    {
      v7 = (void *)*((void *)self->_iesCiphertextInternal + 1);
      objc_super v8 = [(_SFIESCiphertext *)v6 ephemeralSenderPublicKey];
      if ([v7 isEqual:v8])
      {
        uint64_t v9 = (void *)*((void *)self->_iesCiphertextInternal + 2);
        uint64_t v10 = [(_SFIESCiphertext *)v6 authenticationCode];
        char v11 = [v9 isEqual:v10];
      }
      else
      {
        char v11 = 0;
      }
    }
    else
    {
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (_SFECPublicKey)ephemeralSenderPublicKey
{
  return (_SFECPublicKey *)*((id *)self->_iesCiphertextInternal + 1);
}

- (NSData)authenticationCode
{
  return (NSData *)*((id *)self->_iesCiphertextInternal + 2);
}

- (void).cxx_destruct
{
}

@end