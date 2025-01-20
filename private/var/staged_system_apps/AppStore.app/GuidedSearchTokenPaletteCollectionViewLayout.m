@interface GuidedSearchTokenPaletteCollectionViewLayout
+ (Class)layoutAttributesClass;
- (BOOL)flipsHorizontallyInOppositeLayoutDirection;
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (_TtC8AppStore44GuidedSearchTokenPaletteCollectionViewLayout)init;
- (_TtC8AppStore44GuidedSearchTokenPaletteCollectionViewLayout)initWithCoder:(id)a3;
- (id)finalLayoutAttributesForDisappearingItemAtIndexPath:(id)a3;
- (id)initialLayoutAttributesForAppearingItemAtIndexPath:(id)a3;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (void)finalizeCollectionViewUpdates;
- (void)prepareForCollectionViewUpdates:(id)a3;
@end

@implementation GuidedSearchTokenPaletteCollectionViewLayout

- (_TtC8AppStore44GuidedSearchTokenPaletteCollectionViewLayout)init
{
  return (_TtC8AppStore44GuidedSearchTokenPaletteCollectionViewLayout *)sub_100437DDC();
}

- (_TtC8AppStore44GuidedSearchTokenPaletteCollectionViewLayout)initWithCoder:(id)a3
{
  *(void *)&self->pinningEnabled[OBJC_IVAR____TtC8AppStore44GuidedSearchTokenPaletteCollectionViewLayout_layoutDelegate] = 0;
  swift_unknownObjectWeakInit();
  id v5 = a3;

  result = (_TtC8AppStore44GuidedSearchTokenPaletteCollectionViewLayout *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

+ (Class)layoutAttributesClass
{
  type metadata accessor for GuidedSearchTokenPaletteCollectionViewLayout.LayoutAttributes();

  return (Class)swift_getObjCClassFromMetadata();
}

- (void)prepareForCollectionViewUpdates:(id)a3
{
  sub_100084CF0(0, &qword_1009968E0);
  unint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v5 = self;
  sub_100437FA4(v4);

  swift_bridgeObjectRelease();
}

- (void)finalizeCollectionViewUpdates
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for GuidedSearchTokenPaletteCollectionViewLayout();
  v2 = (char *)v5.receiver;
  [(GuidedSearchTokenPaletteCollectionViewLayout *)&v5 finalizeCollectionViewUpdates];
  v3 = &v2[OBJC_IVAR____TtC8AppStore44GuidedSearchTokenPaletteCollectionViewLayout_indexPathsToSlideInAppearAnimate];
  swift_beginAccess();
  *(void *)v3 = _swiftEmptyArrayStorage;
  swift_bridgeObjectRelease();
  unint64_t v4 = &v2[OBJC_IVAR____TtC8AppStore44GuidedSearchTokenPaletteCollectionViewLayout_indexPathsToFadeDisappearAnimate];
  swift_beginAccess();
  *(void *)unint64_t v4 = _swiftEmptyArrayStorage;

  swift_bridgeObjectRelease();
}

- (id)initialLayoutAttributesForAppearingItemAtIndexPath:(id)a3
{
  return sub_100438AF8(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(char *))sub_1004387E4);
}

- (id)finalLayoutAttributesForDisappearingItemAtIndexPath:(id)a3
{
  return sub_100438AF8(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(char *))sub_100438978);
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v14.receiver = self;
  v14.super_class = (Class)type metadata accessor for GuidedSearchTokenPaletteCollectionViewLayout();
  id v7 = v14.receiver;
  id v8 = -[GuidedSearchTokenPaletteCollectionViewLayout layoutAttributesForElementsInRect:](&v14, "layoutAttributesForElementsInRect:", x, y, width, height);
  if (v8)
  {
    v9 = v8;
    sub_100084CF0(0, (unint64_t *)&qword_1009839F0);
    unint64_t v10 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    v11 = (char *)v7;
    sub_100439620(v10, v11);
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
  unint64_t v10 = (objc_class *)type metadata accessor for GuidedSearchTokenPaletteCollectionViewLayout();
  v14.receiver = v8;
  v14.super_class = v10;
  v11 = (_TtC8AppStore44GuidedSearchTokenPaletteCollectionViewLayout *)[(GuidedSearchTokenPaletteCollectionViewLayout *)&v14 layoutAttributesForItemAtIndexPath:isa];

  if (v11)
  {
    id v12 = sub_100439248(v11);

    id v8 = v11;
  }
  else
  {
    id v12 = 0;
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);

  return v12;
}

- (BOOL)flipsHorizontallyInOppositeLayoutDirection
{
  return 1;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for GuidedSearchTokenPaletteCollectionViewLayout();
  id v7 = v10.receiver;
  if (-[GuidedSearchTokenPaletteCollectionViewLayout shouldInvalidateLayoutForBoundsChange:](&v10, "shouldInvalidateLayoutForBoundsChange:", x, y, width, height))
  {
    char v8 = 1;
  }
  else
  {
    char v8 = v7[OBJC_IVAR____TtC8AppStore44GuidedSearchTokenPaletteCollectionViewLayout_pinningEnabled];
  }

  return v8;
}

- (void).cxx_destruct
{
  sub_100092F18((uint64_t)self + OBJC_IVAR____TtC8AppStore44GuidedSearchTokenPaletteCollectionViewLayout_layoutDelegate);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end