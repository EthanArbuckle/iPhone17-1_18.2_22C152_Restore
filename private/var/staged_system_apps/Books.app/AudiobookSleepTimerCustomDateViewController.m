@interface AudiobookSleepTimerCustomDateViewController
- (_TtC5Books43AudiobookSleepTimerCustomDateViewController)initWithCoder:(id)a3;
- (_TtC5Books43AudiobookSleepTimerCustomDateViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
@end

@implementation AudiobookSleepTimerCustomDateViewController

- (void)loadView
{
  v2 = self;
  sub_1003EE0D0();
}

- (_TtC5Books43AudiobookSleepTimerCustomDateViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    sub_1007FDC70();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v7 = 0;
  }
  uint64_t v8 = OBJC_IVAR____TtC5Books43AudiobookSleepTimerCustomDateViewController_datePicker;
  id v9 = objc_allocWithZone((Class)UIDatePicker);
  v10 = self;
  id v11 = a4;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)[v9 init];

  if (v7)
  {
    NSString v12 = sub_1007FDC30();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v12 = 0;
  }
  v15.receiver = v10;
  v15.super_class = (Class)type metadata accessor for AudiobookSleepTimerCustomDateViewController();
  v13 = [(AudiobookSleepTimerCustomDateViewController *)&v15 initWithNibName:v12 bundle:v11];

  return v13;
}

- (_TtC5Books43AudiobookSleepTimerCustomDateViewController)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC5Books43AudiobookSleepTimerCustomDateViewController_datePicker;
  id v6 = objc_allocWithZone((Class)UIDatePicker);
  id v7 = a3;
  uint64_t v8 = self;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)[v6 init];

  v11.receiver = v8;
  v11.super_class = (Class)type metadata accessor for AudiobookSleepTimerCustomDateViewController();
  id v9 = [(AudiobookSleepTimerCustomDateViewController *)&v11 initWithCoder:v7];

  return v9;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books43AudiobookSleepTimerCustomDateViewController_datePicker));
}

@end