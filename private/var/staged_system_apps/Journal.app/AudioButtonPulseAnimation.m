@interface AudioButtonPulseAnimation
- (_TtC7Journal25AudioButtonPulseAnimation)init;
- (_TtC7Journal25AudioButtonPulseAnimation)initWithCoder:(id)a3;
- (_TtC7Journal25AudioButtonPulseAnimation)initWithLayer:(id)a3;
@end

@implementation AudioButtonPulseAnimation

- (_TtC7Journal25AudioButtonPulseAnimation)initWithLayer:(id)a3
{
  swift_unknownObjectRetain();
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  return (_TtC7Journal25AudioButtonPulseAnimation *)sub_1002F503C(v4);
}

- (_TtC7Journal25AudioButtonPulseAnimation)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1002F6158();
}

- (_TtC7Journal25AudioButtonPulseAnimation)init
{
  result = (_TtC7Journal25AudioButtonPulseAnimation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC7Journal25AudioButtonPulseAnimation_animationGroup));
  swift_bridgeObjectRelease();

  swift_release();
}

@end