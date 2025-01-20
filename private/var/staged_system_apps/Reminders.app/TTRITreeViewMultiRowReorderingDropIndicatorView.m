@interface TTRITreeViewMultiRowReorderingDropIndicatorView
- (_TtC9Reminders47TTRITreeViewMultiRowReorderingDropIndicatorView)initWithCoder:(id)a3;
- (_TtC9Reminders47TTRITreeViewMultiRowReorderingDropIndicatorView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation TTRITreeViewMultiRowReorderingDropIndicatorView

- (_TtC9Reminders47TTRITreeViewMultiRowReorderingDropIndicatorView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  v9 = (char *)self + OBJC_IVAR____TtC9Reminders47TTRITreeViewMultiRowReorderingDropIndicatorView_shadowPathSize;
  *(void *)v9 = 0;
  *((void *)v9 + 1) = 0;
  v9[16] = 1;
  v12.receiver = self;
  v12.super_class = ObjectType;
  v10 = -[TTRITreeViewMultiRowReorderingDropIndicatorView initWithFrame:](&v12, "initWithFrame:", x, y, width, height);
  sub_100335968();

  return v10;
}

- (_TtC9Reminders47TTRITreeViewMultiRowReorderingDropIndicatorView)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  v6 = (char *)self + OBJC_IVAR____TtC9Reminders47TTRITreeViewMultiRowReorderingDropIndicatorView_shadowPathSize;
  *(void *)v6 = 0;
  *((void *)v6 + 1) = 0;
  v6[16] = 1;
  v12.receiver = self;
  v12.super_class = ObjectType;
  id v7 = a3;
  v8 = [(TTRITreeViewMultiRowReorderingDropIndicatorView *)&v12 initWithCoder:v7];
  v9 = v8;
  if (v8)
  {
    v10 = v8;
    sub_100335968();
  }
  return v9;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100335D50();
}

@end