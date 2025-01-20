@interface _SFEC_X962SigningOperation
+ (BOOL)supportsSecureCoding;
- (SFDigestOperation)digestOperation;
- (_SFECKeySpecifier)signingKeySpecifier;
- (_SFEC_X962SigningOperation)init;
- (_SFEC_X962SigningOperation)initWithCoder:(id)a3;
- (_SFEC_X962SigningOperation)initWithKeySpecifier:(id)a3;
- (_SFEC_X962SigningOperation)initWithKeySpecifier:(id)a3 digestOperation:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)sign:(id)a3 withKey:(id)a4 error:(id *)a5;
- (id)verify:(id)a3 withKey:(id)a4 error:(id *)a5;
- (void)setDigestOperation:(id)a3;
- (void)setSigningKeySpecifier:(id)a3;
@end

@implementation _SFEC_X962SigningOperation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_SFEC_X962SigningOperation)init
{
  v3 = [[_SFECKeySpecifier alloc] initWithCurve:2];
  v4 = [(_SFEC_X962SigningOperation *)self initWithKeySpecifier:v3];

  return v4;
}

- (_SFEC_X962SigningOperation)initWithKeySpecifier:(id)a3
{
  id v4 = a3;
  v5 = _defaultDigestOperation();
  v6 = [(_SFEC_X962SigningOperation *)self initWithKeySpecifier:v4 digestOperation:v5];

  return v6;
}

- (_SFEC_X962SigningOperation)initWithKeySpecifier:(id)a3 digestOperation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)_SFEC_X962SigningOperation;
  v8 = [(_SFEC_X962SigningOperation *)&v18 init];
  if (v8)
  {
    v9 = objc_alloc_init(SFEC_X962SigningOperation_Ivars);
    id x962SigningOperationInternal = v8->_x962SigningOperationInternal;
    v8->_id x962SigningOperationInternal = v9;

    uint64_t v11 = [v6 copy];
    v12 = v8->_x962SigningOperationInternal;
    v13 = (void *)v12[1];
    v12[1] = v11;

    uint64_t v14 = [v7 copyWithZone:0];
    v15 = v8->_x962SigningOperationInternal;
    v16 = (void *)v15[2];
    v15[2] = v14;
  }
  return v8;
}

- (_SFEC_X962SigningOperation)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_SFEC_X962SigningOperation;
  return [(_SFEC_X962SigningOperation *)&v4 init];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  uint64_t v5 = *((void *)self->_x962SigningOperationInternal + 1);
  return (id)[v4 initWithKeySpecifier:v5];
}

- (id)sign:(id)a3 withKey:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    CFErrorRef error = 0;
    v10 = (__SecKey *)[v9 _secKey];
    CFStringRef v11 = (const __CFString *)[*((id *)self->_x962SigningOperationInternal + 2) _secKeyECDSAAlgorithm];
    CFDataRef v12 = (const __CFData *)[(id)objc_opt_class() digest:v8];
    CFDataRef v13 = SecKeyCreateSignature(v10, v11, v12, &error);
    uint64_t v14 = error;
    if (error)
    {
      if (!a5)
      {
        CFRelease(error);
        v15 = 0;
        CFErrorRef error = 0;
        goto LABEL_11;
      }
    }
    else
    {
      if (v13)
      {
        v15 = [[_SFSignedData alloc] initWithData:v8 signature:v13];
        goto LABEL_11;
      }
      if (!a5)
      {
        v15 = 0;
        goto LABEL_11;
      }
      uint64_t v14 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-67688 userInfo:0];
    }
    v15 = 0;
    *a5 = v14;
LABEL_11:

    goto LABEL_12;
  }
  if (a5)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"SFCryptoServicesErrorDomain" code:9 userInfo:0];
    v15 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }
LABEL_12:

  return v15;
}

- (id)verify:(id)a3 withKey:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!a5) {
      goto LABEL_11;
    }
    v16 = [MEMORY[0x1E4F28C58] errorWithDomain:@"SFCryptoServicesErrorDomain" code:9 userInfo:0];
    goto LABEL_10;
  }
  CFErrorRef error = 0;
  v10 = (__SecKey *)[v9 _secKey];
  CFStringRef v11 = (const __CFString *)[*((id *)self->_x962SigningOperationInternal + 2) _secKeyECDSAAlgorithm];
  CFDataRef v12 = objc_opt_class();
  CFDataRef v13 = [v8 data];
  CFDataRef v14 = (const __CFData *)[v12 digest:v13];
  CFDataRef v15 = [v8 signature];
  LODWORD(v14) = SecKeyVerifySignature(v10, v11, v14, v15, &error);

  v16 = error;
  if (v14) {
    BOOL v17 = error == 0;
  }
  else {
    BOOL v17 = 0;
  }
  if (!v17)
  {
    if (!a5)
    {
      CFRelease(error);
LABEL_11:
      objc_super v18 = 0;
      goto LABEL_13;
    }
LABEL_10:
    objc_super v18 = 0;
    *a5 = v16;
    goto LABEL_13;
  }
  objc_super v18 = [v8 data];
LABEL_13:

  return v18;
}

- (_SFECKeySpecifier)signingKeySpecifier
{
  v2 = (void *)[*((id *)self->_x962SigningOperationInternal + 1) copy];
  return (_SFECKeySpecifier *)v2;
}

- (void)setSigningKeySpecifier:(id)a3
{
  *((void *)self->_x962SigningOperationInternal + 1) = [a3 copy];
  MEMORY[0x1F41817F8]();
}

- (SFDigestOperation)digestOperation
{
  return (SFDigestOperation *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDigestOperation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_digestOperation, 0);
  objc_storeStrong(&self->_x962SigningOperationInternal, 0);
}

@end