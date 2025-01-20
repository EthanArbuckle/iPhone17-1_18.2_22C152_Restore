@interface CRLCommandSetStickyPreset
- (NSUUID)id;
- (_TtC8Freeform25CRLCommandSetStickyPreset)init;
@end

@implementation CRLCommandSetStickyPreset

- (NSUUID)id
{
  v2.super.isa = UUID._bridgeToObjectiveC()().super.isa;

  return (NSUUID *)v2.super.isa;
}

- (_TtC8Freeform25CRLCommandSetStickyPreset)init
{
  result = (_TtC8Freeform25CRLCommandSetStickyPreset *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  NSUUID v2 = (char *)self + OBJC_IVAR____TtC8Freeform25CRLCommandSetStickyPreset_id;
  uint64_t v3 = type metadata accessor for UUID();
  v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);

  v4(v2, v3);
}

@end