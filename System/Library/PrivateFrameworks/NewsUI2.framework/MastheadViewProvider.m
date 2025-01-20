@interface MastheadViewProvider
- (_TtC7NewsUI220MastheadViewProvider)init;
- (void)bundleSubscriptionDidExpire:(id)a3;
@end

@implementation MastheadViewProvider

- (_TtC7NewsUI220MastheadViewProvider)init
{
  result = (_TtC7NewsUI220MastheadViewProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI220MastheadViewProvider_layoutAttributesFactory);
  v3 = (char *)self + OBJC_IVAR____TtC7NewsUI220MastheadViewProvider_margins;
  uint64_t v4 = sub_1DFDF2A50();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  swift_release();

  swift_release();
  sub_1DF1905C8((uint64_t)self + OBJC_IVAR____TtC7NewsUI220MastheadViewProvider_lastLayoutOptions);
  sub_1DEB1DDEC((uint64_t)self + OBJC_IVAR____TtC7NewsUI220MastheadViewProvider_mastheadable);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

- (void)bundleSubscriptionDidExpire:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1DF190700();
}

@end