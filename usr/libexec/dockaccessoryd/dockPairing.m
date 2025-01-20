@interface dockPairing
- (_TtC14dockaccessoryd11dockPairing)init;
- (void)cancelPairAccessoryWithInfo:(id)a3 completion:(id)a4;
- (void)pairAccessoryWithInfo:(id)a3 completion:(id)a4;
- (void)registerCardWithInfo:(id)a3 completion:(id)a4;
- (void)setSetupPayloadWithUri:(id)a3 completion:(id)a4;
@end

@implementation dockPairing

- (_TtC14dockaccessoryd11dockPairing)init
{
  return (_TtC14dockaccessoryd11dockPairing *)sub_10017F5C4();
}

- (void)registerCardWithInfo:(id)a3 completion:(id)a4
{
}

- (void)pairAccessoryWithInfo:(id)a3 completion:(id)a4
{
}

- (void)setSetupPayloadWithUri:(id)a3 completion:(id)a4
{
  uint64_t v6 = type metadata accessor for URL();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  _Block_copy(v10);
  v11 = self;
  sub_100180C18((uint64_t)v9, (uint64_t)v11, (uint64_t)v10);
  _Block_release(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  _Block_release(v10);
}

- (void)cancelPairAccessoryWithInfo:(id)a3 completion:(id)a4
{
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC14dockaccessoryd11dockPairing_logger;
  uint64_t v4 = type metadata accessor for Logger();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14dockaccessoryd11dockPairing_clientQueue);
}

@end