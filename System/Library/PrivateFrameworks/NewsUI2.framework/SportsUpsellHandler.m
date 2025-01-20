@interface SportsUpsellHandler
- (_TtC7NewsUI219SportsUpsellHandler)init;
- (void)handledAction:(id)a3 state:(unint64_t)a4;
@end

@implementation SportsUpsellHandler

- (_TtC7NewsUI219SportsUpsellHandler)init
{
  result = (_TtC7NewsUI219SportsUpsellHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI219SportsUpsellHandler_tagService);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI219SportsUpsellHandler_store);
  swift_unknownObjectRelease();
  sub_1DEABEEF0(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC7NewsUI219SportsUpsellHandler_onOnboardTapped));
  sub_1DEABEEF0(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC7NewsUI219SportsUpsellHandler_onUpsellCancelled));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC7NewsUI219SportsUpsellHandler____lazy_storage___sportsUpsellConfig);
  sub_1DF2C5184(v3);
}

- (void)handledAction:(id)a3 state:(unint64_t)a4
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_1DF99AA04();
  swift_unknownObjectRelease();
}

@end