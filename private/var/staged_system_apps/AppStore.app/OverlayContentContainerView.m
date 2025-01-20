@interface OverlayContentContainerView
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (_TtC8AppStoreP33_70CD356DF530ECB31A952A5D7D866F1927OverlayContentContainerView)initWithCoder:(id)a3;
- (_TtC8AppStoreP33_70CD356DF530ECB31A952A5D7D866F1927OverlayContentContainerView)initWithFrame:(CGRect)a3;
@end

@implementation OverlayContentContainerView

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  uint64_t v4 = (uint64_t)a4;
  double y = a3.y;
  double x = a3.x;
  id v8 = a4;
  v9 = self;
  LOBYTE(v4) = sub_100397D90(v4, x, y);

  return v4 & 1;
}

- (_TtC8AppStoreP33_70CD356DF530ECB31A952A5D7D866F1927OverlayContentContainerView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  return -[OverlayContentContainerView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC8AppStoreP33_70CD356DF530ECB31A952A5D7D866F1927OverlayContentContainerView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(OverlayContentContainerView *)&v5 initWithCoder:a3];
}

@end