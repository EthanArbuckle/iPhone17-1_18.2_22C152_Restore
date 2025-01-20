@interface AudioButtonPulseAnimation
- (_TtC21JournalShareExtension25AudioButtonPulseAnimation)init;
- (_TtC21JournalShareExtension25AudioButtonPulseAnimation)initWithCoder:(id)a3;
- (_TtC21JournalShareExtension25AudioButtonPulseAnimation)initWithLayer:(id)a3;
@end

@implementation AudioButtonPulseAnimation

- (_TtC21JournalShareExtension25AudioButtonPulseAnimation)initWithLayer:(id)a3
{
  swift_unknownObjectRetain();
  sub_10010A7B0();
  swift_unknownObjectRelease();
  return (_TtC21JournalShareExtension25AudioButtonPulseAnimation *)sub_100075E14(v4);
}

- (_TtC21JournalShareExtension25AudioButtonPulseAnimation)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1000760A0();
}

- (_TtC21JournalShareExtension25AudioButtonPulseAnimation)init
{
  result = (_TtC21JournalShareExtension25AudioButtonPulseAnimation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC21JournalShareExtension25AudioButtonPulseAnimation_animationGroup));
  swift_bridgeObjectRelease();

  swift_release();
}

@end