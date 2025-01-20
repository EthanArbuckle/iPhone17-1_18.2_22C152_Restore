@interface BaseCollectionCompositionalLayout
+ (Class)layoutAttributesClass;
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (_TtC8AppStore33BaseCollectionCompositionalLayout)initWithCoder:(id)a3;
- (_TtC8AppStore33BaseCollectionCompositionalLayout)initWithSection:(id)a3;
- (_TtC8AppStore33BaseCollectionCompositionalLayout)initWithSection:(id)a3 configuration:(id)a4;
- (_TtC8AppStore33BaseCollectionCompositionalLayout)initWithSection:(id)a3 sectionProvider:(id)a4 configuration:(id)a5;
- (_TtC8AppStore33BaseCollectionCompositionalLayout)initWithSectionProvider:(id)a3;
- (_TtC8AppStore33BaseCollectionCompositionalLayout)initWithSectionProvider:(id)a3 configuration:(id)a4;
- (id)invalidationContextForBoundsChange:(CGRect)a3;
- (id)layoutAttributesForDecorationViewOfKind:(id)a3 atIndexPath:(id)a4;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4;
- (void)prepareLayout;
@end

@implementation BaseCollectionCompositionalLayout

- (_TtC8AppStore33BaseCollectionCompositionalLayout)initWithSectionProvider:(id)a3 configuration:(id)a4
{
  v5 = _Block_copy(a3);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  return (_TtC8AppStore33BaseCollectionCompositionalLayout *)sub_10003DFD4((uint64_t)sub_10004DFFC, v6, a4);
}

- (id)invalidationContextForBoundsChange:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = self;
  id v8 = sub_100025934(x, y, width, height);

  return v8;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = self;
  char v8 = sub_100043560(x, y, width, height);

  return v8 & 1;
}

- (void)prepareLayout
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for BaseCollectionCompositionalLayout();
  v2 = (char *)v6.receiver;
  [(BaseCollectionCompositionalLayout *)&v6 prepareLayout];
  v3 = (uint64_t *)&v2[OBJC_IVAR____TtC8AppStore33BaseCollectionCompositionalLayout_pendingPrepareObserver];
  v4 = *(void (**)(char *))&v2[OBJC_IVAR____TtC8AppStore33BaseCollectionCompositionalLayout_pendingPrepareObserver];
  if (v4)
  {
    swift_retain();
    v4(v2);
    sub_10006012C((uint64_t)v4);
    uint64_t v5 = *v3;
  }
  else
  {
    uint64_t v5 = 0;
  }
  uint64_t *v3 = 0;
  v3[1] = 0;
  sub_10006012C(v5);
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v14.receiver = self;
  v14.super_class = (Class)type metadata accessor for BaseCollectionCompositionalLayout();
  id v7 = v14.receiver;
  id v8 = -[BaseCollectionCompositionalLayout layoutAttributesForElementsInRect:](&v14, "layoutAttributesForElementsInRect:", x, y, width, height);
  if (v8)
  {
    v9 = v8;
    sub_100060260();
    unint64_t v10 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    id v11 = v7;
    sub_1000602A0(v10);

    swift_bridgeObjectRelease();
    v12.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {

    v12.super.isa = 0;
  }

  return v12.super.isa;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  uint64_t v4 = type metadata accessor for IndexPath();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v8 = self;
  Class isa = IndexPath._bridgeToObjectiveC()().super.isa;
  unint64_t v10 = (objc_class *)type metadata accessor for BaseCollectionCompositionalLayout();
  v14.receiver = v8;
  v14.super_class = v10;
  id v11 = (char *)[(BaseCollectionCompositionalLayout *)&v14 layoutAttributesForItemAtIndexPath:isa];

  if (v11)
  {
    NSArray v12 = v11;
    id v11 = sub_100060554(v12);

    id v8 = (_TtC8AppStore33BaseCollectionCompositionalLayout *)v12;
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);

  return v11;
}

+ (Class)layoutAttributesClass
{
  type metadata accessor for BaseCollectionViewLayoutAttributes();

  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC8AppStore33BaseCollectionCompositionalLayout)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8AppStore33BaseCollectionCompositionalLayout_indexPathsRequiringRubberbanding) = (Class)&_swiftEmptySetSingleton;
  uint64_t v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC8AppStore33BaseCollectionCompositionalLayout_pendingPrepareObserver);
  *uint64_t v4 = 0;
  v4[1] = 0;
  id v5 = a3;

  result = (_TtC8AppStore33BaseCollectionCompositionalLayout *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  return sub_1003DD3D8(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (SEL *)&selRef_layoutAttributesForSupplementaryViewOfKind_atIndexPath_);
}

- (id)layoutAttributesForDecorationViewOfKind:(id)a3 atIndexPath:(id)a4
{
  return sub_1003DD3D8(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (SEL *)&selRef_layoutAttributesForDecorationViewOfKind_atIndexPath_);
}

- (_TtC8AppStore33BaseCollectionCompositionalLayout)initWithSection:(id)a3
{
  id v3 = a3;
  result = (_TtC8AppStore33BaseCollectionCompositionalLayout *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC8AppStore33BaseCollectionCompositionalLayout)initWithSection:(id)a3 configuration:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  result = (_TtC8AppStore33BaseCollectionCompositionalLayout *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC8AppStore33BaseCollectionCompositionalLayout)initWithSectionProvider:(id)a3
{
  id v3 = _Block_copy(a3);
  _Block_release(v3);
  result = (_TtC8AppStore33BaseCollectionCompositionalLayout *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC8AppStore33BaseCollectionCompositionalLayout)initWithSection:(id)a3 sectionProvider:(id)a4 configuration:(id)a5
{
  _Block_copy(a4);
  id v7 = a3;
  id v8 = a5;
  result = (_TtC8AppStore33BaseCollectionCompositionalLayout *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC8AppStore33BaseCollectionCompositionalLayout_pendingPrepareObserver);

  sub_10006012C(v3);
}

@end