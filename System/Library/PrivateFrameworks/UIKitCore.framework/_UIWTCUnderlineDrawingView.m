@interface _UIWTCUnderlineDrawingView
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIBezierPath)path;
- (UIColor)color;
- (void)drawRect:(CGRect)a3;
- (void)setColor:(id)a3;
- (void)setPath:(id)a3;
@end

@implementation _UIWTCUnderlineDrawingView

- (void)drawRect:(CGRect)a3
{
  path = self->_path;
  if (path)
  {
    [(UIBezierPath *)path bounds];
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    ContextStack = GetContextStack(0);
    if (*(int *)ContextStack < 1) {
      v14 = 0;
    }
    else {
      v14 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
    }
    v21.origin.x = v6;
    v21.origin.y = v8;
    v21.size.width = v10;
    v21.size.height = v12;
    CGFloat v15 = -CGRectGetMinX(v21);
    v22.origin.x = v6;
    v22.origin.y = v8;
    v22.size.width = v10;
    v22.size.height = v12;
    CGFloat MinY = CGRectGetMinY(v22);
    CGContextTranslateCTM(v14, v15, -MinY);
    color = self->_color;
    if (color)
    {
      v18 = color;
    }
    else
    {
      v18 = [(UIView *)self tintColor];
    }
    v19 = v18;
    [(UIColor *)v18 set];
    [(UIBezierPath *)self->_path fill];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  if (self->_path)
  {
    [(UIBezierPath *)self->_path bounds];
    double v4 = v3;
    double v6 = v5;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_UIWTCUnderlineDrawingView;
    -[UIView sizeThatFits:](&v7, sel_sizeThatFits_, a3.width, a3.height);
  }
  result.height = v6;
  result.width = v4;
  return result;
}

- (UIBezierPath)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

@end