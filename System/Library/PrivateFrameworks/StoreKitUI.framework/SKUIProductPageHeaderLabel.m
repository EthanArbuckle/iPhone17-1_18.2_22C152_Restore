@interface SKUIProductPageHeaderLabel
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
- (void)secondaryImageWidth;
- (void)setContentRating:(id)a3;
- (void)setIsPad:(BOOL)a3;
- (void)setRatingColor:(id)a3;
- (void)setSecondaryContentRatingImages:(id)a3;
- (void)setText:(id)a3;
- (void)setTextColor:(id)a3;
@end

@implementation SKUIProductPageHeaderLabel

- (void)setText:(id)a3
{
  v5 = (NSString *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v6 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v6) {
        -[SKUIProductPageHeaderLabel setText:](v6, v7, v8, v9, v10, v11, v12, v13);
      }
    }
  }
  if (self->_text != v5)
  {
    objc_storeStrong((id *)&self->_text, a3);
    [(SKUIProductPageHeaderLabel *)self setNeedsDisplay];
  }
}

- (void)setTextColor:(id)a3
{
  v5 = (UIColor *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v6 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v6) {
        -[SKUIProductPageHeaderLabel setTextColor:](v6, v7, v8, v9, v10, v11, v12, v13);
      }
    }
  }
  if (self->_textColor != v5)
  {
    objc_storeStrong((id *)&self->_textColor, a3);
    [(SKUIProductPageHeaderLabel *)self setNeedsDisplay];
  }
}

- (void)setContentRating:(id)a3
{
  v5 = (NSString *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v6 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v6) {
        -[SKUIProductPageHeaderLabel setContentRating:](v6, v7, v8, v9, v10, v11, v12, v13);
      }
    }
  }
  if (self->_contentRating != v5)
  {
    objc_storeStrong((id *)&self->_contentRating, a3);
    v14 = [(SKUIProductPageHeaderLabel *)self _imageForContentRating:self->_contentRating];
    contentRatingImage = self->_contentRatingImage;
    self->_contentRatingImage = v14;

    [(SKUIProductPageHeaderLabel *)self setNeedsDisplay];
  }
}

- (void)setSecondaryContentRatingImages:(id)a3
{
  v5 = (NSArray *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v6 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v6) {
        -[SKUIProductPageHeaderLabel setSecondaryContentRatingImages:](v6, v7, v8, v9, v10, v11, v12, v13);
      }
    }
  }
  if (self->_secondaryContentRatingImages != v5)
  {
    objc_storeStrong((id *)&self->_secondaryContentRatingImages, a3);
    [(SKUIProductPageHeaderLabel *)self setNeedsDisplay];
  }
}

- (void)setRatingColor:(id)a3
{
  v5 = (UIColor *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v6 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v6) {
        -[SKUIProductPageHeaderLabel setRatingColor:](v6, v7, v8, v9, v10, v11, v12, v13);
      }
    }
  }
  if (self->_ratingColor != v5)
  {
    objc_storeStrong((id *)&self->_ratingColor, a3);
    v14 = [(SKUIProductPageHeaderLabel *)self _imageForContentRating:self->_contentRating];
    contentRatingImage = self->_contentRatingImage;
    self->_contentRatingImage = v14;

    [(SKUIProductPageHeaderLabel *)self setNeedsDisplay];
  }
}

- (double)secondaryImageWidth
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKUIProductPageHeaderLabel *)v3 secondaryImageWidth];
      }
    }
  }
  if (![(NSArray *)self->_secondaryContentRatingImages count]) {
    return 0.0;
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v11 = self->_secondaryContentRatingImages;
  uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v20;
    double v15 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "size", (void)v19);
        double v15 = v15 + v17 + 5.0;
      }
      uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v13);
  }
  else
  {
    double v15 = 0.0;
  }

  return v15;
}

- (void)drawRect:(CGRect)a3
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v4) {
        -[SKUIProductPageHeaderLabel drawRect:](v4, v5, v6, v7, v8, v9, v10, v11);
      }
    }
  }
  [(SKUIProductPageHeaderLabel *)self bounds];
  double v13 = v12;
  CGFloat v15 = v14;
  v16 = (double *)MEMORY[0x1E4F1DAD8];
  double v17 = [(SKUIProductPageHeaderLabel *)self _newTextFramesetter];
  Mutable = CGPathCreateMutable();
  v108.origin.x = 0.0;
  v108.origin.y = 0.0;
  double v92 = v13;
  v108.size.double width = v13;
  v108.size.height = v15;
  CGPathAddRect(Mutable, 0, v108);
  v104.CFIndex location = 0;
  v104.length = 0;
  Frame = CTFramesetterCreateFrame(v17, v104, Mutable, 0);
  CFRelease(Mutable);
  CFArrayRef Lines = CTFrameGetLines(Frame);
  CFIndex Count = CFArrayGetCount(Lines);
  long long v22 = (CGPoint *)malloc_type_malloc(16 * Count, 0x1000040451B5BE8uLL);
  cf = Frame;
  v23 = Frame;
  uint64_t v24 = Count;
  v105.CFIndex location = 0;
  v105.length = 0;
  CTFrameGetLineOrigins(v23, v105, v22);
  [(SKUIProductPageHeaderLabel *)self secondaryImageWidth];
  double v26 = v25;
  [(UIImage *)self->_contentRatingImage size];
  if (Count == 1)
  {
    if (self->_contentRatingImage
      && (double v28 = v26 + v27 + 5.0,
          ValueAtIndex = (const __CTLine *)CFArrayGetValueAtIndex(Lines, 0),
          CGRect BoundsWithOptions = CTLineGetBoundsWithOptions(ValueAtIndex, 0),
          double v30 = v13 - v28,
          BoundsWithOptions.size.width > v30))
    {
      CFRelease(cf);
      free(v22);
      v31 = CGPathCreateMutable();
      v110.origin.x = 0.0;
      v110.origin.y = 0.0;
      v110.size.double width = v30;
      v110.size.height = v15;
      CGPathAddRect(v31, 0, v110);
      v106.CFIndex location = 0;
      v106.length = 0;
      v32 = CTFramesetterCreateFrame(v17, v106, v31, 0);
      CFRelease(v31);
      CFArrayRef Lines = CTFrameGetLines(v32);
      CFIndex v33 = CFArrayGetCount(Lines);
      long long v22 = (CGPoint *)malloc_type_malloc(16 * v33, 0x1000040451B5BE8uLL);
      cf = v32;
      v34 = v32;
      uint64_t v24 = v33;
      v107.CFIndex location = 0;
      v107.length = 0;
      CTFrameGetLineOrigins(v34, v107, v22);
    }
    else
    {
      uint64_t v24 = 1;
    }
  }
  double v89 = v16[1];
  double v90 = *v16;
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  CGContextTranslateCTM(CurrentContext, 0.0, v15);
  CGContextScaleCTM(CurrentContext, 1.0, -1.0);
  long long v36 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&v103.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v103.c = v36;
  *(_OWORD *)&v103.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  c = CurrentContext;
  CGContextSetTextMatrix(CurrentContext, &v103);
  uint64_t v37 = v24 - 1;
  v86 = v17;
  if (v24 < 1)
  {
    v95 = 0;
  }
  else
  {
    CFIndex v38 = 0;
    p_x = &v22[v37].x;
    v40 = p_x + 1;
    v88 = v22;
    CFArrayRef v87 = Lines;
    v97 = p_x + 1;
    v95 = 0;
    v96 = p_x;
    uint64_t v91 = v24;
    uint64_t v100 = v24 - 1;
    do
    {
      v41 = (const __CTLine *)CFArrayGetValueAtIndex(Lines, v38);
      v102 = v41;
      if (v38 == v37)
      {
        CFIndex location = CTLineGetStringRange(v41).location;
        CFRange VisibleStringRange = CTFrameGetVisibleStringRange(cf);
        if (VisibleStringRange.location + VisibleStringRange.length >= [(NSString *)self->_text length])
        {
          v51 = 0;
          unint64_t v48 = 0x1E4F28000uLL;
        }
        else
        {
          v44 = [(NSString *)self->_text substringFromIndex:location];
          id v45 = objc_alloc(MEMORY[0x1E4F28B18]);
          v46 = [(SKUIProductPageHeaderLabel *)self _textAttributes];
          CFAttributedStringRef v47 = (const __CFAttributedString *)[v45 initWithString:v44 attributes:v46];

          unint64_t v48 = 0x1E4F28000;
          CTLineRef v49 = CTLineCreateWithAttributedString(v47);
          CFAttributedStringRef v50 = v47;
          v51 = v49;
          CFRelease(v50);
        }
        id v53 = objc_alloc(*(Class *)(v48 + 2840));
        v54 = [(SKUIProductPageHeaderLabel *)self _textAttributes];
        CFAttributedStringRef v55 = (const __CFAttributedString *)[v53 initWithString:@"…" attributes:v54];

        CFAttributedStringRef v99 = v55;
        v56 = CTLineCreateWithAttributedString(v55);
        contentRatingImage = self->_contentRatingImage;
        if (contentRatingImage)
        {
          [(UIImage *)contentRatingImage size];
          double v59 = v58 + 5.0;
        }
        else
        {
          double v59 = 0.0;
        }
        double v60 = v92 - v59 - v26;
        if (v51) {
          v61 = v51;
        }
        else {
          v61 = v102;
        }
        v98 = v56;
        TruncatedLine = CTLineCreateTruncatedLine(v61, v60, kCTLineTruncationEnd, v56);
        v52 = TruncatedLine;
        if (self->_contentRatingImage)
        {
          CGRect v111 = CTLineGetBoundsWithOptions(TruncatedLine, 0);
          *(float *)&v111.origin.x = *p_x + v111.size.width + 5.0;
          double v90 = roundf(*(float *)&v111.origin.x);
          CGFloat v63 = v15 - *v40;
          [(UIImage *)self->_contentRatingImage size];
          float v65 = v63 - v64 + 0.0;
          double v89 = roundf(v65);
        }
        if ([(NSArray *)self->_secondaryContentRatingImages count])
        {
          v66 = self->_contentRatingImage;
          v94 = v51;
          if (v66)
          {
            [(UIImage *)v66 size];
            double v68 = v67 + 5.0 + 5.0;
          }
          else
          {
            double v68 = 5.0;
          }
          CGRect v112 = CTLineGetBoundsWithOptions(v52, 0);
          double width = v112.size.width;
          v70 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](self->_secondaryContentRatingImages, "count"));
          if ([(NSArray *)self->_secondaryContentRatingImages count])
          {
            unint64_t v71 = 0;
            do
            {
              v72 = [(NSArray *)self->_secondaryContentRatingImages objectAtIndex:v71];
              float v73 = v68 + width + *v96;
              double v74 = roundf(v73);
              CGFloat v75 = v15 - *v97;
              [v72 size];
              float v77 = v75 - v76 + -1.0;
              v78 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v74, roundf(v77));
              [v70 addObject:v78];
              [v72 size];
              double v68 = v68 + v79 + 5.0;

              ++v71;
            }
            while ([(NSArray *)self->_secondaryContentRatingImages count] > v71);
          }
          uint64_t v80 = [MEMORY[0x1E4F1C978] arrayWithArray:v70];

          v95 = (void *)v80;
          long long v22 = v88;
          CFArrayRef Lines = v87;
          v51 = v94;
        }
        CFRelease(v98);
        CFRelease(v99);
        uint64_t v24 = v91;
        if (v51) {
          CFRelease(v51);
        }
        p_x = v96;
        v40 = v97;
      }
      else
      {
        v52 = 0;
      }
      CGContextSetTextPosition(c, v22[v38].x, v22[v38].y);
      if (v52) {
        v81 = v52;
      }
      else {
        v81 = v102;
      }
      CTLineDraw(v81, c);
      if (v52) {
        CFRelease(v52);
      }
      ++v38;
      uint64_t v37 = v100;
    }
    while (v38 != v24);
  }
  CGContextRestoreGState(c);
  v82 = self->_contentRatingImage;
  if (v82) {
    -[UIImage drawAtPoint:](v82, "drawAtPoint:", v90, v89);
  }
  if ([(NSArray *)self->_secondaryContentRatingImages count]
    && [(NSArray *)self->_secondaryContentRatingImages count])
  {
    unint64_t v83 = 0;
    do
    {
      v84 = [(NSArray *)self->_secondaryContentRatingImages objectAtIndex:v83];
      v85 = [v95 objectAtIndex:v83];
      [v85 CGPointValue];
      objc_msgSend(v84, "drawAtPoint:");

      ++v83;
    }
    while ([(NSArray *)self->_secondaryContentRatingImages count] > v83);
  }
  free(v22);
  CFRelease(cf);
  CFRelease(v86);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height = a3.height;
  double width = a3.width;
  uint64_t v6 = [(SKUIProductPageHeaderLabel *)self _newTextFramesetter];
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
  [(SKUIProductPageHeaderLabel *)self secondaryImageWidth];
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
      long long v19 = CGPathCreateMutable();
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
    long long v20 = (const __CTLine *)CFArrayGetValueAtIndex(Lines, 1);
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
}

- (id)_imageForContentRating:(id)a3
{
  return SKUIBadgeImageFromText(a3, self->_ratingColor, 1);
}

- (__CTFramesetter)_newTextFramesetter
{
  id v3 = objc_alloc(MEMORY[0x1E4F28B18]);
  text = self->_text;
  uint64_t v5 = [(SKUIProductPageHeaderLabel *)self _textAttributes];
  CFAttributedStringRef v6 = (const __CFAttributedString *)[v3 initWithString:text attributes:v5];

  CGSize v7 = CTFramesetterCreateWithAttributedString(v6);
  CFRelease(v6);
  return v7;
}

- (id)_textAttributes
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v9[0] = *MEMORY[0x1E4FB06F8];
  double v3 = 22.0;
  if (!self->_isPad) {
    double v3 = 17.0;
  }
  BOOL v4 = [MEMORY[0x1E4FB08E0] systemFontOfSize:v3];
  v10[0] = v4;
  v9[1] = *MEMORY[0x1E4FB0700];
  textColor = self->_textColor;
  CFAttributedStringRef v6 = textColor;
  if (!textColor)
  {
    CFAttributedStringRef v6 = [MEMORY[0x1E4FB1618] blackColor];
  }
  v10[1] = v6;
  CGSize v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
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

- (void)setText:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setTextColor:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setContentRating:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setSecondaryContentRatingImages:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setRatingColor:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)secondaryImageWidth
{
}

- (void)drawRect:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end