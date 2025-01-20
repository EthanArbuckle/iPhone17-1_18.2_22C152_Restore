@interface FMDeviceNotificationsView
- (_TtC6FindMy25FMDeviceNotificationsView)initWithCoder:(id)a3;
- (void)notifyWhenDetachedRowTap;
- (void)notifyWhenLeftBehindRowTap;
- (void)setupSubviews;
@end

@implementation FMDeviceNotificationsView

- (_TtC6FindMy25FMDeviceNotificationsView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100248238();
}

- (void)setupSubviews
{
  v2 = self;
  sub_100246248();
}

- (void)notifyWhenDetachedRowTap
{
  v2 = self;
  sub_100247E08();
}

- (void)notifyWhenLeftBehindRowTap
{
  v2 = self;
  sub_100247F6C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMDeviceNotificationsView_notifyWhenFoundSwitch));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMDeviceNotificationsView_notifyWhenDetachedSwitch));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMDeviceNotificationsView_notifyWhenLeftBehindSwitch));
  id v3 = (char *)self + OBJC_IVAR____TtC6FindMy25FMDeviceNotificationsView_delegate;

  sub_100068760((uint64_t)v3);
}

@end