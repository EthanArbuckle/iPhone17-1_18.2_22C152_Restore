@interface StickersAPIService.Worker
- (_TtCV9stickersd18StickersAPIService6Worker)init;
- (void)addSticker:(id)a3 withReply:(id)a4;
- (void)countFor:(id)a3 withReply:(id)a4;
- (void)fetch:(id)a3 withReply:(id)a4;
- (void)reindexAllStickers;
- (void)removeStickersWithIdentifiers:(id)a3 withReply:(id)a4;
- (void)touchStickerSpotlightItem:(id)a3 withReply:(id)a4;
- (void)updateSticker:(id)a3 withReply:(id)a4;
- (void)upperCaseString:(id)a3 withReply:(id)a4;
@end

@implementation StickersAPIService.Worker

- (_TtCV9stickersd18StickersAPIService6Worker)init
{
  uint64_t v2 = qword_100019258;
  v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  sub_1000070A4((uint64_t)&qword_100019858, (uint64_t)v6);
  sub_100007108(v6, (_TtCV9stickersd18StickersAPIService6Worker *)((char *)v3+ OBJC_IVAR____TtCV9stickersd18StickersAPIService6Worker_store));

  v5.receiver = v3;
  v5.super_class = (Class)type metadata accessor for StickersAPIService.Worker();
  return [(StickersAPIService.Worker *)&v5 init];
}

- (void)upperCaseString:(id)a3 withReply:(id)a4
{
  objc_super v5 = _Block_copy(a4);
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v8 = v7;
  _Block_copy(v5);
  v9 = self;
  sub_100006EB8(v6, v8, (uint64_t)v5);
  _Block_release(v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();
}

- (void)countFor:(id)a3 withReply:(id)a4
{
}

- (void)fetch:(id)a3 withReply:(id)a4
{
}

- (void)addSticker:(id)a3 withReply:(id)a4
{
}

- (void)removeStickersWithIdentifiers:(id)a3 withReply:(id)a4
{
  objc_super v5 = _Block_copy(a4);
  type metadata accessor for UUID();
  uint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(swift_allocObject() + 16) = v5;
  unint64_t v7 = self;
  sub_1000055E8(v6, (void (*)(void))sub_100007180);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)updateSticker:(id)a3 withReply:(id)a4
{
}

- (void)touchStickerSpotlightItem:(id)a3 withReply:(id)a4
{
}

- (void)reindexAllStickers
{
  uint64_t v2 = self;
  sub_100006074();
}

- (void).cxx_destruct
{
}

@end