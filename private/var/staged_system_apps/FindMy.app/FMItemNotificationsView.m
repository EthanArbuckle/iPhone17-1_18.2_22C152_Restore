@interface FMItemNotificationsView
- (_TtC6FindMy23FMItemNotificationsView)initWithCoder:(id)a3;
- (void)notifyWhenLeftBehindRowTap;
- (void)setupSubviews;
@end

@implementation FMItemNotificationsView

- (_TtC6FindMy23FMItemNotificationsView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1003FC93C();
}

- (void)setupSubviews
{
  v2 = self;
  sub_1003FB478();
}

- (void)notifyWhenLeftBehindRowTap
{
  v2 = self;
  sub_1003FC64C();
}

- (void).cxx_destruct
{
  sub_100068760((uint64_t)self + OBJC_IVAR____TtC6FindMy23FMItemNotificationsView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy23FMItemNotificationsView_notifyWhenFoundSwitch));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC6FindMy23FMItemNotificationsView_notifyWhenLeftBehindSwitch);
}

@end