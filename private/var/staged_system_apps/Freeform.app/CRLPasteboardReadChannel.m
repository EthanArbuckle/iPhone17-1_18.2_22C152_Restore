@interface CRLPasteboardReadChannel
- (BOOL)isValid;
- (_TtC8Freeform24CRLPasteboardReadChannel)init;
- (void)addBarrier:(id)a3;
- (void)close;
- (void)readFromOffset:(uint64_t)a3 length:(uint64_t)a4 handler:(void *)aBlock;
- (void)readWithHandler:(void *)aBlock;
@end

@implementation CRLPasteboardReadChannel

- (void)readFromOffset:(uint64_t)a3 length:(uint64_t)a4 handler:(void *)aBlock
{
  v8 = _Block_copy(aBlock);
  _Block_copy(v8);
  id v9 = a1;
  sub_10099D6B8(a3, a4, (uint64_t)v9, (char *)v8);
  _Block_release(v8);
  _Block_release(v8);
}

- (void)close
{
  uint64_t v6 = 0;
  memset(v5, 0, sizeof(v5));
  v3 = (char *)self + OBJC_IVAR____TtC8Freeform24CRLPasteboardReadChannel_pasteboardDataManaging;
  swift_beginAccess();
  v4 = self;
  sub_10099D650((uint64_t)v5, (uint64_t)v3);
  swift_endAccess();
}

- (void)addBarrier:(id)a3
{
  v4 = _Block_copy(a3);
  v5 = (void (*)(void *))v4[2];
  uint64_t v6 = self;
  v5(v4);
  _Block_release(v4);
}

- (BOOL)isValid
{
  v2 = (char *)self + OBJC_IVAR____TtC8Freeform24CRLPasteboardReadChannel_pasteboardDataManaging;
  swift_beginAccess();
  sub_10099E34C((uint64_t)v2, (uint64_t)v4);
  LOBYTE(v2) = v4[3] != 0;
  sub_10099E3B4((uint64_t)v4);
  return (char)v2;
}

- (void)readWithHandler:(void *)aBlock
{
  v4 = _Block_copy(aBlock);
  _Block_copy(v4);
  id v5 = a1;
  sub_10099D6B8(0, 0x7FFFFFFFFFFFFFFFLL, (uint64_t)v5, (char *)v4);
  _Block_release(v4);
  _Block_release(v4);
}

- (_TtC8Freeform24CRLPasteboardReadChannel)init
{
  result = (_TtC8Freeform24CRLPasteboardReadChannel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10099E3B4((uint64_t)self + OBJC_IVAR____TtC8Freeform24CRLPasteboardReadChannel_pasteboardDataManaging);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end