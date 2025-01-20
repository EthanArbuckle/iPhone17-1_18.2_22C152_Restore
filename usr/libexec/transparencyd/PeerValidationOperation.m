@interface PeerValidationOperation
- (NSDictionary)result;
- (_TtC13transparencyd23PeerValidationOperation)init;
- (_TtC13transparencyd23PeerValidationOperation)initWithDeps:(id)a3 application:(id)a4 uris:(id)a5 logClient:(id)a6;
- (void)groupStart;
- (void)setResult:(id)a3;
@end

@implementation PeerValidationOperation

- (NSDictionary)result
{
  swift_beginAccess();
  sub_10008E0A0(0, &qword_1003212B0);
  swift_bridgeObjectRetain();
  v2.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSDictionary *)v2.super.isa;
}

- (void)setResult:(id)a3
{
  sub_10008E0A0(0, &qword_1003212B0);
  uint64_t v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC13transparencyd23PeerValidationOperation_result);
  swift_beginAccess();
  uint64_t *v5 = v4;
  swift_bridgeObjectRelease();
}

- (_TtC13transparencyd23PeerValidationOperation)initWithDeps:(id)a3 application:(id)a4 uris:(id)a5 logClient:(id)a6
{
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = v9;
  uint64_t v11 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v12 = a3;
  swift_unknownObjectRetain();
  v13 = (_TtC13transparencyd23PeerValidationOperation *)sub_1000C4734(v12, v8, v10, v11, (uint64_t)a6);

  swift_unknownObjectRelease();
  return v13;
}

- (void)groupStart
{
  NSDictionary v2 = self;
  PeerValidationOperation.groupStart()();
}

- (_TtC13transparencyd23PeerValidationOperation)init
{
  result = (_TtC13transparencyd23PeerValidationOperation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13transparencyd23PeerValidationOperation_deps));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13transparencyd23PeerValidationOperation_verifier));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13transparencyd23PeerValidationOperation_completeOp));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13transparencyd23PeerValidationOperation_peerValidateQueue));

  swift_bridgeObjectRelease();
}

@end