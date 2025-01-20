@interface SUUIProductPageHeaderLabel
- (BOOL)isPad;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)secondaryContentRatingImages;
- (NSString)contentRating;
- (NSString)text;
- (UIColor)ratingColor;
- (UIColor)textColor;
- (__CTFramesetter)_newTextFramesetter;
- (double)secondaryImageWidth;
- (id)_imageForContentRating:(id)a3;
- (id)_textAttributes;
- (void)drawRect:(CGRect)a3;
- (void)layoutSubviews;
- (void)setContentRating:(id)a3;
- (void)setIsPad:(BOOL)a3;
- (void)setRatingColor:(id)a3;
- (void)setSecondaryContentRatingImages:(id)a3;
- (void)setText:(id)a3;
- (void)setTextColor:(id)a3;
@end

@implementation SUUIProductPageHeaderLabel

- (void)setText:(id)a3
{
  v5 = (NSString *)a3;
  p_text = &self->_text;
  if (self->_text != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)p_text, a3);
    p_text = (NSString **)[(SUUIProductPageHeaderLabel *)self setNeedsDisplay];
    v5 = v7;
  }
  MEMORY[0x270F9A758](p_text, v5);
}

- (void)setTextColor:(id)a3
{
  v5 = (UIColor *)a3;
  p_textColor = &self->_textColor;
  if (self->_textColor != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)p_textColor, a3);
    p_textColor = (UIColor **)[(SUUIProductPageHeaderLabel *)self setNeedsDisplay];
    v5 = v7;
  }
  MEMORY[0x270F9A758](p_textColor, v5);
}

- (void)setContentRating:(id)a3
{
  v5 = (NSString *)a3;
  if (self->_contentRating != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_contentRating, a3);
    v6 = [(SUUIProductPageHeaderLabel *)self _imageForContentRating:self->_contentRating];
    contentRatingImage = self->_contentRatingImage;
    self->_contentRatingImage = v6;

    [(SUUIProductPageHeaderLabel *)self setNeedsDisplay];
    v5 = v8;
  }
}

- (void)setSecondaryContentRatingImages:(id)a3
{
  v5 = (NSArray *)a3;
  p_secondaryContentRatingImages = &self->_secondaryContentRatingImages;
  if (self->_secondaryContentRatingImages != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)p_secondaryContentRatingImages, a3);
    p_secondaryContentRatingImages = (NSArray **)[(SUUIProductPageHeaderLabel *)self setNeedsDisplay];
    v5 = v7;
  }
  MEMORY[0x270F9A758](p_secondaryContentRatingImages, v5);
}

- (void)setRatingColor:(id)a3
{
  v5 = (UIColor *)a3;
  p_ratingColor = &self->_ratingColor;
  if (self->_ratingColor != v5)
  {
    v9 = v5;
    objc_storeStrong((id *)p_ratingColor, a3);
    v7 = [(SUUIProductPageHeaderLabel *)self _imageForContentRating:self->_contentRating];
    contentRatingImage = self->_contentRatingImage;
    self->_contentRatingImage = v7;

    p_ratingColor = (UIColor **)[(SUUIProductPageHeaderLabel *)self setNeedsDisplay];
    v5 = v9;
  }
  MEMORY[0x270F9A758](p_ratingColor, v5);
}

- (double)secondaryImageWidth
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (![(NSArray *)self->_secondaryContentRatingImages count]) {
    return 0.0;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = self->_secondaryContentRatingImages;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    double v7 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "size", (void)v11);
        double v7 = v7 + v9 + 5.0;
      }
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  else
  {
    double v7 = 0.0;
  }

  return v7;
}

- (void)drawRect:(CGRect)a3
{
  [(SUUIProductPageHeaderLabel *)self bounds];
  double v5 = v4;
  CGFloat v7 = v6;
  v8 = (double *)MEMORY[0x263F00148];
  double v9 = [(SUUIProductPageHeaderLabel *)self _newTextFramesetter];
  Mutable = CGPathCreateMutable();
  v101.origin.x = 0.0;
  v101.origin.y = 0.0;
  double v85 = v5;
  v101.size.double width = v5;
  v101.size.height = v7;
  CGPathAddRect(Mutable, 0, v101);
  v97.CFIndex location = 0;
  v97.length = 0;
  Frame = CTFramesetterCreateFrame(v9, v97, Mutable, 0);
  CFRelease(Mutable);
  CFArrayRef Lines = CTFrameGetLines(Frame);
  CFIndex Count = CFArrayGetCount(Lines);
  long long v14 = (CGPoint *)malloc_type_malloc(16 * Count, 0x1000040451B5BE8uLL);
  cf = Frame;
  v15 = Frame;
  uint64_t v16 = Count;
  v98.CFIndex location = 0;
  v98.length = 0;
  CTFrameGetLineOrigins(v15, v98, v14);
  [(SUUIProductPageHeaderLabel *)self secondaryImageWidth];
  double v18 = v17;
  [(UIImage *)self->_contentRatingImage size];
  if (Count == 1)
  {
    if (self->_contentRatingImage
      && (double v20 = v18 + v19 + 5.0,
          ValueAtIndex = (const __CTLine *)CFArrayGetValueAtIndex(Lines, 0),
          CGRect BoundsWithOptions = CTLineGetBoundsWithOptions(ValueAtIndex, 0),
          double v22 = v5 - v20,
          BoundsWithOptions.size.width > v22))
    {
      CFRelease(cf);
      free(v14);
      v23 = CGPathCreateMutable();
      v103.origin.x = 0.0;
      v103.origin.y = 0.0;
      v103.size.double width = v22;
      v103.size.height = v7;
      CGPathAddRect(v23, 0, v103);
      v99.CFIndex location = 0;
      v99.length = 0;
      v24 = CTFramesetterCreateFrame(v9, v99, v23, 0);
      CFRelease(v23);
      CFArrayRef Lines = CTFrameGetLines(v24);
      CFIndex v25 = CFArrayGetCount(Lines);
      long long v14 = (CGPoint *)malloc_type_malloc(16 * v25, 0x1000040451B5BE8uLL);
      cf = v24;
      v26 = v24;
      uint64_t v16 = v25;
      v100.CFIndex location = 0;
      v100.length = 0;
      CTFrameGetLineOrigins(v26, v100, v14);
    }
    else
    {
      uint64_t v16 = 1;
    }
  }
  double v27 = *v8;
  double v28 = v8[1];
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  CGContextTranslateCTM(CurrentContext, 0.0, v7);
  CGContextScaleCTM(CurrentContext, 1.0, -1.0);
  long long v30 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&v96.a = *MEMORY[0x263F000D0];
  *(_OWORD *)&v96.c = v30;
  *(_OWORD *)&v96.tx = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  c = CurrentContext;
  CGContextSetTextMatrix(CurrentContext, &v96);
  uint64_t v31 = v16 - 1;
  v79 = v9;
  double v82 = v28;
  double v83 = v27;
  if (v16 < 1)
  {
    v88 = 0;
  }
  else
  {
    CFIndex v32 = 0;
    p_x = &v14[v31].x;
    v34 = p_x + 1;
    v81 = v14;
    CFArrayRef v80 = Lines;
    uint64_t v93 = v16 - 1;
    v90 = p_x + 1;
    v88 = 0;
    v89 = p_x;
    uint64_t v84 = v16;
    do
    {
      v35 = (const __CTLine *)CFArrayGetValueAtIndex(Lines, v32);
      v95 = v35;
      if (v32 == v31)
      {
        CFIndex location = CTLineGetStringRange(v35).location;
        CFRange VisibleStringRange = CTFrameGetVisibleStringRange(cf);
        if (VisibleStringRange.location + VisibleStringRange.length >= [(NSString *)self->_text length])
        {
          v44 = 0;
        }
        else
        {
          v38 = [(NSString *)self->_text substringFromIndex:location];
          id v39 = objc_alloc(MEMORY[0x263F086A0]);
          v40 = [(SUUIProductPageHeaderLabel *)self _textAttributes];
          CFAttributedStringRef v41 = (const __CFAttributedString *)[v39 initWithString:v38 attributes:v40];

          CTLineRef v42 = CTLineCreateWithAttributedString(v41);
          CFAttributedStringRef v43 = v41;
          v44 = v42;
          CFRelease(v43);
        }
        id v46 = objc_alloc(MEMORY[0x263F086A0]);
        v47 = [(SUUIProductPageHeaderLabel *)self _textAttributes];
        CFAttributedStringRef v48 = (const __CFAttributedString *)[v46 initWithString:@"…" attributes:v47];

        CFAttributedStringRef v91 = v48;
        v49 = CTLineCreateWithAttributedString(v48);
        contentRatingImage = self->_contentRatingImage;
        if (contentRatingImage)
        {
          [(UIImage *)contentRatingImage size];
          double v52 = v51 + 5.0;
        }
        else
        {
          double v52 = 0.0;
        }
        double v53 = v85 - v52 - v18;
        if (v44) {
          v54 = v44;
        }
        else {
          v54 = v95;
        }
        v92 = v49;
        TruncatedLine = CTLineCreateTruncatedLine(v54, v53, kCTLineTruncationEnd, v49);
        v45 = TruncatedLine;
        if (self->_contentRatingImage)
        {
          CGRect v104 = CTLineGetBoundsWithOptions(TruncatedLine, 0);
          *(float *)&v104.origin.x = *p_x + v104.size.width + 5.0;
          double v83 = roundf(*(float *)&v104.origin.x);
          CGFloat v56 = v7 - *v34;
          [(UIImage *)self->_contentRatingImage size];
          float v58 = v56 - v57 + 0.0;
          double v82 = roundf(v58);
        }
        if ([(NSArray *)self->_secondaryContentRatingImages count])
        {
          v59 = self->_contentRatingImage;
          v87 = v44;
          if (v59)
          {
            [(UIImage *)v59 size];
            double v61 = v60 + 5.0 + 5.0;
          }
          else
          {
            double v61 = 5.0;
          }
          CGRect v105 = CTLineGetBoundsWithOptions(v45, 0);
          double width = v105.size.width;
          v63 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSArray count](self->_secondaryContentRatingImages, "count"));
          if ([(NSArray *)self->_secondaryContentRatingImages count])
          {
            unint64_t v64 = 0;
            do
            {
              v65 = [(NSArray *)self->_secondaryContentRatingImages objectAtIndex:v64];
              float v66 = v61 + width + *v89;
              double v67 = roundf(v66);
              CGFloat v68 = v7 - *v90;
              [v65 size];
              float v70 = v68 - v69 + -1.0;
              v71 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", v67, roundf(v70));
              [v63 addObject:v71];
              [v65 size];
              double v61 = v61 + v72 + 5.0;

              ++v64;
            }
            while ([(NSArray *)self->_secondaryContentRatingImages count] > v64);
          }
          uint64_t v73 = [MEMORY[0x263EFF8C0] arrayWithArray:v63];

          v88 = (void *)v73;
          long long v14 = v81;
          CFArrayRef Lines = v80;
          uint64_t v16 = v84;
          v44 = v87;
        }
        else
        {
          uint64_t v16 = v84;
        }
        CFRelease(v92);
        CFRelease(v91);
        if (v44) {
          CFRelease(v44);
        }
        p_x = v89;
        v34 = v90;
      }
      else
      {
        v45 = 0;
      }
      CGContextSetTextPosition(c, v14[v32].x, v14[v32].y);
      if (v45) {
        v74 = v45;
      }
      else {
        v74 = v95;
      }
      CTLineDraw(v74, c);
      if (v45) {
        CFRelease(v45);
      }
      ++v32;
      uint64_t v31 = v93;
    }
    while (v32 != v16);
  }
  CGContextRestoreGState(c);
  v75 = self->_contentRatingImage;
  if (v75) {
    -[UIImage drawAtPoint:](v75, "drawAtPoint:", v83, v82);
  }
  if ([(NSArray *)self->_secondaryContentRatingImages count]
    && [(NSArray *)self->_secondaryContentRatingImages count])
  {
    unint64_t v76 = 0;
    do
    {
      v77 = [(NSArray *)self->_secondaryContentRatingImages objectAtIndex:v76];
      v78 = [v88 objectAtIndex:v76];
      [v78 CGPointValue];
      objc_msgSend(v77, "drawAtPoint:");

      ++v76;
    }
    while ([(NSArray *)self->_secondaryContentRatingImages count] > v76);
  }
  free(v14);
  CFRelease(cf);
  CFRelease(v79);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height = a3.height;
  double width = a3.width;
  double v6 = [(SUUIProductPageHeaderLabel *)self _newTextFramesetter];
  v28.CFIndex location = 0;
  v28.length = 0;
  v33.double width = width;
  v33.CGFloat height = height;
  CGSize v7 = CTFramesetterSuggestFrameSizeWithConstraints(v6, v28, 0, v33, 0);
  double v8 = v7.height;
  Mutable = CGPathCreateMutable();
  v36.origin.x = 0.0;
  v36.origin.y = 0.0;
  v36.size.double width = v7.width;
  v36.size.CGFloat height = v7.height;
  CGPathAddRect(Mutable, 0, v36);
  v29.CFIndex location = 0;
  v29.length = 0;
  Frame = CTFramesetterCreateFrame(v6, v29, Mutable, 0);
  CFRelease(Mutable);
  CFArrayRef Lines = CTFrameGetLines(Frame);
  CFIndex Count = CFArrayGetCount(Lines);
  [(SUUIProductPageHeaderLabel *)self secondaryImageWidth];
  double v14 = v13;
  [(UIImage *)self->_contentRatingImage size];
  if (Count == 1)
  {
    double v16 = v14 + v15 + 5.0;
    if (v16 > 0.0)
    {
      ValueAtIndex = (const __CTLine *)CFArrayGetValueAtIndex(Lines, 0);
      CGRect BoundsWithOptions = CTLineGetBoundsWithOptions(ValueAtIndex, 0);
      double v18 = width - v16;
      if (BoundsWithOptions.size.width <= v18) {
        goto LABEL_7;
      }
      CFRelease(Frame);
      v30.CFIndex location = 0;
      v30.length = 0;
      v34.double width = v18;
      v34.CGFloat height = height;
      double v8 = CTFramesetterSuggestFrameSizeWithConstraints(v6, v30, 0, v34, 0).height;
      double v19 = CGPathCreateMutable();
      v38.origin.x = 0.0;
      v38.origin.y = 0.0;
      v38.size.double width = v18;
      v38.size.CGFloat height = height;
      CGPathAddRect(v19, 0, v38);
      v31.CFIndex location = 0;
      v31.length = 0;
      Frame = CTFramesetterCreateFrame(v6, v31, v19, 0);
      CFRelease(v19);
      CFArrayRef Lines = CTFrameGetLines(Frame);
      CFIndex Count = CFArrayGetCount(Lines);
    }
  }
  if (Count >= 3)
  {
    v27.x = 0.0;
    v27.y = 0.0;
    v32.CFIndex location = 1;
    v32.length = 1;
    CTFrameGetLineOrigins(Frame, v32, &v27);
    double v20 = (const __CTLine *)CFArrayGetValueAtIndex(Lines, 1);
    CGRect v39 = CTLineGetBoundsWithOptions(v20, 0);
    double v8 = v8 - v27.y - v39.origin.y;
  }
LABEL_7:
  float v21 = v8;
  double v22 = roundf(v21);
  float v23 = width;
  double v24 = roundf(v23);
  CFRelease(Frame);
  CFRelease(v6);
  double v25 = v24;
  double v26 = v22;
  result.CGFloat height = v26;
  result.double width = v25;
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SUUIProductPageHeaderLabel;
  [(SUUIProductPageHeaderLabel *)&v3 layoutSubviews];
  [(SUUIProductPageHeaderLabel *)self setNeedsDisplay];
}

- (id)_imageForContentRating:(id)a3
{
  return SUUIBadgeImageFromText(a3, self->_ratingColor, 1);
}

- (__CTFramesetter)_newTextFramesetter
{
  id v3 = objc_alloc(MEMORY[0x263F086A0]);
  text = self->_text;
  double v5 = [(SUUIProductPageHeaderLabel *)self _textAttributes];
  CFAttributedStringRef v6 = (const __CFAttributedString *)[v3 initWithString:text attributes:v5];

  CGSize v7 = CTFramesetterCreateWithAttributedString(v6);
  CFRelease(v6);
  return v7;
}

- (id)_textAttributes
{
  v10[2] = *MEMORY[0x263EF8340];
  v9[0] = *MEMORY[0x263F814F0];
  double v3 = 22.0;
  if (!self->_isPad) {
    double v3 = 17.0;
  }
  double v4 = [MEMORY[0x263F81708] systemFontOfSize:v3];
  v10[0] = v4;
  v9[1] = *MEMORY[0x263F81500];
  textColor = self->_textColor;
  CFAttributedStringRef v6 = textColor;
  if (!textColor)
  {
    CFAttributedStringRef v6 = [MEMORY[0x263F825C8] blackColor];
  }
  v10[1] = v6;
  CGSize v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
  if (!textColor) {

  }
  return v7;
}

- (NSString)text
{
  return self->_text;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (NSString)contentRating
{
  return self->_contentRating;
}

- (BOOL)isPad
{
  return self->_isPad;
}

- (void)setIsPad:(BOOL)a3
{
  self->_isPad = a3;
}

- (NSArray)secondaryContentRatingImages
{
  return self->_secondaryContentRatingImages;
}

- (UIColor)ratingColor
{
  return self->_ratingColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ratingColor, 0);
  objc_storeStrong((id *)&self->_secondaryContentRatingImages, 0);
  objc_storeStrong((id *)&self->_contentRatingImage, 0);
  objc_storeStrong((id *)&self->_contentRating, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end