@interface TUForwardingTouchNavigationBar
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (NSArray)accessibilityElements;
- (TUForwardingTouchNavigationBar)initWithCoder:(id)a3;
- (TUForwardingTouchNavigationBar)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)setAccessibilityElements:(id)a3;
@end

@implementation TUForwardingTouchNavigationBar

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v8 = a4;
  v9 = self;
  v15.value.super.isa = (Class)a4;
  ForwardingTouchNavigationBar.hitTest(_:with:)(v10, (CGPoint)__PAIR128__(*(unint64_t *)&y, *(unint64_t *)&x), v15);
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
  LOBYTE(v4) = ForwardingTouchNavigationBar.point(inside:with:)((CGPoint)__PAIR128__(*(unint64_t *)&y, *(unint64_t *)&x), v11);

  return v4 & 1;
}

- (NSArray)accessibilityElements
{
  v2 = self;
  uint64_t v3 = ForwardingTouchNavigationBar.accessibilityElements.getter();

  if (v3)
  {
    v4 = (void *)sub_1B61B24D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return (NSArray *)v4;
}

- (void)setAccessibilityElements:(id)a3
{
  if (a3) {
    uint64_t v4 = sub_1B61B24E0();
  }
  else {
    uint64_t v4 = 0;
  }
  v5 = self;
  ForwardingTouchNavigationBar.accessibilityElements.setter(v4);
}

- (TUForwardingTouchNavigationBar)initWithFrame:(CGRect)a3
{
  return (TUForwardingTouchNavigationBar *)ForwardingTouchNavigationBar.init(frame:)();
}

- (TUForwardingTouchNavigationBar)initWithCoder:(id)a3
{
  return (TUForwardingTouchNavigationBar *)ForwardingTouchNavigationBar.init(coder:)(a3);
}

@end