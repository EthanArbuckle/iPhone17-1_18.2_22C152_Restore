@interface MosaicLayout
+ (Class)layoutAttributesClass;
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (CGSize)collectionViewContentSize;
- (_TtC7Journal12MosaicLayout)init;
- (_TtC7Journal12MosaicLayout)initWithCoder:(id)a3;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (void)prepareLayout;
@end

@implementation MosaicLayout

+ (Class)layoutAttributesClass
{
  type metadata accessor for MosaicLayout();

  return (Class)swift_getObjCClassFromMetadata();
}

- (void)prepareLayout
{
  v2 = self;
  sub_10022DC2C();
}

- (CGSize)collectionViewContentSize
{
  double v2 = *(double *)&self->contentBounds[OBJC_IVAR____TtC7Journal12MosaicLayout_contentBounds];
  double v3 = *(double *)&self->contentBounds[OBJC_IVAR____TtC7Journal12MosaicLayout_contentBounds + 8];
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  if ((*((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC7Journal12MosaicLayout_skipLayoutInvalidation) & 1) == 0)
  {
    CGFloat height = a3.size.height;
    CGFloat width = a3.size.width;
    v5 = self;
    id v6 = [(MosaicLayout *)v5 collectionView];
    if (v6)
    {
      v7 = v6;
      [v6 bounds];
      v10.CGFloat width = width;
      v10.CGFloat height = height;
      BOOL v8 = CGSizeEqualToSize(v10, v11);

      return !v8;
    }
  }
  return 0;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  uint64_t v4 = type metadata accessor for IndexPath();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  BOOL v8 = self;
  v9 = (void *)sub_100230974();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);

  return v9;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v7 = self;
  uint64_t v8 = sub_100230B80(x, y, width, height);

  if (v8)
  {
    sub_100231550();
    v9.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v9.super.isa = 0;
  }

  return v9.super.isa;
}

- (_TtC7Journal12MosaicLayout)init
{
  return (_TtC7Journal12MosaicLayout *)sub_1002312E8();
}

- (_TtC7Journal12MosaicLayout)initWithCoder:(id)a3
{
  return (_TtC7Journal12MosaicLayout *)sub_1002313B8(a3);
}

- (void).cxx_destruct
{
}

@end