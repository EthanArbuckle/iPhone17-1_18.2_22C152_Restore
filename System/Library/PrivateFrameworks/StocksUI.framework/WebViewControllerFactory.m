@interface WebViewControllerFactory
- (_TtC8StocksUI24WebViewControllerFactory)init;
- (id)createViewControllerForURL:(id)a3;
@end

@implementation WebViewControllerFactory

- (id)createViewControllerForURL:(id)a3
{
  uint64_t v4 = sub_20A8C2530();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  v7 = (char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20A8C24E0();
  uint64_t v12 = 0;
  memset(v11, 0, sizeof(v11));
  v8 = self;
  v9 = sub_20A5B06E8((uint64_t)v7, (uint64_t)v11);
  sub_20A54A6BC((uint64_t)v11);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);

  return v9;
}

- (_TtC8StocksUI24WebViewControllerFactory)init
{
  result = (_TtC8StocksUI24WebViewControllerFactory *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8StocksUI24WebViewControllerFactory_resolver);
  v3 = (char *)self + OBJC_IVAR____TtC8StocksUI24WebViewControllerFactory_sceneStateManager;

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

@end