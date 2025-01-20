@interface ChevronButton
- (UIColor)tintColor;
- (UIView)viewForLastBaselineLayout;
- (_TtC23ShelfKitCollectionViews13ChevronButton)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews13ChevronButton)initWithFrame:(CGRect)a3;
- (void)setTintColor:(id)a3;
@end

@implementation ChevronButton

- (_TtC23ShelfKitCollectionViews13ChevronButton)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews13ChevronButton *)sub_29D210(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (UIColor)tintColor
{
  id v2 = [*(id *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC23ShelfKitCollectionViews13ChevronButton_titleLabel) tintColor];

  return (UIColor *)v2;
}

- (void)setTintColor:(id)a3
{
  v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC23ShelfKitCollectionViews13ChevronButton_imageView);
  id v7 = a3;
  v5 = self;
  [v4 setTintColor:v7];
  id v6 = objc_retain(*(id *)((char *)&v5->super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews13ChevronButton_titleLabel));
  [v6 setTextColor:v7];
}

- (_TtC23ShelfKitCollectionViews13ChevronButton)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_29D968();
}

- (UIView)viewForLastBaselineLayout
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                           + OBJC_IVAR____TtC23ShelfKitCollectionViews13ChevronButton_titleLabel));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews13ChevronButton_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews13ChevronButton_stackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews13ChevronButton_imageView));
  swift_bridgeObjectRelease();

  swift_release();
}

@end