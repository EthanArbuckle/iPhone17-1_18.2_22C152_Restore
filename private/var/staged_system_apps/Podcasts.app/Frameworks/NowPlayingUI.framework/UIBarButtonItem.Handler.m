@interface UIBarButtonItem.Handler
- (_TtCE12NowPlayingUICSo15UIBarButtonItemP33_3C2750B9C1FB5BBBDC498E18BB98C28C7Handler)init;
- (void)handleBarButtonAction:(id)a3;
@end

@implementation UIBarButtonItem.Handler

- (void)handleBarButtonAction:(id)a3
{
  if (a3)
  {
    v3 = *(void (**)(uint64_t))((char *)&self->super.isa
                                        + OBJC_IVAR____TtCE12NowPlayingUICSo15UIBarButtonItemP33_3C2750B9C1FB5BBBDC498E18BB98C28C7Handler__handler);
    v5 = self;
    swift_unknownObjectRetain();
    self;
    uint64_t v4 = swift_dynamicCastObjCClassUnconditional();
    v3(v4);
    swift_unknownObjectRelease();
  }
  else
  {
    __break(1u);
  }
}

- (_TtCE12NowPlayingUICSo15UIBarButtonItemP33_3C2750B9C1FB5BBBDC498E18BB98C28C7Handler)init
{
  result = (_TtCE12NowPlayingUICSo15UIBarButtonItemP33_3C2750B9C1FB5BBBDC498E18BB98C28C7Handler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end