@interface CRLiOSPrintPageRenderer
- (_TtC8Freeform23CRLiOSPrintPageRenderer)init;
- (int64_t)numberOfPages;
- (void)drawPageAtIndex:(int64_t)a3 inRect:(CGRect)a4;
@end

@implementation CRLiOSPrintPageRenderer

- (int64_t)numberOfPages
{
  v3 = (_OWORD *)((char *)self + OBJC_IVAR____TtC8Freeform23CRLiOSPrintPageRenderer_exporter);
  swift_beginAccess();
  long long v4 = v3[5];
  v11[4] = v3[4];
  v11[5] = v4;
  long long v5 = v3[7];
  v11[6] = v3[6];
  v11[7] = v5;
  long long v6 = v3[1];
  v11[0] = *v3;
  v11[1] = v6;
  long long v7 = v3[3];
  v11[2] = v3[2];
  v11[3] = v7;
  if (BYTE1(v7) != 1 || !*((void *)&v11[0] + 1)) {
    return 1;
  }
  if (!(*((void *)&v11[0] + 1) >> 62)) {
    return *(void *)((*((void *)&v11[0] + 1) & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  v10 = self;
  sub_1007C2298(v11);
  swift_bridgeObjectRetain();
  int64_t v8 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  sub_1007C22E0((uint64_t)v11);

  return v8;
}

- (void)drawPageAtIndex:(int64_t)a3 inRect:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  v9 = self;
  sub_100A0677C(a3, x, y, width, height);
}

- (_TtC8Freeform23CRLiOSPrintPageRenderer)init
{
  result = (_TtC8Freeform23CRLiOSPrintPageRenderer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  long long v3 = *(_OWORD *)&self->exporter[OBJC_IVAR____TtC8Freeform23CRLiOSPrintPageRenderer_exporter + 72];
  v7[4] = *(_OWORD *)&self->exporter[OBJC_IVAR____TtC8Freeform23CRLiOSPrintPageRenderer_exporter + 56];
  v7[5] = v3;
  long long v4 = *(_OWORD *)&self->exporter[OBJC_IVAR____TtC8Freeform23CRLiOSPrintPageRenderer_exporter + 104];
  v7[6] = *(_OWORD *)&self->exporter[OBJC_IVAR____TtC8Freeform23CRLiOSPrintPageRenderer_exporter + 88];
  v7[7] = v4;
  long long v5 = *(_OWORD *)&self->exporter[OBJC_IVAR____TtC8Freeform23CRLiOSPrintPageRenderer_exporter + 8];
  v7[0] = *(_OWORD *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform23CRLiOSPrintPageRenderer_exporter);
  v7[1] = v5;
  long long v6 = *(_OWORD *)&self->exporter[OBJC_IVAR____TtC8Freeform23CRLiOSPrintPageRenderer_exporter + 40];
  v7[2] = *(_OWORD *)&self->exporter[OBJC_IVAR____TtC8Freeform23CRLiOSPrintPageRenderer_exporter + 24];
  v7[3] = v6;
  sub_1007C22E0((uint64_t)v7);
}

@end