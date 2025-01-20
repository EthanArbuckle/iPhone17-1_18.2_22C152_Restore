@interface StoreProductRequester
- (_TtC17PromotedContentUI21StoreProductRequester)init;
- (void)productViewController:(id)a3 didFinishWithResult:(int64_t)a4;
@end

@implementation StoreProductRequester

- (_TtC17PromotedContentUI21StoreProductRequester)init
{
  result = (_TtC17PromotedContentUI21StoreProductRequester *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC17PromotedContentUI21StoreProductRequester_actionResult;
  uint64_t v4 = sub_1B5DB9E88();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_1B5CF6804((uint64_t)self + OBJC_IVAR____TtC17PromotedContentUI21StoreProductRequester_actionDelegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17PromotedContentUI21StoreProductRequester_adamIdentifier));
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  sub_1B5CEF924((uint64_t)self + OBJC_IVAR____TtC17PromotedContentUI21StoreProductRequester_backgroundedTime, (uint64_t *)&unk_1EB8493A0);
  swift_bridgeObjectRelease();
  v5 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC17PromotedContentUI21StoreProductRequester_storeProductViewController);
}

- (void)productViewController:(id)a3 didFinishWithResult:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  sub_1B5D7AB14(a4);
}

@end