@interface BKReadingActivityService
+ (NSString)includePDFsDefaultsKey;
+ (id)readingGoalsUserDefaultsKey;
- (BKReadingActivityService)init;
- (BOOL)enableCloudSync;
- (BOOL)readingGoalsEnabled;
- (BOOL)todayIsStreakDay;
- (BSUIDynamicArray)finishedAssets;
- (BSUIDynamicArray)readingHistory;
- (BSUIDynamicValue)allTimeRecordStreakData;
- (BSUIDynamicValue)booksFinishedGoal;
- (BSUIDynamicValue)booksPerYear;
- (BSUIDynamicValue)dailyGoal;
- (BSUIDynamicValue)didSeeWelcomeExperience;
- (BSUIDynamicValue)finishedAssetAllTimeCount;
- (BSUIDynamicValue)finishedAssetCountByYear;
- (BSUIDynamicValue)finishedAssetYear;
- (BSUIDynamicValue)finishedAssetsData;
- (BSUIDynamicValue)isDailyGoalCompleted;
- (BSUIDynamicValue)readingIndicatorTimeToday;
- (BSUIDynamicValue)readingTimeToday;
- (BSUIDynamicValue)timeReadPerMonth;
- (double)readingTimeTodayIncludingUnflushed;
- (id)fetchReadingGoalsCoachingEnabled;
- (id)fetchReadingGoalsNotificationEnabled;
- (id)updateReadingGoalsCoachingEnabled;
- (id)updateReadingGoalsNotificationEnabled;
- (int64_t)allTimeRecordStreak;
- (int64_t)currentStreak;
- (int64_t)timeReadToday;
- (void)changeBooksPerYearGoal:(int64_t)a3 :(BOOL)a4;
- (void)changeDailyGoal:(double)a3 :(BOOL)a4;
- (void)clearData;
- (void)dynamicProgressChanged:(id)a3;
- (void)handleCloudChangeNotification:(id)a3;
- (void)resumeNotifications;
- (void)setCurrentActiveAchievementSheetWithKind:(int64_t)a3;
- (void)setCurrentBooksFinishedStateTo:(int64_t)a3;
- (void)setEnableCloudSync:(BOOL)a3;
- (void)setReadingGoalsEnabled:(BOOL)a3;
- (void)setReadingHistoryForWeekWithEnding:(id)a3;
- (void)setReadingHistoryWithBeginning:(id)a3 ending:(id)a4;
- (void)suppressNotifications;
- (void)timeTracker:(id)a3 didBeginTrackingSession:(id)a4 trackerEventType:(unint64_t)a5 asset:(id)a6 readingFeatureFlags:(int64_t)a7;
- (void)timeTracker:(id)a3 didEndTrackingSession:(id)a4 duration:(double)a5 trackerEventType:(unint64_t)a6 asset:(id)a7 readingFeatureFlags:(int64_t)a8;
- (void)willMarkAsset:(id)a3 finished:(BOOL)a4 finishedDate:(id)a5;
@end

@implementation BKReadingActivityService

+ (id)readingGoalsUserDefaultsKey
{
  NSString v2 = sub_1007FDC30();

  return v2;
}

- (BSUIDynamicValue)dailyGoal
{
  return (BSUIDynamicValue *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR___BKReadingActivityService_dailyGoal));
}

- (BSUIDynamicValue)finishedAssetsData
{
  return (BSUIDynamicValue *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR___BKReadingActivityService_finishedAssetsData));
}

- (BSUIDynamicValue)finishedAssetYear
{
  return (BSUIDynamicValue *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR___BKReadingActivityService_finishedAssetYear));
}

- (BSUIDynamicValue)booksFinishedGoal
{
  return (BSUIDynamicValue *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR___BKReadingActivityService_booksFinishedGoal));
}

- (BSUIDynamicArray)readingHistory
{
  return (BSUIDynamicArray *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR___BKReadingActivityService_readingHistory));
}

- (BSUIDynamicValue)readingIndicatorTimeToday
{
  return (BSUIDynamicValue *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR___BKReadingActivityService_readingIndicatorTimeToday));
}

- (BSUIDynamicValue)finishedAssetCountByYear
{
  return (BSUIDynamicValue *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR___BKReadingActivityService_finishedAssetCountByYear));
}

- (BSUIDynamicValue)readingTimeToday
{
  return (BSUIDynamicValue *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR___BKReadingActivityService_readingTimeToday));
}

- (double)readingTimeTodayIncludingUnflushed
{
  NSString v2 = self;
  double v3 = ReadingActivityService.readingTimeTodayIncludingUnflushed()();

  return v3;
}

+ (NSString)includePDFsDefaultsKey
{
  NSString v2 = sub_1007FDC30();

  return (NSString *)v2;
}

- (BSUIDynamicValue)isDailyGoalCompleted
{
  return (BSUIDynamicValue *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR___BKReadingActivityService_isDailyGoalCompleted));
}

- (BOOL)readingGoalsEnabled
{
  return _s5Books22ReadingActivityServiceC19readingGoalsEnabledSbvg_0() & 1;
}

- (BSUIDynamicArray)finishedAssets
{
  return (BSUIDynamicArray *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR___BKReadingActivityService_finishedAssets));
}

- (BSUIDynamicValue)finishedAssetAllTimeCount
{
  return (BSUIDynamicValue *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR___BKReadingActivityService_finishedAssetAllTimeCount));
}

- (BSUIDynamicValue)didSeeWelcomeExperience
{
  return (BSUIDynamicValue *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR___BKReadingActivityService_didSeeWelcomeExperience));
}

- (BSUIDynamicValue)allTimeRecordStreakData
{
  return (BSUIDynamicValue *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR___BKReadingActivityService_allTimeRecordStreakData));
}

- (BSUIDynamicValue)booksPerYear
{
  return (BSUIDynamicValue *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR___BKReadingActivityService_booksPerYear));
}

- (BSUIDynamicValue)timeReadPerMonth
{
  return (BSUIDynamicValue *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR___BKReadingActivityService_timeReadPerMonth));
}

- (BOOL)enableCloudSync
{
  NSString v2 = (BOOL *)self + OBJC_IVAR___BKReadingActivityService_enableCloudSync;
  swift_beginAccess();
  return *v2;
}

- (void)setEnableCloudSync:(BOOL)a3
{
  v4 = self;
  ReadingActivityService.enableCloudSync.setter(a3);
}

- (int64_t)currentStreak
{
  NSString v2 = self;
  int64_t v3 = ReadingActivityService.currentStreak.getter();

  return v3;
}

- (int64_t)allTimeRecordStreak
{
  NSString v2 = self;
  int64_t v3 = ReadingActivityService.allTimeRecordStreak.getter();

  return v3;
}

- (int64_t)timeReadToday
{
  NSString v2 = self;
  int64_t v3 = ReadingActivityService.timeReadToday.getter();

  return v3;
}

- (BOOL)todayIsStreakDay
{
  NSString v2 = self;
  char IsStreak = ReadingActivityService.todayIsStreakDay.getter();

  return IsStreak & 1;
}

- (void)setReadingGoalsEnabled:(BOOL)a3
{
  v4 = self;
  v5 = self;
  id v6 = [v4 books];
  id v7 = [v6 userDefaults];

  Class isa = sub_1007FE090().super.super.isa;
  id v9 = sub_1007FDC30();
  [v7 setValue:isa forKey:v9];
}

- (id)fetchReadingGoalsNotificationEnabled
{
  return sub_100694B24(self, (uint64_t)a2, (uint64_t)&unk_100A68420, (uint64_t)sub_10069CFAC, (uint64_t)&unk_100A68438);
}

- (id)updateReadingGoalsNotificationEnabled
{
  return sub_100694DD0(self, (uint64_t)a2, (uint64_t)&unk_100A683D0, (uint64_t)sub_10069CFA4, (uint64_t)&unk_100A683E8);
}

- (id)fetchReadingGoalsCoachingEnabled
{
  return sub_100694B24(self, (uint64_t)a2, (uint64_t)&unk_100A68380, (uint64_t)sub_10069CFA8, (uint64_t)&unk_100A68398);
}

- (id)updateReadingGoalsCoachingEnabled
{
  return sub_100694DD0(self, (uint64_t)a2, (uint64_t)&unk_100A68330, (uint64_t)sub_10069CFA0, (uint64_t)&unk_100A68348);
}

- (void)clearData
{
  NSString v2 = self;
  ReadingActivityService.clearData()();
}

- (void)handleCloudChangeNotification:(id)a3
{
  uint64_t v4 = sub_1007F25F0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1007F25C0();
  v8 = self;
  sub_10069583C();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (BKReadingActivityService)init
{
  result = (BKReadingActivityService *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___BKReadingActivityService_finishedAssetsAfterCurrentYearCount));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___BKReadingActivityService_finishedAssetsPriorToCurrentYearCount));

  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();

  sub_10005AFE8((uint64_t)self + OBJC_IVAR___BKReadingActivityService_goalsModule, &qword_100B41D48);
  sub_10005AFE8((uint64_t)self + OBJC_IVAR___BKReadingActivityService_booksFinishedModule, &qword_100B41D50);
  sub_10005AFE8((uint64_t)self + OBJC_IVAR___BKReadingActivityService_historyModule, &qword_100B41D58);
  sub_10005AFE8((uint64_t)self + OBJC_IVAR___BKReadingActivityService_sessionEventProvider, (uint64_t *)&unk_100B41D60);
  swift_release();
  sub_10003E138(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___BKReadingActivityService_cloudSyncStateHandler));
  sub_10003E138(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR___BKReadingActivityService_notificationSuppressingEventHandler));

  int64_t v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BKReadingActivityService_engagementManager);
}

- (void)changeBooksPerYearGoal:(int64_t)a3 :(BOOL)a4
{
  uint64_t v6 = self;
  ReadingActivityService.changeBooksPerYearGoal(_:_:)(a3, a4);
}

- (void)changeDailyGoal:(double)a3 :(BOOL)a4
{
  uint64_t v6 = self;
  ReadingActivityService.changeDailyGoal(_:_:)(a3, a4);
}

- (void)setCurrentBooksFinishedStateTo:(int64_t)a3
{
  uint64_t v4 = (char *)self + OBJC_IVAR___BKReadingActivityService_booksFinishedModule;
  swift_beginAccess();
  if (*((void *)v4 + 3))
  {
    sub_10005DAB8((uint64_t)(v4 + 40), (uint64_t)v6);
    sub_10005DA74(v6, v6[3]);
    uint64_t v5 = self;
    sub_1007FA490();
    _s5Books15CurrentPageViewVwxx_0((uint64_t)v6);
  }
  else
  {
    __break(1u);
  }
}

- (void)setReadingHistoryWithBeginning:(id)a3 ending:(id)a4
{
  uint64_t v5 = sub_1007F2BA0();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v11 = (char *)v15 - v10;
  sub_1007F2B50();
  sub_1007F2B50();
  v12 = (char *)self + OBJC_IVAR___BKReadingActivityService_historyModule;
  swift_beginAccess();
  if (*((void *)v12 + 3))
  {
    sub_10005DAB8((uint64_t)(v12 + 40), (uint64_t)v15);
    sub_10005DA74(v15, v15[3]);
    v13 = self;
    sub_1007FA510();
    _s5Books15CurrentPageViewVwxx_0((uint64_t)v15);

    v14 = *(void (**)(char *, uint64_t))(v6 + 8);
    v14(v8, v5);
    v14(v11, v5);
  }
  else
  {
    __break(1u);
  }
}

- (void)setReadingHistoryForWeekWithEnding:(id)a3
{
  uint64_t v4 = sub_1007F2BA0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1007F2B50();
  v8 = (char *)self + OBJC_IVAR___BKReadingActivityService_historyModule;
  swift_beginAccess();
  if (*((void *)v8 + 3))
  {
    sub_10005DAB8((uint64_t)(v8 + 40), (uint64_t)v10);
    sub_10005DA74(v10, v10[3]);
    uint64_t v9 = self;
    sub_1007FA520();
    _s5Books15CurrentPageViewVwxx_0((uint64_t)v10);

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  else
  {
    __break(1u);
  }
}

- (void)setCurrentActiveAchievementSheetWithKind:(int64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BKReadingActivityService__currentActiveAchievementSheetKind) = (Class)a3;
}

- (void)suppressNotifications
{
  NSString v2 = self;
  ReadingActivityService.suppressNotifications()();
}

- (void)resumeNotifications
{
  NSString v2 = self;
  ReadingActivityService.resumeNotifications()();
}

- (void)timeTracker:(id)a3 didBeginTrackingSession:(id)a4 trackerEventType:(unint64_t)a5 asset:(id)a6 readingFeatureFlags:(int64_t)a7
{
  char v7 = a7;
  uint64_t v12 = sub_1007F2BF0();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  v15 = (char *)&v18 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1007F2BD0();
  id v16 = a3;
  swift_unknownObjectRetain();
  v17 = self;
  sub_10069BCC8((uint64_t)v15, a5, a6, v7);

  swift_unknownObjectRelease();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
}

- (void)timeTracker:(id)a3 didEndTrackingSession:(id)a4 duration:(double)a5 trackerEventType:(unint64_t)a6 asset:(id)a7 readingFeatureFlags:(int64_t)a8
{
  char v8 = a8;
  uint64_t v12 = sub_1007F2BF0();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  v15 = (char *)&v18 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1007F2BD0();
  id v16 = a3;
  swift_unknownObjectRetain();
  v17 = self;
  sub_10069C574((uint64_t)v15, a7, v8);

  swift_unknownObjectRelease();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
}

- (void)dynamicProgressChanged:(id)a3
{
  swift_unknownObjectRetain();
  uint64_t v5 = self;
  ReadingActivityService.dynamicProgressChanged(_:)(a3);
  swift_unknownObjectRelease();
}

- (void)willMarkAsset:(id)a3 finished:(BOOL)a4 finishedDate:(id)a5
{
  uint64_t v7 = sub_100058D18((uint64_t *)&unk_100B2BD50);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1007FDC70();
  if (a5)
  {
    sub_1007F2B50();
    uint64_t v10 = sub_1007F2BA0();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 0, 1, v10);
  }
  else
  {
    uint64_t v11 = sub_1007F2BA0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v9, 1, 1, v11);
  }
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR___BKReadingActivityService_achievementsController))
  {
    uint64_t v12 = self;
    swift_retain();
    sub_1007FA580();

    swift_bridgeObjectRelease();
    swift_release();
    sub_10005AFE8((uint64_t)v9, (uint64_t *)&unk_100B2BD50);
  }
  else
  {
    __break(1u);
  }
}

@end