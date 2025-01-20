@interface ActivitySummaryChangeListener
- (_TtC10FitnessApp29ActivitySummaryChangeListener)init;
- (void)dealloc;
@end

@implementation ActivitySummaryChangeListener

- (_TtC10FitnessApp29ActivitySummaryChangeListener)init
{
  return (_TtC10FitnessApp29ActivitySummaryChangeListener *)sub_10003C918();
}

- (void)dealloc
{
  v2 = self;
  sub_1005DF9A0();
}

- (void).cxx_destruct
{
  sub_100074898((uint64_t)self + OBJC_IVAR____TtC10FitnessApp29ActivitySummaryChangeListener_noteListener);
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10FitnessApp29ActivitySummaryChangeListener_observers);
}

@end