@interface CloudSyncBugReporter
- (_TtC8Podcasts20CloudSyncBugReporter)init;
- (void)report:(int64_t)a3 userInfo:(id)a4;
- (void)reportBookmarksSyncIssue:(int64_t)a3 bookmarksSyncType:(int64_t)a4 version:(id)a5 userInfo:(id)a6;
- (void)reportInterestSyncIssue:(int64_t)a3 version:(id)a4 userInfo:(id)a5;
- (void)reportNonFollowedShowsSyncIssue:(int64_t)a3 version:(id)a4 userInfo:(id)a5;
- (void)reportSubscriptionsSyncIssue:(int64_t)a3 subscriptionSyncType:(int64_t)a4 version:(id)a5 userInfo:(id)a6;
- (void)reportSyncAuthenticationErrorFor:(id)a3 error:(id)a4;
@end

@implementation CloudSyncBugReporter

- (_TtC8Podcasts20CloudSyncBugReporter)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Podcasts20CloudSyncBugReporter_bugReporter);
  v5 = self;
  v6 = self;
  id v7 = [v5 sharedInstance];
  v4[3] = sub_10001CB24();
  v4[4] = &protocol witness table for PFAutoBugCaptureBugReporter;
  void *v4 = v7;

  v9.receiver = v6;
  v9.super_class = ObjectType;
  return [(CloudSyncBugReporter *)&v9 init];
}

- (void)report:(int64_t)a3 userInfo:(id)a4
{
  if (a4) {
    uint64_t v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = self;
  sub_10031430C(a3, v6);

  swift_bridgeObjectRelease();
}

- (void)reportNonFollowedShowsSyncIssue:(int64_t)a3 version:(id)a4 userInfo:(id)a5
{
}

- (void)reportInterestSyncIssue:(int64_t)a3 version:(id)a4 userInfo:(id)a5
{
}

- (void)reportSubscriptionsSyncIssue:(int64_t)a3 subscriptionSyncType:(int64_t)a4 version:(id)a5 userInfo:(id)a6
{
  unint64_t v6 = (unint64_t)a6;
  if (a5)
  {
    uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v12 = v11;
    if (!v6) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v10 = 0;
  unint64_t v12 = 0;
  if (a6) {
LABEL_3:
  }
    unint64_t v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
LABEL_4:
  v13 = self;
  if ((unint64_t)a4 <= 1) {
    sub_100314750(a3, a4, v10, v12, v6);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)reportBookmarksSyncIssue:(int64_t)a3 bookmarksSyncType:(int64_t)a4 version:(id)a5 userInfo:(id)a6
{
  unint64_t v6 = (unint64_t)a6;
  if (a5)
  {
    uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v11 = v10;
    if (!v6) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v9 = 0;
  unint64_t v11 = 0;
  if (a6) {
LABEL_3:
  }
    unint64_t v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
LABEL_4:
  if (!a4)
  {
    unint64_t v12 = 2;
    goto LABEL_10;
  }
  if (a4 == 1)
  {
    unint64_t v12 = 3;
LABEL_10:
    v13 = self;
    sub_100314750(a3, v12, v9, v11, v6);
    goto LABEL_12;
  }
  v14 = self;
LABEL_12:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)reportSyncAuthenticationErrorFor:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_100315074(v6, v7);
}

- (void).cxx_destruct
{
}

@end