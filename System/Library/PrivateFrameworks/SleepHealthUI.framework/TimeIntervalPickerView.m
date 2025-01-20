@interface TimeIntervalPickerView
- (_TtC13SleepHealthUI22TimeIntervalPickerView)initWithCoder:(id)a3;
- (_TtC13SleepHealthUI22TimeIntervalPickerView)initWithFrame:(CGRect)a3;
- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5;
- (int64_t)numberOfComponentsInPickerView:(id)a3;
- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4;
- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5;
@end

@implementation TimeIntervalPickerView

- (_TtC13SleepHealthUI22TimeIntervalPickerView)initWithCoder:(id)a3
{
  return (_TtC13SleepHealthUI22TimeIntervalPickerView *)sub_1AD9010D4(a3);
}

- (_TtC13SleepHealthUI22TimeIntervalPickerView)initWithFrame:(CGRect)a3
{
  result = (_TtC13SleepHealthUI22TimeIntervalPickerView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI22TimeIntervalPickerView____lazy_storage___hourFormatter));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC13SleepHealthUI22TimeIntervalPickerView____lazy_storage___minuteFormatter);
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  if (*((unsigned char *)&self->super.super._constraintsExceptingSubviewAutoresizingConstraints
       + OBJC_IVAR____TtC13SleepHealthUI22TimeIntervalPickerView_configuration))
    return 1;
  else {
    return 2;
  }
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  return sub_1AD901CB8(a4);
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  id v8 = a3;
  v9 = self;
  sub_1AD901F88(a4, a5);
  uint64_t v11 = v10;

  if (v11)
  {
    v12 = (void *)sub_1AD9DF6D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  id v8 = a3;
  uint64_t v10 = self;
  sub_1AD9017B4((char *)a4, a5, 1, v9);
}

@end