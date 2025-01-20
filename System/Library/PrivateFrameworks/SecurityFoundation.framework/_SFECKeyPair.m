@interface _SFECKeyPair
+ (id)_secKeyCreationAttributesForSpecifier:(id)a3;
+ (id)_specifierForSecKey:(__SecKey *)a3;
- (id)initRandomKeyPairWithSpecifier:(id)a3;
- (id)initRandomKeyPairWithSpecifier:(id)a3 privateKeyDomain:(id)a4;
- (id)performWithCCKey:(id)a3;
- (id)publicKey;
@end

@implementation _SFECKeyPair

+ (id)_specifierForSecKey:(__SecKey *)a3
{
  return ECKeySpecifierForSecKey(a3);
}

+ (id)_secKeyCreationAttributesForSpecifier:(id)a3
{
  id v3 = a3;
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B6D8], (const void *)*MEMORY[0x1E4F3B6E8]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B718], (const void *)*MEMORY[0x1E4F3B740]);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F3B798], (const void *)*MEMORY[0x1E4F1CFD0]);
  v5 = (const void *)*MEMORY[0x1E4F3B708];
  v6 = NSNumber;
  uint64_t v7 = [v3 curve];

  v8 = (const void *)[v6 numberWithInteger:ECKeyBitSize(v7)];
  CFDictionaryAddValue(Mutable, v5, v8);
  return Mutable;
}

- (id)initRandomKeyPairWithSpecifier:(id)a3
{
  return [(_SFECKeyPair *)self initRandomKeyPairWithSpecifier:a3 privateKeyDomain:@"SFKeyDomainCPU"];
}

- (id)initRandomKeyPairWithSpecifier:(id)a3 privateKeyDomain:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2 object:self file:@"SFKey.m" lineNumber:1066 description:@"specifier not set"];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v7;
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F3B718], (const void *)*MEMORY[0x1E4F3B740]);
    v11 = (const void *)*MEMORY[0x1E4F3B708];
    v12 = (const void *)objc_msgSend(NSNumber, "numberWithInteger:", ECKeyBitSize(objc_msgSend(v9, "curve")));
    CFDictionarySetValue(Mutable, v11, v12);
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F3B798], (const void *)*MEMORY[0x1E4F1CFD0]);
    CFErrorRef error = 0;
    SecKeyRef v13 = SecKeyCreateRandomKey(Mutable, &error);
    v19.receiver = self;
    v19.super_class = (Class)_SFECKeyPair;
    v14 = [(_SFKeyPair *)&v19 initWithSecKey:v13];
    v15 = v14;
    if (v14 && error)
    {

      CFRelease(error);
      v15 = 0;
    }
    CFRelease(Mutable);
    CFRelease(v13);
    self = v15;

    v16 = self;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)publicKey
{
  SecKeyRef v2 = SecKeyCopyPublicKey([(_SFKeyPair *)self _secKey]);
  id v3 = [(_SFPublicKey *)[_SFECPublicKey alloc] initWithSecKey:v2];
  if (v2) {
    CFRelease(v2);
  }
  return v3;
}

- (id)performWithCCKey:(id)a3
{
  error[1] = *(CFErrorRef *)MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, char *, uint64_t))a3;
  v5 = [(_SFKey *)self keySpecifier];
  CCCurveParameters([v5 curve]);
  MEMORY[0x1F4188790]();
  id v7 = (char *)error - v6;
  error[0] = 0;
  CFDataRef v8 = SecKeyCopyExternalRepresentation(*((SecKeyRef *)self->super._keyPairInternal + 1), error);
  CFErrorRef v9 = error[0];
  if ([(__CFData *)v8 length]
    && ccec_x963_import_priv_size()
    && ([(_SFKey *)self keySpecifier],
        v10 = objc_claimAutoreleasedReturnValue(),
        CCCurveParameters([v10 curve]),
        [(__CFData *)v8 length],
        [(__CFData *)v8 bytes],
        int v11 = ccec_x963_import_priv(),
        v10,
        !v11))
  {
    uint64_t v12 = 0;
  }
  else
  {
    uint64_t v12 = (uint64_t)v9;
    if (!v9)
    {
      uint64_t v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"SFKeychainErrorDomain" code:2 userInfo:0];
      CFErrorRef v9 = (CFErrorRef)v12;
    }
  }
  SecKeyRef v13 = v4[2](v4, v7, v12);

  return v13;
}

- (void).cxx_destruct
{
}

@end