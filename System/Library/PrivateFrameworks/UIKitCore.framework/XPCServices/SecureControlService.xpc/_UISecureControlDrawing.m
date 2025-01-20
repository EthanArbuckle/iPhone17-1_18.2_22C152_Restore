@interface _UISecureControlDrawing
- (CGSize)drawingSize;
- (_UISecureControlDrawing)initWithDrawingPlan:(id)a3 cornerStyle:(int64_t)a4 cornerRadius:(double)a5 foregroundColor:(CGColor *)a6 backgroundColor:(CGColor *)a7 imagePlacement:(unint64_t)a8 leftToRight:(BOOL)a9 size:(CGSize)a10;
- (void)dealloc;
- (void)drawInContext:(CGContext *)a3 atPoint:(CGPoint)a4;
@end

@implementation _UISecureControlDrawing

- (_UISecureControlDrawing)initWithDrawingPlan:(id)a3 cornerStyle:(int64_t)a4 cornerRadius:(double)a5 foregroundColor:(CGColor *)a6 backgroundColor:(CGColor *)a7 imagePlacement:(unint64_t)a8 leftToRight:(BOOL)a9 size:(CGSize)a10
{
  double height = a10.height;
  double width = a10.width;
  id v20 = a3;
  v32.receiver = self;
  v32.super_class = (Class)_UISecureControlDrawing;
  v21 = [(_UISecureControlDrawing *)&v32 init];
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_drawingPlan, a3);
    v22->_foregroundColor = CGColorRetain(a6);
    double v23 = height * 0.5;
    double v24 = 0.0;
    switch(a4)
    {
      case -1:
        double v24 = a5;
        break;
      case 0:
        objc_msgSend(v20, "contentSizeCategory", 0.0);
        CTFontDescriptorGetTextStyleSize();
        CTFontDescriptorGetTextStyleSize();
        [v20 displayScale];
        double v24 = round(v25 * (0.0 * a5 / 0.0)) / v25;
        break;
      case 1:
        double v26 = 0.25;
        goto LABEL_8;
      case 2:
        double v26 = 0.35;
        goto LABEL_8;
      case 3:
        double v26 = 0.5;
LABEL_8:
        double v24 = v23 * v26;
        break;
      case 4:
        double v24 = INFINITY;
        break;
      default:
        break;
    }
    double v27 = fmin(fmax(v24, 0.0), fmin(v23, width * 0.5));
    id v28 = objc_alloc((Class)UISPathDrawing);
    *(double *)v33 = v27;
    *(double *)&v33[1] = v27;
    *(double *)&v33[2] = v27;
    *(double *)&v33[3] = v27;
    v29 = (UISPathDrawing *)objc_msgSend(v28, "initWithRoundedRectSize:cornerRadii:fillColor:", v33, a7, width, height);
    backgroundDrawing = v22->_backgroundDrawing;
    v22->_backgroundDrawing = v29;

    v22->_imagePlacement = a8;
    v22->_leftToRight = a9;
    v22->_size.double width = width;
    v22->_size.double height = height;
  }

  return v22;
}

- (void)dealloc
{
  CGColorRelease(self->_foregroundColor);
  v3.receiver = self;
  v3.super_class = (Class)_UISecureControlDrawing;
  [(_UISecureControlDrawing *)&v3 dealloc];
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
  CGContextSaveGState(a3);
  -[UISPathDrawing drawInContext:atPoint:](self->_backgroundDrawing, "drawInContext:atPoint:", a3, x, y);
  CGContextRestoreGState(a3);
  [(_UISecureControlDrawingPlan *)self->_drawingPlan alignmentSize];
  double v9 = v8;
  double v11 = v10;
  [(_UISecureControlDrawingPlan *)self->_drawingPlan displayScale];
  double v13 = v12;
  double v14 = v9 * 0.5;
  double v15 = v11 * 0.5;
  id v31 = [(_UISecureControlDrawingPlan *)self->_drawingPlan glyphDrawingInColor:self->_foregroundColor];
  v16 = [(_UISecureControlDrawingPlan *)self->_drawingPlan textDrawingInColor:self->_foregroundColor];
  if (v31)
  {
    CGContextSaveGState(a3);
    [v31 alignmentRect];
    unint64_t imagePlacement = self->_imagePlacement;
    if ((imagePlacement & 0xA) != 0)
    {
      double v22 = v14 - v19;
      if (self->_leftToRight != (imagePlacement == 8)) {
        double v22 = -v14;
      }
      double v23 = v20 * -0.5;
    }
    else
    {
      double v23 = v15 - v20;
      if (imagePlacement == 1) {
        double v23 = -v15;
      }
      double v22 = v19 * -0.5;
    }
    objc_msgSend(v31, "drawInContext:atPoint:", a3, x + floor(v13 * (v22 + self->_size.width * 0.5 - v17)) / v13, y + floor(v13 * (v23 + self->_size.height * 0.5 - v18)) / v13);
    CGContextRestoreGState(a3);
  }
  if (v16)
  {
    CGContextSaveGState(a3);
    [v16 alignmentRect];
    unint64_t v28 = self->_imagePlacement;
    if ((v28 & 0xA) != 0)
    {
      double v29 = v14 - v26;
      if (self->_leftToRight == (v28 == 8)) {
        double v29 = -v14;
      }
      double v30 = v27 * -0.5;
    }
    else
    {
      double v30 = v15 - v27;
      if (v28 != 1) {
        double v30 = -v15;
      }
      double v29 = v26 * -0.5;
    }
    objc_msgSend(v16, "drawInContext:atPoint:", a3, x + floor(v13 * (v29 + self->_size.width * 0.5 - v24)) / v13, y + floor(v13 * (v30 + self->_size.height * 0.5 - v25)) / v13);
    CGContextRestoreGState(a3);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundDrawing, 0);
  objc_storeStrong((id *)&self->_drawingPlan, 0);
}

@end