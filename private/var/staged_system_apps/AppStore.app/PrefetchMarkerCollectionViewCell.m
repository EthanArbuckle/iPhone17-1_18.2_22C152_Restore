@interface PrefetchMarkerCollectionViewCell
- (_TtC8AppStore32PrefetchMarkerCollectionViewCell)initWithCoder:(id)a3;
- (_TtC8AppStore32PrefetchMarkerCollectionViewCell)initWithFrame:(CGRect)a3;
@end

@implementation PrefetchMarkerCollectionViewCell

- (_TtC8AppStore32PrefetchMarkerCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  v9 = (char *)self + OBJC_IVAR____TtC8AppStore32PrefetchMarkerCollectionViewCell_itemLayoutContext;
  uint64_t v10 = type metadata accessor for ItemLayoutContext();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 1, 1, v10);
  v14.receiver = self;
  v14.super_class = ObjectType;
  v11 = -[PrefetchMarkerCollectionViewCell initWithFrame:](&v14, "initWithFrame:", x, y, width, height);
  id v12 = [(PrefetchMarkerCollectionViewCell *)v11 contentView];
  [v12 setLayoutMargins:UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right];

  return v11;
}

- (_TtC8AppStore32PrefetchMarkerCollectionViewCell)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC8AppStore32PrefetchMarkerCollectionViewCell_itemLayoutContext;
  uint64_t v6 = type metadata accessor for ItemLayoutContext();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  id v7 = a3;

  result = (_TtC8AppStore32PrefetchMarkerCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end