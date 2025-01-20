@interface _SFKeyPair
+ (Class)_attributesClass;
+ (id)_secKeyCreationAttributesForSpecifier:(id)a3;
- (NSString)privateKeyDomain;
- (_SFKeyPair)initWithAttributes:(id)a3;
- (_SFKeyPair)initWithData:(id)a3 specifier:(id)a4 error:(id *)a5;
- (_SFKeyPair)initWithSecKey:(__SecKey *)a3;
- (_SFPublicKey)publicKey;
- (__SecKey)_secKey;
- (id)initRandomKeyPairWithSpecifier:(id)a3;
- (id)initRandomKeyPairWithSpecifier:(id)a3 privateKeyDomain:(id)a4;
- (id)keyData;
- (void)dealloc;
@end

@implementation _SFKeyPair

+ (Class)_attributesClass
{
  return (Class)objc_opt_class();
}

+ (id)_secKeyCreationAttributesForSpecifier:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  v6 = NSStringFromClass((Class)a1);
  v7 = NSStringFromSelector(a2);
  [v5 handleFailureInMethod:a2, a1, @"SFKey.m", 819, @"subclass %@ must implement %@", v6, v7 object file lineNumber description];

  return 0;
}

- (_SFKeyPair)initWithAttributes:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_SFKeyPair;
  return [(_SFKey *)&v4 initWithAttributes:a3];
}

- (_SFKeyPair)initWithData:(id)a3 specifier:(id)a4 error:(id *)a5
{
  CFDataRef v9 = (const __CFData *)a3;
  id v10 = a4;
  v11 = v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"SFKey.m", 835, @"Invalid parameter not satisfying: %@", @"data" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  v20 = [MEMORY[0x1E4F28B00] currentHandler];
  [v20 handleFailureInMethod:a2, self, @"SFKey.m", 836, @"Invalid parameter not satisfying: %@", @"specifier2" object file lineNumber description];

LABEL_3:
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = v11;
    CFDictionaryRef v13 = (const __CFDictionary *)[(id)objc_opt_class() _secKeyCreationAttributesForSpecifier:v12];
    SecKeyRef v14 = SecKeyCreateWithData(v9, v13, (CFErrorRef *)a5);
    if (v14)
    {
      SecKeyRef v15 = v14;
      v16 = [(_SFKeyPair *)self initWithSecKey:v14];
      CFRelease(v15);
    }
    else
    {

      v16 = 0;
    }
    self = v16;

    v17 = self;
  }
  else if (a5)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"SFCryptoServicesErrorDomain" code:4 userInfo:0];
    v17 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (_SFKeyPair)initWithSecKey:(__SecKey *)a3
{
  if (!a3)
  {
    CFDictionaryRef v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"SFKey.m", 860, @"Invalid parameter not satisfying: %@", @"secKey" object file lineNumber description];
  }
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_attributesClass"), "alloc");
  v6 = [(id)objc_opt_class() _specifierForSecKey:a3];
  v7 = (void *)[v5 initWithSpecifier:v6];
  v14.receiver = self;
  v14.super_class = (Class)_SFKeyPair;
  v8 = [(_SFKey *)&v14 initWithAttributes:v7];

  if (v8)
  {
    CFDataRef v9 = objc_alloc_init(SFKeyPair_Ivars);
    id keyPairInternal = v8->_keyPairInternal;
    v8->_id keyPairInternal = v9;

    *((void *)v8->_keyPairInternal + 1) = a3;
    CFRetain(*((CFTypeRef *)v8->_keyPairInternal + 1));
  }
  return v8;
}

- (id)initRandomKeyPairWithSpecifier:(id)a3
{
  return [(_SFKeyPair *)self initRandomKeyPairWithSpecifier:a3 privateKeyDomain:@"SFKeyDomainCPU"];
}

- (id)initRandomKeyPairWithSpecifier:(id)a3 privateKeyDomain:(id)a4
{
  id v5 = a3;
  v6 = objc_opt_new();
  v7 = [(_SFKeyPair *)self initWithData:v6 specifier:v5 error:0];

  return v7;
}

- (_SFPublicKey)publicKey
{
  return 0;
}

- (NSString)privateKeyDomain
{
  v2 = (void *)[*((id *)self->_keyPairInternal + 2) copy];
  return (NSString *)v2;
}

- (__SecKey)_secKey
{
  return (__SecKey *)*((void *)self->_keyPairInternal + 1);
}

- (id)keyData
{
  CFDataRef v2 = SecKeyCopyExternalRepresentation(*((SecKeyRef *)self->_keyPairInternal + 1), 0);
  return v2;
}

- (void)dealloc
{
  v3 = (const void *)*((void *)self->_keyPairInternal + 1);
  if (v3)
  {
    CFRelease(v3);
    *((void *)self->_keyPairInternal + 1) = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)_SFKeyPair;
  [(_SFKeyPair *)&v4 dealloc];
}

- (void).cxx_destruct
{
}

@end