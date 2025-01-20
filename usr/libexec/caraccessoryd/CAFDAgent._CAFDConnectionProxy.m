@interface CAFDAgent._CAFDConnectionProxy
- (NSString)description;
- (_TtCC13caraccessoryd9CAFDAgent20_CAFDConnectionProxy)init;
- (void)fetchNowPlayingSnapshotWithReply:(id)a3;
- (void)invalidate;
- (void)refreshNowPlayingSnapshot;
@end

@implementation CAFDAgent._CAFDConnectionProxy

- (void)fetchNowPlayingSnapshotWithReply:(id)a3
{
  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  specialized CAFDAgent._CAFDConnectionProxy.fetchNowPlayingSnapshot(reply:)((uint64_t)v5, v4);
  _Block_release(v4);
  _Block_release(v4);
}

- (void)refreshNowPlayingSnapshot
{
  v2 = self;
  CAFDAgent._CAFDConnectionProxy.refreshNowPlayingSnapshot()();
}

- (NSString)description
{
  swift_getObjectType();
  v3 = self;
  BSServiceConnectionHost.CAFDDescription.getter();

  NSString v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v4;
}

- (_TtCC13caraccessoryd9CAFDAgent20_CAFDConnectionProxy)init
{
  result = (_TtCC13caraccessoryd9CAFDAgent20_CAFDConnectionProxy *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtCC13caraccessoryd9CAFDAgent20_CAFDConnectionProxy_connection);
}

- (void)invalidate
{
  v2 = self;
  CAFDAgent._CAFDConnectionProxy.activate()("invalidate proxy %@", (SEL *)&selRef_invalidate);
}

@end