@interface THLabelWithWordHighlights
- (NSString)text;
- (THLabelWithWordHighlights)initWithFrame:(CGRect)a3;
- (THLabelWithWordHighlightsDelegate)delegate;
- (UIColor)highlightedTextColor;
- (UIColor)textColor;
- (UIFont)highlightedTextFont;
- (UIFont)textFont;
- (void)dealloc;
- (void)drawRect:(CGRect)a3;
- (void)setDelegate:(id)a3;
- (void)setHighlightedTextColor:(id)a3;
- (void)setHighlightedTextFont:(id)a3;
- (void)setText:(id)a3;
- (void)setTextColor:(id)a3;
- (void)setTextFont:(id)a3;
@end

@implementation THLabelWithWordHighlights

- (THLabelWithWordHighlights)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)THLabelWithWordHighlights;
  v3 = -[THLabelWithWordHighlights initWithFrame:](&v5, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v3->mTextColor = +[UIColor blackColor];
    v3->mTextFont = +[UIFont systemFontOfSize:15.0];
    v3->mHighlightedTextColor = +[UIColor blackColor];
    v3->mHighlightedTextFont = +[UIFont boldSystemFontOfSize:15.0];
    [(THLabelWithWordHighlights *)v3 setOpaque:0];
  }
  return v3;
}

- (void)dealloc
{
  [(THLabelWithWordHighlights *)self setText:0];
  [(THLabelWithWordHighlights *)self setTextColor:0];
  [(THLabelWithWordHighlights *)self setTextFont:0];
  [(THLabelWithWordHighlights *)self setHighlightedTextColor:0];
  [(THLabelWithWordHighlights *)self setHighlightedTextFont:0];
  v3.receiver = self;
  v3.super_class = (Class)THLabelWithWordHighlights;
  [(THLabelWithWordHighlights *)&v3 dealloc];
}

- (void)drawRect:(CGRect)a3
{
  if ([(NSString *)self->mText length])
  {
    v4 = [(NSString *)self->mText componentsSeparatedByCharactersInSet:+[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v41 objects:v46 count:16];
    if (v5)
    {
      id v6 = v5;
      v7 = 0;
      uint64_t v8 = *(void *)v42;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v42 != v8) {
            objc_enumerationMutation(v4);
          }
          uint64_t v10 = *(void *)(*((void *)&v41 + 1) + 8 * i);
          if (v7)
          {
            [(NSMutableString *)v7 appendFormat:@" %@", *(void *)(*((void *)&v41 + 1) + 8 * i)];
          }
          else
          {
            v7 = +[NSMutableString stringWithCapacity:[(NSString *)self->mText length]];
            [(NSMutableString *)v7 appendString:v10];
          }
        }
        id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v41 objects:v46 count:16];
      }
      while (v6);
    }
    else
    {
      v7 = 0;
    }
    Mutable = CFAttributedStringCreateMutable(0, 0);
    CFAttributedStringBeginEditing(Mutable);
    v47.location = 0;
    v47.length = 0;
    CFAttributedStringReplaceString(Mutable, v47, (CFStringRef)v7);
    id v12 = [(NSMutableString *)v7 length];
    CFStringRef v13 = [(UIFont *)self->mTextFont fontName];
    [(UIFont *)self->mTextFont pointSize];
    CTFontRef v15 = CTFontCreateWithName(v13, v14, 0);
    v48.location = 0;
    v48.length = (CFIndex)v12;
    CFAttributedStringSetAttribute(Mutable, v48, kCTFontAttributeName, v15);
    v16 = [(UIColor *)self->mTextColor CGColor];
    aStr = Mutable;
    v49.location = 0;
    v49.length = (CFIndex)v12;
    CFAttributedStringSetAttribute(Mutable, v49, kCTForegroundColorAttributeName, v16);
    CFRelease(v15);
    if (self->mDelegate)
    {
      CFStringRef v17 = [(UIFont *)self->mHighlightedTextFont fontName];
      [(UIFont *)self->mHighlightedTextFont pointSize];
      CTFontRef cf = CTFontCreateWithName(v17, v18, 0);
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      id v19 = [(NSArray *)v4 countByEnumeratingWithState:&v37 objects:v45 count:16];
      if (v19)
      {
        id v20 = v19;
        CFIndex v21 = 0;
        uint64_t v22 = *(void *)v38;
        do
        {
          for (j = 0; j != v20; j = (char *)j + 1)
          {
            if (*(void *)v38 != v22) {
              objc_enumerationMutation(v4);
            }
            v24 = *(void **)(*((void *)&v37 + 1) + 8 * (void)j);
            if (v21 > 0) {
              ++v21;
            }
            if ([(THLabelWithWordHighlightsDelegate *)self->mDelegate shouldHighlightWord:*(void *)(*((void *)&v37 + 1) + 8 * (void)j)])
            {
              id v25 = [v24 length];
              v50.location = v21;
              v50.length = (CFIndex)v25;
              CFAttributedStringSetAttribute(aStr, v50, kCTFontAttributeName, cf);
              v26 = [(UIColor *)self->mHighlightedTextColor CGColor];
              v51.location = v21;
              v51.length = (CFIndex)v25;
              CFAttributedStringSetAttribute(aStr, v51, kCTForegroundColorAttributeName, v26);
            }
            v21 += (CFIndex)[v24 length];
          }
          id v20 = [(NSArray *)v4 countByEnumeratingWithState:&v37 objects:v45 count:16];
        }
        while (v20);
      }
      CFRelease(cf);
    }
    CFAttributedStringEndEditing(aStr);
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextSaveGState(CurrentContext);
    long long v28 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&v36.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v36.c = v28;
    *(_OWORD *)&v36.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
    CGContextSetTextMatrix(CurrentContext, &v36);
    [(THLabelWithWordHighlights *)self frame];
    CGContextTranslateCTM(CurrentContext, 0.0, v29);
    CGContextScaleCTM(CurrentContext, 1.0, -1.0);
    v30 = CTLineCreateWithAttributedString(aStr);
    [(THLabelWithWordHighlights *)self frame];
    double v32 = v31;
    [(UIFont *)self->mTextFont capHeight];
    *(float *)&double v33 = (v32 - v33) * 0.5;
    CGContextSetTextPosition(CurrentContext, 0.0, floorf(*(float *)&v33));
    CTLineDraw(v30, CurrentContext);
    CFRelease(v30);
    CFRelease(aStr);
    CGContextRestoreGState(CurrentContext);
  }
}

- (void)setText:(id)a3
{
  mText = self->mText;
  if (mText != a3)
  {
    if (mText) {

    }
    self->mText = (NSString *)[a3 copy];
    [(THLabelWithWordHighlights *)self setNeedsDisplay];
  }
}

- (THLabelWithWordHighlightsDelegate)delegate
{
  return self->mDelegate;
}

- (void)setDelegate:(id)a3
{
  self->mDelegate = (THLabelWithWordHighlightsDelegate *)a3;
}

- (NSString)text
{
  return self->mText;
}

- (UIFont)textFont
{
  return self->mTextFont;
}

- (void)setTextFont:(id)a3
{
}

- (UIColor)textColor
{
  return self->mTextColor;
}

- (void)setTextColor:(id)a3
{
}

- (UIColor)highlightedTextColor
{
  return self->mHighlightedTextColor;
}

- (void)setHighlightedTextColor:(id)a3
{
}

- (UIFont)highlightedTextFont
{
  return self->mHighlightedTextFont;
}

- (void)setHighlightedTextFont:(id)a3
{
}

@end