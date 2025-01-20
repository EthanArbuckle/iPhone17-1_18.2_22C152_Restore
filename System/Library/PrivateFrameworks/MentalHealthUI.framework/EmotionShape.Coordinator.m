@interface EmotionShape.Coordinator
- (_TtCV14MentalHealthUI12EmotionShape11Coordinator)init;
- (void)handlePanWithSender:(id)a3;
@end

@implementation EmotionShape.Coordinator

- (void)handlePanWithSender:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_256170B24(v4);
}

- (_TtCV14MentalHealthUI12EmotionShape11Coordinator)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtCV14MentalHealthUI12EmotionShape11Coordinator_parent) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for EmotionShape.Coordinator();
  return [(EmotionShape.Coordinator *)&v3 init];
}

- (void).cxx_destruct
{
}

@end