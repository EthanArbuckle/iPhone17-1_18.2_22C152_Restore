@interface ChannelUpsellHandler
- (_TtC7NewsUI220ChannelUpsellHandler)init;
- (void)handledAction:(id)a3 state:(unint64_t)a4;
@end

@implementation ChannelUpsellHandler

- (_TtC7NewsUI220ChannelUpsellHandler)init
{
  result = (_TtC7NewsUI220ChannelUpsellHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI220ChannelUpsellHandler_dateProvider);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI220ChannelUpsellHandler_localTracker);
  swift_unknownObjectRelease();
  sub_1DEABEEF0(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC7NewsUI220ChannelUpsellHandler_upsellShareClosure));
  sub_1DEABEEF0(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC7NewsUI220ChannelUpsellHandler_upsellCancellationClosure));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI220ChannelUpsellHandler_sceneProvider);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI220ChannelUpsellHandler_offlineProvider);
  swift_release();
  swift_release();
}

- (void)handledAction:(id)a3 state:(unint64_t)a4
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_1DED7E6C0();
  swift_unknownObjectRelease();
}

@end