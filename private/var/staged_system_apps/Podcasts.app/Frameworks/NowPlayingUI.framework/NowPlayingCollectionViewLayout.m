@interface NowPlayingCollectionViewLayout
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (_TtC12NowPlayingUI30NowPlayingCollectionViewLayout)init;
- (_TtC12NowPlayingUI30NowPlayingCollectionViewLayout)initWithCoder:(id)a3;
- (double)_paddingAboveSectionHeaders;
- (id)gestureRecognizerViewForSwipeActionController:(id)a3;
- (id)invalidationContextForBoundsChange:(CGRect)a3;
- (id)layoutAttributesForDecorationViewOfKind:(id)a3 atIndexPath:(id)a4;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForInteractivelyMovingItemAtIndexPath:(id)a3 withTargetPosition:(CGPoint)a4;
@end

@implementation NowPlayingCollectionViewLayout

- (_TtC12NowPlayingUI30NowPlayingCollectionViewLayout)init
{
  return (_TtC12NowPlayingUI30NowPlayingCollectionViewLayout *)sub_8A850();
}

- (_TtC12NowPlayingUI30NowPlayingCollectionViewLayout)initWithCoder:(id)a3
{
  self->UICollectionViewTableLayout_opaque[OBJC_IVAR____TtC12NowPlayingUI30NowPlayingCollectionViewLayout_cellSwipeActionEnabled] = 1;
  *(void *)&self->UICollectionViewTableLayout_opaque[OBJC_IVAR____TtC12NowPlayingUI30NowPlayingCollectionViewLayout_orientationWhenLastInvalidatedTableLayout] = 0;
  v4 = &self->UICollectionViewTableLayout_opaque[OBJC_IVAR____TtC12NowPlayingUI30NowPlayingCollectionViewLayout__lastBackgroundDecorationRect];
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  v4[32] = 1;
  id v5 = a3;

  result = (_TtC12NowPlayingUI30NowPlayingCollectionViewLayout *)sub_12A480();
  __break(1u);
  return result;
}

- (double)_paddingAboveSectionHeaders
{
  return 0.0;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v7 = self;
  unint64_t v8 = sub_8A9F4(x, y, width, height);

  if (v8)
  {
    sub_8CCCC();
    v9.super.isa = sub_129AA0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v9.super.isa = 0;
  }

  return v9.super.isa;
}

- (id)layoutAttributesForDecorationViewOfKind:(id)a3 atIndexPath:(id)a4
{
  uint64_t v5 = sub_126C50();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  unint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1299F0();
  uint64_t v11 = v10;
  sub_126BD0();
  v12 = self;
  v13 = sub_8AC8C(v9, v11);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  return v13;
}

- (id)gestureRecognizerViewForSwipeActionController:(id)a3
{
  if (self->UICollectionViewTableLayout_opaque[OBJC_IVAR____TtC12NowPlayingUI30NowPlayingCollectionViewLayout_cellSwipeActionEnabled] == 1)
  {
    v6.receiver = self;
    v6.super_class = (Class)swift_getObjectType();
    id v4 = [(NowPlayingCollectionViewLayout *)&v6 gestureRecognizerViewForSwipeActionController:a3];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)layoutAttributesForInteractivelyMovingItemAtIndexPath:(id)a3 withTargetPosition:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  uint64_t v7 = sub_126C50();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_126BD0();
  uint64_t v11 = self;
  id v12 = sub_8B1B8(x, y);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);

  return v12;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  v3 = self;
  id v4 = [(NowPlayingCollectionViewLayout *)v3 collectionView];
  if (!v4)
  {

LABEL_6:
    char v7 = 1;
    return v7 & 1;
  }
  uint64_t v5 = v4;
  [v4 bounds];
  if ((sub_12A030() & 1) == 0)
  {

    goto LABEL_6;
  }
  [v5 bounds];
  char v6 = sub_127B20();

  char v7 = v6 ^ 1;
  return v7 & 1;
}

- (id)invalidationContextForBoundsChange:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  char v7 = self;
  id v8 = sub_8B9F8(x, y, width, height);

  return v8;
}

@end