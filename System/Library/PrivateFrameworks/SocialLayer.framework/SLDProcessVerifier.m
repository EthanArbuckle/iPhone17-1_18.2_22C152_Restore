@interface SLDProcessVerifier
+ (id)tagDataFromString:(id)a3;
- (SLDProcessVerifier)init;
- (id)signProcess:(id)a3 tag:(id)a4 error:(id *)a5;
- (id)verifyData:(id)a3 tag:(id)a4 error:(id *)a5;
@end

@implementation SLDProcessVerifier

+ (id)tagDataFromString:(id)a3
{
  uint64_t v4 = type metadata accessor for String.Encoding();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3
    && (static String._unconditionallyBridgeFromObjectiveC(_:)(),
        static String.Encoding.utf8.getter(),
        uint64_t v8 = String.data(using:allowLossyConversion:)(),
        unint64_t v10 = v9,
        (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4),
        swift_bridgeObjectRelease(),
        v10 >> 60 != 15))
  {
    Class isa = Data._bridgeToObjectiveC()().super.isa;
    outlined consume of Data?(v8, v10);
  }
  else
  {
    Class isa = 0;
  }
  return isa;
}

- (id)signProcess:(id)a3 tag:(id)a4 error:(id *)a5
{
  if (a4)
  {
    id v8 = a3;
    unint64_t v9 = self;
    id v10 = a4;
    uint64_t v11 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v13 = v12;
  }
  else
  {
    id v14 = a3;
    v15 = self;
    uint64_t v11 = 0;
    unint64_t v13 = 0xF000000000000000;
  }
  v16 = ProcessVerifier.sign(process:tag:)(a3, v11, v13);
  unint64_t v18 = v17;

  outlined consume of Data?(v11, v13);
  v19.super.Class isa = Data._bridgeToObjectiveC()().super.isa;
  outlined consume of Data._Representation((uint64_t)v16, v18);
  return v19.super.isa;
}

- (id)verifyData:(id)a3 tag:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = self;
  id v9 = a4;
  uint64_t v10 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v12 = v11;

  if (v9)
  {
    unint64_t v13 = (uint8_t *)static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v15 = v14;
  }
  else
  {
    unint64_t v13 = 0;
    unint64_t v15 = 0xF000000000000000;
  }
  v16 = ProcessVerifier.verify(data:tag:)(v10, v12, v13, v15);

  outlined consume of Data?((uint64_t)v13, v15);
  outlined consume of Data._Representation(v10, v12);
  return v16;
}

- (SLDProcessVerifier)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  *((unsigned char *)&self->super.isa + OBJC_IVAR___SLDProcessVerifier_useStaticKeyForTesting) = 0;
  uint64_t v4 = (char *)self + OBJC_IVAR___SLDProcessVerifier____lazy_storage___staticTestingKey;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SymmetricKey?);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v4, 1, 1, v5);
  v7.receiver = self;
  v7.super_class = ObjectType;
  return [(SLDProcessVerifier *)&v7 init];
}

- (void).cxx_destruct
{
}

@end