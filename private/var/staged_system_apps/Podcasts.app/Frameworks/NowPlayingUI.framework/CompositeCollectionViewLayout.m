@interface CompositeCollectionViewLayout
+ (Class)invalidationContextClass;
- (BOOL)canBeEdited;
- (BOOL)isEditing;
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (CGSize)collectionViewContentSize;
- (_TtC12NowPlayingUI29CompositeCollectionViewLayout)init;
- (_TtC12NowPlayingUI29CompositeCollectionViewLayout)initWithCoder:(id)a3;
- (id)_decorationViewForLayoutAttributes:(id)a3;
- (id)indexPathsToDeleteForDecorationViewOfKind:(id)a3;
- (id)invalidationContextForBoundsChange:(CGRect)a3;
- (id)layoutAttributesForDecorationViewOfKind:(id)a3 atIndexPath:(id)a4;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4;
- (void)invalidateLayoutWithContext:(id)a3;
- (void)prepareForCollectionViewUpdates:(id)a3;
- (void)prepareLayout;
- (void)setEditing:(BOOL)a3;
@end

@implementation CompositeCollectionViewLayout

- (void)prepareLayout
{
  v2 = self;
  sub_C3080();
}

- (CGSize)collectionViewContentSize
{
  if (*(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC12NowPlayingUI29CompositeCollectionViewLayout_layoutData))
  {
    v2 = self;
    swift_retain();
    sub_B076C();
    if (v7)
    {
      __break(1u);
    }
    else
    {
      double v8 = v3;
      double v9 = v4;

      swift_release();
      double v5 = v8;
      double v6 = v9;
    }
  }
  else
  {
    double v5 = 0.0;
    double v6 = 0.0;
  }
  result.height = v6;
  result.width = v5;
  return result;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  char v7 = self;
  double v8 = sub_C3374(x, y, width, height);

  if (v8)
  {
    sub_E67C(0, (unint64_t *)&qword_1A0650);
    v9.super.isa = sub_129AA0().super.isa;
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
  uint64_t v4 = sub_126C50();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  char v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_126BD0();
  double v8 = self;
  sub_C4140();
  v10 = v9;

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);

  return v10;
}

- (id)layoutAttributesForDecorationViewOfKind:(id)a3 atIndexPath:(id)a4
{
  uint64_t v5 = sub_126C50();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  double v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1299F0();
  uint64_t v11 = v10;
  sub_126BD0();
  uint64_t v12 = self;
  v13 = sub_C4698(v9, v11, (uint64_t)v8);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  return v13;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  uint64_t v5 = sub_126C50();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  double v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1299F0();
  uint64_t v11 = v10;
  sub_126BD0();
  uint64_t v12 = self;
  sub_C7E9C((uint64_t)v8, 1, v9, v11, (uint64_t)v12, v9, v11, (SEL *)&selRef_layoutAttributesForSupplementaryViewOfKind_atIndexPath_);
  v14 = v13;

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  return v14;
}

- (void)prepareForCollectionViewUpdates:(id)a3
{
  sub_E67C(0, &qword_1A1960);
  uint64_t v4 = sub_129AB0();
  uint64_t v5 = self;
  Class isa = sub_129AA0().super.isa;
  v7.receiver = v5;
  v7.super_class = (Class)type metadata accessor for CompositeCollectionViewLayout();
  [(CompositeCollectionViewLayout *)&v7 prepareForCollectionViewUpdates:isa];

  *(Class *)((char *)&v5->super.super.isa
           + OBJC_IVAR____TtC12NowPlayingUI29CompositeCollectionViewLayout_currentCollectionViewUpdates) = (Class)v4;

  swift_bridgeObjectRelease();
}

- (id)indexPathsToDeleteForDecorationViewOfKind:(id)a3
{
  sub_1299F0();
  uint64_t v4 = self;
  sub_C4C74();

  swift_bridgeObjectRelease();
  sub_126C50();
  v5.super.Class isa = sub_129AA0().super.isa;
  swift_bridgeObjectRelease();

  return v5.super.isa;
}

+ (Class)invalidationContextClass
{
  type metadata accessor for CompositeCollectionViewLayout.InvalidationContext();

  return (Class)swift_getObjCClassFromMetadata();
}

- (void)invalidateLayoutWithContext:(id)a3
{
  id v4 = a3;
  NSArray v5 = self;
  sub_C55B0(v4);
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  objc_super v7 = self;
  unsigned __int8 v8 = sub_C5BE0(x, y, width, height);

  return v8 & 1;
}

- (id)invalidationContextForBoundsChange:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  objc_super v7 = self;
  unsigned __int8 v8 = (void *)sub_C6194(x, y, width, height);

  return v8;
}

- (id)_decorationViewForLayoutAttributes:(id)a3
{
  id v4 = a3;
  NSArray v5 = self;
  uint64_t v6 = (void *)sub_C66EC(v4);

  return v6;
}

- (BOOL)canBeEdited
{
  v2 = self;
  unsigned __int8 v3 = sub_C6B24();

  return v3 & 1;
}

- (BOOL)isEditing
{
  v2 = self;
  unsigned __int8 v3 = (_TtC12NowPlayingUI29CompositeCollectionViewLayout *)[(CompositeCollectionViewLayout *)v2 collectionView];
  if (v3)
  {
    id v4 = v3;
    unsigned __int8 v5 = [(CompositeCollectionViewLayout *)v3 mt_isEditing];

    v2 = v4;
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (void)setEditing:(BOOL)a3
{
  id v4 = self;
  sub_C6D04(a3);
}

- (_TtC12NowPlayingUI29CompositeCollectionViewLayout)init
{
  return (_TtC12NowPlayingUI29CompositeCollectionViewLayout *)sub_C77CC();
}

- (_TtC12NowPlayingUI29CompositeCollectionViewLayout)initWithCoder:(id)a3
{
  return (_TtC12NowPlayingUI29CompositeCollectionViewLayout *)sub_C78D8(a3);
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end