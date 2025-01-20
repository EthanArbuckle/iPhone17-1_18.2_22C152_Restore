@interface Relay.RelayProxy
- (_TtCC12SidecarRelay5RelayP33_1C5D654CC83EDCEF3B22927C4D40C7FB10RelayProxy)init;
- (void)closeDisplayServiceSessionsWithPeerIdentifier:(id)a3;
- (void)setDisplayServiceSessionsChangedListener:(id)a3;
@end

@implementation Relay.RelayProxy

- (void)setDisplayServiceSessionsChangedListener:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = self;
  sub_10002FCE0((uint64_t)sub_10004F6B0, v5);

  swift_release();
}

- (void)closeDisplayServiceSessionsWithPeerIdentifier:(id)a3
{
  uint64_t v4 = type metadata accessor for UUID();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  sub_10002FF28((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtCC12SidecarRelay5RelayP33_1C5D654CC83EDCEF3B22927C4D40C7FB10RelayProxy)init
{
}

- (void).cxx_destruct
{
  swift_weakDestroy();
  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
}

@end