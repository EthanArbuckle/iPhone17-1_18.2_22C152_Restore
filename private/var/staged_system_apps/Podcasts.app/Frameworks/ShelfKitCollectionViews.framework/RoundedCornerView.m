@interface RoundedCornerView
- (_TtC23ShelfKitCollectionViews17RoundedCornerView)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews17RoundedCornerView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation RoundedCornerView

- (_TtC23ShelfKitCollectionViews17RoundedCornerView)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews17RoundedCornerView *)sub_D3B60(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC23ShelfKitCollectionViews17RoundedCornerView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_D4010();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_D3CBC();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews17RoundedCornerView_borderView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC23ShelfKitCollectionViews17RoundedCornerView_borderColor);
}

@end