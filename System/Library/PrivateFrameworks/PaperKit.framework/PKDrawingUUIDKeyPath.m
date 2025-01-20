@interface PKDrawingUUIDKeyPath
- (BOOL)isEqual:(id)a3;
- (NSData)AES128Key;
- (NSString)description;
- (NSString)uniqueCacheFilePath;
- (_TtC8PaperKit20PKDrawingUUIDKeyPath)init;
- (int64_t)hash;
@end

@implementation PKDrawingUUIDKeyPath

- (NSString)uniqueCacheFilePath
{
  v2 = self;
  uint64_t v3 = MEMORY[0x21054CA80]();
  unint64_t v5 = v4;
  Data.base64EncodedString(options:)(0);
  outlined consume of Data._Representation(v3, v5);
  lazy protocol witness table accessor for type String and conformance String();
  uint64_t v6 = StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
  uint64_t v8 = v7;

  swift_bridgeObjectRelease();
  v9 = (void *)MEMORY[0x21054D080](v6, v8);
  swift_bridgeObjectRelease();
  return (NSString *)v9;
}

- (NSData)AES128Key
{
  v2 = self;
  uint64_t v3 = PKDrawingUUIDKeyPath.aes128Key.getter();
  unint64_t v5 = v4;

  v6.super.isa = Data._bridgeToObjectiveC()().super.isa;
  outlined consume of Data._Representation(v3, v5);
  return (NSData *)v6.super.isa;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    unint64_t v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    unint64_t v5 = self;
  }
  char v6 = PKDrawingUUIDKeyPath.isEqual(_:)((uint64_t)v8);

  outlined destroy of StocksKitCurrencyCache.Provider?((uint64_t)v8, &demangling cache variable for type metadata for Any?);
  return v6 & 1;
}

- (int64_t)hash
{
  Hasher.init()();
  type metadata accessor for CRKeyPath();
  _sSo7CGPointVABSE12CoreGraphicsWlTm_0((unint64_t *)&lazy protocol witness table cache variable for type CRKeyPath and conformance CRKeyPath, 255, MEMORY[0x263F330F8]);
  uint64_t v3 = self;
  dispatch thunk of Hashable.hash(into:)();
  Swift::Int v4 = Hasher.finalize()();

  return v4;
}

- (NSString)description
{
  v2 = self;
  uint64_t v3 = CRKeyPath.description.getter();
  uint64_t v5 = v4;

  char v6 = (void *)MEMORY[0x21054D080](v3, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (_TtC8PaperKit20PKDrawingUUIDKeyPath)init
{
  result = (_TtC8PaperKit20PKDrawingUUIDKeyPath *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC8PaperKit20PKDrawingUUIDKeyPath_keypath;
  uint64_t v3 = type metadata accessor for CRKeyPath();
  uint64_t v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);
  v4(v2, v3);
}

@end