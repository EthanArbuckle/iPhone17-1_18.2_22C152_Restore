@interface ICAppStoreRatingController
- (BOOL)didRequestRating;
- (ICAppStoreRatingController)init;
- (ICCloudConfiguration)cloudConfiguration;
- (NSArray)launchDates;
- (NSDate)lastEditDate;
- (NSDate)lastInteractionDate;
- (NSDate)lastRequestDate;
- (NSUserDefaults)userDefaults;
- (UIWindowScene)windowScene;
- (int64_t)maximumPersistedLaunchDaysCount;
- (int64_t)totalNoteCount;
- (void)didEdit;
- (void)didInteract;
- (void)didLaunch;
- (void)didStopInteracting;
- (void)setDidRequestRating:(BOOL)a3;
- (void)setLastEditDate:(id)a3;
- (void)setLastInteractionDate:(id)a3;
- (void)setLastRequestDate:(id)a3;
- (void)setMaximumPersistedLaunchDaysCount:(int64_t)a3;
- (void)setTotalNoteCount:(int64_t)a3;
- (void)updateTotalNoteCount:(int64_t)a3;
@end

@implementation ICAppStoreRatingController

- (ICCloudConfiguration)cloudConfiguration
{
  return (ICCloudConfiguration *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                         + OBJC_IVAR___ICAppStoreRatingController_cloudConfiguration));
}

- (NSUserDefaults)userDefaults
{
  return (NSUserDefaults *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                   + OBJC_IVAR___ICAppStoreRatingController_userDefaults));
}

- (UIWindowScene)windowScene
{
  return (UIWindowScene *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                  + OBJC_IVAR___ICAppStoreRatingController_windowScene));
}

- (BOOL)didRequestRating
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___ICAppStoreRatingController_didRequestRating);
}

- (void)setDidRequestRating:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = sub_10002F214((uint64_t *)&unk_1006A3E20);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  *((unsigned char *)&self->super.isa + OBJC_IVAR___ICAppStoreRatingController_didRequestRating) = v3;
  if (v3)
  {
    v8 = self;
    static Date.now.getter();
    uint64_t v9 = type metadata accessor for Date();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v7, 0, 1, v9);
    sub_100490B80((uint64_t)v7);
  }
}

- (NSArray)launchDates
{
  v2 = self;
  sub_100490D5C();

  type metadata accessor for Date();
  v3.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v3.super.isa;
}

- (NSDate)lastRequestDate
{
  uint64_t v3 = sub_10002F214((uint64_t *)&unk_1006A3E20);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = self;
  sub_100490FB8((uint64_t)v5);

  uint64_t v7 = type metadata accessor for Date();
  uint64_t v8 = *(void *)(v7 - 8);
  Class isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    Class isa = Date._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }

  return (NSDate *)isa;
}

- (void)setLastRequestDate:(id)a3
{
  uint64_t v5 = sub_10002F214((uint64_t *)&unk_1006A3E20);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static Date._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v8 = type metadata accessor for Date();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    uint64_t v9 = type metadata accessor for Date();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  uint64_t v10 = self;
  sub_100490B80((uint64_t)v7);
}

- (int64_t)totalNoteCount
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___ICAppStoreRatingController_totalNoteCount);
}

- (void)setTotalNoteCount:(int64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICAppStoreRatingController_totalNoteCount) = (Class)a3;
}

- (NSDate)lastEditDate
{
  return (NSDate *)sub_100491274((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___ICAppStoreRatingController_lastEditDate);
}

- (void)setLastEditDate:(id)a3
{
}

- (NSDate)lastInteractionDate
{
  return (NSDate *)sub_100491274((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___ICAppStoreRatingController_lastInteractionDate);
}

- (void)setLastInteractionDate:(id)a3
{
}

- (int64_t)maximumPersistedLaunchDaysCount
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR___ICAppStoreRatingController_maximumPersistedLaunchDaysCount);
}

- (void)setMaximumPersistedLaunchDaysCount:(int64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICAppStoreRatingController_maximumPersistedLaunchDaysCount) = (Class)a3;
}

- (void)didLaunch
{
  v2 = self;
  sub_1004906D4();
}

- (void)didEdit
{
  v2 = self;
  sub_1004903FC();
}

- (void)didInteract
{
  uint64_t v3 = sub_10002F214((uint64_t *)&unk_1006A3E20);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = self;
  static Date.now.getter();
  uint64_t v7 = type metadata accessor for Date();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v5, 0, 1, v7);
  uint64_t v8 = (uint64_t)v6 + OBJC_IVAR___ICAppStoreRatingController_lastInteractionDate;
  swift_beginAccess();
  sub_10021E98C((uint64_t)v5, v8);
  swift_endAccess();
  id v9 = sub_1004914FC();
  [v9 requestFire];
}

- (void)updateTotalNoteCount:(int64_t)a3
{
  uint64_t v4 = self;
  sub_100490234(a3);
}

- (void)didStopInteracting
{
  v2 = self;
  sub_100491E88();
}

- (ICAppStoreRatingController)init
{
  result = (ICAppStoreRatingController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  sub_10002B754((uint64_t)self + OBJC_IVAR___ICAppStoreRatingController_lastEditDate, (uint64_t *)&unk_1006A3E20);
  sub_10002B754((uint64_t)self + OBJC_IVAR___ICAppStoreRatingController_lastInteractionDate, (uint64_t *)&unk_1006A3E20);
  uint64_t v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR___ICAppStoreRatingController____lazy_storage___interactionSelectorDelayer);
}

@end