@interface GlyphView.Coordinator
- (_TtCV9PassKitUI9GlyphView11Coordinator)init;
- (void)glyphView:(id)a3 revealingCheckmark:(BOOL)a4;
@end

@implementation GlyphView.Coordinator

- (void)glyphView:(id)a3 revealingCheckmark:(BOOL)a4
{
  v5 = *(void (**)(uint64_t))&self->parent[OBJC_IVAR____TtCV9PassKitUI9GlyphView11Coordinator_parent + 96];
  id v6 = a3;
  v7 = self;
  uint64_t v8 = sub_1A03ADE18();
  v5(v8);

  swift_release();
}

- (_TtCV9PassKitUI9GlyphView11Coordinator)init
{
  result = (_TtCV9PassKitUI9GlyphView11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  long long v2 = *(_OWORD *)&self->parent[OBJC_IVAR____TtCV9PassKitUI9GlyphView11Coordinator_parent + 104];
  v6[6] = *(_OWORD *)&self->parent[OBJC_IVAR____TtCV9PassKitUI9GlyphView11Coordinator_parent + 88];
  v6[7] = v2;
  uint64_t v7 = *(void *)&self->parent[OBJC_IVAR____TtCV9PassKitUI9GlyphView11Coordinator_parent + 120];
  long long v3 = *(_OWORD *)&self->parent[OBJC_IVAR____TtCV9PassKitUI9GlyphView11Coordinator_parent + 40];
  v6[2] = *(_OWORD *)&self->parent[OBJC_IVAR____TtCV9PassKitUI9GlyphView11Coordinator_parent + 24];
  v6[3] = v3;
  long long v4 = *(_OWORD *)&self->parent[OBJC_IVAR____TtCV9PassKitUI9GlyphView11Coordinator_parent + 72];
  v6[4] = *(_OWORD *)&self->parent[OBJC_IVAR____TtCV9PassKitUI9GlyphView11Coordinator_parent + 56];
  v6[5] = v4;
  long long v5 = *(_OWORD *)&self->parent[OBJC_IVAR____TtCV9PassKitUI9GlyphView11Coordinator_parent + 8];
  v6[0] = *(_OWORD *)((char *)&self->super.isa + OBJC_IVAR____TtCV9PassKitUI9GlyphView11Coordinator_parent);
  v6[1] = v5;
  sub_19F7937B4((uint64_t)v6);
}

@end