@interface AmbientCollectionViewLayout
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3;
- (CGSize)collectionViewContentSize;
- (_TtC11PosterBoard27AmbientCollectionViewLayout)init;
- (_TtC11PosterBoard27AmbientCollectionViewLayout)initWithCoder:(id)a3;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4;
- (void)prepareLayout;
@end

@implementation AmbientCollectionViewLayout

- (void)prepareLayout
{
  v2 = self;
  sub_1D330BF18();
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  return 1;
}

- (CGSize)collectionViewContentSize
{
  double v2 = *(double *)((char *)&self->super.super._collectionViewBoundsSize.width
                 + OBJC_IVAR____TtC11PosterBoard27AmbientCollectionViewLayout_contentBounds);
  double v3 = *(double *)((char *)&self->super.super._collectionViewBoundsSize.height
                 + OBJC_IVAR____TtC11PosterBoard27AmbientCollectionViewLayout_contentBounds);
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  uint64_t v5 = sub_1D3372088();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1D3372288();
  uint64_t v11 = v10;
  sub_1D3372018();
  v12 = self;
  v13 = (void *)sub_1D330CA98(v9, v11);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v13;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  uint64_t v4 = sub_1D3372088();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D3372018();
  v8 = self;
  id v9 = sub_1D330CD34((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v9;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v7 = self;
  uint64_t v8 = sub_1D330D1B0(x, y, width, height);

  if (v8)
  {
    sub_1D330E190();
    id v9 = (void *)sub_1D3372338();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v9 = 0;
  }
  return v9;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v5 = self;
  double v6 = sub_1D330DC14(x, y);
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double y = v10;
  result.double x = v9;
  return result;
}

- (_TtC11PosterBoard27AmbientCollectionViewLayout)init
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC11PosterBoard27AmbientCollectionViewLayout_cardSizeMultiplier) = (Class)0x3FE6147AE147AE14;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC11PosterBoard27AmbientCollectionViewLayout_spacingBetweenCards) = (Class)0x4049000000000000;
  double v2 = (_OWORD *)((char *)self + OBJC_IVAR____TtC11PosterBoard27AmbientCollectionViewLayout_contentBounds);
  _OWORD *v2 = 0u;
  v2[1] = 0u;
  double v3 = (objc_class *)MEMORY[0x1E4FBC860];
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC11PosterBoard27AmbientCollectionViewLayout_cachedAttributes) = (Class)MEMORY[0x1E4FBC860];
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC11PosterBoard27AmbientCollectionViewLayout_cachedSupplementaryFooterAttributes) = v3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for AmbientCollectionViewLayout();
  return [(UICollectionViewFlowLayout *)&v5 init];
}

- (_TtC11PosterBoard27AmbientCollectionViewLayout)initWithCoder:(id)a3
{
  return (_TtC11PosterBoard27AmbientCollectionViewLayout *)sub_1D330E014(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end