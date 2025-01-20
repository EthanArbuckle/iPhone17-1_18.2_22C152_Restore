@interface DisclosureView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC23ShelfKitCollectionViewsP33_3A8437458FA0C4629A859D072288700F14DisclosureView)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViewsP33_3A8437458FA0C4629A859D072288700F14DisclosureView)initWithFrame:(CGRect)a3;
- (double)firstBaselineFromTop;
- (void)layoutSubviews;
@end

@implementation DisclosureView

- (_TtC23ShelfKitCollectionViewsP33_3A8437458FA0C4629A859D072288700F14DisclosureView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_29499C();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_293DD0();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = self;
  double v6 = sub_2940E0(width, height);
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (double)firstBaselineFromTop
{
  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_3A8437458FA0C4629A859D072288700F14DisclosureView_accessoryTextLabel);
  id v3 = self;
  [v2 firstBaselineFromTop];
  double v5 = v4;
  [v2 origin];
  double v7 = v6;

  return v5 + v7;
}

- (_TtC23ShelfKitCollectionViewsP33_3A8437458FA0C4629A859D072288700F14DisclosureView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC23ShelfKitCollectionViewsP33_3A8437458FA0C4629A859D072288700F14DisclosureView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_3A8437458FA0C4629A859D072288700F14DisclosureView_accessoryTextLabel));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_3A8437458FA0C4629A859D072288700F14DisclosureView_imageView);
}

@end