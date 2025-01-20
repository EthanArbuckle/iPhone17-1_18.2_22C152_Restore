@interface _TVMonogramDecorator
- (BOOL)needsAlphaForImage:(id)a3;
- (UIColor)borderColor;
- (double)borderWidth;
- (id)decoratorIdentifier;
- (void)drawInContext:(id)a3 imageRect:(CGRect)a4;
- (void)setBorderColor:(id)a3;
- (void)setBorderWidth:(double)a3;
@end

@implementation _TVMonogramDecorator

- (id)decoratorIdentifier
{
  v5.receiver = self;
  v5.super_class = (Class)_TVMonogramDecorator;
  v2 = [(TVImageScaleDecorator *)&v5 decoratorIdentifier];
  v3 = [v2 stringByAppendingString:@"_mono"];

  return v3;
}

- (BOOL)needsAlphaForImage:(id)a3
{
  return 1;
}

- (void)drawInContext:(id)a3 imageRect:(CGRect)a4
{
  id v5 = a3;
  id v15 = [v5 currentImage];
  [v15 size];
  double v7 = v6;
  [v15 size];
  double v9 = v8;
  v10 = objc_msgSend(MEMORY[0x263F1C478], "bezierPathWithOvalInRect:", 0.0, 0.0, v7, v8);
  v11 = (CGContext *)[v5 CGContext];

  CGContextSetBlendMode(v11, kCGBlendModeCopy);
  v12 = [MEMORY[0x263F1C550] clearColor];
  [v12 setFill];

  v17.origin.x = 0.0;
  v17.origin.y = 0.0;
  v17.size.width = v7;
  v17.size.height = v9;
  UIRectFill(v17);
  v13 = [MEMORY[0x263F1C550] blackColor];
  [v13 setFill];

  [v10 fill];
  objc_msgSend(v15, "drawInRect:blendMode:alpha:", 18, 0.0, 0.0, v7, v9, 1.0);
  borderColor = self->_borderColor;
  if (borderColor && self->_borderWidth > 0.0)
  {
    [(UIColor *)borderColor setStroke];
    [v10 setLineWidth:self->_borderWidth];
    [v10 stroke];
  }
}

- (UIColor)borderColor
{
  return self->_borderColor;
}

- (void)setBorderColor:(id)a3
{
}

- (double)borderWidth
{
  return self->_borderWidth;
}

- (void)setBorderWidth:(double)a3
{
  self->_borderWidth = a3;
}

- (void).cxx_destruct
{
}

@end