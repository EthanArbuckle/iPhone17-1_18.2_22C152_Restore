@interface EQKitPathBox
- (BOOL)appendOpticalAlignToSpec:(void *)a3 offset:(CGPoint)a4;
- (BOOL)isEqual:(id)a3;
- (CGColor)color;
- (CGPath)cgPath;
- (CGRect)erasableBounds;
- (CGRect)p_cacheErasableBounds;
- (EQKitPathBox)init;
- (EQKitPathBox)initWithCGPath:(CGPath *)a3 height:(double)a4 cgColor:(CGColor *)a5;
- (EQKitPathBox)initWithCGPath:(CGPath *)a3 height:(double)a4 cgColor:(CGColor *)a5 drawingMode:(int)a6 lineWidth:(double)a7;
- (EQKitPathBox)initWithCGPath:(CGPath *)a3 height:(double)a4 paddingLeft:(double)a5 paddingRight:(double)a6 cgColor:(CGColor *)a7;
- (EQKitPathBox)initWithCGPath:(CGPath *)a3 height:(double)a4 paddingLeft:(double)a5 paddingRight:(double)a6 cgColor:(CGColor *)a7 drawingMode:(int)a8 lineWidth:(double)a9;
- (double)depth;
- (double)height;
- (double)lineWidth;
- (double)paddingLeft;
- (double)paddingRight;
- (double)width;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)drawingMode;
- (void)dealloc;
- (void)p_cacheDimensions;
- (void)renderIntoContext:(CGContext *)a3 offset:(CGPoint)a4;
@end

@implementation EQKitPathBox

- (EQKitPathBox)initWithCGPath:(CGPath *)a3 height:(double)a4 paddingLeft:(double)a5 paddingRight:(double)a6 cgColor:(CGColor *)a7 drawingMode:(int)a8 lineWidth:(double)a9
{
  v20.receiver = self;
  v20.super_class = (Class)EQKitPathBox;
  v16 = [(EQKitPathBox *)&v20 init];
  if (v16)
  {
    if (a3) {
      CGMutablePathRef MutableCopy = CGPathCreateMutableCopy(a3);
    }
    else {
      CGMutablePathRef MutableCopy = 0;
    }
    v16->mCGPath = MutableCopy;
    v16->mHeight = a4;
    v16->mPaddingLeft = a5;
    v16->mPaddingRight = a6;
    if (a7) {
      v18 = (CGColor *)CFRetain(a7);
    }
    else {
      v18 = 0;
    }
    v16->mCGColor = v18;
    v16->mDrawingMode = a8;
    v16->mLineWidth = a9;
  }
  return v16;
}

- (EQKitPathBox)initWithCGPath:(CGPath *)a3 height:(double)a4 paddingLeft:(double)a5 paddingRight:(double)a6 cgColor:(CGColor *)a7
{
  return [(EQKitPathBox *)self initWithCGPath:a3 height:a7 paddingLeft:0 paddingRight:a4 cgColor:a5 drawingMode:a6 lineWidth:1.0];
}

- (EQKitPathBox)initWithCGPath:(CGPath *)a3 height:(double)a4 cgColor:(CGColor *)a5
{
  return [(EQKitPathBox *)self initWithCGPath:a3 height:a5 paddingLeft:0 paddingRight:a4 cgColor:0.0 drawingMode:0.0 lineWidth:1.0];
}

- (EQKitPathBox)initWithCGPath:(CGPath *)a3 height:(double)a4 cgColor:(CGColor *)a5 drawingMode:(int)a6 lineWidth:(double)a7
{
  return [(EQKitPathBox *)self initWithCGPath:a3 height:a5 paddingLeft:*(void *)&a6 paddingRight:a4 cgColor:0.0 drawingMode:0.0 lineWidth:a7];
}

- (EQKitPathBox)init
{
  return [(EQKitPathBox *)self initWithCGPath:0 height:0 paddingLeft:0 paddingRight:0.0 cgColor:0.0 drawingMode:0.0 lineWidth:1.0];
}

- (void)dealloc
{
  CGPathRelease(self->mCGPath);
  CGColorRelease(self->mCGColor);
  v3.receiver = self;
  v3.super_class = (Class)EQKitPathBox;
  [(EQKitPathBox *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(EQKitPathBox *)self cgPath];
  [(EQKitPathBox *)self height];
  double v7 = v6;
  [(EQKitPathBox *)self paddingLeft];
  double v9 = v8;
  [(EQKitPathBox *)self paddingRight];
  double v11 = v10;
  v12 = [(EQKitPathBox *)self color];
  uint64_t v13 = [(EQKitPathBox *)self drawingMode];
  [(EQKitPathBox *)self lineWidth];

  return (id)[v4 initWithCGPath:v5 height:v12 paddingLeft:v13 paddingRight:v7 cgColor:v9 drawingMode:v11 lineWidth:v14];
}

- (BOOL)isEqual:(id)a3
{
  objc_super v3 = self;
  BOOL v4 = self == a3;
  LOBYTE(self) = self == a3;
  if (a3)
  {
    if (!v4)
    {
      LODWORD(self) = [a3 isMemberOfClass:objc_opt_class()];
      if (self)
      {
        [(EQKitPathBox *)v3 height];
        double v7 = v6;
        [a3 height];
        if (v7 != v8) {
          goto LABEL_16;
        }
        [(EQKitPathBox *)v3 paddingLeft];
        double v10 = v9;
        [a3 paddingLeft];
        if (v10 != v11) {
          goto LABEL_16;
        }
        [(EQKitPathBox *)v3 paddingRight];
        double v13 = v12;
        [a3 paddingRight];
        if (v13 != v14) {
          goto LABEL_16;
        }
        LODWORD(self) = CGColorEqualToColor(-[EQKitPathBox color](v3, "color"), (CGColorRef)[a3 color]);
        if (!self) {
          return (char)self;
        }
        int v15 = [(EQKitPathBox *)v3 drawingMode];
        if (v15 != [a3 drawingMode]
          || (-[EQKitPathBox lineWidth](v3, "lineWidth"), double v17 = v16, [a3 lineWidth], v17 != v18))
        {
LABEL_16:
          LOBYTE(self) = 0;
          return (char)self;
        }
        v19 = [(EQKitPathBox *)v3 cgPath];
        self = (EQKitPathBox *)[a3 cgPath];
        if (v19 == (const CGPath *)self)
        {
          LOBYTE(self) = 1;
        }
        else
        {
          objc_super v20 = self;
          LOBYTE(self) = 0;
          if (v19 && v20)
          {
            LOBYTE(self) = CGPathEqualToPath(v19, (CGPathRef)v20);
          }
        }
      }
    }
  }
  return (char)self;
}

- (double)depth
{
  if (!self->mDimensionsValid)
  {
    [(EQKitPathBox *)self p_cacheDimensions];
    self->mDimensionsValid = 1;
  }
  return self->mDepth;
}

- (double)width
{
  if (!self->mDimensionsValid)
  {
    [(EQKitPathBox *)self p_cacheDimensions];
    self->mDimensionsValid = 1;
  }
  return self->mWidth;
}

- (CGRect)erasableBounds
{
  if (self->mErasableBoundsValid)
  {
    double x = self->mErasableBounds.origin.x;
    double y = self->mErasableBounds.origin.y;
    double width = self->mErasableBounds.size.width;
    double height = self->mErasableBounds.size.height;
  }
  else
  {
    [(EQKitPathBox *)self p_cacheErasableBounds];
    self->mErasableBounds.origin.double x = x;
    self->mErasableBounds.origin.double y = y;
    self->mErasableBounds.size.double width = width;
    self->mErasableBounds.size.double height = height;
    self->mErasableBoundsValid = 1;
  }
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)renderIntoContext:(CGContext *)a3 offset:(CGPoint)a4
{
  if (a3 && self->mCGPath)
  {
    double y = a4.y;
    double x = a4.x;
    CGContextSaveGState(a3);
    CGContextTranslateCTM(a3, x + self->mPaddingLeft, y - self->mHeight);
    CGContextAddPath(a3, self->mCGPath);
    mCGColor = self->mCGColor;
    if (mCGColor)
    {
      CGContextSetFillColorWithColor(a3, mCGColor);
      CGContextSetStrokeColorWithColor(a3, self->mCGColor);
    }
    CGContextSetLineWidth(a3, self->mLineWidth);
    CGContextDrawPath(a3, (CGPathDrawingMode)self->mDrawingMode);
    CGContextRestoreGState(a3);
  }
}

- (BOOL)appendOpticalAlignToSpec:(void *)a3 offset:(CGPoint)a4
{
  mCGPath = self->mCGPath;
  if (mCGPath)
  {
    v6.double x = a4.x + self->mPaddingLeft;
    v6.double y = a4.y - self->mHeight;
    EQKit::OpticalKern::Spec::appendEntry((EQKit::OpticalKern::Spec *)a3, v6, mCGPath);
  }
  return mCGPath != 0;
}

- (id)description
{
  objc_super v3 = NSString;
  uint64_t v4 = objc_opt_class();
  [(EQKitPathBox *)self height];
  uint64_t v6 = v5;
  [(EQKitPathBox *)self depth];
  uint64_t v8 = v7;
  [(EQKitPathBox *)self width];
  return (id)[v3 stringWithFormat:@"<%@ %p>: height=%f depth=%f width=%f", v4, self, v6, v8, v9];
}

- (void)p_cacheDimensions
{
  self->mDepth = 0.0;
  self->mWidth = 0.0;
  mCGPath = self->mCGPath;
  if (mCGPath)
  {
    PathBoundingBoCGFloat x = CGPathGetPathBoundingBox(mCGPath);
    CGFloat x = PathBoundingBox.origin.x;
    CGFloat y = PathBoundingBox.origin.y;
    CGFloat width = PathBoundingBox.size.width;
    CGFloat height = PathBoundingBox.size.height;
    if (!CGRectIsEmpty(PathBoundingBox))
    {
      v11.origin.CGFloat x = x;
      v11.origin.CGFloat y = y;
      v11.size.CGFloat width = width;
      v11.size.CGFloat height = height;
      double v8 = CGRectGetHeight(v11);
      [(EQKitPathBox *)self height];
      self->mDepth = v8 - v9;
      v12.origin.CGFloat x = x;
      v12.origin.CGFloat y = y;
      v12.size.CGFloat width = width;
      v12.size.CGFloat height = height;
      self->mWidth = CGRectGetWidth(v12) + self->mPaddingLeft + self->mPaddingRight;
    }
  }
}

- (CGRect)p_cacheErasableBounds
{
  double v4 = *MEMORY[0x263F001A8];
  double v3 = *(double *)(MEMORY[0x263F001A8] + 8);
  CGFloat v5 = *(double *)(MEMORY[0x263F001A8] + 16);
  CGFloat v6 = *(double *)(MEMORY[0x263F001A8] + 24);
  mCGPath = self->mCGPath;
  if (mCGPath)
  {
    PathBoundingBodouble x = CGPathGetPathBoundingBox(mCGPath);
    double x = PathBoundingBox.origin.x;
    double y = PathBoundingBox.origin.y;
    CGFloat width = PathBoundingBox.size.width;
    CGFloat height = PathBoundingBox.size.height;
    if (!CGRectIsEmpty(PathBoundingBox))
    {
      [(EQKitPathBox *)self height];
      double v3 = y - v12;
      double v4 = x + self->mPaddingLeft;
      CGFloat v5 = width;
      CGFloat v6 = height;
    }
  }
  double v13 = v4;
  double v14 = v3;
  double v15 = v5;
  double v16 = v6;
  result.size.CGFloat height = v16;
  result.size.CGFloat width = v15;
  result.origin.double y = v14;
  result.origin.double x = v13;
  return result;
}

- (CGPath)cgPath
{
  return self->mCGPath;
}

- (double)height
{
  return self->mHeight;
}

- (double)paddingLeft
{
  return self->mPaddingLeft;
}

- (double)paddingRight
{
  return self->mPaddingRight;
}

- (CGColor)color
{
  return self->mCGColor;
}

- (int)drawingMode
{
  return self->mDrawingMode;
}

- (double)lineWidth
{
  return self->mLineWidth;
}

@end