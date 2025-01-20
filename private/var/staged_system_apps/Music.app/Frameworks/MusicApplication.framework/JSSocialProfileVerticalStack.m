@interface JSSocialProfileVerticalStack
@end

@implementation JSSocialProfileVerticalStack

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11MusicJSCore28JSSocialProfileVerticalStack_profile));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11MusicJSCore28JSSocialProfileVerticalStack_artistPageLink));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11MusicJSCore28JSSocialProfileVerticalStack_followRequestsLink));
  swift_release();

  swift_bridgeObjectRelease();
}

@end