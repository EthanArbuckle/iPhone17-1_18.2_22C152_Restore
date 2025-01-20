@interface _UIVectorTextLayoutRun
- (BOOL)shouldRender;
- (CGRect)lineRect;
- (CGRect)usedLineRect;
- (CGRect)usedRunRect;
- (_NSRange)stringRange;
- (_UIVectorTextLayoutRun)initWithCTRun:(__CTRun *)a3 lineIndex:(unint64_t)a4 layoutInfo:(id)a5;
- (__CTRun)_CTRun;
- (double)baseline;
- (id)font;
- (id)string;
- (int64_t)glyphCount;
- (unint64_t)lineIndex;
- (void)_enumerateGlyphsUsingBlock:(id)a3;
- (void)dealloc;
- (void)enumerateGlyphsUsingBlock:(id)a3;
- (void)renderInContext:(CGContext *)a3;
- (void)setBaseline:(double)a3;
- (void)setLineRect:(CGRect)a3;
- (void)setUsedLineRect:(CGRect)a3;
- (void)setUsedRunRect:(CGRect)a3;
@end

@implementation _UIVectorTextLayoutRun

- (_UIVectorTextLayoutRun)initWithCTRun:(__CTRun *)a3 lineIndex:(unint64_t)a4 layoutInfo:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)_UIVectorTextLayoutRun;
  v10 = [(_UIVectorTextLayoutRun *)&v13 init];
  v11 = v10;
  if (v10)
  {
    v10->_lineIndex = a4;
    objc_storeStrong((id *)&v10->_layoutInfo, a5);
    if (a3)
    {
      v11->_runRef = a3;
      CFRetain(a3);
    }
  }

  return v11;
}

- (void)dealloc
{
  runRef = self->_runRef;
  if (runRef) {
    CFRelease(runRef);
  }
  v4.receiver = self;
  v4.super_class = (Class)_UIVectorTextLayoutRun;
  [(_UIVectorTextLayoutRun *)&v4 dealloc];
}

- (int64_t)glyphCount
{
  return self->_glyphCount;
}

- (_NSRange)stringRange
{
  runRef = self->_runRef;
  if (runRef)
  {
    CFRange StringRange = CTRunGetStringRange(runRef);
    NSUInteger length = StringRange.length;
    NSUInteger location = StringRange.location;
  }
  else
  {
    NSUInteger location = 0x7FFFFFFFFFFFFFFFLL;
    NSUInteger length = 0;
  }
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (id)string
{
  uint64_t v3 = [(_UIVectorTextLayoutRun *)self stringRange];
  v5 = 0;
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    NSUInteger v6 = v4;
    if (v4)
    {
      NSUInteger v7 = v3;
      v8 = [(_UIVectorTextLayoutInfo *)self->_layoutInfo parameters];
      id v9 = [v8 attributedText];
      v10 = [v9 string];

      v15.NSUInteger length = [v10 length];
      v14.NSUInteger location = v7;
      v14.NSUInteger length = v6;
      v15.NSUInteger location = 0;
      NSRange v11 = NSIntersectionRange(v14, v15);
      v5 = objc_msgSend(v10, "substringWithRange:", v11.location, v11.length);
    }
  }
  return v5;
}

- (id)font
{
  return (id)CTRunGetFont();
}

- (BOOL)shouldRender
{
  if (!self->_runRef || !CTRunGetFont()) {
    return 0;
  }
  return MEMORY[0x1F40DF600]();
}

- (void)renderInContext:(CGContext *)a3
{
  origins.x = 0.0;
  origins.y = 0.0;
  v5 = [(_UIVectorTextLayoutInfo *)self->_layoutInfo frame];
  v15.NSUInteger location = [(_UIVectorTextLayoutRun *)self lineIndex];
  v15.NSUInteger length = 1;
  CTFrameGetLineOrigins(v5, v15, &origins);
  memset(&v13, 0, sizeof(v13));
  layoutInfo = self->_layoutInfo;
  if (layoutInfo) {
    [(_UIVectorTextLayoutInfo *)layoutInfo coordinateAdjustment];
  }
  [(_UIVectorTextLayoutRun *)self usedRunRect];
  CGAffineTransform v12 = v13;
  CGRect v18 = CGRectApplyAffineTransform(v17, &v12);
  double height = v18.size.height;
  memset(&v12, 0, sizeof(v12));
  CGAffineTransformMakeTranslation(&v12, origins.x - v18.origin.x, origins.y - v18.origin.y);
  CGAffineTransform t1 = v12;
  CGAffineTransformTranslate(&transform, &t1, 0.0, v13.ty - height);
  CGAffineTransform v12 = transform;
  CGAffineTransform t1 = transform;
  CGAffineTransform t2 = v13;
  CGAffineTransformConcat(&transform, &t1, &t2);
  CGAffineTransform v12 = transform;
  CGContextSaveGState(a3);
  CGAffineTransform transform = v12;
  CGContextConcatCTM(a3, &transform);
  CTRunGetTextMatrix(&v8, self->_runRef);
  CGContextSetTextMatrix(a3, &v8);
  v16.NSUInteger location = 0;
  v16.NSUInteger length = 0;
  CTRunDraw(self->_runRef, a3, v16);
  CGContextRestoreGState(a3);
}

- (void)enumerateGlyphsUsingBlock:(id)a3
{
  id v4 = a3;
  uint64_t Font = CTRunGetFont();
  memset(&v11, 0, sizeof(v11));
  CGAffineTransformMakeScale(&v11, 1.0, -1.0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52___UIVectorTextLayoutRun_enumerateGlyphsUsingBlock___block_invoke;
  v7[3] = &unk_1E530F1A8;
  CGAffineTransform v10 = v11;
  id v8 = v4;
  uint64_t v9 = Font;
  id v6 = v4;
  [(_UIVectorTextLayoutRun *)self _enumerateGlyphsUsingBlock:v7];
}

- (void)_enumerateGlyphsUsingBlock:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void, char *, __n128, double, double, CGFloat, CGFloat, CGFloat))a3;
  uint64_t Font = CTRunGetFont();
  if (Font)
  {
    id v6 = (const __CTFont *)Font;
    [(_UIVectorTextLayoutInfo *)self->_layoutInfo scale];
    double v8 = v7;
    float64x2_t v32 = 0u;
    float64x2_t v33 = 0u;
    float64x2_t v31 = 0u;
    layoutInfo = self->_layoutInfo;
    if (layoutInfo) {
      [(_UIVectorTextLayoutInfo *)layoutInfo coordinateAdjustment];
    }
    uint64_t GlyphCount = CTRunGetGlyphCount(self->_runRef);
    MEMORY[0x1F4188790](GlyphCount);
    CGAffineTransform v12 = (CGGlyph *)((char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
    v35.NSUInteger location = 0;
    v35.NSUInteger length = 0;
    CTRunGetGlyphs(self->_runRef, v35, v12);
    MEMORY[0x1F4188790](v13);
    MEMORY[0x1F4188790](v14);
    v36.NSUInteger location = 0;
    v36.NSUInteger length = 0;
    CTRunGetPositions(self->_runRef, v36, (CGPoint *)&v26 - GlyphCount);
    CGRect BoundingRectsForGlyphs = CTFontGetBoundingRectsForGlyphs(v6, kCTFontOrientationDefault, v12, (CGRect *)&v26 - GlyphCount, GlyphCount);
    origins.double x = 0.0;
    origins.CGFloat y = 0.0;
    CFRange v15 = [(_UIVectorTextLayoutInfo *)self->_layoutInfo frame];
    v37.NSUInteger location = [(_UIVectorTextLayoutRun *)self lineIndex];
    v37.NSUInteger length = 1;
    CTFrameGetLineOrigins(v15, v37, &origins);
    char v29 = 0;
    if (GlyphCount < 1)
    {
      unint64_t v18 = 0;
    }
    else
    {
      unint64_t v18 = 0;
      v19 = &v26 - 2 * GlyphCount + 1;
      v20 = (double *)&v26 - 2 * GlyphCount + 1;
      do
      {
        CGRect v39 = *(CGRect *)(v19 - 1);
        *(double *)&long long v16 = *(v20 - 1) + origins.x;
        *(double *)&long long v17 = *v20 + origins.y;
        long long v26 = v16;
        long long v27 = v17;
        CGRect v40 = CGRectOffset(v39, *(CGFloat *)&v16, *(CGFloat *)&v17);
        v41.origin.double x = UIRectIntegralWithScale(v40.origin.x, v40.origin.y, v40.size.width, v40.size.height, v8);
        *(float64x2_t *)&v28.a = v31;
        *(float64x2_t *)&v28.c = v32;
        *(float64x2_t *)&v28.tdouble x = v33;
        CGRect v42 = CGRectApplyAffineTransform(v41, &v28);
        double x = v42.origin.x;
        CGFloat y = v42.origin.y;
        CGFloat width = v42.size.width;
        CGFloat height = v42.size.height;
        if (!v29)
        {
          __n128 v25 = (__n128)vaddq_f64(v33, vaddq_f64(vmulq_n_f64(v31, *(double *)&v26), vmulq_n_f64(v32, *(double *)&v27)));
          v4[2](v4, *v12, &v29, v25, v25.n128_f64[1], x, v42.origin.y, v42.size.width, v42.size.height);
        }
        v43.origin.double x = x;
        v43.origin.CGFloat y = y;
        v43.size.CGFloat width = width;
        v43.size.CGFloat height = height;
        v18 += !CGRectIsEmpty(v43);
        ++v12;
        v19 += 2;
        v20 += 2;
        --GlyphCount;
      }
      while (GlyphCount);
    }
    self->_glyphCount = v18;
  }
}

- (unint64_t)lineIndex
{
  return self->_lineIndex;
}

- (__CTRun)_CTRun
{
  return self->_runRef;
}

- (double)baseline
{
  return self->_baseline;
}

- (void)setBaseline:(double)a3
{
  self->_baseline = a3;
}

- (CGRect)lineRect
{
  double x = self->_lineRect.origin.x;
  double y = self->_lineRect.origin.y;
  double width = self->_lineRect.size.width;
  double height = self->_lineRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setLineRect:(CGRect)a3
{
  self->_lineRect = a3;
}

- (CGRect)usedLineRect
{
  double x = self->_usedLineRect.origin.x;
  double y = self->_usedLineRect.origin.y;
  double width = self->_usedLineRect.size.width;
  double height = self->_usedLineRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setUsedLineRect:(CGRect)a3
{
  self->_usedLineRect = a3;
}

- (CGRect)usedRunRect
{
  double x = self->_usedRunRect.origin.x;
  double y = self->_usedRunRect.origin.y;
  double width = self->_usedRunRect.size.width;
  double height = self->_usedRunRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setUsedRunRect:(CGRect)a3
{
  self->_usedRunRect = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutInfo, 0);
  objc_storeStrong((id *)&self->_sourceString, 0);
}

@end