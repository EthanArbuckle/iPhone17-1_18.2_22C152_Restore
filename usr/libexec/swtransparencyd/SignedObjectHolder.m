@interface SignedObjectHolder
+ (id)parseFromData:(id)a3 error:(id *)a4;
+ (id)signedTypeWithObject:(id)a3;
+ (id)signedTypeWithObject:(id)a3 verifier:(id)a4 dataStore:(id)a5;
- (BOOL)hasSignature;
- (NSData)object;
- (Signature)signature;
- (SignedObject)signedObject;
- (SignedObjectHolder)init;
- (TransparencyManagedDataStore)dataStore;
- (TransparencySignatureVerifier)verifier;
- (id)data;
- (id)diagnosticsJsonDictionary;
- (id)signatureDiagnosticsJsonDictionary;
- (unint64_t)verifyWithError:(id *)a3;
- (void)setDataStore:(id)a3;
- (void)setObject:(id)a3;
- (void)setSignature:(id)a3;
- (void)setSignedObject:(id)a3;
- (void)setVerifier:(id)a3;
@end

@implementation SignedObjectHolder

- (NSData)object
{
  v2 = [(SignedObjectHolder *)self signedObject];
  v3 = [v2 object];

  return (NSData *)v3;
}

- (void)setObject:(id)a3
{
  id v4 = a3;
  id v5 = [(SignedObjectHolder *)self signedObject];
  [v5 setObject:v4];
}

- (Signature)signature
{
  v2 = [(SignedObjectHolder *)self signedObject];
  v3 = [v2 signature];

  return (Signature *)v3;
}

- (void)setSignature:(id)a3
{
  id v4 = a3;
  id v5 = [(SignedObjectHolder *)self signedObject];
  [v5 setSignature:v4];
}

- (BOOL)hasSignature
{
  v2 = [(SignedObjectHolder *)self signedObject];
  unsigned __int8 v3 = [v2 hasSignature];

  return v3;
}

- (id)data
{
  v2 = [(SignedObjectHolder *)self signedObject];
  unsigned __int8 v3 = [v2 data];

  return v3;
}

- (SignedObjectHolder)init
{
  v5.receiver = self;
  v5.super_class = (Class)SignedObjectHolder;
  v2 = [(SignedObjectHolder *)&v5 init];
  if (v2)
  {
    unsigned __int8 v3 = objc_alloc_init(SignedObject);
    [(SignedObjectHolder *)v2 setSignedObject:v3];
  }
  return v2;
}

+ (id)parseFromData:(id)a3 error:(id *)a4
{
  objc_super v5 = +[TransparencyGPBMessage parseFromData:a3 error:a4];
  if (v5)
  {
    v6 = [a1 signedTypeWithObject:v5];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)signedTypeWithObject:(id)a3 verifier:(id)a4 dataStore:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = objc_opt_class();
  if (v10 == objc_opt_class())
  {
    id v13 = +[NSException exceptionWithName:@"AbstractClassException" reason:@"This is an abstract class. To use it, please subclass." userInfo:0];
    objc_exception_throw(v13);
  }
  v11 = objc_alloc_init(SignedObjectHolder);

  return v11;
}

+ (id)signedTypeWithObject:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  if (v4 == objc_opt_class())
  {
    id v7 = +[NSException exceptionWithName:@"AbstractClassException" reason:@"This is an abstract class. To use it, please subclass." userInfo:0];
    objc_exception_throw(v7);
  }
  objc_super v5 = objc_alloc_init(SignedObjectHolder);

  return v5;
}

- (id)signatureDiagnosticsJsonDictionary
{
  v14[0] = @"signature";
  id v3 = [(SignedObjectHolder *)self signature];
  uint64_t v4 = [v3 signature];
  objc_super v5 = objc_msgSend(v4, "kt_hexString");
  v15[0] = v5;
  v14[1] = @"signingKeySpkiHash";
  v6 = [(SignedObjectHolder *)self signature];
  id v7 = [v6 signingKeySpkihash];
  id v8 = [v7 kt_hexString];
  v15[1] = v8;
  v14[2] = @"algorithm";
  id v9 = Signature_SignatureAlgorithm_EnumDescriptor();
  uint64_t v10 = [(SignedObjectHolder *)self signature];
  v11 = [v9 textFormatNameForValue:[v10 algorithm]];
  v15[2] = v11;
  v12 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:3];

  return v12;
}

- (id)diagnosticsJsonDictionary
{
  id v3 = +[NSMutableDictionary dictionary];
  uint64_t v4 = [(SignedObjectHolder *)self object];
  objc_super v5 = [v4 kt_hexString];
  [v3 setObject:v5 forKeyedSubscript:@"object"];

  v6 = [(SignedObjectHolder *)self signatureDiagnosticsJsonDictionary];
  [v3 setObject:v6 forKeyedSubscript:@"signature"];

  return v3;
}

- (unint64_t)verifyWithError:(id *)a3
{
  uint64_t v3 = objc_opt_class();
  if (v3 == objc_opt_class())
  {
    id v5 = +[NSException exceptionWithName:@"AbstractClassException" reason:@"This is an abstract class. To use it, please subclass." userInfo:0];
    objc_exception_throw(v5);
  }
  return 0;
}

- (SignedObject)signedObject
{
  return (SignedObject *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSignedObject:(id)a3
{
}

- (TransparencySignatureVerifier)verifier
{
  return (TransparencySignatureVerifier *)objc_getProperty(self, a2, 16, 1);
}

- (void)setVerifier:(id)a3
{
}

- (TransparencyManagedDataStore)dataStore
{
  return (TransparencyManagedDataStore *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDataStore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataStore, 0);
  objc_storeStrong((id *)&self->_verifier, 0);

  objc_storeStrong((id *)&self->_signedObject, 0);
}

@end