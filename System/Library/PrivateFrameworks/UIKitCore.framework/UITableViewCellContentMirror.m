@interface UITableViewCellContentMirror
- (BOOL)isSelected;
- (UITableViewCellContentMirror)initWithFrame:(CGRect)a3;
- (id)cell;
- (void)drawRect:(CGRect)a3;
- (void)setSelected:(BOOL)a3;
@end

@implementation UITableViewCellContentMirror

- (void)setSelected:(BOOL)a3
{
  *((unsigned char *)self + 408) = *((unsigned char *)self + 408) & 0xFE | a3;
  [(UIView *)self setNeedsDisplay];
}

- (BOOL)isSelected
{
  return *((unsigned char *)self + 408) & 1;
}

- (UITableViewCellContentMirror)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)UITableViewCellContentMirror;
  v3 = -[UIView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(UIView *)v3 setAutoresizingMask:18];
    v5 = +[UIColor clearColor];
    [(UIView *)v4 setBackgroundColor:v5];

    [(UIView *)v4 setNeedsDisplayOnBoundsChange:1];
  }
  return v4;
}

- (id)cell
{
  v3 = [(UIView *)self superview];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [(UIView *)self superview];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)drawRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = [(UITableViewCellContentMirror *)self cell];
  objc_msgSend(v8, "_drawContentInRect:selected:", *((unsigned char *)self + 408) & 1, x, y, width, height);
}

@end