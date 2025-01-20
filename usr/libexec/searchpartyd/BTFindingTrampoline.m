@interface BTFindingTrampoline
- (_TtC12searchpartyd19BTFindingTrampoline)init;
- (void)start:(id)a3 completion:(id)a4;
- (void)startFastAdvertisingForBeacon:(id)a3 completion:(id)a4;
- (void)stop:(id)a3 completion:(id)a4;
- (void)stopFastAdvertisingForBeacon:(id)a3 completion:(id)a4;
- (void)updateConfig:(id)a3 completion:(id)a4;
@end

@implementation BTFindingTrampoline

- (void)start:(id)a3 completion:(id)a4
{
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  sub_10001CD44((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd19BTFindingTrampoline_implementation), *(void *)&self->implementation[OBJC_IVAR____TtC12searchpartyd19BTFindingTrampoline_implementation + 16]);
  v12 = self;
  sub_100FEDB34((uint64_t)v9, (uint64_t)sub_1001E06E0, v11);
  swift_release();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)startFastAdvertisingForBeacon:(id)a3 completion:(id)a4
{
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  sub_10001CD44((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd19BTFindingTrampoline_implementation), *(void *)&self->implementation[OBJC_IVAR____TtC12searchpartyd19BTFindingTrampoline_implementation + 16]);
  v12 = self;
  sub_100FEFCA0((uint64_t)v9, (uint64_t)sub_1001E06E0, v11);
  swift_release();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)stopFastAdvertisingForBeacon:(id)a3 completion:(id)a4
{
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  sub_10001CD44((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd19BTFindingTrampoline_implementation), *(void *)&self->implementation[OBJC_IVAR____TtC12searchpartyd19BTFindingTrampoline_implementation + 16]);
  v12 = self;
  sub_100FF026C((uint64_t)v9, (uint64_t)sub_1001E06E0, v11);
  swift_release();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)stop:(id)a3 completion:(id)a4
{
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  sub_10001CD44((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd19BTFindingTrampoline_implementation), *(void *)&self->implementation[OBJC_IVAR____TtC12searchpartyd19BTFindingTrampoline_implementation + 16]);
  v12 = self;
  sub_100FF08C4((uint64_t)v9, (uint64_t)sub_1001E06E0, v11);
  swift_release();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)updateConfig:(id)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = *sub_10001CD44((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd19BTFindingTrampoline_implementation), *(void *)&self->implementation[OBJC_IVAR____TtC12searchpartyd19BTFindingTrampoline_implementation + 16]);
  _Block_copy(v6);
  id v9 = a3;
  uint64_t v8 = self;
  sub_100FFA8DC(v9, v7, (void (**)(void, void))v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (_TtC12searchpartyd19BTFindingTrampoline)init
{
  result = (_TtC12searchpartyd19BTFindingTrampoline *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end