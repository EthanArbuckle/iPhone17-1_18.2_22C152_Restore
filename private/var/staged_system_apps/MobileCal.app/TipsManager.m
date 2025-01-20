@interface TipsManager
+ (_TtC9MobileCal11TipsManager)shared;
- (_TtC9MobileCal11TipsManager)init;
- (uint64_t)configureTipsCenter;
- (void)addTipObserversFor:(id)a3 todayButton:(id)a4;
- (void)dismissTipIfPresentedWithCompletionBlock:(id)a3;
- (void)jumpToTodayActionPerformed;
- (void)setIsPortraitOrientationTo:(BOOL)a3;
- (void)setIsSelectedDateFiveDaysAwayFromTodayTo:(BOOL)a3;
- (void)setShouldDisplayJumpToTodayTipTo:(BOOL)a3;
- (void)updatePresentedController:(id)a3;
@end

@implementation TipsManager

+ (_TtC9MobileCal11TipsManager)shared
{
  if (qword_100215D38 != -1) {
    swift_once();
  }
  v2 = (void *)static TipsManager.shared;

  return (_TtC9MobileCal11TipsManager *)v2;
}

- (void)addTipObserversFor:(id)a3 todayButton:(id)a4
{
  id fora = a3;
  id v6 = a4;
  v7 = self;
  TipsManager.addTipObservers(for:todayButton:)((UIViewController)fora, (UIBarButtonItem)v6);
}

- (_TtC9MobileCal11TipsManager)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9MobileCal11TipsManager_tipObservationTask) = 0;
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC9MobileCal11TipsManager____lazy_storage___jumpToTodayTip) = 1;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for TipsManager();
  return [(TipsManager *)&v4 init];
}

- (uint64_t)configureTipsCenter
{
  uint64_t v0 = type metadata accessor for Tips.ConfigurationOption.AnalyticsEngine();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  v3 = (char *)&v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for Tips.ConfigurationOption.DatastoreLocation();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for Tips.ConfigurationOption.DisplayFrequency();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t result = __chkstk_darwin();
  v12 = (char *)&v13 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((byte_100216040 & 1) == 0)
  {
    uint64_t v14 = v5;
    uint64_t v15 = v4;
    uint64_t v16 = v1;
    uint64_t v17 = v0;
    byte_100216040 = 1;
    sub_100013AAC(&qword_100216110);
    type metadata accessor for Tips.ConfigurationOption();
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_1001C1AE0;
    static Tips.ConfigurationOption.DisplayFrequency.system.getter();
    static Tips.ConfigurationOption.displayFrequency(_:)();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
    static Tips.ConfigurationOption.DatastoreLocation.tipsGroupContainer.getter();
    static Tips.ConfigurationOption.datastoreLocation(_:)();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v7, v15);
    static Tips.ConfigurationOption.AnalyticsEngine.coreAnalytics.getter();
    static Tips.ConfigurationOption.analyticsEngine(_:)();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v3, v17);
    static Tips.configure(_:)();
    return swift_bridgeObjectRelease();
  }
  return result;
}

- (void)setIsPortraitOrientationTo:(BOOL)a3
{
}

- (void)updatePresentedController:(id)a3
{
  if (byte_100216040 == 1)
  {
    Strong = (void *)swift_unknownObjectWeakLoadStrong();
    id v6 = a3;
    v7 = self;

    if (!Strong) {
      swift_unknownObjectWeakAssign();
    }
  }
}

- (void)dismissTipIfPresentedWithCompletionBlock:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  _Block_copy(v4);
  uint64_t v5 = self;
  sub_1001420EC((uint64_t)v5, (void (**)(void))v4);
  _Block_release(v4);
  _Block_release(v4);
}

- (void).cxx_destruct
{
  swift_release();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();

  swift_unknownObjectWeakDestroy();
}

- (void)jumpToTodayActionPerformed
{
  uint64_t v3 = type metadata accessor for Tips.InvalidationReason();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  id v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100024554();
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, enum case for Tips.InvalidationReason.actionPerformed(_:), v3);
  sub_100024218();
  v7 = self;
  Tip.invalidate(reason:)();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

- (void)setIsSelectedDateFiveDaysAwayFromTodayTo:(BOOL)a3
{
}

- (void)setShouldDisplayJumpToTodayTipTo:(BOOL)a3
{
}

@end