@interface FMPauseNotificationsViewController
- (_TtC6FindMy34FMPauseNotificationsViewController)initWithCoder:(id)a3;
- (void)cancelAction;
- (void)dateChanged;
- (void)doneAction;
- (void)viewDidLoad;
@end

@implementation FMPauseNotificationsViewController

- (_TtC6FindMy34FMPauseNotificationsViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10041AD08();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1004173DC();
}

- (void)dateChanged
{
  v2 = self;
  sub_10041899C();
}

- (void)cancelAction
{
}

- (void)doneAction
{
  v2 = self;
  sub_10041993C();
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy34FMPauseNotificationsViewController_datePicker));
  sub_100003F10((uint64_t)self + OBJC_IVAR____TtC6FindMy34FMPauseNotificationsViewController_selectedDate, (uint64_t *)&unk_1006AF6E0);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy34FMPauseNotificationsViewController_pauseSection));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy34FMPauseNotificationsViewController_calendarSection));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy34FMPauseNotificationsViewController_pausedUntilView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy34FMPauseNotificationsViewController_doneButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy34FMPauseNotificationsViewController_resumeNotificationMessageLabel));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC6FindMy34FMPauseNotificationsViewController_dateFormatter);
}

@end