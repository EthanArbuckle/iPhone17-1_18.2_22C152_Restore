@interface ShelfCollectionViewLayout
+ (Class)invalidationContextClass;
- (BOOL)flipsHorizontallyInOppositeLayoutDirection;
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3 withScrollingVelocity:(CGPoint)a4;
- (CGSize)collectionViewContentSize;
- (_TtC16MusicApplication25ShelfCollectionViewLayout)init;
- (_TtC16MusicApplication25ShelfCollectionViewLayout)initWithCoder:(id)a3;
- (id)invalidationContextForBoundsChange:(CGRect)a3;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4;
- (void)invalidateLayoutWithContext:(id)a3;
- (void)music_collectionViewInheritedLayoutInsetsDidChange;
- (void)panGestureRecognizerStateDidChange:(id)a3;
- (void)prepareLayout;
@end

@implementation ShelfCollectionViewLayout

- (CGSize)collectionViewContentSize
{
  double v2 = *(double *)((char *)&self->super.super.isa
                 + OBJC_IVAR____TtC16MusicApplication25ShelfCollectionViewLayout_contentSize);
  double v3 = *(double *)&self->scrollStyle[OBJC_IVAR____TtC16MusicApplication25ShelfCollectionViewLayout_contentSize];
  result.height = v3;
  result.width = v2;
  return result;
}

+ (Class)invalidationContextClass
{
  type metadata accessor for ShelfCollectionViewLayout.InvalidationContext();

  return (Class)swift_getObjCClassFromMetadata();
}

- (id)invalidationContextForBoundsChange:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v7 = self;
  v8 = (void *)ShelfCollectionViewLayout.invalidationContext(forBoundsChange:)(x, y, width, height);

  return v8;
}

- (void)invalidateLayoutWithContext:(id)a3
{
  id v4 = a3;
  v5 = self;
  ShelfCollectionViewLayout.invalidateLayout(with:)((UICollectionViewLayoutInvalidationContext)v4);
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v10 = _swiftEmptyArrayStorage;
  v7 = self;
  sub_365D94((char *)v7, v7, &v10, x, y, width, height);
  sub_366618((char *)v7, v7, &v10, x, y, width, height);
  sub_3668FC((char *)v7, v7, &v10, x, y, width, height);

  sub_173E4(0, (unint64_t *)&qword_DBF230);
  v8.super.isa = sub_AB6990().super.isa;
  swift_bridgeObjectRelease();

  return v8.super.isa;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  uint64_t v5 = sub_AB1110();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  NSArray v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_AB1080();
  id v9 = a3;
  v10 = self;
  v11 = (void *)ShelfCollectionViewLayout.layoutAttributesForItem(at:)((uint64_t)v8);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  return v11;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  uint64_t v7 = sub_AB1110();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_AB6510();
  uint64_t v13 = v12;
  sub_AB1080();
  id v14 = a3;
  id v15 = a4;
  v16 = self;
  v17 = (void *)ShelfCollectionViewLayout.layoutAttributesForSupplementaryView(ofKind:at:)(v11, v13, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  swift_bridgeObjectRelease();

  return v17;
}

- (void)prepareLayout
{
  double v2 = self;
  ShelfCollectionViewLayout.prepare()();
}

- (void)panGestureRecognizerStateDidChange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_351CAC(v4);
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v7 = self;
  unsigned __int8 v8 = ShelfCollectionViewLayout.shouldInvalidateLayout(forBoundsChange:)(x, y, width, height);

  return v8 & 1;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3 withScrollingVelocity:(CGPoint)a4
{
  CGFloat x = a4.x;
  double y = a3.y;
  CGFloat v6 = a3.x;
  uint64_t v7 = self;
  *(CGFloat *)v8.i64 = x;
  CGFloat v9 = ShelfCollectionViewLayout.targetContentOffset(forProposedContentOffset:withScrollingVelocity:)(v6, y, v8);
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.double y = v13;
  result.CGFloat x = v12;
  return result;
}

- (void)music_collectionViewInheritedLayoutInsetsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ShelfCollectionViewLayout();
  id v2 = v3.receiver;
  [(ShelfCollectionViewLayout *)&v3 music_collectionViewInheritedLayoutInsetsDidChange];
  [v2 invalidateLayout];
}

- (BOOL)flipsHorizontallyInOppositeLayoutDirection
{
  return 1;
}

- (_TtC16MusicApplication25ShelfCollectionViewLayout)init
{
  return (_TtC16MusicApplication25ShelfCollectionViewLayout *)ShelfCollectionViewLayout.init()();
}

- (_TtC16MusicApplication25ShelfCollectionViewLayout)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = (_TtC16MusicApplication25ShelfCollectionViewLayout *)sub_367670((uint64_t)v3);

  return v4;
}

- (void).cxx_destruct
{
  sub_1A538((uint64_t)self + OBJC_IVAR____TtC16MusicApplication25ShelfCollectionViewLayout_startingIndexPath, (uint64_t *)&unk_DC0F70);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end