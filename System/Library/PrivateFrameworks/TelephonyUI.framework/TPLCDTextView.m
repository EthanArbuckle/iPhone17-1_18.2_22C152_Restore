@interface TPLCDTextView
+ (double)defaultMinimumFontSize;
- (BOOL)animates;
- (CGRect)textRect;
- (CGSize)sizeToFit;
- (TPLCDTextView)initWithFrame:(CGRect)a3;
- (id)text;
- (void)_drawTextInRect:(CGRect)a3 verticallyOffset:(BOOL)a4;
- (void)_finishedScrolling;
- (void)_scheduleStartScrolling;
- (void)_setupForAnimationIfNecessary;
- (void)_startScrolling;
- (void)_tearDownAnimation;
- (void)dealloc;
- (void)drawRect:(CGRect)a3;
- (void)resetAnimation;
- (void)setAnimatesIfTruncated:(BOOL)a3;
- (void)setCenterText:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setLCDTextFont:(id)a3;
- (void)setLeftTruncatesText:(BOOL)a3;
- (void)setMinimumFontSize:(double)a3;
- (void)setShadowColor:(id)a3;
- (void)setText:(id)a3;
- (void)setTextColor:(id)a3;
- (void)startAnimating;
- (void)stopAnimating;
@end

@implementation TPLCDTextView

+ (double)defaultMinimumFontSize
{
  return 18.0;
}

- (TPLCDTextView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TPLCDTextView;
  v3 = -[TPLCDTextView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(TPLCDTextView *)v3 setOpaque:0];
    [(TPLCDTextView *)v4 setEnabled:0];
    *((unsigned char *)v4 + 504) |= 2u;
    v4->_minFontSize = 18.0;
  }
  return v4;
}

- (void)dealloc
{
  [(TPLCDTextView *)self stopAnimating];
  v3.receiver = self;
  v3.super_class = (Class)TPLCDTextView;
  [(TPLCDTextView *)&v3 dealloc];
}

- (CGRect)textRect
{
  v86[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = 504;
  if ((*((unsigned char *)self + 504) & 1) == 0)
  {
    [(TPLCDTextView *)self bounds];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    if (self->_scrollingView)
    {
      double minFontSize = self->_minFontSize;
      v11 = [MEMORY[0x1E4FB08E0] _thinSystemFontOfSize:minFontSize];
      if ([(NSString *)self->_text length])
      {
        text = self->_text;
        uint64_t v13 = *MEMORY[0x1E4FB0818];
        v85[0] = *MEMORY[0x1E4FB06F8];
        v85[1] = v13;
        v86[0] = v11;
        v14 = [NSNumber numberWithInteger:0];
        v84 = v14;
        v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v84 count:1];
        v86[1] = v15;
        v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v86 forKeys:v85 count:2];
        -[NSString boundingRectWithSize:options:attributes:context:](text, "boundingRectWithSize:options:attributes:context:", 0, v16, 0, v7, v9);
        double v18 = v17;
        CGFloat v20 = v19;
      }
      else
      {
        double v18 = *MEMORY[0x1E4F1DB30];
        CGFloat v20 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
      }
    }
    else
    {
      if ([(NSString *)self->_text length])
      {
        v21 = self->_text;
        font = self->_font;
        uint64_t v23 = *MEMORY[0x1E4FB0818];
        v82[0] = *MEMORY[0x1E4FB06F8];
        v82[1] = v23;
        v83[0] = font;
        v24 = [NSNumber numberWithInteger:0];
        v81 = v24;
        v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v81 count:1];
        v83[1] = v25;
        v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v83 forKeys:v82 count:2];
        -[NSString boundingRectWithSize:options:attributes:context:](v21, "boundingRectWithSize:options:attributes:context:", 0, v26, 0, v7, v9);
        double v28 = v27;
      }
      else
      {
        double v28 = *MEMORY[0x1E4F1DB30];
      }
      [(UIFont *)self->_font pointSize];
      double minFontSize = v29;
      v11 = self->_font;
      BOOL v30 = v28 > v7;
      if (minFontSize > self->_minFontSize && v28 > v7)
      {
        uint64_t v71 = 504;
        uint64_t v32 = *MEMORY[0x1E4FB06F8];
        uint64_t v33 = *MEMORY[0x1E4FB0818];
        double v34 = *MEMORY[0x1E4F1DB30];
        do
        {
          v35 = v11;
          double minFontSize = minFontSize + -1.0;
          objc_msgSend(MEMORY[0x1E4FB08E0], "_thinSystemFontOfSize:", minFontSize, v71);
          v11 = (UIFont *)objc_claimAutoreleasedReturnValue();

          double v36 = v34;
          if ([(NSString *)self->_text length])
          {
            v37 = self->_text;
            v79[1] = v33;
            v80[0] = v11;
            v79[0] = v32;
            v38 = [NSNumber numberWithInteger:0];
            v78 = v38;
            v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v78 count:1];
            v80[1] = v39;
            v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v80 forKeys:v79 count:2];
            -[NSString boundingRectWithSize:options:attributes:context:](v37, "boundingRectWithSize:options:attributes:context:", 0, v40, 0, v7, v9);
            double v36 = v41;
          }
          BOOL v30 = v36 > v7;
        }
        while (minFontSize > self->_minFontSize && v36 > v7);
        uint64_t v3 = v71;
      }
      v43 = [MEMORY[0x1E4FB0850] defaultParagraphStyle];
      v44 = (void *)[v43 mutableCopy];

      BOOL v45 = minFontSize < self->_minFontSize || !v30;
      if (!v45 && (*((unsigned char *)self + 504) & 0x10) != 0)
      {
        [v44 setLineBreakMode:3];
        uint64_t v52 = *MEMORY[0x1E4FB0738];
        v76[0] = *MEMORY[0x1E4FB06F8];
        v76[1] = v52;
        v77[0] = v11;
        v77[1] = v44;
        v76[2] = *MEMORY[0x1E4FB0818];
        v47 = [NSNumber numberWithInteger:0];
        v75 = v47;
        v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v75 count:1];
        v77[2] = v48;
        v49 = (void *)MEMORY[0x1E4F1C9E8];
        v50 = v77;
        v51 = v76;
      }
      else
      {
        [v44 setLineBreakMode:4];
        uint64_t v46 = *MEMORY[0x1E4FB0738];
        v73[0] = *MEMORY[0x1E4FB06F8];
        v73[1] = v46;
        v74[0] = v11;
        v74[1] = v44;
        v73[2] = *MEMORY[0x1E4FB0818];
        v47 = [NSNumber numberWithInteger:0];
        v72 = v47;
        v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v72 count:1];
        v74[2] = v48;
        v49 = (void *)MEMORY[0x1E4F1C9E8];
        v50 = v74;
        v51 = v73;
      }
      v53 = [v49 dictionaryWithObjects:v50 forKeys:v51 count:3];

      if ([(NSString *)self->_text length])
      {
        -[NSString boundingRectWithSize:options:attributes:context:](self->_text, "boundingRectWithSize:options:attributes:context:", 0, v53, 0, v7, v9);
        double v18 = v54;
        CGFloat v20 = v55;
      }
      else
      {
        double v18 = *MEMORY[0x1E4F1DB30];
        CGFloat v20 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
      }
    }
    v56 = self->_font;
    double v57 = 0.0;
    v58 = v11;
    double v59 = 0.0;
    if (v11 != v56)
    {
      [(UIFont *)v56 xHeight];
      double v59 = v60;
      v58 = self->_font;
    }
    if (v11 != v58)
    {
      [(UIFont *)v11 xHeight];
      double v57 = v61;
    }
    self->_fontSize = minFontSize;
    if ((*((unsigned char *)self + 504) & 2) != 0) {
      double v5 = v5 + fmax(round((v7 - v18) * 0.5), 0.0);
    }
    v62 = self->_font;
    if (v62 == v11)
    {
      double v66 = 0.0;
    }
    else
    {
      [(UIFont *)v62 ascender];
      double v64 = (v59 - v57) * 0.5 + v63 - v59;
      [(UIFont *)v11 ascender];
      double v66 = round(v64 - (v65 - v57));
    }
    self->_textRect.origin.double x = v5;
    self->_textRect.origin.double y = v66;
    self->_textRect.size.double width = ceil(v18);
    self->_textRect.size.double height = v20;
    *((unsigned char *)&self->super.super.super.isa + v3) |= 1u;
  }
  double x = self->_textRect.origin.x;
  double y = self->_textRect.origin.y;
  double width = self->_textRect.size.width;
  double height = self->_textRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(TPLCDTextView *)self frame];
  double v9 = v8;
  double v11 = v10;
  v13.receiver = self;
  v13.super_class = (Class)TPLCDTextView;
  -[TPLCDTextView setFrame:](&v13, sel_setFrame_, x, y, width, height);
  if (width != v9 || height != v11)
  {
    *((unsigned char *)self + 504) &= ~1u;
    if ((*((unsigned char *)self + 504) & 4) != 0) {
      [(TPLCDTextView *)self _setupForAnimationIfNecessary];
    }
    if (!self->_scrollingView) {
      [(TPLCDTextView *)self setNeedsDisplay];
    }
  }
}

- (void)setCenterText:(BOOL)a3
{
  char v3 = *((unsigned char *)self + 504);
  if (((((v3 & 2) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      char v4 = 2;
    }
    else {
      char v4 = 0;
    }
    *((unsigned char *)self + 504) = v3 & 0xFD | v4;
    *((unsigned char *)self + 504) &= ~1u;
    [(TPLCDTextView *)self setNeedsDisplay];
  }
}

- (void)setLeftTruncatesText:(BOOL)a3
{
  char v3 = *((unsigned char *)self + 504);
  if (((((v3 & 0x10) == 0) ^ a3) & 1) == 0)
  {
    char v5 = a3 ? 16 : 0;
    *((unsigned char *)self + 504) = v3 & 0xEF | v5;
    double width = self->_textRect.size.width;
    [(TPLCDTextView *)self bounds];
    if (width > v7)
    {
      *((unsigned char *)self + 504) &= ~1u;
      [(TPLCDTextView *)self setNeedsDisplay];
    }
  }
}

- (void)setLCDTextFont:(id)a3
{
  char v5 = (UIFont *)a3;
  p_font = &self->_font;
  if (self->_font != v5)
  {
    double v8 = v5;
    objc_storeStrong((id *)p_font, a3);
    *((unsigned char *)self + 504) &= ~1u;
    double v7 = self->_scrollingView ? self->_scrollingView : (TPLCDTextViewScrollingView *)self;
    p_font = (UIFont **)[(TPLCDTextViewScrollingView *)v7 setNeedsDisplay];
    char v5 = v8;
    if ((*((unsigned char *)self + 504) & 4) != 0)
    {
      p_font = (UIFont **)[(TPLCDTextView *)self _setupForAnimationIfNecessary];
      char v5 = v8;
    }
  }
  MEMORY[0x1F41817F8](p_font, v5);
}

- (void)setMinimumFontSize:(double)a3
{
  if (self->_minFontSize != a3)
  {
    self->_double minFontSize = a3;
    *((unsigned char *)self + 504) &= ~1u;
  }
}

- (void)setText:(id)a3
{
  uint64_t v5 = (uint64_t)a3;
  uint64_t v6 = v5;
  if (self->_text != (NSString *)v5)
  {
    uint64_t v7 = v5;
    uint64_t v5 = objc_msgSend((id)v5, "isEqualToString:");
    uint64_t v6 = v7;
    if ((v5 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_text, a3);
      *((unsigned char *)self + 504) &= ~1u;
      uint64_t v5 = [(TPLCDTextView *)self setNeedsDisplay];
      uint64_t v6 = v7;
      if ((*((unsigned char *)self + 504) & 4) != 0)
      {
        uint64_t v5 = [(TPLCDTextView *)self _setupForAnimationIfNecessary];
        uint64_t v6 = v7;
      }
    }
  }
  MEMORY[0x1F41817F8](v5, v6);
}

- (id)text
{
  return self->_text;
}

- (CGSize)sizeToFit
{
  v12[1] = *MEMORY[0x1E4F143B8];
  text = self->_text;
  font = self->_font;
  uint64_t v11 = *MEMORY[0x1E4FB06F8];
  v12[0] = font;
  char v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  [(NSString *)text sizeWithAttributes:v4];
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (void)_drawTextInRect:(CGRect)a3 verticallyOffset:(BOOL)a4
{
  BOOL v4 = a4;
  double width = a3.size.width;
  double x = a3.origin.x;
  v30[4] = *MEMORY[0x1E4F143B8];
  [(TPLCDTextView *)self textRect];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  v14 = [MEMORY[0x1E4FB08E0] _thinSystemFontOfSize:self->_fontSize];
  v15 = [MEMORY[0x1E4FB0850] defaultParagraphStyle];
  v16 = (void *)[v15 mutableCopy];

  if ((*((unsigned char *)self + 504) & 0x10) != 0) {
    uint64_t v17 = 3;
  }
  else {
    uint64_t v17 = 4;
  }
  [v16 setLineBreakMode:v17];
  [v16 setBaseWritingDirection:0];
  textColor = self->_textColor;
  if (textColor)
  {
    double v19 = textColor;
  }
  else
  {
    double v19 = [MEMORY[0x1E4FB1618] whiteColor];
  }
  CGFloat v20 = v19;
  if (!v4) {
    double v11 = 0.0;
  }
  unsigned int v21 = [(NSString *)self->_text isNaturallyRTL];
  uint64_t v22 = *MEMORY[0x1E4FB0738];
  v29[0] = *MEMORY[0x1E4FB06F8];
  v29[1] = v22;
  v30[0] = v14;
  v30[1] = v16;
  uint64_t v23 = *MEMORY[0x1E4FB0700];
  v30[2] = v20;
  uint64_t v24 = *MEMORY[0x1E4FB0818];
  v29[2] = v23;
  v29[3] = v24;
  v25 = [NSNumber numberWithInteger:v21];
  double v28 = v25;
  v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
  v30[3] = v26;
  double v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:4];

  -[NSString drawInRect:withAttributes:](self->_text, "drawInRect:withAttributes:", v27, x + v9, v11, ceil(width), v13);
}

- (void)setTextColor:(id)a3
{
  double v5 = (UIColor *)a3;
  p_textColor = &self->_textColor;
  if (self->_textColor != v5)
  {
    double v7 = v5;
    objc_storeStrong((id *)p_textColor, a3);
    p_textColor = (UIColor **)[(TPLCDTextView *)self setNeedsDisplay];
    double v5 = v7;
  }
  MEMORY[0x1F41817F8](p_textColor, v5);
}

- (void)setShadowColor:(id)a3
{
  double v5 = (UIColor *)a3;
  p_shadowColor = &self->_shadowColor;
  if (self->_shadowColor != v5)
  {
    double v7 = v5;
    objc_storeStrong((id *)p_shadowColor, a3);
    p_shadowColor = (UIColor **)[(TPLCDTextView *)self setNeedsDisplay];
    double v5 = v7;
  }
  MEMORY[0x1F41817F8](p_shadowColor, v5);
}

- (void)drawRect:(CGRect)a3
{
  if (self->_font && self->_text && !self->_scrollingView)
  {
    [(TPLCDTextView *)self bounds];
    -[TPLCDTextView _drawTextInRect:verticallyOffset:](self, "_drawTextInRect:verticallyOffset:", 1);
  }
}

- (void)_tearDownAnimation
{
  [(TPLCDTextView *)self stopAnimating];
  [(TPLCDTextViewScrollingView *)self->_scrollingView removeFromSuperview];
  scrollingView = self->_scrollingView;
  self->_scrollingView = 0;

  [(TPLCDTextView *)self setClipsSubviews:0];
  [(TPLCDTextView *)self setNeedsDisplay];
}

- (void)_scheduleStartScrolling
{
  *((unsigned char *)self + 504) |= 8u;
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__startScrolling object:0];
  [(TPLCDTextView *)self performSelector:sel__startScrolling withObject:0 afterDelay:2.5];
}

- (void)_setupForAnimationIfNecessary
{
  v42[2] = *MEMORY[0x1E4F143B8];
  char v3 = [MEMORY[0x1E4FB08E0] _thinSystemFontOfSize:self->_minFontSize];
  [(TPLCDTextView *)self bounds];
  double v5 = v4;
  double v7 = v6;
  if ([(NSString *)self->_text length])
  {
    text = self->_text;
    uint64_t v9 = *MEMORY[0x1E4FB0818];
    v41[0] = *MEMORY[0x1E4FB06F8];
    v41[1] = v9;
    v42[0] = v3;
    double v10 = [NSNumber numberWithInteger:0];
    v40 = v10;
    double v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v40 count:1];
    v42[1] = v11;
    double v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:2];
    -[NSString boundingRectWithSize:options:attributes:context:](text, "boundingRectWithSize:options:attributes:context:", 0, v12, 0, v5, v7);
    double v14 = v13;
    double v16 = v15;
  }
  else
  {
    double v14 = *MEMORY[0x1E4F1DB30];
    double v16 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  if (v14 > v5)
  {
    [(UIFont *)self->_font xHeight];
    double v18 = v17;
    [v3 xHeight];
    double v20 = v19;
    double v21 = ceil(v14);
    double v22 = (v18 - v19) * 0.5;
    [(UIFont *)self->_font ascender];
    double v24 = v22 + v23 - v18;
    [v3 ascender];
    double v26 = round(v24 - (v25 - v20));
    double v27 = ceil(v16 + 1.0);
    double v28 = v5 + v21 + 30.0;
    scrollingView = self->_scrollingView;
    if (!scrollingView)
    {
      v38 = -[TPLCDTextViewScrollingView initWithFrame:owner:]([TPLCDTextViewScrollingView alloc], "initWithFrame:owner:", self, -(v21 + 30.0), v26, v28, v27);
      v39 = self->_scrollingView;
      self->_scrollingView = v38;

      [(TPLCDTextView *)self addSubview:self->_scrollingView];
      [(TPLCDTextView *)self setNeedsDisplay];
      if ((*((unsigned char *)self + 504) & 8) != 0) {
        [(TPLCDTextView *)self _scheduleStartScrolling];
      }
      goto LABEL_21;
    }
    if (self->_animation)
    {
      BOOL v30 = [(UIFrameAnimation *)self->_animation target];
      v31 = self->_scrollingView;

      if (v30 == v31)
      {
LABEL_21:
        [(TPLCDTextView *)self setClipsSubviews:1];
        goto LABEL_22;
      }
      scrollingView = self->_scrollingView;
    }
    [(TPLCDTextViewScrollingView *)scrollingView frame];
    if (v34 != v26 || v28 != v32 || v27 != v33)
    {
      -[TPLCDTextViewScrollingView setFrame:](self->_scrollingView, "setFrame:", -(v21 + 30.0), v26, v28, v27);
      [(TPLCDTextViewScrollingView *)self->_scrollingView setNeedsDisplay];
    }
    goto LABEL_21;
  }
  char v37 = *((unsigned char *)self + 504);
  [(TPLCDTextView *)self _tearDownAnimation];
  if ((v37 & 8) != 0) {
    [(TPLCDTextView *)self _scheduleStartScrolling];
  }
LABEL_22:
}

- (void)setAnimatesIfTruncated:(BOOL)a3
{
  if (((((*((unsigned char *)self + 504) & 4) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
    {
      [(TPLCDTextView *)self _setupForAnimationIfNecessary];
      char v4 = 4;
    }
    else
    {
      [(TPLCDTextView *)self _tearDownAnimation];
      char v4 = 0;
    }
    [(TPLCDTextView *)self setNeedsDisplay];
    *((unsigned char *)self + 504) = *((unsigned char *)self + 504) & 0xFB | v4;
    *((unsigned char *)self + 504) &= ~8u;
  }
}

- (void)_startScrolling
{
  char v3 = [(TPLCDTextView *)self superview];

  if (v3)
  {
    scrollingView = self->_scrollingView;
    if (scrollingView)
    {
      [(TPLCDTextViewScrollingView *)scrollingView frame];
      double v6 = v5;
      double v8 = v7;
      double v10 = v9;
      [(TPLCDTextView *)self bounds];
      double v12 = v8 - v11;
      double v13 = -(v8 - v11);
      -[TPLCDTextViewScrollingView setFrame:](self->_scrollingView, "setFrame:", 0.0, v6, v8, v10);
      double v14 = (UIFrameAnimation *)[objc_alloc(MEMORY[0x1E4FB17C0]) initWithTarget:self->_scrollingView];
      animation = self->_animation;
      self->_animation = v14;

      [(UIFrameAnimation *)self->_animation setSignificantRectFields:1];
      -[UIFrameAnimation setStartFrame:](self->_animation, "setStartFrame:", 0.0, v6, v8, v10);
      -[UIFrameAnimation setEndFrame:](self->_animation, "setEndFrame:", v13, v6, v8, v10);
      [(UIFrameAnimation *)self->_animation setAnimationCurve:3];
      [(UIFrameAnimation *)self->_animation setDelegate:self];
      [(UIFrameAnimation *)self->_animation setAction:sel__finishedScrolling];
      double v16 = [MEMORY[0x1E4FB1430] sharedAnimator];
      [v16 addAnimation:self->_animation withDuration:1 start:(v12 + 0.0) * 0.025];

      *((unsigned char *)self + 504) |= 8u;
    }
    else
    {
      [(TPLCDTextView *)self _finishedScrolling];
    }
  }
}

- (void)startAnimating
{
  if ((*((unsigned char *)self + 504) & 4) != 0 && (*((unsigned char *)self + 504) & 8) == 0)
  {
    [(TPLCDTextView *)self _scheduleStartScrolling];
    *((unsigned char *)self + 504) |= 8u;
  }
}

- (void)_finishedScrolling
{
  animation = self->_animation;
  self->_animation = 0;

  if (objc_opt_respondsToSelector()) {
    [self->_delegate lcdTextViewCompletedScroll:self];
  }
  if ((*((unsigned char *)self + 504) & 8) != 0 && (*((unsigned char *)self + 504) & 4) != 0)
  {
    if (self->_scrollingView)
    {
      char v4 = [(TPLCDTextView *)self superview];

      if (v4)
      {
        [(TPLCDTextView *)self _scheduleStartScrolling];
      }
    }
  }
}

- (void)stopAnimating
{
  if ((*((unsigned char *)self + 504) & 4) != 0 && (*((unsigned char *)self + 504) & 8) != 0)
  {
    if (self->_scrollingView)
    {
      [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__startScrolling object:0];
      [(UIFrameAnimation *)self->_animation setDelegate:0];
      char v3 = [MEMORY[0x1E4FB1430] sharedAnimator];
      [v3 removeAnimationsForTarget:self->_scrollingView];

      animation = self->_animation;
      self->_animation = 0;

      *((unsigned char *)self + 504) &= ~8u;
    }
  }
}

- (BOOL)animates
{
  return (*((unsigned __int8 *)self + 504) >> 2) & 1;
}

- (void)resetAnimation
{
  if (self->_scrollingView)
  {
    char v3 = *((unsigned char *)self + 504);
    [(TPLCDTextView *)self stopAnimating];
    [(TPLCDTextViewScrollingView *)self->_scrollingView frame];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    [(TPLCDTextView *)self bounds];
    -[TPLCDTextViewScrollingView setFrame:](self->_scrollingView, "setFrame:", -(v7 - v10), v5, v7, v9);
    if ((v3 & 8) != 0)
    {
      [(TPLCDTextView *)self _scheduleStartScrolling];
    }
  }
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animation, 0);
  objc_storeStrong(&self->_delegate, 0);
  objc_storeStrong((id *)&self->_scrollingView, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_shadowColor, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end