@interface FMItemDetailContentViewController
- (_TtC6FindMy33FMItemDetailContentViewController)initWithCoder:(id)a3;
- (void)handleDirections;
- (void)handleFind;
- (void)handleInnaccurateLocationAttentionTap;
- (void)handleLocationServicesOffTap;
- (void)handleLostMode;
- (void)handleLowBattery;
- (void)handleNotificationsOffAttentionTap;
- (void)handleNotifyMe;
- (void)handlePlaySound;
- (void)handleRemoveItem;
- (void)handleRename;
- (void)handleSeparation;
- (void)handleSerialNumberTap;
- (void)scrollViewDidScroll:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation FMItemDetailContentViewController

- (_TtC6FindMy33FMItemDetailContentViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1003B5EDC();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_10039890C();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_100398AB0(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FMItemDetailContentViewController(0);
  id v4 = v5.receiver;
  [(FMItemDetailContentViewController *)&v5 viewDidAppear:v3];
  sub_1003A5404();
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v4 = self;
  sub_100398C8C(a3);
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_1003994B8();
}

- (void)scrollViewDidScroll:(id)a3
{
  uint64_t v5 = type metadata accessor for FMItemDetailViewModel();
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = a3;
  v9 = self;
  sub_100288434(v8);
  uint64_t v10 = *(uint64_t *)((char *)&v9->super.super.super.super.isa
                   + OBJC_IVAR____TtC6FindMy33FMItemDetailContentViewController_dataSource)
      + OBJC_IVAR____TtC6FindMy22FMItemDetailDataSource_itemViewModel;
  swift_beginAccess();
  sub_1003B80E0(v10, (uint64_t)v7, (uint64_t (*)(void))type metadata accessor for FMItemDetailViewModel);
  sub_10039C304((uint64_t)v7);
  sub_1003B5850((uint64_t)v7, (uint64_t (*)(void))type metadata accessor for FMItemDetailViewModel);
}

- (void)handleLowBattery
{
  v2 = self;
  sub_1003A2D8C();
}

- (void)handleDirections
{
  v2 = self;
  sub_1003A3CE0();
}

- (void)handleSerialNumberTap
{
  v2 = self;
  sub_1003A47DC();
}

- (void)handleFind
{
  v2 = self;
  sub_1003A4A10();
}

- (void)handlePlaySound
{
  v2 = self;
  sub_1003AE3B8();
}

- (void)handleNotifyMe
{
  v2 = self;
  sub_1003AED34();
}

- (void)handleRemoveItem
{
  v2 = self;
  sub_1003AF0A8();
}

- (void)handleSeparation
{
  v2 = self;
  sub_1003AF118();
}

- (void)handleRename
{
  v2 = self;
  sub_1003B0898();
}

- (void)handleLostMode
{
  v2 = self;
  sub_1003B2584();
}

- (void)handleNotificationsOffAttentionTap
{
  v2 = self;
  sub_1003B8F4C();
}

- (void)handleInnaccurateLocationAttentionTap
{
  v2 = self;
  sub_1003B2A48();
}

- (void)handleLocationServicesOffTap
{
  v2 = self;
  sub_1003B8F4C();
}

- (void).cxx_destruct
{
  sub_100068760((uint64_t)self + OBJC_IVAR____TtC6FindMy33FMItemDetailContentViewController_delegate);
  sub_100068760((uint64_t)self + OBJC_IVAR____TtC6FindMy33FMItemDetailContentViewController_playSoundDelegate);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy33FMItemDetailContentViewController_playSoundButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy33FMItemDetailContentViewController_directionsButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy33FMItemDetailContentViewController_findButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy33FMItemDetailContentViewController_markAsLostView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy33FMItemDetailContentViewController_sharingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy33FMItemDetailContentViewController_markAsLostHostingController));
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy33FMItemDetailContentViewController_trustedLocationsDetailViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy33FMItemDetailContentViewController_notificationsView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy33FMItemDetailContentViewController_accessoryDetailView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy33FMItemDetailContentViewController_locationServicesAttention));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy33FMItemDetailContentViewController_lowBatteryAttention));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy33FMItemDetailContentViewController_inaccurateAttention));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy33FMItemDetailContentViewController_lostModeAttention));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy33FMItemDetailContentViewController_separationAttention));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy33FMItemDetailContentViewController_soundErrorAttention));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy33FMItemDetailContentViewController_sharingCircleUpdatedAttention));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy33FMItemDetailContentViewController_notificationsOffAttention));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy33FMItemDetailContentViewController_firstButtonsStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy33FMItemDetailContentViewController_bottomActionsModule));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy33FMItemDetailContentViewController_verticalStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy33FMItemDetailContentViewController_verticalStackBottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy33FMItemDetailContentViewController_itemConnectionManager));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy33FMItemDetailContentViewController_findingExperiencePresenter));
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy33FMItemDetailContentViewController_errorConditionsAttentionModule));
  sub_100003F10((uint64_t)self + OBJC_IVAR____TtC6FindMy33FMItemDetailContentViewController_pendingSafeLocation, (uint64_t *)&unk_1006BEB20);
  swift_bridgeObjectRelease();
  sub_100003F10((uint64_t)self + OBJC_IVAR____TtC6FindMy33FMItemDetailContentViewController_separationEvent, &qword_1006C0D00);

  swift_release();
}

@end