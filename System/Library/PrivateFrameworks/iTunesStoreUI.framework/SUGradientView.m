@interface SUGradientView
- (SUGradient)gradient;
- (void)dealloc;
- (void)drawRect:(CGRect)a3;
- (void)setGradient:(id)a3;
@end

@implementation SUGradientView

- (void)dealloc
{
  cgGradient = self->_cgGradient;
  if (cgGradient) {
    CGGradientRelease(cgGradient);
  }

  v4.receiver = self;
  v4.super_class = (Class)SUGradientView;
  [(SUGradientView *)&v4 dealloc];
}

- (void)setGradient:(id)a3
{
  if (self->_gradient == a3) {
    return;
  }
  if (a3)
  {
    v5 = (void *)[a3 colorStopColors];
    if ([v5 count] != 1)
    {
      v8 = (CGGradient *)[a3 copyCGGradient];
      uint64_t v7 = [MEMORY[0x263F1C550] blackColor];
      goto LABEL_9;
    }
    uint64_t v6 = objc_msgSend(MEMORY[0x263F1C550], "colorWithCGColor:", objc_msgSend(v5, "objectAtIndex:", 0));
  }
  else
  {
    uint64_t v6 = [MEMORY[0x263F1C550] blackColor];
  }
  uint64_t v7 = v6;
  v8 = 0;
LABEL_9:
  [(SUGradientView *)self setBackgroundColor:v7];
  cgGradient = self->_cgGradient;
  if (cgGradient) {
    CGGradientRelease(cgGradient);
  }
  self->_cgGradient = v8;

  self->_gradient = (SUGradient *)[a3 copy];

  [(SUGradientView *)self setNeedsDisplay];
}

- (void)drawRect:(CGRect)a3
{
  if (self->_cgGradient)
  {
    [(SUGradientView *)self bounds];
    CGFloat v5 = v4;
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    [(SUGradient *)self->_gradient p0];
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    [(SUGradient *)self->_gradient p1];
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextSaveGState(CurrentContext);
    CGContextTranslateCTM(CurrentContext, v5, v7);
    CGContextScaleCTM(CurrentContext, v9, v11);
    v22.x = v13;
    v22.y = v15;
    v23.x = v17;
    v23.y = v19;
    CGContextDrawLinearGradient(CurrentContext, self->_cgGradient, v22, v23, 3u);
    CGContextRestoreGState(CurrentContext);
  }
}

- (SUGradient)gradient
{
  return self->_gradient;
}

@end