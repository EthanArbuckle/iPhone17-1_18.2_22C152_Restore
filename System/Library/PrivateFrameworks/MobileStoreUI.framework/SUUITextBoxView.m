@interface SUUITextBoxView
- (BOOL)textIsNaturallyRTL;
- (CGSize)_textSizeToFitSize:(CGSize)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)moreButtonTitle;
- (NSString)ratingText;
- (NSString)subtitle;
- (SUUIColorScheme)colorScheme;
- (SUUITextBoxView)initWithFrame:(CGRect)a3;
- (UIEdgeInsets)contentInsets;
- (UIEdgeInsets)titleInsets;
- (__CTFrame)_textFrame;
- (double)rating;
- (id)_moreButtonLabel;
- (int64_t)numberOfVisibleLines;
- (int64_t)truncationStyle;
- (void)dealloc;
- (void)drawRect:(CGRect)a3;
- (void)layoutSubviews;
- (void)reset;
- (void)setBackgroundColor:(id)a3;
- (void)setColorScheme:(id)a3;
- (void)setContentInsets:(UIEdgeInsets)a3;
- (void)setFixedWidthTextFrame:(__CTFrame *)a3;
- (void)setFixedWidthTitleTextFrame:(__CTFrame *)a3;
- (void)setFrame:(CGRect)a3;
- (void)setMoreButtonTitle:(id)a3;
- (void)setNumberOfVisibleLines:(int64_t)a3;
- (void)setRating:(double)a3;
- (void)setRatingText:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTextFrameWithText:(id)a3;
- (void)setTextIsNaturallyRTL:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)setTitleInsets:(UIEdgeInsets)a3;
- (void)setTruncationStyle:(int64_t)a3;
@end

@implementation SUUITextBoxView

- (SUUITextBoxView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SUUITextBoxView;
  v3 = -[SUUITextBoxView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x263F82670] currentDevice];
    [v4 userInterfaceIdiom];

    *(_OWORD *)&v3->_contentInsets.top = xmmword_2568A0960;
    *(_OWORD *)&v3->_contentInsets.bottom = xmmword_2568A0970;
    v3->_titleInsets.bottom = 2.0;
  }
  return v3;
}

- (void)dealloc
{
  textFrame = self->_textFrame;
  if (textFrame) {
    CFRelease(textFrame);
  }
  titleTextFrame = self->_titleTextFrame;
  if (titleTextFrame) {
    CFRelease(titleTextFrame);
  }
  truncationToken = self->_truncationToken;
  if (truncationToken) {
    CFRelease(truncationToken);
  }
  v6.receiver = self;
  v6.super_class = (Class)SUUITextBoxView;
  [(SUUITextBoxView *)&v6 dealloc];
}

- (NSString)moreButtonTitle
{
  return [(UILabel *)self->_moreButtonLabel text];
}

- (NSString)ratingText
{
  return [(UILabel *)self->_ratingLabel text];
}

- (void)reset
{
  [(SUUITextBoxView *)self setFixedWidthTextFrame:0];
  [(SUUITextBoxView *)self setFixedWidthTitleTextFrame:0];
  [(SUUITextBoxView *)self setRating:0.0];
  [(SUUITextBoxView *)self setRatingText:0];
  [(SUUITextBoxView *)self setSubtitle:0];
  [(SUUITextBoxView *)self setTitle:0];
  moreButtonLabel = self->_moreButtonLabel;
  [(UILabel *)moreButtonLabel setHidden:1];
}

- (void)setColorScheme:(id)a3
{
  v5 = (SUUIColorScheme *)a3;
  p_colorScheme = &self->_colorScheme;
  if (self->_colorScheme != v5)
  {
    v22 = v5;
    objc_storeStrong((id *)&self->_colorScheme, a3);
    titleLabel = self->_titleLabel;
    v8 = [(SUUIColorScheme *)*p_colorScheme secondaryTextColor];
    if (v8)
    {
      [(UILabel *)titleLabel setTextColor:v8];
    }
    else
    {
      v9 = [MEMORY[0x263F825C8] blackColor];
      [(UILabel *)titleLabel setTextColor:v9];
    }
    subtitleLabel = self->_subtitleLabel;
    v11 = [(SUUIColorScheme *)*p_colorScheme secondaryTextColor];
    if (v11)
    {
      [(UILabel *)subtitleLabel setTextColor:v11];
    }
    else
    {
      v12 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.5];
      [(UILabel *)subtitleLabel setTextColor:v12];
    }
    ratingLabel = self->_ratingLabel;
    v14 = [(SUUIColorScheme *)*p_colorScheme secondaryTextColor];
    if (v14)
    {
      [(UILabel *)ratingLabel setTextColor:v14];
    }
    else
    {
      v15 = [MEMORY[0x263F825C8] blackColor];
      [(UILabel *)ratingLabel setTextColor:v15];
    }
    moreButtonLabel = self->_moreButtonLabel;
    v17 = [(SUUIColorScheme *)*p_colorScheme secondaryTextColor];
    if (v17)
    {
      [(UILabel *)moreButtonLabel setTextColor:v17];
    }
    else
    {
      v18 = [(SUUITextBoxView *)self tintColor];
      [(UILabel *)moreButtonLabel setTextColor:v18];
    }
    v19 = self->_moreButtonLabel;
    v20 = [(SUUIColorScheme *)*p_colorScheme secondaryTextColor];
    if (v20)
    {
      [(UILabel *)v19 setHighlightedTextColor:v20];
    }
    else
    {
      v21 = [MEMORY[0x263F825C8] grayColor];
      [(UILabel *)v19 setHighlightedTextColor:v21];
    }
    [(SUUITextBoxView *)self setNeedsDisplay];
    v5 = v22;
  }
}

- (void)setFixedWidthTextFrame:(__CTFrame *)a3
{
  textFrame = self->_textFrame;
  if (textFrame != a3)
  {
    if (textFrame) {
      CFRelease(textFrame);
    }
    self->_textFrame = a3;
    underlyingText = self->_underlyingText;
    self->_underlyingText = 0;

    v7 = self->_textFrame;
    if (v7) {
      CFRetain(v7);
    }
    [(SUUITextBoxView *)self setNeedsDisplay];
    [(SUUITextBoxView *)self setNeedsLayout];
  }
}

- (void)setFixedWidthTitleTextFrame:(__CTFrame *)a3
{
  titleTextFrame = self->_titleTextFrame;
  if (titleTextFrame != a3)
  {
    if (titleTextFrame) {
      CFRelease(titleTextFrame);
    }
    self->_titleTextFrame = a3;
    if (a3)
    {
      CFRetain(a3);
      [(UILabel *)self->_titleLabel removeFromSuperview];
      titleLabel = self->_titleLabel;
      self->_titleLabel = 0;
    }
    [(SUUITextBoxView *)self setNeedsDisplay];
  }
}

- (void)setMoreButtonTitle:(id)a3
{
  id v6 = a3;
  id v4 = [(SUUITextBoxView *)self moreButtonTitle];
  if (v4 != v6 && ([v4 isEqualToString:v6] & 1) == 0)
  {
    v5 = [(SUUITextBoxView *)self _moreButtonLabel];
    [v5 setText:v6];
    [v5 sizeToFit];
  }
}

- (void)setNumberOfVisibleLines:(int64_t)a3
{
  if (self->_numberOfVisibleLines != a3)
  {
    self->_numberOfVisibleLines = a3;
    [(SUUITextBoxView *)self setNeedsDisplay];
  }
}

- (void)setRating:(double)a3
{
  if (self->_rating != a3)
  {
    ratingImageView = self->_ratingImageView;
    if (a3 == 0.0)
    {
      [(UIImageView *)ratingImageView removeFromSuperview];
      v8 = self->_ratingImageView;
      self->_ratingImageView = 0;
    }
    else
    {
      if (!ratingImageView)
      {
        id v6 = (UIImageView *)objc_alloc_init(MEMORY[0x263F82828]);
        v7 = self->_ratingImageView;
        self->_ratingImageView = v6;

        [(SUUITextBoxView *)self addSubview:self->_ratingImageView];
      }
      v8 = +[SUUIRatingStarsCache cacheWithProperties:1];
      v9 = self->_ratingImageView;
      v10 = [v8 ratingStarsImageForRating:a3];
      [(UIImageView *)v9 setImage:v10];

      [(UIImageView *)self->_ratingImageView sizeToFit];
    }

    [(SUUITextBoxView *)self setNeedsLayout];
  }
  self->_rating = a3;
}

- (void)setRatingText:(id)a3
{
  id v16 = a3;
  id v4 = [(UILabel *)self->_ratingLabel text];
  if (v4 != v16 && ([v4 isEqualToString:v16] & 1) == 0)
  {
    ratingLabel = self->_ratingLabel;
    if (v16)
    {
      if (!ratingLabel)
      {
        id v6 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
        v7 = self->_ratingLabel;
        self->_ratingLabel = v6;

        v8 = self->_ratingLabel;
        v9 = [(SUUITextBoxView *)self backgroundColor];
        [(UILabel *)v8 setBackgroundColor:v9];

        v10 = self->_ratingLabel;
        v11 = [MEMORY[0x263F81708] systemFontOfSize:14.0];
        [(UILabel *)v10 setFont:v11];

        v12 = self->_ratingLabel;
        v13 = [(SUUIColorScheme *)self->_colorScheme primaryTextColor];
        if (v13)
        {
          [(UILabel *)v12 setTextColor:v13];
        }
        else
        {
          v15 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.8];
          [(UILabel *)v12 setTextColor:v15];
        }
        [(SUUITextBoxView *)self addSubview:self->_ratingLabel];
        ratingLabel = self->_ratingLabel;
      }
      -[UILabel setText:](ratingLabel, "setText:");
    }
    else
    {
      [(UILabel *)ratingLabel removeFromSuperview];
      v14 = self->_ratingLabel;
      self->_ratingLabel = 0;
    }
    [(SUUITextBoxView *)self setNeedsLayout];
  }
}

- (void)setSubtitle:(id)a3
{
  id v16 = a3;
  id v4 = [(UILabel *)self->_subtitleLabel text];
  if (v4 != v16 && ([v4 isEqualToString:v16] & 1) == 0)
  {
    subtitleLabel = self->_subtitleLabel;
    if (v16)
    {
      if (!subtitleLabel)
      {
        id v6 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
        v7 = self->_subtitleLabel;
        self->_subtitleLabel = v6;

        v8 = self->_subtitleLabel;
        v9 = [(SUUITextBoxView *)self backgroundColor];
        [(UILabel *)v8 setBackgroundColor:v9];

        v10 = self->_subtitleLabel;
        v11 = [MEMORY[0x263F81708] systemFontOfSize:12.0];
        [(UILabel *)v10 setFont:v11];

        v12 = self->_subtitleLabel;
        v13 = [(SUUIColorScheme *)self->_colorScheme secondaryTextColor];
        if (v13)
        {
          [(UILabel *)v12 setTextColor:v13];
        }
        else
        {
          v15 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.5];
          [(UILabel *)v12 setTextColor:v15];
        }
        [(SUUITextBoxView *)self addSubview:self->_subtitleLabel];
        subtitleLabel = self->_subtitleLabel;
      }
      -[UILabel setText:](subtitleLabel, "setText:");
      [(UILabel *)self->_subtitleLabel sizeToFit];
    }
    else
    {
      [(UILabel *)subtitleLabel removeFromSuperview];
      v14 = self->_subtitleLabel;
      self->_subtitleLabel = 0;
    }
    [(SUUITextBoxView *)self setNeedsLayout];
  }
}

- (void)setTextFrameWithText:(id)a3
{
  id v4 = (NSString *)a3;
  v5 = v4;
  if (self->_underlyingText != v4)
  {
    textFrame = self->_textFrame;
    v9 = v5;
    if (textFrame)
    {
      CFRelease(textFrame);
      v5 = v9;
      self->_textFrame = 0;
    }
    v7 = (NSString *)[(NSString *)v5 copy];
    underlyingText = self->_underlyingText;
    self->_underlyingText = v7;

    id v4 = (NSString *)[(SUUITextBoxView *)self setNeedsDisplay];
    v5 = v9;
  }
  MEMORY[0x270F9A758](v4, v5);
}

- (void)setTitle:(id)a3
{
  id v19 = a3;
  id v4 = [(UILabel *)self->_titleLabel text];
  if (v4 != v19 && ([v4 isEqualToString:v19] & 1) == 0)
  {
    if (v19)
    {
      titleTextFrame = self->_titleTextFrame;
      if (titleTextFrame)
      {
        CFRelease(titleTextFrame);
        self->_titleTextFrame = 0;
      }
      titleLabel = self->_titleLabel;
      if (!titleLabel)
      {
        v7 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
        v8 = self->_titleLabel;
        self->_titleLabel = v7;

        v9 = self->_titleLabel;
        v10 = [(SUUITextBoxView *)self backgroundColor];
        [(UILabel *)v9 setBackgroundColor:v10];

        v11 = self->_titleLabel;
        v12 = (void *)MEMORY[0x263F81708];
        v13 = [MEMORY[0x263F82670] currentDevice];
        [v13 userInterfaceIdiom];

        v14 = [v12 systemFontOfSize:17.0];
        [(UILabel *)v11 setFont:v14];

        v15 = self->_titleLabel;
        id v16 = [(SUUIColorScheme *)self->_colorScheme secondaryTextColor];
        if (v16)
        {
          [(UILabel *)v15 setTextColor:v16];
        }
        else
        {
          v18 = [MEMORY[0x263F825C8] blackColor];
          [(UILabel *)v15 setTextColor:v18];
        }
        [(SUUITextBoxView *)self addSubview:self->_titleLabel];
        titleLabel = self->_titleLabel;
      }
      [(UILabel *)titleLabel setText:v19];
    }
    else
    {
      [(UILabel *)self->_titleLabel removeFromSuperview];
      v17 = self->_titleLabel;
      self->_titleLabel = 0;
    }
    self->_titleTextIsNaturallyRTL = [v19 _isNaturallyRTL];
    [(SUUITextBoxView *)self setNeedsLayout];
  }
}

- (void)setTruncationStyle:(int64_t)a3
{
  if (self->_truncationStyle != a3)
  {
    self->_truncationStyle = a3;
    [(UILabel *)self->_moreButtonLabel setHidden:a3 == 1];
  }
}

- (NSString)subtitle
{
  return [(UILabel *)self->_subtitleLabel text];
}

- (void)drawRect:(CGRect)a3
{
  uint64_t v97 = *MEMORY[0x263EF8340];
  [(SUUITextBoxView *)self bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  double v94 = v9;
  double v95 = v8;
  if (self->_titleLabel)
  {
    v10 = [MEMORY[0x263F82670] currentDevice];
    [v10 userInterfaceIdiom];

    double height = 22.0;
  }
  else
  {
    double height = 0.0;
  }
  titleTextFrame = self->_titleTextFrame;
  v13 = (_OWORD *)MEMORY[0x263F000D0];
  if (titleTextFrame)
  {
    CFArrayRef Lines = CTFrameGetLines(titleTextFrame);
    uint64_t Count = CFArrayGetCount(Lines);
    length = v87;
    id v16 = (CGPoint *)&v87[-2 * MEMORY[0x270FA5388]()];
    v98.location = 0;
    v98.length = Count;
    CTFrameGetLineOrigins(self->_titleTextFrame, v98, v16);
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextSaveGState(CurrentContext);
    CGContextScaleCTM(CurrentContext, 1.0, -1.0);
    long long v18 = v13[1];
    *(_OWORD *)&v96.a = *v13;
    *(_OWORD *)&v96.c = v18;
    *(_OWORD *)&v96.tCGFloat x = v13[2];
    CGContextSetTextMatrix(CurrentContext, &v96);
    id v19 = [(SUUIColorScheme *)self->_colorScheme secondaryTextColor];
    v20 = v19;
    if (v19)
    {
      [v19 set];
    }
    else
    {
      v21 = [MEMORY[0x263F825C8] blackColor];
      [v21 set];
    }
    Path = CTFrameGetPath(self->_titleTextFrame);
    BoundingBoCGFloat x = CGPathGetBoundingBox(Path);
    double height = BoundingBox.size.height;
    if (Count >= 1)
    {
      CFIndex v23 = 0;
      double v24 = self->_contentInsets.top + BoundingBox.size.height;
      do
      {
        ValueAtIndeCGFloat x = (const __CTLine *)CFArrayGetValueAtIndex(Lines, v23);
        if (self->_titleTextIsNaturallyRTL)
        {
          v101.origin.CGFloat x = v5;
          v101.origin.CGFloat y = v7;
          v101.size.double height = v94;
          v101.size.width = v95;
          double Width = CGRectGetWidth(v101);
          CGRect BoundsWithOptions = CTLineGetBoundsWithOptions(ValueAtIndex, 0);
          double v27 = Width - CGRectGetWidth(BoundsWithOptions) - (self->_contentInsets.left + v16->x);
        }
        else
        {
          double v27 = self->_contentInsets.left + v16->x;
        }
        CGContextSetTextPosition(CurrentContext, v27, v16->y - v24);
        CTLineDraw(ValueAtIndex, CurrentContext);
        ++v23;
        ++v16;
      }
      while (Count != v23);
    }
    CGContextRestoreGState(CurrentContext);
  }
  v28 = [(SUUITextBoxView *)self _textFrame];
  if (!v28) {
    return;
  }
  v29 = v28;
  CFArrayRef v30 = CTFrameGetLines(v28);
  CFIndex v31 = CFArrayGetCount(v30);
  v87[1] = v87;
  uint64_t v32 = 504;
  CFIndex v91 = v31;
  MEMORY[0x270FA5388]();
  v33 = (CGPoint *)&v87[-2 * v99.length];
  v99.location = 0;
  length = (void *)v99.length;
  CTFrameGetLineOrigins(v29, v99, v33);
  v34 = UIGraphicsGetCurrentContext();
  CGContextSaveGState(v34);
  CGContextScaleCTM(v34, 1.0, -1.0);
  long long v35 = v13[1];
  *(_OWORD *)&v96.a = *v13;
  *(_OWORD *)&v96.c = v35;
  *(_OWORD *)&v96.tCGFloat x = v13[2];
  CGContextSetTextMatrix(v34, &v96);
  v36 = [(SUUIColorScheme *)self->_colorScheme primaryTextColor];
  v37 = v36;
  if (v36)
  {
    [v36 set];
  }
  else
  {
    v38 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.8];
    [v38 set];
  }
  ratingImageView = self->_ratingImageView;
  CGFloat v93 = v7;
  if (ratingImageView)
  {
    p_contentInsets = &self->_contentInsets;
    double top = self->_contentInsets.top;
    if (height <= 0.00000011920929)
    {
      if (self->_subtitleLabel) {
        double v42 = top + 16.0;
      }
      else {
        double v42 = self->_contentInsets.top;
      }
    }
    else
    {
      double v42 = height + top;
    }
    double v43 = 14.0;
    goto LABEL_32;
  }
  if (self->_ratingLabel) {
    double v43 = 17.0;
  }
  else {
    double v43 = 0.0;
  }
  p_contentInsets = &self->_contentInsets;
  double v44 = self->_contentInsets.top;
  uint64_t v45 = (uint64_t)length;
  if (height <= 0.00000011920929)
  {
    if (self->_subtitleLabel) {
      double v42 = v44 + 16.0;
    }
    else {
      double v42 = self->_contentInsets.top;
    }
    if (v43 <= 0.00000011920929) {
      goto LABEL_34;
    }
    goto LABEL_32;
  }
  double v42 = height + v44;
  if (v43 > 0.00000011920929)
  {
LABEL_32:
    v47 = [MEMORY[0x263F82670] currentDevice];
    [v47 userInterfaceIdiom];

    uint64_t v45 = (uint64_t)length;
    double bottom = v43 + 1.0 + 5.0;
    goto LABEL_33;
  }
  double bottom = self->_titleInsets.bottom;
LABEL_33:
  double v42 = v42 + bottom;
LABEL_34:
  double v48 = p_contentInsets->bottom;
  v49 = CTFrameGetPath(v29);
  CGRect v103 = CGPathGetBoundingBox(v49);
  CFIndex v50 = v45 - 1;
  if (v45 >= 1)
  {
    CFIndex v51 = 0;
    double v52 = p_contentInsets->bottom - v94 + v94 - v48 - v42 - v103.size.height;
    double v90 = v5;
    CFArrayRef v89 = v30;
    uint64_t v88 = 504;
    while (1)
    {
      v53 = (const __CTLine *)CFArrayGetValueAtIndex(v30, v51);
      CGRect v104 = CTLineGetBoundsWithOptions(v53, 0);
      double v54 = v104.size.width;
      if (self->_textIsNaturallyRTL)
      {
        CGFloat x = v104.origin.x;
        CGFloat y = v104.origin.y;
        CGFloat v57 = v104.size.height;
        v105.origin.CGFloat x = v5;
        v105.origin.CGFloat y = v93;
        v105.size.double height = v94;
        v105.size.width = v95;
        double v58 = CGRectGetWidth(v105);
        v106.origin.CGFloat x = x;
        v106.origin.CGFloat y = y;
        v106.size.width = v54;
        v106.size.double height = v57;
        double v59 = v58 - CGRectGetWidth(v106) - (p_contentInsets->left + v33->x);
      }
      else
      {
        double v59 = p_contentInsets->left + v33->x;
      }
      double v60 = v52 + v33->y;
      CGContextSetTextPosition(v34, v59, v60);
      if (v51 >= v50 && *(Class *)((char *)&self->super.super.super.super.isa + v32) && v91 != v45) {
        break;
      }
      CTLineDraw(v53, v34);
LABEL_57:
      ++v51;
      ++v33;
      if (v45 == v51) {
        goto LABEL_58;
      }
    }
    if (!self->_truncationToken)
    {
      v61 = +[SUUITextLayout newAttributedStringWithText:@"…"];
      self->_truncationToken = CTLineCreateWithAttributedString(v61);
      v62 = v61;
      uint64_t v45 = (uint64_t)length;
      CFRelease(v62);
    }
    double v63 = v95 - p_contentInsets->left - p_contentInsets->right;
    v64 = [(SUUITextBoxView *)self _moreButtonLabel];
    [v64 frame];
    double v66 = v65;
    double v68 = v67;
    CGRect v107 = CTLineGetBoundsWithOptions(self->_truncationToken, 0x20uLL);
    double v69 = v107.size.width;
    double v70 = v63 - v107.size.width;
    int v71 = objc_msgSend(v64, "isHidden", v107.origin.x, v107.origin.y);
    double v72 = v66 + 1.0;
    if (v71) {
      double v72 = 0.0;
    }
    double v73 = v70 - v72;
    if (v73 < v54)
    {
      TruncatedLine = CTLineCreateTruncatedLine(v53, v73, kCTLineTruncationEnd, 0);
      CGRect v108 = CTLineGetBoundsWithOptions(TruncatedLine, 0);
      double v54 = v108.size.width;
      if (TruncatedLine)
      {
        TrailingWhitespacedouble Width = CTLineGetTrailingWhitespaceWidth(TruncatedLine);
        CTLineDraw(TruncatedLine, v34);
        CFRelease(TruncatedLine);
        uint64_t v45 = (uint64_t)length;
LABEL_52:
        float v76 = v59 + v54 - TrailingWhitespaceWidth;
        double v77 = ceilf(v76);
        CGContextSetTextPosition(v34, v77, v60);
        CTLineDraw(self->_truncationToken, v34);
        if (v64)
        {
          float v78 = v69 + v77 + 1.0;
          double v79 = ceilf(v78);
          float v80 = fabs(v60) - v68;
          float v81 = floorf(v80);
          v82 = [MEMORY[0x263F82B60] mainScreen];
          [v82 scale];
          BOOL v84 = v83 == 1.0;
          float v85 = 3.5;
          if (v84) {
            float v85 = 4.0;
          }
          double v86 = (float)(v81 + v85);

          uint64_t v45 = (uint64_t)length;
          objc_msgSend(v64, "setFrame:", v79, v86, v66, v68);
        }

        CGFloat v5 = v90;
        CFArrayRef v30 = v89;
        uint64_t v32 = v88;
        goto LABEL_57;
      }
      uint64_t v45 = (uint64_t)length;
    }
    TrailingWhitespacedouble Width = CTLineGetTrailingWhitespaceWidth(v53);
    CTLineDraw(v53, v34);
    goto LABEL_52;
  }
LABEL_58:
  CGContextRestoreGState(v34);
}

- (void)layoutSubviews
{
  [(SUUITextBoxView *)self bounds];
  CGFloat v52 = v4;
  id v53 = v3;
  double v6 = v5;
  CGFloat v51 = v7;
  subtitleLabel = self->_subtitleLabel;
  if (subtitleLabel) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = self->_titleLabel != 0;
  }
  p_contentInsets = &self->_contentInsets;
  if (self->_ratingLabel) {
    BOOL v11 = 1;
  }
  else {
    BOOL v11 = self->_ratingImageView != 0;
  }
  double top = p_contentInsets->top;
  v13 = (CGFloat *)MEMORY[0x263F001A8];
  double v15 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v14 = *(double *)(MEMORY[0x263F001A8] + 24);
  double v16 = v14;
  double v50 = v15;
  if (subtitleLabel)
  {
    [(UILabel *)subtitleLabel frame];
    double v15 = v17;
    double v16 = 16.0;
  }
  titleLabel = self->_titleLabel;
  double v19 = v14;
  if (titleLabel)
  {
    [(UILabel *)titleLabel frame];
    v20 = [MEMORY[0x263F82670] currentDevice];
    [v20 userInterfaceIdiom];

    double v19 = 22.0;
  }
  if (v16 >= v19) {
    double v21 = v16;
  }
  else {
    double v21 = v19;
  }
  double v22 = v6 - self->_contentInsets.right - v15;
  [(UILabel *)self->_subtitleLabel setFrame:SUUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v22, self->_contentInsets.top + v21 - v16 + -1.0, v15, v16, *(CGFloat *)&v53, v52, v6, v51)];
  double left = self->_contentInsets.left;
  if (v15 <= 0.0) {
    double v24 = v6 - left - self->_contentInsets.right;
  }
  else {
    double v24 = v22 + -5.0 - left;
  }
  [(UILabel *)self->_titleLabel setFrame:SUUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(left, v21 + p_contentInsets->top - v19, v24, v19, *(CGFloat *)&v53, v52, v6, v51)];
  if (v9)
  {
    if (v11)
    {
      v25 = [MEMORY[0x263F82670] currentDevice];
      [v25 userInterfaceIdiom];

      double bottom = 1.0;
    }
    else
    {
      double bottom = self->_titleInsets.bottom;
    }
    double v27 = top + v21 + bottom;
  }
  else
  {
    double v27 = top;
  }
  CGFloat v28 = v50;
  ratingLabel = self->_ratingLabel;
  double v30 = v14;
  if (ratingLabel)
  {
    [(UILabel *)ratingLabel frame];
    double v30 = 17.0;
  }
  ratingImageView = self->_ratingImageView;
  if (ratingImageView)
  {
    [(UIImageView *)ratingImageView frame];
    CGFloat v28 = v34;
    double v14 = v35;
    v36 = self->_ratingImageView;
    if (v30 >= v35) {
      double v37 = v30;
    }
    else {
      double v37 = v35;
    }
    if (v36)
    {
      CGFloat v38 = self->_contentInsets.left;
      float v39 = (v37 - v35) * 0.5;
      double v40 = v27 + floorf(v39) + 2.0;
      [(UIImageView *)v36 setFrame:SUUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v38, v40, v34, v35, *(CGFloat *)&v53, v52, v6, v51)];
    }
    else
    {
      CGFloat v38 = v32;
      double v40 = v33;
    }
  }
  else
  {
    CGFloat v38 = *v13;
    double v40 = v13[1];
    if (v30 >= v14) {
      double v37 = v30;
    }
    else {
      double v37 = v14;
    }
  }
  v41 = self->_ratingLabel;
  if (v41)
  {
    if (self->_ratingImageView)
    {
      v56.origin.CGFloat x = v38;
      v56.origin.CGFloat y = v40;
      v56.size.width = v28;
      v56.size.double height = v14;
      double v42 = CGRectGetMaxX(v56) + 5.0;
      v41 = self->_ratingLabel;
    }
    else
    {
      double v42 = self->_contentInsets.left;
    }
    float v43 = (v37 - v30) * 0.5;
    [(UILabel *)v41 setFrame:SUUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v42, v27 + floorf(v43), v6 - v42 - self->_contentInsets.right, v30, *(CGFloat *)&v53, v52, v6, v51)];
  }
  double v44 = [(SUUITextBoxView *)self _textFrame];
  if (!v44 || self->_truncationStyle == 1)
  {
    uint64_t v45 = [(SUUITextBoxView *)self _moreButtonLabel];
    id v54 = v45;
LABEL_43:
    uint64_t v46 = 1;
    goto LABEL_44;
  }
  CFArrayRef Lines = CTFrameGetLines(v44);
  CFIndex Count = CFArrayGetCount(Lines);
  numberOfVisibleCFArrayRef Lines = self->_numberOfVisibleLines;
  uint64_t v45 = [(SUUITextBoxView *)self _moreButtonLabel];
  id v54 = v45;
  if (!numberOfVisibleLines || Count <= numberOfVisibleLines) {
    goto LABEL_43;
  }
  uint64_t v46 = 0;
LABEL_44:
  [v45 setHidden:v46];
}

- (void)setBackgroundColor:(id)a3
{
  moreButtonLabel = self->_moreButtonLabel;
  id v5 = a3;
  [(UILabel *)moreButtonLabel setBackgroundColor:v5];
  [(UILabel *)self->_subtitleLabel setBackgroundColor:v5];
  [(UILabel *)self->_titleLabel setBackgroundColor:v5];
  [(UILabel *)self->_ratingLabel setBackgroundColor:v5];
  v6.receiver = self;
  v6.super_class = (Class)SUUITextBoxView;
  [(SUUITextBoxView *)&v6 setBackgroundColor:v5];
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (self->_underlyingText)
  {
    if (self->_textFrame)
    {
      [(SUUITextBoxView *)self frame];
      if (v8 != width)
      {
        CFRelease(self->_textFrame);
        self->_textFrame = 0;
        [(SUUITextBoxView *)self setNeedsDisplay];
      }
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)SUUITextBoxView;
  -[SUUITextBoxView setFrame:](&v9, sel_setFrame_, x, y, width, height);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  p_contentInsets = &self->_contentInsets;
  double top = self->_contentInsets.top;
  double bottom = self->_contentInsets.bottom;
  if (self->_titleLabel)
  {
    double v8 = objc_msgSend(MEMORY[0x263F82670], "currentDevice", a3.width, a3.height);
    [v8 userInterfaceIdiom];

    double v9 = 22.0;
  }
  else
  {
    titleTextFrame = self->_titleTextFrame;
    if (titleTextFrame)
    {
      Path = CTFrameGetPath(titleTextFrame);
      BoundingBodouble x = CGPathGetBoundingBox(Path);
      *(float *)&BoundingBox.origin.double x = BoundingBox.size.height;
      double v9 = ceilf(*(float *)&BoundingBox.origin.x);
    }
    else
    {
      double v9 = 0.0;
    }
  }
  double v12 = top + bottom;
  double v13 = 16.0;
  if (v9 >= 16.0) {
    double v13 = v9;
  }
  if (self->_subtitleLabel) {
    double v9 = v13;
  }
  if (v9 > 0.0) {
    double v12 = v12 + v9 + self->_titleInsets.bottom;
  }
  if (self->_ratingLabel)
  {
    if (v9 != 0.0) {
      double v12 = v12 - self->_titleInsets.bottom;
    }
    double v12 = v12 + 27.0;
  }
  -[SUUITextBoxView _textSizeToFitSize:](self, "_textSizeToFitSize:", width - p_contentInsets->left - p_contentInsets->right, 1.79769313e308);
  double v15 = v12 + v14;
  double v16 = width;
  result.double height = v15;
  result.double width = v16;
  return result;
}

- (id)_moreButtonLabel
{
  moreButtonLabel = self->_moreButtonLabel;
  if (!moreButtonLabel)
  {
    double v4 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    id v5 = self->_moreButtonLabel;
    self->_moreButtonLabel = v4;

    objc_super v6 = self->_moreButtonLabel;
    double v7 = [MEMORY[0x263F81708] systemFontOfSize:12.0];
    [(UILabel *)v6 setFont:v7];

    [(UILabel *)self->_moreButtonLabel setHidden:self->_truncationStyle == 1];
    double v8 = self->_moreButtonLabel;
    double v9 = [(SUUIColorScheme *)self->_colorScheme secondaryTextColor];
    if (v9)
    {
      [(UILabel *)v8 setTextColor:v9];
    }
    else
    {
      v10 = [(SUUITextBoxView *)self tintColor];
      [(UILabel *)v8 setTextColor:v10];
    }
    BOOL v11 = self->_moreButtonLabel;
    double v12 = [(SUUIColorScheme *)self->_colorScheme secondaryTextColor];
    if (v12)
    {
      [(UILabel *)v11 setHighlightedTextColor:v12];
    }
    else
    {
      double v13 = [MEMORY[0x263F825C8] grayColor];
      [(UILabel *)v11 setHighlightedTextColor:v13];
    }
    [(UILabel *)self->_moreButtonLabel setTextAlignment:2];
    [(SUUITextBoxView *)self addSubview:self->_moreButtonLabel];
    moreButtonLabel = self->_moreButtonLabel;
  }
  return moreButtonLabel;
}

- (__CTFrame)_textFrame
{
  CGSize result = self->_textFrame;
  if (!result)
  {
    if (self->_underlyingText)
    {
      [(SUUITextBoxView *)self bounds];
      CGFloat v4 = CGRectGetWidth(v12) - self->_contentInsets.left - self->_contentInsets.right;
      id v5 = +[SUUITextLayout newAttributedStringWithText:self->_underlyingText];
      objc_super v6 = CTFramesetterCreateWithAttributedString(v5);
      v11.double height = 1.79769313e308;
      v9.location = 0;
      v9.length = 0;
      v11.double width = v4;
      CGSize v7 = CTFramesetterSuggestFrameSizeWithConstraints(v6, v9, 0, v11, 0);
      Mutable = CGPathCreateMutable();
      v13.origin.double x = 0.0;
      v13.origin.double y = 0.0;
      v13.size.double width = v7.width;
      v13.size.double height = v7.height;
      CGPathAddRect(Mutable, 0, v13);
      v10.location = 0;
      v10.length = 0;
      self->_textFrame = CTFramesetterCreateFrame(v6, v10, Mutable, 0);
      CGPathRelease(Mutable);
      CFRelease(v6);
      CFRelease(v5);
      self->_textIsNaturallyRTL = [(NSString *)self->_underlyingText _isNaturallyRTL];
      return self->_textFrame;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (CGSize)_textSizeToFitSize:(CGSize)a3
{
  if (self->_underlyingText)
  {
    CGFloat height = a3.height;
    CGFloat width = a3.width;
    id v5 = +[SUUITextLayout newAttributedStringWithText:](SUUITextLayout, "newAttributedStringWithText:");
    objc_super v6 = CTFramesetterCreateWithAttributedString(v5);
    v24.location = 0;
    v24.length = 0;
    v27.CGFloat width = width;
    v27.CGFloat height = height;
    CGSize v7 = CTFramesetterSuggestFrameSizeWithConstraints(v6, v24, 0, v27, 0);
    double v8 = v7.width;
    double v9 = v7.height;
    CFRelease(v6);
    CFRelease(v5);
  }
  else
  {
    textFrame = self->_textFrame;
    if (textFrame)
    {
      Path = CTFrameGetPath(textFrame);
      BoundingBodouble x = CGPathGetBoundingBox(Path);
      double v8 = BoundingBox.size.width;
      double v9 = BoundingBox.size.height;
      CFArrayRef Lines = CTFrameGetLines(self->_textFrame);
      CFIndex Count = CFArrayGetCount(Lines);
      numberOfVisibleCFArrayRef Lines = self->_numberOfVisibleLines;
      if (numberOfVisibleLines) {
        BOOL v20 = numberOfVisibleLines < Count;
      }
      else {
        BOOL v20 = 0;
      }
      if (v20)
      {
        origins.double x = 0.0;
        origins.double y = 0.0;
        v22.double x = 0.0;
        v22.double y = 0.0;
        v25.location = 0;
        v25.length = 1;
        CTFrameGetLineOrigins(self->_textFrame, v25, &v22);
        v26.location = self->_numberOfVisibleLines - 1;
        v26.length = 1;
        CTFrameGetLineOrigins(self->_textFrame, v26, &origins);
        ValueAtIndedouble x = (const __CTLine *)CFArrayGetValueAtIndex(Lines, self->_numberOfVisibleLines - 1);
        CGRect BoundsWithOptions = CTLineGetBoundsWithOptions(ValueAtIndex, 0x14uLL);
        double v9 = BoundsWithOptions.size.height + v22.y - origins.y - BoundsWithOptions.origin.y;
      }
    }
    else
    {
      double v8 = *MEMORY[0x263F001B0];
      double v9 = *(double *)(MEMORY[0x263F001B0] + 8);
    }
  }
  float v10 = v9;
  double v11 = ceilf(v10);
  float v12 = v8;
  double v13 = ceilf(v12);
  result.CGFloat height = v11;
  result.CGFloat width = v13;
  return result;
}

- (SUUIColorScheme)colorScheme
{
  return self->_colorScheme;
}

- (int64_t)numberOfVisibleLines
{
  return self->_numberOfVisibleLines;
}

- (double)rating
{
  return self->_rating;
}

- (int64_t)truncationStyle
{
  return self->_truncationStyle;
}

- (BOOL)textIsNaturallyRTL
{
  return self->_textIsNaturallyRTL;
}

- (void)setTextIsNaturallyRTL:(BOOL)a3
{
  self->_textIsNaturallyRTL = a3;
}

- (UIEdgeInsets)contentInsets
{
  double top = self->_contentInsets.top;
  double left = self->_contentInsets.left;
  double bottom = self->_contentInsets.bottom;
  double right = self->_contentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  self->_contentInsets = a3;
}

- (UIEdgeInsets)titleInsets
{
  double top = self->_titleInsets.top;
  double left = self->_titleInsets.left;
  double bottom = self->_titleInsets.bottom;
  double right = self->_titleInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setTitleInsets:(UIEdgeInsets)a3
{
  self->_titleInsets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingText, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_ratingLabel, 0);
  objc_storeStrong((id *)&self->_ratingImageView, 0);
  objc_storeStrong((id *)&self->_moreButtonLabel, 0);
  objc_storeStrong((id *)&self->_colorScheme, 0);
}

@end