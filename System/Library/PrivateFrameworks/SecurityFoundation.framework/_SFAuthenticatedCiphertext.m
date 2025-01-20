@interface _SFAuthenticatedCiphertext
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSData)authenticationCode;
- (NSData)initializationVector;
- (_SFAuthenticatedCiphertext)initWithCiphertext:(id)a3 authenticationCode:(id)a4 initializationVector:(id)a5;
- (_SFAuthenticatedCiphertext)initWithCoder:(id)a3;
- (id)debugDescription;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _SFAuthenticatedCiphertext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
}

- (_SFAuthenticatedCiphertext)initWithCoder:(id)a3
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)_SFAuthenticatedCiphertext;
  v5 = [(_SFCiphertext *)&v20 initWithCoder:v4];
  if (v5)
  {
    v6 = objc_alloc_init(SFAuthenticatedCiphertext_Ivars);
    id authenticatedCiphertextInternal = v5->_authenticatedCiphertextInternal;
    v5->_id authenticatedCiphertextInternal = v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SFAuthenticationCode"];
    v9 = v5->_authenticatedCiphertextInternal;
    v10 = (void *)v9[1];
    v9[1] = v8;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SFInitializationVector"];
    v12 = v5->_authenticatedCiphertextInternal;
    v13 = (void *)v12[2];
    v12[2] = v11;

    v14 = v5->_authenticatedCiphertextInternal;
    if (!v14[1] || !v14[2])
    {
      v15 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v21 = *MEMORY[0x1E4F28568];
      v16 = [NSString stringWithFormat:@"Failed to deserialize object of type %@", objc_opt_class()];
      v22[0] = v16;
      v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
      v18 = [v15 errorWithDomain:@"SFCryptoServicesErrorDomain" code:8 userInfo:v17];

      [v4 failWithError:v18];
    }
  }

  return v5;
}

- (NSData)authenticationCode
{
  return (NSData *)*((id *)self->_authenticatedCiphertextInternal + 1);
}

- (NSData)initializationVector
{
  return (NSData *)*((id *)self->_authenticatedCiphertextInternal + 2);
}

- (_SFAuthenticatedCiphertext)initWithCiphertext:(id)a3 authenticationCode:(id)a4 initializationVector:(id)a5
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
    [v17 handleFailureInMethod:a2, self, @"SFEncryptionOperation.m", 270, @"Invalid parameter not satisfying: %@", @"authenticationCode" object file lineNumber description];

    if (v11) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"SFEncryptionOperation.m", 269, @"Invalid parameter not satisfying: %@", @"ciphertext" object file lineNumber description];

  if (!v10) {
    goto LABEL_8;
  }
LABEL_3:
  if (v11) {
    goto LABEL_4;
  }
LABEL_9:
  v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"SFEncryptionOperation.m", 271, @"Invalid parameter not satisfying: %@", @"initializationVector" object file lineNumber description];

LABEL_4:
  v19.receiver = self;
  v19.super_class = (Class)_SFAuthenticatedCiphertext;
  v12 = [(_SFCiphertext *)&v19 initWithCiphertext:v9];
  if (v12)
  {
    v13 = objc_alloc_init(SFAuthenticatedCiphertext_Ivars);
    id authenticatedCiphertextInternal = v12->_authenticatedCiphertextInternal;
    v12->_id authenticatedCiphertextInternal = v13;

    objc_storeStrong((id *)v12->_authenticatedCiphertextInternal + 1, a4);
    objc_storeStrong((id *)v12->_authenticatedCiphertextInternal + 2, a5);
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_SFAuthenticatedCiphertext;
  id v4 = a3;
  [(_SFCiphertext *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", *((void *)self->_authenticatedCiphertextInternal + 1), @"SFAuthenticationCode", v5.receiver, v5.super_class);
  [v4 encodeObject:*((void *)self->_authenticatedCiphertextInternal + 2) forKey:@"SFInitializationVector"];
}

- (id)debugDescription
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)_SFAuthenticatedCiphertext;
  id v4 = [(_SFAuthenticatedCiphertext *)&v11 debugDescription];
  id authenticatedCiphertextInternal = self->_authenticatedCiphertextInternal;
  uint64_t v6 = authenticatedCiphertextInternal[1];
  uint64_t v7 = authenticatedCiphertextInternal[2];
  uint64_t v8 = [(_SFCiphertext *)self ciphertext];
  id v9 = [v3 stringWithFormat:@"%@\nAuth Code: %@\nIV: %@\ndata: %@", v4, v6, v7, v8];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_SFAuthenticatedCiphertext *)a3;
  objc_super v5 = v4;
  if (v4 == self)
  {
    char v11 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v6 = v5;
    v13.receiver = self;
    v13.super_class = (Class)_SFAuthenticatedCiphertext;
    if ([(_SFCiphertext *)&v13 isEqual:v6])
    {
      uint64_t v7 = (void *)*((void *)self->_authenticatedCiphertextInternal + 1);
      uint64_t v8 = [(_SFAuthenticatedCiphertext *)v6 authenticationCode];
      if ([v7 isEqual:v8])
      {
        id v9 = (void *)*((void *)self->_authenticatedCiphertextInternal + 2);
        id v10 = [(_SFAuthenticatedCiphertext *)v6 initializationVector];
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

@end