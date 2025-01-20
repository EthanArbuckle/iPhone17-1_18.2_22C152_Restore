@interface FMMeNotificationView
- (_TtC6FindMy20FMMeNotificationView)initWithCoder:(id)a3;
- (void)setupSubviews;
@end

@implementation FMMeNotificationView

- (_TtC6FindMy20FMMeNotificationView)initWithCoder:(id)a3
{
  *(void *)&self->super.titleLabel[OBJC_IVAR____TtC6FindMy20FMMeNotificationView_delegate] = 0;
  swift_unknownObjectWeakInit();
  uint64_t v5 = OBJC_IVAR____TtC6FindMy20FMMeNotificationView_allowFriendRequestSwitch;
  id v6 = objc_allocWithZone((Class)type metadata accessor for FMSettingSwitchView());
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)[v6 init];

  result = (_TtC6FindMy20FMMeNotificationView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)setupSubviews
{
  v2 = self;
  sub_1002F54F0();
}

- (void).cxx_destruct
{
  swift_release();
  sub_100068760((uint64_t)self + OBJC_IVAR____TtC6FindMy20FMMeNotificationView_delegate);
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC6FindMy20FMMeNotificationView_allowFriendRequestSwitch);
}

@end