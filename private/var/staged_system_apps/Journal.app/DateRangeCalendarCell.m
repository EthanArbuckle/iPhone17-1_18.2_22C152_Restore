@interface DateRangeCalendarCell
- (_TtC7Journal21DateRangeCalendarCell)initWithCoder:(id)a3;
- (_TtC7Journal21DateRangeCalendarCell)initWithFrame:(CGRect)a3;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
- (void)datePickerValueChangedWithDatePicker:(id)a3;
@end

@implementation DateRangeCalendarCell

- (_TtC7Journal21DateRangeCalendarCell)initWithFrame:(CGRect)a3
{
  return (_TtC7Journal21DateRangeCalendarCell *)sub_1004FFD64(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7Journal21DateRangeCalendarCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100501000();
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = type metadata accessor for UICellConfigurationState();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UICellConfigurationState._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  sub_1005003BC();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)datePickerValueChangedWithDatePicker:(id)a3
{
  uint64_t v5 = type metadata accessor for Date();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (swift_unknownObjectWeakLoadStrong())
  {
    id v9 = a3;
    v10 = self;
    id v11 = [v9 date];
    static Date._unconditionallyBridgeFromObjectiveC(_:)();

    sub_1002C6990((uint64_t)v8, (uint64_t)v10);
    swift_unknownObjectRelease();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal21DateRangeCalendarCell_datePicker));
  sub_1000109BC((uint64_t)self + OBJC_IVAR____TtC7Journal21DateRangeCalendarCell_delegate);
  id v3 = (char *)self + OBJC_IVAR____TtC7Journal21DateRangeCalendarCell__date;
  uint64_t v4 = sub_100010218(&qword_10080D5E8);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = (char *)self + OBJC_IVAR____TtC7Journal21DateRangeCalendarCell__minimumDate;
  uint64_t v6 = sub_100010218(&qword_10080FAA0);
  v8 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);
  ((void (*)(void *__return_ptr, char *, uint64_t))v8)((void *)(v6 - 8), v5, v6);
  uint64_t v7 = (char *)self + OBJC_IVAR____TtC7Journal21DateRangeCalendarCell__maximumDate;

  v8(v7, v6);
}

@end