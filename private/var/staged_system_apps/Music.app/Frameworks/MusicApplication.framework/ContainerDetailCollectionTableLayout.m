@interface ContainerDetailCollectionTableLayout
- (CGSize)collectionViewContentSize;
- (_TtC16MusicApplication36ContainerDetailCollectionTableLayout)init;
- (_TtC16MusicApplication36ContainerDetailCollectionTableLayout)initWithCoder:(id)a3;
- (id)layoutAttributesForInteractivelyMovingItemAtIndexPath:(id)a3 withTargetPosition:(CGPoint)a4;
- (void)prepareLayout;
@end

@implementation ContainerDetailCollectionTableLayout

- (void)prepareLayout
{
  v3 = (objc_class *)type metadata accessor for ContainerDetailCollectionTableLayout();
  v9.receiver = self;
  v9.super_class = v3;
  v4 = self;
  [(ContainerDetailCollectionTableLayout *)&v9 prepareLayout];
  v8.receiver = v4;
  v8.super_class = v3;
  [(ContainerDetailCollectionTableLayout *)&v8 collectionViewContentSize];
  v5 = (double *)&v4->UICollectionViewTableLayout_opaque[OBJC_IVAR____TtC16MusicApplication36ContainerDetailCollectionTableLayout__collectionViewContentSize];
  *(void *)v5 = v6;
  v5[1] = v7
        + *(double *)&v4->UICollectionViewTableLayout_opaque[OBJC_IVAR____TtC16MusicApplication36ContainerDetailCollectionTableLayout_contentHeightAdjustment];
}

- (CGSize)collectionViewContentSize
{
  double v2 = *(double *)&self->UICollectionViewTableLayout_opaque[OBJC_IVAR____TtC16MusicApplication36ContainerDetailCollectionTableLayout__collectionViewContentSize];
  double v3 = *(double *)&self->contentHeightAdjustment[OBJC_IVAR____TtC16MusicApplication36ContainerDetailCollectionTableLayout__collectionViewContentSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)layoutAttributesForInteractivelyMovingItemAtIndexPath:(id)a3 withTargetPosition:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  uint64_t v8 = sub_AB1110();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_AB1080();
  id v12 = a3;
  v13 = self;
  id v14 = sub_2C0360(x, y);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);

  return v14;
}

- (_TtC16MusicApplication36ContainerDetailCollectionTableLayout)init
{
  *(void *)&self->UICollectionViewTableLayout_opaque[OBJC_IVAR____TtC16MusicApplication36ContainerDetailCollectionTableLayout_contentHeightAdjustment] = 0;
  double v3 = &self->UICollectionViewTableLayout_opaque[OBJC_IVAR____TtC16MusicApplication36ContainerDetailCollectionTableLayout__collectionViewContentSize];
  v4 = (objc_class *)type metadata accessor for ContainerDetailCollectionTableLayout();
  *(void *)double v3 = 0;
  *((void *)v3 + 1) = 0;
  v6.receiver = self;
  v6.super_class = v4;
  return [(ContainerDetailCollectionTableLayout *)&v6 init];
}

- (_TtC16MusicApplication36ContainerDetailCollectionTableLayout)initWithCoder:(id)a3
{
  *(void *)&self->UICollectionViewTableLayout_opaque[OBJC_IVAR____TtC16MusicApplication36ContainerDetailCollectionTableLayout_contentHeightAdjustment] = 0;
  v4 = &self->UICollectionViewTableLayout_opaque[OBJC_IVAR____TtC16MusicApplication36ContainerDetailCollectionTableLayout__collectionViewContentSize];
  *(void *)v4 = 0;
  *((void *)v4 + 1) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for ContainerDetailCollectionTableLayout();
  id v5 = a3;
  objc_super v6 = [(ContainerDetailCollectionTableLayout *)&v8 initWithCoder:v5];

  return v6;
}

@end