@interface _UIGlintyStringView
- (BOOL)adjustsFontSizeToFitWidth;
- (BOOL)allowsLuminanceAdjustments;
- (BOOL)animating;
- (BOOL)animationRepeats;
- (BOOL)fading;
- (BOOL)hasCustomBackgroundColor;
- (BOOL)highlight;
- (BOOL)isAnimating;
- (BOOL)needsTextUpdate;
- (BOOL)showing;
- (BOOL)usesBackgroundDimming;
- (CGRect)chevronFrame;
- (CGRect)labelFrame;
- (CGSize)_labelSizeThatFits:(CGSize)a3;
- (CGSize)labelSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSMutableSet)blurHiddenRequesters;
- (NSString)text;
- (NSString)textLanguage;
- (UIColor)backgroundColor;
- (UIColor)chevronBackgroundColor;
- (UIFont)font;
- (UIImage)chevron;
- (UILabel)label;
- (UIView)backgroundView;
- (UIView)blurView;
- (UIView)effectView;
- (UIView)highlightView;
- (UIView)reflectionImageView;
- (UIView)shimmerImageView;
- (UIView)spotlightView;
- (_UIGlintyStringView)initWithText:(id)a3 andFont:(id)a4;
- (_UIGlintyStringViewDelegate)delegate;
- (_UILegibilitySettings)legibilitySettings;
- (_UIVibrantSettings)vibrantSettings;
- (double)_chevronHeightWithMaxOffset;
- (double)_chevronPadding;
- (double)_chevronVerticalOffset;
- (double)_chevronWidthWithPadding;
- (double)_chevronWidthWithPaddingCompression:(double)a3;
- (double)baselineOffsetFromBottom;
- (double)baselineOffsetFromBottomWithSize:(CGSize)a3;
- (double)blurAlpha;
- (double)horizontalPadding;
- (id)_chevronImageForStyle:(int64_t)a3;
- (id)_highlightColor;
- (id)_highlightCompositingFilter;
- (id)shapeViewForCharactersInString:(id)a3 withFont:(id)a4 centeredInFrame:(CGRect)a5;
- (int)textIndex;
- (int64_t)chevronStyle;
- (void)_updateHighlight;
- (void)_updateLabelWithFrame:(CGRect)a3;
- (void)addGlintyAnimations;
- (void)addReflectionAnimationToLayer:(id)a3;
- (void)addShimmerAnimationToLayer:(id)a3;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)fadeIn;
- (void)fadeInWithDuration:(double)a3;
- (void)fadeOut;
- (void)fadeOutWithDuration:(double)a3;
- (void)hide;
- (void)hideBlur;
- (void)hideEffects;
- (void)layoutSubviews;
- (void)removeGlintyAnimations;
- (void)setAdjustsFontSizeToFitWidth:(BOOL)a3;
- (void)setAllowsLuminanceAdjustments:(BOOL)a3;
- (void)setAnimating:(BOOL)a3;
- (void)setAnimationRepeats:(BOOL)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setBackgroundView:(id)a3;
- (void)setBlurAlpha:(double)a3;
- (void)setBlurHidden:(BOOL)a3 forRequester:(id)a4;
- (void)setBlurHiddenRequesters:(id)a3;
- (void)setBlurView:(id)a3;
- (void)setChevron:(id)a3;
- (void)setChevronBackgroundColor:(id)a3;
- (void)setChevronFrame:(CGRect)a3;
- (void)setChevronStyle:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setEffectView:(id)a3;
- (void)setFading:(BOOL)a3;
- (void)setFont:(id)a3;
- (void)setHasCustomBackgroundColor:(BOOL)a3;
- (void)setHighlight:(BOOL)a3;
- (void)setHighlightView:(id)a3;
- (void)setHorizontalPadding:(double)a3;
- (void)setLabel:(id)a3;
- (void)setLabelSize:(CGSize)a3;
- (void)setLegibilitySettings:(id)a3;
- (void)setNeedsTextUpdate:(BOOL)a3;
- (void)setReflectionImageView:(id)a3;
- (void)setShimmerImageView:(id)a3;
- (void)setShowing:(BOOL)a3;
- (void)setSpotlightView:(id)a3;
- (void)setText:(id)a3;
- (void)setTextIndex:(int)a3;
- (void)setTextLanguage:(id)a3;
- (void)setUsesBackgroundDimming:(BOOL)a3;
- (void)setVibrantSettings:(id)a3;
- (void)show;
- (void)showBlur;
- (void)showEffects;
- (void)startAnimating;
- (void)stopAnimating;
- (void)updateBlurForHiddenRequesters;
- (void)updateText;
- (void)updateTextWithBounds:(CGRect)a3;
@end

@implementation _UIGlintyStringView

- (_UIGlintyStringView)initWithText:(id)a3 andFont:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)_UIGlintyStringView;
  v9 = -[UIView initWithFrame:](&v19, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_text, a3);
    objc_storeStrong((id *)&v10->_font, a4);
    v10->_needsTextUpdate = 1;
    v10->_animationRepeats = 1;
    [(_UIGlintyStringView *)v10 setAnimating:0];
    v10->_blurAlpha = 1.0;
    v10->_allowsLuminanceAdjustments = 1;
    v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    blurHiddenRequesters = v10->_blurHiddenRequesters;
    v10->_blurHiddenRequesters = v11;

    v13 = +[_UILegibilitySettings sharedInstanceForStyle:1];
    uint64_t v14 = +[_UIVibrantSettings vibrantSettingsWithReferenceColor:0 referenceContrast:v13 legibilitySettings:0.0];
    vibrantSettings = v10->_vibrantSettings;
    v10->_vibrantSettings = (_UIVibrantSettings *)v14;

    [(_UIGlintyStringView *)v10 setChevronStyle:0];
    [(UIView *)v10 setOpaque:0];
    [(UIView *)v10 setUserInteractionEnabled:1];
    [(_UIGlintyStringView *)v10 updateText];
    v16 = [(UIView *)v10 layer];
    [v16 setAllowsGroupBlending:0];

    v17 = v10;
  }

  return v10;
}

- (void)dealloc
{
  [(_UIGlintyStringView *)self stopAnimating];
  v3.receiver = self;
  v3.super_class = (Class)_UIGlintyStringView;
  [(UIView *)&v3 dealloc];
}

- (void)setText:(id)a3
{
  id v6 = a3;
  if (!-[NSString isEqualToString:](self->_text, "isEqualToString:"))
  {
    v4 = (NSString *)[v6 copy];
    text = self->_text;
    self->_text = v4;

    [(_UIGlintyStringView *)self setNeedsTextUpdate:1];
  }
}

- (void)setFont:(id)a3
{
  id v5 = a3;
  if ((-[UIFont isEqual:](self->_font, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_font, a3);
    [(_UIGlintyStringView *)self setNeedsTextUpdate:1];
  }
}

- (void)setTextLanguage:(id)a3
{
  id v6 = a3;
  if (!-[NSString isEqualToString:](self->_textLanguage, "isEqualToString:"))
  {
    v4 = (NSString *)[v6 copy];
    textLanguage = self->_textLanguage;
    self->_textLanguage = v4;

    [(_UIGlintyStringView *)self setNeedsTextUpdate:1];
  }
}

- (void)setAdjustsFontSizeToFitWidth:(BOOL)a3
{
  if (self->_adjustsFontSizeToFitWidth != a3)
  {
    self->_adjustsFontSizeToFitWidth = a3;
    [(_UIGlintyStringView *)self setNeedsTextUpdate:1];
  }
}

- (void)setLegibilitySettings:(id)a3
{
  id v5 = a3;
  if (([v5 isEqual:self->_legibilitySettings] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    [(_UIGlintyStringView *)self setNeedsTextUpdate:1];
  }
}

- (void)setVibrantSettings:(id)a3
{
  id v5 = a3;
  if (([v5 isEqual:self->_vibrantSettings] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_vibrantSettings, a3);
    [(_UIGlintyStringView *)self setNeedsTextUpdate:1];
  }
}

- (void)setBackgroundView:(id)a3
{
  v4 = (UIView *)a3;
  backgroundView = self->_backgroundView;
  if (backgroundView != v4)
  {
    v9 = v4;
    id v6 = v4;
    id v7 = self->_backgroundView;
    self->_backgroundView = v6;
    id v8 = backgroundView;

    [(UIView *)v8 removeFromSuperview];
    [(_UIGlintyStringView *)self setNeedsTextUpdate:1];
    v4 = v9;
  }
}

- (void)setBackgroundColor:(id)a3
{
  id v5 = a3;
  if (([v5 _isSimilarToColor:self->_backgroundColor withinPercentage:0.01] & 1) == 0
    && ![(_UIGlintyStringView *)self hasCustomBackgroundColor])
  {
    objc_storeStrong((id *)&self->_backgroundColor, a3);
    [(_UIGlintyStringView *)self setNeedsTextUpdate:1];
  }
}

- (void)hideEffects
{
  id v2 = [(_UIGlintyStringView *)self effectView];
  [v2 setAlpha:0.0];
}

- (void)showEffects
{
  id v2 = [(_UIGlintyStringView *)self effectView];
  [v2 setAlpha:1.0];
}

- (void)hideBlur
{
}

- (void)showBlur
{
}

- (void)setBlurAlpha:(double)a3
{
  id v5 = +[UIDevice currentDevice];
  uint64_t v6 = [v5 _graphicsQuality];

  if ([(NSMutableSet *)self->_blurHiddenRequesters count]) {
    goto LABEL_5;
  }
  if (v6 == 10) {
    a3 = a3 * 0.2;
  }
  if (![(_UIGlintyStringView *)self showing]) {
LABEL_5:
  }
    a3 = 0.0;
  self->_blurAlpha = a3;
  id v7 = [(_UIGlintyStringView *)self blurView];
  [v7 setAlpha:a3];
}

- (void)setBlurHidden:(BOOL)a3 forRequester:(id)a4
{
  blurHiddenRequesters = self->_blurHiddenRequesters;
  if (a3) {
    [(NSMutableSet *)blurHiddenRequesters addObject:a4];
  }
  else {
    [(NSMutableSet *)blurHiddenRequesters removeObject:a4];
  }
  [(_UIGlintyStringView *)self updateBlurForHiddenRequesters];
}

- (void)updateBlurForHiddenRequesters
{
  if (![(_UIGlintyStringView *)self fading])
  {
    BOOL v3 = [(NSMutableSet *)self->_blurHiddenRequesters count] != 0;
    id v4 = [(_UIGlintyStringView *)self blurView];
    [v4 setHidden:v3];
  }
}

- (BOOL)isAnimating
{
  return self->_animating;
}

- (void)startAnimating
{
  if (!self->_animating)
  {
    [(_UIGlintyStringView *)self setAnimating:1];
    [(_UIGlintyStringView *)self addGlintyAnimations];
    [(_UIGlintyStringViewDelegate *)self->_delegate glintyAnimationDidStart];
    [(_UIGlintyStringView *)self show];
  }
}

- (void)stopAnimating
{
  if (self->_animating)
  {
    [(_UIGlintyStringView *)self setAnimating:0];
    [(_UIGlintyStringView *)self hide];
    [(_UIGlintyStringView *)self removeGlintyAnimations];
    delegate = self->_delegate;
    [(_UIGlintyStringViewDelegate *)delegate glintyAnimationDidStop];
  }
}

- (void)hide
{
  [(_UIGlintyStringView *)self hideEffects];
  [(_UIGlintyStringView *)self hideBlur];
  [(_UIGlintyStringView *)self setShowing:0];
  if (![(_UIGlintyStringView *)self fading])
  {
    [(_UIGlintyStringView *)self stopAnimating];
  }
}

- (void)show
{
  [(_UIGlintyStringView *)self startAnimating];
  [(_UIGlintyStringView *)self setShowing:1];
  [(_UIGlintyStringView *)self showEffects];
  [(_UIGlintyStringView *)self showBlur];
  [(_UIGlintyStringView *)self updateBlurForHiddenRequesters];
}

- (void)fadeOut
{
}

- (void)fadeOutWithDuration:(double)a3
{
  [(_UIGlintyStringView *)self setFading:1];
  v5[4] = self;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43___UIGlintyStringView_fadeOutWithDuration___block_invoke;
  v6[3] = &unk_1E52D9F70;
  v6[4] = self;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43___UIGlintyStringView_fadeOutWithDuration___block_invoke_2;
  v5[3] = &unk_1E52DC3A0;
  +[UIView animateWithDuration:0 delay:v6 options:v5 animations:a3 completion:0.0];
}

- (void)fadeIn
{
}

- (void)fadeInWithDuration:(double)a3
{
  [(_UIGlintyStringView *)self setFading:1];
  v5[4] = self;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42___UIGlintyStringView_fadeInWithDuration___block_invoke;
  v6[3] = &unk_1E52D9F70;
  v6[4] = self;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42___UIGlintyStringView_fadeInWithDuration___block_invoke_2;
  v5[3] = &unk_1E52DC3A0;
  +[UIView animateWithDuration:0 delay:v6 options:v5 animations:a3 completion:0.0];
}

- (void)setChevronStyle:(int64_t)a3
{
  if (self->_chevronStyle != a3)
  {
    self->_chevronStyle = a3;
    -[_UIGlintyStringView _chevronImageForStyle:](self, "_chevronImageForStyle:");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(_UIGlintyStringView *)self setChevron:v4];
  }
}

- (id)_chevronImageForStyle:(int64_t)a3
{
  if (a3)
  {
    if (a3 == 2) {
      BOOL v3 = @"UIGlintyStringViewBandChevron";
    }
    else {
      BOOL v3 = @"UIGlintyStringViewChevron";
    }
    id v4 = _UIImageWithName(v3);
    id v5 = [v4 imageFlippedForRightToLeftLayoutDirection];
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (void)setChevron:(id)a3
{
  id v5 = (UIImage *)a3;
  if (self->_chevron != v5)
  {
    uint64_t v6 = v5;
    objc_storeStrong((id *)&self->_chevron, a3);
    [(_UIGlintyStringView *)self setNeedsTextUpdate:1];
    id v5 = v6;
  }
}

- (void)setHighlight:(BOOL)a3
{
  if (self->_highlight != a3)
  {
    self->_highlight = a3;
    [(_UIGlintyStringView *)self setNeedsTextUpdate:1];
  }
}

- (double)_chevronPadding
{
  double result = 11.0;
  if (self->_chevronStyle == 2) {
    return 20.0;
  }
  return result;
}

- (void)setHorizontalPadding:(double)a3
{
  if (self->_horizontalPadding != a3)
  {
    self->_horizontalPadding = a3;
    [(_UIGlintyStringView *)self setNeedsTextUpdate:1];
  }
}

- (void)_updateLabelWithFrame:(CGRect)a3
{
  id v8 = -[UILabel initWithFrame:]([UILabel alloc], "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(UILabel *)v8 setTextAlignment:1];
  id v4 = +[UIColor clearColor];
  [(UIView *)v8 setBackgroundColor:v4];

  [(UILabel *)v8 setText:self->_text];
  id v5 = +[UIColor whiteColor];
  [(UILabel *)v8 setTextColor:v5];

  [(UILabel *)v8 setFont:self->_font];
  [(UILabel *)v8 setAdjustsFontSizeToFitWidth:self->_adjustsFontSizeToFitWidth];
  [(UILabel *)v8 setMinimumScaleFactor:0.6];
  if (self->_textLanguage)
  {
    uint64_t v6 = [(UILabel *)v8 _defaultAttributes];
    id v7 = (void *)[v6 mutableCopy];

    [v7 setObject:self->_textLanguage forKey:@"NSLanguage"];
    [(UILabel *)v8 _setDefaultAttributes:v7];
  }
  [(_UIGlintyStringView *)self setLabel:v8];
}

- (void)updateText
{
  [(UIView *)self bounds];
  -[_UIGlintyStringView updateTextWithBounds:](self, "updateTextWithBounds:");
}

- (void)updateTextWithBounds:(CGRect)a3
{
  double height = a3.size.height;
  CGFloat width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v210[1] = *MEMORY[0x1E4F143B8];
  id v8 = [(UIView *)self subviews];
  [v8 makeObjectsPerformSelector:sel_removeFromSuperview];

  v211.origin.double x = x;
  v211.origin.double y = y;
  v211.size.CGFloat width = width;
  v211.size.double height = height;
  if (!CGRectEqualToRect(v211, *MEMORY[0x1E4F1DB28]))
  {
    int v9 = *((_DWORD *)&self->super._viewFlags + 4);
    double horizontalPadding = self->_horizontalPadding;
    font = self->_font;
    uint64_t v209 = *(void *)off_1E52D2040;
    v210[0] = font;
    v192 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v210 forKeys:&v209 count:1];
    -[NSString sizeWithAttributes:](self->_text, "sizeWithAttributes:");
    double v13 = v12;
    double v197 = v14;
    [(_UIGlintyStringView *)self _chevronWidthWithPadding];
    if (v15 >= horizontalPadding) {
      double v16 = v15;
    }
    else {
      double v16 = horizontalPadding;
    }
    v212.origin.double x = x;
    v212.origin.double y = y;
    double rect = width;
    v212.size.CGFloat width = width;
    v212.size.double height = height;
    double v17 = CGRectGetWidth(v212) - horizontalPadding - horizontalPadding;
    if (v13 + v16 >= v17) {
      double v18 = v17;
    }
    else {
      double v18 = v13 + v16;
    }
    if (v18 < v13 + v16 && self->_chevronStyle == 2)
    {
      double horizontalPadding = self->_horizontalPadding * 0.5;
      [(_UIGlintyStringView *)self _chevronWidthWithPaddingCompression:0.5];
      if (v19 >= horizontalPadding) {
        double v16 = v19;
      }
      else {
        double v16 = horizontalPadding;
      }
      v213.origin.double x = x;
      v213.origin.double y = y;
      v213.size.CGFloat width = rect;
      v213.size.double height = height;
      double v20 = CGRectGetWidth(v213) - horizontalPadding - horizontalPadding;
      if (v13 + v16 >= v20) {
        double v18 = v20;
      }
      else {
        double v18 = v13 + v16;
      }
    }
    double v195 = v13;
    v214.origin.double x = x;
    v214.origin.double y = y;
    v214.size.CGFloat width = rect;
    v214.size.double height = height;
    double v21 = CGRectGetHeight(v214);
    [(_UIGlintyStringView *)self _chevronHeightWithMaxOffset];
    if (v22 < v197) {
      double v22 = v197;
    }
    if (v21 < v22) {
      double v22 = v21;
    }
    double v23 = UIRectCenteredIntegralRectScale(0.0, 0.0, ceil(v18), ceil(v22), x, y, rect, height, 0.0);
    double v27 = v24;
    CGFloat v183 = v25;
    double v28 = v23 - ceil(v16 * 0.35);
    if (v28 >= horizontalPadding) {
      double v29 = v28;
    }
    else {
      double v29 = horizontalPadding;
    }
    CGFloat v185 = v24;
    double v187 = y;
    CGFloat v180 = v26;
    double v30 = x;
    if ((v9 & 0x80000) != 0)
    {
      v215.origin.double x = x;
      v215.origin.double y = y;
      CGFloat v32 = v25;
      v215.size.CGFloat width = rect;
      CGFloat v33 = v26;
      v215.size.double height = height;
      CGFloat v34 = v27;
      double v29 = CGRectGetMaxX(v215) - v29 - v18;
      v216.origin.double x = v29;
      v216.origin.double y = v34;
      v216.size.CGFloat width = v32;
      v216.size.double height = v33;
      double v31 = CGRectGetMaxX(v216) - v16 - v195;
    }
    else
    {
      double v31 = v16 + v29;
    }
    double v35 = ceil(v18 - v16);
    double v36 = ceil(v197);
    double v189 = height;
    if (self->_chevronStyle == 2)
    {
      double v37 = v30;
      double v38 = v187;
      double v39 = UIRectCenteredIntegralRectScale(v31, 0.0, v35, v36, v30, v187, rect, height, 0.0);
      double v41 = v40;
      double v43 = v42;
      double v45 = v44;
      double v46 = self->_horizontalPadding;
      if (v39 - v16 >= v46) {
        double v29 = v39 - v16;
      }
      else {
        double v29 = self->_horizontalPadding;
      }
      double v47 = v16 + v46;
      if (v39 >= v47) {
        double v48 = v39;
      }
      else {
        double v48 = v47;
      }
    }
    else
    {
      double v37 = v30;
      double v38 = v187;
      double v48 = UIRectCenteredYInRectScale(v31, 0.0, v35, v36, v30, v187, rect, height, 0.0);
      double v41 = v49;
      double v43 = v50;
      double v45 = v51;
    }
    double v206 = 0.0;
    double v207 = 0.0;
    double v204 = 0.0;
    double v205 = 0.0;
    double v193 = v45;
    double v196 = v48;
    double v52 = v43;
    double v198 = v41;
    if (CTFontGetLanguageAwareOutsets())
    {
      double v53 = ceil(v206);
      double v54 = ceil(v207);
      double v196 = v48 - v54;
      double v198 = v41 - v53;
      double v52 = v43 - (-ceil(v205) - v54);
      double v193 = v45 - (-ceil(v204) - v53);
    }
    CGFloat v176 = v43;
    CGFloat v177 = v41;
    CGFloat v191 = v45;
    -[_UIGlintyStringView _updateLabelWithFrame:](self, "_updateLabelWithFrame:", v48, v41, v43, v45);
    [(UIImage *)self->_chevron size];
    double v56 = v55;
    double v58 = v57;
    if ((v9 & 0x80000) != 0)
    {
      v217.origin.double x = v29;
      v217.size.CGFloat width = v183;
      v217.origin.double y = v185;
      v217.size.double height = v180;
      double v29 = CGRectGetMaxX(v217) - v56;
    }
    CGFloat v59 = v52;
    p_chevronFrame = &self->_chevronFrame;
    self->_chevronFrame.origin.double x = v29;
    self->_chevronFrame.origin.double y = 0.0;
    self->_chevronFrame.size.CGFloat width = v56;
    self->_chevronFrame.size.double height = v58;
    self->_chevronFrame.origin.double x = UIRectCenteredYInRectScale(v29, 0.0, v56, v58, v37, v38, rect, v189, 0.0);
    self->_chevronFrame.origin.double y = v61;
    self->_chevronFrame.size.CGFloat width = v62;
    self->_chevronFrame.size.double height = v63;
    [(_UIGlintyStringView *)self _chevronVerticalOffset];
    self->_chevronFrame.origin.double y = v64 + self->_chevronFrame.origin.y;
    v65 = self->_font;
    if ([(_UIGlintyStringView *)self allowsLuminanceAdjustments])
    {
      v66 = [(_UIGlintyStringView *)self backgroundView];
      CGFloat v67 = v193;
      if (v66)
      {
        BOOL v68 = 0;
      }
      else
      {
        v69 = [(_UIGlintyStringView *)self backgroundColor];
        [v69 _luminance];
        BOOL v68 = v70 > 0.85;
      }
    }
    else
    {
      BOOL v68 = 0;
      CGFloat v67 = v193;
    }
    v71 = [(_UIGlintyStringView *)self vibrantSettings];
    v72 = [v71 referenceColor];

    [v72 _luminance];
    double v74 = v73;
    BOOL v75 = [(_UIGlintyStringView *)self allowsLuminanceAdjustments];
    v190 = v72;
    if (v72) {
      BOOL v76 = v75;
    }
    else {
      BOOL v76 = 0;
    }
    if (v74 >= 0.22) {
      BOOL v76 = 0;
    }
    BOOL recta = v76;
    v77 = [UIView alloc];
    [(UIView *)self bounds];
    v78 = -[UIView initWithFrame:](v77, "initWithFrame:");
    v79 = [(UIView *)v78 layer];
    [v79 setAllowsGroupOpacity:0];

    v80 = [(UIView *)v78 layer];
    [v80 setAllowsGroupBlending:0];

    [(UIView *)v78 setOpaque:0];
    uint64_t v81 = *MEMORY[0x1E4F3A250];
    v82 = [(UIView *)v78 layer];
    [v82 setCompositingFilter:v81];

    [(_UIGlintyStringView *)self setEffectView:v78];
    v83 = -[UIImageView initWithFrame:]([UIImageView alloc], "initWithFrame:", p_chevronFrame->origin.x, self->_chevronFrame.origin.y, self->_chevronFrame.size.width, self->_chevronFrame.size.height);
    v84 = [(_UIGlintyStringView *)self chevron];
    [(UIImageView *)v83 setImage:v84];

    v188 = v83;
    if (!v68)
    {
      v85 = +[UIDevice currentDevice];
      BOOL v86 = v68;
      uint64_t v87 = [v85 _graphicsQuality];

      BOOL v88 = v87 == 100;
      BOOL v68 = v86;
      if (v88)
      {
        text = self->_text;
        [(UIView *)self bounds];
        v90 = -[_UIGlintyStringView shapeViewForCharactersInString:withFont:centeredInFrame:](self, "shapeViewForCharactersInString:withFont:centeredInFrame:", text, v65);
        memset(&v203, 0, sizeof(v203));
        CGAffineTransformMakeScale(&v203, 1.0, -1.0);
        v91 = +[UIColor blackColor];
        [v90 setBackgroundColor:v91];

        CGAffineTransform v202 = v203;
        [v90 setTransform:&v202];
        v92 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A0D0]];
        [v92 setValue:&unk_1ED3F7548 forKey:@"inputRadius"];
        [v92 setValue:@"low" forKey:@"inputQuality"];
        [v92 setName:@"gaussianBlur"];
        v208 = v92;
        v93 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v208 count:1];
        v94 = [v90 layer];
        [v94 setFilters:v93];

        [(UIView *)v78 addSubview:v90];
        if (recta) {
          [v90 setAlpha:0.3];
        }

        BOOL v68 = v86;
      }
    }
    v194 = v65;
    v232.origin.double x = p_chevronFrame->origin.x;
    v232.origin.double y = self->_chevronFrame.origin.y;
    v232.size.CGFloat width = self->_chevronFrame.size.width;
    v232.size.double height = self->_chevronFrame.size.height;
    v218.origin.double x = v196;
    v218.origin.double y = v198;
    v218.size.CGFloat width = v52;
    v218.size.double height = v67;
    CGRect v219 = CGRectUnion(v218, v232);
    v95 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", v219.origin.x, v219.origin.y, v219.size.width, v219.size.height);
    v96 = [(UIView *)v95 layer];
    [v96 setAllowsGroupOpacity:0];

    v97 = [(UIView *)v95 layer];
    [v97 setAllowsGroupBlending:0];

    [(UIView *)v95 setOpaque:0];
    [(UIView *)v95 setClipsToBounds:1];
    [(UIView *)v78 addSubview:v95];
    BOOL v186 = v68;
    if (v68) {
      [(UIView *)v95 setAlpha:0.2];
    }
    [(UIView *)self bounds];
    v221.size.double height = CGRectGetHeight(v220);
    v221.size.CGFloat width = 640.0;
    v221.origin.double x = 0.0;
    v221.origin.double y = 0.0;
    CGRect v222 = CGRectInset(v221, -3.0, -3.0);
    double v98 = v222.origin.x;
    double v99 = v222.size.width;
    double v100 = v222.size.height;
    [(UIView *)self bounds];
    double v103 = round(v102 + (v101 - v100) * 0.5);
    uint64_t v104 = _UIImageWithName(@"UIGlintyStringViewShimmerMask");
    v105 = -[UIImageView initWithFrame:]([UIImageView alloc], "initWithFrame:", v98, v103, v99, v100);
    v106 = [(UIView *)v105 layer];
    [v106 setContentsScale:1.25];

    v107 = [(UIView *)v105 layer];
    objc_msgSend(v107, "setAnchorPoint:", 0.5, 0.47);

    v184 = (void *)v104;
    [(UIImageView *)v105 setImage:v104];
    v108 = [(UIView *)v105 layer];
    [v108 setAllowsGroupOpacity:0];

    v109 = [(UIView *)v105 layer];
    [v109 setAllowsGroupBlending:0];

    v110 = [(UIView *)v105 layer];
    [v110 setCompositingFilter:v81];

    [(UIView *)v105 setAlpha:0.9];
    [(UIView *)v95 addSubview:v105];
    v181 = v105;
    [(_UIGlintyStringView *)self setShimmerImageView:v105];
    v111 = -[_UIGlintyGradientView initWithFrame:]([_UIGlintyGradientView alloc], "initWithFrame:", v98, v103, v99, v100);
    v112 = [(UIView *)v111 layer];
    objc_msgSend(v112, "setAnchorPoint:", 0.5, 0.47);

    uint64_t v113 = *MEMORY[0x1E4F3A018];
    v114 = [(UIView *)v111 layer];
    [v114 setCompositingFilter:v113];

    [(UIView *)v111 setAlpha:0.35];
    v182 = v111;
    [(UIView *)v95 addSubview:v111];
    uint64_t v115 = _UIImageWithName(@"UIGlintyStringViewReflectionMask");
    v116 = -[UIImageView initWithFrame:]([UIImageView alloc], "initWithFrame:", v98, v103, v99, v100);
    v117 = [(UIView *)v116 layer];
    [v117 setContentsScale:1.25];

    v118 = [(UIView *)v116 layer];
    objc_msgSend(v118, "setAnchorPoint:", 0.5, 0.47);

    v179 = (void *)v115;
    [(UIImageView *)v116 setImage:v115];
    uint64_t v119 = *MEMORY[0x1E4F3A2A0];
    v120 = [(UIView *)v116 layer];
    uint64_t v178 = v119;
    [v120 setCompositingFilter:v119];

    [(UIView *)v116 setAlpha:0.75];
    [(UIView *)v95 addSubview:v116];
    [(_UIGlintyStringView *)self setReflectionImageView:v116];
    if ([(_UIGlintyStringView *)self animating]) {
      [(_UIGlintyStringView *)self addGlintyAnimations];
    }
    BOOL v121 = [(_UIGlintyStringView *)self usesBackgroundDimming];
    double v122 = 0.39;
    if (recta) {
      double v122 = 0.56;
    }
    if (v121) {
      double v123 = 0.25;
    }
    else {
      double v123 = v122;
    }
    v124 = [UIView alloc];
    [(UIView *)self bounds];
    v125 = -[UIView initWithFrame:](v124, "initWithFrame:");
    v126 = +[UIColor colorWithWhite:v123 alpha:1.0];
    [(UIView *)v125 setBackgroundColor:v126];

    uint64_t v127 = *MEMORY[0x1E4F3A2F8];
    v128 = [(UIView *)v125 layer];
    [v128 setCompositingFilter:v127];

    v129 = [(UIView *)v125 layer];
    [v129 setAllowsGroupOpacity:0];

    v130 = [(UIView *)v125 layer];
    [v130 setAllowsGroupBlending:0];

    rectb = v125;
    [(UIView *)v78 addSubview:v125];
    v131 = (uint64_t *)MEMORY[0x1E4F3A090];
    v132 = v188;
    if (self->_backgroundView)
    {
      v233.origin.double x = p_chevronFrame->origin.x;
      v233.origin.double y = self->_chevronFrame.origin.y;
      v233.size.CGFloat width = self->_chevronFrame.size.width;
      v233.size.double height = self->_chevronFrame.size.height;
      v223.origin.double x = v196;
      v223.origin.double y = v198;
      v223.size.CGFloat width = v59;
      v223.size.double height = v67;
      CGRect v224 = CGRectUnion(v223, v233);
      CGRect v225 = CGRectInset(v224, -77.0, -111.0);
      CGFloat v133 = v225.origin.x;
      CGFloat v134 = v225.origin.y;
      CGFloat v135 = v225.size.width;
      CGFloat v136 = v225.size.height;
      v137 = -[UIImageView initWithFrame:]([UIImageView alloc], "initWithFrame:", v225.origin.x, v225.origin.y, v225.size.width, v225.size.height);
      [(UIView *)self addSubview:v137];
      [(UIView *)v137 bounds];
      -[UIView setFrame:](self->_backgroundView, "setFrame:");
      [(UIView *)v137 addSubview:self->_backgroundView];
      v138 = [UIImageView alloc];
      v226.origin.double x = v133;
      v226.origin.double y = v134;
      v226.size.CGFloat width = v135;
      v226.size.double height = v136;
      double v139 = CGRectGetWidth(v226);
      v227.origin.double x = v133;
      v227.origin.double y = v134;
      v227.size.CGFloat width = v135;
      v227.size.double height = v136;
      v140 = -[UIImageView initWithFrame:](v138, "initWithFrame:", 0.0, 0.0, v139, CGRectGetHeight(v227));
      v141 = _UIImageWithName(@"UIGlintyStringViewBlurBlob");
      [(UIImageView *)v140 setImage:v141];

      [(UIView *)v137 addSubview:v140];
      uint64_t v142 = *MEMORY[0x1E4F3A090];
      [(UIView *)v140 layer];
      v144 = v143 = v78;
      [v144 setCompositingFilter:v142];

      v78 = v143;
      v132 = v188;
      [(_UIGlintyStringView *)self setBlurView:v137];
      [(_UIGlintyStringView *)self updateBlurForHiddenRequesters];
      [(_UIGlintyStringView *)self blurAlpha];
      double v146 = v145;
      v147 = [(_UIGlintyStringView *)self blurView];
      [v147 setAlpha:v146];

      v131 = (uint64_t *)MEMORY[0x1E4F3A090];
    }
    if (v186)
    {
      v148 = [UIView alloc];
      [(UIView *)self bounds];
      v149 = -[UIView initWithFrame:](v148, "initWithFrame:");
      v150 = +[UIColor colorWithWhite:0.2 alpha:0.3];
      [(UIView *)v149 setBackgroundColor:v150];

      v151 = [(UIView *)v149 layer];
      [v151 setCompositingFilter:v178];

      [(UIView *)v78 addSubview:v149];
    }
    [(UIView *)self bounds];
    if (v153 > 0.0 && v152 > 0.0)
    {
      [(UIView *)self bounds];
      CGFloat v155 = v154;
      CGFloat v157 = v156;
      v158 = +[UIScreen mainScreen];
      [v158 scale];
      _UIGraphicsBeginImageContextWithOptions(0, 0, v155, v157, v159);

      ContextStack = GetContextStack(0);
      v175 = v78;
      if (*(int *)ContextStack < 1) {
        v161 = 0;
      }
      else {
        v161 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
      }
      v162 = v131;
      CGContextSaveGState(v161);
      v228.origin.double x = v48;
      v228.origin.double y = v177;
      v228.size.CGFloat width = v176;
      v228.size.double height = v191;
      CGFloat MinX = CGRectGetMinX(v228);
      v229.origin.double x = v48;
      v229.origin.double y = v177;
      v229.size.CGFloat width = v176;
      v229.size.double height = v191;
      CGFloat MinY = CGRectGetMinY(v229);
      CGContextTranslateCTM(v161, MinX, MinY);
      v165 = [(_UIGlintyStringView *)self label];
      v166 = [v165 layer];
      [v166 renderInContext:v161];

      CGContextRestoreGState(v161);
      CGContextSaveGState(v161);
      v230.origin.double x = p_chevronFrame->origin.x;
      v230.origin.double y = self->_chevronFrame.origin.y;
      v230.size.CGFloat width = self->_chevronFrame.size.width;
      v230.size.double height = self->_chevronFrame.size.height;
      CGFloat v167 = CGRectGetMinX(v230);
      v231.origin.double x = p_chevronFrame->origin.x;
      v231.origin.double y = self->_chevronFrame.origin.y;
      v231.size.CGFloat width = self->_chevronFrame.size.width;
      v231.size.double height = self->_chevronFrame.size.height;
      CGFloat v168 = CGRectGetMinY(v231);
      CGContextTranslateCTM(v161, v167, v168);
      v169 = [(UIView *)v132 layer];
      [v169 renderInContext:v161];

      CGContextRestoreGState(v161);
      v170 = _UIGraphicsGetImageFromCurrentImageContext(0);
      UIGraphicsEndImageContext();
      v171 = [UIImageView alloc];
      [(UIView *)self bounds];
      v172 = -[UIImageView initWithFrame:](v171, "initWithFrame:");
      uint64_t v173 = *v162;
      v174 = [(UIView *)v172 layer];
      [v174 setCompositingFilter:v173];

      [(UIImageView *)v172 setImage:v170];
      v78 = v175;
      [(UIView *)v175 addSubview:v172];
    }
    [(UIView *)self addSubview:v78];
    [(_UIGlintyStringView *)self setNeedsTextUpdate:0];
    if (![(_UIGlintyStringView *)self showing]) {
      [(_UIGlintyStringView *)self hide];
    }
  }
}

- (void)removeGlintyAnimations
{
  BOOL v3 = [(_UIGlintyStringView *)self shimmerImageView];
  id v4 = [v3 layer];
  [v4 removeAllAnimations];

  id v6 = [(_UIGlintyStringView *)self reflectionImageView];
  id v5 = [v6 layer];
  [v5 removeAllAnimations];
}

- (void)addGlintyAnimations
{
  BOOL v3 = [(_UIGlintyStringView *)self shimmerImageView];
  id v4 = [v3 layer];
  [(_UIGlintyStringView *)self addShimmerAnimationToLayer:v4];

  id v6 = [(_UIGlintyStringView *)self reflectionImageView];
  id v5 = [v6 layer];
  [(_UIGlintyStringView *)self addReflectionAnimationToLayer:v5];
}

- (void)addShimmerAnimationToLayer:(id)a3
{
  v11[2] = *MEMORY[0x1E4F143B8];
  if ((*((_DWORD *)&self->super._viewFlags + 4) & 0x80000) != 0) {
    BOOL v3 = &unk_1ED3F1918;
  }
  else {
    BOOL v3 = &unk_1ED3F1900;
  }
  id v4 = (void *)MEMORY[0x1E4F39C10];
  uint64_t v5 = *MEMORY[0x1E4F3A4A0];
  id v6 = a3;
  id v7 = [v4 functionWithName:v5];
  id v8 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"position.x"];
  [v8 setDuration:2.0];
  [v8 setFillMode:*MEMORY[0x1E4F39FA0]];
  [v8 setRemovedOnCompletion:0];
  LODWORD(v9) = 2139095040;
  [v8 setRepeatCount:v9];
  [v8 setKeyTimes:&unk_1ED3F1930];
  [v8 setValues:v3];
  v11[0] = v7;
  v11[1] = v7;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  [v8 setTimingFunctions:v10];

  [v6 addAnimation:v8 forKey:@"shimmerAnimation"];
}

- (void)addReflectionAnimationToLayer:(id)a3
{
  v11[2] = *MEMORY[0x1E4F143B8];
  if ((*((_DWORD *)&self->super._viewFlags + 4) & 0x80000) != 0) {
    BOOL v3 = &unk_1ED3F1960;
  }
  else {
    BOOL v3 = &unk_1ED3F1948;
  }
  id v4 = (void *)MEMORY[0x1E4F39C10];
  uint64_t v5 = *MEMORY[0x1E4F3A4A0];
  id v6 = a3;
  id v7 = [v4 functionWithName:v5];
  id v8 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"position.x"];
  [v8 setDuration:2.0];
  [v8 setFillMode:*MEMORY[0x1E4F39FA0]];
  [v8 setRemovedOnCompletion:0];
  LODWORD(v9) = 2139095040;
  [v8 setRepeatCount:v9];
  [v8 setKeyTimes:&unk_1ED3F1978];
  [v8 setValues:v3];
  v11[0] = v7;
  v11[1] = v7;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  [v8 setTimingFunctions:v10];

  [v6 addAnimation:v8 forKey:@"reflectionAnimation"];
}

- (id)shapeViewForCharactersInString:(id)a3 withFont:(id)a4 centeredInFrame:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  v11 = (const __CTFont *)a4;
  uint64_t v12 = [v10 length];
  double v13 = MEMORY[0x1F4188790](v12);
  double v15 = (const UniChar *)((char *)&v48 - v14);
  uint64_t v16 = objc_msgSend(v10, "length", v13);
  double v17 = MEMORY[0x1F4188790](v16);
  double v19 = (CGGlyph *)((char *)&v48 - v18);
  uint64_t v20 = objc_msgSend(v10, "length", v17);
  double v21 = MEMORY[0x1F4188790](v20);
  double v23 = (CGSize *)(&v48 - 2 * v22);
  uint64_t v24 = objc_msgSend(v10, "length", v21);
  double v25 = MEMORY[0x1F4188790](v24);
  double v27 = (CGRect *)(&v48 - 4 * v26);
  objc_msgSend(v10, "getCharacters:range:", v15, 0, objc_msgSend(v10, "length", v25));
  CTFontGetGlyphsForCharacters(v11, v15, v19, [v10 length]);
  CFIndex v28 = objc_msgSend(v10, "length", CTFontGetAdvancesForGlyphs(v11, kCTFontOrientationDefault, v19, v23, objc_msgSend(v10, "length")));
  CTFontGetBoundingRectsForGlyphs(v11, kCTFontOrientationDefault, v19, v27, v28);
  Mutable = CGPathCreateMutable();
  if ([v10 length])
  {
    unint64_t v30 = 0;
    double v31 = 0.0;
    do
    {
      PathForGlyph = CTFontCreatePathForGlyph(v11, v19[v30], 0);
      memset(&m, 0, sizeof(m));
      CGAffineTransformMakeTranslation(&m, v31, 0.0);
      CGPathAddPath(Mutable, &m, PathForGlyph);
      CGPathRelease(PathForGlyph);
      double v33 = v23->width;
      ++v23;
      double v31 = v31 + v33;
      ++v30;
    }
    while (v30 < [v10 length]);
  }
  PathBoundingBodouble x = CGPathGetPathBoundingBox(Mutable);
  CGFloat v34 = PathBoundingBox.size.width;
  CGFloat v35 = PathBoundingBox.size.height;
  CGFloat v36 = round(x + (width - PathBoundingBox.size.width) * 0.5);
  CGFloat v37 = round(y + (height - PathBoundingBox.size.height) * 0.5);
  memset(&m, 0, sizeof(m));
  PathBoundingBox.origin.double x = v36;
  PathBoundingBox.origin.double y = v37;
  CGFloat MinX = CGRectGetMinX(PathBoundingBox);
  double v49 = height;
  CGFloat v39 = MinX;
  v54.origin.double x = v36;
  v54.origin.double y = v37;
  v54.size.double width = v34;
  v54.size.double height = v35;
  CGFloat MinY = CGRectGetMinY(v54);
  CGAffineTransformMakeTranslation(&m, v39, MinY);
  double v41 = CGPathCreateMutableCopyByTransformingPath(Mutable, &m);
  double v42 = +[UIBezierPath bezierPathWithCGPath:v41];
  CGPathRelease(Mutable);
  CGPathRelease(v41);
  double v43 = [_UIGlintyShapeView alloc];
  double v44 = -[_UIGlintyShapeView initWithFrame:](v43, "initWithFrame:", x, y, width, v49);
  [(_UIGlintyShapeView *)v44 setPath:v42];
  [(_UIGlintyShapeView *)v44 setFillColor:0];
  double v45 = +[UIColor whiteColor];
  [(_UIGlintyShapeView *)v44 setStrokeColor:v45];

  double v46 = [(_UIGlintyShapeView *)v44 shapeLayer];
  [v46 setLineWidth:1.5];
  [v46 setMiterLimit:5.0];
  [v46 setLineCap:@"round"];
  [v46 setLineJoin:@"round"];
  [v46 setLineDashPattern:&unk_1ED3F1990];
  [v46 setShouldRasterize:1];

  return v44;
}

- (id)_highlightCompositingFilter
{
  if ([(_UIVibrantSettings *)self->_vibrantSettings style] == 1) {
    id v2 = (id)*MEMORY[0x1E4F3A018];
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (id)_highlightColor
{
  return [(_UIVibrantSettings *)self->_vibrantSettings highlightColor];
}

- (void)_updateHighlight
{
  [(UIView *)self->_label frame];
  highlightView = self->_highlightView;
  if (self->_highlight)
  {
    if (!highlightView)
    {
      id v8 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", v3, v4, v5, v6);
      [(_UIGlintyStringView *)self setHighlightView:v8];

      double v9 = self->_highlightView;
      id v10 = [(_UIGlintyStringView *)self _highlightColor];
      [(UIView *)v9 setBackgroundColor:v10];

      v11 = [(UIView *)self->_highlightView layer];
      [v11 setAllowsGroupBlending:0];

      uint64_t v12 = [(UIView *)self->_highlightView layer];
      double v13 = [(_UIGlintyStringView *)self _highlightCompositingFilter];
      [v12 setCompositingFilter:v13];

      uint64_t v14 = self->_highlightView;
      [(UIView *)self addSubview:v14];
    }
  }
  else
  {
    [(UIView *)highlightView removeFromSuperview];
    [(_UIGlintyStringView *)self setHighlightView:0];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if ([(_UIGlintyStringView *)self needsTextUpdate])
  {
    -[_UIGlintyStringView updateTextWithBounds:](self, "updateTextWithBounds:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), width, height);
    [(_UIGlintyStringView *)self setNeedsTextUpdate:1];
  }
  [(_UIGlintyStringView *)self _chevronWidthWithPadding];
  double v7 = v6;
  -[_UIGlintyStringView _labelSizeThatFits:](self, "_labelSizeThatFits:", width - v6, height);
  double v9 = v8;
  double v11 = v7 + v10;
  [(_UIGlintyStringView *)self _chevronHeightWithMaxOffset];
  if (v12 >= v9) {
    double v13 = v12;
  }
  else {
    double v13 = v9;
  }
  double v14 = ceil(v11);
  double v15 = ceil(v13);
  result.double height = v15;
  result.double width = v14;
  return result;
}

- (CGSize)_labelSizeThatFits:(CGSize)a3
{
  -[UILabel sizeThatFits:](self->_label, "sizeThatFits:", a3.width, a3.height);
  double v5 = v4;
  double v7 = v6;
  double v8 = [(UILabel *)self->_label font];
  if (CTFontGetLanguageAwareOutsets())
  {
    double v5 = v5 - (-ceil(0.0) - ceil(0.0));
    double v7 = v7 - (-ceil(0.0) - ceil(0.0));
  }

  double v9 = v5;
  double v10 = v7;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (double)_chevronWidthWithPadding
{
  chevron = self->_chevron;
  if (!chevron) {
    return 0.0;
  }
  [(UIImage *)chevron size];
  double v5 = v4;
  [(_UIGlintyStringView *)self _chevronPadding];
  return v5 + v6;
}

- (double)_chevronWidthWithPaddingCompression:(double)a3
{
  chevron = self->_chevron;
  if (!chevron) {
    return 0.0;
  }
  [(UIImage *)chevron size];
  double v7 = v6;
  [(_UIGlintyStringView *)self _chevronPadding];
  return v7 + v8 * a3;
}

- (double)_chevronHeightWithMaxOffset
{
  chevron = self->_chevron;
  if (!chevron) {
    return 0.0;
  }
  [(UIImage *)chevron size];
  return v3 + 3.5;
}

- (double)_chevronVerticalOffset
{
  [(UIFont *)self->_font xHeight];
  double v4 = v3;
  [(UILabel *)self->_label _actualScaleFactor];
  double v6 = v4 + v4 * v5 * -0.95;
  double v7 = +[UIScreen mainScreen];
  [v7 scale];
  double v9 = v8;

  return floor(v6 * v9) / v9;
}

- (CGRect)labelFrame
{
  [(UIView *)self->_label frame];
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (CGRect)chevronFrame
{
  double x = self->_chevronFrame.origin.x;
  double y = self->_chevronFrame.origin.y;
  double width = self->_chevronFrame.size.width;
  double height = self->_chevronFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (double)baselineOffsetFromBottom
{
  [(UIView *)self bounds];
  -[_UIGlintyStringView baselineOffsetFromBottomWithSize:](self, "baselineOffsetFromBottomWithSize:", v3, v4);
  return result;
}

- (double)baselineOffsetFromBottomWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if ([(_UIGlintyStringView *)self needsTextUpdate])
  {
    -[_UIGlintyStringView updateTextWithBounds:](self, "updateTextWithBounds:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), width, height);
    [(_UIGlintyStringView *)self setNeedsTextUpdate:1];
  }
  [(UIView *)self->_label frame];
  double v8 = height - v6 - v7;
  [(UILabel *)self->_label _baselineOffsetFromBottom];
  return v9 + v8;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)_UIGlintyStringView;
  [(UIView *)&v4 layoutSubviews];
  [(UIView *)self bounds];
  -[UIView setFrame:](self->_backgroundView, "setFrame:");
  if ([(_UIGlintyStringView *)self showing])
  {
    [(_UIGlintyStringView *)self updateText];
  }
  else
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __37___UIGlintyStringView_layoutSubviews__block_invoke;
    v3[3] = &unk_1E52D9F70;
    v3[4] = self;
    +[UIView performWithoutAnimation:v3];
  }
}

- (void)didMoveToWindow
{
  if ([(_UIGlintyStringView *)self isAnimating])
  {
    double v3 = [(UIView *)self window];

    if (!v3)
    {
      [(_UIGlintyStringView *)self stopAnimating];
    }
  }
}

- (_UIGlintyStringViewDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (_UIGlintyStringViewDelegate *)a3;
}

- (NSString)text
{
  return self->_text;
}

- (UIFont)font
{
  return self->_font;
}

- (NSString)textLanguage
{
  return self->_textLanguage;
}

- (void)setChevronFrame:(CGRect)a3
{
  self->_chevronFrame = a3;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (_UIVibrantSettings)vibrantSettings
{
  return self->_vibrantSettings;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (UIColor)chevronBackgroundColor
{
  return self->_chevronBackgroundColor;
}

- (void)setChevronBackgroundColor:(id)a3
{
}

- (BOOL)animationRepeats
{
  return self->_animationRepeats;
}

- (void)setAnimationRepeats:(BOOL)a3
{
  self->_animationRepeats = a3;
}

- (BOOL)adjustsFontSizeToFitWidth
{
  return self->_adjustsFontSizeToFitWidth;
}

- (BOOL)hasCustomBackgroundColor
{
  return self->_hasCustomBackgroundColor;
}

- (void)setHasCustomBackgroundColor:(BOOL)a3
{
  self->_hasCustomBackgroundColor = a3;
}

- (int64_t)chevronStyle
{
  return self->_chevronStyle;
}

- (double)horizontalPadding
{
  return self->_horizontalPadding;
}

- (BOOL)highlight
{
  return self->_highlight;
}

- (BOOL)allowsLuminanceAdjustments
{
  return self->_allowsLuminanceAdjustments;
}

- (void)setAllowsLuminanceAdjustments:(BOOL)a3
{
  self->_allowsLuminanceAdjustments = a3;
}

- (BOOL)usesBackgroundDimming
{
  return self->_usesBackgroundDimming;
}

- (void)setUsesBackgroundDimming:(BOOL)a3
{
  self->_usesBackgroundDimming = a3;
}

- (BOOL)needsTextUpdate
{
  return self->_needsTextUpdate;
}

- (void)setNeedsTextUpdate:(BOOL)a3
{
  self->_needsTextUpdate = a3;
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (CGSize)labelSize
{
  double width = self->_labelSize.width;
  double height = self->_labelSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setLabelSize:(CGSize)a3
{
  self->_labelSize = a3;
}

- (UIView)spotlightView
{
  return self->_spotlightView;
}

- (void)setSpotlightView:(id)a3
{
}

- (int)textIndex
{
  return self->_textIndex;
}

- (void)setTextIndex:(int)a3
{
  self->_textIndedouble x = a3;
}

- (UIImage)chevron
{
  return self->_chevron;
}

- (UIView)highlightView
{
  return self->_highlightView;
}

- (void)setHighlightView:(id)a3
{
}

- (BOOL)animating
{
  return self->_animating;
}

- (void)setAnimating:(BOOL)a3
{
  self->_animating = a3;
}

- (BOOL)fading
{
  return self->_fading;
}

- (void)setFading:(BOOL)a3
{
  self->_fading = a3;
}

- (BOOL)showing
{
  return self->_showing;
}

- (void)setShowing:(BOOL)a3
{
  self->_showing = a3;
}

- (UIView)effectView
{
  return self->_effectView;
}

- (void)setEffectView:(id)a3
{
}

- (UIView)blurView
{
  return self->_blurView;
}

- (void)setBlurView:(id)a3
{
}

- (UIView)shimmerImageView
{
  return self->_shimmerImageView;
}

- (void)setShimmerImageView:(id)a3
{
}

- (UIView)reflectionImageView
{
  return self->_reflectionImageView;
}

- (void)setReflectionImageView:(id)a3
{
}

- (double)blurAlpha
{
  return self->_blurAlpha;
}

- (NSMutableSet)blurHiddenRequesters
{
  return self->_blurHiddenRequesters;
}

- (void)setBlurHiddenRequesters:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blurHiddenRequesters, 0);
  objc_storeStrong((id *)&self->_reflectionImageView, 0);
  objc_storeStrong((id *)&self->_shimmerImageView, 0);
  objc_storeStrong((id *)&self->_blurView, 0);
  objc_storeStrong((id *)&self->_effectView, 0);
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_storeStrong((id *)&self->_chevron, 0);
  objc_storeStrong((id *)&self->_spotlightView, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_chevronBackgroundColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_vibrantSettings, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_textLanguage, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end