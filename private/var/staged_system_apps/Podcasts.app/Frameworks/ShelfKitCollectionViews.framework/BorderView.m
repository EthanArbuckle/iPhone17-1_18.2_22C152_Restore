@interface BorderView
- (BOOL)clipsToBounds;
- (UIColor)backgroundColor;
- (_TtC23ShelfKitCollectionViews10BorderView)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews10BorderView)initWithFrame:(CGRect)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setClipsToBounds:(BOOL)a3;
@end

@implementation BorderView

- (_TtC23ShelfKitCollectionViews10BorderView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews10BorderView_roundedCorners) = (Class)-1;
  v11.receiver = self;
  v11.super_class = ObjectType;
  v9 = -[BorderView initWithFrame:](&v11, "initWithFrame:", x, y, width, height);
  [(BorderView *)v9 setUserInteractionEnabled:0];
  return v9;
}

- (_TtC23ShelfKitCollectionViews10BorderView)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews10BorderView_roundedCorners) = (Class)-1;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return [(BorderView *)&v7 initWithCoder:a3];
}

- (UIColor)backgroundColor
{
  id v2 = [self clearColor];

  return (UIColor *)v2;
}

- (void)setBackgroundColor:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_292398(a3);
}

- (BOOL)clipsToBounds
{
  return 0;
}

- (void)setClipsToBounds:(BOOL)a3
{
  v3 = self;
  sub_2924CC();
}

@end