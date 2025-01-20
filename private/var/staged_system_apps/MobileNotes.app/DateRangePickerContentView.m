@interface DateRangePickerContentView
- (_TtC11MobileNotes26DateRangePickerContentView)initWithCoder:(id)a3;
- (_TtC11MobileNotes26DateRangePickerContentView)initWithFrame:(CGRect)a3;
- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5;
- (int64_t)numberOfComponentsInPickerView:(id)a3;
- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4;
- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5;
@end

@implementation DateRangePickerContentView

- (_TtC11MobileNotes26DateRangePickerContentView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC11MobileNotes26DateRangePickerContentView____lazy_storage___dateRangePicker) = 0;

  result = (_TtC11MobileNotes26DateRangePickerContentView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 2;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  if (a4 != 1)
  {
    if (a4) {
      return 0;
    }
    v6 = self;
    id v7 = a3;
    v8 = self;
    if ([v6 isArabic]) {
      goto LABEL_4;
    }
LABEL_6:
    v9 = (int64_t *)&ICDateFilterTypeSelectionRelativeRangeAmountMax;
    goto LABEL_7;
  }
  v10 = self;
  id v11 = a3;
  v12 = self;
  if ([v10 isArabic]) {
    goto LABEL_6;
  }
LABEL_4:
  v9 = (int64_t *)&ICDateFilterRelativeRangeSelectionTypeValidCount;
LABEL_7:
  int64_t v13 = *v9;

  return v13;
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  id v8 = a3;
  v9 = self;
  sub_1003D0F44(a4, a5);
  uint64_t v11 = v10;

  if (v11)
  {
    NSString v12 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v12 = 0;
  }

  return v12;
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  id v7 = a3;
  id v8 = self;
  sub_1003D1120(v7, a5);
}

- (_TtC11MobileNotes26DateRangePickerContentView)initWithFrame:(CGRect)a3
{
  result = (_TtC11MobileNotes26DateRangePickerContentView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100018FE8((uint64_t)self + OBJC_IVAR____TtC11MobileNotes26DateRangePickerContentView_configuration);
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC11MobileNotes26DateRangePickerContentView____lazy_storage___dateRangePicker);
}

@end