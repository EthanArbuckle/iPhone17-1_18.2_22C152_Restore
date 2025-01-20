@interface CRLCollectionViewCompositionalLayout
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (CGSize)collectionViewContentSize;
- (_TtC8Freeform36CRLCollectionViewCompositionalLayout)initWithCoder:(id)a3;
- (_TtC8Freeform36CRLCollectionViewCompositionalLayout)initWithSection:(id)a3;
- (_TtC8Freeform36CRLCollectionViewCompositionalLayout)initWithSection:(id)a3 configuration:(id)a4;
- (_TtC8Freeform36CRLCollectionViewCompositionalLayout)initWithSectionProvider:(id)a3;
- (_TtC8Freeform36CRLCollectionViewCompositionalLayout)initWithSectionProvider:(id)a3 configuration:(id)a4;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4;
- (void)prepareLayout;
@end

@implementation CRLCollectionViewCompositionalLayout

- (_TtC8Freeform36CRLCollectionViewCompositionalLayout)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10065BF60();
}

- (void)prepareLayout
{
  v2 = self;
  sub_10065AF98();
}

- (CGSize)collectionViewContentSize
{
  v2 = self;
  sub_10065B0D4();
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v7 = self;
  char v8 = sub_10065B18C(x, y, width, height);

  return v8 & 1;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v14.receiver = self;
  v14.super_class = (Class)swift_getObjectType();
  id v7 = v14.receiver;
  id v8 = -[CRLCollectionViewCompositionalLayout layoutAttributesForElementsInRect:](&v14, "layoutAttributesForElementsInRect:", x, y, width, height);
  if (v8)
  {
    v9 = v8;
    sub_10065BF20();
    unint64_t v10 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    swift_retain();
    uint64_t v11 = sub_10065BAEC(v10);

    swift_release();
    swift_bridgeObjectRelease();
    if (v11)
    {
      v12.super.isa = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
  }
  v12.super.isa = 0;
LABEL_6:

  return v12.super.isa;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  uint64_t v5 = type metadata accessor for IndexPath();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v10 = self;
  uint64_t v11 = (void *)sub_10065B434();

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);

  return v11;
}

- (_TtC8Freeform36CRLCollectionViewCompositionalLayout)initWithSection:(id)a3
{
  id v3 = a3;
  CGSize result = (_TtC8Freeform36CRLCollectionViewCompositionalLayout *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC8Freeform36CRLCollectionViewCompositionalLayout)initWithSection:(id)a3 configuration:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  CGSize result = (_TtC8Freeform36CRLCollectionViewCompositionalLayout *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC8Freeform36CRLCollectionViewCompositionalLayout)initWithSectionProvider:(id)a3
{
  id v3 = _Block_copy(a3);
  _Block_release(v3);
  CGSize result = (_TtC8Freeform36CRLCollectionViewCompositionalLayout *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC8Freeform36CRLCollectionViewCompositionalLayout)initWithSectionProvider:(id)a3 configuration:(id)a4
{
  id v5 = _Block_copy(a3);
  id v6 = a4;
  _Block_release(v5);
  CGSize result = (_TtC8Freeform36CRLCollectionViewCompositionalLayout *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end