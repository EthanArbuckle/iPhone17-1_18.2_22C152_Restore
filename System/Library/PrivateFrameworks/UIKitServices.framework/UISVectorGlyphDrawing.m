@interface UISVectorGlyphDrawing
- (CGRect)alignmentRect;
- (CGSize)drawingSize;
- (UISVectorGlyphDrawing)initWithVectorGlyph:(id)a3 tintColor:(CGColor *)a4;
- (void)dealloc;
- (void)drawInContext:(CGContext *)a3 atPoint:(CGPoint)a4;
@end

@implementation UISVectorGlyphDrawing

- (UISVectorGlyphDrawing)initWithVectorGlyph:(id)a3 tintColor:(CGColor *)a4
{
  id v6 = a3;
  v24.receiver = self;
  v24.super_class = (Class)UISVectorGlyphDrawing;
  v7 = [(UISVectorGlyphDrawing *)&v24 init];
  if (v7)
  {
    v7->_image = CGImageRetain((CGImageRef)[v6 image]);
    v7->_tintColor = CGColorRetain(a4);
    [v6 alignmentRect];
    v7->_imageFrame.origin.x = v8;
    v7->_imageFrame.origin.y = v9;
    v7->_imageFrame.size.CGFloat width = v10;
    v7->_imageFrame.size.height = v11;
    [v6 contentBounds];
    v7->_size.CGFloat width = v12;
    v7->_size.height = v13;
    [v6 baselineOffset];
    double v15 = v14;
    [v6 pointSize];
    [v6 scale];
    double v17 = v16;
    CTFontGetAscentForSystemFontOfSize();
    double v19 = v18;
    CTFontGetDescentForSystemFontOfSize();
    CGFloat v20 = v7->_imageFrame.origin.y + v7->_imageFrame.size.height - v15 - round(v17 * v19) / v17;
    CGFloat width = v7->_size.width;
    v7->_alignmentRect.origin.x = 0.0;
    v7->_alignmentRect.origin.y = v20;
    v7->_alignmentRect.size.CGFloat width = width;
    v7->_alignmentRect.size.height = ceil(v17 * (v19 + v22)) / v17;
  }

  return v7;
}

- (void)dealloc
{
  CGImageRelease(self->_image);
  CGColorRelease(self->_tintColor);
  v3.receiver = self;
  v3.super_class = (Class)UISVectorGlyphDrawing;
  [(UISVectorGlyphDrawing *)&v3 dealloc];
}

- (CGRect)alignmentRect
{
  double x = self->_alignmentRect.origin.x;
  double y = self->_alignmentRect.origin.y;
  double width = self->_alignmentRect.size.width;
  double height = self->_alignmentRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGSize)drawingSize
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)drawInContext:(CGContext *)a3 atPoint:(CGPoint)a4
{
  double height = self->_size.height;
  v8.a = 1.0;
  v8.b = 0.0;
  v8.c = 0.0;
  v8.d = -1.0;
  v8.tdouble x = a4.x;
  v8.tdouble y = a4.y + height;
  CGContextConcatCTM(a3, &v8);
  if (self->_tintColor) {
    CGContextBeginTransparencyLayerWithRect(a3, self->_imageFrame, 0);
  }
  CGContextDrawImage(a3, self->_imageFrame, self->_image);
  tintColor = self->_tintColor;
  if (tintColor)
  {
    CGContextSetFillColorWithColor(a3, tintColor);
    CGContextSetBlendMode(a3, kCGBlendModeSourceIn);
    CGContextFillRect(a3, self->_imageFrame);
    CGContextEndTransparencyLayer(a3);
  }
}

@end