@interface BlurIconButton
- (BOOL)accessibilityActivate;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC23ShelfKitCollectionViews14BlurIconButton)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews14BlurIconButton)initWithFrame:(CGRect)a3;
- (void)layoutMarginsDidChange;
- (void)layoutSubviews;
@end

@implementation BlurIconButton

- (_TtC23ShelfKitCollectionViews14BlurIconButton)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_EC364();
}

- (_TtC23ShelfKitCollectionViews14BlurIconButton)initWithFrame:(CGRect)a3
{
}

- (void)layoutMarginsDidChange
{
}

- (void)layoutSubviews
{
  v2 = self;
  sub_E4EA8();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v3 = self;
  sub_E5124();
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  uint64_t v4 = (uint64_t)a4;
  double y = a3.y;
  double x = a3.x;
  id v8 = a4;
  double v9 = self;
  LOBYTE(v4) = sub_E5268(v4, x, y);

  return v4 & 1;
}

- (BOOL)accessibilityActivate
{
  v2 = *(void (**)(_TtC23ShelfKitCollectionViews14BlurIconButton *))((char *)&self->super.super.super.isa
                                                                              + OBJC_IVAR____TtC23ShelfKitCollectionViews14BlurIconButton_handler);
  if (v2)
  {
    id v3 = self;
    sub_3C800((uint64_t)v2);
    v2(v3);
    sub_27760((uint64_t)v2);
  }
  return 1;
}

- (void).cxx_destruct
{
  sub_27760(*(uint64_t *)((char *)&self->super.super.super.isa
                       + OBJC_IVAR____TtC23ShelfKitCollectionViews14BlurIconButton_handler));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews14BlurIconButton_image));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews14BlurIconButton_background));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews14BlurIconButton_blurView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews14BlurIconButton_imageView));

  swift_release();
}

@end