@interface TUForwardingTouchToolbar
- (BOOL)accessibilityElementsHidden;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (TUForwardingTouchToolbar)initWithCoder:(id)a3;
- (TUForwardingTouchToolbar)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (int64_t)accessibilityContainerType;
@end

@implementation TUForwardingTouchToolbar

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v8 = a4;
  v9 = self;
  v15.value.super.isa = (Class)a4;
  ForwardingTouchToolbar.hitTest(_:with:)(v10, (CGPoint)__PAIR128__(*(unint64_t *)&y, *(unint64_t *)&x), v15);
  v12 = v11;

  return v12;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  v4 = (objc_class *)a4;
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v8 = a4;
  v9 = self;
  v11.value.super.isa = v4;
  LOBYTE(v4) = ForwardingTouchToolbar.point(inside:with:)((CGPoint)__PAIR128__(*(unint64_t *)&y, *(unint64_t *)&x), v11);

  return v4 & 1;
}

- (int64_t)accessibilityContainerType
{
  v2 = self;
  int64_t v3 = ForwardingTouchToolbar.accessibilityContainerType.getter();

  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v5 = self;
  CGSize v6 = ForwardingTouchToolbar.sizeThatFits(_:)((CGSize)__PAIR128__(*(unint64_t *)&height, *(unint64_t *)&width));

  double v7 = v6.width;
  double v8 = v6.height;
  result.CGFloat height = v8;
  result.CGFloat width = v7;
  return result;
}

- (BOOL)accessibilityElementsHidden
{
  v2 = self;
  char v3 = ForwardingTouchToolbar.accessibilityElementsHidden.getter();

  return v3 & 1;
}

- (TUForwardingTouchToolbar)initWithFrame:(CGRect)a3
{
  return (TUForwardingTouchToolbar *)ForwardingTouchToolbar.init(frame:)();
}

- (TUForwardingTouchToolbar)initWithCoder:(id)a3
{
  return (TUForwardingTouchToolbar *)ForwardingTouchToolbar.init(coder:)(a3);
}

@end