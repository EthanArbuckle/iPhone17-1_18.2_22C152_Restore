@interface SUUISegmentedControl
- (CGRect)frameForSegmentAtIndex:(int64_t)a3;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation SUUISegmentedControl

- (CGRect)frameForSegmentAtIndex:(int64_t)a3
{
  [(SUUISegmentedControl *)self frame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = v7 / (double)(unint64_t)[(SUUISegmentedControl *)self numberOfSegments] * (double)a3;
  double v12 = v8 / (double)(unint64_t)[(SUUISegmentedControl *)self numberOfSegments];
  double v13 = v11;
  double v14 = v6;
  double v15 = v10;
  result.size.height = v15;
  result.size.width = v12;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)SUUISegmentedControl;
  [(SUUISegmentedControl *)&v5 touchesEnded:a3 withEvent:a4];
  [(SUUISegmentedControl *)self sendActionsForControlEvents:4096];
}

@end