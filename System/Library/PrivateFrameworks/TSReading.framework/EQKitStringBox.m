@interface EQKitStringBox
- (BOOL)appendOpticalAlignToSpec:(void *)a3 offset:(CGPoint)a4;
- (BOOL)isEqual:(id)a3;
- (CGColor)color;
- (CGRect)erasableBounds;
- (EQKitStringBox)init;
- (EQKitStringBox)initWithAttributedString:(id)a3 cgColor:(CGColor *)a4;
- (NSAttributedString)attributedString;
- (__CTLine)line;
- (double)depth;
- (double)height;
- (double)positionOfCharacterAtIndex:(unint64_t)a3;
- (double)width;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)dealloc;
- (void)p_cacheDimensions;
- (void)renderIntoContext:(CGContext *)a3 offset:(CGPoint)a4;
@end

@implementation EQKitStringBox

- (EQKitStringBox)initWithAttributedString:(id)a3 cgColor:(CGColor *)a4
{
  v9.receiver = self;
  v9.super_class = (Class)EQKitStringBox;
  v6 = [(EQKitStringBox *)&v9 init];
  if (v6)
  {
    v6->mAttributedString = (NSAttributedString *)[a3 copy];
    if (a4) {
      v7 = (CGColor *)CFRetain(a4);
    }
    else {
      v7 = 0;
    }
    v6->mCGColor = v7;
  }
  return v6;
}

- (EQKitStringBox)init
{
  return [(EQKitStringBox *)self initWithAttributedString:0 cgColor:0];
}

- (void)dealloc
{
  mLine = self->mLine;
  if (mLine) {
    CFRelease(mLine);
  }
  CGColorRelease(self->mCGColor);
  v4.receiver = self;
  v4.super_class = (Class)EQKitStringBox;
  [(EQKitStringBox *)&v4 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(EQKitStringBox *)self attributedString];
  mCGColor = self->mCGColor;

  return (id)[v4 initWithAttributedString:v5 cgColor:mCGColor];
}

- (BOOL)isEqual:(id)a3
{
  v3 = self;
  BOOL v4 = self == a3;
  LOBYTE(self) = self == a3;
  if (a3)
  {
    if (!v4)
    {
      LODWORD(self) = [a3 isMemberOfClass:objc_opt_class()];
      if (self)
      {
        v6 = [(EQKitStringBox *)v3 attributedString];
        self = (EQKitStringBox *)[a3 attributedString];
        if (v6 == self
          || (v7 = self, LOBYTE(self) = 0, v6)
          && v7
          && (LODWORD(self) = -[EQKitStringBox isEqualToAttributedString:](v6, "isEqualToAttributedString:"),
              self))
        {
          v8 = [(EQKitStringBox *)v3 color];
          objc_super v9 = (CGColor *)[a3 color];
          LOBYTE(self) = CGColorEqualToColor(v8, v9);
        }
      }
    }
  }
  return (char)self;
}

- (double)height
{
  if (!self->mDimensionsValid)
  {
    [(EQKitStringBox *)self p_cacheDimensions];
    self->mDimensionsValid = 1;
  }
  return self->mHeight;
}

- (double)depth
{
  if (!self->mDimensionsValid)
  {
    [(EQKitStringBox *)self p_cacheDimensions];
    self->mDimensionsValid = 1;
  }
  return self->mDepth;
}

- (double)width
{
  if (!self->mDimensionsValid)
  {
    [(EQKitStringBox *)self p_cacheDimensions];
    self->mDimensionsValid = 1;
  }
  return self->mWidth;
}

- (CGRect)erasableBounds
{
  if (!self->mDimensionsValid)
  {
    [(EQKitStringBox *)self p_cacheDimensions];
    self->mDimensionsValid = 1;
  }
  double x = self->mErasableBounds.origin.x;
  double y = self->mErasableBounds.origin.y;
  double width = self->mErasableBounds.size.width;
  double height = self->mErasableBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (__CTLine)line
{
  CGRect result = self->mLine;
  if (!result)
  {
    CGRect result = [(EQKitStringBox *)self attributedString];
    if (result) {
      CGRect result = CTLineCreateWithAttributedString(result);
    }
    self->mLine = result;
  }
  return result;
}

- (void)renderIntoContext:(CGContext *)a3 offset:(CGPoint)a4
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  v14.receiver = self;
  v14.super_class = (Class)EQKitStringBox;
  -[EQKitBox renderIntoContext:offset:](&v14, sel_renderIntoContext_offset_);
  if (a3)
  {
    v8 = [(EQKitStringBox *)self line];
    if (v8)
    {
      objc_super v9 = v8;
      if (self->mCGColor)
      {
        CGContextSaveGState(a3);
        CGContextSetFillColorWithColor(a3, self->mCGColor);
      }
      memset(&v13, 0, sizeof(v13));
      long long v10 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
      *(_OWORD *)&v12.a = *MEMORY[0x263F000D0];
      *(_OWORD *)&v12.c = v10;
      *(_OWORD *)&v12.tCGFloat x = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
      CGAffineTransformScale(&v13, &v12, 1.0, -1.0);
      CGAffineTransform v11 = v13;
      CGContextSetTextMatrix(a3, &v11);
      CGContextSetTextPosition(a3, x, y);
      CTLineDraw(v9, a3);
      if (self->mCGColor) {
        CGContextRestoreGState(a3);
      }
    }
  }
}

- (double)positionOfCharacterAtIndex:(unint64_t)a3
{
  v5 = [(EQKitStringBox *)self line];
  if (!v5) {
    return 0.0;
  }
  v6 = v5;
  if ([(NSAttributedString *)[(EQKitStringBox *)self attributedString] length] < a3) {
    return 0.0;
  }

  return CTLineGetOffsetForStringIndex(v6, a3, 0);
}

- (BOOL)appendOpticalAlignToSpec:(void *)a3 offset:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  uint64_t GlyphRuns = [(EQKitStringBox *)self line];
  if (GlyphRuns)
  {
    uint64_t GlyphRuns = (uint64_t)CTLineGetGlyphRuns((CTLineRef)GlyphRuns);
    CFArrayRef v8 = (const __CFArray *)GlyphRuns;
    if (GlyphRuns) {
      uint64_t GlyphRuns = CFArrayGetCount((CFArrayRef)GlyphRuns);
    }
  }
  else
  {
    CFArrayRef v8 = 0;
  }
  int v9 = *((_DWORD *)a3 + 6);
  if (v9 != 2)
  {
    if (!v9)
    {
      if (GlyphRuns >= 1
        && (ValueAtIndedouble x = (const __CTRun *)CFArrayGetValueAtIndex(v8, 0)) != 0
        && (CGAffineTransform v11 = ValueAtIndex, CTRunGetGlyphCount(ValueAtIndex) >= 1)
        && (CGGlyph buffer = 0,
            v25.location = 0,
            v25.length = 1,
            CTRunGetGlyphs(v11, v25, &buffer),
            (CFDictionaryRef Attributes = CTRunGetAttributes(v11)) != 0))
      {
        Value = (const __CTFont *)CFDictionaryGetValue(Attributes, (const void *)*MEMORY[0x263F039A0]);
        int v14 = 1;
        v26.location = 0;
        v26.length = 1;
        CTRunGetPositions(v11, v26, &v23);
        v29.double x = x + v23.x;
        v29.double y = y + v23.y;
        EQKit::OpticalKern::Spec::appendEntry((EQKit::OpticalKern::Spec *)a3, v29, Value, buffer);
      }
      else
      {
        int v14 = 0;
      }
      return v14 != 0;
    }
    return 0;
  }
  if (GlyphRuns < 1) {
    return 0;
  }
  v15 = (const __CTRun *)CFArrayGetValueAtIndex(v8, GlyphRuns - 1);
  if (!v15) {
    return 0;
  }
  v16 = v15;
  CFIndex GlyphCount = CTRunGetGlyphCount(v15);
  CFIndex v18 = GlyphCount - 1;
  if (GlyphCount < 1) {
    return 0;
  }
  CGGlyph buffer = 0;
  v27.location = GlyphCount - 1;
  v27.length = 1;
  CTRunGetGlyphs(v16, v27, &buffer);
  CFDictionaryRef v19 = CTRunGetAttributes(v16);
  BOOL v20 = v19 != 0;
  if (v19)
  {
    v21 = (const __CTFont *)CFDictionaryGetValue(v19, (const void *)*MEMORY[0x263F039A0]);
    v28.location = v18;
    v28.length = 1;
    CTRunGetPositions(v16, v28, &v23);
    v30.double x = x + v23.x;
    v30.double y = y + v23.y;
    EQKit::OpticalKern::Spec::appendEntry((EQKit::OpticalKern::Spec *)a3, v30, v21, buffer);
  }
  return v20;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  [(EQKitStringBox *)self height];
  uint64_t v6 = v5;
  [(EQKitStringBox *)self depth];
  uint64_t v8 = v7;
  [(EQKitStringBox *)self width];
  return (id)[v3 stringWithFormat:@"<%@ %p>: height=%f depth=%f width=%f attributedString=%@", v4, self, v6, v8, v9, -[EQKitStringBox attributedString](self, "attributedString")];
}

- (void)p_cacheDimensions
{
  self->mHeight = 0.0;
  self->mDepth = 0.0;
  self->mWidth = 0.0;
  p_mErasableBounds = &self->mErasableBounds;
  CGSize v4 = *(CGSize *)(MEMORY[0x263F001A8] + 16);
  self->mErasableBounds.origin = (CGPoint)*MEMORY[0x263F001A8];
  self->mErasableBounds.size = v4;
  uint64_t v5 = [(EQKitStringBox *)self line];
  if (v5)
  {
    uint64_t v6 = v5;
    FakeContext = (CGContext *)EQKitUtilGetFakeContext();
    CGRect ImageBounds = CTLineGetImageBounds(v6, FakeContext);
    CGFloat x = ImageBounds.origin.x;
    CGFloat y = ImageBounds.origin.y;
    CGFloat width = ImageBounds.size.width;
    CGFloat height = ImageBounds.size.height;
    double MaxY = CGRectGetMaxY(ImageBounds);
    v20.origin.CGFloat x = x;
    v20.origin.CGFloat y = y;
    v20.size.CGFloat width = width;
    v20.size.CGFloat height = height;
    double MinY = CGRectGetMinY(v20);
    double TypographicBounds = CTLineGetTypographicBounds(v6, 0, 0, 0);
    if (TypographicBounds > 0.0)
    {
      self->mHeight = MaxY;
      self->mDepth = -MinY;
      self->mWidth = TypographicBounds;
      v21.origin.CGFloat x = x;
      v21.origin.CGFloat y = y;
      v21.size.CGFloat width = width;
      v21.size.CGFloat height = height;
      CGFloat MinX = CGRectGetMinX(v21);
      v22.origin.CGFloat x = x;
      v22.origin.CGFloat y = y;
      v22.size.CGFloat width = width;
      v22.size.CGFloat height = height;
      CGFloat v16 = -CGRectGetMaxY(v22);
      v23.origin.CGFloat x = x;
      v23.origin.CGFloat y = y;
      v23.size.CGFloat width = width;
      v23.size.CGFloat height = height;
      CGFloat v17 = CGRectGetWidth(v23);
      v24.origin.CGFloat x = x;
      v24.origin.CGFloat y = y;
      v24.size.CGFloat width = width;
      v24.size.CGFloat height = height;
      CGFloat v18 = CGRectGetHeight(v24);
      p_mErasableBounds->origin.CGFloat x = MinX;
      p_mErasableBounds->origin.CGFloat y = v16;
      p_mErasableBounds->size.CGFloat width = v17;
      p_mErasableBounds->size.CGFloat height = v18;
    }
  }
}

- (NSAttributedString)attributedString
{
  return self->mAttributedString;
}

- (CGColor)color
{
  return self->mCGColor;
}

@end