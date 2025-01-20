@interface KeyPathWrapper
- (BOOL)isEqual:(id)a3;
- (_TtC8PaperKitP33_F808299E7C487FAE28308AED5F0A446914KeyPathWrapper)init;
- (int64_t)hash;
@end

@implementation KeyPathWrapper

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
  char v6 = KeyPathWrapper.isEqual(_:)((uint64_t)v8);

  outlined destroy of StocksKitCurrencyCache.Provider?((uint64_t)v8, &demangling cache variable for type metadata for Any?);
  return v6 & 1;
}

- (int64_t)hash
{
  Hasher.init()();
  type metadata accessor for CRKeyPath();
  lazy protocol witness table accessor for type CRKeyPath and conformance CRKeyPath((unint64_t *)&lazy protocol witness table cache variable for type CRKeyPath and conformance CRKeyPath);
  v3 = self;
  dispatch thunk of Hashable.hash(into:)();
  Swift::Int v4 = Hasher.finalize()();

  return v4;
}

- (_TtC8PaperKitP33_F808299E7C487FAE28308AED5F0A446914KeyPathWrapper)init
{
  result = (_TtC8PaperKitP33_F808299E7C487FAE28308AED5F0A446914KeyPathWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC8PaperKitP33_F808299E7C487FAE28308AED5F0A446914KeyPathWrapper_path;
  uint64_t v3 = type metadata accessor for CRKeyPath();
  Swift::Int v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);
  v4(v2, v3);
}

@end