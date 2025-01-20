@interface IMExpandingLabel
- (BOOL)fitsWithinLineLimit;
- (BOOL)hasGradient;
- (BOOL)isExpanded;
- (BOOL)isScrollEnabled;
- (IMExpandingLabel)initWithFrame:(CGRect)a3;
- (IMExpandingLabelDelegate)delegate;
- (NSDictionary)textAttributes;
- (NSString)text;
- (UIButton)moreButton;
- (UITextView)textView;
- (double)gradientHeight;
- (double)heightForWidth:(double)a3;
- (int64_t)textMode;
- (unint64_t)languageDirection;
- (unint64_t)numberOfLines;
- (void)layoutSubviews;
- (void)moreButtonTapped:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setExpanded:(BOOL)a3;
- (void)setFitsWithinLineLimit:(BOOL)a3;
- (void)setGradientHeight:(double)a3;
- (void)setHasGradient:(BOOL)a3;
- (void)setLanguageDirection:(unint64_t)a3;
- (void)setMoreButton:(id)a3;
- (void)setNumberOfLines:(unint64_t)a3;
- (void)setScrollEnabled:(BOOL)a3;
- (void)setText:(id)a3;
- (void)setTextAttributes:(id)a3;
- (void)setTextMode:(int64_t)a3;
- (void)setTextView:(id)a3;
@end

@implementation IMExpandingLabel

- (IMExpandingLabel)initWithFrame:(CGRect)a3
{
  v27.receiver = self;
  v27.super_class = (Class)IMExpandingLabel;
  v3 = -[IMExpandingLabel initWithFrame:](&v27, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_numberOfLines = 2;
    v3->_textMode = 8;
    v3->_expanded = 1;
    v3->_fitsWithinLineLimit = 0;
    v3->_hasGradient = 0;
    v3->_gradientHeight = 22.0;
    v3->_languageDirection = 1;
    [(IMExpandingLabel *)v3 setAutoresizingMask:18];
    [(IMExpandingLabel *)v4 setContentMode:5];
    [(IMExpandingLabel *)v4 setAutoresizesSubviews:1];
    id v5 = objc_alloc(MEMORY[0x1E4FB1DD8]);
    [(IMExpandingLabel *)v4 bounds];
    uint64_t v6 = objc_msgSend(v5, "initWithFrame:");
    textView = v4->_textView;
    v4->_textView = (UITextView *)v6;

    [(UITextView *)v4->_textView setAutoresizingMask:18];
    [(UITextView *)v4->_textView setScrollEnabled:0];
    [(UITextView *)v4->_textView setEditable:0];
    v8 = [(UITextView *)v4->_textView textContainer];
    [v8 setLineBreakMode:4];

    v9 = [(UITextView *)v4->_textView textContainer];
    [v9 setLineFragmentPadding:0.0];

    double v10 = *MEMORY[0x1E4FB2848];
    double v11 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v12 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v13 = *(double *)(MEMORY[0x1E4FB2848] + 24);
    -[UITextView setTextContainerInset:](v4->_textView, "setTextContainerInset:", *MEMORY[0x1E4FB2848], v11, v12, v13);
    -[UITextView setContentInset:](v4->_textView, "setContentInset:", v10, v11, v12, v13);
    v14 = [MEMORY[0x1E4FB1618] clearColor];
    [(UITextView *)v4->_textView setBackgroundColor:v14];

    [(UITextView *)v4->_textView setDataDetectorTypes:7];
    [(UITextView *)v4->_textView setTextAlignment:0];
    uint64_t v15 = [MEMORY[0x1E4F39BD0] layer];
    gradientLayer = v4->_gradientLayer;
    v4->_gradientLayer = (CAGradientLayer *)v15;

    id v17 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.100000001];
    uint64_t v18 = [v17 CGColor];
    id gradientClearColor = v4->_gradientClearColor;
    v4->_id gradientClearColor = (id)v18;

    id v20 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.330000013];
    uint64_t v21 = [v20 CGColor];
    id gradientSemiClearColor = v4->_gradientSemiClearColor;
    v4->_id gradientSemiClearColor = (id)v21;

    id v23 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:1.0];
    uint64_t v24 = [v23 CGColor];
    id gradientSolidColor = v4->_gradientSolidColor;
    v4->_id gradientSolidColor = (id)v24;

    [(IMExpandingLabel *)v4 addSubview:v4->_textView];
  }
  return v4;
}

- (void)layoutSubviews
{
  v77[1] = *MEMORY[0x1E4F143B8];
  v73.receiver = self;
  v73.super_class = (Class)IMExpandingLabel;
  [(IMExpandingLabel *)&v73 layoutSubviews];
  uint64_t v3 = [(IMExpandingLabel *)self moreButton];
  if (v3)
  {
    v4 = (void *)v3;
    BOOL v5 = [(IMExpandingLabel *)self isExpanded];

    if (!v5)
    {
      uint64_t v6 = [(IMExpandingLabel *)self textView];
      v7 = [v6 textContainer];
      [v7 setExclusionPaths:MEMORY[0x1E4F1CBF0]];

      v8 = [(IMExpandingLabel *)self textView];
      v9 = [v8 textContainer];
      [v9 setMaximumNumberOfLines:0];

      double v10 = [(IMExpandingLabel *)self textView];
      [(IMExpandingLabel *)self bounds];
      objc_msgSend(v10, "sizeThatFits:", v11, 3.40282347e38);
      float v13 = v12;
      double v14 = ceilf(v13);

      unint64_t v15 = [(IMExpandingLabel *)self numberOfLines];
      v16 = [(IMExpandingLabel *)self textView];
      id v17 = [v16 textContainer];
      [v17 setMaximumNumberOfLines:v15];

      uint64_t v18 = [(IMExpandingLabel *)self textView];
      [(IMExpandingLabel *)self bounds];
      objc_msgSend(v18, "sizeThatFits:", v19, 3.40282347e38);
      float v21 = v20;
      double v22 = ceilf(v21);

      if (vabdd_f64(v14, v22) < 2.22044605e-16)
      {
        [(IMExpandingLabel *)self setFitsWithinLineLimit:1];
        id v23 = [(IMExpandingLabel *)self textView];
        uint64_t v24 = [v23 textContainer];
        [v24 setMaximumNumberOfLines:0];

        v25 = [(IMExpandingLabel *)self moreButton];
        v26 = v25;
        uint64_t v27 = 1;
LABEL_7:
        [v25 setHidden:v27];

        goto LABEL_8;
      }
      if ([(IMExpandingLabel *)self fitsWithinLineLimit])
      {
        [(IMExpandingLabel *)self setFitsWithinLineLimit:0];
        unint64_t v28 = [(IMExpandingLabel *)self numberOfLines];
        v29 = [(IMExpandingLabel *)self textView];
        v30 = [v29 textContainer];
        [v30 setMaximumNumberOfLines:v28];

        v25 = [(IMExpandingLabel *)self moreButton];
        v26 = v25;
        uint64_t v27 = 0;
        goto LABEL_7;
      }
    }
  }
LABEL_8:
  v31 = [(IMExpandingLabel *)self moreButton];
  if (!v31 || [(IMExpandingLabel *)self isExpanded])
  {

LABEL_11:
    v32 = [(IMExpandingLabel *)self textView];
    v33 = [v32 textContainer];
    [v33 setExclusionPaths:MEMORY[0x1E4F1CBF0]];
    goto LABEL_12;
  }
  uint64_t v50 = [(IMExpandingLabel *)self fitsWithinLineLimit];

  if (v50) {
    goto LABEL_11;
  }
  unint64_t v51 = [(IMExpandingLabel *)self languageDirection];
  if (v51 == 2)
  {
    double v52 = 0.0;
  }
  else
  {
    [(IMExpandingLabel *)self bounds];
    double v56 = v55;
    uint64_t v50 = [(IMExpandingLabel *)self moreButton];
    [(id)v50 bounds];
    double v52 = v56 - v57;
  }
  [(IMExpandingLabel *)self bounds];
  [(IMExpandingLabel *)self heightForWidth:v58];
  double v60 = v59;
  v61 = [(IMExpandingLabel *)self moreButton];
  [v61 bounds];
  double v63 = v60 - v62;
  v64 = [(IMExpandingLabel *)self moreButton];
  [v64 bounds];
  double v66 = v65;
  v67 = [(IMExpandingLabel *)self moreButton];
  [v67 bounds];
  double v69 = v68;

  if (v51 != 2) {
  v70 = [(IMExpandingLabel *)self moreButton];
  }
  objc_msgSend(v70, "setFrame:", v52, v63, v66, v69);

  v32 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRect:", v52, v63, v66, v69);
  v77[0] = v32;
  v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v77 count:1];
  v71 = [(IMExpandingLabel *)self textView];
  v72 = [v71 textContainer];
  [v72 setExclusionPaths:v33];

LABEL_12:
  if ([(IMExpandingLabel *)self hasGradient])
  {
    double gradientHeight = self->_gradientHeight;
    [(IMExpandingLabel *)self bounds];
    CGFloat Height = CGRectGetHeight(v78);
    gradientLayer = self->_gradientLayer;
    double v37 = gradientHeight / Height;
    v38 = [NSNumber numberWithFloat:0.0];
    v76[0] = v38;
    double v39 = 1.0 - v37;
    *(float *)&double v39 = 1.0 - v37;
    v40 = [NSNumber numberWithFloat:v39];
    v76[1] = v40;
    double v41 = v37 / -3.0 + 1.0;
    *(float *)&double v41 = v41;
    v42 = [NSNumber numberWithFloat:v41];
    v76[2] = v42;
    double v43 = v37 / -12.0 + 1.0;
    *(float *)&double v43 = v43;
    v44 = [NSNumber numberWithFloat:v43];
    v76[3] = v44;
    v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:v76 count:4];
    [(CAGradientLayer *)gradientLayer setLocations:v45];

    BOOL v46 = [(IMExpandingLabel *)self isExpanded];
    v47 = self->_gradientLayer;
    id gradientSolidColor = self->_gradientSolidColor;
    if (v46)
    {
      v75[0] = self->_gradientSolidColor;
      v75[1] = gradientSolidColor;
      v49 = v75;
      v75[2] = gradientSolidColor;
      v75[3] = gradientSolidColor;
    }
    else
    {
      v74[0] = self->_gradientSolidColor;
      v74[1] = gradientSolidColor;
      id gradientClearColor = self->_gradientClearColor;
      v74[2] = self->_gradientSemiClearColor;
      v74[3] = gradientClearColor;
      v49 = v74;
    }
    v54 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:4];
    [(CAGradientLayer *)v47 setColors:v54];

    [(IMExpandingLabel *)self bounds];
    -[CAGradientLayer setFrame:](self->_gradientLayer, "setFrame:");
  }
}

- (void)setMoreButton:(id)a3
{
  v4 = (UIButton *)a3;
  [(UIButton *)self->_moreButton removeTarget:self action:sel_moreButtonTapped_ forControlEvents:64];
  [(UIButton *)self->_moreButton removeFromSuperview];
  moreButton = self->_moreButton;
  self->_moreButton = v4;
  uint64_t v6 = v4;

  [(IMExpandingLabel *)self addSubview:self->_moreButton];
  [(UIButton *)self->_moreButton addTarget:self action:sel_moreButtonTapped_ forControlEvents:64];

  [(IMExpandingLabel *)self setExpanded:0];
}

- (void)setExpanded:(BOOL)a3
{
  BOOL expanded = self->_expanded;
  self->_BOOL expanded = a3;
  if (a3)
  {
    BOOL v5 = [(IMExpandingLabel *)self textView];
    uint64_t v6 = [v5 textContainer];
    [v6 setMaximumNumberOfLines:0];

    v7 = [(IMExpandingLabel *)self textView];
    v8 = [v7 textContainer];
    [v8 setExclusionPaths:MEMORY[0x1E4F1CBF0]];

    v9 = [(IMExpandingLabel *)self moreButton];
    [v9 setHidden:1];

    [(IMExpandingLabel *)self setNeedsLayout];
    if (!expanded)
    {
      id v14 = [(IMExpandingLabel *)self delegate];
      [v14 expandingLabelShouldExpand:self];
    }
  }
  else
  {
    unint64_t v10 = [(IMExpandingLabel *)self numberOfLines];
    double v11 = [(IMExpandingLabel *)self textView];
    double v12 = [v11 textContainer];
    [v12 setMaximumNumberOfLines:v10];

    float v13 = [(IMExpandingLabel *)self moreButton];
    [v13 setHidden:0];

    [(IMExpandingLabel *)self setNeedsLayout];
  }
}

- (void)setHasGradient:(BOOL)a3
{
  self->_hasGradient = a3;
  if (a3)
  {
    gradientLayer = self->_gradientLayer;
    BOOL v5 = [(UITextView *)self->_textView layer];
    uint64_t v6 = v5;
    v7 = gradientLayer;
  }
  else
  {
    BOOL v5 = [(UITextView *)self->_textView layer];
    uint64_t v6 = v5;
    v7 = 0;
  }
  [v5 setMask:v7];

  [(IMExpandingLabel *)self setNeedsLayout];
}

- (void)setGradientHeight:(double)a3
{
  self->_double gradientHeight = a3;
  [(IMExpandingLabel *)self setNeedsLayout];
}

- (void)moreButtonTapped:(id)a3
{
}

- (void)setText:(id)a3
{
  id v22 = a3;
  if (([v22 isEqualToString:self->_text] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_text, a3);
    if (v22)
    {
      if ([(IMExpandingLabel *)self textMode] == 2
        || ((int64_t v5 = [(IMExpandingLabel *)self textMode],
             int64_t v6 = [(IMExpandingLabel *)self textMode],
             v5 == 4)
         || v6 == 8)
        && [v22 hasHTML])
      {
        v7 = (void *)MEMORY[0x1E4F28B18];
        v8 = [(IMExpandingLabel *)self textAttributes];
        v9 = [v7 safeAttributedStringWithHTML:v22 attributes:v8];

        if ([(IMExpandingLabel *)self textMode] == 8)
        {
          uint64_t v10 = [v9 attributedStringByTrimmingWhitespaceNewlinesAndObjectReplacementCharacters];

          v9 = (void *)v10;
        }
        double v11 = [(IMExpandingLabel *)self textView];
        [v11 setAttributedText:v9];
      }
      else
      {
        id v13 = objc_alloc(MEMORY[0x1E4F28B18]);
        v9 = [(IMExpandingLabel *)self textAttributes];
        double v11 = (void *)[v13 initWithString:v22 attributes:v9];
        id v14 = [(IMExpandingLabel *)self textView];
        [v14 setAttributedText:v11];
      }
      unint64_t v15 = [(IMExpandingLabel *)self textView];
      v16 = [v15 text];
      id v17 = [(IMExpandingLabel *)self textView];
      uint64_t v18 = [v17 text];
      v24.length = [v18 length];
      v24.location = 0;
      double v19 = (__CFString *)CFStringTokenizerCopyBestStringLanguage(v16, v24);

      -[IMExpandingLabel setLanguageDirection:](self, "setLanguageDirection:", [MEMORY[0x1E4F1CA20] characterDirectionForLanguage:v19]);
    }
    else
    {
      double v12 = [(IMExpandingLabel *)self textView];
      [v12 setText:0];

      [(IMExpandingLabel *)self setLanguageDirection:1];
    }
    BOOL v20 = [(IMExpandingLabel *)self languageDirection] == 2;
    float v21 = [(IMExpandingLabel *)self textView];
    [v21 setTextAlignment:2 * v20];

    [(IMExpandingLabel *)self setNeedsLayout];
  }
}

- (void)setNumberOfLines:(unint64_t)a3
{
  self->_numberOfLines = a3;
  if (![(IMExpandingLabel *)self isExpanded])
  {
    int64_t v5 = [(IMExpandingLabel *)self textView];
    int64_t v6 = [v5 textContainer];
    [v6 setMaximumNumberOfLines:a3];

    [(IMExpandingLabel *)self setNeedsLayout];
  }
}

- (double)heightForWidth:(double)a3
{
  v4 = [(IMExpandingLabel *)self textView];
  objc_msgSend(v4, "sizeThatFits:", a3, 3.40282347e38);
  float v6 = v5;
  double v7 = ceilf(v6);

  return v7;
}

- (void)setScrollEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(IMExpandingLabel *)self textView];
  [v4 setScrollEnabled:v3];
}

- (BOOL)isScrollEnabled
{
  v2 = [(IMExpandingLabel *)self textView];
  char v3 = [v2 isScrollEnabled];

  return v3;
}

- (UITextView)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
}

- (NSString)text
{
  return self->_text;
}

- (NSDictionary)textAttributes
{
  return self->_textAttributes;
}

- (void)setTextAttributes:(id)a3
{
}

- (unint64_t)numberOfLines
{
  return self->_numberOfLines;
}

- (int64_t)textMode
{
  return self->_textMode;
}

- (void)setTextMode:(int64_t)a3
{
  self->_textMode = a3;
}

- (UIButton)moreButton
{
  return self->_moreButton;
}

- (BOOL)isExpanded
{
  return self->_expanded;
}

- (BOOL)hasGradient
{
  return self->_hasGradient;
}

- (double)gradientHeight
{
  return self->_gradientHeight;
}

- (IMExpandingLabelDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (IMExpandingLabelDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)fitsWithinLineLimit
{
  return self->_fitsWithinLineLimit;
}

- (void)setFitsWithinLineLimit:(BOOL)a3
{
  self->_fitsWithinLineLimit = a3;
}

- (unint64_t)languageDirection
{
  return self->_languageDirection;
}

- (void)setLanguageDirection:(unint64_t)a3
{
  self->_languageDirection = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_moreButton, 0);
  objc_storeStrong((id *)&self->_textAttributes, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong(&self->_gradientSolidColor, 0);
  objc_storeStrong(&self->_gradientSemiClearColor, 0);
  objc_storeStrong(&self->_gradientClearColor, 0);

  objc_storeStrong((id *)&self->_gradientLayer, 0);
}

@end