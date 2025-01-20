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

    v11 = +[NFNSCheckedDecoder coder:v4 decodeArrayOfArrayOfClass:objc_opt_class() forKey:@"localValidations"];
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
  publicKey = self->_publicKey;
  if (!publicKey)
  {
    id v4 = [(NFTrustKey *)self keyAttestation];
    v5 = +[NSData NF_dataWithHexString:v4];
    v6 = +[NFTLV TLVWithData:v5];

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v17 = v6;
    v7 = [v6 children];
    id v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v19;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          if ([v12 tag] == 32585)
          {
            objc_super v13 = [v12 value];
            v14 = +[NFTLV TLVWithData:v13];

            v15 = [v14 value];
            [(NFTrustKey *)self setPublicKey:v15];
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v9);
    }

    publicKey = self->_publicKey;
  }

  return publicKey;
}

+ (id)keyWithIdentifier:(id)a3
{
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
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v9 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(a1);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(a1);
      Name = sel_getName(a2);
      uint64_t v13 = 45;
      if (isMetaClass) {
        uint64_t v13 = 43;
      }
      v9(3, "%c[%{public}s %{public}s]:%i Could not create NFTrustKey with null identifier", v13, ClassName, Name, 220);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v14 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = object_getClass(a1);
      if (class_isMetaClass(v15)) {
        int v16 = 43;
      }
      else {
        int v16 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v20 = v16;
      __int16 v21 = 2082;
      v22 = object_getClassName(a1);
      __int16 v23 = 2082;
      v24 = sel_getName(a2);
      __int16 v25 = 1024;
      int v26 = 220;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Could not create NFTrustKey with null identifier", buf, 0x22u);
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