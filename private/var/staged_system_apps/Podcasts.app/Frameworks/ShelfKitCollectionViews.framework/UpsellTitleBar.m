@interface UpsellTitleBar
- (CGSize)intrinsicContentSize;
- (_TtC23ShelfKitCollectionViews14UpsellTitleBar)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews14UpsellTitleBar)initWithFrame:(CGRect)a3;
@end

@implementation UpsellTitleBar

- (_TtC23ShelfKitCollectionViews14UpsellTitleBar)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews14UpsellTitleBar *)sub_16BADC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC23ShelfKitCollectionViews14UpsellTitleBar)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_16C150();
}

- (CGSize)intrinsicContentSize
{
  double v2 = 38.0;
  if (!*((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews14UpsellTitleBar_style)) {
    double v2 = 54.0;
  }
  double v3 = UIViewNoIntrinsicMetric;
  result.height = v2;
  result.width = v3;
  return result;
}

- (void).cxx_destruct
{
  sub_27760(*(uint64_t *)((char *)&self->super.super.super.isa
                       + OBJC_IVAR____TtC23ShelfKitCollectionViews14UpsellTitleBar_dismissHandler));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews14UpsellTitleBar____lazy_storage___closeButton));
  double v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC23ShelfKitCollectionViews14UpsellTitleBar_containerStackView);
}

@end