@interface _SFSymmetricKey
+ (Class)_attributesClass;
- (_SFSymmetricKey)initWithData:(id)a3 specifier:(id)a4 error:(id *)a5;
- (id)initRandomKeyWithSpecifier:(id)a3 error:(id *)a4;
- (id)keyData;
@end

@implementation _SFSymmetricKey

- (void).cxx_destruct
{
}

- (id)initRandomKeyWithSpecifier:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if (!v7)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"SFKey.m", 653, @"Invalid parameter not satisfying: %@", @"specifier" object file lineNumber description];
  }
  size_t v8 = [v7 keyLengthInBytes];
  v9 = malloc_type_malloc(v8, 0xB75DF116uLL);
  if (SecRandomCopyBytes((SecRandomRef)*MEMORY[0x1E4F3BC60], v8, v9))
  {
    if (a4)
    {
      [MEMORY[0x1E4F28C58] errorWithDomain:@"SFKeychainErrorDomain" code:3 userInfo:0];
      v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    id v11 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __52___SFSymmetricKey_initRandomKeyWithSpecifier_error___block_invoke;
    v15[3] = &__block_descriptor_40_e12_v24__0_v8Q16l;
    v15[4] = v8;
    v12 = (void *)[v11 initWithBytesNoCopy:v9 length:v8 deallocator:v15];
    self = [(_SFSymmetricKey *)self initWithData:v12 specifier:v7 error:a4];

    v10 = self;
  }

  return v10;
}

- (_SFSymmetricKey)initWithData:(id)a3 specifier:(id)a4 error:(id *)a5
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
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"SFKey.m", 673, @"Invalid parameter not satisfying: %@", @"data" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  v27 = [MEMORY[0x1E4F28B00] currentHandler];
  [v27 handleFailureInMethod:a2, self, @"SFKey.m", 674, @"Invalid parameter not satisfying: %@", @"keySpecifier2" object file lineNumber description];

LABEL_3:
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = v11;
    uint64_t v13 = [v9 length];
    if (v13 == [v12 keyLengthInBytes])
    {
      v14 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_attributesClass"), "alloc"), "initWithSpecifier:", v12);
      v29.receiver = self;
      v29.super_class = (Class)_SFSymmetricKey;
      v15 = [(_SFKey *)&v29 initWithAttributes:v14];

      if (v15)
      {
        v16 = objc_alloc_init(SFSymmetricKey_Ivars);
        id symmetricKeyInternal = v15->_symmetricKeyInternal;
        v15->_id symmetricKeyInternal = v16;

        size_t v18 = [v9 length];
        v19 = malloc_type_malloc(v18, 0x7110AB8AuLL);
        memcpy(v19, (const void *)[v9 bytes], v18);
        id v20 = objc_alloc(MEMORY[0x1E4F1C9B8]);
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __48___SFSymmetricKey_initWithData_specifier_error___block_invoke;
        v28[3] = &__block_descriptor_40_e12_v24__0_v8Q16l;
        v28[4] = v18;
        uint64_t v21 = [v20 initWithBytesNoCopy:v19 length:v18 deallocator:v28];
        v22 = v15->_symmetricKeyInternal;
        v23 = (void *)v22[1];
        v22[1] = v21;
      }
      self = v15;
      v24 = self;
    }
    else if (a5)
    {
      [MEMORY[0x1E4F28C58] errorWithDomain:@"SFKeychainErrorDomain" code:2 userInfo:0];
      v24 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v24 = 0;
    }
  }
  else if (a5)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"SFCryptoServicesErrorDomain" code:4 userInfo:0];
    v24 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (id)keyData
{
  return *((id *)self->_symmetricKeyInternal + 1);
}

+ (Class)_attributesClass
{
  return (Class)objc_opt_class();
}

@end