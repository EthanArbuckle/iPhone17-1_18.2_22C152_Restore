@interface NFTrustKey
+ (BOOL)supportsSecureCoding;
+ (id)keyWithIdentifier:(id)a3;
- (NFTrustKey)initWithCoder:(id)a3;
- (NSArray)localValidations;
- (NSData)publicKey;
- (NSNumber)counterLimit;
- (NSNumber)counterValue;
- (NSString)identifier;
- (NSString)keyAttestation;
- (NSString)keyAttestationAuthority;
- (void)encodeWithCoder:(id)a3;
- (void)setCounterLimit:(id)a3;
- (void)setCounterValue:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setKeyAttestation:(id)a3;
- (void)setKeyAttestationAuthority:(id)a3;
- (void)setLocalValidations:(id)a3;
- (void)setPublicKey:(id)a3;
@end

@implementation NFTrustKey

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NFTrustKey)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NFTrustKey;
  v5 = [(NFTrustObject *)&v13 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    [(NFTrustKey *)v5 setValue:v6 forKey:@"identifier"];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"counterLimit"];
    [(NFTrustKey *)v5 setValue:v7 forKey:@"counterLimit"];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"counterValue"];
    [(NFTrustKey *)v5 setValue:v8 forKey:@"counterValue"];

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"keyAttestationAuthority"];
    [(NFTrustKey *)v5 setValue:v9 forKey:@"keyAttestationAuthority"];

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"keyAttestation"];
    [(NFTrustKey *)v5 setValue:v10 forKey:@"keyAttestation"];

    v11 = [MEMORY[0x1E4FBA858] coder:v4 decodeArrayOfArrayOfClass:objc_opt_class() forKey:@"localValidations"];
    [(NFTrustKey *)v5 setValue:v11 forKey:@"localValidations"];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(NFTrustKey *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];

  v6 = [(NFTrustKey *)self counterLimit];
  [v4 encodeObject:v6 forKey:@"counterLimit"];

  v7 = [(NFTrustKey *)self counterValue];
  [v4 encodeObject:v7 forKey:@"counterValue"];

  v8 = [(NFTrustKey *)self keyAttestationAuthority];
  [v4 encodeObject:v8 forKey:@"keyAttestationAuthority"];

  v9 = [(NFTrustKey *)self keyAttestation];
  [v4 encodeObject:v9 forKey:@"keyAttestation"];

  id v10 = [(NFTrustKey *)self localValidations];
  [v4 encodeObject:v10 forKey:@"localValidations"];
}

- (NSData)publicKey
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  publicKey = self->_publicKey;
  if (!publicKey)
  {
    id v4 = (void *)MEMORY[0x1E4FBA880];
    v5 = (void *)MEMORY[0x1E4F1C9B8];
    v6 = [(NFTrustKey *)self keyAttestation];
    v7 = objc_msgSend(v5, "NF_dataWithHexString:", v6);
    v8 = [v4 TLVWithData:v7];

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v20 = v8;
    v9 = [v8 children];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          if ([v14 tag] == 32585)
          {
            v15 = (void *)MEMORY[0x1E4FBA880];
            v16 = [v14 value];
            v17 = [v15 TLVWithData:v16];

            v18 = [v17 value];
            [(NFTrustKey *)self setPublicKey:v18];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v11);
    }

    publicKey = self->_publicKey;
  }
  return publicKey;
}

+ (id)keyWithIdentifier:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    v6 = [NFTrustKey alloc];
    v7 = v6;
    if (v6) {
      [(NFTrustKey *)v6 setIdentifier:v5];
    }
  }
  else
  {
    v8 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v10 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(a1);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(a1);
      Name = sel_getName(a2);
      uint64_t v14 = 45;
      if (isMetaClass) {
        uint64_t v14 = 43;
      }
      v10(3, "%c[%{public}s %{public}s]:%i Could not create NFTrustKey with null identifier", v14, ClassName, Name, 220);
    }
    dispatch_get_specific(*v8);
    v15 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = object_getClass(a1);
      if (class_isMetaClass(v16)) {
        int v17 = 43;
      }
      else {
        int v17 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v21 = v17;
      __int16 v22 = 2082;
      long long v23 = object_getClassName(a1);
      __int16 v24 = 2082;
      v25 = sel_getName(a2);
      __int16 v26 = 1024;
      int v27 = 220;
      _os_log_impl(&dword_19D636000, v15, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Could not create NFTrustKey with null identifier", buf, 0x22u);
    }

    v7 = 0;
  }

  return v7;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void)setPublicKey:(id)a3
{
}

- (NSString)keyAttestationAuthority
{
  return self->_keyAttestationAuthority;
}

- (void)setKeyAttestationAuthority:(id)a3
{
}

- (NSString)keyAttestation
{
  return self->_keyAttestation;
}

- (void)setKeyAttestation:(id)a3
{
}

- (NSNumber)counterLimit
{
  return self->_counterLimit;
}

- (void)setCounterLimit:(id)a3
{
}

- (NSNumber)counterValue
{
  return self->_counterValue;
}

- (void)setCounterValue:(id)a3
{
}

- (NSArray)localValidations
{
  return self->_localValidations;
}

- (void)setLocalValidations:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localValidations, 0);
  objc_storeStrong((id *)&self->_counterValue, 0);
  objc_storeStrong((id *)&self->_counterLimit, 0);
  objc_storeStrong((id *)&self->_keyAttestation, 0);
  objc_storeStrong((id *)&self->_keyAttestationAuthority, 0);
  objc_storeStrong((id *)&self->_publicKey, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end