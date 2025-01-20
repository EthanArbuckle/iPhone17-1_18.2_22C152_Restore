@interface TPSAnalyticsChecklistSessionController
+ (TPSAnalyticsChecklistSessionController)sharedInstance;
- (BOOL)hasActiveSession;
- (BOOL)isFirstLaunch;
- (TPSAnalyticsChecklistSessionController)init;
- (int64_t)sessionEndSuggestedTipsCount;
- (int64_t)sessionTipsCompleted;
- (void)continueSession;
- (void)setHasActiveSession:(BOOL)a3;
- (void)setIsFirstLaunch:(BOOL)a3;
- (void)setSessionEndSuggestedTipsCount:(int64_t)a3;
- (void)setSessionTipsCompleted:(int64_t)a3;
- (void)startSession;
- (void)stopSession;
@end

@implementation TPSAnalyticsChecklistSessionController

- (TPSAnalyticsChecklistSessionController)init
{
  return (TPSAnalyticsChecklistSessionController *)TPSAnalyticsChecklistSessionController.init()();
}

+ (TPSAnalyticsChecklistSessionController)sharedInstance
{
  if (qword_1E9413C00 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1E9413BF0;
  return (TPSAnalyticsChecklistSessionController *)v2;
}

- (BOOL)isFirstLaunch
{
  v2 = (BOOL *)self + OBJC_IVAR___TPSAnalyticsChecklistSessionController_isFirstLaunch;
  swift_beginAccess();
  return *v2;
}

- (void)setIsFirstLaunch:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___TPSAnalyticsChecklistSessionController_isFirstLaunch;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)hasActiveSession
{
  v2 = (BOOL *)self + OBJC_IVAR___TPSAnalyticsChecklistSessionController_hasActiveSession;
  swift_beginAccess();
  return *v2;
}

- (void)setHasActiveSession:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___TPSAnalyticsChecklistSessionController_hasActiveSession;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (int64_t)sessionEndSuggestedTipsCount
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___TPSAnalyticsChecklistSessionController_sessionEndSuggestedTipsCount);
  swift_beginAccess();
  return *v2;
}

- (void)setSessionEndSuggestedTipsCount:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___TPSAnalyticsChecklistSessionController_sessionEndSuggestedTipsCount);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (int64_t)sessionTipsCompleted
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___TPSAnalyticsChecklistSessionController_sessionTipsCompleted);
  swift_beginAccess();
  return *v2;
}

- (void)setSessionTipsCompleted:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___TPSAnalyticsChecklistSessionController_sessionTipsCompleted);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (void)startSession
{
  v2 = self;
  sub_19C93AC08();
}

- (void)continueSession
{
  v2 = self;
  sub_19C93B2D8();
}

- (void)stopSession
{
  v2 = self;
  sub_19C93B788();
}

- (void).cxx_destruct
{
  sub_19C8E00AC((uint64_t)self + OBJC_IVAR___TPSAnalyticsChecklistSessionController_sessionStartTime, &qword_1EB516C20);
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___TPSAnalyticsChecklistSessionController_sessionTimeoutTimer);
}

@end