@interface CategorizationSyncManager
+ (_TtC15icloudmailagent25CategorizationSyncManager)sharedInstance;
- (_TtC15icloudmailagent25CategorizationSyncManager)init;
- (void)start;
@end

@implementation CategorizationSyncManager

+ (_TtC15icloudmailagent25CategorizationSyncManager)sharedInstance
{
  if (qword_100063EB8 != -1) {
    swift_once();
  }
  v2 = (void *)qword_100067A38;

  return (_TtC15icloudmailagent25CategorizationSyncManager *)v2;
}

- (_TtC15icloudmailagent25CategorizationSyncManager)init
{
  return (_TtC15icloudmailagent25CategorizationSyncManager *)sub_10002FA78();
}

- (void)start
{
  v2 = self;
  sub_1000300AC();
}

- (void).cxx_destruct
{
  swift_release();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC15icloudmailagent25CategorizationSyncManager_timer);
}

@end