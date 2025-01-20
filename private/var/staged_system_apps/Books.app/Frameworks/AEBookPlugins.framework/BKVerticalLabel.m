@interface BKVerticalLabel
- (void)drawRect:(CGRect)a3;
@end

@implementation BKVerticalLabel

- (void)drawRect:(CGRect)a3
{
  v4 = [(BKVerticalLabel *)self text];
  v5 = (char *)[v4 length];

  if (v5)
  {
    v6 = [(BKVerticalLabel *)self text];
    v7 = +[NSMutableString stringWithString:v6];

    for (i = 0; i != v5; ++i)
    {
      __int16 v48 = 0;
      unsigned int v9 = [(__CFString *)v7 characterAtIndex:i];
      if (v9 - 48 <= 9)
      {
        __int16 v48 = v9 - 288;
        v10 = +[NSString stringWithCharacters:&v48 length:1];
        -[__CFString replaceCharactersInRange:withString:](v7, "replaceCharactersInRange:withString:", i, 1, v10);
      }
    }
    Mutable = CFAttributedStringCreateMutable(kCFAllocatorDefault, (CFIndex)v5);
    if (!Mutable) {
      goto LABEL_22;
    }
    v12 = Mutable;
    v49.location = 0;
    v49.length = 0;
    CFAttributedStringReplaceString(Mutable, v49, v7);
    v13 = [(BKVerticalLabel *)self font];
    [v13 pointSize];
    CGFloat v15 = v14;

    v16 = [(BKVerticalLabel *)self font];
    v17 = [v16 fontName];
    CTFontRef v18 = CTFontCreateWithName(v17, v15, 0);

    if (!v18)
    {
LABEL_21:
      CFRelease(v12);
LABEL_22:

      return;
    }
    v50.location = 0;
    v50.length = (CFIndex)v5;
    CTFontRef value = v18;
    CFAttributedStringSetAttribute(v12, v50, kCTFontAttributeName, v18);
    id v19 = [(BKVerticalLabel *)self textColor];
    id v20 = [v19 CGColor];
    v51.location = 0;
    v51.length = (CFIndex)v5;
    CFAttributedStringSetAttribute(v12, v51, kCTForegroundColorAttributeName, v20);

    v52.location = 0;
    v52.length = (CFIndex)v5;
    CFAttributedStringSetAttribute(v12, v52, kCTVerticalFormsAttributeName, kCFBooleanTrue);
    CGContextRef CurrentContext = UIGraphicsGetCurrentContext();
    if (!CurrentContext) {
      goto LABEL_20;
    }
    v22 = CurrentContext;
    CGAffineTransformMakeScale(&v47, 1.0, -1.0);
    CGContextSetTextMatrix(v22, &v47);
    v23 = CTTypesetterCreateWithAttributedString(v12);
    if (!v23) {
      goto LABEL_20;
    }
    v24 = v23;
    v53.location = 0;
    v53.length = (CFIndex)v5;
    Line = CTTypesetterCreateLine(v23, v53);
    if (!Line)
    {
LABEL_19:
      CFRelease(v24);
      goto LABEL_20;
    }
    v26 = Line;
    CGRect ImageBounds = CTLineGetImageBounds(Line, v22);
    CGFloat v27 = ceil(CGRectGetWidth(ImageBounds));
    [(BKVerticalLabel *)self bounds];
    CGFloat x = v59.origin.x;
    CGFloat y = v59.origin.y;
    CGFloat width = v59.size.width;
    CGFloat height = v59.size.height;
    if (v27 <= CGRectGetWidth(v59))
    {
      TruncatedLine = 0;
      v36 = 0;
      v33 = 0;
    }
    else
    {
      v32 = CFAttributedStringCreateMutable(kCFAllocatorDefault, 1);
      v33 = v32;
      if (!v32) {
        goto LABEL_18;
      }
      v54.location = 0;
      v54.length = 0;
      CFAttributedStringReplaceString(v32, v54, @"…");
      v55.location = 0;
      v55.length = 1;
      CFAttributedStringSetAttribute(v33, v55, kCTFontAttributeName, value);
      id v34 = [(BKVerticalLabel *)self textColor];
      id v35 = [v34 CGColor];
      v56.location = 0;
      v56.length = 1;
      CFAttributedStringSetAttribute(v33, v56, kCTForegroundColorAttributeName, v35);

      v57.location = 0;
      v57.length = 1;
      CFAttributedStringSetAttribute(v33, v57, kCTVerticalFormsAttributeName, kCFBooleanTrue);
      v36 = CTLineCreateWithAttributedString(v33);
      CGRect v60 = CTLineGetImageBounds(v36, v22);
      CGFloat attrName = v60.origin.x;
      CGFloat v37 = v60.origin.y;
      CGFloat v38 = v60.size.width;
      CGFloat v39 = v60.size.height;
      v60.origin.CGFloat x = x;
      v60.origin.CGFloat y = y;
      v60.size.CGFloat width = width;
      v60.size.CGFloat height = height;
      double v40 = CGRectGetWidth(v60);
      v61.origin.CGFloat x = attrName;
      v61.origin.CGFloat y = v37;
      v61.size.CGFloat width = v38;
      v61.size.CGFloat height = v39;
      double v41 = CGRectGetWidth(v61);
      TruncatedLine = CTLineCreateTruncatedLine(v26, v40 - ceil(v41), kCTLineTruncationEnd, v36);
    }
    v62.origin.CGFloat x = x;
    v62.origin.CGFloat y = y;
    v62.size.CGFloat width = width;
    v62.size.CGFloat height = height;
    CGFloat v43 = CGRectGetWidth(v62);
    v63.origin.CGFloat x = x;
    v63.origin.CGFloat y = y;
    v63.size.CGFloat width = width;
    v63.size.CGFloat height = height;
    CGFloat v44 = CGRectGetHeight(v63);
    CGContextSetTextPosition(v22, v43, round(v44 * 0.5));
    if (TruncatedLine)
    {
      CTLineDraw(TruncatedLine, v22);
      CFRelease(TruncatedLine);
      if (!v36) {
        goto LABEL_18;
      }
    }
    else
    {
      CTLineDraw(v26, v22);
      if (!v36)
      {
LABEL_18:
        CFRelease(v26);
        CFRelease(v24);
        v24 = v33;
        if (v33) {
          goto LABEL_19;
        }
LABEL_20:
        CFRelease(value);
        goto LABEL_21;
      }
    }
    CFRelease(v36);
    goto LABEL_18;
  }
}

@end