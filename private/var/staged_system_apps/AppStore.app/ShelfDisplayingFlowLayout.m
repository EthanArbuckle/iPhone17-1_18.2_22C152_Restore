@interface ShelfDisplayingFlowLayout
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (_TtC8AppStore25ShelfDisplayingFlowLayout)init;
- (_TtC8AppStore25ShelfDisplayingFlowLayout)initWithCoder:(id)a3;
- (id)invalidationContextForBoundsChange:(CGRect)a3;
- (id)layoutAttributesForDecorationViewOfKind:(id)a3 atIndexPath:(id)a4;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (void)prepareLayout;
@end

@implementation ShelfDisplayingFlowLayout

- (_TtC8AppStore25ShelfDisplayingFlowLayout)init
{
  return (_TtC8AppStore25ShelfDisplayingFlowLayout *)sub_1001AACDC();
}

- (_TtC8AppStore25ShelfDisplayingFlowLayout)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC8AppStore25ShelfDisplayingFlowLayout_multiColumnMinYBySection;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)sub_100670340((uint64_t)_swiftEmptyArrayStorage);
  uint64_t v6 = OBJC_IVAR____TtC8AppStore25ShelfDisplayingFlowLayout_multiColumnOrigins;
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v6) = (Class)sub_10066E2E4((uint64_t)_swiftEmptyArrayStorage);

  result = (_TtC8AppStore25ShelfDisplayingFlowLayout *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)prepareLayout
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ShelfDisplayingFlowLayout();
  id v2 = v3.receiver;
  [(ShelfDisplayingFlowLayout *)&v3 prepareLayout];
  sub_1001ABF28();
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v7 = self;
  id v8 = sub_1001AAEEC(x, y, width, height);

  if (v8)
  {
    sub_100084CF0(0, (unint64_t *)&qword_1009839F0);
    v9.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v9.super.isa = 0;
  }

  return v9.super.isa;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  uint64_t v4 = type metadata accessor for IndexPath();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v8 = self;
  id v9 = sub_1001AB420();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);

  return v9;
}

- (id)layoutAttributesForDecorationViewOfKind:(id)a3 atIndexPath:(id)a4
{
  uint64_t v5 = type metadata accessor for IndexPath();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  id v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = v10;
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  if (v9 == 0xD00000000000001FLL && v11 == 0x800000010080A920
    || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    v12 = self;
    id v13 = sub_1001ABB1C();

    swift_bridgeObjectRelease();
  }
  else
  {
    v14 = self;
    NSString v15 = String._bridgeToObjectiveC()();
    Class isa = IndexPath._bridgeToObjectiveC()().super.isa;
    v17 = (objc_class *)type metadata accessor for ShelfDisplayingFlowLayout();
    v19.receiver = v14;
    v19.super_class = v17;
    id v13 = [(ShelfDisplayingFlowLayout *)&v19 layoutAttributesForDecorationViewOfKind:v15 atIndexPath:isa];

    swift_bridgeObjectRelease();
  }
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  return v13;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v7 = self;
  id v8 = [(ShelfDisplayingFlowLayout *)v7 collectionView];
  if (v8)
  {
    uint64_t v9 = v8;
    [v8 bounds];
    double v11 = v10;
    double v13 = v12;

    if (v11 != width) {
      goto LABEL_7;
    }
  }
  else
  {
    double v13 = 0.0;
    if (width != 0.0)
    {
LABEL_7:

      return 1;
    }
  }
  if (v13 != height) {
    goto LABEL_7;
  }
  v16.receiver = v7;
  v16.super_class = (Class)type metadata accessor for ShelfDisplayingFlowLayout();
  BOOL v14 = -[ShelfDisplayingFlowLayout shouldInvalidateLayoutForBoundsChange:](&v16, "shouldInvalidateLayoutForBoundsChange:", x, y, width, height);

  return v14;
}

- (id)invalidationContextForBoundsChange:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v7 = self;
  id v8 = sub_1001AB980(x, y, width, height);

  return v8;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end