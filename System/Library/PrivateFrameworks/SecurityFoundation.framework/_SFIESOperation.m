@interface _SFIESOperation
+ (BOOL)supportsSecureCoding;
+ (void)initialize;
- (SFDigestOperation)digestOperation;
- (_SFAuthenticatedEncryptionOperation)encryptionOperation;
- (_SFECDHOperation)diffieHellmanOperation;
- (_SFIESOperation)init;
- (_SFIESOperation)initWithCoder:(id)a3;
- (_SFIESOperation)initWithCurve:(int64_t)a3;
- (_SFIESOperation)initWithCurve:(int64_t)a3 diffieHellmanOperation:(id)a4 encryptionOperation:(id)a5 digestOperation:(id)a6;
- (_SFKeySpecifier)encryptionKeySpecifier;
- (const)_ccDigestInfoWithError:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)decrypt:(id)a3 withKey:(id)a4 error:(id *)a5;
- (id)encrypt:(id)a3 withKey:(id)a4 error:(id *)a5;
- (int64_t)curve;
- (void)setCurve:(int64_t)a3;
- (void)setDiffieHellmanOperation:(id)a3;
- (void)setDigestOperation:(id)a3;
- (void)setEncryptionOperation:(id)a3;
@end

@implementation _SFIESOperation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    MEMORY[0x1F40CB048](&__rngSystemState);
  }
}

- (_SFIESOperation)init
{
  return [(_SFIESOperation *)self initWithCurve:2];
}

- (_SFIESOperation)initWithCurve:(int64_t)a3
{
  v5 = +[_SFECDHOperation _defaultOperation];
  v6 = +[_SFAuthenticatedEncryptionOperation _defaultEncryptionOperation];
  v7 = _defaultDigestOperation();
  v8 = [(_SFIESOperation *)self initWithCurve:a3 diffieHellmanOperation:v5 encryptionOperation:v6 digestOperation:v7];

  return v8;
}

- (_SFIESOperation)initWithCurve:(int64_t)a3 diffieHellmanOperation:(id)a4 encryptionOperation:(id)a5 digestOperation:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)_SFIESOperation;
  v14 = [(_SFIESOperation *)&v18 init];
  if (v14)
  {
    v15 = objc_alloc_init(SFIESOperation_Ivars);
    id iesOperationInternal = v14->_iesOperationInternal;
    v14->_id iesOperationInternal = v15;

    *((void *)v14->_iesOperationInternal + 1) = a3;
    objc_storeStrong((id *)v14->_iesOperationInternal + 2, a4);
    objc_storeStrong((id *)v14->_iesOperationInternal + 3, a5);
    objc_storeStrong((id *)v14->_iesOperationInternal + 4, a6);
  }

  return v14;
}

- (_SFIESOperation)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_SFIESOperation;
  return [(_SFIESOperation *)&v4 init];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  id iesOperationInternal = self->_iesOperationInternal;
  uint64_t v6 = iesOperationInternal[1];
  uint64_t v7 = iesOperationInternal[2];
  uint64_t v8 = iesOperationInternal[3];
  uint64_t v9 = iesOperationInternal[4];
  return (id)[v4 initWithCurve:v6 diffieHellmanOperation:v7 encryptionOperation:v8 digestOperation:v9];
}

- (const)_ccDigestInfoWithError:(id *)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_respondsToSelector() & 1) == 0)
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v8 = *((void *)self->_iesOperationInternal + 4);
    v10 = @"SFCryptoServicesErrorDigest";
    v11[0] = v8;
    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    *a3 = [v7 errorWithDomain:@"SFCryptoServicesErrorDomain" code:1 userInfo:v9];

    return 0;
  }
  else
  {
    v5 = (void *)*((void *)self->_iesOperationInternal + 4);
    return (const ccdigest_info *)[v5 _ccDigestInfo];
  }
}

- (id)encrypt:(id)a3 withKey:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"SFEncryptionOperation.m", 1092, @"Invalid parameter not satisfying: %@", @"plaintext" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"SFEncryptionOperation.m", 1093, @"Invalid parameter not satisfying: %@", @"key2" object file lineNumber description];

LABEL_3:
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = v11;
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__0;
    v26 = __Block_byref_object_dispose__0;
    id v27 = 0;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __41___SFIESOperation_encrypt_withKey_error___block_invoke;
    v18[3] = &unk_1E63797F0;
    v21 = &v22;
    v18[4] = self;
    id v19 = v9;
    id v13 = v12;
    id v20 = v13;
    v14 = [v13 performWithCCKey:v18];
    if (a5) {
      *a5 = (id) v23[5];
    }

    _Block_object_dispose(&v22, 8);
  }
  else if (a5)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"SFCryptoServicesErrorDomain" code:9 userInfo:0];
    v14 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)decrypt:(id)a3 withKey:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"SFEncryptionOperation.m", 1152, @"Invalid parameter not satisfying: %@", @"ciphertext2" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"SFEncryptionOperation.m", 1153, @"Invalid parameter not satisfying: %@", @"key2" object file lineNumber description];

LABEL_3:
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = v9;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v13 = v11;
      uint64_t v21 = 0;
      uint64_t v22 = &v21;
      uint64_t v23 = 0x3032000000;
      uint64_t v24 = __Block_byref_object_copy__0;
      v25 = __Block_byref_object_dispose__0;
      id v26 = 0;
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __41___SFIESOperation_decrypt_withKey_error___block_invoke;
      v18[3] = &unk_1E6379818;
      id v20 = &v21;
      v18[4] = self;
      id v19 = v12;
      v14 = [v13 performWithCCKey:v18];
      if (a5) {
        *a5 = (id) v22[5];
      }

      _Block_object_dispose(&v21, 8);
    }
    else if (a5)
    {
      [MEMORY[0x1E4F28C58] errorWithDomain:@"SFCryptoServicesErrorDomain" code:9 userInfo:0];
      v14 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }
  }
  else if (a5)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"SFCryptoServicesErrorDomain" code:9 userInfo:0];
    v14 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (_SFKeySpecifier)encryptionKeySpecifier
{
  return 0;
}

- (_SFECDHOperation)diffieHellmanOperation
{
  v2 = (void *)[*((id *)self->_iesOperationInternal + 2) copy];
  return (_SFECDHOperation *)v2;
}

- (void)setDiffieHellmanOperation:(id)a3
{
  *((void *)self->_iesOperationInternal + 2) = [a3 copy];
  MEMORY[0x1F41817F8]();
}

- (_SFAuthenticatedEncryptionOperation)encryptionOperation
{
  v2 = (void *)[*((id *)self->_iesOperationInternal + 3) copy];
  return (_SFAuthenticatedEncryptionOperation *)v2;
}

- (void)setEncryptionOperation:(id)a3
{
  *((void *)self->_iesOperationInternal + 3) = [a3 copy];
  MEMORY[0x1F41817F8]();
}

- (SFDigestOperation)digestOperation
{
  v2 = (void *)[*((id *)self->_iesOperationInternal + 4) copyWithZone:0];
  return (SFDigestOperation *)v2;
}

- (void)setDigestOperation:(id)a3
{
  *((void *)self->_iesOperationInternal + 4) = [a3 copyWithZone:0];
  MEMORY[0x1F41817F8]();
}

- (int64_t)curve
{
  return self->_curve;
}

- (void)setCurve:(int64_t)a3
{
  self->_curve = a3;
}

- (void).cxx_destruct
{
}

@end