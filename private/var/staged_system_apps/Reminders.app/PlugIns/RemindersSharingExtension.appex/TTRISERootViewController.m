@interface TTRISERootViewController
- (_TtC25RemindersSharingExtension24TTRISERootViewController)initWithCoder:(id)a3;
- (_TtC25RemindersSharingExtension24TTRISERootViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
@end

@implementation TTRISERootViewController

- (void)loadView
{
  v2 = self;
  sub_1000105F0();
}

- (_TtC25RemindersSharingExtension24TTRISERootViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_100022DE0();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC25RemindersSharingExtension24TTRISERootViewController *)sub_100010A54(v5, v7, a4);
}

- (_TtC25RemindersSharingExtension24TTRISERootViewController)initWithCoder:(id)a3
{
  return (_TtC25RemindersSharingExtension24TTRISERootViewController *)sub_100010B9C(a3);
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

  swift_release();
}

@end