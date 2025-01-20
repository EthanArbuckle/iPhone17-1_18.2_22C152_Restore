@interface UISPathDrawing
- (CGRect)alignmentRect;
- (CGSize)drawingSize;
- (UISPathDrawing)initWithEllipseSize:(CGSize)a3 fillColor:(CGColor *)a4;
- (UISPathDrawing)initWithPath:(CGPath *)a3 size:(CGSize)a4 fillColor:(CGColor *)a5;
- (UISPathDrawing)initWithRectSize:(CGSize)a3 fillColor:(CGColor *)a4;
- (UISPathDrawing)initWithRoundedRectSize:(CGSize)a3 cornerRadii:(double)a4[4] fillColor:(CGColor *)a5;
- (UISPathDrawing)initWithType:(int64_t)a3 path:(CGPath *)a4 size:(CGSize)a5 fillColor:(CGColor *)a6;
- (void)dealloc;
- (void)drawInContext:(CGContext *)a3 atPoint:(CGPoint)a4;
@end

@implementation UISPathDrawing

- (UISPathDrawing)initWithType:(int64_t)a3 path:(CGPath *)a4 size:(CGSize)a5 fillColor:(CGColor *)a6
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  v14.receiver = self;
  v14.super_class = (Class)UISPathDrawing;
  v11 = [(UISPathDrawing *)&v14 init];
  v12 = v11;
  if (v11)
  {
    v11->_type = a3;
    v11->_path = CGPathRetain(a4);
    v12->_size.CGFloat width = width;
    v12->_size.CGFloat height = height;
    v12->_fillColor = CGColorRetain(a6);
  }
  return v12;
}

- (UISPathDrawing)initWithEllipseSize:(CGSize)a3 fillColor:(CGColor *)a4
{
  return -[UISPathDrawing initWithType:path:size:fillColor:](self, "initWithType:path:size:fillColor:", 1, 0, a4, a3.width, a3.height);
}

- (UISPathDrawing)initWithPath:(CGPath *)a3 size:(CGSize)a4 fillColor:(CGColor *)a5
{
  return -[UISPathDrawing initWithType:path:size:fillColor:](self, "initWithType:path:size:fillColor:", 2, a3, a5, a4.width, a4.height);
}

- (UISPathDrawing)initWithRectSize:(CGSize)a3 fillColor:(CGColor *)a4
{
  return -[UISPathDrawing initWithType:path:size:fillColor:](self, "initWithType:path:size:fillColor:", 0, 0, a4, a3.width, a3.height);
}

- (UISPathDrawing)initWithRoundedRectSize:(CGSize)a3 cornerRadii:(double)a4[4] fillColor:(CGColor *)a5
{
  double height = a3.height;
  double width = a3.width;
  double v9 = *a4;
  double v10 = a4[1];
  double v12 = a4[2];
  double v11 = a4[3];
  if (*a4 != v10 || v10 != v12 || v12 != v11)
  {
    uint64_t v15 = CGPathCreateWithUnevenCornersRoundedRect();
LABEL_12:
    v16 = (const CGPath *)v15;
    goto LABEL_13;
  }
  if (v9 != 0.0)
  {
    v19.size.double width = a3.width;
    v19.size.double height = a3.height;
    v19.origin.x = *(CGFloat *)MEMORY[0x1E4F1DAD8];
    v19.origin.y = *(CGFloat *)(MEMORY[0x1E4F1DAD8] + 8);
    uint64_t v15 = (uint64_t)CGPathCreateWithRoundedRect(v19, v9, *a4, 0);
    goto LABEL_12;
  }
  v16 = 0;
LABEL_13:
  v17 = -[UISPathDrawing initWithType:path:size:fillColor:](self, "initWithType:path:size:fillColor:", 2 * (v16 != 0), v16, a5, width, height, v11);
  CGPathRelease(v16);
  return v17;
}

- (void)dealloc
{
  CGPathRelease(self->_path);
  CGColorRelease(self->_fillColor);
  v3.receiver = self;
  v3.super_class = (Class)UISPathDrawing;
  [(UISPathDrawing *)&v3 dealloc];
}

- (CGRect)alignmentRect
{
  double width = self->_size.width;
  double height = self->_size.height;
  double v4 = 0.0;
  double v5 = 0.0;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.y = v5;
  result.origin.x = v4;
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
  double y = a4.y;
  double x = a4.x;
  CGContextSetFillColorWithColor(a3, self->_fillColor);
  int64_t type = self->_type;
  switch(type)
  {
    case 2:
      if (x != *MEMORY[0x1E4F1DAD8] || y != *(double *)(MEMORY[0x1E4F1DAD8] + 8)) {
        CGContextTranslateCTM(a3, x, y);
      }
      CGContextAddPath(a3, self->_path);
      CGContextFillPath(a3);
      break;
    case 1:
      CGFloat width = self->_size.width;
      CGFloat height = self->_size.height;
      double v15 = x;
      double v16 = y;
      CGContextFillEllipseInRect(a3, *(CGRect *)&v15);
      break;
    case 0:
      CGFloat v9 = self->_size.width;
      CGFloat v10 = self->_size.height;
      double v11 = x;
      double v12 = y;
      CGContextFillRect(a3, *(CGRect *)&v11);
      break;
  }
}

@end