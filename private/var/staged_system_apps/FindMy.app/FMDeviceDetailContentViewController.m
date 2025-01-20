@interface FMDeviceDetailContentViewController
- (_TtC6FindMy35FMDeviceDetailContentViewController)initWithCoder:(id)a3;
- (uint64_t)showPairingIncompleteLearnMore;
- (void)handleCancelErase;
- (void)handleDirections;
- (void)handleErase;
- (void)handleFind;
- (void)handleInnaccurateLocationAttentionTap;
- (void)handleLock;
- (void)handleLostMode;
- (void)handleMuteLeft;
- (void)handleMuteRight;
- (void)handleNotificationsOffAttentionTap;
- (void)handlePlaySound;
- (void)handleSeparation;
- (void)handleStopSound;
- (void)removeOrRepairDevice;
- (void)scrollViewDidScroll:(id)a3;
- (void)showMismatchLearnMore;
- (void)showSoundPending;
- (void)showSoundPendingLearnMore;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation FMDeviceDetailContentViewController

- (_TtC6FindMy35FMDeviceDetailContentViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10021E418();
}

- (void)viewDidLoad
{
  v2 = self;
  id v3 = [(FMDeviceDetailContentViewController *)v2 view];
  if (v3)
  {
    v4 = v3;
    [v3 setFrame:CGRectMake(0.0, 0.0, 100.0, 100.0)];

    v5.receiver = v2;
    v5.super_class = (Class)type metadata accessor for FMDeviceDetailContentViewController(0);
    [(FMBaseContentViewController *)&v5 viewDidLoad];
  }
  else
  {
    __break(1u);
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_1001DCE88(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FMDeviceDetailContentViewController(0);
  v4 = (char *)v5.receiver;
  [(FMDeviceDetailContentViewController *)&v5 viewDidAppear:v3];
  sub_1001E85EC();
  if (*(void *)&v4[OBJC_IVAR____TtC6FindMy35FMDeviceDetailContentViewController_lostModeViewModel])
  {
    swift_allocObject();
    swift_unknownObjectWeakInit();
    swift_retain();
    DeviceLostModeManagementViewModel.lostModePresentationBlock.setter();

    swift_release();
  }
  else
  {
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  sub_1001DDCCC(a3);
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_1001DED1C();
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  v7 = self;
  sub_100288434(v4);
  [v4 contentOffset];
  double v6 = 1.0 / v5;
  if (v5 <= 0.0) {
    double v6 = INFINITY;
  }
  if (v6 < 0.01) {
    double v6 = 0.0;
  }
  [*(id *)((char *)&v7->super.super.super.super.isa+ OBJC_IVAR____TtC6FindMy27FMBaseContentViewController_batteryIndicatorView) setAlpha:v6];
}

- (void)handlePlaySound
{
  v2 = self;
  sub_1001F27AC();
}

- (void)handleStopSound
{
  v2 = self;
  sub_1001F5E2C();
}

- (void)handleMuteLeft
{
  v2 = self;
  sub_1001F7AB0();
}

- (void)handleMuteRight
{
  v2 = self;
  sub_1001F7F64();
}

- (void)showSoundPending
{
  v2 = self;
  sub_10020012C();
}

- (void)handleDirections
{
  v2 = self;
  sub_100202A50();
}

- (void)handleFind
{
  v2 = self;
  sub_100203010();
}

- (void)handleLostMode
{
  v2 = self;
  sub_100206800();
}

- (void)handleLock
{
  v2 = self;
  sub_100206CF0();
}

- (void)showSoundPendingLearnMore
{
  v2 = self;
  sub_1002071D8();
}

- (void)showMismatchLearnMore
{
  v2 = self;
  sub_10020774C();
}

- (void)handleErase
{
  v2 = self;
  sub_100207F58();
}

- (void)handleCancelErase
{
  v2 = self;
  sub_100208320();
}

- (void)handleInnaccurateLocationAttentionTap
{
  v2 = self;
  sub_1002089C4();
}

- (void)handleSeparation
{
  v2 = self;
  sub_10020F014();
}

- (void)removeOrRepairDevice
{
  v2 = self;
  sub_100210760();
}

- (void)handleNotificationsOffAttentionTap
{
  v2 = self;
  sub_100222E84();
}

- (void).cxx_destruct
{
  swift_release();
  sub_100068760((uint64_t)self + OBJC_IVAR____TtC6FindMy35FMDeviceDetailContentViewController_delegate);
  sub_100068760((uint64_t)self + OBJC_IVAR____TtC6FindMy35FMDeviceDetailContentViewController_playSoundDelegate);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMDeviceDetailContentViewController_playSoundButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMDeviceDetailContentViewController_muteLeftButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMDeviceDetailContentViewController_muteRightButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMDeviceDetailContentViewController_stopSoundButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMDeviceDetailContentViewController_directionsButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMDeviceDetailContentViewController_findingExperienceCoordinator));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMDeviceDetailContentViewController_itemConnectionManager));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMDeviceDetailContentViewController_findButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMDeviceDetailContentViewController_findingExperiencePresenter));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMDeviceDetailContentViewController_btDeviceDiscoveryToken));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMDeviceDetailContentViewController____lazy_storage___ownerSession));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMDeviceDetailContentViewController_localFindableConnectionMaterialMonitoringSession));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMDeviceDetailContentViewController_connectionMaterialUpdateQueue));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMDeviceDetailContentViewController_errorConditionsAttentionModule));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMDeviceDetailContentViewController_notificationsView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMDeviceDetailContentViewController_showContactDetailsView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMDeviceDetailContentViewController_showContactDetailsWelcomeScreenViewController));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMDeviceDetailContentViewController_trustedLocationsDetailViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMDeviceDetailContentViewController_separationAttention));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMDeviceDetailContentViewController_markAsLostHostingController));
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMDeviceDetailContentViewController_cancelEraseDeviceButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMDeviceDetailContentViewController_eraseDeviceButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMDeviceDetailContentViewController_removeDeviceButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMDeviceDetailContentViewController_inaccurateAttention));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMDeviceDetailContentViewController_soundPendingAttention));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMDeviceDetailContentViewController_mismatchAttention));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMDeviceDetailContentViewController_pairingIncompleteAttention));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMDeviceDetailContentViewController_pairingStatusDebugView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMDeviceDetailContentViewController_notificationsOffAttention));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMDeviceDetailContentViewController_repairModeAttention));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMDeviceDetailContentViewController_firstButtonsStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMDeviceDetailContentViewController_actionButtonsStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMDeviceDetailContentViewController_verticalStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMDeviceDetailContentViewController_verticalStackBottomConstraint));
  sub_100003F10((uint64_t)self + OBJC_IVAR____TtC6FindMy35FMDeviceDetailContentViewController_playSoundInFlight, (uint64_t *)&unk_1006AF6E0);
  sub_100003F10((uint64_t)self + OBJC_IVAR____TtC6FindMy35FMDeviceDetailContentViewController_canShowQueueAlert, (uint64_t *)&unk_1006AF6E0);
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMDeviceDetailContentViewController_actionQueue));
  sub_100003F10((uint64_t)self + OBJC_IVAR____TtC6FindMy35FMDeviceDetailContentViewController_pendingPlaySoundAnalytics, &qword_1006B5E18);
  sub_100003F10((uint64_t)self + OBJC_IVAR____TtC6FindMy35FMDeviceDetailContentViewController_pendingSafeLocation, (uint64_t *)&unk_1006BEB20);
  swift_bridgeObjectRelease();
  sub_100003F10((uint64_t)self + OBJC_IVAR____TtC6FindMy35FMDeviceDetailContentViewController_separationEvent, &qword_1006C0D00);
  swift_release();
  BOOL v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC6FindMy35FMDeviceDetailContentViewController_soundPendingTimer);
}

- (uint64_t)showPairingIncompleteLearnMore
{
  uint64_t v0 = sub_10005D034((uint64_t *)&unk_1006AF820);
  __chkstk_darwin(v0 - 8);
  v2 = (char *)&v17 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = type metadata accessor for URL();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  double v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1006AE190 != -1) {
    swift_once();
  }
  uint64_t v7 = type metadata accessor for Logger();
  sub_1000606BC(v7, (uint64_t)qword_1006D1E98);
  v8 = Logger.logObject.getter();
  os_log_type_t v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "FMDeviceDetailContentViewController: Showing pairing incomplete learn more", v10, 2u);
    swift_slowDealloc();
  }

  URL.init(string:)();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v6, v2, v3);
    id v12 = [self sharedApplication];
    URL._bridgeToObjectiveC()(v13);
    v15 = v14;
    sub_10014C1D0((uint64_t)_swiftEmptyArrayStorage);
    type metadata accessor for OpenExternalURLOptionsKey(0);
    sub_10021E398((unint64_t *)&qword_1006AEA10, type metadata accessor for OpenExternalURLOptionsKey);
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    [v12 openURL:v15 options:isa completionHandler:0];

    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  return result;
}

@end