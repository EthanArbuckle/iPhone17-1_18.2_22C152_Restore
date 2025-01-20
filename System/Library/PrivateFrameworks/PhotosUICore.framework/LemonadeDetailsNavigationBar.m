@interface LemonadeDetailsNavigationBar
- (_TtC12PhotosUICoreP33_5A77AA35E7CED42F2D112515D5FBA02128LemonadeDetailsNavigationBar)initWithCoder:(id)a3;
- (_TtC12PhotosUICoreP33_5A77AA35E7CED42F2D112515D5FBA02128LemonadeDetailsNavigationBar)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation LemonadeDetailsNavigationBar

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v8 = a4;
  v9 = self;
  v10 = (void *)sub_1AA4100A4(a4, x, y);

  return v10;
}

- (_TtC12PhotosUICoreP33_5A77AA35E7CED42F2D112515D5FBA02128LemonadeDetailsNavigationBar)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for LemonadeDetailsNavigationBar();
  return -[LemonadeDetailsNavigationBar initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC12PhotosUICoreP33_5A77AA35E7CED42F2D112515D5FBA02128LemonadeDetailsNavigationBar)initWithCoder:(id)a3
{
  return (_TtC12PhotosUICoreP33_5A77AA35E7CED42F2D112515D5FBA02128LemonadeDetailsNavigationBar *)sub_1AA4103A0(self, (uint64_t)a2, (uint64_t)a3, type metadata accessor for LemonadeDetailsNavigationBar);
}

@end