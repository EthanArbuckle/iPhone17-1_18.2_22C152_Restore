@interface UITextSelectionRectView
+ (Class)layerClass;
- (BOOL)hasPath;
- (UIColor)selectionBorderColor;
- (UIColor)selectionColor;
- (double)selectionBorderWidth;
- (double)selectionCornerRadius;
- (id)path;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)setPath:(id)a3;
- (void)setSelectionBorderColor:(id)a3;
- (void)setSelectionBorderWidth:(double)a3;
- (void)setSelectionColor:(id)a3;
- (void)setSelectionCornerRadius:(double)a3;
@end

@implementation UITextSelectionRectView

- (BOOL)hasPath
{
  v2 = [(UITextSelectionRectView *)self pathLayer];
  BOOL v3 = [v2 path] != 0;

  return v3;
}

- (void)setPath:(id)a3
{
  id v4 = a3;
  id v8 = [(UITextSelectionRectView *)self pathLayer];
  id v5 = v4;
  uint64_t v6 = [v5 CGPath];

  [v8 setPath:v6];
  if (!v5)
  {
    v7 = [(UITextSelectionRectView *)self selectionColor];
    [(UIView *)self setBackgroundColor:v7];
  }
  [(UITextSelectionRectView *)self setSelectionColor:self->_selectionColor];
  [(UITextSelectionRectView *)self setSelectionBorderColor:self->_selectionBorderColor];
  [(UITextSelectionRectView *)self setSelectionBorderWidth:self->_selectionBorderWidth];
}

- (id)path
{
  v2 = [(UITextSelectionRectView *)self pathLayer];
  uint64_t v3 = [v2 path];

  if (v3)
  {
    id v4 = +[UIBezierPath bezierPathWithCGPath:v3];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)setSelectionColor:(id)a3
{
  id v8 = a3;
  objc_storeStrong((id *)&self->_selectionColor, a3);
  if ([(UITextSelectionRectView *)self hasPath])
  {
    uint64_t v5 = [v8 CGColor];
    uint64_t v6 = [(UITextSelectionRectView *)self pathLayer];
    [v6 setFillColor:v5];

    [(UIView *)self setBackgroundColor:0];
  }
  else
  {
    [(UIView *)self setBackgroundColor:v8];
    v7 = [(UITextSelectionRectView *)self pathLayer];
    [v7 setFillColor:0];
  }
}

- (void)setSelectionCornerRadius:(double)a3
{
  self->_selectionCornerRadius = a3;
  id v4 = [(UIView *)self layer];
  [v4 setCornerRadius:a3];
}

- (void)setSelectionBorderColor:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_selectionBorderColor, a3);
  BOOL v6 = [(UITextSelectionRectView *)self hasPath];
  id v9 = v5;
  uint64_t v7 = [v9 CGColor];
  if (v6)
  {
    id v8 = [(UITextSelectionRectView *)self pathLayer];
    [v8 setStrokeColor:v7];
  }
  else
  {
    id v8 = [(UIView *)self layer];
    [v8 setBorderColor:v7];
  }
}

- (void)setSelectionBorderWidth:(double)a3
{
  self->_selectionBorderWidth = a3;
  if ([(UITextSelectionRectView *)self hasPath])
  {
    id v5 = [(UITextSelectionRectView *)self pathLayer];
    [v5 setLineWidth:a3];
  }
  else
  {
    id v5 = [(UIView *)self layer];
    [v5 setBorderWidth:a3];
  }
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  v9.receiver = self;
  v9.super_class = (Class)UITextSelectionRectView;
  [(UIView *)&v9 _dynamicUserInterfaceTraitDidChange];
  if ([(UITextSelectionRectView *)self hasPath])
  {
    id v3 = [(UITextSelectionRectView *)self selectionColor];
    uint64_t v4 = [v3 CGColor];
    id v5 = [(UITextSelectionRectView *)self pathLayer];
    [v5 setFillColor:v4];

    id v6 = [(UITextSelectionRectView *)self selectionBorderColor];
    uint64_t v7 = [v6 CGColor];
    id v8 = [(UITextSelectionRectView *)self pathLayer];
    [v8 setStrokeColor:v7];
  }
}

- (UIColor)selectionColor
{
  return self->_selectionColor;
}

- (UIColor)selectionBorderColor
{
  return self->_selectionBorderColor;
}

- (double)selectionBorderWidth
{
  return self->_selectionBorderWidth;
}

- (double)selectionCornerRadius
{
  return self->_selectionCornerRadius;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionBorderColor, 0);
  objc_storeStrong((id *)&self->_selectionColor, 0);
}

@end