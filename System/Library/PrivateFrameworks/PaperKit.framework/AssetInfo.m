@interface AssetInfo
- (BOOL)isEqual:(id)a3;
- (_TtC8PaperKit9AssetInfo)init;
- (int64_t)hash;
@end

@implementation AssetInfo

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  BOOL v6 = AssetInfo.isEqual(_:)((uint64_t)v8);

  outlined destroy of StocksKitCurrencyCache.Provider?((uint64_t)v8, &demangling cache variable for type metadata for Any?);
  return v6;
}

- (int64_t)hash
{
  Hasher.init()();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8PaperKit9AssetInfo_digest);
  unint64_t v4 = *(void *)&self->digest[OBJC_IVAR____TtC8PaperKit9AssetInfo_digest];
  v5 = self;
  outlined copy of Data._Representation(v3, v4);
  Data.hash(into:)();
  outlined consume of Data._Representation(v3, v4);
  Hasher._combine(_:)(*(Swift::UInt *)((char *)&v5->super.isa + OBJC_IVAR____TtC8PaperKit9AssetInfo_maxDimensionInPixels));
  Swift::Int v6 = Hasher.finalize()();

  return v6;
}

- (_TtC8PaperKit9AssetInfo)init
{
  result = (_TtC8PaperKit9AssetInfo *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end