@interface _SFSiteIconView
- (BOOL)allowsDropShadow;
- (BOOL)usesVibrantAppearance;
- (CGRect)_imageFrame;
- (NSString)visualEffectGroupName;
- (UIAction)action;
- (UIImage)image;
- (UIImage)leadingImage;
- (WebBookmark)bookmark;
- (_SFSiteIconView)initWithFrame:(CGRect)a3;
- (_SFSiteIconViewUpdateObserver)updateObserver;
- (_UIVisualEffectBackdropView)backdropCaptureView;
- (double)_monogramFontSize;
- (id)_effectiveBackgroundColor;
- (id)_glyphConfiguration;
- (id)_tintedFolderImage;
- (int64_t)_inferredIconSize;
- (int64_t)imageContentMode;
- (void)_applyBackgroundEffect:(id)a3;
- (void)_cancelTouchIconRequest;
- (void)_displayDefaultFolderIcon;
- (void)_setContinuousCornerRadius:(double)a3;
- (void)_setGlyph:(id)a3 withBackgroundColor:(id)a4;
- (void)_setGlyph:(id)a3 withBackgroundEffect:(id)a4;
- (void)_setImage:(id)a3 withBackgroundColor:(id)a4;
- (void)_setMonogramWithString:(id)a3 backgroundColor:(id)a4;
- (void)_setSiteIcon:(id)a3 withBackgroundColor:(id)a4;
- (void)_setState:(int64_t)a3;
- (void)_updateGlyphConfiguration;
- (void)_updateMonogramLabelSizeAndFont;
- (void)_updateSiteIconViewWithTouchIconResponse:(id)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setAction:(id)a3;
- (void)setAction:(id)a3 backgroundEffect:(id)a4;
- (void)setAllowsDropShadow:(BOOL)a3;
- (void)setBackdropCaptureView:(id)a3;
- (void)setBookmark:(id)a3;
- (void)setImage:(id)a3;
- (void)setImageContentMode:(int64_t)a3;
- (void)setLeadingImage:(id)a3;
- (void)setUpdateObserver:(id)a3;
- (void)setVisualEffectGroupName:(id)a3;
- (void)updateBookmarkData;
- (void)updateSiteIconViewWithLinkMetadata:(id)a3 requiredImageSize:(CGSize)a4 fallbackIcon:(id)a5;
@end

@implementation _SFSiteIconView

- (void)setBookmark:(id)a3
{
  v5 = (WebBookmark *)a3;
  leadingImage = self->_leadingImage;
  v8 = v5;
  if (self->_bookmark == v5)
  {
    if (!leadingImage) {
      goto LABEL_7;
    }
  }
  else if (!leadingImage)
  {
    goto LABEL_6;
  }
  [(_SFSiteIconView *)self _setState:2];
LABEL_6:
  action = self->_action;
  self->_action = 0;

  objc_storeStrong((id *)&self->_bookmark, a3);
  [(_SFSiteIconView *)self updateBookmarkData];
LABEL_7:
}

- (UIAction)action
{
  return self->_action;
}

- (void)setVisualEffectGroupName:(id)a3
{
}

- (void)setBackdropCaptureView:(id)a3
{
  id v6 = a3;
  v4 = [(UIVisualEffectView *)self->_backgroundView _captureView];
  char v5 = WBSIsEqual();

  if ((v5 & 1) == 0) {
    [(UIVisualEffectView *)self->_backgroundView _setCaptureView:v6];
  }
}

- (void)layoutSubviews
{
  v38.receiver = self;
  v38.super_class = (Class)_SFSiteIconView;
  [(_SFSiteIconView *)&v38 layoutSubviews];
  v3 = [(_SFSiteIconView *)self layer];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  -[UIVisualEffectView setFrame:](self->_backgroundView, "setFrame:", v5, v7, v9, v11);
  v12 = [(_SFSiteIconView *)self _effectiveBackgroundColor];
  v13 = [(UIVisualEffectView *)self->_backgroundView contentView];
  [v13 setBackgroundColor:v12];

  if ([(_SFSiteIconView *)self usesVibrantAppearance])
  {
    if (!self->_preferredBackgroundColor
      || ([MEMORY[0x1E4FB1618] clearColor],
          v14 = objc_claimAutoreleasedReturnValue(),
          int v15 = WBSIsEqual(),
          v14,
          v15))
    {
      if (self->_preferredBackgroundEffect)
      {
        -[_SFSiteIconView _applyBackgroundEffect:](self, "_applyBackgroundEffect:");
      }
      else
      {
        v16 = objc_msgSend(MEMORY[0x1E4FB14C8], "_sf_defaultStartPageBackgroundEffect");
        [(_SFSiteIconView *)self _applyBackgroundEffect:v16];
      }
    }
  }
  if (self->_state == 2)
  {
    [(_SFSiteIconView *)self _updateMonogramLabelSizeAndFont];
    p_monogramLabel = (id *)&self->_monogramLabel;
    [(UILabel *)self->_monogramLabel frame];
    double v19 = _SFRoundRectToPixels(v5 + (v9 - v18) * 0.5);
  }
  else
  {
    [(_SFSiteIconView *)self _updateGlyphConfiguration];
    [(_SFSiteIconView *)self _imageFrame];
    p_monogramLabel = (id *)&self->_imageView;
  }
  [*p_monogramLabel setFrame:v19];
  borderView = self->_borderView;
  if (borderView || self->_shadowView)
  {
    -[_SFHairlineBorderView setFrame:](borderView, "setFrame:", v5, v7, v9, v11);
    v21 = [(UIImageView *)self->_shadowView image];
    [v21 alignmentRectInsets];
    UIEdgeInsetsSubtract();
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;
    double v29 = v28;

    -[UIImageView setFrame:](self->_shadowView, "setFrame:", v5 + v25, v7 + v23, v9 - (v25 + v29), v11 - (v23 + v27));
    v30 = [(UIImageView *)self->_imageView layer];
    if (self->_action
      || ([(UIImageView *)self->_imageView image],
          v31 = objc_claimAutoreleasedReturnValue(),
          uint64_t v32 = objc_msgSend(v31, "safari_transparencyAnalysisResult"),
          v31,
          v32 != 4))
    {
      [v30 setShadowColor:0];
      [v30 setShadowOpacity:0.0];
      if ([(_SFSiteIconView *)self usesVibrantAppearance]
        || self->_action
        || !self->_allowsDropShadow)
      {
        BOOL v36 = 1;
      }
      else if (self->_state == 2)
      {
        BOOL v36 = self->_monogramLabel == 0;
      }
      else
      {
        v37 = [(_SFSiteIconView *)self image];
        BOOL v36 = v37 == 0;
      }
      uint64_t v35 = 1;
    }
    else
    {
      [v30 setShadowRadius:12.0];
      objc_msgSend(v30, "setShadowOffset:", 0.0, 6.0);
      id v33 = [MEMORY[0x1E4FB1618] blackColor];
      objc_msgSend(v30, "setShadowColor:", objc_msgSend(v33, "CGColor"));

      LODWORD(v34) = *(_DWORD *)"\nף=";
      [v30 setShadowOpacity:v34];
      uint64_t v35 = 0;
      BOOL v36 = 1;
    }
    [(_SFHairlineBorderView *)self->_borderView setHidden:v36];
    [(UIImageView *)self->_shadowView setHidden:v36];
    [(UIImageView *)self->_imageView setClipsToBounds:v35];
  }
}

- (BOOL)usesVibrantAppearance
{
  return 0;
}

- (id)_effectiveBackgroundColor
{
  if (self->_action
    || ([(UIImageView *)self->_imageView image],
        v3 = objc_claimAutoreleasedReturnValue(),
        uint64_t v4 = objc_msgSend(v3, "safari_transparencyAnalysisResult"),
        v3,
        v4 != 4))
  {
    double v5 = self->_preferredBackgroundColor;
  }
  else
  {
    double v5 = [MEMORY[0x1E4FB1618] clearColor];
  }

  return v5;
}

- (void)_updateMonogramLabelSizeAndFont
{
  int64_t v3 = [(_SFSiteIconView *)self _inferredIconSize];
  [(_SFSiteIconView *)self _monogramFontSize];
  double v5 = v4;
  +[_SFSiteIcon labelWidthForIconSize:v3];
  double v7 = v6;
  [(UILabel *)self->_monogramLabel frame];
  if (v8 != v7)
  {
    double v9 = (double *)MEMORY[0x1E4FB09C8];
    if (!v3) {
      double v9 = (double *)MEMORY[0x1E4FB09D8];
    }
    double v10 = [MEMORY[0x1E4FB08E0] systemFontOfSize:v5 weight:*v9];
    [(UILabel *)self->_monogramLabel setFont:v10];

    monogramLabel = self->_monogramLabel;
    -[UILabel setFrame:](monogramLabel, "setFrame:", 0.0, 0.0, v7, v7);
  }
}

- (double)_monogramFontSize
{
  if (self->_action) {
    return 24.0;
  }
  int64_t v3 = [(_SFSiteIconView *)self _inferredIconSize];

  +[_SFSiteIcon fontPointSizeForIconSize:v3];
  return result;
}

- (int64_t)_inferredIconSize
{
  +[_SFSiteIcon sizeForIconSize:0];
  double v4 = v3;
  double v6 = v5;
  [(_SFSiteIconView *)self bounds];
  int64_t result = 0;
  if (v7 > v4 && v8 > v6)
  {
    double v11 = v7;
    double v12 = v8;
    +[_SFSiteIcon sizeForIconSize:1];
    if (v12 > v14 && v11 > v13) {
      return 2;
    }
    else {
      return 1;
    }
  }
  return result;
}

- (UIImage)image
{
  return [(UIImageView *)self->_imageView image];
}

- (void)_updateGlyphConfiguration
{
  if (self->_state == 1)
  {
    id v7 = [(UIImageView *)self->_imageView image];
    double v3 = [v7 configuration];
    if ([v7 isSymbolImage]) {
      BOOL v4 = v3 == 0;
    }
    else {
      BOOL v4 = 1;
    }
    if (!v4)
    {
      double v5 = [(_SFSiteIconView *)self _glyphConfiguration];
      if (([v3 isEqual:v5] & 1) == 0)
      {
        double v6 = [v7 imageWithConfiguration:v5];
        [(UIImageView *)self->_imageView setImage:v6];
      }
    }
  }
}

- (CGRect)_imageFrame
{
  if (self->_state == 1)
  {
    double v3 = [(UIImageView *)self->_imageView image];
    [v3 size];
    double v5 = v4;
    [(_SFSiteIconView *)self bounds];
    double x = _SFRoundRectToPixels(v7 + (v6 - v5) * 0.5);
    CGFloat y = v9;
    CGFloat width = v11;
    CGFloat height = v13;
  }
  else
  {
    BOOL imageIsTransparent = self->_imageIsTransparent;
    [(_SFSiteIconView *)self bounds];
    double x = v16;
    CGFloat y = v17;
    CGFloat width = v18;
    CGFloat height = v19;
    if (imageIsTransparent)
    {
      CGRect v24 = CGRectInset(*(CGRect *)&v16, 6.0, 6.0);
      double x = v24.origin.x;
      CGFloat y = v24.origin.y;
      CGFloat width = v24.size.width;
      CGFloat height = v24.size.height;
    }
  }
  double v20 = x;
  double v21 = y;
  double v22 = width;
  double v23 = height;
  result.size.CGFloat height = v23;
  result.size.CGFloat width = v22;
  result.origin.CGFloat y = v21;
  result.origin.double x = v20;
  return result;
}

- (void)setAllowsDropShadow:(BOOL)a3
{
  if (self->_allowsDropShadow != a3)
  {
    self->_allowsDropShadow = a3;
    if (a3)
    {
      if (!self->_shadowView)
      {
        id v4 = objc_alloc(MEMORY[0x1E4FB1838]);
        if (shadowImage_onceToken != -1) {
          dispatch_once(&shadowImage_onceToken, &__block_literal_global_7);
        }
        id v5 = (id)shadowImage_image;
        double v6 = (UIImageView *)[v4 initWithImage:v5];
        shadowView = self->_shadowView;
        self->_shadowView = v6;

        [(_SFSiteIconView *)self insertSubview:self->_shadowView atIndex:0];
      }
      if (!self->_borderView)
      {
        double v8 = objc_alloc_init(_SFHairlineBorderView);
        borderView = self->_borderView;
        self->_borderView = v8;

        double v10 = [MEMORY[0x1E4FB1618] labelColor];
        double v11 = [v10 colorWithAlphaComponent:0.07];
        [(_SFHairlineBorderView *)self->_borderView setBorderColor:v11];

        [(_SFSiteIconView *)self insertSubview:self->_borderView aboveSubview:self->_imageView];
      }
    }
    [(_SFSiteIconView *)self setNeedsLayout];
  }
}

- (void)updateBookmarkData
{
  [(_SFSiteIconView *)self _cancelTouchIconRequest];
  if (*(_OWORD *)&self->_bookmark == 0)
  {
    [(_SFSiteIconView *)self _setSiteIcon:0 withBackgroundColor:0];
    [(_SFSiteIconView *)self setHidden:1];
  }
  else
  {
    objc_initWeak(&location, self);
    [(_SFSiteIconView *)self setHidden:0];
    if ([(WebBookmark *)self->_bookmark isFolder]) {
      [(_SFSiteIconView *)self _displayDefaultFolderIcon];
    }
    else {
      [(_SFSiteIconView *)self _updateSiteIconViewWithTouchIconResponse:0];
    }
    double v3 = self->_bookmark;
    id v4 = +[SFBookmarkTouchIconRequest requestWithBookmark:v3 iconGenerationEnabled:0];
    id v5 = +[_SFSiteMetadataManager sharedSiteMetadataManager];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __37___SFSiteIconView_updateBookmarkData__block_invoke;
    v10[3] = &unk_1E54EA6E0;
    objc_copyWeak(&v13, &location);
    id v6 = v4;
    id v11 = v6;
    double v7 = v3;
    double v12 = v7;
    double v8 = [v5 registerRequest:v6 priority:2 responseHandler:v10];
    id touchIconRequestToken = self->_touchIconRequestToken;
    self->_id touchIconRequestToken = v8;

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

- (void)_setImage:(id)a3 withBackgroundColor:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  [(UIImageView *)self->_imageView setImage:v13];
  p_preferredBackgroundColor = &self->_preferredBackgroundColor;
  objc_storeStrong((id *)&self->_preferredBackgroundColor, a4);
  if (![(_SFSiteIconView *)self usesVibrantAppearance] && !*p_preferredBackgroundColor)
  {
    uint64_t v8 = [MEMORY[0x1E4FB1618] tertiarySystemGroupedBackgroundColor];
    double v9 = *p_preferredBackgroundColor;
    *p_preferredBackgroundColor = (UIColor *)v8;
  }
  unint64_t v10 = objc_msgSend(v13, "safari_transparencyAnalysisResult");
  char v11 = [(WebBookmark *)self->_bookmark isFolder];
  if (v10 <= 4) {
    unsigned int v12 = (5u >> v10) & 1;
  }
  else {
    LOBYTE(v12) = 1;
  }
  if (v11) {
    LOBYTE(v12) = 0;
  }
  self->_BOOL imageIsTransparent = v12;
  [(_SFSiteIconView *)self setClipsToBounds:0];
  [(_SFSiteIconView *)self setNeedsLayout];
}

- (void)_updateSiteIconViewWithTouchIconResponse:(id)a3
{
  id v4 = a3;
  if (!self->_leadingImage)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F97FD8]);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __60___SFSiteIconView__updateSiteIconViewWithTouchIconResponse___block_invoke;
    v16[3] = &unk_1E54E9858;
    v16[4] = self;
    [v5 setHandler:v16];
    id v6 = [v4 touchIcon];
    char v7 = [(WebBookmark *)self->_bookmark isFolder];
    if (v6)
    {
      if (v7)
      {
        uint64_t v8 = [v4 extractedBackgroundColor];
        [(_SFSiteIconView *)self _setSiteIcon:v6 withBackgroundColor:v8];
LABEL_11:

        goto LABEL_12;
      }
      [(_SFSiteIconView *)self _setSiteIcon:v6 withBackgroundColor:0];
    }
    else if ((v7 & 1) == 0)
    {
      double v9 = (void *)MEMORY[0x1E4F98F18];
      unint64_t v10 = [(WebBookmark *)self->_bookmark title];
      char v11 = (void *)MEMORY[0x1E4F1CB10];
      unsigned int v12 = [(WebBookmark *)self->_bookmark address];
      id v13 = objc_msgSend(v11, "safari_URLWithUserTypedString:", v12);
      uint64_t v8 = [v9 monogramStringForTitle:v10 url:v13];

      if ([v8 length])
      {
        double v14 = [v4 extractedBackgroundColor];
        [(_SFSiteIconView *)self _setMonogramWithString:v8 backgroundColor:v14];
      }
      else
      {
        double v14 = +[_SFSiteIcon defaultGlyph];
        int v15 = [v4 extractedBackgroundColor];
        [(_SFSiteIconView *)self _setGlyph:v14 withBackgroundColor:v15];
      }
      [(_SFSiteIconView *)self setNeedsLayout];
      goto LABEL_11;
    }
LABEL_12:
  }
}

- (void)_setSiteIcon:(id)a3 withBackgroundColor:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(_SFSiteIconView *)self _setState:0];
  [(_SFSiteIconView *)self _setImage:v7 withBackgroundColor:v6];
}

- (void)_setMonogramWithString:(id)a3 backgroundColor:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  [(_SFSiteIconView *)self _setState:2];
  if ([(_SFSiteIconView *)self usesVibrantAppearance])
  {
    id v7 = +[_SFSiteIcon defaultIconKeyColor];
    int v8 = [v6 isEqual:v7];

    if (v8)
    {

      id v6 = 0;
    }
  }
  else if (!v6)
  {
    id v6 = +[_SFSiteIcon defaultIconKeyColor];
  }
  double v9 = [(UILabel *)self->_monogramLabel text];
  if ([v9 isEqualToString:v16])
  {
    char v10 = [v6 isEqual:self->_preferredBackgroundColor];

    if (v10) {
      goto LABEL_15;
    }
  }
  else
  {
  }
  monogramLabel = self->_monogramLabel;
  if (!monogramLabel)
  {
    unsigned int v12 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    id v13 = self->_monogramLabel;
    self->_monogramLabel = v12;

    [(UILabel *)self->_monogramLabel setAdjustsFontSizeToFitWidth:1];
    [(UILabel *)self->_monogramLabel setTextAlignment:1];
    [(UILabel *)self->_monogramLabel setNumberOfLines:0];
    double v14 = [MEMORY[0x1E4FB1618] whiteColor];
    [(UILabel *)self->_monogramLabel setTextColor:v14];

    if ([v16 _isSingleEmoji])
    {
      int v15 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.12];
      [(UILabel *)self->_monogramLabel setShadowColor:v15];

      -[UILabel setShadowOffset:](self->_monogramLabel, "setShadowOffset:", 1.0, 1.0);
    }
    [(_SFSiteIconView *)self addSubview:self->_monogramLabel];
    monogramLabel = self->_monogramLabel;
  }
  [(UILabel *)monogramLabel setText:v16];
  objc_storeStrong((id *)&self->_preferredBackgroundColor, v6);
  [(_SFSiteIconView *)self setNeedsLayout];
LABEL_15:
}

- (void)_setState:(int64_t)a3
{
  if (self->_state != a3)
  {
    self->_state = a3;
    BOOL v5 = a3 == 2;
    [(UILabel *)self->_monogramLabel setHidden:a3 != 2];
    [(UIImageView *)self->_imageView setHidden:v5];
    if (a3 != 3)
    {
      leadingImage = self->_leadingImage;
      self->_leadingImage = 0;
    }
  }
}

- (_SFSiteIconView)initWithFrame:(CGRect)a3
{
  v15.receiver = self;
  v15.super_class = (Class)_SFSiteIconView;
  double v3 = -[_SFSiteIconView initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = v3;
  if (v3)
  {
    [(_SFSiteIconView *)v3 setUserInteractionEnabled:0];
    BOOL v5 = [(_SFSiteIconView *)v4 usesVibrantAppearance];
    id v6 = (UIVisualEffectView *)objc_alloc_init(MEMORY[0x1E4FB1F00]);
    backgroundView = v4->_backgroundView;
    v4->_backgroundView = v6;

    [(UIVisualEffectView *)v4->_backgroundView setClipsToBounds:1];
    if (v5)
    {
      int v8 = 0;
    }
    else
    {
      int v8 = +[_SFSiteIcon defaultIconKeyColor];
    }
    double v9 = [(UIVisualEffectView *)v4->_backgroundView contentView];
    [v9 setBackgroundColor:v8];

    if (v5)
    {
      char v10 = objc_msgSend(MEMORY[0x1E4FB14C8], "_sf_defaultStartPageBackgroundEffect");
      [(_SFSiteIconView *)v4 _applyBackgroundEffect:v10];
    }
    else
    {

      [(_SFSiteIconView *)v4 _applyBackgroundEffect:0];
    }
    [(_SFSiteIconView *)v4 addSubview:v4->_backgroundView];
    char v11 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    imageView = v4->_imageView;
    v4->_imageView = v11;

    [(UIImageView *)v4->_imageView setContentMode:2];
    [(UIImageView *)v4->_imageView setClipsToBounds:1];
    [(_SFSiteIconView *)v4 addSubview:v4->_imageView];
    +[_SFSiteIcon cornerRadius];
    -[_SFSiteIconView _setContinuousCornerRadius:](v4, "_setContinuousCornerRadius:");
    id v13 = v4;
  }

  return v4;
}

- (void)_setContinuousCornerRadius:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_SFSiteIconView;
  -[_SFSiteIconView _setContinuousCornerRadius:](&v5, sel__setContinuousCornerRadius_);
  [(UIVisualEffectView *)self->_backgroundView _setContinuousCornerRadius:a3];
  [(UIImageView *)self->_imageView _setContinuousCornerRadius:a3];
}

- (void)_cancelTouchIconRequest
{
  if (self->_touchIconRequestToken)
  {
    double v3 = +[_SFSiteMetadataManager sharedSiteMetadataManager];
    [v3 cancelRequestWithToken:self->_touchIconRequestToken];

    id touchIconRequestToken = self->_touchIconRequestToken;
    self->_id touchIconRequestToken = 0;
  }
}

- (void)_applyBackgroundEffect:(id)a3
{
}

- (void)dealloc
{
  [(_SFSiteIconView *)self _cancelTouchIconRequest];
  v3.receiver = self;
  v3.super_class = (Class)_SFSiteIconView;
  [(_SFSiteIconView *)&v3 dealloc];
}

- (void)setImage:(id)a3
{
  bookmark = self->_bookmark;
  self->_bookmark = 0;
  id v5 = a3;

  action = self->_action;
  self->_action = 0;

  [(_SFSiteIconView *)self _cancelTouchIconRequest];
  [(_SFSiteIconView *)self _setState:0];
  [(_SFSiteIconView *)self _setImage:v5 withBackgroundColor:0];

  [(_SFSiteIconView *)self setNeedsLayout];
}

- (void)setAction:(id)a3
{
}

- (void)setAction:(id)a3 backgroundEffect:(id)a4
{
  id v12 = a3;
  id v7 = a4;
  if ((WBSIsEqual() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_action, a3);
    if (!v12)
    {
      [(_SFSiteIconView *)self setNeedsLayout];
      goto LABEL_11;
    }
    bookmark = self->_bookmark;
    self->_bookmark = 0;

    [(_SFSiteIconView *)self _cancelTouchIconRequest];
    BOOL v9 = [(_SFSiteIconView *)self usesVibrantAppearance];
    char v10 = [v12 image];
    if (v9)
    {
      if (v7)
      {
        [(_SFSiteIconView *)self _setGlyph:v10 withBackgroundEffect:v7];
LABEL_10:

        goto LABEL_11;
      }
      char v11 = objc_msgSend(MEMORY[0x1E4FB14C8], "_sf_defaultStartPageBackgroundEffect");
      [(_SFSiteIconView *)self _setGlyph:v10 withBackgroundEffect:v11];
    }
    else
    {
      char v11 = [MEMORY[0x1E4FB1618] secondarySystemGroupedBackgroundColor];
      [(_SFSiteIconView *)self _setGlyph:v10 withBackgroundColor:v11];
    }

    goto LABEL_10;
  }
LABEL_11:
}

- (int64_t)imageContentMode
{
  return [(UIImageView *)self->_imageView contentMode];
}

- (void)setImageContentMode:(int64_t)a3
{
}

- (void)_displayDefaultFolderIcon
{
  BOOL v3 = [(_SFSiteIconView *)self usesVibrantAppearance];
  id v5 = [(_SFSiteIconView *)self _tintedFolderImage];
  if (v3)
  {
    id v4 = objc_msgSend(MEMORY[0x1E4FB14C8], "_sf_defaultStartPageBackgroundEffect");
    [(_SFSiteIconView *)self _setGlyph:v5 withBackgroundEffect:v4];
  }
  else
  {
    id v4 = +[_SFSiteIcon defaultIconKeyColor];
    [(_SFSiteIconView *)self _setGlyph:v5 withBackgroundColor:v4];
  }
}

- (void)updateSiteIconViewWithLinkMetadata:(id)a3 requiredImageSize:(CGSize)a4 fallbackIcon:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  id v9 = a3;
  id v10 = a5;
  char v11 = [v9 image];
  id v12 = [v11 platformImage];
  id v13 = v12;
  if (v12)
  {
    id v14 = v12;
  }
  else
  {
    objc_super v15 = [v9 icon];
    id v14 = [v15 platformImage];
  }
  [(UIImageView *)self->_imageView setContentMode:2];
  id v16 = objc_alloc_init(MEMORY[0x1E4F97FD8]);
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __85___SFSiteIconView_updateSiteIconViewWithLinkMetadata_requiredImageSize_fallbackIcon___block_invoke;
  v37[3] = &unk_1E54E9858;
  v37[4] = self;
  [v16 setHandler:v37];
  if (!v14) {
    goto LABEL_14;
  }
  [v14 size];
  if (v17 < width)
  {
    [v14 size];
    if (v18 < height) {
      goto LABEL_14;
    }
  }
  [v14 size];
  double v20 = v19;
  [v14 size];
  double v22 = v21;
  [v14 size];
  if (v20 >= v22) {
    double v25 = v24;
  }
  else {
    double v25 = v23;
  }
  [v14 size];
  double v27 = v26;
  [v14 size];
  double v29 = v28;
  [v14 size];
  if (v27 <= v29) {
    double v30 = v31;
  }
  if (v25 / v30 > 0.3)
  {
    [(_SFSiteIconView *)self setImage:v14];
  }
  else
  {
LABEL_14:
    uint64_t v32 = (void *)MEMORY[0x1E4F98F18];
    id v33 = [v9 title];
    double v34 = [v9 URL];
    uint64_t v35 = [v32 monogramStringForTitle:v33 url:v34];

    if ([v35 length])
    {
      if (v14) {
        [MEMORY[0x1E4F98E78] keyColorForIcon:v14];
      }
      else {
      BOOL v36 = +[_SFSiteIcon defaultIconKeyColor];
      }
      [(_SFSiteIconView *)self _setMonogramWithString:v35 backgroundColor:v36];
      [(_SFSiteIconView *)self setNeedsLayout];
    }
    else
    {
      [(_SFSiteIconView *)self setImage:v10];
    }
  }
}

- (NSString)visualEffectGroupName
{
  return (NSString *)[(UIVisualEffectView *)self->_backgroundView _groupName];
}

- (_UIVisualEffectBackdropView)backdropCaptureView
{
  return (_UIVisualEffectBackdropView *)[(UIVisualEffectView *)self->_backgroundView _captureView];
}

- (void)setLeadingImage:(id)a3
{
  objc_storeStrong((id *)&self->_leadingImage, a3);
  id v5 = a3;
  [(_SFSiteIconView *)self _setState:3];
  [(_SFSiteIconView *)self _setImage:v5 withBackgroundColor:0];
}

- (void)_setGlyph:(id)a3 withBackgroundColor:(id)a4
{
  id v6 = (UIColor *)a4;
  id v7 = a3;
  [(_SFSiteIconView *)self _setState:1];
  [(UIImageView *)self->_imageView setImage:v7];

  preferredBackgroundColor = self->_preferredBackgroundColor;
  self->_preferredBackgroundColor = v6;
  id v9 = v6;

  preferredBackgroundEffect = self->_preferredBackgroundEffect;
  self->_preferredBackgroundEffect = 0;

  [(_SFSiteIconView *)self setNeedsLayout];
}

- (void)_setGlyph:(id)a3 withBackgroundEffect:(id)a4
{
  id v6 = (UIVisualEffect *)a4;
  id v7 = a3;
  [(_SFSiteIconView *)self _setState:1];
  [(UIImageView *)self->_imageView setImage:v7];

  preferredBackgroundColor = self->_preferredBackgroundColor;
  self->_preferredBackgroundColor = 0;

  preferredBackgroundEffect = self->_preferredBackgroundEffect;
  self->_preferredBackgroundEffect = v6;

  [(_SFSiteIconView *)self setNeedsLayout];
}

- (id)_glyphConfiguration
{
  BOOL v3 = (void *)MEMORY[0x1E4FB1830];
  [(_SFSiteIconView *)self _monogramFontSize];
  if (self->_action) {
    uint64_t v4 = 4;
  }
  else {
    uint64_t v4 = 3;
  }

  return (id)objc_msgSend(v3, "configurationWithPointSize:weight:scale:", v4, 2);
}

- (id)_tintedFolderImage
{
  v2 = (void *)MEMORY[0x1E4FB1818];
  BOOL v3 = [(_SFSiteIconView *)self _glyphConfiguration];
  uint64_t v4 = [v2 systemImageNamed:@"folder" withConfiguration:v3];

  id v5 = [MEMORY[0x1E4FB1618] whiteColor];
  id v6 = [v4 flattenedImageWithColor:v5];

  id v7 = [v6 imageWithRenderingMode:1];

  objc_msgSend(v7, "safari_setTransparencyAnalysisResult:", 2);

  return v7;
}

- (WebBookmark)bookmark
{
  return self->_bookmark;
}

- (UIImage)leadingImage
{
  return self->_leadingImage;
}

- (_SFSiteIconViewUpdateObserver)updateObserver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_updateObserver);

  return (_SFSiteIconViewUpdateObserver *)WeakRetained;
}

- (void)setUpdateObserver:(id)a3
{
}

- (BOOL)allowsDropShadow
{
  return self->_allowsDropShadow;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_updateObserver);
  objc_storeStrong((id *)&self->_leadingImage, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_bookmark, 0);
  objc_storeStrong((id *)&self->_borderView, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_preferredBackgroundEffect, 0);
  objc_storeStrong((id *)&self->_preferredBackgroundColor, 0);
  objc_storeStrong(&self->_touchIconRequestToken, 0);
  objc_storeStrong((id *)&self->_monogramLabel, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);

  objc_storeStrong((id *)&self->_imageView, 0);
}

@end