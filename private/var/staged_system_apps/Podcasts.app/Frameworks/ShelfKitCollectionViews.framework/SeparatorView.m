@interface SeparatorView
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC23ShelfKitCollectionViews13SeparatorView)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews13SeparatorView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation SeparatorView

- (_TtC23ShelfKitCollectionViews13SeparatorView)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews13SeparatorView *)sub_35ACD4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC23ShelfKitCollectionViews13SeparatorView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC23ShelfKitCollectionViews13SeparatorView_lineColor;
  v6 = self;
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)[v6 separatorColor];

  result = (_TtC23ShelfKitCollectionViews13SeparatorView *)sub_385890();
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  v4 = self;
  id v5 = [(SeparatorView *)v4 traitCollection];
  sub_37D0C0();
  double v7 = v6;

  double v8 = width;
  double v9 = v7;
  result.height = v9;
  result.CGFloat width = v8;
  return result;
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  id v3 = [(SeparatorView *)v2 traitCollection];
  sub_37D0C0();
  double v5 = v4;

  double v6 = UIViewNoIntrinsicMetric;
  double v7 = v5;
  result.height = v7;
  result.CGFloat width = v6;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_35AFE4();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews13SeparatorView_lineView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC23ShelfKitCollectionViews13SeparatorView_lineColor);
}

@end