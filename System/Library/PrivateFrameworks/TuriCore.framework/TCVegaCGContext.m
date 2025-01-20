@interface TCVegaCGContext
+ (CGAffineTransform)flipYAxisWithHeight:(SEL)a3;
+ (CGColor)newColorFromR:(unsigned int)a3 G:(unsigned int)a4 B:(unsigned int)a5 A:(unsigned int)a6;
+ (CGColor)newColorFromString:(id)a3;
- (BOOL)isPointInPathWithX:(double)a3 y:(double)a4;
- (CGContext)context;
- (JSValue)fillStyle;
- (NSString)font;
- (NSString)lineCap;
- (NSString)lineJoin;
- (NSString)strokeStyle;
- (NSString)textAlign;
- (TCVegaCGContext)init;
- (TCVegaCGContext)textWithString:(id)a3 x:(double)a4 y:(double)a5 drawingMode:(int)a6;
- (double)globalAlpha;
- (double)height;
- (double)lineDashOffset;
- (double)lineWidth;
- (double)miterLimit;
- (double)pixelRatio;
- (double)width;
- (id)createLinearGradientWithX0:(double)a3 y0:(double)a4 x1:(double)a5 y1:(double)a6;
- (id)measureText:(id)a3;
- (id)textAttributes;
- (void)arcWithX:(double)a3 y:(double)a4 radius:(double)a5 startAngle:(double)a6 endAngle:(double)a7 anticlockwise:(BOOL)a8;
- (void)beginPath;
- (void)bezierCurveToCP1x:(double)a3 cp1y:(double)a4 cp2x:(double)a5 cp2y:(double)a6 x:(double)a7 y:(double)a8;
- (void)clearRectWithX:(double)a3 y:(double)a4 w:(double)a5 h:(double)a6;
- (void)clip;
- (void)closePath;
- (void)dealloc;
- (void)fill;
- (void)fillRectWithX:(double)a3 y:(double)a4 width:(double)a5 height:(double)a6;
- (void)fillTextWithString:(id)a3 x:(double)a4 y:(double)a5;
- (void)lineToX:(double)a3 y:(double)a4;
- (void)moveToX:(double)a3 y:(double)a4;
- (void)rectWithX:(double)a3 y:(double)a4 width:(double)a5 height:(double)a6;
- (void)resizeWithWidth:(double)a3 height:(double)a4;
- (void)restore;
- (void)rotateWithAngle:(double)a3;
- (void)save;
- (void)setFillStyle:(id)a3;
- (void)setGlobalAlpha:(double)a3;
- (void)setHeight:(double)a3;
- (void)setLineCap:(id)a3;
- (void)setLineDashOffset:(double)a3;
- (void)setLineDashWithSegments:(id)a3;
- (void)setLineJoin:(id)a3;
- (void)setLineWidth:(double)a3;
- (void)setMiterLimit:(double)a3;
- (void)setPixelRatio:(double)a3;
- (void)setStrokeStyle:(id)a3;
- (void)setTextAlign:(id)a3;
- (void)setTransformWithA:(double)a3 b:(double)a4 c:(double)a5 d:(double)a6 e:(double)a7 f:(double)a8;
- (void)setWidth:(double)a3;
- (void)stroke;
- (void)strokeTextWithString:(id)a3 x:(double)a4 y:(double)a5;
- (void)translateWithX:(double)a3 y:(double)a4;
@end

@implementation TCVegaCGContext

- (CGContext)context
{
  return self->_bitmapContext;
}

+ (CGAffineTransform)flipYAxisWithHeight:(SEL)a3
{
  long long v5 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&v7.a = *MEMORY[0x263F000D0];
  *(_OWORD *)&v7.c = v5;
  *(_OWORD *)&v7.tx = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  CGAffineTransformTranslate(&v8, &v7, 0.0, a4);
  return CGAffineTransformScale(retstr, &v8, 1.0, -1.0);
}

- (void)resizeWithWidth:(double)a3 height:(double)a4
{
  double v5 = fmax(a3, 1.0);
  double v6 = fmax(a4, 1.0);
  uint64_t v7 = MEMORY[0x263F000D0];
  long long v8 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&self->_currentTransform.a = *MEMORY[0x263F000D0];
  *(_OWORD *)&self->_currentTransform.c = v8;
  *(_OWORD *)&self->_currentTransform.tx = *(_OWORD *)(v7 + 32);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  self->_bitmapContext = CGBitmapContextCreate(0, (unint64_t)v5, (unint64_t)v6, 8uLL, 0, DeviceRGB, 1u);
  CGColorSpaceRelease(DeviceRGB);
}

- (double)width
{
  bitmapContext = self->_bitmapContext;
  if (bitmapContext) {
    return (double)CGBitmapContextGetWidth(bitmapContext);
  }
  else {
    return 1.0;
  }
}

- (void)setWidth:(double)a3
{
  [(TCVegaCGContext *)self height];
  [(TCVegaCGContext *)self resizeWithWidth:a3 height:v5];
}

- (double)height
{
  bitmapContext = self->_bitmapContext;
  if (bitmapContext) {
    return (double)CGBitmapContextGetHeight(bitmapContext);
  }
  else {
    return 1.0;
  }
}

- (void)setHeight:(double)a3
{
  [(TCVegaCGContext *)self width];
  -[TCVegaCGContext resizeWithWidth:height:](self, "resizeWithWidth:height:");
}

- (TCVegaCGContext)init
{
  v3.receiver = self;
  v3.super_class = (Class)TCVegaCGContext;
  return [(TCVegaCGContext *)&v3 init];
}

- (void)dealloc
{
  CGContextRelease(self->_bitmapContext);
  v3.receiver = self;
  v3.super_class = (Class)TCVegaCGContext;
  [(TCVegaCGContext *)&v3 dealloc];
}

- (JSValue)fillStyle
{
  return self->_fillStyle;
}

- (void)setFillStyle:(id)a3
{
  id v15 = a3;
  p_fillStyle = (id *)&self->_fillStyle;
  objc_storeStrong((id *)&self->_fillStyle, a3);
  if ([(JSValue *)self->_fillStyle isObject]
    && ([*p_fillStyle toObject],
        double v6 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v6,
        (isKindOfClass & 1) != 0))
  {
    long long v8 = (void *)MEMORY[0x263F10390];
    v9 = [TCVegaCGLinearGradient alloc];
    v10 = [v15 toObject];
    v11 = [(TCVegaCGLinearGradient *)v9 initWithDictionary:v10];
    v12 = [v15 context];
    uint64_t v13 = [v8 valueWithObject:v11 inContext:v12];
    id v14 = *p_fillStyle;
    id *p_fillStyle = (id)v13;
  }
  else
  {
    [*p_fillStyle isString];
  }
}

- (id)textAttributes
{
  return 0;
}

- (NSString)font
{
  return self->_font;
}

- (double)globalAlpha
{
  return self->_globalAlpha;
}

- (void)setGlobalAlpha:(double)a3
{
  self->_double globalAlpha = a3;
  v4 = [(TCVegaCGContext *)self context];
  double globalAlpha = self->_globalAlpha;
  CGContextSetAlpha(v4, globalAlpha);
}

- (NSString)lineCap
{
  return self->_lineCap;
}

- (void)setLineCap:(id)a3
{
  id v6 = a3;
  objc_storeStrong((id *)&self->_lineCap, a3);
  if ([v6 isEqualToString:@"butt"])
  {
    CGLineCap v5 = kCGLineCapButt;
  }
  else if ([v6 isEqualToString:@"round"])
  {
    CGLineCap v5 = kCGLineCapRound;
  }
  else if ([v6 isEqualToString:@"square"])
  {
    CGLineCap v5 = kCGLineCapSquare;
  }
  else
  {
    CGLineCap v5 = kCGLineCapButt;
  }
  CGContextSetLineCap([(TCVegaCGContext *)self context], v5);
}

- (NSString)lineJoin
{
  return self->_lineJoin;
}

- (void)setLineJoin:(id)a3
{
  id v6 = a3;
  objc_storeStrong((id *)&self->_lineJoin, a3);
  if ([v6 isEqualToString:@"miter"])
  {
    CGLineJoin v5 = kCGLineJoinMiter;
  }
  else if ([v6 isEqualToString:@"round"])
  {
    CGLineJoin v5 = kCGLineJoinRound;
  }
  else if ([v6 isEqualToString:@"bevel"])
  {
    CGLineJoin v5 = kCGLineJoinBevel;
  }
  else
  {
    CGLineJoin v5 = kCGLineJoinMiter;
  }
  CGContextSetLineJoin([(TCVegaCGContext *)self context], v5);
}

- (double)lineWidth
{
  return self->_lineWidth;
}

- (void)setLineWidth:(double)a3
{
  self->_double lineWidth = a3;
  v4 = [(TCVegaCGContext *)self context];
  double lineWidth = self->_lineWidth;
  CGContextSetLineWidth(v4, lineWidth);
}

- (double)miterLimit
{
  return self->_miterLimit;
}

- (void)setMiterLimit:(double)a3
{
  self->_double miterLimit = a3;
  v4 = [(TCVegaCGContext *)self context];
  double miterLimit = self->_miterLimit;
  CGContextSetMiterLimit(v4, miterLimit);
}

- (NSString)strokeStyle
{
  return self->_strokeStyle;
}

- (BOOL)isPointInPathWithX:(double)a3 y:(double)a4
{
  id v6 = [(TCVegaCGContext *)self context];
  double v7 = a3;
  double v8 = a4;
  return CGContextPathContainsPoint(v6, *(CGPoint *)&v7, kCGPathFillStroke);
}

+ (CGColor)newColorFromR:(unsigned int)a3 G:(unsigned int)a4 B:(unsigned int)a5 A:(unsigned int)a6
{
  components[4] = *(CGFloat *)MEMORY[0x263EF8340];
  components[0] = (double)a3 / 255.0;
  components[1] = (double)a4 / 255.0;
  components[2] = (double)a5 / 255.0;
  components[3] = (double)a6 / 255.0;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  double v7 = CGColorCreate(DeviceRGB, components);
  CGColorSpaceRelease(DeviceRGB);
  return v7;
}

+ (CGColor)newColorFromString:(id)a3
{
  id v3 = a3;
  if ([v3 characterAtIndex:0] == 35)
  {
    v4 = [v3 substringFromIndex:1];

    if ([v4 length] == 3)
    {
      CGLineJoin v5 = objc_msgSend(v4, "substringWithRange:", 0, 1);
      id v6 = [v5 stringByAppendingString:v5];

      double v7 = objc_msgSend(v4, "substringWithRange:", 1, 1);
      double v8 = [v7 stringByAppendingString:v7];

      v9 = objc_msgSend(v4, "substringWithRange:", 2, 1);
      v10 = [v9 stringByAppendingString:v9];
    }
    else
    {
      uint64_t v47 = [v4 length];
      id v6 = objc_msgSend(v4, "substringWithRange:", 0, 2);
      double v8 = objc_msgSend(v4, "substringWithRange:", 2, 2);
      v10 = objc_msgSend(v4, "substringWithRange:", 4, 2);
      if (v47 != 6)
      {
        objc_msgSend(v4, "substringWithRange:", 6, 2);
        v48 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      }
    }
    v48 = @"ff";
LABEL_15:
    LODWORD(v54) = 0;
    uint64_t v56 = 0;
    unsigned int v55 = 0;
    v49 = [MEMORY[0x263F08B08] scannerWithString:v6];
    [v49 scanHexInt:&v54];

    v50 = [MEMORY[0x263F08B08] scannerWithString:v8];
    [v50 scanHexInt:(char *)&v56 + 4];

    v51 = [MEMORY[0x263F08B08] scannerWithString:v10];
    [v51 scanHexInt:&v56];

    v52 = [MEMORY[0x263F08B08] scannerWithString:v48];
    [v52 scanHexInt:&v55];

    v43 = (CGColor *)[(id)objc_opt_class() newColorFromR:LODWORD(v54) G:HIDWORD(v56) B:v56 A:v55];
    goto LABEL_16;
  }
  if ((unint64_t)[v3 length] >= 4)
  {
    v11 = [v3 substringToIndex:4];
    int v12 = objc_msgSend(v11, "isEqualToString:", @"rgb(");

    if (v12)
    {
      uint64_t v13 = [MEMORY[0x263F08708] whitespaceCharacterSet];
      v4 = [v3 stringByTrimmingCharactersInSet:v13];

      LODWORD(v54) = 0;
      uint64_t v56 = 0;
      id v6 = objc_msgSend(v4, "substringWithRange:", 4, objc_msgSend(v4, "length") - 5);
      double v8 = [v6 componentsSeparatedByString:@","];
      id v14 = (void *)MEMORY[0x263F08B08];
      id v15 = [v8 objectAtIndexedSubscript:0];
      v16 = [v14 scannerWithString:v15];
      [v16 scanInt:&v54];

      v17 = (void *)MEMORY[0x263F08B08];
      v18 = [v8 objectAtIndexedSubscript:1];
      v19 = [v17 scannerWithString:v18];
      [v19 scanInt:(char *)&v56 + 4];

      v20 = (void *)MEMORY[0x263F08B08];
      v21 = [v8 objectAtIndexedSubscript:2];
      v22 = [v20 scannerWithString:v21];
      [v22 scanInt:&v56];

      v23 = objc_opt_class();
      uint64_t v24 = LODWORD(v54);
      uint64_t v26 = v56;
      uint64_t v25 = HIDWORD(v56);
      uint64_t v27 = 255;
LABEL_10:
      v43 = (CGColor *)[v23 newColorFromR:v24 G:v25 B:v26 A:v27];
LABEL_16:

      goto LABEL_17;
    }
  }
  if ((unint64_t)[v3 length] >= 5)
  {
    v28 = [v3 substringToIndex:5];
    int v29 = objc_msgSend(v28, "isEqualToString:", @"rgba(");

    if (v29)
    {
      v30 = [MEMORY[0x263F08708] whitespaceCharacterSet];
      v4 = [v3 stringByTrimmingCharactersInSet:v30];

      uint64_t v56 = 0;
      unsigned int v55 = 0;
      double v54 = 0.0;
      id v6 = objc_msgSend(v4, "substringWithRange:", 5, objc_msgSend(v4, "length") - 6);
      double v8 = [v6 componentsSeparatedByString:@","];
      v31 = (void *)MEMORY[0x263F08B08];
      v32 = [v8 objectAtIndexedSubscript:0];
      v33 = [v31 scannerWithString:v32];
      [v33 scanInt:(char *)&v56 + 4];

      v34 = (void *)MEMORY[0x263F08B08];
      v35 = [v8 objectAtIndexedSubscript:1];
      v36 = [v34 scannerWithString:v35];
      [v36 scanInt:&v56];

      v37 = (void *)MEMORY[0x263F08B08];
      v38 = [v8 objectAtIndexedSubscript:2];
      v39 = [v37 scannerWithString:v38];
      [v39 scanInt:&v55];

      v40 = (void *)MEMORY[0x263F08B08];
      v41 = [v8 objectAtIndexedSubscript:3];
      v42 = [v40 scannerWithString:v41];
      [v42 scanDouble:&v54];

      v23 = objc_opt_class();
      uint64_t v25 = v56;
      uint64_t v24 = HIDWORD(v56);
      uint64_t v26 = v55;
      uint64_t v27 = (v54 * 255.0);
      goto LABEL_10;
    }
  }
  v44 = objc_opt_class();
  v45 = +[TCVegaCGColorMap map];
  v46 = [v45 objectForKey:v3];
  v43 = (CGColor *)[v44 newColorFromString:v46];

  v4 = v3;
LABEL_17:

  return v43;
}

- (void)setStrokeStyle:(id)a3
{
  v4 = (NSString *)a3;
  id v8 = [MEMORY[0x263F10378] currentArguments];
  strokeStyle = self->_strokeStyle;
  self->_strokeStyle = v4;
  id v6 = v4;

  double v7 = (CGColor *)[(id)objc_opt_class() newColorFromString:self->_strokeStyle];
  CGContextSetStrokeColorWithColor([(TCVegaCGContext *)self context], v7);
  CGColorRelease(v7);
}

- (NSString)textAlign
{
  return self->_textAlign;
}

- (void)setTextAlign:(id)a3
{
}

- (id)measureText:(id)a3
{
  v4 = (objc_class *)MEMORY[0x263F086A0];
  id v5 = a3;
  id v6 = [v4 alloc];
  double v7 = [(TCVegaCGContext *)self textAttributes];
  id v8 = (void *)[v6 initWithString:v5 attributes:v7];

  v9 = objc_alloc_init(TCVegaCGTextMetrics);
  [v8 size];
  -[TCVegaCGTextMetrics setWidth:](v9, "setWidth:");
  v10 = +[TCVegaLogProxy wrapObject:v9];

  return v10;
}

- (void)rotateWithAngle:(double)a3
{
  v4 = [(TCVegaCGContext *)self context];
  CGContextRotateCTM(v4, a3);
}

- (void)setTransformWithA:(double)a3 b:(double)a4 c:(double)a5 d:(double)a6 e:(double)a7 f:(double)a8
{
  self->_currentTransform.a = a3;
  self->_currentTransform.b = a4;
  self->_currentTransform.c = a5;
  self->_currentTransform.d = a6;
  self->_currentTransform.tx = a7;
  self->_currentTransform.ty = a8;
  v9 = [(TCVegaCGContext *)self context];
  long long v10 = *(_OWORD *)&self->_currentTransform.c;
  *(_OWORD *)&v11.a = *(_OWORD *)&self->_currentTransform.a;
  *(_OWORD *)&v11.c = v10;
  *(_OWORD *)&v11.tx = *(_OWORD *)&self->_currentTransform.tx;
  CGContextConcatCTM(v9, &v11);
}

- (void)restore
{
  v2 = [(TCVegaCGContext *)self context];
  CGContextRestoreGState(v2);
}

- (void)save
{
  v2 = [(TCVegaCGContext *)self context];
  CGContextSaveGState(v2);
}

- (void)clearRectWithX:(double)a3 y:(double)a4 w:(double)a5 h:(double)a6
{
  long long v10 = [(TCVegaCGContext *)self context];
  double v11 = a3;
  double v12 = a4;
  double v13 = a5;
  double v14 = a6;
  CGContextClearRect(v10, *(CGRect *)&v11);
}

- (void)translateWithX:(double)a3 y:(double)a4
{
  id v6 = [(TCVegaCGContext *)self context];
  CGContextTranslateCTM(v6, a3, a4);
}

- (void)arcWithX:(double)a3 y:(double)a4 radius:(double)a5 startAngle:(double)a6 endAngle:(double)a7 anticlockwise:(BOOL)a8
{
  BOOL v8 = a8;
  double v14 = [(TCVegaCGContext *)self context];
  CGContextAddArc(v14, a3, a4, a5, a6, a7, v8);
}

- (void)beginPath
{
  id v3 = [MEMORY[0x263F10378] currentArguments];
  CGContextBeginPath([(TCVegaCGContext *)self context]);
}

- (void)closePath
{
  id v3 = [MEMORY[0x263F10378] currentArguments];
  CGContextClosePath([(TCVegaCGContext *)self context]);
}

- (void)bezierCurveToCP1x:(double)a3 cp1y:(double)a4 cp2x:(double)a5 cp2y:(double)a6 x:(double)a7 y:(double)a8
{
  double v14 = [(TCVegaCGContext *)self context];
  CGContextAddCurveToPoint(v14, a3, a4, a5, a6, a7, a8);
}

- (void)moveToX:(double)a3 y:(double)a4
{
  id v6 = [(TCVegaCGContext *)self context];
  CGContextMoveToPoint(v6, a3, a4);
}

- (void)lineToX:(double)a3 y:(double)a4
{
  id v7 = [MEMORY[0x263F10378] currentArguments];
  CGContextAddLineToPoint([(TCVegaCGContext *)self context], a3, a4);
}

- (void)stroke
{
  id v4 = [MEMORY[0x263F10378] currentArguments];
  id v3 = CGContextCopyPath([(TCVegaCGContext *)self context]);
  CGContextStrokePath([(TCVegaCGContext *)self context]);
  CGContextAddPath([(TCVegaCGContext *)self context], v3);
  CGPathRelease(v3);
}

- (void)strokeTextWithString:(id)a3 x:(double)a4 y:(double)a5
{
}

- (void)fillTextWithString:(id)a3 x:(double)a4 y:(double)a5
{
}

- (TCVegaCGContext)textWithString:(id)a3 x:(double)a4 y:(double)a5 drawingMode:(int)a6
{
  id v10 = a3;
  CGContextSaveGState([(TCVegaCGContext *)self context]);
  id v11 = objc_alloc(MEMORY[0x263F086A0]);
  double v12 = [(TCVegaCGContext *)self textAttributes];
  CFAttributedStringRef attrString = (const __CFAttributedString *)[v11 initWithString:v10 attributes:v12];

  double v13 = CTLineCreateWithAttributedString(attrString);
  [(__CFAttributedString *)attrString size];
  double v15 = v14;
  if ([(NSString *)self->_textAlign isEqualToString:@"right"])
  {
    a4 = a4 - v15;
  }
  else if ([(NSString *)self->_textAlign isEqualToString:@"center"])
  {
    a4 = a4 + v15 * -0.5;
  }
  CGContextSetTextPosition([(TCVegaCGContext *)self context], a4, a5);
  CGContextSetTextDrawingMode([(TCVegaCGContext *)self context], (CGTextDrawingMode)a6);
  CTLineDraw(v13, [(TCVegaCGContext *)self context]);
  CGContextRestoreGState([(TCVegaCGContext *)self context]);
  CFRelease(v13);

  return result;
}

- (void)fillRectWithX:(double)a3 y:(double)a4 width:(double)a5 height:(double)a6
{
  [(TCVegaCGContext *)self rectWithX:a3 y:a4 width:a5 height:a6];
  [(TCVegaCGContext *)self fill];
}

- (void)rectWithX:(double)a3 y:(double)a4 width:(double)a5 height:(double)a6
{
  id v10 = [(TCVegaCGContext *)self context];
  double v11 = a3;
  double v12 = a4;
  double v13 = a5;
  double v14 = a6;
  CGContextAddRect(v10, *(CGRect *)&v11);
}

- (double)lineDashOffset
{
  return self->_lineDashOffset;
}

- (void)setLineDashOffset:(double)a3
{
  self->_lineDashOffset = a3;
}

- (void)setLineDashWithSegments:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  size_t v5 = [v4 count];
  id v6 = (const CGFloat *)((char *)v12 - ((8 * v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (v5)
  {
    uint64_t v7 = 0;
    do
    {
      BOOL v8 = [v4 objectAtIndexedSubscript:v7];
      [v8 doubleValue];
      v6[v7] = v9;

      ++v7;
    }
    while (v5 != v7);
  }
  id v10 = [(TCVegaCGContext *)self context];
  [(TCVegaCGContext *)self lineDashOffset];
  CGContextSetLineDash(v10, v11, v6, v5);
}

- (void)clip
{
  id v3 = [MEMORY[0x263F10378] currentArguments];
  CGContextClip([(TCVegaCGContext *)self context]);
}

- (void)fill
{
  id v3 = CGContextCopyPath([(TCVegaCGContext *)self context]);
  if ([(JSValue *)self->_fillStyle isString])
  {
    id v4 = objc_opt_class();
    size_t v5 = [(JSValue *)self->_fillStyle toString];
    id v6 = (CGColor *)[v4 newColorFromString:v5];

    CGContextSetFillColorWithColor([(TCVegaCGContext *)self context], v6);
    CGColorRelease(v6);
    CGContextFillPath([(TCVegaCGContext *)self context]);
  }
  else
  {
    uint64_t v7 = [(JSValue *)self->_fillStyle toObject];
    objc_msgSend(v7, "fillWithContext:", -[TCVegaCGContext context](self, "context"));
  }
  CGContextAddPath([(TCVegaCGContext *)self context], v3);
  CGPathRelease(v3);
}

- (id)createLinearGradientWithX0:(double)a3 y0:(double)a4 x1:(double)a5 y1:(double)a6
{
  id v6 = [[TCVegaCGLinearGradient alloc] initWithX0:a3 y0:a4 x1:a5 y1:a6];
  uint64_t v7 = (void *)MEMORY[0x263F10390];
  BOOL v8 = [MEMORY[0x263F10378] currentContext];
  CGFloat v9 = [v7 valueWithObject:v6 inContext:v8];

  return v9;
}

- (double)pixelRatio
{
  return self->pixelRatio;
}

- (void)setPixelRatio:(double)a3
{
  self->pixelRatio = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nsFont, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_textAlign, 0);
  objc_storeStrong((id *)&self->_strokeStyle, 0);
  objc_storeStrong((id *)&self->_lineJoin, 0);
  objc_storeStrong((id *)&self->_lineCap, 0);
  objc_storeStrong((id *)&self->_fillStyle, 0);
}

@end