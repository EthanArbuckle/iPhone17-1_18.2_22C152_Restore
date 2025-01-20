@interface ScheduleTimePickerCell
- (_TtC6FindMyP33_E1D0B8A6ADDE9504767060C8F9C7ED2F22ScheduleTimePickerCell)initWithCoder:(id)a3;
- (_TtC6FindMyP33_E1D0B8A6ADDE9504767060C8F9C7ED2F22ScheduleTimePickerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)timeChanged;
@end

@implementation ScheduleTimePickerCell

- (_TtC6FindMyP33_E1D0B8A6ADDE9504767060C8F9C7ED2F22ScheduleTimePickerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
  }
  return (_TtC6FindMyP33_E1D0B8A6ADDE9504767060C8F9C7ED2F22ScheduleTimePickerCell *)sub_1000AE270(v4, v5);
}

- (_TtC6FindMyP33_E1D0B8A6ADDE9504767060C8F9C7ED2F22ScheduleTimePickerCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1000AE4F0();
}

- (void)timeChanged
{
  if (swift_unknownObjectWeakLoadStrong())
  {
    id v3 = self;
    sub_10009D26C((uint64_t)v3);

    swift_unknownObjectRelease();
  }
}

- (void).cxx_destruct
{
  sub_100068760((uint64_t)self + OBJC_IVAR____TtC6FindMyP33_E1D0B8A6ADDE9504767060C8F9C7ED2F22ScheduleTimePickerCell_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMyP33_E1D0B8A6ADDE9504767060C8F9C7ED2F22ScheduleTimePickerCell_timePicker));
  id v3 = (char *)self + OBJC_IVAR____TtC6FindMyP33_E1D0B8A6ADDE9504767060C8F9C7ED2F22ScheduleTimePickerCell_gregorian;
  uint64_t v4 = type metadata accessor for Calendar();
  uint64_t v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end