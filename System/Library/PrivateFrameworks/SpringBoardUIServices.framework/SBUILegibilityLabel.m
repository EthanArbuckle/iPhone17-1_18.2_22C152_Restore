@interface SBUILegibilityLabel
- (BOOL)adjustsFontSizeToFitWidth;
- (BOOL)usesColorFilters;
- (BOOL)usesSecondaryColor;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSAttributedString)attributedText;
- (NSString)string;
- (SBUILegibilityEngine)legibilityEngine;
- (SBUILegibilityLabel)initWithCoder:(id)a3;
- (SBUILegibilityLabel)initWithFrame:(CGRect)a3;
- (SBUILegibilityLabel)initWithSettings:(id)a3 strength:(double)a4;
- (SBUILegibilityLabel)initWithSettings:(id)a3 strength:(double)a4 string:(id)a5 font:(id)a6;
- (SBUILegibilityLabel)initWithSettings:(id)a3 strength:(double)a4 string:(id)a5 font:(id)a6 options:(int64_t)a7;
- (UIColor)textColor;
- (UIEdgeInsets)characterOverflowInsets;
- (UIFont)font;
- (_UILegibilitySettings)legibilitySettings;
- (double)firstBaselineOffsetFromBottom;
- (double)lastBaselineOffsetFromBottom;
- (double)minimumScaleFactor;
- (double)strength;
- (float)hyphenationFactor;
- (id)drawingColor;
- (id)shadowColor;
- (id)viewForFirstBaselineLayout;
- (id)viewForLastBaselineLayout;
- (int64_t)lineBreakMode;
- (int64_t)numberOfLines;
- (int64_t)options;
- (int64_t)textAlignment;
- (void)_markOurselfDirty;
- (void)_updateLabelColor;
- (void)_updateLabelForLegibilitySettings;
- (void)_updateLegibilityView;
- (void)layoutSubviews;
- (void)setAdjustsFontSizeToFitWidth:(BOOL)a3;
- (void)setAttributedText:(id)a3;
- (void)setBounds:(CGRect)a3;
- (void)setFont:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setHyphenationFactor:(float)a3;
- (void)setLegibilityEngine:(id)a3;
- (void)setLegibilitySettings:(id)a3;
- (void)setLineBreakMode:(int64_t)a3;
- (void)setMinimumScaleFactor:(double)a3;
- (void)setNumberOfLines:(int64_t)a3;
- (void)setOptions:(int64_t)a3;
- (void)setStrength:(double)a3;
- (void)setString:(id)a3;
- (void)setTextAlignment:(int64_t)a3;
- (void)setTextColor:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation SBUILegibilityLabel

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[UILabel sizeThatFits:](self->_lookasideLabel, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setString:(id)a3
{
  id v6 = a3;
  if (!-[NSString isEqualToString:](self->_string, "isEqualToString:"))
  {
    double v4 = (NSString *)[v6 copy];
    string = self->_string;
    self->_string = v4;

    [(UILabel *)self->_lookasideLabel setText:self->_string];
    [(SBUILegibilityLabel *)self _markOurselfDirty];
  }
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(SBUILegibilityLabel *)self frame];
  v8.receiver = self;
  v8.super_class = (Class)SBUILegibilityLabel;
  -[SBUILegibilityLabel setFrame:](&v8, sel_setFrame_, x, y, width, height);
  if ((BSSizeEqualToSize() & 1) == 0)
  {
    [(UILabel *)self->_lookasideLabel setNeedsLayout];
    [(SBUILegibilityLabel *)self _markOurselfDirty];
  }
}

- (void)_markOurselfDirty
{
  self->_isDirtdouble y = 1;
  [(SBUILegibilityLabel *)self setNeedsLayout];
  [(SBUILegibilityLabel *)self invalidateIntrinsicContentSize];
}

- (SBUILegibilityLabel)initWithFrame:(CGRect)a3
{
  double v4 = objc_msgSend(MEMORY[0x1E4F43228], "sharedInstanceForStyle:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = [(SBUILegibilityLabel *)self initWithSettings:v4 strength:*MEMORY[0x1E4F440D8]];

  return v5;
}

- (SBUILegibilityLabel)initWithCoder:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"SBUILegibilityLabel.m" lineNumber:52 description:@"Not supported"];

  double v6 = *MEMORY[0x1E4F1DB28];
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  return -[SBUILegibilityLabel initWithFrame:](self, "initWithFrame:", v6, v7, v8, v9);
}

- (SBUILegibilityLabel)initWithSettings:(id)a3 strength:(double)a4
{
  double v6 = (void *)MEMORY[0x1E4F42A30];
  id v7 = a3;
  [v6 systemFontSize];
  double v8 = objc_msgSend(v6, "systemFontOfSize:");
  double v9 = [(SBUILegibilityLabel *)self initWithSettings:v7 strength:0 string:v8 font:a4];

  return v9;
}

- (SBUILegibilityLabel)initWithSettings:(id)a3 strength:(double)a4 string:(id)a5 font:(id)a6
{
  return [(SBUILegibilityLabel *)self initWithSettings:a3 strength:a5 string:a6 font:0 options:a4];
}

- (SBUILegibilityLabel)initWithSettings:(id)a3 strength:(double)a4 string:(id)a5 font:(id)a6 options:(int64_t)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  v27.receiver = self;
  v27.super_class = (Class)SBUILegibilityLabel;
  double v16 = *MEMORY[0x1E4F1DB28];
  double v17 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v18 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v19 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v20 = -[SBUILegibilityLabel initWithFrame:](&v27, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], v17, v18, v19);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_legibilitySettings, a3);
    v21->_strength = a4;
    uint64_t v22 = [v14 copy];
    string = v21->_string;
    v21->_string = (NSString *)v22;

    objc_storeStrong((id *)&v21->_font, a6);
    v21->_options = a7;
    uint64_t v24 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42B38]), "initWithFrame:", v16, v17, v18, v19);
    lookasideLabel = v21->_lookasideLabel;
    v21->_lookasideLabel = (UILabel *)v24;

    [(UILabel *)v21->_lookasideLabel setHidden:1];
    [(UILabel *)v21->_lookasideLabel setText:v21->_string];
    [(UILabel *)v21->_lookasideLabel setFont:v21->_font];
    [(SBUILegibilityLabel *)v21 _updateLabelColor];
    [(SBUILegibilityLabel *)v21 addSubview:v21->_lookasideLabel];
    [(SBUILegibilityLabel *)v21 _markOurselfDirty];
  }

  return v21;
}

- (void)setAttributedText:(id)a3
{
  id v4 = a3;
  uint64_t attributedText = (uint64_t)self->_attributedText;
  if ((id)attributedText != v4)
  {
    double v8 = v4;
    uint64_t attributedText = [(id)attributedText isEqualToAttributedString:v4];
    id v4 = v8;
    if ((attributedText & 1) == 0)
    {
      double v6 = (NSAttributedString *)[v8 copy];
      id v7 = self->_attributedText;
      self->_uint64_t attributedText = v6;

      [(UILabel *)self->_lookasideLabel setAttributedText:self->_attributedText];
      uint64_t attributedText = [(SBUILegibilityLabel *)self _markOurselfDirty];
      id v4 = v8;
    }
  }
  MEMORY[0x1F41817F8](attributedText, v4);
}

- (UIColor)textColor
{
  textColorOverride = self->_textColorOverride;
  if (textColorOverride)
  {
    double v3 = textColorOverride;
  }
  else
  {
    double v3 = [(_UILegibilitySettings *)self->_legibilitySettings primaryColor];
  }
  return v3;
}

- (void)setTextColor:(id)a3
{
  id v5 = a3;
  if ((-[UIColor isEqual:](self->_textColorOverride, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_textColorOverride, a3);
    [(SBUILegibilityLabel *)self _updateLabelColor];
    [(SBUILegibilityLabel *)self _markOurselfDirty];
  }
}

- (void)setFont:(id)a3
{
  id v5 = (UIFont *)a3;
  if (self->_font != v5)
  {
    objc_storeStrong((id *)&self->_font, a3);
    [(UILabel *)self->_lookasideLabel setFont:v5];
    [(SBUILegibilityLabel *)self _markOurselfDirty];
  }
}

- (int64_t)numberOfLines
{
  return [(UILabel *)self->_lookasideLabel numberOfLines];
}

- (void)setNumberOfLines:(int64_t)a3
{
  if ([(UILabel *)self->_lookasideLabel numberOfLines] != a3)
  {
    [(UILabel *)self->_lookasideLabel setNumberOfLines:a3];
    if (a3 > 1) {
      uint64_t v5 = 1;
    }
    else {
      uint64_t v5 = 4;
    }
    [(UILabel *)self->_lookasideLabel setTextAlignment:v5];
    [(SBUILegibilityLabel *)self _markOurselfDirty];
  }
}

- (BOOL)adjustsFontSizeToFitWidth
{
  return [(UILabel *)self->_lookasideLabel adjustsFontSizeToFitWidth];
}

- (void)setAdjustsFontSizeToFitWidth:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UILabel *)self->_lookasideLabel adjustsFontSizeToFitWidth] != a3)
  {
    [(UILabel *)self->_lookasideLabel setAdjustsFontSizeToFitWidth:v3];
    [(SBUILegibilityLabel *)self _markOurselfDirty];
  }
}

- (double)minimumScaleFactor
{
  [(UILabel *)self->_lookasideLabel minimumScaleFactor];
  return result;
}

- (void)setMinimumScaleFactor:(double)a3
{
  [(UILabel *)self->_lookasideLabel minimumScaleFactor];
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    [(UILabel *)self->_lookasideLabel setMinimumScaleFactor:a3];
    [(SBUILegibilityLabel *)self _markOurselfDirty];
  }
}

- (int64_t)textAlignment
{
  return [(UILabel *)self->_lookasideLabel textAlignment];
}

- (void)setTextAlignment:(int64_t)a3
{
  if ([(UILabel *)self->_lookasideLabel textAlignment] != a3)
  {
    [(UILabel *)self->_lookasideLabel setTextAlignment:a3];
    [(SBUILegibilityLabel *)self _markOurselfDirty];
  }
}

- (int64_t)lineBreakMode
{
  return [(UILabel *)self->_lookasideLabel lineBreakMode];
}

- (void)setLineBreakMode:(int64_t)a3
{
  if ([(UILabel *)self->_lookasideLabel lineBreakMode] != a3)
  {
    [(UILabel *)self->_lookasideLabel setLineBreakMode:a3];
    [(SBUILegibilityLabel *)self _markOurselfDirty];
  }
}

- (float)hyphenationFactor
{
  [(UILabel *)self->_lookasideLabel _hyphenationFactor];
  return result;
}

- (void)setHyphenationFactor:(float)a3
{
  [(UILabel *)self->_lookasideLabel _hyphenationFactor];
  if (*(float *)&v5 != a3)
  {
    *(float *)&double v5 = a3;
    [(UILabel *)self->_lookasideLabel _setHyphenationFactor:v5];
    [(SBUILegibilityLabel *)self _markOurselfDirty];
  }
}

- (void)setOptions:(int64_t)a3
{
  if (self->_options != a3)
  {
    self->_options = a3;
    [(SBUILegibilityView *)self->_legibilityView updateForChangedSettings:self->_legibilitySettings options:a3];
    [(SBUILegibilityLabel *)self _updateLabelColor];
    [(SBUILegibilityLabel *)self _markOurselfDirty];
  }
}

- (UIEdgeInsets)characterOverflowInsets
{
  [(UILabel *)self->_lookasideLabel _contentInsetsFromFonts];
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (double)firstBaselineOffsetFromBottom
{
  [(SBUILegibilityLabel *)self bounds];
  double Height = CGRectGetHeight(v6);
  [(UILabel *)self->_lookasideLabel effectiveFirstBaselineOffsetFromTop];
  return Height - v4;
}

- (double)lastBaselineOffsetFromBottom
{
  [(UILabel *)self->_lookasideLabel effectiveBaselineOffsetFromBottom];
  return result;
}

- (void)_updateLabelColor
{
  lookasideLabel = self->_lookasideLabel;
  if (self->_textColorOverride)
  {
    double v3 = self->_lookasideLabel;
    -[UILabel setTextColor:](v3, "setTextColor:");
  }
  else
  {
    id v4 = [(SBUILegibilityLabel *)self drawingColor];
    [(UILabel *)lookasideLabel setTextColor:v4];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SBUILegibilityLabel;
  id v4 = a3;
  [(SBUILegibilityLabel *)&v6 traitCollectionDidChange:v4];
  double v5 = [(SBUILegibilityLabel *)self traitCollection];
  [v5 displayScale];

  [v4 displayScale];
  if ((BSFloatEqualToFloat() & 1) == 0) {
    [(SBUILegibilityLabel *)self _markOurselfDirty];
  }
}

- (id)viewForFirstBaselineLayout
{
  return self->_lookasideLabel;
}

- (id)viewForLastBaselineLayout
{
  return self->_lookasideLabel;
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(SBUILegibilityLabel *)self bounds];
  v8.receiver = self;
  v8.super_class = (Class)SBUILegibilityLabel;
  -[SBUILegibilityLabel setBounds:](&v8, sel_setBounds_, x, y, width, height);
  if ((BSSizeEqualToSize() & 1) == 0)
  {
    [(UILabel *)self->_lookasideLabel setNeedsLayout];
    [(SBUILegibilityLabel *)self _markOurselfDirty];
  }
}

- (CGSize)intrinsicContentSize
{
  [(UILabel *)self->_lookasideLabel intrinsicContentSize];
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)SBUILegibilityLabel;
  [(SBUILegibilityLabel *)&v4 layoutSubviews];
  lookasideLabel = self->_lookasideLabel;
  [(SBUILegibilityLabel *)self bounds];
  -[UILabel setFrame:](lookasideLabel, "setFrame:");
  if (self->_isDirty)
  {
    [(SBUILegibilityLabel *)self _updateLegibilityView];
    self->_isDirtdouble y = 0;
  }
}

- (void)setStrength:(double)a3
{
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_strength = a3;
    legibilityView = self->_legibilityView;
    [(SBUILegibilityView *)legibilityView setStrength:a3];
  }
}

- (void)setLegibilitySettings:(id)a3
{
  id v5 = a3;
  if ((-[_UILegibilitySettings sb_isEqualToLegibilitySettings:](self->_legibilitySettings, "sb_isEqualToLegibilitySettings:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    [(SBUILegibilityLabel *)self _updateLabelColor];
    [(SBUILegibilityLabel *)self _markOurselfDirty];
    [(SBUILegibilityLabel *)self _updateLegibilityView];
  }
}

- (void)_updateLabelForLegibilitySettings
{
  double v3 = [(UILabel *)self->_lookasideLabel attributedText];
  id v7 = (id)[v3 mutableCopy];

  uint64_t v4 = [v7 length];
  id v5 = [(SBUILegibilityLabel *)self textColor];
  uint64_t v6 = *MEMORY[0x1E4F42510];
  if (v5) {
    objc_msgSend(v7, "addAttribute:value:range:", v6, v5, 0, v4);
  }
  else {
    objc_msgSend(v7, "removeAttribute:range:", v6, 0, v4);
  }
  [(UILabel *)self->_lookasideLabel setAttributedText:v7];
}

- (void)_updateLegibilityView
{
  [(SBUILegibilityLabel *)self _updateLabelForLegibilitySettings];
  [(SBUILegibilityLabel *)self bounds];
  CGFloat rect = v3;
  CGFloat v52 = v5;
  CGFloat v53 = v4;
  CGFloat v51 = v6;
  id v7 = [(SBUILegibilityLabel *)self traitCollection];
  [v7 displayScale];

  [(SBUILegibilityLabel *)self characterOverflowInsets];
  double v54 = v8;
  double v56 = v9;
  double rect_8 = v11;
  double rect_16 = v10;
  [(UILabel *)self->_lookasideLabel bounds];
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  -[UILabel textRectForBounds:limitedToNumberOfLines:](self->_lookasideLabel, "textRectForBounds:limitedToNumberOfLines:", [(UILabel *)self->_lookasideLabel numberOfLines], v12, v14, v16, v18);
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  double v25 = v24;
  CGFloat v27 = v26;
  v64.origin.double x = v13;
  v64.origin.double y = v15;
  v64.size.double width = v17;
  CGFloat v28 = v25;
  v64.size.double height = v19;
  double Height = CGRectGetHeight(v64);
  v65.origin.double x = v21;
  v65.origin.double y = v23;
  v65.size.double width = v28;
  v65.size.double height = v27;
  double v30 = (Height - CGRectGetHeight(v65)) * 0.5;
  if ([(UILabel *)self->_lookasideLabel adjustsFontSizeToFitWidth])
  {
    double v31 = rect;
    CGFloat v32 = v28;
    double v33 = v52;
    double v34 = v53;
    double v35 = v51;
  }
  else
  {
    v66.origin.double x = v21;
    v66.origin.double y = v30;
    v66.size.double width = v28;
    v66.size.double height = v27;
    CGFloat v50 = v30;
    double MinX = CGRectGetMinX(v66);
    v67.origin.double x = rect;
    double v34 = v53;
    v67.origin.double y = v53;
    CGFloat v37 = v28;
    double v35 = v51;
    double v33 = v52;
    v67.size.double width = v52;
    v67.size.double height = v51;
    double rect_16 = rect_16 + MinX - CGRectGetMinX(v67);
    v68.origin.double x = v21;
    v68.origin.double y = v50;
    CGFloat v32 = v37;
    v68.size.double width = v37;
    v68.size.double height = v27;
    double MaxX = CGRectGetMaxX(v68);
    double v31 = rect;
    v69.origin.double x = rect;
    v69.origin.double y = v53;
    v69.size.double width = v52;
    v69.size.double height = v51;
    double v39 = MaxX - CGRectGetMaxX(v69);
    double v30 = v50;
    double rect_8 = rect_8 - v39;
  }
  v70.origin.double x = v21;
  v70.origin.double y = v30;
  v70.size.double width = v32;
  v70.size.double height = v27;
  CGFloat rectb = v27;
  CGFloat v40 = v30;
  double MinY = CGRectGetMinY(v70);
  v71.origin.double x = v31;
  v71.origin.double y = v34;
  v71.size.double width = v33;
  v71.size.double height = v35;
  double v55 = v54 + MinY - CGRectGetMinY(v71);
  v72.origin.double x = v21;
  v72.origin.double y = v40;
  v72.size.double width = v32;
  v72.size.double height = rectb;
  double MaxY = CGRectGetMaxY(v72);
  v73.origin.double x = v31;
  v73.origin.double y = v34;
  v73.size.double width = v33;
  v73.size.double height = v35;
  double v43 = v56 - (MaxY - CGRectGetMaxY(v73));
  double v57 = v35 - (v55 + v43);
  double recta = v33 - (rect_16 + rect_8);
  BSSizeRoundForScale();
  v63[0] = MEMORY[0x1E4F143A8];
  v63[1] = 3221225472;
  v63[2] = __44__SBUILegibilityLabel__updateLegibilityView__block_invoke;
  v63[3] = &unk_1E5CCED98;
  *(double *)&v63[5] = v55;
  *(double *)&v63[6] = rect_16;
  *(double *)&v63[7] = v43;
  *(double *)&v63[8] = rect_8;
  v63[4] = self;
  *(double *)&v63[9] = v31;
  *(double *)&v63[10] = v34;
  *(double *)&v63[11] = v33;
  *(double *)&v63[12] = v35;
  v44 = objc_msgSend(MEMORY[0x1E4F42A80], "sbf_imageFromContextWithSize:scale:type:pool:drawing:", 0, 0, v63);
  legibilityView = self->_legibilityView;
  if (legibilityView)
  {
    -[SBUILegibilityView setFrame:](legibilityView, "setFrame:", v31 + rect_16, v34 + v55, recta, v57);
  }
  else
  {
    v46 = -[SBUILegibilityView initWithFrame:]([SBUILegibilityView alloc], "initWithFrame:", v31 + rect_16, v34 + v55, recta, v57);
    v47 = self->_legibilityView;
    self->_legibilityView = v46;

    [(SBUILegibilityLabel *)self addSubview:self->_legibilityView];
  }
  v48 = self->_legibilityView;
  v49 = [(SBUILegibilityLabel *)self legibilitySettings];
  [(SBUILegibilityView *)v48 updateForChangedSettings:v49 options:[(SBUILegibilityLabel *)self options] image:v44 strength:self->_strength];
}

uint64_t __44__SBUILegibilityLabel__updateLegibilityView__block_invoke(uint64_t a1)
{
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextTranslateCTM(CurrentContext, -*(double *)(a1 + 48), -*(double *)(a1 + 40));
  CGContextGetCTM(&v4, CurrentContext);
  CGContextSetBaseCTM();
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 408), "drawRect:", *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
}

- (BOOL)usesColorFilters
{
  return (LOBYTE(self->_options) >> 1) & 1;
}

- (BOOL)usesSecondaryColor
{
  return self->_options & 1;
}

- (id)drawingColor
{
  BOOL v3 = [(SBUILegibilityLabel *)self usesSecondaryColor];
  legibilitySettings = self->_legibilitySettings;
  if (v3) {
    [(_UILegibilitySettings *)legibilitySettings secondaryColor];
  }
  else {
  double v5 = [(_UILegibilitySettings *)legibilitySettings primaryColor];
  }
  return v5;
}

- (id)shadowColor
{
  return (id)[(_UILegibilitySettings *)self->_legibilitySettings shadowColor];
}

- (SBUILegibilityEngine)legibilityEngine
{
  return [(SBUILegibilityView *)self->_legibilityView legibilityEngine];
}

- (void)setLegibilityEngine:(id)a3
{
}

- (NSAttributedString)attributedText
{
  return self->_attributedText;
}

- (NSString)string
{
  return self->_string;
}

- (UIFont)font
{
  return self->_font;
}

- (double)strength
{
  return self->_strength;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (int64_t)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_textColorOverride, 0);
  objc_storeStrong((id *)&self->_attributedText, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_string, 0);
  objc_storeStrong((id *)&self->_legibilityView, 0);
  objc_storeStrong((id *)&self->_lookasideLabel, 0);
}

@end