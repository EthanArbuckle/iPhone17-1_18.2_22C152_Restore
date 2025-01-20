@interface DivingLocationAnnotationView
- (_TtC10FitnessApp28DivingLocationAnnotationView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4;
- (_TtC10FitnessApp28DivingLocationAnnotationView)initWithCoder:(id)a3;
@end

@implementation DivingLocationAnnotationView

- (_TtC10FitnessApp28DivingLocationAnnotationView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  uint64_t v7 = swift_unknownObjectRetain();
  return (_TtC10FitnessApp28DivingLocationAnnotationView *)sub_10034AC6C(v7, v4, v6);
}

- (_TtC10FitnessApp28DivingLocationAnnotationView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC10FitnessApp28DivingLocationAnnotationView_pinSize) = (Class)0x402E000000000000;
  type metadata accessor for DivingLocationAnnotationView();
  swift_deallocPartialClassInstance();
  return 0;
}

@end