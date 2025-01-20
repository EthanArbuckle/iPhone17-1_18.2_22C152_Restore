@interface CRLWPAdornmentLine
- (BOOL)allowAntialiasing;
- (BOOL)isWhitespace;
- (BOOL)merge:(id)a3;
- (BOOL)shouldRenderForLineDrawFlags:(unint64_t)a3;
- (CGColor)color;
- (CGPoint)start;
- (CRLWPAdornmentLine)initWithStart:(CGPoint)a3 length:(double)a4 color:(CGColor *)a5 thickness:(double)a6 lineCount:(unint64_t)a7 underline:(int64_t)a8 adornmentLocation:(int)a9 underLineAdjustment:(double)a10;
- (CRLWPAdornmentLine)initWithStart:(CGPoint)a3 length:(double)a4 color:(CGColor *)a5 thickness:(double)a6 lineCount:(unint64_t)a7 underline:(int64_t)a8 adornmentLocation:(int)a9 underLineAdjustment:(double)a10 isWhitespace:(BOOL)a11 renderingDelegate:(id)a12 allowAntialiasing:(BOOL)a13;
- (CRLWPAdornmentLineRenderingDelegate)renderingDelegate;
- (double)length;
- (double)thickness;
- (double)underlineAdjustment;
- (id)copyWithColor:(CGColor *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int)adornmentLocation;
- (int64_t)underline;
- (unint64_t)lineCount;
- (void)dealloc;
- (void)setRenderingDelegate:(id)a3;
- (void)setStart:(CGPoint)a3;
@end

@implementation CRLWPAdornmentLine

- (CRLWPAdornmentLine)initWithStart:(CGPoint)a3 length:(double)a4 color:(CGColor *)a5 thickness:(double)a6 lineCount:(unint64_t)a7 underline:(int64_t)a8 adornmentLocation:(int)a9 underLineAdjustment:(double)a10 isWhitespace:(BOOL)a11 renderingDelegate:(id)a12 allowAntialiasing:(BOOL)a13
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v25 = a12;
  v35.receiver = self;
  v35.super_class = (Class)CRLWPAdornmentLine;
  v26 = [(CRLWPAdornmentLine *)&v35 init];
  v27 = v26;
  if (v26)
  {
    v26->_start.CGFloat x = x;
    v26->_start.CGFloat y = y;
    v26->_length = a4;
    if (a5) {
      v26->_color = CGColorRetain(a5);
    }
    if (a7 >= 3)
    {
      int v34 = +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FA088);
      }
      v28 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010B2D64(v34, v28);
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FA0A8);
      }
      v29 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101066770(v29, v34);
      }
      v30 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPAdornmentLine initWithStart:length:color:thickness:lineCount:underline:adornmentLocation:underLineAdjustment:isWhitespace:renderingDelegate:allowAntialiasing:]");
      v31 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPAdornmentLine.m"];
      +[CRLAssertionHandler handleFailureInFunction:v30 file:v31 lineNumber:34 isFatal:0 description:"Illegal line count"];
    }
    v27->_thickness = a6;
    unint64_t v32 = 2;
    if (a7 < 2) {
      unint64_t v32 = a7;
    }
    v27->_lineCount = v32;
    v27->_underline = a8;
    v27->_adornmentLocation = a9;
    v27->_underlineAdjustment = a10;
    v27->_isWhitespace = a11;
    objc_storeStrong((id *)&v27->_renderingDelegate, a12);
    v27->_allowAntialiasing = a13;
  }

  return v27;
}

- (CRLWPAdornmentLine)initWithStart:(CGPoint)a3 length:(double)a4 color:(CGColor *)a5 thickness:(double)a6 lineCount:(unint64_t)a7 underline:(int64_t)a8 adornmentLocation:(int)a9 underLineAdjustment:(double)a10
{
  LOBYTE(v11) = 0;
  return -[CRLWPAdornmentLine initWithStart:length:color:thickness:lineCount:underline:adornmentLocation:underLineAdjustment:isWhitespace:renderingDelegate:allowAntialiasing:](self, "initWithStart:length:color:thickness:lineCount:underline:adornmentLocation:underLineAdjustment:isWhitespace:renderingDelegate:allowAntialiasing:", a5, a7, a8, *(void *)&a9, 0, 0, a3.x, a3.y, a4, a6, a10, v11);
}

- (void)dealloc
{
  color = self->_color;
  if (color) {
    CGColorRelease(color);
  }
  v4.receiver = self;
  v4.super_class = (Class)CRLWPAdornmentLine;
  [(CRLWPAdornmentLine *)&v4 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4 = [CRLWPAdornmentLine alloc];
  LOBYTE(v6) = self->_allowAntialiasing;
  return -[CRLWPAdornmentLine initWithStart:length:color:thickness:lineCount:underline:adornmentLocation:underLineAdjustment:isWhitespace:renderingDelegate:allowAntialiasing:](v4, "initWithStart:length:color:thickness:lineCount:underline:adornmentLocation:underLineAdjustment:isWhitespace:renderingDelegate:allowAntialiasing:", self->_color, self->_lineCount, self->_underline, self->_adornmentLocation, self->_isWhitespace, self->_renderingDelegate, self->_start.x, self->_start.y, self->_length, self->_thickness, self->_underlineAdjustment, v6);
}

- (id)copyWithColor:(CGColor *)a3
{
  objc_super v4 = [(CRLWPAdornmentLine *)self copy];
  if (a3) {
    CGColorRef v5 = CGColorRetain(a3);
  }
  else {
    CGColorRef v5 = 0;
  }
  v4[2] = v5;
  uint64_t v6 = (void *)v4[8];
  v4[8] = 0;

  return v4;
}

- (void)setStart:(CGPoint)a3
{
  self->_start = a3;
}

- (CGColor)color
{
  renderingDelegate = self->_renderingDelegate;
  if (renderingDelegate) {
    return (CGColor *)[(CRLWPAdornmentLineRenderingDelegate *)renderingDelegate cgColor];
  }
  else {
    return self->_color;
  }
}

- (BOOL)merge:(id)a3
{
  id v4 = a3;
  CGColorRef v5 = (double *)v4;
  if (*((void *)v4 + 5) != self->_lineCount) {
    goto LABEL_15;
  }
  double x = self->_start.x;
  double y = self->_start.y;
  double v9 = *((double *)v4 + 9);
  double v8 = *((double *)v4 + 10);
  int64_t underline = self->_underline;
  if (!CGColorEqualToColor(self->_color, *((CGColorRef *)v4 + 2))) {
    goto LABEL_15;
  }
  if ([v5 underline] != self->_underline) {
    goto LABEL_15;
  }
  unsigned int v11 = [v5 adornmentLocation];
  if (v11 != self->_adornmentLocation) {
    goto LABEL_15;
  }
  if (!underline)
  {
    double thickness = self->_thickness;
    double v14 = v5[4];
    if (thickness != v14 && vabdd_f64(thickness, v14) >= 0.00999999978) {
      goto LABEL_15;
    }
    if (y != v8 && vabdd_f64(y, v8) >= 0.00999999978) {
      goto LABEL_15;
    }
  }
  if ((CRLWPAdornmentLineRenderingDelegate *)*((void *)v5 + 8) != self->_renderingDelegate)
  {
LABEL_15:
    BOOL v15 = 0;
    goto LABEL_16;
  }
  self->_length = v9 - x + v5[3];
  if (!underline) {
    goto LABEL_18;
  }
  if (!self->_isWhitespace)
  {
    if (*((unsigned char *)v5 + 8)) {
      goto LABEL_23;
    }
    goto LABEL_18;
  }
  if (*((unsigned char *)v5 + 8))
  {
LABEL_18:
    if (v11 == 1) {
      double v17 = fmin(y, v8);
    }
    else {
      double v17 = fmax(y, v8);
    }
    self->_start.double y = v17;
    double v12 = fmax(self->_thickness, v5[4]);
    goto LABEL_22;
  }
  self->_start.double y = v8;
  double v12 = v5[4];
LABEL_22:
  self->_double thickness = v12;
LABEL_23:
  if (self->_isWhitespace && !*((unsigned char *)v5 + 8)) {
    self->_isWhitespace = 0;
  }
  BOOL v15 = 1;
LABEL_16:

  return v15;
}

- (BOOL)shouldRenderForLineDrawFlags:(unint64_t)a3
{
  renderingDelegate = self->_renderingDelegate;
  if (renderingDelegate) {
    return [(CRLWPAdornmentLineRenderingDelegate *)renderingDelegate shouldRenderForLineDrawFlags:a3];
  }
  else {
    return 1;
  }
}

- (CGPoint)start
{
  double x = self->_start.x;
  double y = self->_start.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (double)length
{
  return self->_length;
}

- (double)thickness
{
  return self->_thickness;
}

- (unint64_t)lineCount
{
  return self->_lineCount;
}

- (int64_t)underline
{
  return self->_underline;
}

- (int)adornmentLocation
{
  return self->_adornmentLocation;
}

- (double)underlineAdjustment
{
  return self->_underlineAdjustment;
}

- (BOOL)isWhitespace
{
  return self->_isWhitespace;
}

- (BOOL)allowAntialiasing
{
  return self->_allowAntialiasing;
}

- (CRLWPAdornmentLineRenderingDelegate)renderingDelegate
{
  return self->_renderingDelegate;
}

- (void)setRenderingDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end