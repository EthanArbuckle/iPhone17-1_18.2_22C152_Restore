@interface SDAirDropAgentClient
- (NSDate)startTime;
- (NSString)bundleID;
- (NSUUID)id;
- (OS_nw_agent_client)client;
- (_TtC16DaemoniOSLibrary20SDAirDropAgentClient)init;
- (_TtC16DaemoniOSLibrary20SDAirDropAgentClient)initWithClient:(id)a3 browseDescriptor:(id)a4 browseResponse:(id)a5;
- (id)browseResponse;
- (int)pid;
@end

@implementation SDAirDropAgentClient

- (OS_nw_agent_client)client
{
  v2 = (void *)swift_unknownObjectRetain();

  return (OS_nw_agent_client *)v2;
}

- (NSUUID)id
{
  v2.super.isa = UUID._bridgeToObjectiveC()().super.isa;

  return (NSUUID *)v2.super.isa;
}

- (NSString)bundleID
{
  swift_bridgeObjectRetain();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (int)pid
{
  return *(_DWORD *)((char *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary20SDAirDropAgentClient_pid);
}

- (NSDate)startTime
{
  v2.super.isa = Date._bridgeToObjectiveC()().super.isa;

  return (NSDate *)v2.super.isa;
}

- (id)browseResponse
{
  uint64_t v2 = *(void *)&self->client[OBJC_IVAR____TtC16DaemoniOSLibrary20SDAirDropAgentClient_browseResponse];
  v5[4] = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary20SDAirDropAgentClient_browseResponse);
  v5[5] = v2;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 1107296256;
  v5[2] = sub_10053C7A8;
  v5[3] = &unk_1008E59C0;
  v3 = _Block_copy(v5);
  swift_retain();
  swift_release();

  return v3;
}

- (_TtC16DaemoniOSLibrary20SDAirDropAgentClient)init
{
  result = (_TtC16DaemoniOSLibrary20SDAirDropAgentClient *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC16DaemoniOSLibrary20SDAirDropAgentClient)initWithClient:(id)a3 browseDescriptor:(id)a4 browseResponse:(id)a5
{
  v7 = _Block_copy(a5);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v9 = (_TtC16DaemoniOSLibrary20SDAirDropAgentClient *)sub_1006BB070((uint64_t)a3, (uint64_t)a4, (uint64_t)sub_100448C78, v8);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  return v9;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC16DaemoniOSLibrary20SDAirDropAgentClient_id;
  uint64_t v4 = type metadata accessor for UUID();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  v5 = (char *)self + OBJC_IVAR____TtC16DaemoniOSLibrary20SDAirDropAgentClient_startTime;
  uint64_t v6 = type metadata accessor for Date();
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);

  swift_release();
}

@end