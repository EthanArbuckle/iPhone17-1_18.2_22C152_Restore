@interface NGMTetraRegistrationSignatureFormatter
- (BOOL)isStillValidToDecrypt;
- (BOOL)isStillValidToEncrypt;
- (NGMTetraRegistrationSignatureFormatter)initWithKyberPublicKey:(id)a3 ecdhPublicKey:(id)a4 timestamp:(double)a5 tetraVersion:(unsigned int)a6;
- (NGMTetraRegistrationSignatureFormatter)initWithTetraRegistration:(id)a3;
- (NSData)ecdhPublicKey;
- (_TtC17MessageProtection22Kyber1024ObjCPublicKey)kyberPublicKey;
- (double)timestamp;
- (id)signedData;
- (unsigned)tetraVersion;
@end

@implementation NGMTetraRegistrationSignatureFormatter

- (NGMTetraRegistrationSignatureFormatter)initWithKyberPublicKey:(id)a3 ecdhPublicKey:(id)a4 timestamp:(double)a5 tetraVersion:(unsigned int)a6
{
  id v11 = a3;
  id v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)NGMTetraRegistrationSignatureFormatter;
  v13 = [(NGMTetraRegistrationSignatureFormatter *)&v16 init];
  v14 = v13;
  if (v13)
  {
    v13->_timestamp = a5;
    v13->_tetraVersion = a6;
    objc_storeStrong((id *)&v13->_kyberPublicKey, a3);
    objc_storeStrong((id *)&v14->_ecdhPublicKey, a4);
  }

  return v14;
}

- (NGMTetraRegistrationSignatureFormatter)initWithTetraRegistration:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NGMTetraRegistrationSignatureFormatter;
  v5 = [(NGMTetraRegistrationSignatureFormatter *)&v12 init];
  if (v5)
  {
    [v4 timestamp];
    v5->_timestamp = v6;
    v5->_tetraVersion = [v4 tetraVersion];
    uint64_t v7 = [v4 kyberPublicKey];
    kyberPublicKey = v5->_kyberPublicKey;
    v5->_kyberPublicKey = (_TtC17MessageProtection22Kyber1024ObjCPublicKey *)v7;

    uint64_t v9 = [v4 serializedECDHPublicKey];
    ecdhPublicKey = v5->_ecdhPublicKey;
    v5->_ecdhPublicKey = (NSData *)v9;
  }
  return v5;
}

- (id)signedData
{
  [(NGMTetraRegistrationSignatureFormatter *)self timestamp];
  uint64_t v13 = v3;
  id v4 = (void *)MEMORY[0x263EFF990];
  v5 = [@"com.apple.Tetra.Registration" dataUsingEncoding:4];
  double v6 = [v4 dataWithData:v5];

  uint64_t v7 = [(NGMTetraRegistrationSignatureFormatter *)self kyberPublicKey];
  v8 = [v7 dataRepresentation];
  [v6 appendData:v8];

  uint64_t v9 = [(NGMTetraRegistrationSignatureFormatter *)self ecdhPublicKey];
  [v6 appendData:v9];

  v10 = [MEMORY[0x263EFF990] dataWithBytes:&v13 length:8];
  [v6 appendData:v10];

  id v11 = [MEMORY[0x263EFF990] dataWithBytes:&self->_tetraVersion length:4];
  [v6 appendData:v11];

  return v6;
}

- (BOOL)isStillValidToEncrypt
{
  [(NGMTetraRegistrationSignatureFormatter *)self timestamp];
  return +[NGMTimeBasedEvaluations validateFetchedPrekeyTimestamp:forEvaluationType:](NGMTimeBasedEvaluations, "validateFetchedPrekeyTimestamp:forEvaluationType:", 1);
}

- (BOOL)isStillValidToDecrypt
{
  [(NGMTetraRegistrationSignatureFormatter *)self timestamp];
  return +[NGMTimeBasedEvaluations validateFetchedPrekeyTimestamp:forEvaluationType:](NGMTimeBasedEvaluations, "validateFetchedPrekeyTimestamp:forEvaluationType:", 2);
}

- (double)timestamp
{
  return self->_timestamp;
}

- (unsigned)tetraVersion
{
  return self->_tetraVersion;
}

- (_TtC17MessageProtection22Kyber1024ObjCPublicKey)kyberPublicKey
{
  return self->_kyberPublicKey;
}

- (NSData)ecdhPublicKey
{
  return self->_ecdhPublicKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ecdhPublicKey, 0);
  objc_storeStrong((id *)&self->_kyberPublicKey, 0);
}

@end