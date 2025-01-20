@interface JSInlinePopup
@end

@implementation JSInlinePopup

- (void).cxx_destruct
{
  sub_1A500((uint64_t)self + OBJC_IVAR____TtC11MusicJSCore13JSInlinePopup_delegate);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11MusicJSCore13JSInlinePopup_childViewModel);
}

@end