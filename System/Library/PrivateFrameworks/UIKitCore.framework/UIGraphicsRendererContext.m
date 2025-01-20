@interface UIGraphicsRendererContext
- (BOOL)__createsImages;
- (CGContextRef)CGContext;
- (UIGraphicsRendererContext)initWithCGContext:(CGContext *)a3 format:(id)a4;
- (UIGraphicsRendererFormat)format;
- (void)clipToRect:(CGRect)rect;
- (void)dealloc;
- (void)fillRect:(CGRect)rect;
- (void)fillRect:(CGRect)rect blendMode:(CGBlendMode)blendMode;
- (void)set__createsImages:(BOOL)a3;
- (void)strokeRect:(CGRect)rect;
- (void)strokeRect:(CGRect)rect blendMode:(CGBlendMode)blendMode;
@end

@implementation UIGraphicsRendererContext

- (void).cxx_destruct
{
}

- (void)dealloc
{
  CGContextRelease(self->_backingContext);
  v3.receiver = self;
  v3.super_class = (Class)UIGraphicsRendererContext;
  [(UIGraphicsRendererContext *)&v3 dealloc];
}

- (void)set__createsImages:(BOOL)a3
{
  self->___createsImages = a3;
}

- (UIGraphicsRendererContext)initWithCGContext:(CGContext *)a3 format:(id)a4
{
  id v6 = a4;
  v7 = [(UIGraphicsRendererContext *)self init];
  if (v7)
  {
    v7->_backingContext = CGContextRetain(a3);
    uint64_t v8 = [v6 copy];
    format = v7->_format;
    v7->_format = (UIGraphicsRendererFormat *)v8;
  }
  return v7;
}

- (UIGraphicsRendererFormat)format
{
  return self->_format;
}

- (CGContextRef)CGContext
{
  return self->_backingContext;
}

- (void)fillRect:(CGRect)rect
{
}

- (void)fillRect:(CGRect)rect blendMode:(CGBlendMode)blendMode
{
  CGFloat height = rect.size.height;
  CGFloat width = rect.size.width;
  CGFloat y = rect.origin.y;
  CGFloat x = rect.origin.x;
  v9 = [(UIGraphicsRendererContext *)self CGContext];
  CGBlendMode v10 = CGContextGetBlendMode();
  if (v10 == blendMode)
  {
    CGFloat v11 = x;
    CGFloat v12 = y;
    CGFloat v13 = width;
    CGFloat v14 = height;
    CGContextFillRect(v9, *(CGRect *)&v11);
  }
  else
  {
    CGBlendMode v15 = v10;
    CGContextSetBlendMode(v9, blendMode);
    v17.origin.CGFloat x = x;
    v17.origin.CGFloat y = y;
    v17.size.CGFloat width = width;
    v17.size.CGFloat height = height;
    CGContextFillRect(v9, v17);
    CGContextSetBlendMode(v9, v15);
  }
}

- (void)strokeRect:(CGRect)rect
{
}

- (void)strokeRect:(CGRect)rect blendMode:(CGBlendMode)blendMode
{
  CGFloat height = rect.size.height;
  CGFloat width = rect.size.width;
  CGFloat y = rect.origin.y;
  CGFloat x = rect.origin.x;
  v9 = [(UIGraphicsRendererContext *)self CGContext];
  CGBlendMode v10 = CGContextGetBlendMode();
  CGContextGetLineWidth();
  double v12 = v11;
  if (v10 != blendMode) {
    CGContextSetBlendMode(v9, blendMode);
  }
  v14.origin.CGFloat x = x;
  v14.origin.CGFloat y = y;
  v14.size.CGFloat width = width;
  v14.size.CGFloat height = height;
  CGRect v15 = CGRectInset(v14, v12 * 0.5, v12 * 0.5);
  CGContextStrokeRect(v9, v15);
  if (v10 != blendMode) {
    CGContextSetBlendMode(v9, v10);
  }
  CGContextSetLineWidth(v9, v12);
}

- (void)clipToRect:(CGRect)rect
{
  if (rect.size.width >= 0.0)
  {
    CGFloat height = rect.size.height;
    if (rect.size.height >= 0.0)
    {
      CGFloat width = rect.size.width;
      CGFloat y = rect.origin.y;
      CGFloat x = rect.origin.x;
      v7 = [(UIGraphicsRendererContext *)self CGContext];
      CGFloat v8 = x;
      CGFloat v9 = y;
      CGFloat v10 = width;
      CGFloat v11 = height;
      CGContextClipToRect(v7, *(CGRect *)&v8);
    }
  }
}

- (BOOL)__createsImages
{
  return self->___createsImages;
}

@end