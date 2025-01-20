@interface TUICandidateLabel
+ (double)lineWidthForText:(id)a3 font:(id)a4 layoutOrientation:(int64_t)a5;
- (BOOL)adjustsFontSizeToFitWidth;
- (NSString)text;
- (TUICandidateLabel)initWithCoder:(id)a3;
- (TUICandidateLabel)initWithFrame:(CGRect)a3;
- (UIColor)textColor;
- (UIFont)font;
- (__CTLine)createLineFromAttributedText:(id)a3;
- (double)minimumScaleFactor;
- (int64_t)layoutOrientation;
- (int64_t)lineBreakMode;
- (unint64_t)accessibilityTraits;
- (unsigned)lineTruncationType;
- (void)commonInit;
- (void)drawRect:(CGRect)a3;
- (void)setAdjustsFontSizeToFitWidth:(BOOL)a3;
- (void)setFont:(id)a3;
- (void)setLayoutOrientation:(int64_t)a3;
- (void)setLineBreakMode:(int64_t)a3;
- (void)setMinimumScaleFactor:(double)a3;
- (void)setText:(id)a3;
- (void)setTextColor:(id)a3;
@end

@implementation TUICandidateLabel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

- (int64_t)lineBreakMode
{
  return self->_lineBreakMode;
}

- (int64_t)layoutOrientation
{
  return self->_layoutOrientation;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (BOOL)adjustsFontSizeToFitWidth
{
  return self->_adjustsFontSizeToFitWidth;
}

- (double)minimumScaleFactor
{
  return self->_minimumScaleFactor;
}

- (UIFont)font
{
  return self->_font;
}

- (NSString)text
{
  return self->_text;
}

- (void)drawRect:(CGRect)a3
{
  v4 = [(TUICandidateLabel *)self font];
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    v6 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  }
  v7 = v6;

  [(TUICandidateLabel *)self bounds];
  double v9 = v8;
  double v11 = v10;
  v12 = [(TUICandidateLabel *)self text];

  if (v12)
  {
    v13 = [(TUICandidateLabel *)self text];
    uint64_t v14 = [v13 length];

    v15 = [MEMORY[0x1E4F1CA60] dictionary];
    id v16 = objc_alloc(MEMORY[0x1E4F28E48]);
    v17 = [(TUICandidateLabel *)self text];
    v18 = (void *)[v16 initWithString:v17];

    uint64_t v19 = *MEMORY[0x1E4FB06F8];
    [v15 setValue:v7 forKey:*MEMORY[0x1E4FB06F8]];
    v20 = [(TUICandidateLabel *)self textColor];

    if (v20)
    {
      v21 = [(TUICandidateLabel *)self textColor];
      [v15 setValue:v21 forKey:*MEMORY[0x1E4FB0700]];
    }
    objc_msgSend(v18, "setAttributes:range:", v15, 0, v14);
    double CapHeight = CTFontGetCapHeight(v7);
    v23 = [(TUICandidateLabel *)self createLineFromAttributedText:v18];
    if (v23)
    {
      v24 = v23;
      CGRect BoundsWithOptions = CTLineGetBoundsWithOptions(v23, 0);
      double width = BoundsWithOptions.size.width;
      if ([(TUICandidateLabel *)self layoutOrientation] == 1)double v26 = v11; {
      else
      }
        double v26 = v9;
      if ([(TUICandidateLabel *)self adjustsFontSizeToFitWidth] && width > v26)
      {
        unint64_t v27 = 0;
        double v28 = 1.0;
        while (1)
        {
          [(TUICandidateLabel *)self minimumScaleFactor];
          double v28 = v29 >= v28 * (v26 / (width + 1.0)) ? v29 : v28 * (v26 / (width + 1.0));
          v30 = [(TUICandidateLabel *)self font];
          [v30 pointSize];
          double v32 = v28 * v31;

          v33 = [(TUICandidateLabel *)self font];
          v34 = [v33 fontWithSize:v32];

          [v15 setValue:v34 forKey:v19];
          objc_msgSend(v18, "setAttributes:range:", v15, 0, v14);
          CFRelease(v24);
          v35 = [(TUICandidateLabel *)self createLineFromAttributedText:v18];
          if (!v35) {
            break;
          }
          v24 = v35;
          double CapHeight = CTFontGetCapHeight(v34);
          CGRect v62 = CTLineGetBoundsWithOptions(v24, 0);
          double width = v62.size.width;
          if (v62.size.width <= v26
            || ([(TUICandidateLabel *)self minimumScaleFactor],
                v28 <= v36))
          {

            goto LABEL_25;
          }

          if (width > v26 && v27++ < 4) {
            continue;
          }
          goto LABEL_25;
        }
      }
      else
      {
        if (width <= v26) {
          goto LABEL_30;
        }
LABEL_25:
        CFAttributedStringRef v38 = CFAttributedStringCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], @"…", (CFDictionaryRef)v15);
        v39 = CTLineCreateWithAttributedString(v38);
        TruncatedLine = CTLineCreateTruncatedLine(v24, v26, (CTLineTruncationType)[(TUICandidateLabel *)self lineTruncationType], v39);
        if (v39) {
          CFRelease(v39);
        }
        CFRelease(v38);
        if (TruncatedLine) {
          CFRelease(v24);
        }
        else {
LABEL_30:
        }
          TruncatedLine = v24;
        long long v53 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
        long long v54 = *MEMORY[0x1E4F1DAB8];
        *(_OWORD *)&v60.a = *MEMORY[0x1E4F1DAB8];
        *(_OWORD *)&v60.c = v53;
        long long v52 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
        *(_OWORD *)&v60.tdouble x = v52;
        if ([(TUICandidateLabel *)self layoutOrientation] == 1)
        {
          v41 = [(TUICandidateLabel *)self text];
          int v42 = [v41 _containsEmoji];

          double v43 = 0.0;
          if (v42)
          {
            [(__CTFont *)v7 pointSize];
            if (v44 <= 16.0)
            {
              double v46 = v44 * 0.25;
            }
            else
            {
              BOOL v45 = v44 < 24.0;
              double v46 = (24.0 - v44) * 0.5;
              if (!v45) {
                double v46 = 0.0;
              }
            }
            double v43 = v46 * 0.5;
          }
          double x = v43;
          double v51 = v9 * 0.5;
          *(_OWORD *)&transform.a = v54;
          *(_OWORD *)&transform.c = v53;
          *(_OWORD *)&transform.tdouble x = v52;
          CGAffineTransformRotate(&v60, &transform, 1.57079633);
        }
        else
        {
          double x = (v11 + CapHeight) * 0.5;
          *(_OWORD *)&transform.a = v54;
          *(_OWORD *)&transform.c = v53;
          *(_OWORD *)&transform.tdouble x = v52;
          double v51 = 0.0;
          CGAffineTransformTranslate(&v60, &transform, 0.0, v11);
        }
        CGAffineTransform v58 = v60;
        CGAffineTransformScale(&transform, &v58, 1.0, -1.0);
        CGAffineTransform v60 = transform;
        CGAffineTransformInvert(&v57, &transform);
        float64x2_t xa = vaddq_f64(*(float64x2_t *)&v57.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v57.c, x), *(float64x2_t *)&v57.a, v51));
        v47 = [(TUICandidateLabel *)self window];
        v48 = [v47 screen];
        [v48 scale];
        if (*(double *)&v49 > 1.0) {
          float64x2_t xa = vdivq_f64(vrndmq_f64(vmulq_n_f64(xa, *(double *)&v49)), (float64x2_t)vdupq_lane_s64(v49, 0));
        }

        CurrentContext = UIGraphicsGetCurrentContext();
        CGContextSaveGState(CurrentContext);
        CGAffineTransform transform = v60;
        CGContextConcatCTM(CurrentContext, &transform);
        CGContextSetTextPosition(CurrentContext, xa.f64[0], xa.f64[1]);
        CTLineDraw(TruncatedLine, CurrentContext);
        CGContextRestoreGState(CurrentContext);
        CFRelease(TruncatedLine);
      }
    }
  }
}

- (__CTLine)createLineFromAttributedText:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  uint64_t v11 = *MEMORY[0x1E4F24800];
  v4 = NSNumber;
  CFAttributedStringRef v5 = (const __CFAttributedString *)a3;
  v6 = objc_msgSend(v4, "numberWithInt:", -[TUICandidateLabel layoutOrientation](self, "layoutOrientation") == 1);
  v12[0] = v6;
  CFDictionaryRef v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  double v8 = CTTypesetterCreateWithAttributedStringAndOptions(v5, v7);

  if (!v8) {
    return 0;
  }
  v13.location = 0;
  v13.length = 0;
  Line = CTTypesetterCreateLine(v8, v13);
  CFRelease(v8);
  return Line;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x1E4FB25A0];
}

- (unsigned)lineTruncationType
{
  int64_t lineBreakMode = self->_lineBreakMode;
  if (lineBreakMode == 5) {
    unsigned int v3 = 2;
  }
  else {
    unsigned int v3 = 1;
  }
  if (lineBreakMode == 3) {
    return 0;
  }
  else {
    return v3;
  }
}

- (void)setLineBreakMode:(int64_t)a3
{
  if (self->_lineBreakMode != a3)
  {
    self->_int64_t lineBreakMode = a3;
    [(TUICandidateLabel *)self setNeedsDisplay];
  }
}

- (void)setLayoutOrientation:(int64_t)a3
{
  if (self->_layoutOrientation != a3)
  {
    self->_layoutOrientation = a3;
    [(TUICandidateLabel *)self setNeedsDisplay];
  }
}

- (void)setTextColor:(id)a3
{
  id v6 = a3;
  if ((-[UIColor isEqual:](self->_textColor, "isEqual:") & 1) == 0)
  {
    v4 = (UIColor *)[v6 copy];
    textColor = self->_textColor;
    self->_textColor = v4;

    [(TUICandidateLabel *)self setNeedsDisplay];
  }
}

- (void)setAdjustsFontSizeToFitWidth:(BOOL)a3
{
  if (self->_adjustsFontSizeToFitWidth != a3)
  {
    self->_adjustsFontSizeToFitWidth = a3;
    [(TUICandidateLabel *)self setNeedsDisplay];
  }
}

- (void)setMinimumScaleFactor:(double)a3
{
  if (self->_minimumScaleFactor != a3)
  {
    self->_minimumScaleFactor = a3;
    if ([(TUICandidateLabel *)self adjustsFontSizeToFitWidth])
    {
      [(TUICandidateLabel *)self setNeedsDisplay];
    }
  }
}

- (void)setFont:(id)a3
{
  id v5 = a3;
  if ((-[UIFont isEqual:](self->_font, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_font, a3);
    [(TUICandidateLabel *)self setNeedsDisplay];
  }
}

- (void)setText:(id)a3
{
  id v6 = a3;
  if (!-[NSString isEqualToString:](self->_text, "isEqualToString:"))
  {
    v4 = (NSString *)[v6 copy];
    text = self->_text;
    self->_text = v4;

    [(TUICandidateLabel *)self setNeedsDisplay];
  }
}

- (TUICandidateLabel)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TUICandidateLabel;
  unsigned int v3 = [(TUICandidateLabel *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(TUICandidateLabel *)v3 commonInit];
  }
  return v4;
}

- (TUICandidateLabel)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TUICandidateLabel;
  unsigned int v3 = -[TUICandidateLabel initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(TUICandidateLabel *)v3 commonInit];
  }
  return v4;
}

- (void)commonInit
{
  [(TUICandidateLabel *)self setContentMode:3];
  [(TUICandidateLabel *)self setOpaque:0];
  [(TUICandidateLabel *)self setLineBreakMode:4];
}

+ (double)lineWidthForText:(id)a3 font:(id)a4 layoutOrientation:(int64_t)a5
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    uint64_t v9 = [v7 length];
    double v10 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v7];
    [v10 setValue:v8 forKey:*MEMORY[0x1E4FB06F8]];
    objc_msgSend(v11, "setAttributes:range:", v10, 0, v9);
    if (a5 == 1)
    {
      uint64_t v20 = *MEMORY[0x1E4F24800];
      v21[0] = MEMORY[0x1E4F1CC38];
      CFDictionaryRef v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
      CFRange v13 = CTTypesetterCreateWithAttributedStringAndOptions((CFAttributedStringRef)v11, v12);

      if (!v13) {
        goto LABEL_5;
      }
      v22.location = 0;
      v22.length = 0;
      Line = CTTypesetterCreateLine(v13, v22);
      CFRelease(v13);
      if (!Line) {
        goto LABEL_5;
      }
    }
    else
    {
      Line = CTLineCreateWithAttributedString((CFAttributedStringRef)v11);
      if (!Line)
      {
LABEL_5:
        double v15 = 0.0;
LABEL_15:

        goto LABEL_16;
      }
    }
    CGRect BoundsWithOptions = CTLineGetBoundsWithOptions(Line, 0);
    double v15 = ceil(BoundsWithOptions.size.width);
    CFRelease(Line);
    if ([v7 _containsEmoji])
    {
      [v8 pointSize];
      double v17 = 0.0;
      if (v16 < 24.0) {
        double v17 = (24.0 - v16) * 0.5;
      }
      if (v16 <= 16.0) {
        double v18 = v16 * 0.25;
      }
      else {
        double v18 = v17;
      }
      double v15 = v15 + v18;
    }
    goto LABEL_15;
  }
  double v15 = 0.0;
LABEL_16:

  return v15;
}

@end