@interface EditDatePickerViewController
- (_TtC5Books28EditDatePickerViewController)initWithCoder:(id)a3;
- (_TtC5Books28EditDatePickerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
@end

@implementation EditDatePickerViewController

- (void)loadView
{
  v2 = self;
  sub_1003D1084();
}

- (_TtC5Books28EditDatePickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_1007FDC70();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC5Books28EditDatePickerViewController *)sub_1003D1510(v5, v7, a4);
}

- (_TtC5Books28EditDatePickerViewController)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC5Books28EditDatePickerViewController_datePicker;
  id v6 = objc_allocWithZone((Class)UIDatePicker);
  id v7 = a3;
  id v8 = self;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)[v6 init];
  v9 = (char *)v8 + OBJC_IVAR____TtC5Books28EditDatePickerViewController_initialDate;
  uint64_t v10 = sub_1007F2BA0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 1, 1, v10);

  v13.receiver = v8;
  v13.super_class = (Class)type metadata accessor for EditDatePickerViewController();
  v11 = [(EditDatePickerViewController *)&v13 initWithCoder:v7];

  return v11;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books28EditDatePickerViewController_datePicker));
  v3 = (char *)self + OBJC_IVAR____TtC5Books28EditDatePickerViewController_initialDate;

  sub_1003459F4((uint64_t)v3);
}

@end