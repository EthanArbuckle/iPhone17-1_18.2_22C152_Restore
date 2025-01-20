@interface SBUIVibrantButton
+ (id)_labelFont;
- (BOOL)_shouldUseVibrancy;
- (BOOL)isVibrancyAllowed;
- (CGRect)_glyphFrameForSize:(CGSize)a3 inRect:(CGRect)a4;
- (CGRect)_labelFrameForSize:(CGSize)a3 baselineOffset:(double)a4 inRect:(CGRect)a5;
- (CGSize)_sizeThatFitsForLabelView:(id)a3;
- (CGSize)_sizeThatFitsWithVibrancy;
- (CGSize)_sizeThatFitsWithoutVibrancy;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)title;
- (SBUIVibrantButton)initWithFrame:(CGRect)a3;
- (UIImage)glyphImage;
- (_SBFVibrantSettings)vibrantSettings;
- (_UILegibilitySettings)legibilitySettings;
- (double)_alphaForState;
- (double)minimumTitleScaleFactor;
- (double)strength;
- (id)_lazyGlyphLegibilityView;
- (id)backgroundColor;
- (int64_t)lineBreakMode;
- (int64_t)numberOfLines;
- (int64_t)textAlignment;
- (void)_layoutNonVibrantSubviews;
- (void)_layoutVibrantSubviews;
- (void)_setUpForCurrentVibrancy;
- (void)_updateForState;
- (void)layoutSubviews;
- (void)setBackgroundColor:(id)a3;
- (void)setBackgroundView:(id)a3;
- (void)setGlyphImage:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setLegibilitySettings:(id)a3;
- (void)setLegibilitySettings:(id)a3 textStrength:(double)a4;
- (void)setLineBreakMode:(int64_t)a3;
- (void)setMinimumTitleScaleFactor:(double)a3;
- (void)setNumberOfLines:(int64_t)a3;
- (void)setStrength:(double)a3;
- (void)setTextAlignment:(int64_t)a3;
- (void)setTitle:(id)a3;
- (void)setVibrancyAllowed:(BOOL)a3;
- (void)setVibrantSettings:(id)a3;
@end

@implementation SBUIVibrantButton

- (SBUIVibrantButton)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SBUIVibrantButton;
  v3 = -[SBUIVibrantButton initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4F43228] sharedInstanceForStyle:2];
    [(SBUIVibrantButton *)v3 setLegibilitySettings:v4];
    [(SBUIVibrantButton *)v3 setStrength:*MEMORY[0x1E4F440D8]];
    v3->_numberOfLines = 1;
    v3->_minimumTitleScaleFactor = 0.0;
    v3->_textAlignment = 4;
    v3->_lineBreakMode = 4;
    [(SBUIVibrantButton *)v3 _setUpForCurrentVibrancy];
  }
  return v3;
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (!v4 || (v5 = [(NSString *)self->_title isEqualToString:v4], id v4 = v8, (v5 & 1) == 0))
  {
    objc_super v6 = (NSString *)[v4 copy];
    title = self->_title;
    self->_title = v6;

    [(SBUILegibilityLabel *)self->_nonVibrantLegibilityLabel setString:self->_title];
    uint64_t v5 = [(UILabel *)self->_vibrantMaskLabel setText:self->_title];
    id v4 = v8;
  }
  MEMORY[0x1F41817F8](v5, v4);
}

- (void)setGlyphImage:(id)a3
{
  uint64_t v5 = (UIImage *)a3;
  v9 = v5;
  if (self->_glyphImage != v5)
  {
    objc_storeStrong((id *)&self->_glyphImage, a3);
    uint64_t v5 = v9;
  }
  if (v5 && !self->_nonVibrantGlyph)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F42FF0]);
    v7 = (UIView *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    nonVibrantGlyph = self->_nonVibrantGlyph;
    self->_nonVibrantGlyph = v7;

    [(UIView *)self->_nonVibrantGlyph setClipsToBounds:1];
    [(UIView *)self->_nonVibrantGlyph setUserInteractionEnabled:0];
    [(SBUIVibrantButton *)self addSubview:self->_nonVibrantGlyph];
    uint64_t v5 = v9;
  }
  [(UIImageView *)self->_vibrantMaskGlyphView setImage:v5];
  [(SBUIVibrantButton *)self setNeedsLayout];
}

- (void)setVibrancyAllowed:(BOOL)a3
{
  if (self->_vibrancyAllowed != a3)
  {
    self->_vibrancyAllowed = a3;
    [(SBUIVibrantButton *)self _setUpForCurrentVibrancy];
  }
}

- (void)setMinimumTitleScaleFactor:(double)a3
{
  self->_double minimumTitleScaleFactor = a3;
  -[UILabel setMinimumScaleFactor:](self->_vibrantMaskLabel, "setMinimumScaleFactor:");
  nonVibrantLegibilityLabel = self->_nonVibrantLegibilityLabel;
  double minimumTitleScaleFactor = self->_minimumTitleScaleFactor;
  [(SBUILegibilityLabel *)nonVibrantLegibilityLabel setMinimumScaleFactor:minimumTitleScaleFactor];
}

- (void)setTextAlignment:(int64_t)a3
{
  self->_int64_t textAlignment = a3;
  -[UILabel setTextAlignment:](self->_vibrantMaskLabel, "setTextAlignment:");
  nonVibrantLegibilityLabel = self->_nonVibrantLegibilityLabel;
  int64_t textAlignment = self->_textAlignment;
  [(SBUILegibilityLabel *)nonVibrantLegibilityLabel setTextAlignment:textAlignment];
}

- (void)setNumberOfLines:(int64_t)a3
{
  self->_numberOfLines = a3;
  -[UILabel setNumberOfLines:](self->_vibrantMaskLabel, "setNumberOfLines:");
  nonVibrantLegibilityLabel = self->_nonVibrantLegibilityLabel;
  int64_t textAlignment = self->_textAlignment;
  [(SBUILegibilityLabel *)nonVibrantLegibilityLabel setNumberOfLines:textAlignment];
}

- (void)setLineBreakMode:(int64_t)a3
{
  self->_int64_t lineBreakMode = a3;
  -[UILabel setLineBreakMode:](self->_vibrantMaskLabel, "setLineBreakMode:");
  nonVibrantLegibilityLabel = self->_nonVibrantLegibilityLabel;
  int64_t lineBreakMode = self->_lineBreakMode;
  [(SBUILegibilityLabel *)nonVibrantLegibilityLabel setLineBreakMode:lineBreakMode];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  if ([(SBUIVibrantButton *)self _shouldUseVibrancy])
  {
    [(SBUIVibrantButton *)self _sizeThatFitsWithVibrancy];
  }
  else
  {
    [(SBUIVibrantButton *)self _sizeThatFitsWithoutVibrancy];
  }
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)layoutSubviews
{
  if ([(SBUIVibrantButton *)self _shouldUseVibrancy])
  {
    [(SBUIVibrantButton *)self _layoutVibrantSubviews];
  }
  else
  {
    [(SBUIVibrantButton *)self _layoutNonVibrantSubviews];
  }
}

- (void)setBackgroundColor:(id)a3
{
  nonVibrantGlyph = self->_nonVibrantGlyph;
  id v5 = a3;
  [(UIView *)nonVibrantGlyph setBackgroundColor:v5];
  [(UIView *)self->_vibrantGlyph setBackgroundColor:v5];
}

- (id)backgroundColor
{
  return [(UIView *)self->_nonVibrantGlyph backgroundColor];
}

- (void)setHighlighted:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBUIVibrantButton;
  [(SBUIVibrantButton *)&v4 setHighlighted:a3];
  [(SBUIVibrantButton *)self _updateForState];
}

- (BOOL)_shouldUseVibrancy
{
  if (![(SBUIVibrantButton *)self isVibrancyAllowed]) {
    return 0;
  }
  v2 = [MEMORY[0x1E4F42948] currentDevice];
  BOOL v3 = [v2 _graphicsQuality] == 100;

  return v3;
}

+ (id)_labelFont
{
  [MEMORY[0x1E4FA5F68] logoutLabelFontSize];
  v2 = (void *)MEMORY[0x1E4F42A30];
  return (id)objc_msgSend(v2, "systemFontOfSize:");
}

- (void)_setUpForCurrentVibrancy
{
  if ([(SBUIVibrantButton *)self _shouldUseVibrancy])
  {
    [(UIView *)self->_nonVibrantGlyph removeFromSuperview];
    [(SBUILegibilityLabel *)self->_nonVibrantLegibilityLabel removeFromSuperview];
    nonVibrantGlyph = self->_nonVibrantGlyph;
    self->_nonVibrantGlyph = 0;

    nonVibrantGlyphLegibilityView = self->_nonVibrantGlyphLegibilityView;
    self->_nonVibrantGlyphLegibilityView = 0;

    nonVibrantLegibilityLabel = self->_nonVibrantLegibilityLabel;
    self->_nonVibrantLegibilityLabel = 0;

    if (!self->_vibrantGlyph)
    {
      id v6 = objc_alloc(MEMORY[0x1E4F42FF0]);
      double v7 = *MEMORY[0x1E4F1DB28];
      double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
      v11 = (UIView *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], v8, v9, v10);
      vibrantGlyph = self->_vibrantGlyph;
      self->_vibrantGlyph = v11;

      [(UIView *)self->_vibrantGlyph setUserInteractionEnabled:0];
      [(SBUIVibrantButton *)self addSubview:self->_vibrantGlyph];
      id v13 = objc_alloc(MEMORY[0x1E4F42FF0]);
      [(SBUIVibrantButton *)self bounds];
      v14 = (UIView *)objc_msgSend(v13, "initWithFrame:");
      vibrantMaskView = self->_vibrantMaskView;
      self->_vibrantMaskView = v14;

      v16 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42B38]), "initWithFrame:", v7, v8, v9, v10);
      vibrantMaskLabel = self->_vibrantMaskLabel;
      self->_vibrantMaskLabel = v16;

      [(UIView *)self->_vibrantMaskView addSubview:self->_vibrantMaskLabel];
      [(UILabel *)self->_vibrantMaskLabel setText:self->_title];
      v18 = self->_vibrantMaskLabel;
      v19 = [(id)objc_opt_class() _labelFont];
      [(UILabel *)v18 setFont:v19];

      [(UILabel *)self->_vibrantMaskLabel setAdjustsFontSizeToFitWidth:1];
      [(UILabel *)self->_vibrantMaskLabel setMinimumScaleFactor:self->_minimumTitleScaleFactor];
      [(UILabel *)self->_vibrantMaskLabel setTextAlignment:self->_textAlignment];
      [(UILabel *)self->_vibrantMaskLabel setNumberOfLines:self->_numberOfLines];
      [(UILabel *)self->_vibrantMaskLabel setLineBreakMode:self->_lineBreakMode];
      v20 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42AA0]), "initWithFrame:", v7, v8, v9, v10);
      vibrantMaskGlyphView = self->_vibrantMaskGlyphView;
      self->_vibrantMaskGlyphView = v20;

      [(UIView *)self->_vibrantMaskView addSubview:self->_vibrantMaskGlyphView];
      [(UIImageView *)self->_vibrantMaskGlyphView setImage:self->_glyphImage];
      v22 = self->_vibrantGlyph;
      v23 = self->_vibrantMaskView;
      [(UIView *)v22 setMaskView:v23];
    }
  }
  else
  {
    [(UIView *)self->_vibrantGlyph removeFromSuperview];
    v24 = self->_vibrantGlyph;
    self->_vibrantGlyph = 0;

    v25 = self->_vibrantMaskView;
    self->_vibrantMaskView = 0;

    v26 = self->_vibrantMaskLabel;
    self->_vibrantMaskLabel = 0;

    v27 = self->_vibrantMaskGlyphView;
    self->_vibrantMaskGlyphView = 0;

    vibrantGlyphTintView = self->_vibrantGlyphTintView;
    self->_vibrantGlyphTintView = 0;

    vibrantGlyphBackgroundView = self->_vibrantGlyphBackgroundView;
    self->_vibrantGlyphBackgroundView = 0;

    if (!self->_nonVibrantGlyph)
    {
      id v30 = objc_alloc(MEMORY[0x1E4F42FF0]);
      v31 = (UIView *)objc_msgSend(v30, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      v32 = self->_nonVibrantGlyph;
      self->_nonVibrantGlyph = v31;

      [(UIView *)self->_nonVibrantGlyph setClipsToBounds:1];
      [(UIView *)self->_nonVibrantGlyph setUserInteractionEnabled:0];
      [(SBUIVibrantButton *)self addSubview:self->_nonVibrantGlyph];
    }
    if (!self->_nonVibrantLegibilityLabel)
    {
      v33 = [SBUILegibilityLabel alloc];
      legibilitySettings = self->_legibilitySettings;
      double v35 = *MEMORY[0x1E4F440D8];
      if (self->_title) {
        title = (__CFString *)self->_title;
      }
      else {
        title = &stru_1EFCB7578;
      }
      v37 = [(id)objc_opt_class() _labelFont];
      v38 = [(SBUILegibilityLabel *)v33 initWithSettings:legibilitySettings strength:title string:v37 font:v35];
      v39 = self->_nonVibrantLegibilityLabel;
      self->_nonVibrantLegibilityLabel = v38;

      [(SBUILegibilityLabel *)self->_nonVibrantLegibilityLabel setAdjustsFontSizeToFitWidth:1];
      [(SBUILegibilityLabel *)self->_nonVibrantLegibilityLabel setMinimumScaleFactor:self->_minimumTitleScaleFactor];
      [(SBUILegibilityLabel *)self->_nonVibrantLegibilityLabel setNumberOfLines:self->_numberOfLines];
      [(SBUILegibilityLabel *)self->_nonVibrantLegibilityLabel setTextAlignment:self->_textAlignment];
      [(SBUILegibilityLabel *)self->_nonVibrantLegibilityLabel setLineBreakMode:self->_lineBreakMode];
      v40 = self->_nonVibrantLegibilityLabel;
      [(SBUIVibrantButton *)self addSubview:v40];
    }
  }
}

- (CGSize)_sizeThatFitsWithVibrancy
{
  [(SBUIVibrantButton *)self _sizeThatFitsForLabelView:self->_vibrantMaskLabel];
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)_sizeThatFitsWithoutVibrancy
{
  [(SBUIVibrantButton *)self _sizeThatFitsForLabelView:self->_nonVibrantLegibilityLabel];
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)_sizeThatFitsForLabelView:(id)a3
{
  objc_msgSend(a3, "sizeThatFits:", 100.0, 3.40282347e38);
  double v5 = v4;
  [(UIImage *)self->_glyphImage size];
  if (v5 >= v6) {
    double v6 = v5;
  }
  double v8 = v7 + 15.0;
  result.height = v8;
  result.width = v6;
  return result;
}

- (CGRect)_labelFrameForSize:(CGSize)a3 baselineOffset:(double)a4 inRect:(CGRect)a5
{
  UIRectCenteredXInRect();
  return CGRectOffset(*(CGRect *)&v6, 0.0, a4);
}

- (CGRect)_glyphFrameForSize:(CGSize)a3 inRect:(CGRect)a4
{
  UIRectInset();
  UIRectCenteredXInRectScale();
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (void)_layoutVibrantSubviews
{
  [(SBUIVibrantButton *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[UILabel sizeThatFits:](self->_vibrantMaskLabel, "sizeThatFits:", v7, v9);
  double v12 = v11;
  double v14 = v13;
  [(UIImage *)self->_glyphImage size];
  double v33 = v15;
  double v17 = v16;
  [(UILabel *)self->_vibrantMaskLabel _firstBaselineOffsetFromTop];
  -[SBUIVibrantButton _labelFrameForSize:baselineOffset:inRect:](self, "_labelFrameForSize:baselineOffset:inRect:", v12, v14, v14 - v18, v4, v6, v8, v10);
  double v37 = v20;
  double v38 = v19;
  double v35 = v22;
  double v36 = v21;
  -[SBUIVibrantButton _glyphFrameForSize:inRect:](self, "_glyphFrameForSize:inRect:", v33, v17, v4, v6, v8, v10);
  double v24 = v23;
  double v26 = v25;
  double v34 = v27;
  double v29 = v28;
  UIRectInset();
  -[UIView setFrame:](self->_vibrantGlyph, "setFrame:");
  vibrantMaskView = self->_vibrantMaskView;
  [(UIView *)self->_vibrantGlyph bounds];
  -[UIView setFrame:](vibrantMaskView, "setFrame:");
  -[UILabel setFrame:](self->_vibrantMaskLabel, "setFrame:", v38, v37, v36, v35);
  -[UIImageView setFrame:](self->_vibrantMaskGlyphView, "setFrame:", v24, v26, v34, v29);
  vibrantGlyphBackgroundView = self->_vibrantGlyphBackgroundView;
  [(UIView *)self->_vibrantGlyph bounds];
  -[UIView setFrame:](vibrantGlyphBackgroundView, "setFrame:");
  vibrantGlyphTintView = self->_vibrantGlyphTintView;
  [(UIView *)self->_vibrantGlyph bounds];
  -[UIView setFrame:](vibrantGlyphTintView, "setFrame:");
}

- (void)_layoutNonVibrantSubviews
{
  [(SBUIVibrantButton *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[SBUILegibilityLabel sizeThatFits:](self->_nonVibrantLegibilityLabel, "sizeThatFits:", v7, v9);
  double v12 = v11;
  double v14 = v13;
  [(UIImage *)self->_glyphImage size];
  double v35 = v16;
  double v36 = v15;
  [(SBUILegibilityLabel *)self->_nonVibrantLegibilityLabel firstBaselineOffsetFromBottom];
  -[SBUIVibrantButton _labelFrameForSize:baselineOffset:inRect:](self, "_labelFrameForSize:baselineOffset:inRect:", v12, v14, v17, v4, v6, v8, v10);
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  -[SBUIVibrantButton _glyphFrameForSize:inRect:](self, "_glyphFrameForSize:inRect:", v36, v35, v4, v6, v8, v10);
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;
  double v33 = v32;
  -[SBUILegibilityLabel setFrame:](self->_nonVibrantLegibilityLabel, "setFrame:", v19, v21, v23, v25);
  nonVibrantGlyph = self->_nonVibrantGlyph;
  -[UIView setFrame:](nonVibrantGlyph, "setFrame:", v27, v29, v31, v33);
}

- (id)_lazyGlyphLegibilityView
{
  if (self->_glyphImage
    && ![(SBUIVibrantButton *)self _shouldUseVibrancy]
    && !self->_nonVibrantGlyphLegibilityView)
  {
    double v3 = [SBUILegibilityView alloc];
    [(UIView *)self->_nonVibrantGlyph bounds];
    double v4 = -[SBUILegibilityView initWithFrame:](v3, "initWithFrame:");
    nonVibrantGlyphLegibilityView = self->_nonVibrantGlyphLegibilityView;
    self->_nonVibrantGlyphLegibilityView = v4;

    double v6 = self->_nonVibrantGlyphLegibilityView;
    double v7 = [MEMORY[0x1E4F43228] sharedInstanceForStyle:1];
    [(SBUILegibilityView *)v6 updateForChangedSettings:v7 options:2 image:self->_glyphImage strength:*MEMORY[0x1E4F440E8]];

    [(UIView *)self->_nonVibrantGlyph addSubview:self->_nonVibrantGlyphLegibilityView];
    [(SBUILegibilityView *)self->_nonVibrantGlyphLegibilityView setAutoresizingMask:18];
    [(UIView *)self->_nonVibrantGlyph setAutoresizesSubviews:1];
  }
  double v8 = self->_nonVibrantGlyphLegibilityView;
  return v8;
}

- (double)_alphaForState
{
  int v2 = [(SBUIVibrantButton *)self isHighlighted];
  double result = 0.2;
  if (!v2) {
    return 1.0;
  }
  return result;
}

- (void)_updateForState
{
  [(SBUIVibrantButton *)self _alphaForState];
  -[SBUIVibrantButton setAlpha:](self, "setAlpha:");
}

- (void)setVibrantSettings:(id)a3
{
  id v9 = a3;
  if ([(SBUIVibrantButton *)self _shouldUseVibrancy]
    && ([(_SBFVibrantSettings *)self->_vibrantSettings isEqual:v9] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_vibrantSettings, a3);
    [(UIView *)self->_vibrantGlyphTintView removeFromSuperview];
    vibrantGlyphTintView = self->_vibrantGlyphTintView;
    self->_vibrantGlyphTintView = 0;

    vibrantSettings = self->_vibrantSettings;
    [(UIView *)self->_vibrantGlyph bounds];
    -[_SBFVibrantSettings tintViewWithFrame:](vibrantSettings, "tintViewWithFrame:");
    double v7 = (UIView *)objc_claimAutoreleasedReturnValue();
    double v8 = self->_vibrantGlyphTintView;
    self->_vibrantGlyphTintView = v7;

    [(UIView *)self->_vibrantGlyph addSubview:self->_vibrantGlyphTintView];
  }
}

- (void)setBackgroundView:(id)a3
{
  double v23 = (UIView *)a3;
  uint64_t v5 = [(SBUIVibrantButton *)self _shouldUseVibrancy];
  double v6 = v23;
  if (v5)
  {
    p_vibrantGlyphBackgroundView = &self->_vibrantGlyphBackgroundView;
    vibrantGlyphBackgroundView = self->_vibrantGlyphBackgroundView;
    id v9 = v23;
    if (vibrantGlyphBackgroundView != v23)
    {
      [(UIView *)vibrantGlyphBackgroundView removeFromSuperview];
      objc_storeStrong((id *)&self->_vibrantGlyphBackgroundView, a3);
      [(UIView *)self->_vibrantGlyph addSubview:*p_vibrantGlyphBackgroundView];
      [(UIView *)self->_vibrantGlyph sendSubviewToBack:*p_vibrantGlyphBackgroundView];
      id v9 = *p_vibrantGlyphBackgroundView;
    }
    [(UIView *)v9 frame];
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    [(UIView *)self->_vibrantGlyph bounds];
    v26.origin.x = v18;
    v26.origin.y = v19;
    v26.size.width = v20;
    v26.size.height = v21;
    v25.origin.x = v11;
    v25.origin.y = v13;
    v25.size.width = v15;
    v25.size.height = v17;
    uint64_t v5 = CGRectEqualToRect(v25, v26);
    double v6 = v23;
    if ((v5 & 1) == 0)
    {
      double v22 = *p_vibrantGlyphBackgroundView;
      [(UIView *)self->_vibrantGlyph bounds];
      uint64_t v5 = -[UIView setFrame:](v22, "setFrame:");
      double v6 = v23;
    }
  }
  MEMORY[0x1F41817F8](v5, v6);
}

- (void)setStrength:(double)a3
{
  self->_strength = a3;
  uint64_t v5 = [(SBUIVibrantButton *)self _lazyGlyphLegibilityView];
  [v5 setStrength:a3];

  nonVibrantLegibilityLabel = self->_nonVibrantLegibilityLabel;
  [(SBUILegibilityLabel *)nonVibrantLegibilityLabel setStrength:a3];
}

- (void)setLegibilitySettings:(id)a3
{
  objc_storeStrong((id *)&self->_legibilitySettings, a3);
  id v6 = a3;
  uint64_t v5 = [(SBUIVibrantButton *)self _lazyGlyphLegibilityView];
  [v5 updateForChangedSettings:v6];

  [(SBUILegibilityLabel *)self->_nonVibrantLegibilityLabel setLegibilitySettings:v6];
}

- (void)setLegibilitySettings:(id)a3 textStrength:(double)a4
{
  id v6 = a3;
  [(SBUIVibrantButton *)self setStrength:a4];
  [(SBUIVibrantButton *)self setLegibilitySettings:v6];
}

- (UIImage)glyphImage
{
  return self->_glyphImage;
}

- (double)minimumTitleScaleFactor
{
  return self->_minimumTitleScaleFactor;
}

- (int64_t)textAlignment
{
  return self->_textAlignment;
}

- (int64_t)lineBreakMode
{
  return self->_lineBreakMode;
}

- (_SBFVibrantSettings)vibrantSettings
{
  return self->_vibrantSettings;
}

- (double)strength
{
  return self->_strength;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (BOOL)isVibrancyAllowed
{
  return self->_vibrancyAllowed;
}

- (NSString)title
{
  return self->_title;
}

- (int64_t)numberOfLines
{
  return self->_numberOfLines;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonVibrantLegibilityLabel, 0);
  objc_storeStrong((id *)&self->_nonVibrantGlyphLegibilityView, 0);
  objc_storeStrong((id *)&self->_nonVibrantGlyph, 0);
  objc_storeStrong((id *)&self->_vibrantGlyphTintView, 0);
  objc_storeStrong((id *)&self->_vibrantGlyphBackgroundView, 0);
  objc_storeStrong((id *)&self->_vibrantGlyph, 0);
  objc_storeStrong((id *)&self->_vibrantMaskGlyphView, 0);
  objc_storeStrong((id *)&self->_vibrantMaskLabel, 0);
  objc_storeStrong((id *)&self->_vibrantMaskView, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_glyphImage, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_vibrantSettings, 0);
}

@end