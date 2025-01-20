@interface JSSocialOnboardingVerticalStack
@end

@implementation JSSocialOnboardingVerticalStack

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_32FC8(*(uint64_t *)((char *)&self->super.super.super.isa
                       + OBJC_IVAR____TtC11MusicJSCore31JSSocialOnboardingVerticalStack_pinnedChildViewModel));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicJSCore31JSSocialOnboardingVerticalStack_nextStepButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicJSCore31JSSocialOnboardingVerticalStack_cancelStepButton));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC11MusicJSCore31JSSocialOnboardingVerticalStack_cancelBarButtonItem);
}

@end