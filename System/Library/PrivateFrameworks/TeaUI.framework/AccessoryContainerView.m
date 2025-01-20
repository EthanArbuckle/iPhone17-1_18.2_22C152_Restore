@interface AccessoryContainerView
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (_TtC5TeaUI22AccessoryContainerView)initWithCoder:(id)a3;
- (_TtC5TeaUI22AccessoryContainerView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation AccessoryContainerView

- (_TtC5TeaUI22AccessoryContainerView)initWithCoder:(id)a3
{
  id v3 = a3;
  AccessoryContainerView.init(coder:)();
}

- (void)layoutSubviews
{
  v2 = self;
  AccessoryContainerView.layoutSubviews()();
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v7 = a4;
  v10.value.super.Class isa = (Class)self;
  Class isa = v10.value.super.isa;
  LOBYTE(self) = AccessoryContainerView.point(inside:with:)((CGPoint)__PAIR128__(*(unint64_t *)&y, *(unint64_t *)&x), v10);

  return self & 1;
}

- (_TtC5TeaUI22AccessoryContainerView)initWithFrame:(CGRect)a3
{
}

@end