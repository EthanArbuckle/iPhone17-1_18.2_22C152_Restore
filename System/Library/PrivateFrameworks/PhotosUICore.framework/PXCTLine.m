@interface PXCTLine
- (BOOL)isEndOfString;
- (BOOL)isTruncated;
- (CGAffineTransform)transform;
- (CGContext)context;
- (CGPath)createPath;
- (CGPoint)origin;
- (CGPoint)textPosition;
- (CGRect)contentBounds;
- (CGRect)imageBounds;
- (NSAttributedString)referenceAttributedString;
- (NSShadow)shadow;
- (NSString)string;
- (PXCTFrame)frame;
- (PXCTLine)init;
- (PXCTLine)initWithLine:(__CTLine *)a3 origin:(CGPoint)a4 frame:(id)a5 referenceAttributedString:(id)a6 truncated:(BOOL)a7;
- (_NSRange)stringRange;
- (__CTLine)line;
- (double)ascent;
- (double)ascentPosition;
- (double)baselinePosition;
- (double)descent;
- (double)descentPosition;
- (double)width;
- (id)description;
- (void)_transformBy:(CGAffineTransform *)a3;
- (void)dealloc;
- (void)draw;
- (void)prepare;
- (void)scaleBy:(double)a3;
- (void)scaleVerticallyBy:(double)a3;
- (void)translateHorizontallyBy:(double)a3;
- (void)translateVerticallyBy:(double)a3;
@end

@implementation PXCTLine

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadow, 0);
  objc_storeStrong((id *)&self->_referenceAttributedString, 0);
  objc_destroyWeak((id *)&self->_frame);
  objc_storeStrong((id *)&self->_string, 0);
}

- (NSShadow)shadow
{
  return self->_shadow;
}

- (CGContext)context
{
  return self->_context;
}

- (double)descent
{
  return self->_descent;
}

- (double)ascent
{
  return self->_ascent;
}

- (NSAttributedString)referenceAttributedString
{
  return self->_referenceAttributedString;
}

- (PXCTFrame)frame
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_frame);
  return (PXCTFrame *)WeakRetained;
}

- (CGPoint)origin
{
  double x = self->_origin.x;
  double y = self->_origin.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (__CTLine)line
{
  return self->_line;
}

- (CGAffineTransform)transform
{
  long long v3 = *(_OWORD *)&self[3].tx;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[3].c;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[4].a;
  return self;
}

- (BOOL)isEndOfString
{
  return self->_endOfString;
}

- (BOOL)isTruncated
{
  return self->_truncated;
}

- (NSString)string
{
  return self->_string;
}

- (_NSRange)stringRange
{
  NSUInteger length = self->_stringRange.length;
  NSUInteger location = self->_stringRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (id)description
{
  long long v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(PXCTLine *)self string];
  v6 = [v3 stringWithFormat:@"<%@ %p string='%@' CTLine=%@>", v4, self, v5, -[PXCTLine line](self, "line")];

  return v6;
}

- (void)_transformBy:(CGAffineTransform *)a3
{
  long long v4 = *(_OWORD *)&self->_transform.c;
  *(_OWORD *)&t1.a = *(_OWORD *)&self->_transform.a;
  *(_OWORD *)&t1.c = v4;
  *(_OWORD *)&t1.tdouble x = *(_OWORD *)&self->_transform.tx;
  long long v5 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v7.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v7.c = v5;
  *(_OWORD *)&v7.tdouble x = *(_OWORD *)&a3->tx;
  CGAffineTransformConcat(&v9, &t1, &v7);
  long long v6 = *(_OWORD *)&v9.c;
  *(_OWORD *)&self->_transform.a = *(_OWORD *)&v9.a;
  *(_OWORD *)&self->_transform.c = v6;
  *(_OWORD *)&self->_transform.tdouble x = *(_OWORD *)&v9.tx;
}

- (void)scaleVerticallyBy:(double)a3
{
  CGAffineTransformMakeScale(&v4, 1.0, a3);
  [(PXCTLine *)self _transformBy:&v4];
}

- (void)scaleBy:(double)a3
{
  CGAffineTransformMakeScale(&v4, a3, a3);
  [(PXCTLine *)self _transformBy:&v4];
}

- (void)translateVerticallyBy:(double)a3
{
  CGAffineTransformMakeTranslation(&v4, 0.0, a3);
  [(PXCTLine *)self _transformBy:&v4];
}

- (void)translateHorizontallyBy:(double)a3
{
  CGAffineTransformMakeTranslation(&v4, a3, 0.0);
  [(PXCTLine *)self _transformBy:&v4];
}

- (CGRect)imageBounds
{
  [(PXCTLine *)self origin];
  CGRect v7 = CGRectOffset(self->_imageBounds, v3, v4);
  long long v5 = *(_OWORD *)&self->_transform.c;
  *(_OWORD *)&v6.a = *(_OWORD *)&self->_transform.a;
  *(_OWORD *)&v6.c = v5;
  *(_OWORD *)&v6.tdouble x = *(_OWORD *)&self->_transform.tx;
  return CGRectApplyAffineTransform(v7, &v6);
}

- (CGRect)contentBounds
{
  [(PXCTLine *)self textPosition];
  [(PXCTLine *)self ascentPosition];
  [(PXCTLine *)self textPosition];
  [(PXCTLine *)self width];
  [(PXCTLine *)self descentPosition];
  PXRectWithEdges();
}

- (CGPoint)textPosition
{
  [(PXCTLine *)self origin];
  float64x2_t v5 = vaddq_f64(*(float64x2_t *)&self->_transform.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&self->_transform.c, v3), *(float64x2_t *)&self->_transform.a, v4));
  double v6 = v5.f64[1];
  result.double x = v5.f64[0];
  result.double y = v6;
  return result;
}

- (double)descentPosition
{
  [(PXCTLine *)self origin];
  return self->_transform.ty + (v3 - self->_descent) * self->_transform.d + self->_transform.b * v4;
}

- (double)baselinePosition
{
  [(PXCTLine *)self origin];
  return self->_transform.ty + v3 * self->_transform.d + self->_transform.b * v4;
}

- (double)ascentPosition
{
  [(PXCTLine *)self origin];
  return self->_transform.ty + (v3 + self->_ascent) * self->_transform.d + self->_transform.b * v4;
}

- (double)width
{
  v5.origin.double x = *(CGFloat *)MEMORY[0x1E4F1DB28];
  v5.origin.double y = *(CGFloat *)(MEMORY[0x1E4F1DB28] + 8);
  v5.size.height = *(CGFloat *)(MEMORY[0x1E4F1DB28] + 24);
  v5.size.width = self->_width;
  long long v2 = *(_OWORD *)&self->_transform.c;
  *(_OWORD *)&v4.a = *(_OWORD *)&self->_transform.a;
  *(_OWORD *)&v4.c = v2;
  *(_OWORD *)&v4.tdouble x = *(_OWORD *)&self->_transform.tx;
  CGRect v6 = CGRectApplyAffineTransform(v5, &v4);
  return v6.size.width;
}

- (CGPath)createPath
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  long long v3 = *(_OWORD *)&self->_transform.c;
  *(_OWORD *)&v30.a = *(_OWORD *)&self->_transform.a;
  *(_OWORD *)&v30.c = v3;
  *(_OWORD *)&v30.tdouble x = *(_OWORD *)&self->_transform.tx;
  [(PXCTLine *)self origin];
  CGAffineTransform m = v30;
  CGAffineTransformTranslate(&v30, &m, v4, v5);
  Mutable = CGPathCreateMutable();
  CFArrayRef GlyphRuns = CTLineGetGlyphRuns([(PXCTLine *)self line]);
  CFIndex v8 = 0;
  CGAffineTransform v9 = (const void *)*MEMORY[0x1E4F243F0];
  while (v8 < CFArrayGetCount(GlyphRuns))
  {
    ValueAtIndedouble x = (const __CTRun *)CFArrayGetValueAtIndex(GlyphRuns, v8);
    CFDictionaryRef Attributes = CTRunGetAttributes(ValueAtIndex);
    Value = (const __CTFont *)CFDictionaryGetValue(Attributes, v9);
    uint64_t GlyphCount = CTRunGetGlyphCount(ValueAtIndex);
    MEMORY[0x1F4188790](GlyphCount, v14);
    v16 = (CGGlyph *)((char *)&t2 - v15);
    MEMORY[0x1F4188790](v17, v18);
    v20 = (CGPoint *)((char *)&t2 - 16 * v19);
    v32.NSUInteger location = 0;
    v32.NSUInteger length = GlyphCount;
    CTRunGetGlyphs(ValueAtIndex, v32, v16);
    v33.NSUInteger location = 0;
    v33.NSUInteger length = GlyphCount;
    CTRunGetPositions(ValueAtIndex, v33, v20);
    if (GlyphCount >= 1)
    {
      p_double y = &v20->y;
      do
      {
        CGGlyph v22 = *v16++;
        PathForGlyph = CTFontCreatePathForGlyph(Value, v22, 0);
        CGFloat v24 = *(p_y - 1);
        CGFloat v25 = *p_y;
        memset(&m, 0, sizeof(m));
        CGAffineTransformMakeTranslation(&t1, v24, v25);
        CGAffineTransform t2 = v30;
        CGAffineTransformConcat(&m, &t1, &t2);
        CGPathAddPath(Mutable, &m, PathForGlyph);
        CGPathRelease(PathForGlyph);
        p_y += 2;
        --GlyphCount;
      }
      while (GlyphCount);
    }
    ++v8;
  }
  return Mutable;
}

- (void)draw
{
  long long v3 = [(PXCTLine *)self context];
  CGContextSaveGState(v3);
  long long v4 = *(_OWORD *)&self->_transform.c;
  *(_OWORD *)&v17.a = *(_OWORD *)&self->_transform.a;
  *(_OWORD *)&v17.c = v4;
  *(_OWORD *)&v17.tdouble x = *(_OWORD *)&self->_transform.tx;
  CGContextConcatCTM(v3, &v17);
  [(PXCTLine *)self origin];
  CGContextSetTextPosition(v3, v5, v6);
  CGContextSetShouldSmoothFonts(v3, 0);
  CGRect v7 = [(PXCTLine *)self shadow];
  CFIndex v8 = v7;
  if (v7)
  {
    [v7 shadowOffset];
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    [v8 shadowBlurRadius];
    CGFloat v14 = v13;
    id v15 = [v8 shadowColor];
    v16 = (CGColor *)[v15 CGColor];
    v18.width = v10;
    v18.height = v12;
    CGContextSetShadowWithColor(v3, v18, v14, v16);
  }
  CTLineDraw([(PXCTLine *)self line], v3);
  CGContextRestoreGState(v3);
}

- (void)prepare
{
  if (!self->_prepared)
  {
    self->_prepared = 1;
    long long v4 = [(PXCTLine *)self frame];
    CGFloat v5 = [v4 framesetter];

    if (!v5)
    {
      CGFloat v25 = [MEMORY[0x1E4F28B00] currentHandler];
      [v25 handleFailureInMethod:a2 object:self file:@"CoreText+PhotosUICore.m" lineNumber:249 description:@"missing framesetter"];
    }
    self->_context = (CGContext *)[v5 context];
    CGFloat v6 = [v5 shadow];
    shadow = self->_shadow;
    self->_shadow = v6;

    CFIndex v8 = [(PXCTLine *)self line];
    self->_width = CTLineGetTypographicBounds(v8, &self->_ascent, &self->_descent, 0);
    self->_imageBounds = CTLineGetImageBounds(v8, self->_context);
    double v9 = [(PXCTLine *)self frame];
    [v9 origin];
    CGFloat v11 = v10;
    CGFloat v13 = v12;

    CGAffineTransformMakeTranslation(&v26, v11, v13);
    long long v14 = *(_OWORD *)&v26.c;
    *(_OWORD *)&self->_transform.a = *(_OWORD *)&v26.a;
    *(_OWORD *)&self->_transform.c = v14;
    *(_OWORD *)&self->_transform.tdouble x = *(_OWORD *)&v26.tx;
    self->_stringRange = (_NSRange)CTLineGetStringRange(v8);
    id v15 = [(PXCTLine *)self referenceAttributedString];
    v16 = [v15 string];
    objc_msgSend(v16, "substringWithRange:", self->_stringRange.location, self->_stringRange.length);
    CGAffineTransform v17 = (NSString *)objc_claimAutoreleasedReturnValue();
    string = self->_string;
    self->_string = v17;

    if ([(PXCTLine *)self isTruncated])
    {
      uint64_t v19 = [(NSString *)self->_string stringByAppendingString:@"…"];
      v20 = self->_string;
      self->_string = v19;
    }
    if ([(PXCTLine *)self isTruncated])
    {
      self->_endOfString = 0;
    }
    else
    {
      uint64_t v21 = [(PXCTLine *)self stringRange];
      uint64_t v23 = v21 + v22;
      CGFloat v24 = [(PXCTLine *)self referenceAttributedString];
      self->_endOfString = v23 == [v24 length];
    }
  }
}

- (void)dealloc
{
  CFRelease(self->_line);
  v3.receiver = self;
  v3.super_class = (Class)PXCTLine;
  [(PXCTLine *)&v3 dealloc];
}

- (PXCTLine)initWithLine:(__CTLine *)a3 origin:(CGPoint)a4 frame:(id)a5 referenceAttributedString:(id)a6 truncated:(BOOL)a7
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  id v13 = a5;
  id v14 = a6;
  v17.receiver = self;
  v17.super_class = (Class)PXCTLine;
  id v15 = [(PXCTLine *)&v17 init];
  if (v15)
  {
    v15->_line = (__CTLine *)CFRetain(a3);
    v15->_origin.CGFloat x = x;
    v15->_origin.CGFloat y = y;
    objc_storeWeak((id *)&v15->_frame, v13);
    objc_storeStrong((id *)&v15->_referenceAttributedString, a6);
    v15->_truncated = a7;
  }

  return v15;
}

- (PXCTLine)init
{
  long long v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CoreText+PhotosUICore.m", 223, @"%s is not available as initializer", "-[PXCTLine init]");

  abort();
}

@end