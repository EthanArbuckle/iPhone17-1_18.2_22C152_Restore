@interface PXGPath
- (BOOL)isEqual:(id)a3;
- (CGPath)CGPath;
- (CGRect)bounds;
- (PXGPath)init;
- (PXGPath)initWithBounds:(CGRect)a3 CGPath:(CGPath *)a4 strokeColor:(id)a5 lineWidth:(double)a6 fillColor:(id)a7 drawingMode:(int)a8;
- (UIColor)fillColor;
- (UIColor)strokeColor;
- (double)lineWidth;
- (int)drawingMode;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation PXGPath

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fillColor, 0);

  objc_storeStrong((id *)&self->_strokeColor, 0);
}

- (int)drawingMode
{
  return self->_drawingMode;
}

- (CGRect)bounds
{
  double x = self->_bounds.origin.x;
  double y = self->_bounds.origin.y;
  double width = self->_bounds.size.width;
  double height = self->_bounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGPath)CGPath
{
  return self->_CGPath;
}

- (UIColor)fillColor
{
  return self->_fillColor;
}

- (double)lineWidth
{
  return self->_lineWidth;
}

- (UIColor)strokeColor
{
  return self->_strokeColor;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PXGPath *)a3;
  if (v4 == self)
  {
    BOOL v14 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      [(PXGPath *)self lineWidth];
      double v7 = v6;
      [(PXGPath *)v5 lineWidth];
      if (v7 == v8
        && (int v9 = [(PXGPath *)self drawingMode], v9 == [(PXGPath *)v5 drawingMode]))
      {
        v10 = [(PXGPath *)self strokeColor];
        v11 = [(PXGPath *)v5 strokeColor];
        if ([v10 isEqual:v11])
        {
          v12 = [(PXGPath *)self fillColor];
          v13 = [(PXGPath *)v5 fillColor];
          if ([v12 isEqual:v13]) {
            BOOL v14 = CGPathEqualToPath(self->_CGPath, [(PXGPath *)v5 CGPath]);
          }
          else {
            BOOL v14 = 0;
          }
        }
        else
        {
          BOOL v14 = 0;
        }
      }
      else
      {
        BOOL v14 = 0;
      }
    }
    else
    {
      BOOL v14 = 0;
    }
  }

  return v14;
}

- (unint64_t)hash
{
  v3 = [(PXGPath *)self strokeColor];
  uint64_t v4 = [v3 hash];
  v5 = [(PXGPath *)self fillColor];
  uint64_t v6 = [v5 hash] ^ v4;
  double v7 = self;
  CFHashCode v8 = v6 ^ CFHash([(PXGPath *)v7 CGPath]);
  [(PXGPath *)v7 lineWidth];
  unint64_t v10 = v8 ^ [(PXGPath *)v7 drawingMode] ^ (unint64_t)(v9 * 10.0);

  return v10;
}

- (void)dealloc
{
  CGPathRelease(self->_CGPath);
  v3.receiver = self;
  v3.super_class = (Class)PXGPath;
  [(PXGPath *)&v3 dealloc];
}

- (PXGPath)init
{
  uint64_t v4 = [MEMORY[0x263F08690] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXGPath.m", 29, @"%s is not available as initializer", "-[PXGPath init]");

  abort();
}

- (PXGPath)initWithBounds:(CGRect)a3 CGPath:(CGPath *)a4 strokeColor:(id)a5 lineWidth:(double)a6 fillColor:(id)a7 drawingMode:(int)a8
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v18 = a5;
  id v19 = a7;
  v23.receiver = self;
  v23.super_class = (Class)PXGPath;
  v20 = [(PXGPath *)&v23 init];
  v21 = v20;
  if (v20)
  {
    v20->_bounds.origin.CGFloat x = x;
    v20->_bounds.origin.CGFloat y = y;
    v20->_bounds.size.CGFloat width = width;
    v20->_bounds.size.CGFloat height = height;
    v20->_CGPath = CGPathRetain(a4);
    objc_storeStrong((id *)&v21->_strokeColor, a5);
    v21->_lineWidth = a6;
    objc_storeStrong((id *)&v21->_fillColor, a7);
    v21->_drawingMode = a8;
  }

  return v21;
}

@end