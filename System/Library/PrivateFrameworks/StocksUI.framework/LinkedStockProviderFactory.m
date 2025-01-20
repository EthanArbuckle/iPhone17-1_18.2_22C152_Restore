@interface LinkedStockProviderFactory
- (_TtC8StocksUI26LinkedStockProviderFactory)init;
- (id)createLinkedContentProviderForArticle:(id)a3;
@end

@implementation LinkedStockProviderFactory

- (id)createLinkedContentProviderForArticle:(id)a3
{
  sub_20A4342F4((uint64_t)self + OBJC_IVAR____TtC8StocksUI26LinkedStockProviderFactory_metadataManager, (uint64_t)v14);
  v5 = (objc_class *)type metadata accessor for LinkedStockProvider();
  v6 = (char *)objc_allocWithZone(v5);
  uint64_t v7 = OBJC_IVAR____TtC8StocksUI19LinkedStockProvider_stocks;
  id v8 = a3;
  v9 = self;
  v10 = v6;
  sub_20A4D0788(MEMORY[0x263F8EE78]);
  sub_20A6684E4();
  swift_allocObject();
  *(void *)&v6[v7] = sub_20A8C63E0();
  sub_20A4342F4((uint64_t)v14, (uint64_t)&v10[OBJC_IVAR____TtC8StocksUI19LinkedStockProvider_metadataManager]);

  v13.receiver = v10;
  v13.super_class = v5;
  v11 = [(LinkedStockProviderFactory *)&v13 init];
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);

  return v11;
}

- (_TtC8StocksUI26LinkedStockProviderFactory)init
{
  result = (_TtC8StocksUI26LinkedStockProviderFactory *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end