@interface _SFECPublicKey
+ (id)_secKeyCreationAttributesForSpecifier:(id)a3;
+ (id)_specifierForSecKey:(__SecKey *)a3;
+ (id)keyWithSubjectPublicKeyInfo:(id)a3;
- (id)encodeSubjectPublicKeyInfo;
- (id)performWithCCKey:(id)a3;
@end

@implementation _SFECPublicKey

+ (id)_specifierForSecKey:(__SecKey *)a3
{
  return ECKeySpecifierForSecKey(a3);
}

+ (id)_secKeyCreationAttributesForSpecifier:(id)a3
{
  id v3 = a3;
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B6D8], (const void *)*MEMORY[0x1E4F3B6F0]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B718], (const void *)*MEMORY[0x1E4F3B740]);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F3B798], (const void *)*MEMORY[0x1E4F1CFD0]);
  v5 = (const void *)*MEMORY[0x1E4F3B708];
  v6 = NSNumber;
  uint64_t v7 = [v3 curve];

  v8 = (const void *)[v6 numberWithInteger:ECKeyBitSize(v7)];
  CFDictionaryAddValue(Mutable, v5, v8);
  return Mutable;
}

- (id)performWithCCKey:(id)a3
{
  error[1] = *(CFErrorRef *)MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, char *, uint64_t))a3;
  v5 = [(_SFKey *)self keySpecifier];
  CCCurveParameters([v5 curve]);
  MEMORY[0x1F4188790]();
  uint64_t v7 = (char *)error - v6;
  error[0] = 0;
  CFDataRef v8 = SecKeyCopyExternalRepresentation(*((SecKeyRef *)self->super._publicKeyInternal + 1), error);
  CFErrorRef v9 = error[0];
  if ([(__CFData *)v8 length]
    && ccec_x963_import_pub_size()
    && ([(_SFKey *)self keySpecifier],
        v10 = objc_claimAutoreleasedReturnValue(),
        CCCurveParameters([v10 curve]),
        [(__CFData *)v8 length],
        [(__CFData *)v8 bytes],
        int v11 = ccec_x963_import_pub(),
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
  v13 = v4[2](v4, v7, v12);

  return v13;
}

- (id)encodeSubjectPublicKeyInfo
{
  [(_SFPublicKey *)self _secKey];
  v2 = (void *)SecKeyCopySubjectPublicKeyInfo();
  return v2;
}

+ (id)keyWithSubjectPublicKeyInfo:(id)a3
{
  uint64_t v3 = SecKeyCreateFromSubjectPublicKeyInfoData();
  if (v3)
  {
    v4 = (const void *)v3;
    v5 = [(_SFPublicKey *)[_SFECPublicKey alloc] initWithSecKey:v3];
    CFRelease(v4);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void).cxx_destruct
{
}

@end