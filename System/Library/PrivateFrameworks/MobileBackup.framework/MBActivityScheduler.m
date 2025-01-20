@interface MBActivityScheduler
+ (_TtC7backupd19MBActivityScheduler)sharedInstance;
- (_TtC7backupd19MBActivityScheduler)init;
- (id)controlWithArguments:(id)a3 error:(id *)a4;
@end

@implementation MBActivityScheduler

+ (_TtC7backupd19MBActivityScheduler)sharedInstance
{
  if (qword_10047CB10 != -1) {
    swift_once();
  }
  v2 = (void *)qword_10047D728;
  return (_TtC7backupd19MBActivityScheduler *)v2;
}

- (_TtC7backupd19MBActivityScheduler)init
{
  return (_TtC7backupd19MBActivityScheduler *)sub_10001EBF0();
}

- (id)controlWithArguments:(id)a3 error:(id *)a4
{
  v5 = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v6 = self;
  sub_1000206B4(v5);
  swift_bridgeObjectRelease();

  sub_100006FC8(&qword_10047D4E8);
  v7.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return v7.super.isa;
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7backupd19MBActivityScheduler__workQueue);
}

@end