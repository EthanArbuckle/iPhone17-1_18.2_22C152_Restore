@interface _SFAuthenticatedEncryptionOperation
+ (BOOL)supportsSecureCoding;
+ (id)_defaultEncryptionOperation;
+ (int64_t)_defaultAuthenticationMode;
- (_SFAESKeySpecifier)encryptionKeySpecifier;
- (_SFAuthenticatedEncryptionOperation)init;
- (_SFAuthenticatedEncryptionOperation)initWithCoder:(id)a3;
- (_SFAuthenticatedEncryptionOperation)initWithKeySpecifier:(id)a3;
- (_SFAuthenticatedEncryptionOperation)initWithKeySpecifier:(id)a3 authenticationMode:(int64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)decrypt:(id)a3 withKey:(id)a4 additionalAuthenticatedData:(id)a5 error:(id *)a6;
- (id)decrypt:(id)a3 withKey:(id)a4 error:(id *)a5;
- (id)encrypt:(id)a3 withKey:(id)a4 additionalAuthenticatedData:(id)a5 error:(id *)a6;
- (id)encrypt:(id)a3 withKey:(id)a4 additionalAuthenticatedData:(id)a5 ivGenerator:(id)a6 error:(id *)a7;
- (id)encrypt:(id)a3 withKey:(id)a4 error:(id *)a5;
- (id)encrypt:(id)a3 withKey:(id)a4 ivGenerator:(id)a5 error:(id *)a6;
- (int64_t)authenticationCodeLength;
- (int64_t)authenticationMode;
- (void)setAuthenticationCodeLength:(int64_t)a3;
- (void)setAuthenticationMode:(int64_t)a3;
- (void)setEncryptionKeySpecifier:(id)a3;
@end

@implementation _SFAuthenticatedEncryptionOperation

- (id)encrypt:(id)a3 withKey:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = objc_alloc_init(SFIncrementingIVGenerator);
  v11 = [(_SFAuthenticatedEncryptionOperation *)self encrypt:v9 withKey:v8 additionalAuthenticatedData:0 ivGenerator:v10 error:a5];

  return v11;
}

- (id)decrypt:(id)a3 withKey:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v10 = [(_SFAuthenticatedEncryptionOperation *)self decrypt:v8 withKey:v9 additionalAuthenticatedData:0 error:a5];
  }
  else if (a5)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"SFCryptoServicesErrorDomain" code:9 userInfo:0];
    v10 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)encrypt:(id)a3 withKey:(id)a4 additionalAuthenticatedData:(id)a5 ivGenerator:(id)a6 error:(id *)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a2 object:self file:@"SFEncryptionOperation.m" lineNumber:687 description:@"currently only AES keys are supported for SFAuthenticatedEncryptionOperation"];
  }
  v17 = [v14 keyData];
  v18 = objc_msgSend(v16, "generateIVWithLength:error:", objc_msgSend(v17, "length"), a7);

  if (v18)
  {
    id v36 = v14;
    size_t v19 = [v13 length];
    v20 = v18;
    v33 = malloc_type_malloc(v19, 0x32864A5uLL);
    v21 = malloc_type_malloc(*((void *)self->_authenticatedEncryptionOperationInternal + 3), 0xBAC2913CuLL);
    uint64_t v38 = *((void *)self->_authenticatedEncryptionOperationInternal + 3);
    [v17 bytes];
    v34 = v20;
    id v22 = v20;
    [v22 bytes];
    [v22 length];
    id v35 = v15;
    id v23 = v15;
    [v23 bytes];
    [v23 length];
    id v37 = v13;
    v24 = v13;
    v25 = v33;
    uint64_t v32 = [v24 bytes];
    if (CCCryptorGCM())
    {
      v26 = 0;
    }
    else
    {
      v28 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", v33, v19, v32, v19, v33, v21, &v38);
      v29 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v21 length:v38];
      v26 = [[_SFAuthenticatedCiphertext alloc] initWithCiphertext:v28 authenticationCode:v29 initializationVector:v22];

      v25 = v33;
    }
    free(v25);
    free(v21);
    id v14 = v36;
    id v13 = v37;
    id v15 = v35;
    v18 = v34;
    if (!a7 || v26) {
      goto LABEL_14;
    }
    id v27 = [MEMORY[0x1E4F28C58] errorWithDomain:@"SFCryptoServicesErrorDomain" code:2 userInfo:0];
    goto LABEL_12;
  }
  if (a7)
  {
    id v27 = [MEMORY[0x1E4F28C58] errorWithDomain:@"SFCryptoServicesErrorDomain" code:4 userInfo:0];
    v26 = 0;
LABEL_12:
    *a7 = v27;
    goto LABEL_14;
  }
  v26 = 0;
LABEL_14:

  return v26;
}

- (id)decrypt:(id)a3 withKey:(id)a4 additionalAuthenticatedData:(id)a5 error:(id *)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v41 = [MEMORY[0x1E4F28B00] currentHandler];
    [v41 handleFailureInMethod:a2 object:self file:@"SFEncryptionOperation.m" lineNumber:739 description:@"currently only AES keys are supported for SFAuthenticatedEncryptionOperation"];
  }
  id v14 = v12;
  id v15 = [v11 authenticationCode];
  uint64_t v16 = [v15 length];
  uint64_t v17 = *((void *)self->_authenticatedEncryptionOperationInternal + 3);

  if (v16 == v17)
  {
    v47 = a6;
    v18 = [v14 keyData];
    [v18 length];
    size_t v19 = [v11 initializationVector];
    v20 = [v11 ciphertext];
    v21 = v13;
    size_t v22 = [v20 length];

    id v23 = malloc_type_malloc(v22, 0x4A690FF5uLL);
    v24 = v11;
    v25 = malloc_type_malloc(*((void *)self->_authenticatedEncryptionOperationInternal + 3), 0x9E786422uLL);
    size_t v50 = *((void *)self->_authenticatedEncryptionOperationInternal + 3);
    id v46 = v18;
    [v46 bytes];
    id v26 = v19;
    [v26 bytes];
    id v45 = v26;
    [v26 length];
    v48 = v21;
    id v27 = v21;
    [v27 bytes];
    [v27 length];
    v49 = v24;
    id v28 = [v24 ciphertext];
    v44 = v25;
    v29 = v25;
    v30 = v23;
    v43 = v23;
    size_t v31 = v22;
    uint64_t v42 = [v28 bytes];
    LODWORD(v19) = CCCryptorGCM();

    if (v19)
    {
      uint64_t v32 = 0;
      v33 = v47;
      id v13 = v48;
      v34 = v30;
      id v36 = v45;
      id v35 = v46;
      id v11 = v49;
    }
    else
    {
      id v11 = v49;
      objc_msgSend(v49, "authenticationCode", v42, v22, v43, v44, &v50);
      id v37 = objc_claimAutoreleasedReturnValue();
      uint64_t v38 = (const void *)[v37 bytes];
      int v39 = timingsafe_bcmp(v29, v38, v50);

      if (v39)
      {
        uint64_t v32 = 0;
        v33 = v47;
        id v13 = v48;
        id v35 = v46;
        v34 = v30;
      }
      else
      {
        v34 = v30;
        uint64_t v32 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v30 length:v31];
        v33 = v47;
        id v13 = v48;
        id v35 = v46;
      }
      id v36 = v45;
    }
    free(v34);
    free(v29);
    if (v33 && !v32)
    {
      id *v33 = [MEMORY[0x1E4F28C58] errorWithDomain:@"SFCryptoServicesErrorDomain" code:3 userInfo:0];
    }
  }
  else if (a6)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"SFCryptoServicesErrorDomain" code:5 userInfo:0];
    uint64_t v32 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v32 = 0;
  }

  return v32;
}

+ (int64_t)_defaultAuthenticationMode
{
  return 1;
}

+ (id)_defaultEncryptionOperation
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_SFAuthenticatedEncryptionOperation)init
{
  v3 = [[_SFAESKeySpecifier alloc] initWithBitSize:2];
  v4 = [(_SFAuthenticatedEncryptionOperation *)self initWithKeySpecifier:v3];

  return v4;
}

- (_SFAuthenticatedEncryptionOperation)initWithKeySpecifier:(id)a3
{
  id v4 = a3;
  v5 = -[_SFAuthenticatedEncryptionOperation initWithKeySpecifier:authenticationMode:](self, "initWithKeySpecifier:authenticationMode:", v4, [(id)objc_opt_class() _defaultAuthenticationMode]);

  return v5;
}

- (_SFAuthenticatedEncryptionOperation)initWithKeySpecifier:(id)a3 authenticationMode:(int64_t)a4
{
  id v8 = a3;
  if (!v8)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"SFEncryptionOperation.m", 636, @"Invalid parameter not satisfying: %@", @"keySpecifier" object file lineNumber description];
  }
  if (a4 != 1)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"SFEncryptionOperation.m" lineNumber:637 description:@"unsupported authentication mode - at present only SFAuthenticatedEncryptionModeGCM is supported"];
  }
  v15.receiver = self;
  v15.super_class = (Class)_SFAuthenticatedEncryptionOperation;
  id v9 = [(_SFAuthenticatedEncryptionOperation *)&v15 init];
  if (v9)
  {
    v10 = objc_alloc_init(SFAuthenticatedEncryptionOperation_Ivars);
    id authenticatedEncryptionOperationInternal = v9->_authenticatedEncryptionOperationInternal;
    v9->_id authenticatedEncryptionOperationInternal = v10;

    objc_storeStrong((id *)v9->_authenticatedEncryptionOperationInternal + 1, a3);
    *((void *)v9->_authenticatedEncryptionOperationInternal + 2) = a4;
    *((void *)v9->_authenticatedEncryptionOperationInternal + 3) = [v8 blockSize];
  }

  return v9;
}

- (_SFAuthenticatedEncryptionOperation)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_SFAuthenticatedEncryptionOperation;
  return [(_SFAuthenticatedEncryptionOperation *)&v4 init];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)[objc_alloc((Class)objc_opt_class()) initWithKeySpecifier:*((void *)self->_authenticatedEncryptionOperationInternal + 1) authenticationMode:*((void *)self->_authenticatedEncryptionOperationInternal + 2)];
  *(void *)(*((void *)result + 1) + 24) = *((void *)self->_authenticatedEncryptionOperationInternal + 3);
  return result;
}

- (id)encrypt:(id)a3 withKey:(id)a4 additionalAuthenticatedData:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = objc_alloc_init(SFIncrementingIVGenerator);
  id v14 = [(_SFAuthenticatedEncryptionOperation *)self encrypt:v12 withKey:v11 additionalAuthenticatedData:v10 ivGenerator:v13 error:a6];

  return v14;
}

- (id)encrypt:(id)a3 withKey:(id)a4 ivGenerator:(id)a5 error:(id *)a6
{
  return [(_SFAuthenticatedEncryptionOperation *)self encrypt:a3 withKey:a4 additionalAuthenticatedData:0 ivGenerator:a5 error:a6];
}

- (_SFAESKeySpecifier)encryptionKeySpecifier
{
  return (_SFAESKeySpecifier *)objc_retainAutoreleaseReturnValue(*((id *)self->_authenticatedEncryptionOperationInternal
                                                                 + 1));
}

- (void)setEncryptionKeySpecifier:(id)a3
{
  *((void *)self->_authenticatedEncryptionOperationInternal + 1) = [a3 copy];
  MEMORY[0x1F41817F8]();
}

- (int64_t)authenticationMode
{
  return *((void *)self->_authenticatedEncryptionOperationInternal + 2);
}

- (void)setAuthenticationMode:(int64_t)a3
{
  if (a3 != 1)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"SFEncryptionOperation.m" lineNumber:793 description:@"unsupported authentication mode - at present only SFAuthenticatedEncryptionModeGCM is supported"];
  }
  *((void *)self->_authenticatedEncryptionOperationInternal + 2) = a3;
}

- (int64_t)authenticationCodeLength
{
  return *((void *)self->_authenticatedEncryptionOperationInternal + 3);
}

- (void)setAuthenticationCodeLength:(int64_t)a3
{
  *((void *)self->_authenticatedEncryptionOperationInternal + 3) = a3;
}

- (void).cxx_destruct
{
}

@end