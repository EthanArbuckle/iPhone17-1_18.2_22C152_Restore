@interface CollectionViewTableFlowLayout
- (BOOL)sectionFootersPinToVisibleBounds;
- (BOOL)sectionHeadersPinToVisibleBounds;
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (CGSize)collectionViewContentSize;
- (_TtC8AppStore29CollectionViewTableFlowLayout)init;
- (id)finalLayoutAttributesForDisappearingSupplementaryElementOfKind:(id)a3 atIndexPath:(id)a4;
- (id)initialLayoutAttributesForAppearingSupplementaryElementOfKind:(id)a3 atIndexPath:(id)a4;
- (id)invalidationContextForBoundsChange:(CGRect)a3;
- (id)layoutAttributesForDecorationViewOfKind:(id)a3 atIndexPath:(id)a4;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4;
- (void)invalidateLayoutWithContext:(id)a3;
- (void)prepareLayout;
- (void)setSectionFootersPinToVisibleBounds:(BOOL)a3;
- (void)setSectionHeadersPinToVisibleBounds:(BOOL)a3;
@end

@implementation CollectionViewTableFlowLayout

- (_TtC8AppStore29CollectionViewTableFlowLayout)init
{
  return (_TtC8AppStore29CollectionViewTableFlowLayout *)sub_1002BCEA8();
}

- (BOOL)sectionHeadersPinToVisibleBounds
{
  return 0;
}

- (void)setSectionHeadersPinToVisibleBounds:(BOOL)a3
{
  v3 = self;
  sub_1002BE7D0((void *)0x8000000100811D20);
}

- (BOOL)sectionFootersPinToVisibleBounds
{
  return 0;
}

- (void)setSectionFootersPinToVisibleBounds:(BOOL)a3
{
  v3 = self;
  sub_1002BE7D0((void *)0x8000000100811CE0);
}

- (void)prepareLayout
{
  v2 = self;
  sub_1002BD19C();
}

- (CGSize)collectionViewContentSize
{
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for CollectionViewTableFlowLayout();
  v2 = (char *)v10.receiver;
  [(CollectionViewTableFlowLayout *)&v10 collectionViewContentSize];
  double v4 = v3;
  double v6 = v5;
  double v7 = *(double *)&v2[OBJC_IVAR____TtC8AppStore29CollectionViewTableFlowLayout_globalHeaderSize + 8];

  double v8 = v6 + v7;
  double v9 = v4;
  result.height = v8;
  result.width = v9;
  return result;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  uint64_t v4 = type metadata accessor for IndexPath();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  double v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  double v8 = self;
  id v9 = sub_1002BD414();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);

  return v9;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  return sub_1002BD8D8(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t, char *))sub_1002BD5F0);
}

- (id)layoutAttributesForDecorationViewOfKind:(id)a3 atIndexPath:(id)a4
{
  return sub_1002BD8D8(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t, char *))sub_1002BD7D4);
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v7 = self;
  uint64_t v8 = sub_1002BDA0C(x, y, width, height);

  if (v8)
  {
    sub_100060260();
    v9.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v9.super.isa = 0;
  }

  return v9.super.isa;
}

- (id)finalLayoutAttributesForDisappearingSupplementaryElementOfKind:(id)a3 atIndexPath:(id)a4
{
  return sub_1002BDD8C(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (SEL *)&selRef_finalLayoutAttributesForDisappearingSupplementaryElementOfKind_atIndexPath_);
}

- (id)initialLayoutAttributesForAppearingSupplementaryElementOfKind:(id)a3 atIndexPath:(id)a4
{
  return sub_1002BDD8C(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (SEL *)&selRef_initialLayoutAttributesForAppearingSupplementaryElementOfKind_atIndexPath_);
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v7 = self;
  char v8 = sub_1002BDF18(x, y, width, height);

  return v8 & 1;
}

- (id)invalidationContextForBoundsChange:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v7 = self;
  char v8 = sub_1002BE0B4(x, y, width, height);

  return v8;
}

- (void)invalidateLayoutWithContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1002BE350(v4);
}

- (void).cxx_destruct
{
  sub_10006012C(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC8AppStore29CollectionViewTableFlowLayout_pendingPrepareObserver));
}

@end