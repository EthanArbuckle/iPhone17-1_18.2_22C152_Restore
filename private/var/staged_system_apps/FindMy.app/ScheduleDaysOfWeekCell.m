@interface ScheduleDaysOfWeekCell
- (_TtC6FindMyP33_E1D0B8A6ADDE9504767060C8F9C7ED2F22ScheduleDaysOfWeekCell)initWithCoder:(id)a3;
- (_TtC6FindMyP33_E1D0B8A6ADDE9504767060C8F9C7ED2F22ScheduleDaysOfWeekCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)dayButtonPressed:(id)a3;
@end

@implementation ScheduleDaysOfWeekCell

- (void)dayButtonPressed:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000AA058((uint64_t)v4);
}

- (_TtC6FindMyP33_E1D0B8A6ADDE9504767060C8F9C7ED2F22ScheduleDaysOfWeekCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (_TtC6FindMyP33_E1D0B8A6ADDE9504767060C8F9C7ED2F22ScheduleDaysOfWeekCell *)sub_1000AA724(a3, (uint64_t)a4, v6);
}

- (_TtC6FindMyP33_E1D0B8A6ADDE9504767060C8F9C7ED2F22ScheduleDaysOfWeekCell)initWithCoder:(id)a3
{
  *(void *)&self->delegate[OBJC_IVAR____TtC6FindMyP33_E1D0B8A6ADDE9504767060C8F9C7ED2F22ScheduleDaysOfWeekCell_delegate] = 0;
  swift_unknownObjectWeakInit();
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC6FindMyP33_E1D0B8A6ADDE9504767060C8F9C7ED2F22ScheduleDaysOfWeekCell_isEditable) = 1;
  id v5 = a3;

  result = (_TtC6FindMyP33_E1D0B8A6ADDE9504767060C8F9C7ED2F22ScheduleDaysOfWeekCell *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100068760((uint64_t)self + OBJC_IVAR____TtC6FindMyP33_E1D0B8A6ADDE9504767060C8F9C7ED2F22ScheduleDaysOfWeekCell_delegate);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMyP33_E1D0B8A6ADDE9504767060C8F9C7ED2F22ScheduleDaysOfWeekCell_buttonsContainerView));
  v3 = (char *)self + OBJC_IVAR____TtC6FindMyP33_E1D0B8A6ADDE9504767060C8F9C7ED2F22ScheduleDaysOfWeekCell_daysOfWeek;
  uint64_t v4 = type metadata accessor for FMFSchedule.DaysOfWeek();
  id v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end