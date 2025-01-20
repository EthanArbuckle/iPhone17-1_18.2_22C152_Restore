@interface SUUIProductPageSegmentedControl
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation SUUIProductPageSegmentedControl

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if ([(SUUIProductPageSegmentedControl *)self isEnabled]
    && ![(SUUIProductPageSegmentedControl *)self isHidden])
  {
    [(SUUIProductPageSegmentedControl *)self bounds];
    v19.origin.double x = v9 + -10.0;
    v19.origin.double y = v10 + -10.0;
    v19.size.width = v11 + 20.0;
    v19.size.height = v12 + 20.0;
    v18.double x = x;
    v18.double y = y;
    if (CGRectContainsPoint(v19, v18)) {
      v13 = self;
    }
    else {
      v13 = 0;
    }
    v8 = v13;
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)SUUIProductPageSegmentedControl;
    -[SUUIProductPageSegmentedControl hitTest:withEvent:](&v16, sel_hitTest_withEvent_, v7, x, y);
    v8 = (SUUIProductPageSegmentedControl *)objc_claimAutoreleasedReturnValue();
  }
  v14 = v8;

  return v14;
}

@end