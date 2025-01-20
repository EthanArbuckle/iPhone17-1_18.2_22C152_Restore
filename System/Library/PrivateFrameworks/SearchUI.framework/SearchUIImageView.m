@interface SearchUIImageView
+ (SearchUIImageView)imageViewWithImage:(id)a3;
+ (id)thumbnailForRowModel:(id)a3;
- (SFImage)currentImage;
- (SFImage)fallbackImage;
- (SearchUIButton)overlayPlayButton;
- (SearchUIImageView)init;
- (UIView)tintView;
- (void)appIconDidChange:(id)a3;
- (void)didFailToLoadImage;
- (void)didUpdateWithImage:(id)a3;
- (void)layoutSubviews;
- (void)setCurrentImage:(id)a3;
- (void)setFallbackImage:(id)a3;
- (void)setOverlayPlayButton:(id)a3;
- (void)setTintView:(id)a3;
- (void)updateWithImage:(id)a3;
- (void)updateWithImage:(id)a3 animateTransition:(BOOL)a4;
- (void)updateWithImage:(id)a3 fallbackImage:(id)a4 needsOverlayButton:(BOOL)a5;
- (void)updateWithImage:(id)a3 fallbackImage:(id)a4 needsOverlayButton:(BOOL)a5 animateTransition:(BOOL)a6;
@end

@implementation SearchUIImageView

+ (SearchUIImageView)imageViewWithImage:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 updateWithImage:v3];

  return (SearchUIImageView *)v4;
}

- (SearchUIImageView)init
{
  v5.receiver = self;
  v5.super_class = (Class)SearchUIImageView;
  v2 = [(TLKImageView *)&v5 init];
  if (v2)
  {
    id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:v2 selector:sel_appIconDidChange_ name:@"SearchUIAppIconImageDidChangeNotification" object:0];

    [(TLKImageView *)v2 setDelegate:v2];
  }
  return v2;
}

- (void)appIconDidChange:(id)a3
{
  id v13 = [a3 object];
  v4 = [(TLKImageView *)self tlkImage];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v5 = [(TLKImageView *)self tlkImage];
    v6 = [v5 searchUIImage];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v8 = [(TLKImageView *)self tlkImage];
      v9 = [v8 searchUIImage];

      goto LABEL_8;
    }
  }
  else
  {
  }
  v10 = [(SearchUIImageView *)self currentImage];
  objc_opt_class();
  char v11 = objc_opt_isKindOfClass();

  if (v11)
  {
    v9 = [(SearchUIImageView *)self currentImage];
  }
  else
  {
    v9 = 0;
  }
LABEL_8:
  if ([v9 shouldInvalidateAppIconForChangedBundleIdentifier:v13])
  {
    v12 = [(TLKImageView *)self imageView];
    [v12 setImage:0];

    [(SearchUIImageView *)self updateWithImage:v9];
  }
}

- (void)updateWithImage:(id)a3
{
}

- (void)updateWithImage:(id)a3 animateTransition:(BOOL)a4
{
}

- (void)updateWithImage:(id)a3 fallbackImage:(id)a4 needsOverlayButton:(BOOL)a5
{
}

- (void)updateWithImage:(id)a3 fallbackImage:(id)a4 needsOverlayButton:(BOOL)a5 animateTransition:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v26 = a3;
  id v10 = a4;
  char v11 = [(TLKImageView *)self imageView];
  v12 = [v11 image];

  uint64_t v13 = [(SearchUIImageView *)self currentImage];
  if (v13
    && (v14 = (void *)v13,
        [(SearchUIImageView *)self currentImage],
        v15 = objc_claimAutoreleasedReturnValue(),
        int v16 = [v15 isEqual:v26],
        v15,
        v14,
        v16)
    && v12)
  {
    v17 = [(TLKImageView *)self delegate];
    [v17 didUpdateWithImage:v12];
  }
  else
  {
    [(SearchUIImageView *)self setCurrentImage:v26];
    [(SearchUIImageView *)self setFallbackImage:v10];
    if (v7)
    {
      v18 = [(SearchUIImageView *)self overlayPlayButton];

      if (!v18)
      {
        v19 = [[SearchUIButton alloc] initWithType:0];
        [(SearchUIImageView *)self setOverlayPlayButton:v19];

        v20 = [(SearchUIImageView *)self overlayPlayButton];
        [v20 setUserInteractionEnabled:0];

        v21 = [(SearchUIImageView *)self overlayPlayButton];
        [(SearchUIImageView *)self addSubview:v21];
      }
    }
    if (updateWithImage_fallbackImage_needsOverlayButton_animateTransition__onceToken != -1) {
      dispatch_once(&updateWithImage_fallbackImage_needsOverlayButton_animateTransition__onceToken, &__block_literal_global_46);
    }
    v22 = [(SearchUIImageView *)self overlayPlayButton];
    [v22 setHidden:!v7];

    uint64_t v23 = updateWithImage_fallbackImage_needsOverlayButton_animateTransition__dummyImage;
    v24 = [(SearchUIImageView *)self overlayPlayButton];
    [v24 setOverlayImage:v23];

    v17 = +[SearchUITLKImageConverter imageForSFImage:v26];
    if (v6)
    {
      [(TLKImageView *)self animateTransitionToImage:v17];
    }
    else
    {
      v25 = +[SearchUITLKImageConverter imageForSFImage:v26];
      [(TLKImageView *)self setTlkImage:v25];
    }
  }
}

uint64_t __88__SearchUIImageView_updateWithImage_fallbackImage_needsOverlayButton_animateTransition___block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = updateWithImage_fallbackImage_needsOverlayButton_animateTransition__dummyImage;
  updateWithImage_fallbackImage_needsOverlayButton_animateTransition__dummyImage = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (void)didUpdateWithImage:(id)a3
{
  id v7 = a3;
  v4 = [(SearchUIImageView *)self overlayPlayButton];
  char v5 = [v4 isHidden];

  if ((v5 & 1) == 0)
  {
    BOOL v6 = [(SearchUIImageView *)self overlayPlayButton];
    [v6 setOverlayImage:v7];
  }
}

- (void)didFailToLoadImage
{
  id v3 = [(SearchUIImageView *)self fallbackImage];

  if (v3)
  {
    v4 = [(SearchUIImageView *)self overlayPlayButton];
    [v4 setHidden:1];

    char v5 = [(SearchUIImageView *)self currentImage];
    [v5 size];
    double v7 = v6;
    double v9 = v8;
    id v10 = [(SearchUIImageView *)self fallbackImage];
    objc_msgSend(v10, "setSize:", v7, v9);

    id v12 = [(SearchUIImageView *)self fallbackImage];
    char v11 = +[SearchUITLKImageConverter imageForSFImage:v12];
    [(TLKImageView *)self setTlkImage:v11];
  }
}

- (void)layoutSubviews
{
  v54.receiver = self;
  v54.super_class = (Class)SearchUIImageView;
  [(TLKImageView *)&v54 layoutSubviews];
  [(SearchUIImageView *)self frame];
  double v4 = v3;
  double v6 = v5;
  double v7 = [(SearchUIImageView *)self overlayPlayButton];
  [v7 intrinsicContentSize];
  double v9 = v8;
  double v11 = v10;

  objc_msgSend(MEMORY[0x1E4FAE100], "deviceScaledRoundedRect:forView:", self, (v4 - v9) * 0.5, (v6 - v11) * 0.5, v9, v11);
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  v20 = [(SearchUIImageView *)self overlayPlayButton];
  objc_msgSend(v20, "setFrame:", v13, v15, v17, v19);

  v21 = [(SearchUIImageView *)self currentImage];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v23 = [(SearchUIImageView *)self currentImage];
    int v24 = [v23 needsTinting];
    if (v24)
    {
      v25 = [(SearchUIImageView *)self tintView];

      if (!v25)
      {
        id v26 = objc_opt_new();
        [(SearchUIImageView *)self setTintView:v26];

        v27 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.4];
        v28 = [(SearchUIImageView *)self tintView];
        [v28 setBackgroundColor:v27];

        v29 = [(SearchUIImageView *)self tintView];
        v30 = [(TLKImageView *)self imageView];
        [(SearchUIImageView *)self insertSubview:v29 aboveSubview:v30];
      }
      v31 = [(TLKImageView *)self imageView];
      [v31 frame];
      double v33 = v32;
      double v35 = v34;
      double v37 = v36;
      double v39 = v38;
      v40 = [(SearchUIImageView *)self tintView];
      objc_msgSend(v40, "setFrame:", v33, v35, v37, v39);

      v41 = [(TLKImageView *)self imageView];
      v42 = [v41 layer];
      [v42 cornerRadius];
      double v44 = v43;
      v45 = [(SearchUIImageView *)self tintView];
      v46 = [v45 layer];
      [v46 setCornerRadius:v44];

      v47 = [(TLKImageView *)self imageView];
      v48 = [v47 layer];
      v49 = [v48 cornerCurve];
      v50 = [(SearchUIImageView *)self tintView];
      v51 = [v50 layer];
      [v51 setCornerCurve:v49];
    }
    uint64_t v52 = v24 ^ 1u;
  }
  else
  {
    uint64_t v52 = 1;
  }
  v53 = [(SearchUIImageView *)self tintView];
  [v53 setHidden:v52];
}

+ (id)thumbnailForRowModel:(id)a3
{
  id v3 = a3;
  double v4 = [v3 identifyingResult];
  double v5 = [v3 cardSection];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([v5 thumbnail], (double v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v7 = v6;
    double v8 = v7;
  }
  else
  {
    id v7 = [v4 thumbnail];
    double v8 = 0;
  }
  unsigned int v9 = [v3 useCompactVersionOfUI];
  double v10 = [v4 sectionBundleIdentifier];
  double v11 = +[SearchUIUtilities bundleIdentifierForApp:6];
  int v12 = [v10 isEqualToString:v11];

  int v13 = [v4 type];
  if (!v7 && ![v4 isLocalApplicationResult]
    || ((v13 != 8) & ~v12) == 0 && ((v9 ^ 1) & 1) == 0)
  {
    double v14 = [v4 applicationBundleIdentifier];
    double v15 = +[SearchUIUtilities bundleIdentifierForApp:11];
    if ([v14 isEqualToString:v15])
    {

LABEL_12:
      double v19 = [SearchUIMediaArtworkImage alloc];
      id v20 = [v4 identifier];
      v21 = [(SearchUIMediaArtworkImage *)v19 initWithSpotlightIdentifier:v20];
LABEL_13:
      v22 = v21;

      id v7 = v22;
      goto LABEL_14;
    }
    unsigned int v31 = v9;
    double v16 = [v4 applicationBundleIdentifier];
    +[SearchUIUtilities bundleIdentifierForApp:19];
    double v17 = v32 = v8;
    int v18 = [v16 isEqualToString:v17];

    double v8 = v32;
    if (v18) {
      goto LABEL_12;
    }
    if (v12)
    {
      int v24 = [v4 punchout];
      v25 = [v24 urls];
      id v26 = [v25 firstObject];
      v27 = v26;
      if (v26)
      {
        id v20 = v26;
      }
      else
      {
        v30 = [v5 punchoutOptions];
        v28 = [v30 firstObject];
        v29 = [v28 urls];
        id v20 = [v29 firstObject];

        double v8 = v32;
      }

      v21 = [[SearchUIQuickLookThumbnailImage alloc] initWithResult:v4 url:v20 isCompact:v31];
      goto LABEL_13;
    }
  }
LABEL_14:

  return v7;
}

- (SFImage)currentImage
{
  return self->_currentImage;
}

- (void)setCurrentImage:(id)a3
{
}

- (SearchUIButton)overlayPlayButton
{
  return self->_overlayPlayButton;
}

- (void)setOverlayPlayButton:(id)a3
{
}

- (SFImage)fallbackImage
{
  return self->_fallbackImage;
}

- (void)setFallbackImage:(id)a3
{
}

- (UIView)tintView
{
  return self->_tintView;
}

- (void)setTintView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintView, 0);
  objc_storeStrong((id *)&self->_fallbackImage, 0);
  objc_storeStrong((id *)&self->_overlayPlayButton, 0);
  objc_storeStrong((id *)&self->_currentImage, 0);
}

@end