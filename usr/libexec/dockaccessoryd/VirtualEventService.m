@interface VirtualEventService
- (BOOL)setOutputEvent:(id)a3 forService:(id)a4;
- (BOOL)setProperty:(id)a3 forKey:(id)a4 forService:(id)a5;
- (_TtC14dockaccessoryd19VirtualEventService)init;
- (id)copyEventMatching:(id)a3 forService:(id)a4;
- (id)propertyForKey:(id)a3 forService:(id)a4;
- (void)dealloc;
- (void)notification:(int64_t)a3 withProperty:(id)a4 forService:(id)a5;
@end

@implementation VirtualEventService

- (_TtC14dockaccessoryd19VirtualEventService)init
{
  return (_TtC14dockaccessoryd19VirtualEventService *)sub_1001D8EF4();
}

- (void)dealloc
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14dockaccessoryd19VirtualEventService_eventService);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14dockaccessoryd19VirtualEventService_eventService) = 0;
  v3 = self;

  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for VirtualEventService();
  [(VirtualEventService *)&v4 dealloc];
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC14dockaccessoryd19VirtualEventService_logger;
  uint64_t v4 = type metadata accessor for Logger();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_bridgeObjectRelease();
  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14dockaccessoryd19VirtualEventService_eventService);
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4 forService:(id)a5
{
  if (a3)
  {
    id v6 = a4;
    swift_unknownObjectRetain();
    v7 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();

    swift_unknownObjectRelease();
  }
  else
  {
    memset(v11, 0, sizeof(v11));
    swift_unknownObjectRetain();
    v8 = self;
  }
  _bridgeAnyObjectToAny(_:)();

  swift_unknownObjectRelease();
  sub_100099BCC((uint64_t)&v10);
  sub_1000D0428((uint64_t)v11);
  return 0;
}

- (id)propertyForKey:(id)a3 forService:(id)a4
{
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v7 = v6;
  swift_unknownObjectRetain();
  v8 = self;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  sub_1001D9924(v5, v7, &v17);

  swift_bridgeObjectRelease();
  sub_100099BCC((uint64_t)v16);
  uint64_t v9 = v18;
  if (v18)
  {
    uint64_t v10 = sub_1000A5DA4(&v17, v18);
    uint64_t v11 = *(void *)(v9 - 8);
    __chkstk_darwin(v10);
    v13 = &v16[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
    (*(void (**)(unsigned char *))(v11 + 16))(v13);
    v14 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
    (*(void (**)(unsigned char *, uint64_t))(v11 + 8))(v13, v9);
    sub_100099BCC((uint64_t)&v17);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)copyEventMatching:(id)a3 forService:(id)a4
{
  if (a3) {
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  swift_unknownObjectRetain();
  uint64_t v5 = self;
  _bridgeAnyObjectToAny(_:)();

  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  sub_100099BCC((uint64_t)&v7);
  return 0;
}

- (BOOL)setOutputEvent:(id)a3 forService:(id)a4
{
  id v5 = a3;
  swift_unknownObjectRetain();
  uint64_t v6 = self;
  _bridgeAnyObjectToAny(_:)();

  swift_unknownObjectRelease();
  sub_100099BCC((uint64_t)&v8);
  return 0;
}

- (void)notification:(int64_t)a3 withProperty:(id)a4 forService:(id)a5
{
  if (a4) {
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  swift_unknownObjectRetain();
  uint64_t v7 = self;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  sub_1001D9DE8(a3);

  swift_bridgeObjectRelease();
  sub_100099BCC((uint64_t)&v8);
}

@end