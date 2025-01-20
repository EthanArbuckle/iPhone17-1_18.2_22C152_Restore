@interface SUScriptCanvasContext
+ (id)webScriptNameForKeyName:(id)a3;
+ (id)webScriptNameForSelector:(SEL)a3;
+ (void)initialize;
- (BOOL)isPointInPathWithX:(double)a3 y:(double)a4;
- (CGPath)copyCanvasPath;
- (NSString)globalCompositeOperation;
- (SUScriptCanvasContext)initWithWidth:(double)a3 height:(double)a4;
- (double)globalAlpha;
- (double)height;
- (double)lineWidth;
- (double)miterLimit;
- (double)shadowBlur;
- (double)shadowOffsetX;
- (double)shadowOffsetY;
- (double)width;
- (id)_className;
- (id)copyCanvasImage;
- (id)fillStyle;
- (id)lineCap;
- (id)lineJoin;
- (id)makeLinearGradientWithX0:(double)a3 y0:(double)a4 x1:(double)a5 y1:(double)a6;
- (id)makeRadialGradientWithX0:(double)a3 y0:(double)a4 r0:(double)a5 x1:(double)a6 y1:(double)a7 r1:(double)a8;
- (id)scriptAttributeKeys;
- (id)shadowColor;
- (id)strokeStyle;
- (void)_ntsApplyShadow;
- (void)arcToX1:(double)a3 y1:(double)a4 x2:(double)a5 y2:(double)a6 radius:(double)a7;
- (void)arcWithX:(double)a3 y:(double)a4 radius:(double)a5 startAngle:(double)a6 endAngle:(double)a7 antiClockwise:(BOOL)a8;
- (void)beginPath;
- (void)bezierCurveToCP1X:(double)a3 cp1y:(double)a4 cp2x:(double)a5 cp2y:(double)a6 x:(double)a7 y:(double)a8;
- (void)clearRectWithX:(double)a3 y:(double)a4 width:(double)a5 height:(double)a6;
- (void)clip;
- (void)closePath;
- (void)dealloc;
- (void)fill;
- (void)fillRectWithX:(double)a3 y:(double)a4 width:(double)a5 height:(double)a6;
- (void)lineToX:(double)a3 y:(double)a4;
- (void)moveToX:(double)a3 y:(double)a4;
- (void)quadraticCurveToCPX:(double)a3 cpy:(double)a4 x:(double)a5 y:(double)a6;
- (void)restoreState;
- (void)rotateWithAngle:(double)a3;
- (void)saveState;
- (void)scaleWithX:(double)a3 y:(double)a4;
- (void)setFillStyle:(id)a3;
- (void)setGlobalAlpha:(double)a3;
- (void)setGlobalCompositeOperation:(id)a3;
- (void)setLineCap:(id)a3;
- (void)setLineJoin:(id)a3;
- (void)setLineWidth:(double)a3;
- (void)setMiterLimit:(double)a3;
- (void)setShadowBlur:(double)a3;
- (void)setShadowColor:(id)a3;
- (void)setShadowOffsetX:(double)a3;
- (void)setShadowOffsetY:(double)a3;
- (void)setStrokeStyle:(id)a3;
- (void)setTransformWithM11:(double)a3 m12:(double)a4 m21:(double)a5 m22:(double)a6 dx:(double)a7 dy:(double)a8;
- (void)stroke;
- (void)strokeRectWithX:(double)a3 y:(double)a4 width:(double)a5 height:(double)a6;
- (void)transformWithM11:(double)a3 m12:(double)a4 m21:(double)a5 m22:(double)a6 dx:(double)a7 dy:(double)a8;
- (void)translateWithX:(double)a3 y:(double)a4;
@end

@implementation SUScriptCanvasContext

- (SUScriptCanvasContext)initWithWidth:(double)a3 height:(double)a4
{
  v6 = [(SUScriptObject *)self init];
  if (!v6) {
    return v6;
  }
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  if (DeviceRGB)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C920], "mainScreen"), "scale");
    v6->_scale = v8;
    float v9 = v8 * a4;
    a4 = ceilf(v9);
    *(float *)&double v8 = v8 * a3;
    a3 = ceilf(*(float *)&v8);
    context = CGBitmapContextCreate(0, vcvtps_u32_f32(*(float *)&v8), vcvtps_u32_f32(v9), 8uLL, (vcvtd_n_u64_f64(a3, 3uLL) + 31) & 0xFFFFFFFFFFFFFFE0, DeviceRGB, 0x2002u);
    v6->_context = context;
    if (context) {
      goto LABEL_4;
    }
LABEL_8:

    v6 = 0;
    if (!DeviceRGB) {
      return v6;
    }
    goto LABEL_5;
  }
  context = v6->_context;
  if (!context) {
    goto LABEL_8;
  }
LABEL_4:
  CGContextSetShouldAntialias(context, 1);
  CGContextSetFillColorSpace(v6->_context, DeviceRGB);
  CGContextTranslateCTM(v6->_context, 0.0, a4);
  CGContextScaleCTM(v6->_context, v6->_scale, -v6->_scale);
  CGContextGetCTM(&v12, v6->_context);
  CGContextSetBaseCTM();
  v6->_contextPath = CGPathCreateMutable();
  v6->_height = a4;
  v6->_width = a3;
  if (DeviceRGB) {
LABEL_5:
  }
    CGColorSpaceRelease(DeviceRGB);
  return v6;
}

- (void)dealloc
{
  context = self->_context;
  if (context) {
    CGContextRelease(context);
  }
  contextPath = self->_contextPath;
  if (contextPath) {
    CGPathRelease(contextPath);
  }

  v5.receiver = self;
  v5.super_class = (Class)SUScriptCanvasContext;
  [(SUScriptObject *)&v5 dealloc];
}

- (void)arcToX1:(double)a3 y1:(double)a4 x2:(double)a5 y2:(double)a6 radius:(double)a7
{
  [(SUScriptObject *)self lock];
  memset(&v13, 0, sizeof(v13));
  CGContextGetCTM(&v13, self->_context);
  CGPathAddArcToPoint(self->_contextPath, &v13, a3, a4, a5, a6, a7);
  CGContextAddArcToPoint(self->_context, a3, a4, a5, a6, a7);
  [(SUScriptObject *)self unlock];
}

- (void)arcWithX:(double)a3 y:(double)a4 radius:(double)a5 startAngle:(double)a6 endAngle:(double)a7 antiClockwise:(BOOL)a8
{
  int v8 = a8;
  [(SUScriptObject *)self lock];
  memset(&v15, 0, sizeof(v15));
  CGContextGetCTM(&v15, self->_context);
  v8 ^= 1u;
  CGPathAddArc(self->_contextPath, &v15, a3, a4, a5, a6, a7, v8);
  CGContextAddArc(self->_context, a3, a4, a5, a6, a7, v8);
  [(SUScriptObject *)self unlock];
}

- (void)beginPath
{
  [(SUScriptObject *)self lock];
  CGContextBeginPath(self->_context);
  contextPath = self->_contextPath;
  if (contextPath)
  {
    CGPathRelease(contextPath);
    self->_contextPath = CGPathCreateMutable();
  }

  [(SUScriptObject *)self unlock];
}

- (void)bezierCurveToCP1X:(double)a3 cp1y:(double)a4 cp2x:(double)a5 cp2y:(double)a6 x:(double)a7 y:(double)a8
{
  [(SUScriptObject *)self lock];
  memset(&v15, 0, sizeof(v15));
  CGContextGetCTM(&v15, self->_context);
  CGPathAddCurveToPoint(self->_contextPath, &v15, a3, a4, a5, a6, a7, a8);
  CGContextAddCurveToPoint(self->_context, a3, a4, a5, a6, a7, a8);
  [(SUScriptObject *)self unlock];
}

- (id)copyCanvasImage
{
  [(SUScriptObject *)self lock];
  context = self->_context;
  if (context && (CGImageRef Image = CGBitmapContextCreateImage(context)) != 0)
  {
    objc_super v5 = Image;
    v6 = (void *)[objc_alloc(MEMORY[0x263F1C6B0]) initWithCGImage:Image scale:0 orientation:self->_scale];
    CGImageRelease(v5);
  }
  else
  {
    v6 = 0;
  }
  [(SUScriptObject *)self unlock];
  return v6;
}

- (CGPath)copyCanvasPath
{
  [(SUScriptObject *)self lock];
  contextPath = self->_contextPath;
  if (contextPath)
  {
    memset(&v5, 0, sizeof(v5));
    CGAffineTransformMakeScale(&v5, 1.0 / self->_scale, 1.0 / self->_scale);
    contextPath = (CGPath *)MEMORY[0x22A67FD10](contextPath, &v5);
  }
  [(SUScriptObject *)self unlock];
  return contextPath;
}

- (void)clearRectWithX:(double)a3 y:(double)a4 width:(double)a5 height:(double)a6
{
  [(SUScriptObject *)self lock];
  v12.origin.x = a3;
  v12.origin.y = a4;
  v12.size.width = a5;
  v12.size.height = a6;
  CGContextClearRect(self->_context, v12);

  [(SUScriptObject *)self unlock];
}

- (void)clip
{
  [(SUScriptObject *)self lock];
  CGContextClip(self->_context);

  [(SUScriptObject *)self unlock];
}

- (void)closePath
{
  [(SUScriptObject *)self lock];
  CGPathCloseSubpath(self->_contextPath);
  CGContextClosePath(self->_context);

  [(SUScriptObject *)self unlock];
}

- (void)fill
{
  [(SUScriptObject *)self lock];
  int64_t fillStyleType = self->_fillStyleType;
  if (fillStyleType == 1)
  {
    v4 = (void *)[self->_fillStyle copyNativeGradient];
    uint64_t v5 = [v4 copyShading];
    if (v5)
    {
      v6 = (CGShading *)v5;
      CGContextSaveGState(self->_context);
      CGContextClip(self->_context);
      CGContextDrawShading(self->_context, v6);
      CGContextRestoreGState(self->_context);
      CGShadingRelease(v6);
    }
  }
  else if (!fillStyleType)
  {
    CGContextFillPath(self->_context);
  }

  [(SUScriptObject *)self unlock];
}

- (void)fillRectWithX:(double)a3 y:(double)a4 width:(double)a5 height:(double)a6
{
  [(SUScriptObject *)self lock];
  int64_t fillStyleType = self->_fillStyleType;
  if (fillStyleType == 1)
  {
    CGRect v12 = (void *)[self->_fillStyle copyNativeGradient];
    uint64_t v13 = [v12 copyShading];
    if (v13)
    {
      v14 = (CGShading *)v13;
      CGContextSaveGState(self->_context);
      v17.origin.x = a3;
      v17.origin.y = a4;
      v17.size.width = a5;
      v17.size.height = a6;
      CGContextClipToRect(self->_context, v17);
      CGContextDrawShading(self->_context, v14);
      CGContextRestoreGState(self->_context);
      CGShadingRelease(v14);
    }
  }
  else if (!fillStyleType)
  {
    v16.origin.x = a3;
    v16.origin.y = a4;
    v16.size.width = a5;
    v16.size.height = a6;
    CGContextFillRect(self->_context, v16);
  }

  [(SUScriptObject *)self unlock];
}

- (BOOL)isPointInPathWithX:(double)a3 y:(double)a4
{
  [(SUScriptObject *)self lock];
  v9.x = a3;
  v9.y = a4;
  BOOL v7 = CGContextPathContainsPoint(self->_context, v9, kCGPathStroke);
  [(SUScriptObject *)self unlock];
  return v7;
}

- (void)lineToX:(double)a3 y:(double)a4
{
  [(SUScriptObject *)self lock];
  memset(&v7, 0, sizeof(v7));
  CGContextGetCTM(&v7, self->_context);
  CGPathAddLineToPoint(self->_contextPath, &v7, a3, a4);
  CGContextAddLineToPoint(self->_context, a3, a4);
  [(SUScriptObject *)self unlock];
}

- (id)makeLinearGradientWithX0:(double)a3 y0:(double)a4 x1:(double)a5 y1:(double)a6
{
  id v6 = [[SUScriptGradient alloc] initLinearGradientWithX0:a3 y0:a4 x1:a5 y1:a6];

  return v6;
}

- (id)makeRadialGradientWithX0:(double)a3 y0:(double)a4 r0:(double)a5 x1:(double)a6 y1:(double)a7 r1:(double)a8
{
  id v8 = [[SUScriptGradient alloc] initRadialGraidentWithX0:a3 y0:a4 r0:a5 x1:a6 y1:a7 r1:a8];

  return v8;
}

- (void)moveToX:(double)a3 y:(double)a4
{
  [(SUScriptObject *)self lock];
  memset(&v7, 0, sizeof(v7));
  CGContextGetCTM(&v7, self->_context);
  CGPathMoveToPoint(self->_contextPath, &v7, a3, a4);
  CGContextMoveToPoint(self->_context, a3, a4);
  [(SUScriptObject *)self unlock];
}

- (void)quadraticCurveToCPX:(double)a3 cpy:(double)a4 x:(double)a5 y:(double)a6
{
  [(SUScriptObject *)self lock];
  memset(&v11, 0, sizeof(v11));
  CGContextGetCTM(&v11, self->_context);
  CGPathAddQuadCurveToPoint(self->_contextPath, &v11, a3, a4, a5, a6);
  CGContextAddQuadCurveToPoint(self->_context, a3, a4, a5, a6);
  [(SUScriptObject *)self unlock];
}

- (void)restoreState
{
  [(SUScriptObject *)self lock];
  CGContextRestoreGState(self->_context);

  [(SUScriptObject *)self unlock];
}

- (void)rotateWithAngle:(double)a3
{
  [(SUScriptObject *)self lock];
  CGContextRotateCTM(self->_context, a3);

  [(SUScriptObject *)self unlock];
}

- (void)saveState
{
  [(SUScriptObject *)self lock];
  CGContextSaveGState(self->_context);

  [(SUScriptObject *)self unlock];
}

- (void)scaleWithX:(double)a3 y:(double)a4
{
  [(SUScriptObject *)self lock];
  CGContextScaleCTM(self->_context, a3, a4);

  [(SUScriptObject *)self unlock];
}

- (void)setTransformWithM11:(double)a3 m12:(double)a4 m21:(double)a5 m22:(double)a6 dx:(double)a7 dy:(double)a8
{
}

- (void)transformWithM11:(double)a3 m12:(double)a4 m21:(double)a5 m22:(double)a6 dx:(double)a7 dy:(double)a8
{
  [(SUScriptObject *)self lock];
  context = self->_context;
  v16.a = a3;
  v16.b = a4;
  v16.c = a5;
  v16.d = a6;
  v16.tx = a7;
  v16.ty = a8;
  CGContextConcatCTM(context, &v16);
  [(SUScriptObject *)self unlock];
}

- (void)translateWithX:(double)a3 y:(double)a4
{
  [(SUScriptObject *)self lock];
  CGContextTranslateCTM(self->_context, a3, a4);

  [(SUScriptObject *)self unlock];
}

- (void)stroke
{
  [(SUScriptObject *)self lock];
  int64_t strokeStyleType = self->_strokeStyleType;
  if (strokeStyleType == 1)
  {
    v4 = (void *)[self->_strokeStyle copyNativeGradient];
    uint64_t v5 = [v4 copyShading];
    if (v5)
    {
      id v6 = (CGShading *)v5;
      CGContextSaveGState(self->_context);
      CGContextReplacePathWithStrokedPath(self->_context);
      CGContextClip(self->_context);
      CGContextDrawShading(self->_context, v6);
      CGContextRestoreGState(self->_context);
      CGShadingRelease(v6);
    }
  }
  else if (!strokeStyleType)
  {
    CGContextStrokePath(self->_context);
  }

  [(SUScriptObject *)self unlock];
}

- (void)strokeRectWithX:(double)a3 y:(double)a4 width:(double)a5 height:(double)a6
{
  [(SUScriptObject *)self lock];
  int64_t strokeStyleType = self->_strokeStyleType;
  if (strokeStyleType == 1)
  {
    CGRect v12 = (void *)[self->_strokeStyle copyNativeGradient];
    uint64_t v13 = [v12 copyShading];
    if (v13)
    {
      v14 = (CGShading *)v13;
      CGContextSaveGState(self->_context);
      v17.origin.x = a3;
      v17.origin.y = a4;
      v17.size.width = a5;
      v17.size.height = a6;
      CGContextAddRect(self->_context, v17);
      CGContextReplacePathWithStrokedPath(self->_context);
      CGContextClip(self->_context);
      CGContextDrawShading(self->_context, v14);
      CGContextRestoreGState(self->_context);
      CGShadingRelease(v14);
    }
  }
  else if (!strokeStyleType)
  {
    v16.origin.x = a3;
    v16.origin.y = a4;
    v16.size.width = a5;
    v16.size.height = a6;
    CGContextStrokeRect(self->_context, v16);
  }

  [(SUScriptObject *)self unlock];
}

- (id)_className
{
  return @"iTunesCanvas";
}

- (id)fillStyle
{
  [(SUScriptObject *)self lock];
  id v3 = self->_fillStyle;
  [(SUScriptObject *)self unlock];
  if (v3) {
    return v3;
  }
  uint64_t v5 = (void *)MEMORY[0x263EFF9D0];

  return (id)[v5 null];
}

- (double)globalAlpha
{
  [(SUScriptObject *)self lock];
  CGContextGetAlpha();
  double v4 = v3;
  [(SUScriptObject *)self unlock];
  return v4;
}

- (NSString)globalCompositeOperation
{
  [(SUScriptObject *)self lock];
  int CompositeOperation = CGContextGetCompositeOperation();
  [(SUScriptObject *)self unlock];
  if ((CompositeOperation - 1) > 0x10) {
    return (NSString *)@"source-over";
  }
  else {
    return &off_264813820[CompositeOperation - 1]->isa;
  }
}

- (double)height
{
  [(SUScriptObject *)self lock];
  double height = self->_height;
  [(SUScriptObject *)self unlock];
  return height;
}

- (id)lineCap
{
  [(SUScriptObject *)self lock];
  int LineCap = CGContextGetLineCap();
  [(SUScriptObject *)self unlock];
  double v4 = @"butt";
  if (LineCap == 2) {
    double v4 = @"square";
  }
  if (LineCap == 1) {
    return @"round";
  }
  else {
    return v4;
  }
}

- (id)lineJoin
{
  [(SUScriptObject *)self lock];
  int LineJoin = CGContextGetLineJoin();
  [(SUScriptObject *)self unlock];
  double v4 = @"miter";
  if (LineJoin == 1) {
    double v4 = @"round";
  }
  if (LineJoin == 2) {
    return @"bevel";
  }
  else {
    return v4;
  }
}

- (double)lineWidth
{
  [(SUScriptObject *)self lock];
  CGContextGetLineWidth();
  double v4 = v3;
  [(SUScriptObject *)self unlock];
  return v4;
}

- (double)miterLimit
{
  [(SUScriptObject *)self lock];
  CGContextGetMiterLimit();
  double v4 = v3;
  [(SUScriptObject *)self unlock];
  return v4;
}

- (void)setFillStyle:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [[SUScriptColor alloc] initWithStyleString:a3];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v5 = (SUScriptColor *)a3;
        int v7 = 0;
        int64_t v6 = 1;
        if (v5) {
          goto LABEL_6;
        }
      }
LABEL_13:
      [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
      CGAffineTransform v11 = 0;
      goto LABEL_14;
    }
    uint64_t v5 = (SUScriptColor *)a3;
  }
  int64_t v6 = 0;
  int v7 = 1;
  if (!v5) {
    goto LABEL_13;
  }
LABEL_6:
  CGRect v12 = v5;
  [(SUScriptObject *)self lock];
  fillStyle = (SUScriptColor *)self->_fillStyle;
  if (fillStyle != v12)
  {

    self->_fillStyle = v12;
    self->_int64_t fillStyleType = v6;
    if (v7)
    {
      CGPoint v9 = (CGColor *)[self->_fillStyle copyCGColor];
      if (v9)
      {
        v10 = v9;
        CGContextSetFillColorWithColor(self->_context, v9);
        CGColorRelease(v10);
      }
    }
  }
  [(SUScriptObject *)self unlock];
  CGAffineTransform v11 = v12;
LABEL_14:
}

- (void)setGlobalAlpha:(double)a3
{
  [(SUScriptObject *)self lock];
  CGContextSetAlpha(self->_context, a3);

  [(SUScriptObject *)self unlock];
}

- (void)setGlobalCompositeOperation:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (([a3 isEqualToString:@"copy"] & 1) == 0
      && ([a3 isEqualToString:@"destination-atop"] & 1) == 0
      && ([a3 isEqualToString:@"destination-in"] & 1) == 0
      && ([a3 isEqualToString:@"destination-out"] & 1) == 0
      && ([a3 isEqualToString:@"destination-over"] & 1) == 0
      && ([a3 isEqualToString:@"lighter"] & 1) == 0
      && ([a3 isEqualToString:@"source-in"] & 1) == 0
      && ([a3 isEqualToString:@"source-out"] & 1) == 0)
    {
      [a3 isEqualToString:@"xor"];
    }
    [(SUScriptObject *)self lock];
    CGContextSetCompositeOperation();
    [(SUScriptObject *)self unlock];
  }
  else
  {
    uint64_t v5 = (void *)MEMORY[0x263F1FA90];
    [v5 throwException:@"Invalid argument"];
  }
}

- (void)setLineCap:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([a3 isEqualToString:@"round"])
    {
      CGLineCap v5 = kCGLineCapRound;
    }
    else if ([a3 isEqualToString:@"square"])
    {
      CGLineCap v5 = kCGLineCapSquare;
    }
    else
    {
      CGLineCap v5 = kCGLineCapButt;
    }
    [(SUScriptObject *)self lock];
    CGContextSetLineCap(self->_context, v5);
    [(SUScriptObject *)self unlock];
  }
  else
  {
    int64_t v6 = (void *)MEMORY[0x263F1FA90];
    [v6 throwException:@"Invalid argument"];
  }
}

- (void)setLineJoin:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([a3 isEqualToString:@"bevel"]) {
      CGLineJoin v5 = kCGLineJoinBevel;
    }
    else {
      CGLineJoin v5 = [a3 isEqualToString:@"round"];
    }
    [(SUScriptObject *)self lock];
    CGContextSetLineJoin(self->_context, v5);
    [(SUScriptObject *)self unlock];
  }
  else
  {
    int64_t v6 = (void *)MEMORY[0x263F1FA90];
    [v6 throwException:@"Invalid argument"];
  }
}

- (void)setLineWidth:(double)a3
{
  [(SUScriptObject *)self lock];
  CGContextSetLineWidth(self->_context, a3);

  [(SUScriptObject *)self unlock];
}

- (void)setMiterLimit:(double)a3
{
  [(SUScriptObject *)self lock];
  CGContextSetMiterLimit(self->_context, a3);

  [(SUScriptObject *)self unlock];
}

- (void)setShadowBlur:(double)a3
{
  [(SUScriptObject *)self lock];
  self->_shadowBlur = a3;
  [(SUScriptCanvasContext *)self _ntsApplyShadow];

  [(SUScriptObject *)self unlock];
}

- (void)setShadowColor:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    CGLineJoin v5 = [[SUScriptColor alloc] initWithStyleString:a3];
  }
  else {
    CGLineJoin v5 = (SUScriptColor *)a3;
  }
  int v7 = v5;
  if (v5)
  {
    [(SUScriptObject *)self lock];
    shadowColor = self->_shadowColor;
    if (shadowColor != v7)
    {

      self->_shadowColor = v7;
    }
    [(SUScriptCanvasContext *)self _ntsApplyShadow];
    [(SUScriptObject *)self unlock];
  }
  else
  {
    [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
  }
}

- (void)setShadowOffsetX:(double)a3
{
  [(SUScriptObject *)self lock];
  self->_shadowOffsetX = a3;
  [(SUScriptCanvasContext *)self _ntsApplyShadow];

  [(SUScriptObject *)self unlock];
}

- (void)setShadowOffsetY:(double)a3
{
  [(SUScriptObject *)self lock];
  self->_shadowOffsetY = a3;
  [(SUScriptCanvasContext *)self _ntsApplyShadow];

  [(SUScriptObject *)self unlock];
}

- (void)setStrokeStyle:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    CGLineJoin v5 = [[SUScriptColor alloc] initWithStyleString:a3];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        CGLineJoin v5 = (SUScriptColor *)a3;
        int v7 = 0;
        int64_t v6 = 1;
        if (v5) {
          goto LABEL_6;
        }
      }
LABEL_13:
      [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
      CGAffineTransform v11 = 0;
      goto LABEL_14;
    }
    CGLineJoin v5 = (SUScriptColor *)a3;
  }
  int64_t v6 = 0;
  int v7 = 1;
  if (!v5) {
    goto LABEL_13;
  }
LABEL_6:
  CGRect v12 = v5;
  [(SUScriptObject *)self lock];
  strokeStyle = (SUScriptColor *)self->_strokeStyle;
  if (strokeStyle != v12)
  {

    self->_strokeStyle = v12;
    self->_int64_t strokeStyleType = v6;
    if (v7)
    {
      CGPoint v9 = (CGColor *)[self->_strokeStyle copyCGColor];
      if (v9)
      {
        v10 = v9;
        CGContextSetStrokeColorWithColor(self->_context, v9);
        CGColorRelease(v10);
      }
    }
  }
  [(SUScriptObject *)self unlock];
  CGAffineTransform v11 = v12;
LABEL_14:
}

- (double)shadowBlur
{
  [(SUScriptObject *)self lock];
  double shadowBlur = self->_shadowBlur;
  [(SUScriptObject *)self unlock];
  return shadowBlur;
}

- (id)shadowColor
{
  [(SUScriptObject *)self lock];
  double v3 = self->_shadowColor;
  [(SUScriptObject *)self unlock];
  return v3;
}

- (double)shadowOffsetX
{
  [(SUScriptObject *)self lock];
  double shadowOffsetX = self->_shadowOffsetX;
  [(SUScriptObject *)self unlock];
  return shadowOffsetX;
}

- (double)shadowOffsetY
{
  [(SUScriptObject *)self lock];
  double shadowOffsetY = self->_shadowOffsetY;
  [(SUScriptObject *)self unlock];
  return shadowOffsetY;
}

- (id)strokeStyle
{
  [(SUScriptObject *)self lock];
  id v3 = self->_strokeStyle;
  [(SUScriptObject *)self unlock];
  if (v3) {
    return v3;
  }
  CGLineJoin v5 = (void *)MEMORY[0x263EFF9D0];

  return (id)[v5 null];
}

- (double)width
{
  [(SUScriptObject *)self lock];
  double width = self->_width;
  [(SUScriptObject *)self unlock];
  return width;
}

- (void)_ntsApplyShadow
{
  shadowColor = self->_shadowColor;
  if (shadowColor && (double v4 = [(SUScriptColor *)shadowColor copyCGColor]) != 0)
  {
    CGLineJoin v5 = v4;
    CGContextSetShadowWithColor(self->_context, *(CGSize *)&self->_shadowOffsetX, self->_shadowBlur, v4);
    CGColorRelease(v5);
  }
  else
  {
    context = self->_context;
    double shadowOffsetX = self->_shadowOffsetX;
    double shadowOffsetY = self->_shadowOffsetY;
    double shadowBlur = self->_shadowBlur;
    CGContextSetShadow(context, *(CGSize *)&shadowOffsetX, shadowBlur);
  }
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result = (id)objc_msgSend((id)__KeyMapping_30, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptCanvasContext;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_24, 24);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptCanvasContext;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  v4.receiver = self;
  v4.super_class = (Class)SUScriptCanvasContext;
  v2 = [(SUScriptObject *)&v4 scriptAttributeKeys];
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", [(id)__KeyMapping_30 allKeys]);
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_24 = (uint64_t)sel_arcToX1_y1_x2_y2_radius_;
    unk_2681B4CD0 = @"arcTo";
    qword_2681B4CD8 = (uint64_t)sel_arcWithX_y_radius_startAngle_endAngle_antiClockwise_;
    unk_2681B4CE0 = @"arc";
    qword_2681B4CE8 = (uint64_t)sel_beginPath;
    unk_2681B4CF0 = @"beginPath";
    qword_2681B4CF8 = (uint64_t)sel_bezierCurveToCP1X_cp1y_cp2x_cp2y_x_y_;
    unk_2681B4D00 = @"bezierCurveTo";
    qword_2681B4D08 = (uint64_t)sel_clearRectWithX_y_width_height_;
    unk_2681B4D10 = @"clearRect";
    qword_2681B4D18 = (uint64_t)sel_clip;
    unk_2681B4D20 = @"clip";
    qword_2681B4D28 = (uint64_t)sel_closePath;
    unk_2681B4D30 = @"closePath";
    qword_2681B4D38 = (uint64_t)sel_fill;
    unk_2681B4D40 = @"fill";
    qword_2681B4D48 = (uint64_t)sel_fillRectWithX_y_width_height_;
    unk_2681B4D50 = @"fillRect";
    qword_2681B4D58 = (uint64_t)sel_isPointInPathWithX_y_;
    unk_2681B4D60 = @"isPointInPath";
    qword_2681B4D68 = (uint64_t)sel_lineToX_y_;
    unk_2681B4D70 = @"lineTo";
    qword_2681B4D78 = (uint64_t)sel_makeLinearGradientWithX0_y0_x1_y1_;
    unk_2681B4D80 = @"createLinearGradient";
    qword_2681B4D88 = (uint64_t)sel_makeRadialGradientWithX0_y0_r0_x1_y1_r1_;
    unk_2681B4D90 = @"createRadialGradient";
    qword_2681B4D98 = (uint64_t)sel_moveToX_y_;
    unk_2681B4DA0 = @"moveTo";
    qword_2681B4DA8 = (uint64_t)sel_quadraticCurveToCPX_cpy_x_y_;
    unk_2681B4DB0 = @"quadraticCurveTo";
    qword_2681B4DB8 = (uint64_t)sel_restoreState;
    unk_2681B4DC0 = @"restore";
    qword_2681B4DC8 = (uint64_t)sel_rotateWithAngle_;
    unk_2681B4DD0 = @"rotate";
    qword_2681B4DD8 = (uint64_t)sel_saveState;
    unk_2681B4DE0 = @"save";
    qword_2681B4DE8 = (uint64_t)sel_scaleWithX_y_;
    unk_2681B4DF0 = @"scale";
    qword_2681B4DF8 = (uint64_t)sel_setTransformWithM11_m12_m21_m22_dx_dy_;
    unk_2681B4E00 = @"setTransform";
    qword_2681B4E08 = (uint64_t)sel_stroke;
    unk_2681B4E10 = @"stroke";
    qword_2681B4E18 = (uint64_t)sel_strokeRectWithX_y_width_height_;
    unk_2681B4E20 = @"strokeRect";
    qword_2681B4E28 = (uint64_t)sel_transformWithM11_m12_m21_m22_dx_dy_;
    unk_2681B4E30 = @"transform";
    qword_2681B4E38 = (uint64_t)sel_translateWithX_y_;
    unk_2681B4E40 = @"translate";
    __KeyMapping_30 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", @"fillStyle", @"globalAlpha", @"globalAlpha", @"globalCompositeOperation", @"globalCompositeOperation", @"height", @"height", @"lineCap", @"lineCap", @"lineJoin", @"lineJoin", @"lineWidth", @"lineWidth", @"miterLimit", @"miterLimit", @"shadowBlur", @"shadowBlur",
                        @"shadowColor",
                        @"shadowColor",
                        @"shadowOffsetX",
                        @"shadowOffsetX",
                        @"shadowOffsetY",
                        @"shadowOffsetY",
                        @"strokeStyle",
                        @"strokeStyle",
                        @"width",
                        @"width",
                        0);
  }
}

@end