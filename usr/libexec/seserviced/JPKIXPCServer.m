@interface JPKIXPCServer
+ (uint64_t)kickOff;
- (_TtC10seserviced13JPKIXPCServer)init;
@end

@implementation JPKIXPCServer

- (_TtC10seserviced13JPKIXPCServer)init
{
  return (_TtC10seserviced13JPKIXPCServer *)sub_1001D56E8();
}

- (void).cxx_destruct
{
  swift_release();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

+ (uint64_t)kickOff
{
  uint64_t v0 = type metadata accessor for XPCListener.InitializationOptions();
  __chkstk_darwin(v0 - 8, v1);
  if (qword_100453780 != -1) {
    swift_once();
  }
  v2 = (void *)qword_100468860;
  *(void *)(swift_allocObject() + 16) = v2;
  swift_bridgeObjectRetain();
  v3 = v2;
  static XPCListener.InitializationOptions.none.getter();
  type metadata accessor for XPCListener();
  swift_allocObject();
  *(void *)&v3[OBJC_IVAR____TtC10seserviced13JPKIXPCServer_listener] = XPCListener.init(service:targetQueue:options:incomingSessionHandler:)();
  return swift_release();
}

@end