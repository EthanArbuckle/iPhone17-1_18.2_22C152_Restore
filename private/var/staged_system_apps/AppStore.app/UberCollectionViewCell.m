@interface UberCollectionViewCell
- (_TtC8AppStore22UberCollectionViewCell)initWithCoder:(id)a3;
- (_TtC8AppStore22UberCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)applyLayoutAttributes:(id)a3;
- (void)layoutSubviews;
@end

@implementation UberCollectionViewCell

- (_TtC8AppStore22UberCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  v9 = (char *)self + OBJC_IVAR____TtC8AppStore22UberCollectionViewCell_itemLayoutContext;
  uint64_t v10 = type metadata accessor for ItemLayoutContext();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 1, 1, v10);
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC8AppStore22UberCollectionViewCell_uberView) = 0;
  v18.receiver = self;
  v18.super_class = ObjectType;
  v11 = -[UberCollectionViewCell initWithFrame:](&v18, "initWithFrame:", x, y, width, height);
  double left = UIEdgeInsetsZero.left;
  double bottom = UIEdgeInsetsZero.bottom;
  double right = UIEdgeInsetsZero.right;
  v15 = v11;
  -[UberCollectionViewCell setLayoutMargins:](v15, "setLayoutMargins:", UIEdgeInsetsZero.top, left, bottom, right);
  id v16 = [(UberCollectionViewCell *)v15 contentView];
  [v16 setLayoutMargins:UIEdgeInsetsZero.top, left, bottom, right];

  return v15;
}

- (_TtC8AppStore22UberCollectionViewCell)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC8AppStore22UberCollectionViewCell_itemLayoutContext;
  uint64_t v6 = type metadata accessor for ItemLayoutContext();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC8AppStore22UberCollectionViewCell_uberView) = 0;
  id v7 = a3;

  result = (_TtC8AppStore22UberCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100611250();
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100611378((uint64_t)v4);
}

- (void).cxx_destruct
{
  sub_1000A1D30((uint64_t)self + OBJC_IVAR____TtC8AppStore22UberCollectionViewCell_itemLayoutContext);
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC8AppStore22UberCollectionViewCell_uberView);
}

@end