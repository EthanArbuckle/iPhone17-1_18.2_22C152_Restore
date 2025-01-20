@interface PKCurvedTextLabel
- (BOOL)interior;
- (CGPoint)_offsetOfBoundingRect:(CGRect)a3 inRect:(CGRect)a4;
- (CGRect)_glyphsBoundingRect;
- (CGRect)textBoundingRect;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSDictionary)textAttributes;
- (PKCurvedTextLabel)init;
- (PKCurvedTextLabel)initWithFrame:(CGRect)a3;
- (_NSRange)_drawableCharacterRange:(_NSRange *)a3;
- (__CTLine)_newLineFromDrawableTextStorage;
- (double)_distance;
- (double)centerAngle;
- (double)circleRadius;
- (double)linearWidth;
- (double)maxAngularWidth;
- (id)attributedText;
- (id)font;
- (id)text;
- (id)textColor;
- (void)_enumerateTransformsForDrawableCharacters:(id)a3;
- (void)_updateMaxSize;
- (void)_updateTextColor;
- (void)drawTextInRect:(CGRect)a3;
- (void)invalidateCachedSize;
- (void)setAttributedText:(id)a3;
- (void)setCenterAngle:(double)a3;
- (void)setCircleRadius:(double)a3;
- (void)setFont:(id)a3;
- (void)setInterior:(BOOL)a3;
- (void)setMaxAngularWidth:(double)a3;
- (void)setText:(id)a3;
- (void)setTextColor:(id)a3;
@end

@implementation PKCurvedTextLabel

- (PKCurvedTextLabel)init
{
  return -[PKCurvedTextLabel initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
}

- (PKCurvedTextLabel)initWithFrame:(CGRect)a3
{
  v13.receiver = self;
  v13.super_class = (Class)PKCurvedTextLabel;
  v3 = -[PKCurvedTextLabel initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (NSTextContainer *)objc_alloc_init(MEMORY[0x1E4FB0880]);
    textContainer = v3->_textContainer;
    v3->_textContainer = v4;

    [(NSTextContainer *)v3->_textContainer setMaximumNumberOfLines:1];
    [(NSTextContainer *)v3->_textContainer setLineFragmentPadding:0.0];
    [(NSTextContainer *)v3->_textContainer setLineBreakMode:4];
    v6 = (NSLayoutManager *)objc_alloc_init(MEMORY[0x1E4FB0840]);
    layoutManager = v3->_layoutManager;
    v3->_layoutManager = v6;

    [(NSLayoutManager *)v3->_layoutManager addTextContainer:v3->_textContainer];
    v8 = (NSTextStorage *)objc_alloc_init(MEMORY[0x1E4FB08B8]);
    textStorage = v3->_textStorage;
    v3->_textStorage = v8;

    [(NSTextStorage *)v3->_textStorage addLayoutManager:v3->_layoutManager];
    uint64_t v10 = [MEMORY[0x1E4FB1618] whiteColor];
    textColor = v3->_textColor;
    v3->_textColor = (UIColor *)v10;
  }
  return v3;
}

- (NSDictionary)textAttributes
{
  v2 = [(PKCurvedTextLabel *)self attributedText];
  uint64_t v3 = [v2 length];
  if (v3)
  {
    v4 = objc_msgSend(v2, "attributesAtIndex:longestEffectiveRange:inRange:", 0, 0, 0, v3);
  }
  else
  {
    v4 = 0;
  }

  return (NSDictionary *)v4;
}

- (void)setInterior:(BOOL)a3
{
  if (self->_interior != a3)
  {
    self->_interior = a3;
    [(PKCurvedTextLabel *)self invalidateCachedSize];
    [(PKCurvedTextLabel *)self setNeedsLayout];
    [(PKCurvedTextLabel *)self setNeedsDisplay];
  }
}

- (void)setCircleRadius:(double)a3
{
  if (self->_circleRadius != a3)
  {
    self->_circleRadius = a3;
    [(PKCurvedTextLabel *)self invalidateCachedSize];
    [(PKCurvedTextLabel *)self _updateMaxSize];
    [(PKCurvedTextLabel *)self setNeedsLayout];
    [(PKCurvedTextLabel *)self setNeedsDisplay];
  }
}

- (void)setCenterAngle:(double)a3
{
  if (self->_centerAngle != a3)
  {
    self->_centerAngle = a3;
    [(PKCurvedTextLabel *)self invalidateCachedSize];
    [(PKCurvedTextLabel *)self setNeedsLayout];
    [(PKCurvedTextLabel *)self setNeedsDisplay];
  }
}

- (void)setMaxAngularWidth:(double)a3
{
  long double v5 = fmod(a3, 6.28318531);
  if (a3 <= 6.28318531) {
    long double v5 = a3;
  }
  if (self->_maxAngularWidth != v5)
  {
    self->_maxAngularWidth = v5;
    [(PKCurvedTextLabel *)self _updateMaxSize];
  }
}

- (double)linearWidth
{
  return self->_textWidth;
}

- (void)_updateMaxSize
{
  double maxAngularWidth = self->_maxAngularWidth;
  if (maxAngularWidth == 0.0 || (double circleRadius = self->_circleRadius, circleRadius == 0.0))
  {
    double v5 = 1.79769313e308;
  }
  else
  {
    if (maxAngularWidth > 3.14159265) {
      double maxAngularWidth = 6.28318531 - maxAngularWidth;
    }
    double v5 = maxAngularWidth * circleRadius;
  }
  [(NSTextContainer *)self->_textContainer size];
  if (v6 != v5 || self->_textWidth != v5)
  {
    -[NSTextContainer setSize:](self->_textContainer, "setSize:", v5, 1.79769313e308);
    self->_textWidth = v5;
    [(PKCurvedTextLabel *)self invalidateCachedSize];
    [(PKCurvedTextLabel *)self setNeedsLayout];
    [(PKCurvedTextLabel *)self setNeedsDisplay];
  }
}

- (void)setTextColor:(id)a3
{
  id v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_textColor, a3);
    [(PKCurvedTextLabel *)self _updateTextColor];
  }
}

- (void)_updateTextColor
{
  uint64_t v3 = [(NSTextStorage *)self->_textStorage length];
  if (v3)
  {
    -[NSTextStorage addAttribute:value:range:](self->_textStorage, "addAttribute:value:range:", *MEMORY[0x1E4FB0700], self->_textColor, 0, v3);
    [(PKCurvedTextLabel *)self setNeedsDisplay];
  }
}

- (id)textColor
{
  return self->_textColor;
}

- (void)setAttributedText:(id)a3
{
  id v4 = a3;
  if (([v4 isEqualToAttributedString:self->_textStorage] & 1) == 0)
  {
    if (!v4) {
      goto LABEL_11;
    }
    uint64_t v5 = [v4 length];
    uint64_t v6 = 0;
    v7 = 0;
    while (1)
    {
      v8 = [v4 string];
      v9 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
      uint64_t v10 = objc_msgSend(v8, "rangeOfCharacterFromSet:options:range:", v9, 0, v6, v5);
      uint64_t v12 = v11;

      if (v10 == 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      if (v7)
      {

        v7 = 0;
      }
      else
      {
        v7 = (void *)[v4 mutableCopy];
      }
      objc_super v13 = [v7 mutableString];
      objc_msgSend(v13, "replaceCharactersInRange:withString:", v10, v12, @" ");

      uint64_t v6 = v10 + 1;
      uint64_t v5 = [v4 length] - v6;
    }
    if (v7)
    {
      id v14 = v7;
      v15 = v14;
    }
    else
    {
LABEL_11:
      v16 = (void *)[v4 mutableCopy];
      v17 = v16;
      if (v16) {
        id v18 = v16;
      }
      else {
        id v18 = (id)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:&stru_1EF1B5B50];
      }
      v15 = v18;

      id v14 = 0;
    }
    uint64_t v19 = *MEMORY[0x1E4FB0738];
    if (qword_1E94C4298 != -1) {
      dispatch_once(&qword_1E94C4298, &__block_literal_global_55);
    }
    id v20 = (id)_MergedGlobals_1_6;
    objc_msgSend(v15, "addAttribute:value:range:", v19, v20, 0, objc_msgSend(v15, "length"));

    [(NSTextStorage *)self->_textStorage setAttributedString:v15];
    uint64_t v25 = 0;
    v26 = &v25;
    uint64_t v27 = 0x2020000000;
    char v28 = 0;
    textStorage = self->_textStorage;
    uint64_t v22 = [(NSTextStorage *)textStorage length];
    uint64_t v23 = *MEMORY[0x1E4FB06F8];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __39__PKCurvedTextLabel_setAttributedText___block_invoke;
    v24[3] = &unk_1E59D02F0;
    v24[4] = &v25;
    -[NSTextStorage enumerateAttribute:inRange:options:usingBlock:](textStorage, "enumerateAttribute:inRange:options:usingBlock:", v23, 0, v22, 0, v24);
    self->_hasMonospacedNumbers = *((unsigned char *)v26 + 24);
    [(PKCurvedTextLabel *)self _updateTextColor];
    [(PKCurvedTextLabel *)self invalidateCachedSize];
    [(PKCurvedTextLabel *)self setNeedsDisplay];
    [(PKCurvedTextLabel *)self setNeedsLayout];
    _Block_object_dispose(&v25, 8);
  }
}

void __39__PKCurvedTextLabel_setAttributedText___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a2 fontDescriptor];
  uint64_t v6 = [v5 objectForKey:*MEMORY[0x1E4FB0910]];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v21;
    uint64_t v11 = *MEMORY[0x1E4FB0968];
    uint64_t v12 = *MEMORY[0x1E4FB0960];
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        id v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        v15 = [v14 objectForKeyedSubscript:v11];
        if ([v15 isEqualToNumber:&unk_1EF2B8CE8])
        {
          v16 = [v14 objectForKeyedSubscript:v12];
          int v17 = [v16 isEqualToNumber:&unk_1EF2B8D00];

          if (v17)
          {
            *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
            *a5 = 1;
            goto LABEL_12;
          }
        }
        else
        {
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }
LABEL_12:
}

- (id)attributedText
{
  return self->_textStorage;
}

- (void)setText:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v4 = (objc_class *)MEMORY[0x1E4F28B18];
    id v5 = a3;
    id v6 = [v4 alloc];
    font = self->_font;
    uint64_t v10 = *MEMORY[0x1E4FB06F8];
    v11[0] = font;
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    uint64_t v9 = (void *)[v6 initWithString:v5 attributes:v8];
  }
  else
  {
    uint64_t v9 = 0;
  }
  [(PKCurvedTextLabel *)self setAttributedText:v9];
}

- (id)text
{
  return (id)[(NSTextStorage *)self->_textStorage string];
}

- (void)setFont:(id)a3
{
  id v6 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_font, a3);
    id v5 = [(PKCurvedTextLabel *)self text];
    [(PKCurvedTextLabel *)self setText:v5];

    [(PKCurvedTextLabel *)self invalidateCachedSize];
  }
}

- (id)font
{
  return self->_font;
}

- (void)invalidateCachedSize
{
  self->_cachedSizeIsValid = 0;
  self->_cachedSize = (CGSize)*MEMORY[0x1E4F1DB30];
  CGPoint v2 = (CGPoint)*MEMORY[0x1E4F1DB28];
  CGSize v3 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
  self->_cachedBounds.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
  self->_cachedBounds.size = v3;
  self->_cachedGlyphsBoundingRect.origin = v2;
  self->_cachedGlyphsBoundingRect.size = v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  p_cachedSize = &self->_cachedSize;
  if (self->_cachedSizeIsValid)
  {
    double width = p_cachedSize->width;
    double height = self->_cachedSize.height;
  }
  else
  {
    [(PKCurvedTextLabel *)self _glyphsBoundingRect];
    double width = v7;
    double height = v8;
    p_cachedSize->double width = v7;
    p_cachedSize->double height = v8;
    self->_cachedSizeIsValid = 1;
  }
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)drawTextInRect:(CGRect)a3
{
  [(PKCurvedTextLabel *)self _glyphsBoundingRect];
  -[PKCurvedTextLabel _offsetOfBoundingRect:inRect:](self, "_offsetOfBoundingRect:inRect:");
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  double v8 = [(PKCurvedTextLabel *)self _newLineFromDrawableTextStorage];
  CGRect ImageBounds = CTLineGetImageBounds(v8, 0);
  CGFloat x = ImageBounds.origin.x;
  CGFloat y = ImageBounds.origin.y;
  CFRelease(v8);
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3010000000;
  v14[3] = "";
  CGFloat v15 = x;
  CGFloat v16 = y;
  if (self->_hasMonospacedNumbers) {
    CGFloat v15 = 0.0;
  }
  CurrentContext = UIGraphicsGetCurrentContext();
  CGAffineTransformMakeTranslation(&transform, v5, v7);
  CGContextConcatCTM(CurrentContext, &transform);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __36__PKCurvedTextLabel_drawTextInRect___block_invoke;
  v12[3] = &unk_1E59D0318;
  v12[4] = self;
  v12[5] = v14;
  v12[6] = CurrentContext;
  [(PKCurvedTextLabel *)self _enumerateTransformsForDrawableCharacters:v12];
  _Block_object_dispose(v14, 8);
}

void __36__PKCurvedTextLabel_drawTextInRect___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, double a5, double a6)
{
  CGContextSaveGState(*(CGContextRef *)(a1 + 48));
  uint64_t v12 = *(CGContext **)(a1 + 48);
  long long v13 = a4[1];
  *(_OWORD *)&v14.a = *a4;
  *(_OWORD *)&v14.c = v13;
  *(_OWORD *)&v14.tCGFloat x = a4[2];
  CGContextConcatCTM(v12, &v14);
  if (a2 != 0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 808), "drawGlyphsForGlyphRange:atPoint:", a2, a3, -a5 - *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 32), -a6);
  }
  CGContextRestoreGState(*(CGContextRef *)(a1 + 48));
}

- (CGRect)textBoundingRect
{
  [(PKCurvedTextLabel *)self _glyphsBoundingRect];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(PKCurvedTextLabel *)self bounds];
  -[PKCurvedTextLabel _offsetOfBoundingRect:inRect:](self, "_offsetOfBoundingRect:inRect:", v4, v6, v8, v10, v11, v12, v13, v14);
  double v16 = v4 + v15;
  double v18 = v6 + v17;
  double v19 = v8;
  double v20 = v10;
  result.size.double height = v20;
  result.size.double width = v19;
  result.origin.CGFloat y = v18;
  result.origin.CGFloat x = v16;
  return result;
}

- (_NSRange)_drawableCharacterRange:(_NSRange *)a3
{
  uint64_t v5 = [(NSLayoutManager *)self->_layoutManager glyphRangeForTextContainer:self->_textContainer];
  uint64_t v7 = v6;
  uint64_t v8 = [(NSLayoutManager *)self->_layoutManager truncatedGlyphRangeInLineFragmentForGlyphAtIndex:v5];
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = v8 + 1;
    if (a3)
    {
      a3->location = -[NSLayoutManager characterRangeForGlyphRange:actualGlyphRange:](self->_layoutManager, "characterRangeForGlyphRange:actualGlyphRange:", v8, v9, 0);
      a3->length = v10;
    }
  }
  layoutManager = self->_layoutManager;

  NSUInteger v12 = -[NSLayoutManager characterRangeForGlyphRange:actualGlyphRange:](layoutManager, "characterRangeForGlyphRange:actualGlyphRange:", v5, v7, 0);
  result.length = v13;
  result.location = v12;
  return result;
}

- (__CTLine)_newLineFromDrawableTextStorage
{
  long long v13 = xmmword_1A0443810;
  uint64_t v4 = [(PKCurvedTextLabel *)self _drawableCharacterRange:&v13];
  textStorage = self->_textStorage;
  if ((void)v13 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v6 = v3;
    uint64_t v7 = [(NSTextStorage *)textStorage length];
    uint64_t v8 = self->_textStorage;
    if (v4 || v6 != v7)
    {
      uint64_t v9 = (NSTextStorage *)[(NSTextStorage *)v8 mutableCopy];
      -[NSTextStorage deleteCharactersInRange:](v9, "deleteCharactersInRange:", v6, [(NSTextStorage *)self->_textStorage length] - v6);
    }
    else
    {
      uint64_t v9 = v8;
    }
  }
  else
  {
    uint64_t v9 = (NSTextStorage *)[(NSTextStorage *)textStorage mutableCopy];
    uint64_t v10 = [(NSTextStorage *)self->_textStorage length];
    *((void *)&v13 + 1) = v10 - v13;
    -[NSTextStorage replaceCharactersInRange:withString:](v9, "replaceCharactersInRange:withString:");
  }
  double v11 = CTLineCreateWithAttributedString((CFAttributedStringRef)v9);

  return v11;
}

- (CGPoint)_offsetOfBoundingRect:(CGRect)a3 inRect:(CGRect)a4
{
  CGFloat rect = a4.size.height;
  CGFloat width = a3.size.width;
  CGFloat v4 = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  CGFloat height = a3.size.height;
  CGFloat v8 = a3.size.width;
  CGFloat v9 = a3.origin.y;
  CGFloat v10 = a3.origin.x;
  double v11 = CGRectGetWidth(a4);
  v19.origin.CGFloat x = v10;
  v19.origin.CGFloat y = v9;
  v19.size.CGFloat width = v8;
  v19.size.CGFloat height = height;
  double v12 = v11 - CGRectGetMaxX(v19);
  v20.origin.CGFloat x = x;
  v20.origin.CGFloat y = y;
  v20.size.CGFloat width = v4;
  v20.size.CGFloat height = rect;
  double v13 = CGRectGetHeight(v20);
  v21.origin.CGFloat x = v10;
  v21.origin.CGFloat y = v9;
  v21.size.CGFloat width = width;
  v21.size.CGFloat height = height;
  double v14 = v13 - CGRectGetMaxY(v21);
  double v15 = v12;
  result.CGFloat y = v14;
  result.CGFloat x = v15;
  return result;
}

- (CGRect)_glyphsBoundingRect
{
  p_cachedBounds = &self->_cachedBounds;
  [(PKCurvedTextLabel *)self bounds];
  v32.origin.CGFloat x = v4;
  v32.origin.CGFloat y = v5;
  v32.size.CGFloat width = v6;
  v32.size.CGFloat height = v7;
  if (CGRectEqualToRect(*p_cachedBounds, v32) && !CGRectIsEmpty(self->_cachedGlyphsBoundingRect))
  {
    CGFloat x = self->_cachedGlyphsBoundingRect.origin.x;
    CGFloat y = self->_cachedGlyphsBoundingRect.origin.y;
    CGFloat width = self->_cachedGlyphsBoundingRect.size.width;
    CGFloat height = self->_cachedGlyphsBoundingRect.size.height;
  }
  else
  {
    uint64_t v24 = 0;
    uint64_t v25 = (CGRect *)&v24;
    uint64_t v26 = 0x4010000000;
    uint64_t v27 = "";
    long long v8 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
    long long v28 = *MEMORY[0x1E4F1DB20];
    long long v29 = v8;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __40__PKCurvedTextLabel__glyphsBoundingRect__block_invoke;
    v23[3] = &unk_1E59D0340;
    v23[4] = &v24;
    [(PKCurvedTextLabel *)self _enumerateTransformsForDrawableCharacters:v23];
    CGRect v30 = CGRectInset(v25[1], 0.0, -1.0);
    v25[1] = v30;
    [(PKCurvedTextLabel *)self bounds];
    p_cachedBounds->origin.CGFloat x = v9;
    p_cachedBounds->origin.CGFloat y = v10;
    p_cachedBounds->size.CGFloat width = v11;
    p_cachedBounds->size.CGFloat height = v12;
    p_CGFloat x = &v25->origin.x;
    CGSize size = v25[1].size;
    self->_cachedGlyphsBoundingRect.origin = v25[1].origin;
    self->_cachedGlyphsBoundingRect.CGSize size = size;
    CGFloat x = p_x[4];
    CGFloat y = p_x[5];
    CGFloat width = p_x[6];
    CGFloat height = p_x[7];
    _Block_object_dispose(&v24, 8);
  }
  double v19 = x;
  double v20 = y;
  double v21 = width;
  double v22 = height;
  result.size.CGFloat height = v22;
  result.size.CGFloat width = v21;
  result.origin.CGFloat y = v20;
  result.origin.CGFloat x = v19;
  return result;
}

void __40__PKCurvedTextLabel__glyphsBoundingRect__block_invoke(uint64_t a1, double a2, double a3, double a4, double a5, double a6, double a7, uint64_t a8, uint64_t a9, _OWORD *a10)
{
  double v10 = a5;
  long long v13 = a10[1];
  *(_OWORD *)&v15.a = *a10;
  *(_OWORD *)&v15.c = v13;
  *(_OWORD *)&v15.tCGFloat x = a10[2];
  *(double *)&long long v13 = a7;
  CGRect v16 = CGRectApplyAffineTransform(*(CGRect *)(&v10 - 1), &v15);
  *(CGRect *)(*(void *)(*(void *)(a1 + 32) + 8) + 32) = CGRectUnion(v16, *(CGRect *)(*(void *)(*(void *)(a1 + 32) + 8)+ 32));
}

- (double)_distance
{
  double result = self->_circleRadius;
  if (!self->_interior) {
    return -result;
  }
  return result;
}

- (void)_enumerateTransformsForDrawableCharacters:(id)a3
{
  CGFloat v4 = a3;
  [(PKCurvedTextLabel *)self bounds];
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  [(PKCurvedTextLabel *)self _distance];
  double v14 = v13;
  CGAffineTransform v15 = [(PKCurvedTextLabel *)self _newLineFromDrawableTextStorage];
  CGRect ImageBounds = CTLineGetImageBounds(v15, 0);
  CGFloat x = ImageBounds.origin.x;
  CGFloat y = ImageBounds.origin.y;
  CGFloat height = ImageBounds.size.height;
  CGFloat width = ImageBounds.size.width;
  CGFloat MinX = 0.0;
  double TypographicBounds = 0.0;
  if (self->_hasMonospacedNumbers) {
    double TypographicBounds = CTLineGetTypographicBounds(v15, 0, 0, 0);
  }
  CFRelease(v15);
  CGFloat v74 = y;
  if (self->_hasMonospacedNumbers)
  {
    double v19 = TypographicBounds;
  }
  else
  {
    v108.origin.CGFloat x = x;
    v108.origin.CGFloat y = y;
    v108.size.CGFloat height = height;
    v108.size.CGFloat width = width;
    CGFloat v20 = CGRectGetWidth(v108);
    CGFloat v21 = y;
    double v19 = v20;
    if (!self->_hasMonospacedNumbers)
    {
      CGFloat v22 = x;
      CGFloat v24 = height;
      CGFloat v23 = width;
      CGFloat MinX = CGRectGetMinX(*(CGRect *)(&v21 - 1));
    }
  }
  CGFloat v75 = x;
  v106[0] = xmmword_1A0443810;
  unint64_t v25 = [(PKCurvedTextLabel *)self _drawableCharacterRange:v106];
  uint64_t v27 = v26;
  if (self->_hasMonospacedNumbers)
  {
    long long v28 = [(NSTextStorage *)self->_textStorage attribute:*MEMORY[0x1E4FB06F8] atIndex:0 effectiveRange:0];
    v109.origin.CGFloat y = v74;
    v109.origin.CGFloat x = x;
    v109.size.CGFloat height = height;
    v109.size.CGFloat width = width;
    CGFloat rect = CGRectGetMinX(v109);
    [v28 xHeight];
    *(double *)&uint64_t v86 = v14;
    CGFloat v30 = v29;
    [(NSLayoutManager *)self->_layoutManager locationForGlyphAtIndex:0];
    uint64_t v80 = v12;
    uint64_t v82 = v10;
    double v32 = v31;
    v110.origin.CGFloat y = 0.0;
    v110.origin.CGFloat x = v33 + 0.0;
    CGFloat v34 = v110.origin.x;
    v110.size.CGFloat width = rect;
    v110.size.CGFloat height = v30;
    v111.origin.CGFloat y = v32 - CGRectGetMaxY(v110);
    CGFloat v72 = v111.origin.y;
    v111.origin.CGFloat x = v34;
    v111.size.CGFloat width = rect;
    v111.size.CGFloat height = v30;
    memset(&v105, 0, sizeof(v105));
    double MidX = CGRectGetMidX(v111);
    CGFloat v35 = v32;
    uint64_t v12 = v80;
    _TransformForLayoutLocation(&v105, v36, v37, v38, v39, v40, v41, v42, MidX, v35, v19, *(double *)&v86, self->_centerAngle, v6, v8, v82, v80);
    v112.origin.CGFloat x = v34;
    uint64_t v10 = v82;
    v112.origin.CGFloat y = v72;
    v112.size.CGFloat height = v30;
    v112.size.CGFloat width = rect;
    double v14 = *(double *)&v86;
    CGRect v113 = CGRectOffset(v112, -MidX, -v35);
    v43 = (void (*)(void *, uint64_t, void, CGAffineTransform *, double, double, double, double, double, double))v4[2];
    CGAffineTransform v104 = v105;
    v43(v4, 0x7FFFFFFFFFFFFFFFLL, 0, &v104, MidX, v35, v113.origin.x, v113.origin.y, v113.size.width, v113.size.height);
  }
  unint64_t v87 = v25 + v27;
  if (v25 < v25 + v27)
  {
    v84 = v4;
    do
    {
      *(_OWORD *)&v105.CGFloat a = xmmword_1A0443810;
      unint64_t v45 = -[NSLayoutManager glyphRangeForCharacterRange:actualCharacterRange:](self->_layoutManager, "glyphRangeForCharacterRange:actualCharacterRange:", v25, 1, &v105);
      uint64_t v46 = *(void *)&v106[0];
      CGFloat a = v105.a;
      if (*(void *)&v106[0] == *(void *)&v105.a) {
        uint64_t v48 = 1;
      }
      else {
        uint64_t v48 = v44;
      }
      v49 = objc_opt_new();
      uint64_t v50 = v48;
      unint64_t v51 = v45;
      if (v45 < v48 + v45)
      {
        do
        {
          if (([(NSLayoutManager *)self->_layoutManager propertyForGlyphAtIndex:v51] & 1) == 0) {
            [v49 addIndex:v51];
          }
          ++v51;
          --v50;
        }
        while (v50);
      }
      v89[0] = MEMORY[0x1E4F143A8];
      v89[1] = 3221225472;
      CGFloat v4 = v84;
      v89[2] = __63__PKCurvedTextLabel__enumerateTransformsForDrawableCharacters___block_invoke;
      v89[3] = &unk_1E59D0368;
      v89[4] = self;
      uint64_t v91 = 0;
      CGFloat v92 = MinX;
      long long v93 = *(_OWORD *)&v105.a;
      uint64_t v94 = v48;
      BOOL v103 = v46 == *(void *)&a;
      double v95 = v19;
      double v96 = v14;
      uint64_t v97 = v6;
      uint64_t v98 = v8;
      uint64_t v99 = v10;
      uint64_t v100 = v12;
      if (v46 == *(void *)&a) {
        p_b = (CGFloat *)v106 + 1;
      }
      else {
        p_b = &v105.b;
      }
      v90 = v84;
      unint64_t v101 = v45;
      uint64_t v102 = v48;
      [v49 enumerateRangesUsingBlock:v89];
      uint64_t v53 = *(void *)p_b;
      if (*(void *)p_b <= 1uLL) {
        uint64_t v53 = 1;
      }
      v25 += v53;
    }
    while (v25 < v87);
  }
  if (self->_hasMonospacedNumbers)
  {
    unint64_t v54 = v87 - 1;
    v55 = [(NSTextStorage *)self->_textStorage attribute:*MEMORY[0x1E4FB06F8] atIndex:v87 - 1 effectiveRange:0];
    v114.origin.CGFloat x = v75;
    v114.origin.CGFloat y = v74;
    uint64_t v88 = v6;
    v114.size.CGFloat width = width;
    uint64_t v85 = v8;
    v114.size.CGFloat height = height;
    CGFloat v83 = TypographicBounds - CGRectGetMaxX(v114);
    v115.origin.CGFloat x = v75;
    v115.origin.CGFloat y = v74;
    v115.size.CGFloat width = width;
    v115.size.CGFloat height = height;
    double MaxX = CGRectGetMaxX(v115);
    [v55 xHeight];
    CGFloat v58 = v57;
    [(NSLayoutManager *)self->_layoutManager locationForGlyphAtIndex:[(NSLayoutManager *)self->_layoutManager glyphIndexForCharacterAtIndex:v54]];
    double v60 = v59;
    v116.origin.CGFloat y = 0.0;
    v116.origin.CGFloat x = MaxX + 0.0;
    v116.size.CGFloat width = v83;
    v116.size.CGFloat height = v58;
    v117.origin.CGFloat y = v60 - CGRectGetMaxY(v116);
    CGFloat v81 = v117.origin.y;
    v117.origin.CGFloat x = MaxX + 0.0;
    v117.size.CGFloat width = v83;
    v117.size.CGFloat height = v58;
    CGFloat v61 = CGRectGetMidX(v117);
    memset(&v105, 0, sizeof(v105));
    uint64_t v71 = v10;
    double v62 = v61;
    _TransformForLayoutLocation(&v105, v63, v64, v65, v66, v67, v68, v69, v61, v60, v19, v14, self->_centerAngle, v88, v85, v71, v12);
    v118.origin.CGFloat x = MaxX + 0.0;
    v118.origin.CGFloat y = v81;
    v118.size.CGFloat width = v83;
    v118.size.CGFloat height = v58;
    CGRect v119 = CGRectOffset(v118, -v62, -v60);
    v70 = (void (*)(void *, uint64_t, void, CGAffineTransform *, double, double, double, double, double, double))v4[2];
    CGAffineTransform v104 = v105;
    v70(v4, 0x7FFFFFFFFFFFFFFFLL, 0, &v104, v62, v60, v119.origin.x, v119.origin.y, v119.size.width, v119.size.height);
  }
}

void __63__PKCurvedTextLabel__enumerateTransformsForDrawableCharacters___block_invoke(uint64_t a1, uint64_t a2, CFIndex a3)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(a1 + 32) + 808) locationForGlyphAtIndex:a2];
  double v7 = v6;
  double v9 = v8;
  uint64_t v10 = a2 + 1;
  if (a2 + 1 < (unint64_t)(a2 + a3))
  {
    CFIndex v11 = a3 - 1;
    do
    {
      [*(id *)(*(void *)(a1 + 32) + 808) locationForGlyphAtIndex:v10];
      if (v12 < v7)
      {
        double v9 = v13;
        double v7 = v12;
      }
      ++v10;
      --v11;
    }
    while (v11);
  }
  double v14 = *(double *)(a1 + 48);
  double v15 = *(double *)(a1 + 56);
  CGRect v16 = [*(id *)(*(void *)(a1 + 32) + 800) attribute:*MEMORY[0x1E4FB06F8] atIndex:*(void *)(a1 + 64) effectiveRange:0];
  *(void *)&double v18 = MEMORY[0x1F4188790](v16, v17).n128_u64[0];
  CGFloat v20 = (const CGGlyph *)((char *)&v37 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 808), "getGlyphsInRange:glyphs:properties:characterIndexes:bidiLevels:", a2, a3, v20, 0, 0, 0, v18);
  CGRect BoundingRectsForGlyphs = CTFontGetBoundingRectsForGlyphs(v16, kCTFontOrientationDefault, v20, 0, a3);
  double x = BoundingRectsForGlyphs.origin.x;
  CGFloat y = BoundingRectsForGlyphs.origin.y;
  CGFloat width = BoundingRectsForGlyphs.size.width;
  if (*(unsigned char *)(a1 + 152))
  {
    [(__CTFont *)v16 xHeight];
    CGFloat height = v24;
  }
  else
  {
    CGFloat height = BoundingRectsForGlyphs.size.height;
  }
  CGFloat v26 = v7 + v14 - v15 + x;
  v41.origin.double x = v26;
  v41.origin.CGFloat y = y;
  v41.size.CGFloat width = width;
  v41.size.CGFloat height = height;
  CGFloat v27 = v9 - CGRectGetMaxY(v41);
  v42.origin.double x = v26;
  v42.origin.CGFloat y = v27;
  v42.size.CGFloat width = width;
  v42.size.CGFloat height = height;
  double MidX = CGRectGetMidX(v42);
  memset(&v38, 0, sizeof(v38));
  _TransformForLayoutLocation(&v38, v29, v30, v31, v32, v33, v34, v35, MidX, v9, *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(*(void *)(a1 + 32) + 952), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(void *)(a1 + 128));
  v43.origin.double x = v26;
  v43.origin.CGFloat y = v27;
  v43.size.CGFloat width = width;
  v43.size.CGFloat height = height;
  CGRect v44 = CGRectOffset(v43, -MidX, -v9);
  int v36 = *(void (**)(double, double, double, double, double, double))(*(void *)(a1 + 40) + 16);
  CGAffineTransform v37 = v38;
  v36(MidX, v9, v44.origin.x, v44.origin.y, v44.size.width, v44.size.height);
}

- (double)circleRadius
{
  return self->_circleRadius;
}

- (BOOL)interior
{
  return self->_interior;
}

- (double)centerAngle
{
  return self->_centerAngle;
}

- (double)maxAngularWidth
{
  return self->_maxAngularWidth;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_textContainer, 0);
  objc_storeStrong((id *)&self->_layoutManager, 0);

  objc_storeStrong((id *)&self->_textStorage, 0);
}

@end