@interface MTForegroundSyncUtil
+ (MTForegroundSyncUtil)sharedInstance;
- (MTForegroundSyncUtil)init;
- (NSDate)lastExpectedFeedsUpdateDate;
- (void)feedUpdateAllPodcastsOnForeground;
- (void)setLastExpectedFeedsUpdateDate:(id)a3;
- (void)setNeedsSyncing;
- (void)startCloudSyncAfterPrivacy;
- (void)syncEverythingIfNeeded;
- (void)updatePlaybackSettingIfNeeded;
@end

@implementation MTForegroundSyncUtil

+ (MTForegroundSyncUtil)sharedInstance
{
  if (qword_1005F5B18 != -1) {
    swift_once();
  }
  v2 = (void *)static ForegroundSyncUtil.shared;

  return (MTForegroundSyncUtil *)v2;
}

- (void)updatePlaybackSettingIfNeeded
{
  v2 = self;
  ForegroundSyncUtil.updatePlaybackSettingIfNeeded()();
}

- (void)syncEverythingIfNeeded
{
  v2 = self;
  ForegroundSyncUtil.syncEverythingIfNeeded()();
}

- (void)setNeedsSyncing
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR___MTForegroundSyncUtil_needsSyncing) = 1;
}

- (void)feedUpdateAllPodcastsOnForeground
{
  v2 = self;
  ForegroundSyncUtil.feedUpdateAllPodcastsOnForeground()();
}

- (MTForegroundSyncUtil)init
{
  return (MTForegroundSyncUtil *)sub_10036A14C();
}

- (NSDate)lastExpectedFeedsUpdateDate
{
  uint64_t v3 = type metadata accessor for Date();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (char *)self + OBJC_IVAR___MTForegroundSyncUtil_lastExpectedFeedsUpdateDate;
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, v7, v3);
  v8.super.isa = Date._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  return (NSDate *)v8.super.isa;
}

- (void)setLastExpectedFeedsUpdateDate:(id)a3
{
  uint64_t v4 = type metadata accessor for Date();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Date._unconditionallyBridgeFromObjectiveC(_:)();
  NSDate v8 = (char *)self + OBJC_IVAR___MTForegroundSyncUtil_lastExpectedFeedsUpdateDate;
  swift_beginAccess();
  v9 = *(void (**)(char *, char *, uint64_t))(v5 + 40);
  uint64_t v10 = self;
  v9(v8, v7, v4);
  swift_endAccess();
}

- (void)startCloudSyncAfterPrivacy
{
  v2 = self;
  ForegroundSyncUtil.startCloudSyncAfterPrivacy()();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_release();
  sub_100172424((uint64_t)self + OBJC_IVAR___MTForegroundSyncUtil_storefrontChangeObserver);
  uint64_t v3 = (char *)self + OBJC_IVAR___MTForegroundSyncUtil_lastExpectedFeedsUpdateDate;
  uint64_t v4 = type metadata accessor for Date();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___MTForegroundSyncUtil____lazy_storage___formatter);
}

@end