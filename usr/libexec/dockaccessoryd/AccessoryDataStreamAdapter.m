@interface AccessoryDataStreamAdapter
- (_TtC14dockaccessoryd26AccessoryDataStreamAdapter)init;
- (void)accessory:(id)a3 didReceiveBulkSessionCandidate:(id)a4;
- (void)accessoryDidCloseDataStream:(id)a3;
- (void)accessoryDidStartListening:(id)a3;
@end

@implementation AccessoryDataStreamAdapter

- (_TtC14dockaccessoryd26AccessoryDataStreamAdapter)init
{
  result = (_TtC14dockaccessoryd26AccessoryDataStreamAdapter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_weakDestroy();
  sub_1000A61E4((uint64_t)self + OBJC_IVAR____TtC14dockaccessoryd26AccessoryDataStreamAdapter_delegate, (uint64_t *)&unk_1002A9798);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  sub_1000BF118(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC14dockaccessoryd26AccessoryDataStreamAdapter_pendingOpenSessionCallback));
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC14dockaccessoryd26AccessoryDataStreamAdapter_logger;
  uint64_t v4 = type metadata accessor for Logger();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

- (void)accessory:(id)a3 didReceiveBulkSessionCandidate:(id)a4
{
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v6 = self;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  [a4 rejectBulkSendSessionWithStatus:1];
  swift_unknownObjectRelease();

  sub_100099BCC((uint64_t)&v7);
}

- (void)accessoryDidStartListening:(id)a3
{
  swift_unknownObjectRetain();
  uint64_t v4 = self;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  sub_1000FCD28((uint64_t)v5);

  sub_100099BCC((uint64_t)v5);
}

- (void)accessoryDidCloseDataStream:(id)a3
{
  swift_unknownObjectRetain();
  uint64_t v4 = self;
  _bridgeAnyObjectToAny(_:)();

  swift_unknownObjectRelease();
  sub_100099BCC((uint64_t)&v5);
}

@end