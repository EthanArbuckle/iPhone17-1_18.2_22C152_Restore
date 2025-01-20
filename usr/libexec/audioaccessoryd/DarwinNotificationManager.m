@interface DarwinNotificationManager
+ (_TtC15audioaccessoryd25DarwinNotificationManager)shared;
- (_TtC15audioaccessoryd25DarwinNotificationManager)init;
- (void)setUp;
@end

@implementation DarwinNotificationManager

+ (_TtC15audioaccessoryd25DarwinNotificationManager)shared
{
  if (qword_100261888 != -1) {
    swift_once();
  }
  v2 = (void *)static DarwinNotificationManager.shared;

  return (_TtC15audioaccessoryd25DarwinNotificationManager *)v2;
}

- (_TtC15audioaccessoryd25DarwinNotificationManager)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC15audioaccessoryd25DarwinNotificationManager_helpers) = (Class)_swiftEmptyArrayStorage;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DarwinNotificationManager();
  return [(DarwinNotificationManager *)&v3 init];
}

- (void)setUp
{
  sub_1000D9DC4();
  objc_super v3 = self;
  v4 = static OS_dispatch_queue.main.getter();
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v3;
  v8[4] = sub_1000D9E78;
  v8[5] = v5;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 1107296256;
  v8[2] = sub_1000D9AC4;
  v8[3] = &unk_100238928;
  v6 = _Block_copy(v8);
  v7 = v3;
  swift_release();
  xpc_set_event_stream_handler("com.apple.notifyd.matching", v4, v6);
  _Block_release(v6);
}

- (void).cxx_destruct
{
}

@end