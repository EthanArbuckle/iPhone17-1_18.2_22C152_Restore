@interface DurationPickerView
- (_TtC14WorkflowEditor18DurationPickerView)initWithCoder:(id)a3;
- (_TtC14WorkflowEditor18DurationPickerView)initWithFrame:(CGRect)a3;
- (double)pickerView:(id)a3 rowHeightForComponent:(int64_t)a4;
- (double)pickerView:(id)a3 widthForComponent:(int64_t)a4;
- (id)pickerView:(id)a3 viewForRow:(int64_t)a4 forComponent:(int64_t)a5 reusingView:(id)a6;
- (int64_t)numberOfComponentsInPickerView:(id)a3;
- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4;
- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5;
@end

@implementation DurationPickerView

- (_TtC14WorkflowEditor18DurationPickerView)initWithFrame:(CGRect)a3
{
  return (_TtC14WorkflowEditor18DurationPickerView *)sub_2349DFD80();
}

- (_TtC14WorkflowEditor18DurationPickerView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_2349DFEEC();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC14WorkflowEditor18DurationPickerView_timePicker));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC14WorkflowEditor18DurationPickerView_hoursLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC14WorkflowEditor18DurationPickerView_minutesLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC14WorkflowEditor18DurationPickerView_secondsLabel));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC14WorkflowEditor18DurationPickerView_onDurationChange);
  sub_2349159D0(v3);
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 3;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  return sub_2349E0098((uint64_t)self, a4);
}

- (id)pickerView:(id)a3 viewForRow:(int64_t)a4 forComponent:(int64_t)a5 reusingView:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  v12 = self;
  id v13 = sub_2349E0114((uint64_t)v12, a4, a5, a6);

  return v13;
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  id v6 = a3;
  v7 = self;
  sub_2349E04B8();
}

- (double)pickerView:(id)a3 widthForComponent:(int64_t)a4
{
  id v5 = a3;
  id v6 = self;
  double v7 = sub_2349E0794();

  return v7;
}

- (double)pickerView:(id)a3 rowHeightForComponent:(int64_t)a4
{
  id v5 = a3;
  id v6 = self;
  double v7 = sub_2349E07EC();

  return v7;
}

@end