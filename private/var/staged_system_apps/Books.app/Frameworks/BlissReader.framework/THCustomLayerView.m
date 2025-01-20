@interface THCustomLayerView
- (CGRect)contentsCenter;
- (CGRect)contentsRect;
- (NSString)contentsGravity;
- (UIColor)borderColor;
- (double)borderWidth;
- (double)contentsScale;
- (id)contents;
- (void)setBackgroundColorFromPatternImage:(id)a3;
- (void)setBorderColor:(id)a3;
- (void)setBorderWidth:(double)a3;
- (void)setContents:(id)a3;
- (void)setContentsCenter:(CGRect)a3;
- (void)setContentsFromImage:(id)a3;
- (void)setContentsGravity:(id)a3;
- (void)setContentsRect:(CGRect)a3;
- (void)setContentsScale:(double)a3;
@end

@implementation THCustomLayerView

- (UIColor)borderColor
{
  id v2 = [self layer].borderColor;

  return +[UIColor colorWithCGColor:v2];
}

- (void)setBorderColor:(id)a3
{
  id v4 = [a3 CGColor];
  id v5 = [(THCustomLayerView *)self layer];

  [v5 setBorderColor:v4];
}

- (double)borderWidth
{
  id v2 = [(THCustomLayerView *)self layer];

  [v2 borderWidth];
  return result;
}

- (void)setBorderWidth:(double)a3
{
  id v4 = [(THCustomLayerView *)self layer];

  [v4 setBorderWidth:a3];
}

- (id)contents
{
  id v2 = [(THCustomLayerView *)self layer];

  return [v2 contents];
}

- (void)setContents:(id)a3
{
  id v4 = [(THCustomLayerView *)self layer];

  [v4 setContents:a3];
}

- (CGRect)contentsRect
{
  id v2 = [(THCustomLayerView *)self layer];

  [v2 contentsRect];
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)setContentsRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v7 = [(THCustomLayerView *)self layer];

  [v7 setContentsRect:x, y, width, height];
}

- (NSString)contentsGravity
{
  id v2 = [(THCustomLayerView *)self layer];

  return (NSString *)[v2 contentsGravity];
}

- (void)setContentsGravity:(id)a3
{
  id v4 = [(THCustomLayerView *)self layer];

  [v4 setContentsGravity:a3];
}

- (double)contentsScale
{
  id v2 = [(THCustomLayerView *)self layer];

  [v2 contentsScale];
  return result;
}

- (void)setContentsScale:(double)a3
{
  id v4 = [(THCustomLayerView *)self layer];

  [v4 setContentsScale:a3];
}

- (CGRect)contentsCenter
{
  id v2 = [(THCustomLayerView *)self layer];

  [v2 contentsCenter];
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (void)setContentsCenter:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v7 = [(THCustomLayerView *)self layer];

  [v7 setContentsCenter:x, y, width, height];
}

- (void)setBackgroundColorFromPatternImage:(id)a3
{
  id v4 = [+[TSUColor colorWithPatternImage:a3] UIColor];

  [(THCustomLayerView *)self setBackgroundColor:v4];
}

- (void)setContentsFromImage:(id)a3
{
  -[THCustomLayerView setContents:](self, "setContents:", [a3 CGImage]);
  [a3 scale];

  -[THCustomLayerView setContentsScale:](self, "setContentsScale:");
}

@end