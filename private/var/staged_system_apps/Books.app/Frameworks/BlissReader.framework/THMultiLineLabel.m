@interface THMultiLineLabel
- (CGSize)textShadowOffset;
- (CGSize)textSize;
- (NSString)runIn;
- (NSString)text;
- (THMultiLineLabel)initWithFrame:(CGRect)a3;
- (TSUColor)textColor;
- (TSUColor)textShadowColor;
- (TSUFont)font;
- (TSUFont)runInFont;
- (__CFAttributedString)p_createAttributedString;
- (double)firstLineAscent;
- (double)lineHeight;
- (double)scale;
- (double)textShadowBlur;
- (int)alignment;
- (unint64_t)lineCount;
- (unint64_t)lineCountForWidth:(double)a3;
- (void)dealloc;
- (void)drawInContext:(CGContext *)a3;
- (void)p_ensureTypesetterCreated;
- (void)p_enumerateLinesForWidth:(double)a3 withBlock:(id)a4;
- (void)p_enumerateLinesWithBlock:(id)a3;
- (void)p_tearDownTypesetter;
- (void)resizeToFitCurrentWidth;
- (void)resizeToFitTightly;
- (void)setAlignment:(int)a3;
- (void)setFont:(id)a3;
- (void)setLineHeight:(double)a3;
- (void)setRunIn:(id)a3;
- (void)setRunInFont:(id)a3;
- (void)setScale:(double)a3;
- (void)setText:(id)a3;
- (void)setTextColor:(id)a3;
- (void)setTextShadowBlur:(double)a3;
- (void)setTextShadowColor:(id)a3;
- (void)setTextShadowOffset:(CGSize)a3;
@end

@implementation THMultiLineLabel

- (THMultiLineLabel)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)THMultiLineLabel;
  v7 = [(THMultiLineLabel *)&v10 init];
  v8 = v7;
  if (v7)
  {
    -[THMultiLineLabel setFrame:](v7, "setFrame:", x, y, width, height);
    [v8 setBackgroundColor:[+[TSUColor clearColor](TSUColor, "clearColor") CGColor]];
    [(THMultiLineLabel *)v8 setOpaque:0];
    v8->_scale = 1.0;
  }
  return v8;
}

- (void)dealloc
{
  self->_runIn = 0;
  self->_text = 0;

  self->_font = 0;
  self->_runInFont = 0;

  self->_textColor = 0;
  typesetter = self->_typesetter;
  if (typesetter)
  {
    CFRelease(typesetter);
    self->_typesetter = 0;
  }

  self->_textShadowColor = 0;
  v4.receiver = self;
  v4.super_class = (Class)THMultiLineLabel;
  [(THMultiLineLabel *)&v4 dealloc];
}

- (void)setRunIn:(id)a3
{
  objc_super v4 = (NSString *)[a3 copy];

  self->_runIn = v4;

  [(THMultiLineLabel *)self p_tearDownTypesetter];
}

- (void)setText:(id)a3
{
  objc_super v4 = (NSString *)[a3 copy];

  self->_text = v4;

  [(THMultiLineLabel *)self p_tearDownTypesetter];
}

- (void)setLineHeight:(double)a3
{
  self->_lineHeight = a3;
  [(THMultiLineLabel *)self p_tearDownTypesetter];
}

- (void)setFont:(id)a3
{
  objc_super v4 = (TSUFont *)a3;

  self->_font = v4;

  [(THMultiLineLabel *)self p_tearDownTypesetter];
}

- (void)setRunInFont:(id)a3
{
  objc_super v4 = (TSUFont *)a3;

  self->_runInFont = v4;

  [(THMultiLineLabel *)self p_tearDownTypesetter];
}

- (void)setTextColor:(id)a3
{
  objc_super v4 = (TSUColor *)a3;

  self->_textColor = v4;

  [(THMultiLineLabel *)self p_tearDownTypesetter];
}

- (void)setAlignment:(int)a3
{
  self->_alignment = a3;
  double v4 = 0.5;
  switch(a3)
  {
    case 0:
    case 3:
      goto LABEL_4;
    case 1:
      break;
    case 2:
      double v4 = 1.0;
      break;
    case 4:
      UIUserInterfaceLayoutDirection v5 = [+[UIApplication sharedApplication] userInterfaceLayoutDirection];
      double v4 = 0.0;
      if (v5 == UIUserInterfaceLayoutDirectionRightToLeft) {
        double v4 = 1.0;
      }
      break;
    default:
      [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", 0.5) handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THMultiLineLabel setAlignment:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THMultiLineLabel.mm") lineNumber:153 description:@"unrecognized alignment type"];
LABEL_4:
      double v4 = 0.0;
      break;
  }
  self->_flushFactor = v4;

  [(THMultiLineLabel *)self p_tearDownTypesetter];
}

- (void)setTextShadowColor:(id)a3
{
  id v5 = a3;

  self->_textShadowColor = (TSUColor *)a3;

  [(THMultiLineLabel *)self setNeedsDisplay];
}

- (void)setTextShadowOffset:(CGSize)a3
{
  self->_textShadowOffset = a3;
  [(THMultiLineLabel *)self setNeedsDisplay];
}

- (void)setTextShadowBlur:(double)a3
{
  self->_textShadowBlur = a3;
  [(THMultiLineLabel *)self setNeedsDisplay];
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
  [(THMultiLineLabel *)self p_tearDownTypesetter];
}

- (unint64_t)lineCount
{
  [(THMultiLineLabel *)self bounds];

  return [(THMultiLineLabel *)self lineCountForWidth:v3];
}

- (double)firstLineAscent
{
  CGFloat ascent = 0.0;
  [(THMultiLineLabel *)self p_ensureTypesetterCreated];
  if (!self->_typesetter) {
    return 0.0;
  }
  [(THMultiLineLabel *)self bounds];
  double v4 = v3;
  v10.length = CTTypesetterSuggestLineBreak(self->_typesetter, 0, v3);
  v10.location = 0;
  Line = CTTypesetterCreateLine(self->_typesetter, v10);
  v6 = Line;
  if (self->_alignment == 3)
  {
    CTLineRef JustifiedLine = CTLineCreateJustifiedLine(Line, 1.0, v4);
    CFRelease(v6);
    v6 = JustifiedLine;
  }
  CTLineGetTypographicBounds(v6, &ascent, 0, 0);
  CFRelease(v6);
  return ascent;
}

- (unint64_t)lineCountForWidth:(double)a3
{
  [(THMultiLineLabel *)self p_ensureTypesetterCreated];
  if (!self->_typesetter || ![(NSString *)self->_text length]) {
    return 0;
  }
  unint64_t v5 = 0;
  unint64_t v6 = 0;
  do
  {
    v5 += CTTypesetterSuggestLineBreak(self->_typesetter, v5, a3);
    ++v6;
  }
  while (v5 < [(NSString *)self->_text length]);
  return v6;
}

- (void)resizeToFitTightly
{
  v4[0] = 0;
  v4[1] = v4;
  v4[2] = 0x4012000000;
  v4[3] = sub_E872C;
  v4[4] = nullsub_21;
  v4[5] = &unk_41622E;
  CGSize v5 = CGSizeZero;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_E873C;
  v3[3] = &unk_459350;
  v3[4] = v4;
  [(THMultiLineLabel *)self p_enumerateLinesForWidth:v3 withBlock:1.79769313e308];
  [(THMultiLineLabel *)self bounds];
  -[THMultiLineLabel setBounds:](self, "setBounds:");
  _Block_object_dispose(v4, 8);
}

- (void)resizeToFitCurrentWidth
{
  v4[0] = 0;
  v4[1] = v4;
  v4[2] = 0x2020000000;
  v4[3] = 0;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_E8888;
  v3[3] = &unk_459350;
  v3[4] = v4;
  [(THMultiLineLabel *)self p_enumerateLinesWithBlock:v3];
  [(THMultiLineLabel *)self bounds];
  -[THMultiLineLabel setBounds:](self, "setBounds:");
  _Block_object_dispose(v4, 8);
}

- (void)drawInContext:(CGContext *)a3
{
  CGContextSaveGState(a3);
  textShadowColor = self->_textShadowColor;
  if (textShadowColor)
  {
    CGFloat width = self->_textShadowOffset.width;
    CGFloat height = self->_textShadowOffset.height;
    double textShadowBlur = self->_textShadowBlur;
    v9 = (CGColor *)[(TSUColor *)textShadowColor CGColor];
    v12.CGFloat width = width;
    v12.CGFloat height = height;
    CGContextSetShadowWithColor(a3, v12, textShadowBlur, v9);
  }
  CGAffineTransformMakeScale(&v11, 1.0, -1.0);
  CGContextSetTextMatrix(a3, &v11);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_E89EC;
  v10[3] = &unk_459370;
  v10[4] = a3;
  [(THMultiLineLabel *)self p_enumerateLinesWithBlock:v10];
  CGContextRestoreGState(a3);
}

- (__CFAttributedString)p_createAttributedString
{
  Mutable = CFAttributedStringCreateMutable(0, [(NSString *)self->_runIn length] + [(NSString *)self->_text length]);
  CFIndex v4 = [(NSString *)self->_runIn length];
  NSUInteger v5 = [(NSString *)self->_runIn length];
  unint64_t v6 = (char *)[(NSString *)self->_text length] + v5;
  CFAttributedStringBeginEditing(Mutable);
  CFStringRef runIn = (const __CFString *)self->_runIn;
  CFStringRef text = &stru_46D7E8;
  if (!runIn) {
    CFStringRef runIn = &stru_46D7E8;
  }
  if (self->_text) {
    CFStringRef text = (const __CFString *)self->_text;
  }
  CFStringRef v9 = +[NSString stringWithFormat:@"%@%@", runIn, text];
  v17.location = 0;
  v17.length = 0;
  CFAttributedStringReplaceString(Mutable, v17, v9);
  font = self->_font;
  if (font)
  {
    id v11 = [[(TSUFont *)font fontWithScale:self->_scale] CTFont];
    v18.location = 0;
    v18.length = (CFIndex)v6;
    CFAttributedStringSetAttribute(Mutable, v18, kCTFontAttributeName, v11);
  }
  textColor = self->_textColor;
  if (textColor)
  {
    id v13 = [(TSUColor *)textColor CGColor];
    v19.location = 0;
    v19.length = (CFIndex)v6;
    CFAttributedStringSetAttribute(Mutable, v19, kCTForegroundColorAttributeName, v13);
  }
  if (self->_runIn)
  {
    runInFont = self->_runInFont;
    if (runInFont)
    {
      id v15 = [[(TSUFont *)runInFont fontWithScale:self->_scale] CTFont];
      v20.location = 0;
      v20.length = v4;
      CFAttributedStringSetAttribute(Mutable, v20, kCTFontAttributeName, v15);
    }
  }
  CFAttributedStringEndEditing(Mutable);
  return Mutable;
}

- (void)p_ensureTypesetterCreated
{
  if (!self->_typesetter)
  {
    double v3 = [(THMultiLineLabel *)self p_createAttributedString];
    self->_typesetter = CTTypesetterCreateWithAttributedString(v3);
    CFRelease(v3);
  }
}

- (void)p_tearDownTypesetter
{
  typesetter = self->_typesetter;
  if (typesetter)
  {
    CFRelease(typesetter);
    self->_typesetter = 0;
  }

  [(THMultiLineLabel *)self setNeedsDisplay];
}

- (void)p_enumerateLinesWithBlock:(id)a3
{
  [(THMultiLineLabel *)self bounds];

  [(THMultiLineLabel *)self p_enumerateLinesForWidth:a3 withBlock:v5];
}

- (void)p_enumerateLinesForWidth:(double)a3 withBlock:(id)a4
{
  unint64_t v6 = self;
  [(THMultiLineLabel *)self p_ensureTypesetterCreated];
  uint64_t v7 = 112;
  if (v6->_typesetter)
  {
    double lineHeight = v6->_lineHeight;
    if (lineHeight == 0.0)
    {
      [(TSUFont *)v6->_font lineHeight];
      double v10 = v9;
      runInFont = v6->_runInFont;
      if (runInFont) {
        [(TSUFont *)runInFont lineHeight];
      }
      else {
        double v12 = 0.0;
      }
      double lineHeight = fmax(v10, v12);
    }
    double scale = v6->_scale;
    uint64_t v14 = 16;
    if ([(NSString *)v6->_text length])
    {
      unint64_t v15 = 0;
      double v16 = lineHeight * scale;
      CFRange v17 = (char *)a4 + 16;
      unint64_t v18 = 1;
      CFRange v19 = &OBJC_IVAR___THChapterBrowserController_mPageThumbScrollerStartContentOffsetBeforeBackgroundDrag;
      v32 = v6;
      do
      {
        CFIndex v20 = CTTypesetterSuggestLineBreak(*(CTTypesetterRef *)&v6->TSDNoDefaultImplicitActionLayer_opaque[v7], v15, a3);
        v34.location = v15;
        v34.length = v20;
        Line = CTTypesetterCreateLine(*(CTTypesetterRef *)&v6->TSDNoDefaultImplicitActionLayer_opaque[v7], v34);
        v22 = Line;
        if (*(_DWORD *)&v6->TSDNoDefaultImplicitActionLayer_opaque[v19[471]] == 3)
        {
          uint64_t v23 = v7;
          id v24 = a4;
          v25 = v17;
          uint64_t v26 = v14;
          v27 = v19;
          CTLineRef JustifiedLine = CTLineCreateJustifiedLine(Line, 1.0, a3);
          CFRelease(v22);
          v22 = JustifiedLine;
          CFRange v19 = v27;
          uint64_t v14 = v26;
          CFRange v17 = v25;
          a4 = v24;
          uint64_t v7 = v23;
          unint64_t v6 = v32;
        }
        double PenOffsetForFlush = CTLineGetPenOffsetForFlush(v22, v6->_flushFactor, a3);
        CGFloat descent = 0.0;
        CTLineGetTypographicBounds(v22, 0, &descent, 0);
        float v30 = PenOffsetForFlush;
        float v31 = -(descent - (double)v18 * v16);
        (*((void (**)(id, const __CTLine *, double, double))a4 + 2))(a4, v22, roundf(v30), roundf(v31));
        CFRelease(v22);
        v15 += v20;
        ++v18;
      }
      while (v15 < (unint64_t)[*(id *)&v6->TSDNoDefaultImplicitActionLayer_opaque[v14] length]);
    }
  }
}

- (NSString)runIn
{
  return self->_runIn;
}

- (NSString)text
{
  return self->_text;
}

- (double)lineHeight
{
  return self->_lineHeight;
}

- (TSUFont)font
{
  return self->_font;
}

- (TSUFont)runInFont
{
  return self->_runInFont;
}

- (TSUColor)textColor
{
  return self->_textColor;
}

- (int)alignment
{
  return self->_alignment;
}

- (TSUColor)textShadowColor
{
  return self->_textShadowColor;
}

- (CGSize)textShadowOffset
{
  double width = self->_textShadowOffset.width;
  double height = self->_textShadowOffset.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)textShadowBlur
{
  return self->_textShadowBlur;
}

- (double)scale
{
  return self->_scale;
}

- (CGSize)textSize
{
  double width = self->_textSize.width;
  double height = self->_textSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

@end