@interface SFNavigationBarToggleButton
+ (CGSize)glyphSize;
+ (UIImage)extensionsImage;
+ (UIImage)siriReaderPlayingImage;
+ (UIImage)translationImage;
+ (id)pageMenuImageWithIntelligence:(BOOL)a3;
+ (id)pageMenuImageWithIntelligence:(BOOL)a3 usingMulticolorSymbol:(BOOL)a4;
+ (id)readerImageWithSummary:(BOOL)a3;
+ (id)readerImageWithSummary:(BOOL)a3 usingMulticolorSymbol:(BOOL)a4;
- (BOOL)drawsLightGlyph;
- (BOOL)highlightsBackground;
- (BOOL)showsBadge;
- (BOOL)usesInsetFromBackground;
- (CGSize)intrinsicContentSize;
- (SFNavigationBarToggleButton)initWithImage:(id)a3 forInputMode:(unint64_t)a4;
- (UIColor)glyphTintColor;
- (UIColor)secondaryImageColor;
- (UIColor)tertiaryImageColor;
- (UIImage)image;
- (UIImage)secondaryImage;
- (UIImage)tertiaryImage;
- (UIImageSymbolConfiguration)preferredSymbolConfiguration;
- (UIPointerInteraction)pointerInteraction;
- (UIView)accessoryView;
- (UIView)pointerPreviewContainer;
- (UIView)tiplessPopoverSourceView;
- (char)_resolvedSecondaryView;
- (char)_resolvedTertiaryView;
- (double)insetFromBackground;
- (double)minimumSideMargin;
- (double)resizableBackgroundCornerRadius;
- (id)_createAccessoryImageView;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (int64_t)cornerRoundingMode;
- (void)_updateDefaultStateImageView;
- (void)_updateSelectedStateView;
- (void)layoutSubviews;
- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5;
- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5;
- (void)setAccessoryView:(id)a3;
- (void)setCornerRoundingMode:(int64_t)a3;
- (void)setDrawsLightGlyph:(BOOL)a3;
- (void)setGlyphTintColor:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setHighlightsBackground:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setInsetFromBackground:(double)a3;
- (void)setMinimumSideMargin:(double)a3;
- (void)setPointerPreviewContainer:(id)a3;
- (void)setPreferredSymbolConfiguration:(id)a3;
- (void)setResizableBackgroundCornerRadius:(double)a3;
- (void)setSecondaryImage:(id)a3;
- (void)setSecondaryImageColor:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setShowsBadge:(BOOL)a3;
- (void)setTertiaryImage:(id)a3;
- (void)setTertiaryImageColor:(id)a3;
- (void)setUsesInsetFromBackground:(BOOL)a3;
- (void)tintColorDidChange;
@end

@implementation SFNavigationBarToggleButton

- (void)setPointerPreviewContainer:(id)a3
{
}

- (void)setResizableBackgroundCornerRadius:(double)a3
{
  if (self->_resizableBackgroundCornerRadius != a3)
  {
    self->_resizableBackgroundCornerRadius = a3;
    [(SFNavigationBarToggleButton *)self setNeedsLayout];
  }
}

- (void)setMinimumSideMargin:(double)a3
{
  if (self->_minimumSideMargin != a3)
  {
    self->_minimumSideMargin = a3;
    [(SFNavigationBarToggleButton *)self invalidateIntrinsicContentSize];
  }
}

- (id)_createAccessoryImageView
{
  if (a1)
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4FB1838]);
    [v2 setUserInteractionEnabled:0];
    [v2 setContentMode:4];
    v3 = [MEMORY[0x1E4FB1830] configurationWithTextStyle:*MEMORY[0x1E4FB28C8] scale:1];
    [v2 setPreferredSymbolConfiguration:v3];

    [a1 addSubview:v2];
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

+ (id)pageMenuImageWithIntelligence:(BOOL)a3 usingMulticolorSymbol:(BOOL)a4
{
  v13[2] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    BOOL v4 = a4;
    v5 = [MEMORY[0x1E4FB1818] _systemImageNamed:@"apple.page.menu.badge.sparkles"];
    if (v4)
    {
      v6 = (void *)MEMORY[0x1E4FB1830];
      v7 = badgeTintColor();
      v13[0] = v7;
      v8 = [MEMORY[0x1E4FB1618] tintColor];
      v13[1] = v8;
      v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
      v10 = [v6 configurationWithPaletteColors:v9];
      uint64_t v11 = [v5 imageWithSymbolConfiguration:v10];

      v5 = (void *)v11;
    }
  }
  else
  {
    v5 = objc_msgSend(MEMORY[0x1E4FB1818], "_systemImageNamed:", @"apple.page.menu", a4);
  }

  return v5;
}

+ (id)pageMenuImageWithIntelligence:(BOOL)a3
{
  return (id)[a1 pageMenuImageWithIntelligence:a3 usingMulticolorSymbol:1];
}

- (UIPointerInteraction)pointerInteraction
{
  return self->_pointerInteraction;
}

- (SFNavigationBarToggleButton)initWithImage:(id)a3 forInputMode:(unint64_t)a4
{
  id v7 = a3;
  v42.receiver = self;
  v42.super_class = (Class)SFNavigationBarToggleButton;
  v8 = -[SFNavigationBarToggleButton initWithFrame:](&v42, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_image, a3);
    v9->_inputMode = a4;
    v9->_int64_t cornerRoundingMode = a4 != 1;
    v9->_insetFromBackground = _SFOnePixel();
    v10 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    tiplessPopoverSourceView = v9->_tiplessPopoverSourceView;
    v9->_tiplessPopoverSourceView = v10;

    [(UIView *)v9->_tiplessPopoverSourceView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v9->_tiplessPopoverSourceView setUserInteractionEnabled:0];
    [(SFNavigationBarToggleButton *)v9 addSubview:v9->_tiplessPopoverSourceView];
    v12 = objc_alloc_init(SFToggleBackgroundView);
    selectedStateMaskView = v9->_selectedStateMaskView;
    v9->_selectedStateMaskView = v12;

    v14 = v9->_selectedStateMaskView;
    if (v14)
    {
      int64_t cornerRoundingMode = v9->_cornerRoundingMode;
      if (v14->_cornerRoundingMode != cornerRoundingMode)
      {
        v14->_int64_t cornerRoundingMode = cornerRoundingMode;
        [(SFToggleBackgroundView *)v14 setNeedsLayout];
        v14 = v9->_selectedStateMaskView;
      }
    }
    [(SFNavigationBarToggleButton *)v9 setMaskView:v14];
    uint64_t v16 = [objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v7];
    selectedStateImageView = v9->_selectedStateImageView;
    v9->_selectedStateImageView = (UIImageView *)v16;

    v18 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A098]];
    v19 = [(UIImageView *)v9->_selectedStateImageView layer];
    [v19 setCompositingFilter:v18];

    id v20 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    [(SFNavigationBarToggleButton *)v9 bounds];
    uint64_t v21 = objc_msgSend(v20, "initWithFrame:");
    selectedStateFillView = v9->_selectedStateFillView;
    v9->_selectedStateFillView = (UIView *)v21;

    [(UIView *)v9->_selectedStateFillView setAutoresizingMask:18];
    [(UIView *)v9->_selectedStateFillView setUserInteractionEnabled:0];
    [(UIView *)v9->_selectedStateFillView setAlpha:0.0];
    [(UIView *)v9->_selectedStateFillView addSubview:v9->_selectedStateImageView];
    [(SFNavigationBarToggleButton *)v9 addSubview:v9->_selectedStateFillView];
    uint64_t v23 = [objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v7];
    defaultStateImageView = v9->_defaultStateImageView;
    v9->_defaultStateImageView = (UIImageView *)v23;

    [(UIImageView *)v9->_defaultStateImageView setUserInteractionEnabled:0];
    [(SFNavigationBarToggleButton *)v9 addSubview:v9->_defaultStateImageView];
    uint64_t v25 = -[SFNavigationBarToggleButton _createAccessoryImageView](v9);
    secondaryImageView = v9->_secondaryImageView;
    v9->_secondaryImageView = (UIImageView *)v25;

    uint64_t v27 = -[SFNavigationBarToggleButton _createAccessoryImageView](v9);
    tertiaryImageView = v9->_tertiaryImageView;
    v9->_tertiaryImageView = (UIImageView *)v27;

    v29 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    badgeView = v9->_badgeView;
    v9->_badgeView = v29;

    [(UIView *)v9->_badgeView setHidden:1];
    v31 = [MEMORY[0x1E4FB1618] systemBlueColor];
    [(UIView *)v9->_badgeView setBackgroundColor:v31];

    [(UIView *)v9->_badgeView _setContinuousCornerRadius:2.5];
    [(UIView *)v9->_badgeView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(SFNavigationBarToggleButton *)v9 addSubview:v9->_badgeView];
    v32 = [MEMORY[0x1E4FB1618] labelColor];
    [(SFNavigationBarToggleButton *)v9 setGlyphTintColor:v32];

    uint64_t v33 = [objc_alloc(MEMORY[0x1E4FB1AC8]) initWithDelegate:v9];
    pointerInteraction = v9->_pointerInteraction;
    v9->_pointerInteraction = (UIPointerInteraction *)v33;

    [(SFNavigationBarToggleButton *)v9 addInteraction:v9->_pointerInteraction];
    objc_initWeak(&location, v9);
    v35 = [MEMORY[0x1E4FB1E20] systemTraitsAffectingColorAppearance];
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __58__SFNavigationBarToggleButton_initWithImage_forInputMode___block_invoke;
    v39[3] = &unk_1E54EB540;
    objc_copyWeak(&v40, &location);
    id v36 = (id)[(SFNavigationBarToggleButton *)v9 registerForTraitChanges:v35 withHandler:v39];

    v37 = v9;
    objc_destroyWeak(&v40);
    objc_destroyWeak(&location);
  }

  return v9;
}

- (void)setGlyphTintColor:(id)a3
{
  id v5 = a3;
  if (([v5 isEqual:self->_glyphTintColor] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_glyphTintColor, a3);
    -[SFNavigationBarToggleButton _updateDefaultStateImageView]((uint64_t)self);
    -[SFNavigationBarToggleButton _updateSelectedStateView]((uint64_t)self);
  }
}

- (void)_updateDefaultStateImageView
{
  if (!a1) {
    return;
  }
  if ([(id)a1 tintAdjustmentMode] == 2)
  {
    id v2 = [(id)a1 tintColor];
  }
  else
  {
    v3 = *(void **)(a1 + 880);
    if (v3)
    {
      id v2 = v3;
    }
    else
    {
      id v2 = [MEMORY[0x1E4FB1618] blackColor];
    }
  }
  id v8 = v2;
  [*(id *)(a1 + 760) setTintColor:v2];
  [*(id *)(a1 + 768) setTintColor:v8];
  if ([(id)a1 isHighlighted])
  {
    int v4 = *(unsigned __int8 *)(a1 + 835);
    char v5 = [(id)a1 isSelected];
    char v6 = v5;
    if (v4)
    {
      if ((v5 & 1) == 0) {
        goto LABEL_17;
      }
      goto LABEL_12;
    }
    if ([(id)a1 isSelected])
    {
      [*(id *)(a1 + 760) setAlpha:0.0];
      double v7 = 1.0;
      if (v6) {
        goto LABEL_18;
      }
LABEL_22:
      double v7 = 0.2;
      goto LABEL_18;
    }
    if ((v6 & 1) == 0)
    {
      [*(id *)(a1 + 760) setAlpha:0.2];
      goto LABEL_22;
    }
LABEL_17:
    double v7 = 1.0;
    [*(id *)(a1 + 760) setAlpha:1.0];
    goto LABEL_18;
  }
  if (([(id)a1 isSelected] & 1) == 0) {
    goto LABEL_17;
  }
LABEL_12:
  [*(id *)(a1 + 760) setAlpha:0.0];
  double v7 = 1.0;
LABEL_18:
  [*(id *)(a1 + 776) setAlpha:v7];
  [*(id *)(a1 + 784) setAlpha:v7];
  [*(id *)(a1 + 792) setAlpha:v7];
  [*(id *)(a1 + 816) setAlpha:v7];
}

- (void)_updateSelectedStateView
{
  if (a1)
  {
    id v2 = *(void **)(a1 + 880);
    if (v2)
    {
      id v3 = v2;
    }
    else
    {
      id v3 = [MEMORY[0x1E4FB1618] blackColor];
    }
    id v16 = v3;
    [*(id *)(a1 + 808) setBackgroundColor:v3];
    if ([(id)a1 isSelected]) {
      BOOL v4 = *(unsigned char *)(a1 + 752) != 0;
    }
    else {
      BOOL v4 = 0;
    }
    if (objc_msgSend(v16, "sf_isDarkColor")) {
      [MEMORY[0x1E4FB1618] whiteColor];
    }
    else {
    char v5 = [MEMORY[0x1E4FB1618] blackColor];
    }
    char v6 = [v5 colorWithAlphaComponent:(double)v4];
    [(id)a1 setBackgroundColor:v6];

    if (v4) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = *(void *)(a1 + 864);
    }
    id v8 = *(void **)(a1 + 800);
    if (v8 && v8[53] != v7)
    {
      v8[53] = v7;
      [v8 setNeedsLayout];
    }
    if ([(id)a1 isHighlighted])
    {
      if (*(unsigned char *)(a1 + 835)) {
        int v9 = 1;
      }
      else {
        int v9 = [(id)a1 isSelected];
      }
    }
    else
    {
      int v9 = 0;
    }
    int v10 = [(id)a1 isSelected];
    double v11 = 0.2;
    if (!v9) {
      double v11 = 0.0;
    }
    double v12 = 0.8;
    if (!v9) {
      double v12 = 1.0;
    }
    if (v10) {
      double v11 = v12;
    }
    [*(id *)(a1 + 808) setAlpha:v11];
    if ([(id)a1 isSelected])
    {
      v13 = [(id)a1 traitCollection];
      uint64_t v14 = [v13 userInterfaceStyle];

      if (v14 == 1) {
        uint64_t v15 = 2;
      }
      else {
        uint64_t v15 = 1;
      }
    }
    else
    {
      uint64_t v15 = 0;
    }
    [*(id *)(a1 + 776) setOverrideUserInterfaceStyle:v15];
    [*(id *)(a1 + 784) setOverrideUserInterfaceStyle:v15];
  }
}

- (void)setPreferredSymbolConfiguration:(id)a3
{
  char v5 = (UIImageSymbolConfiguration *)a3;
  preferredSymbolConfiguration = self->_preferredSymbolConfiguration;
  if (preferredSymbolConfiguration != v5)
  {
    id v8 = v5;
    BOOL v7 = [(UIImageSymbolConfiguration *)preferredSymbolConfiguration isEqualToConfiguration:v5];
    char v5 = v8;
    if (!v7)
    {
      objc_storeStrong((id *)&self->_preferredSymbolConfiguration, a3);
      [(UIImageView *)self->_defaultStateImageView setPreferredSymbolConfiguration:v8];
      [(UIImageView *)self->_selectedStateImageView setPreferredSymbolConfiguration:v8];
      char v5 = v8;
    }
  }
}

+ (CGSize)glyphSize
{
  double v2 = 40.0;
  double v3 = 36.0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (id)readerImageWithSummary:(BOOL)a3
{
  return (id)[a1 readerImageWithSummary:a3 usingMulticolorSymbol:1];
}

+ (id)readerImageWithSummary:(BOOL)a3 usingMulticolorSymbol:(BOOL)a4
{
  v13[2] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    BOOL v4 = a4;
    char v5 = [MEMORY[0x1E4FB1818] _systemImageNamed:@"text.page.badge.sparkles"];
    if (v4)
    {
      char v6 = (void *)MEMORY[0x1E4FB1830];
      BOOL v7 = badgeTintColor();
      v13[0] = v7;
      id v8 = [MEMORY[0x1E4FB1618] tintColor];
      v13[1] = v8;
      int v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
      int v10 = [v6 configurationWithPaletteColors:v9];
      uint64_t v11 = [v5 imageWithSymbolConfiguration:v10];

      char v5 = (void *)v11;
    }
  }
  else
  {
    char v5 = objc_msgSend(MEMORY[0x1E4FB1818], "systemImageNamed:", @"text.page", a4);
  }

  return v5;
}

+ (UIImage)translationImage
{
  return (UIImage *)[MEMORY[0x1E4FB1818] _systemImageNamed:@"translate"];
}

+ (UIImage)extensionsImage
{
  return (UIImage *)[MEMORY[0x1E4FB1818] _systemImageNamed:@"puzzlepiece.extension.fill"];
}

+ (UIImage)siriReaderPlayingImage
{
  return (UIImage *)[MEMORY[0x1E4FB1818] _systemImageNamed:@"speaker.wave.2.bubble.left"];
}

void __58__SFNavigationBarToggleButton_initWithImage_forInputMode___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[SFNavigationBarToggleButton _updateSelectedStateView]((uint64_t)WeakRetained);
}

- (void)setImage:(id)a3
{
  id v5 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_image, a3);
    [(UIImageView *)self->_selectedStateImageView setImage:v5];
    [(UIImageView *)self->_defaultStateImageView setImage:v5];
    [(SFNavigationBarToggleButton *)self setNeedsLayout];
  }
}

- (UIImage)secondaryImage
{
  return [(UIImageView *)self->_secondaryImageView image];
}

- (void)setSecondaryImage:(id)a3
{
  id v6 = a3;
  BOOL v4 = [(SFNavigationBarToggleButton *)self secondaryImage];
  char v5 = WBSIsEqual();

  if ((v5 & 1) == 0)
  {
    [(UIImageView *)self->_secondaryImageView setImage:v6];
    [(SFNavigationBarToggleButton *)self setNeedsLayout];
  }
}

- (UIImage)tertiaryImage
{
  return [(UIImageView *)self->_tertiaryImageView image];
}

- (void)setTertiaryImage:(id)a3
{
  id v6 = a3;
  BOOL v4 = [(SFNavigationBarToggleButton *)self tertiaryImage];
  char v5 = WBSIsEqual();

  if ((v5 & 1) == 0)
  {
    [(UIImageView *)self->_tertiaryImageView setImage:v6];
    [(SFNavigationBarToggleButton *)self setNeedsLayout];
  }
}

- (UIColor)secondaryImageColor
{
  return [(UIImageView *)self->_secondaryImageView tintColor];
}

- (void)setSecondaryImageColor:(id)a3
{
  id v6 = a3;
  BOOL v4 = [(SFNavigationBarToggleButton *)self secondaryImageColor];
  char v5 = WBSIsEqual();

  if ((v5 & 1) == 0) {
    [(UIImageView *)self->_secondaryImageView setTintColor:v6];
  }
}

- (UIColor)tertiaryImageColor
{
  return [(UIImageView *)self->_tertiaryImageView tintColor];
}

- (void)setTertiaryImageColor:(id)a3
{
  id v6 = a3;
  BOOL v4 = [(SFNavigationBarToggleButton *)self tertiaryImageColor];
  char v5 = WBSIsEqual();

  if ((v5 & 1) == 0) {
    [(UIImageView *)self->_tertiaryImageView setTintColor:v6];
  }
}

- (void)setAccessoryView:(id)a3
{
  char v5 = (UIView *)a3;
  accessoryView = self->_accessoryView;
  if (accessoryView != v5)
  {
    BOOL v7 = v5;
    if (v5) {
      [(SFNavigationBarToggleButton *)self addSubview:v5];
    }
    else {
      [(UIView *)accessoryView removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_accessoryView, a3);
    [(SFNavigationBarToggleButton *)self setNeedsLayout];
    char v5 = v7;
  }
}

- (void)setShowsBadge:(BOOL)a3
{
  if (self->_showsBadge != a3)
  {
    self->_showsBadge = a3;
    [(UIView *)self->_badgeView setHidden:!a3];
  }
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)SFNavigationBarToggleButton;
  [(SFNavigationBarToggleButton *)&v3 tintColorDidChange];
  -[SFNavigationBarToggleButton _updateDefaultStateImageView]((uint64_t)self);
}

- (void)layoutSubviews
{
  v81.receiver = self;
  v81.super_class = (Class)SFNavigationBarToggleButton;
  [(SFNavigationBarToggleButton *)&v81 layoutSubviews];
  BOOL v3 = [(UIView *)self _sf_usesLeftToRightLayout];
  [(SFNavigationBarToggleButton *)self bounds];
  CGFloat x = v82.origin.x;
  CGFloat y = v82.origin.y;
  double width = v82.size.width;
  CGFloat height = v82.size.height;
  double v74 = CGRectGetWidth(v82);
  v83.origin.CGFloat x = x;
  v83.origin.CGFloat y = y;
  v83.size.double width = width;
  v83.size.CGFloat height = height;
  double v80 = CGRectGetHeight(v83);
  id v8 = -[SFNavigationBarToggleButton _resolvedSecondaryView]((char *)self);
  double v9 = *MEMORY[0x1E4F1DB30];
  double v10 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  objc_msgSend(v8, "sizeThatFits:", *MEMORY[0x1E4F1DB30], v10);
  double v12 = v11;
  v13 = -[SFNavigationBarToggleButton _resolvedTertiaryView]((char *)self);
  objc_msgSend(v13, "sizeThatFits:", v9, v10);
  double v77 = v14;
  CGFloat v75 = width;
  double v76 = v12;
  double v15 = v12 + 2.0;
  if (!v8) {
    double v15 = 0.0;
  }
  double v16 = width - v15;
  double v17 = v14 + 2.0;
  if (!v13) {
    double v17 = 0.0;
  }
  CGFloat v18 = v16 - v17;
  double v19 = *MEMORY[0x1E4F1DAD8];
  double v20 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  -[UIImageView sizeThatFits:](self->_defaultStateImageView, "sizeThatFits:", v9, v10);
  -[UIImageView alignmentRectForFrame:](self->_defaultStateImageView, "alignmentRectForFrame:", v19, v20, v21, v22);
  CGFloat v78 = y;
  CGFloat v79 = height;
  double v28 = _SFCGRectOfSizeAlignedWithinRect(0, 0, v23, v24, x, y, v18, height);
  double v29 = v25;
  double v30 = v26;
  double v31 = v27;
  if (self->_minimumSideMargin == 0.0) {
    goto LABEL_8;
  }
  if (v3)
  {
    double v32 = v28;
    double v28 = fmax(CGRectGetMinX(*(CGRect *)(&v25 - 1)), self->_minimumSideMargin);
LABEL_8:
    CGFloat v33 = v75;
    CGFloat v34 = x;
    goto LABEL_10;
  }
  CGFloat v34 = x;
  v84.origin.CGFloat x = x;
  v84.origin.CGFloat y = v78;
  v84.size.CGFloat height = height;
  CGFloat v33 = v75;
  v84.size.double width = v75;
  double v35 = CGRectGetWidth(v84);
  v85.origin.CGFloat x = v28;
  v85.origin.CGFloat y = v29;
  v85.size.double width = v30;
  v85.size.CGFloat height = v31;
  double v28 = v35 - fmax(CGRectGetMaxX(v85), self->_minimumSideMargin);
LABEL_10:
  -[UIImageView frameForAlignmentRect:](self->_defaultStateImageView, "frameForAlignmentRect:", v28, v29, v30, v31);
  double v37 = _SFRoundRectToPixels(v36);
  double v39 = v38;
  double v41 = v40;
  double v43 = v42;
  -[UIImageView setFrame:](self->_defaultStateImageView, "setFrame:");
  -[UIImageView setFrame:](self->_selectedStateImageView, "setFrame:", v37, v39, v41, v43);
  if (self->_inputMode == 1)
  {
    double v44 = fmin(v74, v80);
    double v45 = v74;
    if (self->_accessoryView
      || ([(UIImageView *)self->_secondaryImageView image],
          v46 = objc_claimAutoreleasedReturnValue(),
          v46,
          double v45 = v74,
          double v47 = v44,
          v46))
    {
      double v47 = v45;
    }
    p_selectedStateMaskView = &self->_selectedStateMaskView;
    -[SFToggleBackgroundView setBounds:](self->_selectedStateMaskView, "setBounds:", 0.0, 0.0, v47, v44);
    UIRectGetCenter();
    -[SFToggleBackgroundView setCenter:](self->_selectedStateMaskView, "setCenter:");
    double v49 = 12.0;
  }
  else
  {
    if (self->_usesInsetFromBackground) {
      double insetFromBackground = self->_insetFromBackground;
    }
    else {
      double insetFromBackground = 0.0;
    }
    v86.origin.CGFloat x = v34;
    v86.origin.CGFloat y = v78;
    v86.size.CGFloat height = v79;
    v86.size.double width = v33;
    CGRect v87 = CGRectInset(v86, insetFromBackground, insetFromBackground);
    p_selectedStateMaskView = &self->_selectedStateMaskView;
    -[SFToggleBackgroundView setFrame:](self->_selectedStateMaskView, "setFrame:", v87.origin.x, v87.origin.y, v87.size.width, v87.size.height);
    double v49 = _SFContinuousCornerRadiusMatchingRadiusWithInset(self->_resizableBackgroundCornerRadius, insetFromBackground);
  }
  [(SFToggleBackgroundView *)*p_selectedStateMaskView _setContinuousCornerRadius:v49];
  v88.origin.CGFloat x = v37;
  v88.origin.CGFloat y = v39;
  v88.size.double width = v41;
  v88.size.CGFloat height = v43;
  double MinX = CGRectGetMinX(v88);
  v89.origin.CGFloat x = v37;
  v89.origin.CGFloat y = v39;
  v89.size.double width = v41;
  v89.size.CGFloat height = v43;
  -[UIView setFrame:](self->_tiplessPopoverSourceView, "setFrame:", MinX, 7.0, CGRectGetWidth(v89), v80);
  double v52 = v37;
  double v53 = v39;
  double v54 = v41;
  double v55 = v43;
  if (v3) {
    double v56 = CGRectGetMaxX(*(CGRect *)&v52) + -5.0;
  }
  else {
    double v56 = CGRectGetMinX(*(CGRect *)&v52);
  }
  -[UIView setFrame:](self->_badgeView, "setFrame:", v56, v39, 5.0, 5.0);
  double v57 = v37;
  double v58 = v39;
  double v59 = v41;
  double v60 = v43;
  if (v3) {
    double v61 = CGRectGetMaxX(*(CGRect *)&v57) + 2.0;
  }
  else {
    double v61 = CGRectGetMinX(*(CGRect *)&v57) - v76 + -2.0;
  }
  double v62 = _SFRoundRectToPixels(v61);
  uint64_t v64 = v63;
  uint64_t v66 = v65;
  uint64_t v68 = v67;
  objc_msgSend(v8, "setFrame:");
  double v69 = v62;
  uint64_t v70 = v64;
  uint64_t v71 = v66;
  uint64_t v72 = v68;
  if (v3) {
    double v73 = CGRectGetMaxX(*(CGRect *)&v69) + 2.0;
  }
  else {
    double v73 = CGRectGetMinX(*(CGRect *)&v69) - v77 + -2.0;
  }
  [v13 setFrame:_SFRoundRectToPixels(v73)];
}

- (char)_resolvedSecondaryView
{
  v1 = a1;
  if (a1)
  {
    double v2 = [a1 secondaryImage];
    BOOL v3 = &OBJC_IVAR___SFNavigationBarToggleButton__secondaryImageView;
    if (!v2) {
      BOOL v3 = &OBJC_IVAR___SFNavigationBarToggleButton__accessoryView;
    }
    v1 = (char *)*(id *)&v1[*v3];
  }

  return v1;
}

- (char)_resolvedTertiaryView
{
  v1 = a1;
  if (a1)
  {
    uint64_t v2 = -[SFNavigationBarToggleButton _resolvedSecondaryView](a1);
    BOOL v3 = (void *)v2;
    BOOL v4 = (void *)*((void *)v1 + 99);
    if (v2 != *((void *)v1 + 97) || !v4)
    {
      if ((void *)v2 != v4
        || ([v1 secondaryImage], BOOL v7 = objc_claimAutoreleasedReturnValue(), v7, !v7))
      {
        char v5 = [v1 tertiaryImage];
        if (v5) {
          id v6 = (void *)*((void *)v1 + 98);
        }
        else {
          id v6 = 0;
        }
        v1 = v6;

        goto LABEL_13;
      }
      BOOL v4 = (void *)*((void *)v1 + 97);
    }
    v1 = v4;
LABEL_13:
  }

  return v1;
}

- (CGSize)intrinsicContentSize
{
  if (self->_minimumSideMargin == 0.0)
  {
    v16.receiver = self;
    v16.super_class = (Class)SFNavigationBarToggleButton;
    [(SFNavigationBarToggleButton *)&v16 intrinsicContentSize];
    double v10 = v12;
    double v11 = v13;
  }
  else
  {
    BOOL v3 = -[SFNavigationBarToggleButton _resolvedSecondaryView]((char *)self);
    BOOL v4 = -[SFNavigationBarToggleButton _resolvedTertiaryView]((char *)self);
    double v5 = 0.0;
    id v6 = (double *)MEMORY[0x1E4F1DB30];
    double v7 = 0.0;
    if (v3)
    {
      objc_msgSend(v3, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
      double v7 = v8 + 2.0;
    }
    if (v4)
    {
      objc_msgSend(v4, "sizeThatFits:", *v6, v6[1]);
      double v5 = v9 + 2.0;
    }
    double v10 = self->_minimumSideMargin + v5 + v7 + self->_minimumSideMargin + 30.34;
    double v11 = 21.0;
  }
  double v14 = v10;
  double v15 = v11;
  result.CGFloat height = v15;
  result.double width = v14;
  return result;
}

- (void)setCornerRoundingMode:(int64_t)a3
{
  if (self->_cornerRoundingMode != a3)
  {
    self->_int64_t cornerRoundingMode = a3;
    selectedStateMaskView = self->_selectedStateMaskView;
    if (selectedStateMaskView)
    {
      if (selectedStateMaskView->_cornerRoundingMode != a3)
      {
        selectedStateMaskView->_int64_t cornerRoundingMode = a3;
        [(SFToggleBackgroundView *)selectedStateMaskView setNeedsLayout];
      }
    }
  }
}

- (void)setInsetFromBackground:(double)a3
{
  if (self->_insetFromBackground != a3)
  {
    self->_double insetFromBackground = a3;
    [(SFNavigationBarToggleButton *)self setNeedsLayout];
  }
}

- (void)setUsesInsetFromBackground:(BOOL)a3
{
  if (self->_usesInsetFromBackground != a3)
  {
    self->_usesInsetFromBackground = a3;
    [(SFNavigationBarToggleButton *)self setNeedsLayout];
  }
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SFNavigationBarToggleButton;
  if ([(SFNavigationBarToggleButton *)&v8 isHighlighted] != a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)SFNavigationBarToggleButton;
    [(SFNavigationBarToggleButton *)&v7 setHighlighted:v3];
    double v5 = 0.2;
    if (v3) {
      double v5 = 0.0;
    }
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __46__SFNavigationBarToggleButton_setHighlighted___block_invoke;
    v6[3] = &unk_1E54E9858;
    v6[4] = self;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:50659332 delay:v6 options:0 animations:v5 completion:0.0];
  }
}

void __46__SFNavigationBarToggleButton_setHighlighted___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    -[SFNavigationBarToggleButton _updateDefaultStateImageView](*(void *)(a1 + 32));
    -[SFNavigationBarToggleButton _updateSelectedStateView](v1);
  }
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFNavigationBarToggleButton;
  if ([(SFNavigationBarToggleButton *)&v9 isSelected] != a3)
  {
    v8.receiver = self;
    v8.super_class = (Class)SFNavigationBarToggleButton;
    [(SFNavigationBarToggleButton *)&v8 setSelected:v3];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __43__SFNavigationBarToggleButton_setSelected___block_invoke;
    v7[3] = &unk_1E54E9858;
    v7[4] = self;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:50659332 delay:v7 options:0 animations:0.25 completion:0.0];
    double v5 = 0.195;
    if (v3) {
      double v5 = 0.205;
    }
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __43__SFNavigationBarToggleButton_setSelected___block_invoke_2;
    v6[3] = &unk_1E54E9858;
    v6[4] = self;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:50659332 delay:v6 options:0 animations:v5 completion:0.0];
    [(UIPointerInteraction *)self->_pointerInteraction invalidate];
  }
}

void __43__SFNavigationBarToggleButton_setSelected___block_invoke(uint64_t a1)
{
}

void __43__SFNavigationBarToggleButton_setSelected___block_invoke_2(uint64_t a1)
{
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v5 = a5;

  return v5;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5 = [(SFNavigationBarToggleButton *)self superview];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pointerPreviewContainer);
  objc_super v7 = WeakRetained;
  if (WeakRetained) {
    objc_super v8 = WeakRetained;
  }
  else {
    objc_super v8 = v5;
  }
  id v9 = v8;

  [(SFNavigationBarToggleButton *)self center];
  objc_msgSend(v9, "convertPoint:fromView:", v5);
  double v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1B38]), "initWithContainer:center:", v9, v10, v11);

  id v13 = objc_alloc(MEMORY[0x1E4FB1D48]);
  id v14 = objc_alloc_init(MEMORY[0x1E4FB1B28]);
  double v15 = (void *)[v13 initWithView:self parameters:v14 target:v12];

  if ([(SFNavigationBarToggleButton *)self isSelected])
  {
    objc_super v16 = (void *)MEMORY[0x1E4FB1AE0];
    double v17 = [(SFNavigationBarToggleButton *)self superview];
    [(SFToggleBackgroundView *)self->_selectedStateMaskView bounds];
    objc_msgSend(v17, "convertRect:fromView:", self->_selectedStateMaskView);
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    [(SFToggleBackgroundView *)self->_selectedStateMaskView _continuousCornerRadius];
    double v27 = objc_msgSend(v16, "shapeWithRoundedRect:cornerRadius:", v19, v21, v23, v25, v26);

    double v28 = (void *)MEMORY[0x1E4FB1AD0];
  }
  else
  {
    double v29 = (void *)MEMORY[0x1E4FB1AE0];
    if (self->_inputMode)
    {
      objc_msgSend(MEMORY[0x1E4FB1AE0], "sf_shapeForToolbarButton:", self);
    }
    else
    {
      [(SFNavigationBarToggleButton *)self frame];
      CGRect v35 = CGRectInset(v34, 2.0, 2.0);
      objc_msgSend(v29, "shapeWithRoundedRect:cornerRadius:", v35.origin.x, v35.origin.y, v35.size.width, v35.size.height, self->_resizableBackgroundCornerRadius + -2.0);
    double v27 = };
    double v28 = (void *)MEMORY[0x1E4FB1AB0];
  }
  double v30 = [v28 effectWithPreview:v15];
  double v31 = [MEMORY[0x1E4FB1AE8] styleWithEffect:v30 shape:v27];

  return v31;
}

- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5
{
  self->_liftedForCursor = 1;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __75__SFNavigationBarToggleButton_pointerInteraction_willEnterRegion_animator___block_invoke;
  v5[3] = &unk_1E54E9858;
  v5[4] = self;
  objc_msgSend(a5, "addAnimations:", v5, a4);
}

void __75__SFNavigationBarToggleButton_pointerInteraction_willEnterRegion_animator___block_invoke(uint64_t a1)
{
}

- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5
{
  self->_liftedForCursor = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __74__SFNavigationBarToggleButton_pointerInteraction_willExitRegion_animator___block_invoke;
  v5[3] = &unk_1E54E9858;
  v5[4] = self;
  objc_msgSend(a5, "addAnimations:", v5, a4);
}

void __74__SFNavigationBarToggleButton_pointerInteraction_willExitRegion_animator___block_invoke(uint64_t a1)
{
}

- (UIImage)image
{
  return self->_image;
}

- (UIView)accessoryView
{
  return self->_accessoryView;
}

- (double)minimumSideMargin
{
  return self->_minimumSideMargin;
}

- (BOOL)showsBadge
{
  return self->_showsBadge;
}

- (BOOL)drawsLightGlyph
{
  return self->_drawsLightGlyph;
}

- (void)setDrawsLightGlyph:(BOOL)a3
{
  self->_drawsLightGlyph = a3;
}

- (double)resizableBackgroundCornerRadius
{
  return self->_resizableBackgroundCornerRadius;
}

- (int64_t)cornerRoundingMode
{
  return self->_cornerRoundingMode;
}

- (double)insetFromBackground
{
  return self->_insetFromBackground;
}

- (BOOL)usesInsetFromBackground
{
  return self->_usesInsetFromBackground;
}

- (UIColor)glyphTintColor
{
  return self->_glyphTintColor;
}

- (BOOL)highlightsBackground
{
  return self->_highlightsBackground;
}

- (void)setHighlightsBackground:(BOOL)a3
{
  self->_highlightsBackground = a3;
}

- (UIImageSymbolConfiguration)preferredSymbolConfiguration
{
  return self->_preferredSymbolConfiguration;
}

- (UIView)pointerPreviewContainer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pointerPreviewContainer);

  return (UIView *)WeakRetained;
}

- (UIView)tiplessPopoverSourceView
{
  return self->_tiplessPopoverSourceView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tiplessPopoverSourceView, 0);
  objc_destroyWeak((id *)&self->_pointerPreviewContainer);
  objc_storeStrong((id *)&self->_pointerInteraction, 0);
  objc_storeStrong((id *)&self->_preferredSymbolConfiguration, 0);
  objc_storeStrong((id *)&self->_glyphTintColor, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_badgeView, 0);
  objc_storeStrong((id *)&self->_selectedStateFillView, 0);
  objc_storeStrong((id *)&self->_selectedStateMaskView, 0);
  objc_storeStrong((id *)&self->_accessoryView, 0);
  objc_storeStrong((id *)&self->_tertiaryImageView, 0);
  objc_storeStrong((id *)&self->_secondaryImageView, 0);
  objc_storeStrong((id *)&self->_selectedStateImageView, 0);

  objc_storeStrong((id *)&self->_defaultStateImageView, 0);
}

@end