@interface _SFECDHOperation
+ (BOOL)supportsSecureCoding;
+ (id)_defaultOperation;
+ (int64_t)_defaultMode;
+ (int64_t)keySource;
- (_SFECDHOperation)init;
- (_SFECDHOperation)initWithCoder:(id)a3;
- (_SFECDHOperation)initWithMode:(int64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)deriveKeyWithSpecifier:(id)a3 fromKeySource:(id)a4 error:(id *)a5;
- (int64_t)mode;
- (void)setMode:(int64_t)a3;
@end

@implementation _SFECDHOperation

+ (int64_t)keySource
{
  return 1;
}

+ (int64_t)_defaultMode
{
  return 0;
}

+ (id)_defaultOperation
{
  v2 = objc_msgSend(objc_alloc((Class)a1), "initWithMode:", objc_msgSend(a1, "_defaultMode"));
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_SFECDHOperation)init
{
  uint64_t v3 = [(id)objc_opt_class() _defaultMode];
  return [(_SFECDHOperation *)self initWithMode:v3];
}

- (_SFECDHOperation)initWithMode:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_SFECDHOperation;
  v4 = [(_SFECDHOperation *)&v8 init];
  if (v4)
  {
    v5 = objc_alloc_init(SFECDHOperation_Ivars);
    id ecdhOperationInternal = v4->_ecdhOperationInternal;
    v4->_id ecdhOperationInternal = v5;

    *((void *)v4->_ecdhOperationInternal + 1) = a3;
  }
  return v4;
}

- (_SFECDHOperation)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_SFECDHOperation;
  return [(_SFECDHOperation *)&v4 init];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  uint64_t v5 = *((void *)self->_ecdhOperationInternal + 1);
  return (id)[v4 initWithMode:v5];
}

- (id)deriveKeyWithSpecifier:(id)a3 fromKeySource:(id)a4 error:(id *)a5
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v9;
    unint64_t v11 = [v8 keyLengthInBytes];
    if (*((void *)self->_ecdhOperationInternal + 1)) {
      v12 = (const __CFString **)MEMORY[0x1E4F3BA00];
    }
    else {
      v12 = (const __CFString **)MEMORY[0x1E4F3BA08];
    }
    CFStringRef v13 = *v12;
    uint64_t v24 = *MEMORY[0x1E4F3BB48];
    v14 = [NSNumber numberWithUnsignedInteger:v11];
    v25[0] = v14;
    CFDictionaryRef v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];

    v16 = [v10 localKeyPair];
    v17 = (__SecKey *)[v16 _secKey];
    v18 = [v10 remotePublicKey];
    CFDataRef v19 = SecKeyCopyKeyExchangeResult(v17, v13, (SecKeyRef)[v18 _secKey], v15, (CFErrorRef *)a5);

    if ([(__CFData *)v19 length] >= v11)
    {
      id v21 = objc_alloc((Class)[(id)objc_opt_class() keyClass]);
      v22 = -[__CFData subdataWithRange:](v19, "subdataWithRange:", 0, v11);
      v20 = (void *)[v21 initWithData:v22 specifier:v8 error:a5];
    }
    else
    {
      v20 = 0;
    }
  }
  else if (a5)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"SFCryptoServicesErrorDomain" code:4 userInfo:0];
    v20 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (int64_t)mode
{
  return *((void *)self->_ecdhOperationInternal + 1);
}

- (void)setMode:(int64_t)a3
{
  *((void *)self->_ecdhOperationInternal + 1) = a3;
}

- (void).cxx_destruct
{
}

@end