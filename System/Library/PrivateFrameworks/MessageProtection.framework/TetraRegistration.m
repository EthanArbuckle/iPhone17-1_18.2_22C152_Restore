@interface TetraRegistration
- (NSData)registrationData;
- (NSData)serializedECDHPublicKey;
- (NSData)signature;
- (TetraPublicSigningKeyWrapper)signingPublicKey;
- (_TtC17MessageProtection17TetraRegistration)init;
- (_TtC17MessageProtection17TetraRegistration)initWithKyberPublicKey:(id)a3 ecdhPublicKey:(id)a4 timestamp:(double)a5 version:(unsigned int)a6 signedBy:(id)a7;
- (_TtC17MessageProtection17TetraRegistration)initWithTetraRegistrationData:(id)a3 ecdhPublicKey:(id)a4 version:(unsigned int)a5 timestamp:(double)a6 signedBy:(id)a7 isEncrypting:(BOOL)a8 error:(id *)a9;
- (_TtC17MessageProtection22Kyber1024ObjCPublicKey)kyberPublicKey;
- (double)timestamp;
- (unsigned)tetraVersion;
@end

@implementation TetraRegistration

- (NSData)serializedECDHPublicKey
{
  v2 = self;
  result = (NSData *)P256.KeyAgreement.PublicKey.compactRepresentation.getter();
  if (v4 >> 60 == 15)
  {
    __break(1u);
  }
  else
  {
    v5 = result;
    unint64_t v6 = v4;
    v7.super.isa = Data._bridgeToObjectiveC()().super.isa;
    outlined consume of Data?((uint64_t)v5, v6);

    return (NSData *)v7.super.isa;
  }
  return result;
}

- (_TtC17MessageProtection22Kyber1024ObjCPublicKey)kyberPublicKey
{
  return (_TtC17MessageProtection22Kyber1024ObjCPublicKey *)*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC17MessageProtection17TetraRegistration_kyberPublicKey);
}

- (NSData)signature
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC17MessageProtection17TetraRegistration_signature);
  unint64_t v3 = *(void *)&self->_anon_0[OBJC_IVAR____TtC17MessageProtection17TetraRegistration_signature];
  outlined copy of Data._Representation(v2, v3);
  v4.super.isa = Data._bridgeToObjectiveC()().super.isa;
  outlined consume of Data._Representation(v2, v3);
  return (NSData *)v4.super.isa;
}

- (double)timestamp
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC17MessageProtection17TetraRegistration_timestamp);
}

- (unsigned)tetraVersion
{
  return *(_DWORD *)((char *)&self->super.isa + OBJC_IVAR____TtC17MessageProtection17TetraRegistration_tetraVersion);
}

- (TetraPublicSigningKeyWrapper)signingPublicKey
{
  return (TetraPublicSigningKeyWrapper *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                 + OBJC_IVAR____TtC17MessageProtection17TetraRegistration_signingPublicKey));
}

- (_TtC17MessageProtection17TetraRegistration)initWithTetraRegistrationData:(id)a3 ecdhPublicKey:(id)a4 version:(unsigned int)a5 timestamp:(double)a6 signedBy:(id)a7 isEncrypting:(BOOL)a8 error:(id *)a9
{
  return (_TtC17MessageProtection17TetraRegistration *)TetraRegistration.init(tetraRegistrationData:ecdhPublicKey:version:timestamp:signedBy:isEncrypting:)(a3, a4, a5, a7, a8, a6);
}

- (_TtC17MessageProtection17TetraRegistration)initWithKyberPublicKey:(id)a3 ecdhPublicKey:(id)a4 timestamp:(double)a5 version:(unsigned int)a6 signedBy:(id)a7
{
  uint64_t v8 = *(void *)&a6;
  id v11 = a3;
  id v12 = a4;
  id v13 = a7;
  v14 = (_TtC17MessageProtection17TetraRegistration *)specialized TetraRegistration.init(kyberPublicKey:ecdhPublicKey:timestamp:version:signedBy:)(v11, v12, v8, v13, a5);

  return v14;
}

- (NSData)registrationData
{
  uint64_t v2 = self;
  uint64_t v3 = TetraRegistration.registrationData.getter();
  unint64_t v5 = v4;

  v6.super.isa = Data._bridgeToObjectiveC()().super.isa;
  outlined consume of Data._Representation(v3, v5);
  return (NSData *)v6.super.isa;
}

- (_TtC17MessageProtection17TetraRegistration)init
{
  result = (_TtC17MessageProtection17TetraRegistration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC17MessageProtection17TetraRegistration_ecdhPublicKey;
  uint64_t v4 = type metadata accessor for P256.KeyAgreement.PublicKey();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  outlined consume of Data._Representation(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC17MessageProtection17TetraRegistration_signature), *(void *)&self->_anon_0[OBJC_IVAR____TtC17MessageProtection17TetraRegistration_signature]);
  unint64_t v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17MessageProtection17TetraRegistration_signingPublicKey);
}

@end