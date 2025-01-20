@interface _SFKey
+ (Class)_attributesClass;
+ (id)_specifierForSecKey:(__SecKey *)a3;
- (BOOL)isEqual:(id)a3;
- (NSData)keyData;
- (NSString)keyDomain;
- (_SFKey)initWithAttributes:(id)a3;
- (_SFKey)initWithData:(id)a3 specifier:(id)a4 error:(id *)a5;
- (_SFKeySpecifier)keySpecifier;
- (id)initRandomKeyWithSpecifier:(id)a3;
@end

@implementation _SFKey

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyData, 0);
  objc_storeStrong(&self->_keyInternal, 0);
}

- (_SFKey)initWithAttributes:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_SFKey;
  v5 = [(_SFKey *)&v12 init];
  if (v5)
  {
    v6 = objc_alloc_init(SFKey_Ivars);
    id keyInternal = v5->_keyInternal;
    v5->_id keyInternal = v6;

    uint64_t v8 = [v4 copyWithZone:0];
    v9 = v5->_keyInternal;
    v10 = (void *)v9[1];
    v9[1] = v8;
  }
  return v5;
}

+ (Class)_attributesClass
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"SFKey.m" lineNumber:583 description:@"attempt to get attributes class from abstract base class SFKey - must be provided by subclass"];

  return 0;
}

+ (id)_specifierForSecKey:(__SecKey *)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:a1 file:@"SFKey.m" lineNumber:589 description:@"attempt to get sec key specifier from abstract base class SFKey - must be provided by subclass"];

  return 0;
}

- (_SFKey)initWithData:(id)a3 specifier:(id)a4 error:(id *)a5
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = NSString;
  v9 = (objc_class *)objc_opt_class();
  v10 = NSStringFromClass(v9);
  uint64_t v11 = [v8 stringWithFormat:@"attempt to initialize abstract base class %@ - initialize a concrete subclass instead", v10];

  id v12 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:v11 userInfo:0];
  objc_exception_throw(v12);
}

- (id)initRandomKeyWithSpecifier:(id)a3
{
  id v3 = a3;
  id v4 = NSString;
  v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  uint64_t v7 = [v4 stringWithFormat:@"attempt to creata random key for abstract base class %@ - initialize a concrete subclass instead", v6];

  id v8 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:v7 userInfo:0];
  objc_exception_throw(v8);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_SFKey *)a3;
  v5 = v4;
  if (self == v4)
  {
    char v9 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v6 = v5;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = [(_SFKey *)self keyData];
      id v8 = [(_SFKey *)v6 keyData];
      char v9 = [v7 isEqual:v8];
    }
    else
    {
      char v9 = 0;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (_SFKeySpecifier)keySpecifier
{
  v2 = [*((id *)self->_keyInternal + 1) keySpecifier];
  id v3 = (void *)[v2 copy];

  return (_SFKeySpecifier *)v3;
}

- (NSString)keyDomain
{
  v2 = [*((id *)self->_keyInternal + 1) keyDomain];
  id v3 = (void *)[v2 copy];

  return (NSString *)v3;
}

- (NSData)keyData
{
  return self->_keyData;
}

@end