@interface TSWPDropCapBackgroundAdornment
- (BOOL)isBackground;
- (TSWPDropCapBackgroundAdornment)initWithColor:(id)a3 bounds:(CGRect)a4;
- (void)dealloc;
- (void)drawAdornmentForFragment:(const void *)a3 inContext:(CGContext *)a4 withFlags:(unsigned int)a5 state:(const void *)a6 bounds:(CGRect)a7;
@end

@implementation TSWPDropCapBackgroundAdornment

- (TSWPDropCapBackgroundAdornment)initWithColor:(id)a3 bounds:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  v11.receiver = self;
  v11.super_class = (Class)TSWPDropCapBackgroundAdornment;
  v9 = [(TSWPDropCapBackgroundAdornment *)&v11 init];
  if (v9)
  {
    v9->_color = (TSUColor *)[a3 copy];
    v9->_bounds.origin.CGFloat x = x;
    v9->_bounds.origin.CGFloat y = y;
    v9->_bounds.size.CGFloat width = width;
    v9->_bounds.size.CGFloat height = height;
  }
  return v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSWPDropCapBackgroundAdornment;
  [(TSWPDropCapBackgroundAdornment *)&v3 dealloc];
}

- (BOOL)isBackground
{
  return 1;
}

- (void)drawAdornmentForFragment:(const void *)a3 inContext:(CGContext *)a4 withFlags:(unsigned int)a5 state:(const void *)a6 bounds:(CGRect)a7
{
  CGFloat y = a7.origin.y;
  CGFloat x = a7.origin.x;
  CGContextSetFillColorWithColor(a4, (CGColorRef)[(TSUColor *)self->_color CGColor]);
  CGRect v12 = CGRectOffset(self->_bounds, x, y);

  CGContextFillRect(a4, v12);
}

@end