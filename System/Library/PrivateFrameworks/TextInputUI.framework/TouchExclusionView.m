@interface TouchExclusionView
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (TouchExclusionView)initWithFrame:(CGRect)a3 excludingView:(id)a4;
@end

@implementation TouchExclusionView

- (void).cxx_destruct
{
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  -[UIView convertPoint:fromView:](self->_excludingView, "convertPoint:fromView:", self, x, y);
  if (-[UIView pointInside:withEvent:](self->_excludingView, "pointInside:withEvent:", v7))
  {
    BOOL v8 = 0;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)TouchExclusionView;
    BOOL v8 = -[TouchExclusionView pointInside:withEvent:](&v10, sel_pointInside_withEvent_, v7, x, y);
  }

  return v8;
}

- (TouchExclusionView)initWithFrame:(CGRect)a3 excludingView:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TouchExclusionView;
  v11 = -[TouchExclusionView initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  v12 = v11;
  if (v11) {
    objc_storeStrong((id *)&v11->_excludingView, a4);
  }

  return v12;
}

@end