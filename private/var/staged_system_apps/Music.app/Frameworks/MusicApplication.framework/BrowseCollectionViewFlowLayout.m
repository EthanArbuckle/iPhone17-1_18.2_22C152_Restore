@interface BrowseCollectionViewFlowLayout
- (BOOL)sectionHeadersPinToVisibleBounds;
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (CGPoint)_contentOffsetFromProposedContentOffset:(CGPoint)a3 forScrollingToItemAtIndexPath:(id)a4 atScrollPosition:(unint64_t)a5;
- (CGSize)collectionViewContentSize;
- (_TtC16MusicApplication30BrowseCollectionViewFlowLayout)init;
- (_TtC16MusicApplication30BrowseCollectionViewFlowLayout)initWithCoder:(id)a3;
- (id)invalidationContextForBoundsChange:(CGRect)a3;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4;
- (void)invalidateLayoutWithContext:(id)a3;
- (void)prepareLayout;
- (void)setSectionHeadersPinToVisibleBounds:(BOOL)a3;
@end

@implementation BrowseCollectionViewFlowLayout

- (BOOL)sectionHeadersPinToVisibleBounds
{
  return 0;
}

- (void)setSectionHeadersPinToVisibleBounds:(BOOL)a3
{
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC16MusicApplication30BrowseCollectionViewFlowLayout_customSectionHeadersPinToVisibleBounds) = a3;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  v3 = self;
  char v4 = sub_2DA128();

  return v4 & 1;
}

- (id)invalidationContextForBoundsChange:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = self;
  sub_2DA22C(x, y, width, height);
  v9 = v8;

  return v9;
}

- (void)invalidateLayoutWithContext:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_2DA5A4(v4);
}

- (void)prepareLayout
{
  v2 = self;
  sub_2DB228();
}

- (CGSize)collectionViewContentSize
{
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for BrowseCollectionViewFlowLayout();
  v2 = (char *)v10.receiver;
  [(BrowseCollectionViewFlowLayout *)&v10 collectionViewContentSize];
  double v4 = v3;
  double v6 = v5 + *(double *)&v2[OBJC_IVAR____TtC16MusicApplication30BrowseCollectionViewFlowLayout_globalHeaderHeight];
  double v7 = *(double *)&v2[OBJC_IVAR____TtC16MusicApplication30BrowseCollectionViewFlowLayout_globalFooterHeight];

  double v8 = v6 + v7;
  double v9 = v4;
  result.double height = v8;
  result.double width = v9;
  return result;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v7 = self;
  uint64_t v8 = sub_2DB418(x, y, width, height);

  if (v8)
  {
    sub_2DD160();
    v9.super.isa = sub_AB6990().super.isa;
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
  uint64_t v5 = sub_AB1110();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_AB1080();
  id v9 = a3;
  objc_super v10 = self;
  v11 = sub_2DC0F4();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  return v11;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  uint64_t v7 = sub_AB1110();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  objc_super v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_AB6510();
  uint64_t v13 = v12;
  sub_AB1080();
  id v14 = a3;
  id v15 = a4;
  v16 = self;
  v17 = sub_2DC32C(v11, v13);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  swift_bridgeObjectRelease();

  return v17;
}

- (CGPoint)_contentOffsetFromProposedContentOffset:(CGPoint)a3 forScrollingToItemAtIndexPath:(id)a4 atScrollPosition:(unint64_t)a5
{
  double x = a3.x;
  uint64_t v9 = sub_AB1110();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_AB1080();
  id v13 = a4;
  id v14 = self;
  double v15 = sub_2DCAF0(x, (uint64_t)v12, a5);
  double v17 = v16;

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  double v18 = v15;
  double v19 = v17;
  result.double y = v19;
  result.double x = v18;
  return result;
}

- (_TtC16MusicApplication30BrowseCollectionViewFlowLayout)init
{
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC16MusicApplication30BrowseCollectionViewFlowLayout_customSectionHeadersPinToVisibleBounds) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication30BrowseCollectionViewFlowLayout_globalHeaderHeight) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication30BrowseCollectionViewFlowLayout_globalFooterHeight) = 0;
  uint64_t v3 = OBJC_IVAR____TtC16MusicApplication30BrowseCollectionViewFlowLayout_returnedSupplementaryViewIndexPaths;
  double v4 = self;
  *(Class *)((char *)&self->super.super.super.isa + v3) = (Class)sub_9E780((uint64_t)_swiftEmptyArrayStorage);

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for BrowseCollectionViewFlowLayout();
  return [(BrowseCollectionViewFlowLayout *)&v6 init];
}

- (_TtC16MusicApplication30BrowseCollectionViewFlowLayout)initWithCoder:(id)a3
{
  id v3 = a3;
  double v4 = (_TtC16MusicApplication30BrowseCollectionViewFlowLayout *)sub_2DD0CC((uint64_t)v3);

  return v4;
}

- (void).cxx_destruct
{
}

@end