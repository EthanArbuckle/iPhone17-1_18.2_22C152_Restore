@interface GuidedSearchTokenPaletteView
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (_TtC8AppStore28GuidedSearchTokenPaletteView)initWithCoder:(id)a3;
- (_TtC8AppStore28GuidedSearchTokenPaletteView)initWithFrame:(CGRect)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)layoutSubviews;
- (void)scrollViewDidScroll:(id)a3;
@end

@implementation GuidedSearchTokenPaletteView

- (_TtC8AppStore28GuidedSearchTokenPaletteView)initWithFrame:(CGRect)a3
{
  sub_10057EA70(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (_TtC8AppStore28GuidedSearchTokenPaletteView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100582A4C();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10057F618();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  v4 = self;
  id v5 = [(GuidedSearchTokenPaletteView *)v4 traitCollection];

  double v6 = 50.0;
  double v7 = width;
  result.height = v6;
  result.CGFloat width = v7;
  return result;
}

- (void).cxx_destruct
{
  sub_10006012C(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC8AppStore28GuidedSearchTokenPaletteView_onSelect));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore28GuidedSearchTokenPaletteView_collectionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore28GuidedSearchTokenPaletteView_layout));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore28GuidedSearchTokenPaletteView_maskLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore28GuidedSearchTokenPaletteView_leadingGradientMask));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore28GuidedSearchTokenPaletteView_trailingGradientMask));
  swift_release();
  swift_release();
  swift_release();
  sub_100082BCC((uint64_t)self + OBJC_IVAR____TtC8AppStore28GuidedSearchTokenPaletteView_containerImpressionMetrics, &qword_100985970);
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  v10 = *(void (**)(uint64_t))((char *)&self->super.super.super.isa
                                       + OBJC_IVAR____TtC8AppStore28GuidedSearchTokenPaletteView_onSelect);
  if (v10)
  {
    id v11 = a3;
    v12 = self;
    sub_100060050((uint64_t)v10);
    uint64_t v13 = IndexPath.row.getter();
    v10(v13);
    sub_10006012C((uint64_t)v10);
  }
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return (*(void **)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore28GuidedSearchTokenPaletteView_tokens))[2];
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  id v11 = self;
  id v12 = sub_1005805CC(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  uint64_t v8 = type metadata accessor for IndexPath();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  id v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v12 = a3;
  id v13 = a4;
  uint64_t v14 = self;
  sub_1005806F8((uint64_t)v28);
  sub_100082CD0((uint64_t)v28, (uint64_t)v29, (uint64_t *)&unk_10099E4C8);
  if (v29[3])
  {
    uint64_t v15 = v29[0];
    uint64_t v16 = v29[1];
    id v27 = v13;
    uint64_t v17 = v8;
    char v18 = v30;
    [v12 bounds];
    id v19 = sub_10058114C(v15, v16);
    int v20 = v18 & 1;
    uint64_t v8 = v17;
    double v21 = sub_100582640(v19, v20, v12);
    double v23 = v22;

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {

    double v21 = 0.0;
    double v23 = 0.0;
  }
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  double v24 = v21;
  double v25 = v23;
  result.height = v25;
  result.CGFloat width = v24;
  return result;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  uint64_t v7 = qword_10097FF30;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = self;
  if (v7 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_100082C28((uint64_t *)&unk_100993510);
  sub_100087728(v11, (uint64_t)qword_10099E400);
  Conditional.evaluate(with:)();

  double v12 = v16;
  double v13 = v17;
  double v14 = v18;
  double v15 = v19;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v8 = type metadata accessor for IndexPath();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v12 = a3;
  id v13 = a4;
  double v14 = self;
  sub_100582B7C(v13);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100580CA0(v4);
}

@end