@interface FMMeViewController
- (_TtC6FindMy18FMMeViewController)initWithCoder:(id)a3;
- (void)dealloc;
- (void)handleClearTags;
- (void)handleEditFindMyNotificationsLabel;
- (void)handleEditSafetyAlertsNotificationsLabel;
- (void)handleLocationLabel;
- (void)traitCollectionDidChange:(id)a3;
- (void)update;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation FMMeViewController

- (_TtC6FindMy18FMMeViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10007E808();
}

- (void)dealloc
{
  v2 = self;
  sub_1000741EC();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy18FMMeViewController_locationSettings));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy18FMMeViewController_stewieSettings));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy18FMMeViewController_locationAlerts));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy18FMMeViewController_notificationView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy18FMMeViewController_editFindMyNotificationSettingsButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy18FMMeViewController_editSafetyAlertsNotificationSettingsButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy18FMMeViewController_nameLocationButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy18FMMeViewController_clearIgnoredTagsButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy18FMMeViewController_helpFriendView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy18FMMeViewController_actionButtonsStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy18FMMeViewController_verticalStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy18FMMeViewController_coarseLabel));
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v3 = (char *)self + OBJC_IVAR____TtC6FindMy18FMMeViewController_delegate;

  sub_100068760((uint64_t)v3);
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_100074530(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_1000770B4(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  sub_100077A88(a3);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1000780E0((uint64_t)a3);
}

- (void)update
{
  v2 = self;
  sub_100074A70();
}

- (void)handleEditFindMyNotificationsLabel
{
  v2 = self;
  sub_10007AF30(0xD000000000000031, 0x800000010057F070);
}

- (void)handleEditSafetyAlertsNotificationsLabel
{
  v2 = self;
  sub_10007AF30(0xD00000000000004ALL, 0x800000010057F020);
}

- (void)handleLocationLabel
{
  v2 = self;
  sub_100079ED8();
}

- (void)handleClearTags
{
  v2 = self;
  sub_10007B710();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_10007CBCC();
}

@end