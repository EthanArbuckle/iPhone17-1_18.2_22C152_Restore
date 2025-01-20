@interface SUReflectionImageModifier
- (CGRect)imageFrameForImage:(id)a3 currentFrame:(CGRect)a4 finalSize:(CGSize)a5;
- (CGSize)finalSizeForSize:(CGSize)a3 originalSize:(CGSize)a4;
- (UIGradient)gradient;
- (double)reflectionHeight;
- (void)dealloc;
- (void)drawAfterImageForContext:(CGContext *)a3 imageFrame:(CGRect)a4 finalSize:(CGSize)a5;
- (void)setGradient:(id)a3;
- (void)setReflectionHeight:(double)a3;
@end

@implementation SUReflectionImageModifier

- (void)dealloc
{
  self->_gradient = 0;
  v3.receiver = self;
  v3.super_class = (Class)SUReflectionImageModifier;
  [(SUReflectionImageModifier *)&v3 dealloc];
}

- (CGSize)finalSizeForSize:(CGSize)a3 originalSize:(CGSize)a4
{
  double height = a4.height;
  CGFloat width = a3.width;
  [(SUReflectionImageModifier *)self reflectionHeight];
  double v7 = height + v6;
  double v8 = width;
  result.double height = v7;
  result.CGFloat width = v8;
  return result;
}

- (CGRect)imageFrameForImage:(id)a3 currentFrame:(CGRect)a4 finalSize:(CGSize)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat x = a4.origin.x;
  [(SUReflectionImageModifier *)self reflectionHeight];
  double v9 = v8;
  double v10 = x;
  double v11 = width;
  double v12 = height;
  result.size.CGFloat height = v12;
  result.size.CGFloat width = v11;
  result.origin.y = v9;
  result.origin.CGFloat x = v10;
  return result;
}

- (void)drawAfterImageForContext:(CGContext *)a3 imageFrame:(CGRect)a4 finalSize:(CGSize)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  CGFloat x = a4.origin.x;
  CGImageRef Image = CGBitmapContextCreateImage(a3);
  if (Image)
  {
    double v11 = Image;
    [(SUReflectionImageModifier *)self reflectionHeight];
    CGFloat v13 = v12;
    CGFloat v14 = height - v12;
    CGContextGetBaseCTM();
    v18.origin.CGFloat x = x;
    v18.origin.y = v14;
    v18.size.double width = width;
    v18.size.double height = v13;
    CGRect v19 = CGRectApplyAffineTransform(v18, &v17);
    CGImageRef v15 = CGImageCreateWithImageInRect(v11, v19);
    if (v15)
    {
      v16 = v15;
      CGContextSaveGState(a3);
      CGContextTranslateCTM(a3, 0.0, v13);
      CGContextScaleCTM(a3, 1.0, -1.0);
      v20.origin.CGFloat x = 0.0;
      v20.origin.y = 0.0;
      v20.size.double width = width;
      v20.size.double height = v13;
      CGContextDrawImage(a3, v20, v16);
      if (self->_gradient)
      {
        CGContextSetCompositeOperation();
        -[UIGradient fillRect:inContext:](self->_gradient, "fillRect:inContext:", a3, 0.0, 0.0, width, v13);
      }
      CGContextRestoreGState(a3);
      CGImageRelease(v16);
    }
    CGImageRelease(v11);
  }
}

- (UIGradient)gradient
{
  return self->_gradient;
}

- (void)setGradient:(id)a3
{
}

- (double)reflectionHeight
{
  return self->_reflectionHeight;
}

- (void)setReflectionHeight:(double)a3
{
  self->_reflectionHeight = a3;
}

@end