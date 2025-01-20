@interface AirDropUISessionClient
- (_TtC16DaemoniOSLibrary22AirDropUISessionClient)init;
- (void)acceptWasRequestedForTransferIdentifier:(id)a3;
- (void)cancellationWasRequestedForTransferIdentifier:(id)a3;
- (void)closeWasRequestedForTransferIdentifier:(id)a3;
- (void)dealloc;
- (void)runActionWasRequestedForTransferIdentifier:(id)a3 actionIdentifier:(id)a4;
@end

@implementation AirDropUISessionClient

- (void)dealloc
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary22AirDropUISessionClient_connection);
  v4 = self;
  if (v3) {
    [v3 invalidate];
  }
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for AirDropUISessionClient();
  [(AirDropUISessionClient *)&v5 dealloc];
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC16DaemoniOSLibrary22AirDropUISessionClient_delegate;

  sub_100261080((uint64_t)v3);
}

- (_TtC16DaemoniOSLibrary22AirDropUISessionClient)init
{
  return (_TtC16DaemoniOSLibrary22AirDropUISessionClient *)sub_1004409FC();
}

- (void)cancellationWasRequestedForTransferIdentifier:(id)a3
{
}

- (void)closeWasRequestedForTransferIdentifier:(id)a3
{
}

- (void)runActionWasRequestedForTransferIdentifier:(id)a3 actionIdentifier:(id)a4
{
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v7 = v6;
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v10 = v9;
  v11 = self;
  sub_100440DB8(v5, v7, v8, v10);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)acceptWasRequestedForTransferIdentifier:(id)a3
{
}

@end