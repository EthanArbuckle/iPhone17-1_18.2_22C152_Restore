@interface SearchCollectionViewLayout
+ (Class)layoutAttributesClass;
- (CGSize)collectionViewContentSize;
- (_TtC8AppStore26SearchCollectionViewLayout)init;
- (_TtC8AppStore26SearchCollectionViewLayout)initWithCoder:(id)a3;
- (id)layoutAttributesForDecorationViewOfKind:(id)a3 atIndexPath:(id)a4;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (void)prepareLayout;
@end

@implementation SearchCollectionViewLayout

+ (Class)layoutAttributesClass
{
  type metadata accessor for SearchCollectionLayoutAttributes();

  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC8AppStore26SearchCollectionViewLayout)init
{
  return (_TtC8AppStore26SearchCollectionViewLayout *)sub_1003711E8();
}

- (_TtC8AppStore26SearchCollectionViewLayout)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8AppStore26SearchCollectionViewLayout_backgroundCornerRadius) = 0;
  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC8AppStore26SearchCollectionViewLayout_pendingPrepareObserver);
  void *v4 = 0;
  v4[1] = 0;
  id v5 = a3;

  result = (_TtC8AppStore26SearchCollectionViewLayout *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (CGSize)collectionViewContentSize
{
  v2 = self;
  double v3 = sub_1003713F8();
  double v5 = v4;

  double v6 = v3;
  double v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  double x = a3.origin.x;
  double v4 = self;
  uint64_t v5 = sub_1003715BC(x);

  if (v5)
  {
    sub_100084CF0(0, (unint64_t *)&qword_1009839F0);
    v6.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v6.super.isa = 0;
  }

  return v6.super.isa;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  uint64_t v4 = type metadata accessor for IndexPath();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  double v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  Class isa = IndexPath._bridgeToObjectiveC()().super.isa;
  v10 = (objc_class *)type metadata accessor for SearchCollectionViewLayout();
  v14.receiver = v8;
  v14.super_class = v10;
  v11 = (_TtC8AppStore26SearchCollectionViewLayout *)[(SearchCollectionViewLayout *)&v14 layoutAttributesForItemAtIndexPath:isa];

  if (v11)
  {
    id v12 = sub_100372264(v11);

    v8 = v11;
  }
  else
  {
    id v12 = 0;
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);

  return v12;
}

- (id)layoutAttributesForDecorationViewOfKind:(id)a3 atIndexPath:(id)a4
{
  uint64_t v5 = type metadata accessor for IndexPath();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = v10;
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v12 = self;
  v13 = (void *)sub_100372794(v9, v11, (uint64_t)v8);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  return v13;
}

- (void)prepareLayout
{
  v2 = self;
  sub_1003736A0();
}

- (void).cxx_destruct
{
  sub_10006012C(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC8AppStore26SearchCollectionViewLayout_pendingPrepareObserver));
}

@end