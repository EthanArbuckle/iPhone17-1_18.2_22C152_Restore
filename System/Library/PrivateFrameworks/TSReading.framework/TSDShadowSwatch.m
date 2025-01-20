@interface TSDShadowSwatch
- (BOOL)isEqual:(id)a3;
- (TSDShadow)shadow;
- (TSDShadowSwatch)initWithShadow:(id)a3;
- (void)dealloc;
- (void)drawSwatchInRect:(CGRect)a3 inContext:(CGContext *)a4;
- (void)drawSwatchInRect:(CGRect)a3 inContext:(CGContext *)a4 forImage:(CGImage *)a5 swatchRect:(CGRect)a6 wantsStroke:(BOOL)a7;
- (void)p_drawContactShadowInContext:(CGContext *)a3 inRect:(CGRect)a4 forShadow:(id)a5 forImage:(CGImage *)a6 forSwatchRect:(CGRect)a7;
@end

@implementation TSDShadowSwatch

- (TSDShadowSwatch)initWithShadow:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TSDShadowSwatch;
  v4 = [(TSDShadowSwatch *)&v6 init];
  if (v4) {
    v4->mShadow = (TSDShadow *)a3;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSDShadowSwatch;
  [(TSDShadowSwatch *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  uint64_t v5 = [a3 shadow];
  mShadow = self->mShadow;
  if (mShadow == (TSDShadow *)v5) {
    return 1;
  }

  return -[TSDShadow isEqual:](mShadow, "isEqual:");
}

- (void)drawSwatchInRect:(CGRect)a3 inContext:(CGContext *)a4 forImage:(CGImage *)a5 swatchRect:(CGRect)a6 wantsStroke:(BOOL)a7
{
  BOOL v7 = a7;
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  double v14 = a3.size.height;
  double v15 = a3.size.width;
  double v16 = a3.origin.y;
  double v17 = a3.origin.x;
  uint64_t v37 = *MEMORY[0x263EF8340];
  CGContextSaveGState(a4);
  mShadow = self->mShadow;
  if (!mShadow)
  {
    v21 = (CGColor *)objc_msgSend((id)objc_msgSend(MEMORY[0x263F7C808], "blackColor"), "CGColor");
    CGContextSetStrokeColorWithColor(a4, v21);
    *(_OWORD *)lengths = xmmword_2238397D0;
    CGContextSetLineWidth(a4, 1.0);
    CGContextSetLineDash(a4, 0.0, lengths, 2uLL);
    v39.origin.double x = x;
    v39.origin.double y = y;
    v39.size.double width = width;
    v39.size.double height = height;
    CGContextStrokeRect(a4, v39);
    CGContextSetFillColorWithColor(a4, v21);
    v22 = (void *)[(id)TSDBundle() localizedStringForKey:@"None" value:&stru_26D688A48 table:@"TSDrawables"];
    UIGraphicsPushContext(a4);
    uint64_t v23 = [MEMORY[0x263F1C658] boldSystemFontOfSize:16.0];
    uint64_t v34 = *MEMORY[0x263F1C238];
    uint64_t v24 = v34;
    uint64_t v35 = v23;
    objc_msgSend(v22, "sizeWithAttributes:", objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1));
    *(float *)&double v25 = (width - v25) * 0.5;
    double v26 = x + floorf(*(float *)&v25);
    *(float *)&double v25 = (height - v27) * 0.5;
    uint64_t v32 = v24;
    uint64_t v33 = v23;
    objc_msgSend(v22, "drawAtPoint:withAttributes:", objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1), v26, y + floorf(*(float *)&v25));
    UIGraphicsPopContext();
    goto LABEL_12;
  }
  if ([(TSDShadow *)mShadow isContactShadow])
  {
    objc_opt_class();
    id v20 = (id)[(id)TSUDynamicCast() newShadowClampedForSwatches];
    CGContextSaveGState(a4);
    -[TSDShadowSwatch p_drawContactShadowInContext:inRect:forShadow:forImage:forSwatchRect:](self, "p_drawContactShadowInContext:inRect:forShadow:forImage:forSwatchRect:", a4, v20, a5, v17, v16, v15, v14, x, y, width, height);
    v38.origin.double x = x;
    v38.origin.double y = y;
    v38.size.double width = width;
    v38.size.double height = height;
    CGContextDrawImage(a4, v38, a5);
    CGContextRestoreGState(a4);
    if (!a5) {
      goto LABEL_11;
    }
    goto LABEL_8;
  }
  if ([(TSDShadow *)self->mShadow isDropShadow])
  {
    [(TSDShadow *)self->mShadow applyToContext:a4 viewScale:1 flipped:1.0];
    if (a5) {
      goto LABEL_8;
    }
LABEL_11:
    CGContextSetFillColorWithColor(a4, (CGColorRef)objc_msgSend((id)objc_msgSend(MEMORY[0x263F7C808], "lightGrayColor"), "CGColor"));
    v42.origin.double x = x;
    v42.origin.double y = y;
    v42.size.double width = width;
    v42.size.double height = height;
    CGContextFillRect(a4, v42);
    goto LABEL_12;
  }
  v30 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v31 = [NSString stringWithUTF8String:"-[TSDShadowSwatch drawSwatchInRect:inContext:forImage:swatchRect:wantsStroke:]"];
  objc_msgSend(v30, "handleFailureInFunction:file:lineNumber:description:", v31, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDShadowSwatch.m"), 79, @"-drawSwatchInRect: Invalid shadow type");
  if (!a5) {
    goto LABEL_11;
  }
LABEL_8:
  double v28 = x + 1.0;
  double v29 = y + 1.0;
  CGContextTranslateCTM(a4, 0.0, v14);
  CGContextScaleCTM(a4, 1.0, -1.0);
  v40.origin.double x = v28;
  v40.origin.double y = v29;
  v40.size.double width = width;
  v40.size.double height = height;
  CGContextDrawImage(a4, v40, a5);
  if (v7)
  {
    CGContextSetStrokeColorWithColor(a4, (CGColorRef)objc_msgSend((id)objc_msgSend(MEMORY[0x263F7C808], "colorWithWhite:alpha:", 0.0, 0.2), "CGColor"));
    v41.origin.double x = v28;
    v41.origin.double y = v29;
    v41.size.double width = width;
    v41.size.double height = height;
    CGContextStrokeRectWithWidth(a4, v41, 1.0);
  }
LABEL_12:
  CGContextRestoreGState(a4);
}

- (void)drawSwatchInRect:(CGRect)a3 inContext:(CGContext *)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v10 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F7C858], "imageNamed:inBundle:", @"TSD_ShadowSwatch", TSDBundle()), "CGImage");
  double v14 = TSDCenterRectOverRect(0.0, 0.0, 50.0, 50.0, x, y, width, height);

  -[TSDShadowSwatch drawSwatchInRect:inContext:forImage:swatchRect:wantsStroke:](self, "drawSwatchInRect:inContext:forImage:swatchRect:wantsStroke:", a4, v10, 1, x, y, width, height, v14, v11, v12, v13);
}

- (void)p_drawContactShadowInContext:(CGContext *)a3 inRect:(CGRect)a4 forShadow:(id)a5 forImage:(CGImage *)a6 forSwatchRect:(CGRect)a7
{
  double height = a7.size.height;
  double width = a7.size.width;
  double y = a7.origin.y;
  double x = a7.origin.x;
  double v13 = a4.size.height;
  double v14 = a4.size.width;
  double v15 = a4.origin.y;
  double v16 = a4.origin.x;
  objc_opt_class();
  v18 = (void *)TSUDynamicCast();
  if (!v18)
  {
    v19 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v20 = [NSString stringWithUTF8String:"-[TSDShadowSwatch p_drawContactShadowInContext:inRect:forShadow:forImage:forSwatchRect:]"];
    objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDShadowSwatch.m"), 155, @"invalid nil value for '%s'", "contactShadow");
  }
  v21 = TSDBitmapContextCreate(3, v14);
  CGContextTranslateCTM(v21, -v16, -v15);
  CGContextTranslateCTM(v21, 0.0, v13 * 0.5);
  v25.origin.double x = x;
  v25.origin.double y = y;
  v25.size.double width = width;
  v25.size.double height = height;
  CGContextDrawImage(v21, v25, a6);
  v22 = (CGImage *)objc_msgSend(v18, "newShadowImageFromContext:withSize:bounds:unflipped:", v21, 0, v14, v13, x, y, width, height);
  CGContextSaveGState(a3);
  CGContextTranslateCTM(a3, 0.0, v13 * -0.5);
  CGContextTranslateCTM(a3, 0.0, height);
  [a5 offset];
  CGContextTranslateCTM(a3, 0.0, v23);
  v26.origin.double x = v16;
  v26.origin.double y = v15;
  v26.size.double width = v14;
  v26.size.double height = v13;
  CGContextDrawImage(a3, v26, v22);
  CGContextRestoreGState(a3);
  CGImageRelease(v22);

  CGContextRelease(v21);
}

- (TSDShadow)shadow
{
  return self->mShadow;
}

@end