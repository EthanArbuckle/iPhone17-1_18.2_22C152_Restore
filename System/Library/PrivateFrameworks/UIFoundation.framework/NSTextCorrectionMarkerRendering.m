@interface NSTextCorrectionMarkerRendering
+ (CGColor)_colorForSpellType_iOS:(int64_t)a3;
+ (CGColor)colorForType:(int64_t)a3 font:(id)a4 dotSize:(double *)a5;
+ (CGRect)boundsForCorrectionMarkerOfType:(int64_t)a3 font:(id)a4 origin:(CGPoint)a5 width:(double)a6 originalWidth:(double)a7;
+ (id)textCorrectionAdjustmentAttributedString:(id)a3 range:(_NSRange)a4 glyphOrigin:(CGPoint)a5 yDelta:(double *)a6;
+ (int64_t)textCorrectionMarkerTypeWithAttributes:(id)a3;
+ (void)drawCorrectionMarkerOfType:(int64_t)a3 font:(id)a4 origin:(CGPoint)a5 width:(double)a6 cgContext:(CGContext *)a7;
+ (void)drawCorrectionMarkerOfType:(int64_t)a3 font:(id)a4 origin:(CGPoint)a5 width:(double)a6 graphicsContext:(id)a7;
+ (void)drawCorrectionMarkerOfType:(int64_t)a3 font:(id)a4 origin:(CGPoint)a5 width:(double)a6 originalWidth:(double)a7 cgContext:(CGContext *)a8;
+ (void)drawCorrectionMarkerOfType:(int64_t)a3 font:(id)a4 origin:(CGPoint)a5 width:(double)a6 originalWidth:(double)a7 graphicsContext:(id)a8;
@end

@implementation NSTextCorrectionMarkerRendering

+ (CGColor)_colorForSpellType_iOS:(int64_t)a3
{
  if (+[NSTextGraphicsContextProvider textGraphicsContextProviderClassRespondsToColorQuery])
  {
    v4 = (objc_class *)[(objc_class *)+[NSTextGraphicsContextProvider textGraphicsContextProviderClass] colorClassForApplicationFrameworkContext:1];
  }
  else
  {
    v4 = +[NSTextGraphicsContextProvider __defaultColorClass];
  }
  v5 = v4;
  if (a3 == 1 || a3 == 3)
  {
    v6 = (void *)[(objc_class *)v4 systemBlueColor];
  }
  else if (a3 == 2)
  {
    if (objc_opt_respondsToSelector()) {
      v6 = (void *)[(objc_class *)v5 textGrammarIndicatorColor];
    }
    else {
      v6 = (void *)[(objc_class *)v5 systemGreenColor];
    }
  }
  else
  {
    v6 = (void *)[(objc_class *)v4 systemRedColor];
  }

  return (CGColor *)[v6 CGColor];
}

+ (int64_t)textCorrectionMarkerTypeWithAttributes:(id)a3
{
  [a3 objectForKeyedSubscript:NSTemporaryTextCorrectionAttributeName];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return 3;
  }
  [a3 objectForKeyedSubscript:@"NSTextAlternatives"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return 1;
  }
  v5 = (void *)[a3 objectForKeyedSubscript:@"NSSpellingState"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (uint64_t v6 = [v5 integerValue]) == 0)
  {
    v7 = (void *)[a3 objectForKeyedSubscript:@"NSTextAlternativesDisplayStyle"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      return -1;
    }
    uint64_t v6 = [v7 integerValue];
    if (!v6) {
      return -1;
    }
  }
  if (v6 == 1) {
    return 1;
  }
  return 2 * (v6 == 3);
}

+ (CGColor)colorForType:(int64_t)a3 font:(id)a4 dotSize:(double *)a5
{
  if (!a4) {
    a4 = (id)NSDefaultFont();
  }
  [a4 pointSize];
  double v9 = 20.0;
  if (v8 >= 20.0)
  {
    double v9 = 40.0;
    if (v8 <= 40.0) {
      double v9 = v8;
    }
  }
  if (a5)
  {
    double v8 = ceil(v9 * 0.13247);
    *a5 = v8;
  }

  return (CGColor *)objc_msgSend(a1, "_colorForSpellType_iOS:", a3, v8, v9);
}

+ (void)drawCorrectionMarkerOfType:(int64_t)a3 font:(id)a4 origin:(CGPoint)a5 width:(double)a6 graphicsContext:(id)a7
{
}

+ (void)drawCorrectionMarkerOfType:(int64_t)a3 font:(id)a4 origin:(CGPoint)a5 width:(double)a6 originalWidth:(double)a7 graphicsContext:(id)a8
{
  if (a8)
  {
    double y = a5.y;
    double x = a5.x;
    double v25 = 0.0;
    uint64_t v13 = [a1 colorForType:a3 font:a4 dotSize:&v25];
    if (v13)
    {
      v14 = (CGColor *)v13;
      double v15 = v25 + 1.0;
      uint64_t v16 = vcvtmd_s64_f64((a7 + 1.0) / (v25 + 1.0));
      if (v16 <= 1) {
        uint64_t v16 = 1;
      }
      double v17 = (a7 + 1.0 - (double)v16 * v15) * 0.5;
      uint64_t v18 = vcvtmd_s64_f64((a6 + 1.0 + v17 * -2.0) / v15);
      if (v18 <= 1) {
        uint64_t v19 = 1;
      }
      else {
        uint64_t v19 = v18;
      }
      v20 = (CGContext *)[a8 CGContext];
      CGContextSetFillColorWithColor(v20, v14);
      CGContextBeginPath(v20);
      uint64_t v21 = 0;
      double v22 = y + 0.0;
      CGFloat v23 = v25;
      double v24 = x + v17;
      do
      {
        v26.origin.double x = v24 + (double)(int)v21 * (v25 + 1.0);
        v26.origin.double y = v22;
        v26.size.width = v23;
        v26.size.height = v23;
        CGContextAddEllipseInRect(v20, v26);
        ++v21;
      }
      while (v19 != v21);
      CGContextClosePath(v20);
      if (CGContextGetCompositeOperation() == 2)
      {
        CGContextFillPath(v20);
      }
      else
      {
        CGContextSetCompositeOperation();
        CGContextFillPath(v20);
        CGContextSetCompositeOperation();
      }
    }
  }
}

+ (CGRect)boundsForCorrectionMarkerOfType:(int64_t)a3 font:(id)a4 origin:(CGPoint)a5 width:(double)a6 originalWidth:(double)a7
{
  double y = a5.y;
  CGFloat x = a5.x;
  double v14 = 0.0;
  objc_msgSend(a1, "colorForType:font:dotSize:", a3, a4, &v14, a5.x, a5.y, a6, a7);
  double v10 = y + 0.0;
  double v11 = v14;
  double v12 = x;
  double v13 = a6;
  result.size.height = v11;
  result.size.width = v13;
  result.origin.double y = v10;
  result.origin.CGFloat x = v12;
  return result;
}

+ (void)drawCorrectionMarkerOfType:(int64_t)a3 font:(id)a4 origin:(CGPoint)a5 width:(double)a6 cgContext:(CGContext *)a7
{
  double y = a5.y;
  double x = a5.x;
  double v13 = [[_NSCGTextGraphicsContext alloc] initWithCGContext:a7];
  objc_msgSend(a1, "drawCorrectionMarkerOfType:font:origin:width:graphicsContext:", a3, a4, v13, x, y, a6);
}

+ (void)drawCorrectionMarkerOfType:(int64_t)a3 font:(id)a4 origin:(CGPoint)a5 width:(double)a6 originalWidth:(double)a7 cgContext:(CGContext *)a8
{
  double y = a5.y;
  double x = a5.x;
  double v15 = [[_NSCGTextGraphicsContext alloc] initWithCGContext:a8];
  objc_msgSend(a1, "drawCorrectionMarkerOfType:font:origin:width:originalWidth:graphicsContext:", a3, a4, v15, x, y, a6, a7);
}

+ (id)textCorrectionAdjustmentAttributedString:(id)a3 range:(_NSRange)a4 glyphOrigin:(CGPoint)a5 yDelta:(double *)a6
{
  double y = a5.y;
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  NSTypesetterBehavior v11 = +[NSTypesetter defaultTypesetterBehavior];
  uint64_t v27 = 0;
  v28 = (double *)&v27;
  uint64_t v29 = 0x2020000000;
  uint64_t v30 = 0;
  uint64_t v21 = 0;
  double v22 = &v21;
  uint64_t v23 = 0x3052000000;
  double v24 = __Block_byref_object_copy__16;
  double v25 = __Block_byref_object_dispose__16;
  uint64_t v26 = 0;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __101__NSTextCorrectionMarkerRendering_textCorrectionAdjustmentAttributedString_range_glyphOrigin_yDelta___block_invoke;
  v20[3] = &unk_1E55CDEB0;
  v20[5] = &v27;
  v20[6] = v11;
  v20[4] = &v21;
  objc_msgSend(a3, "enumerateAttribute:inRange:options:usingBlock:", @"NSFont", location, length, 0, v20);
  if (!v22[5])
  {
    double v12 = NSDefaultFont();
    v22[5] = (uint64_t)v12;
    [v12 ascender];
    *((void *)v28 + 3) = v13;
  }
  if (a6)
  {
    double v14 = v28[3];
    double v15 = v14 - y;
    BOOL v16 = y < v14;
    double v17 = 0.0;
    if (v16) {
      double v17 = v15;
    }
    *a6 = v17;
  }
  uint64_t v18 = (void *)v22[5];
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);
  return v18;
}

uint64_t __101__NSTextCorrectionMarkerRendering_textCorrectionAdjustmentAttributedString_range_glyphOrigin_yDelta___block_invoke(uint64_t a1, void *a2)
{
  objc_opt_class();
  uint64_t result = objc_opt_isKindOfClass();
  if (result)
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    if (*(void *)(v5 + 40))
    {
      [a2 pointSize];
      double v7 = v6;
      [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) pointSize];
      if (v7 <= v8) {
        goto LABEL_6;
      }
      uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    }
    *(void *)(v5 + 40) = a2;
LABEL_6:
    uint64_t result = [a2 ascender];
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    if (v9 > *(double *)(v10 + 24)) {
      *(double *)(v10 + 24) = v9;
    }
  }
  return result;
}

@end