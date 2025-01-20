@interface PBFPosterGalleryPreviewContentView
- (CGRect)previewImageFrame;
- (PBFPosterGalleryPreviewContentView)initWithFrame:(CGRect)a3;
- (UIView)contentContainerView;
- (UIView)contentView;
- (UIView)posterPreviewView;
- (void)_createHiddenViewsIfNeeded;
- (void)_updateHiddenImages;
- (void)layoutSubviews;
- (void)prepareForFullScreenTransitionWithContentView:(id)a3;
- (void)prepareForReuse;
- (void)setContentContainerView:(id)a3;
- (void)setContentView:(id)a3;
- (void)setPosterPreviewView:(id)a3;
- (void)updatePreviewType:(id)a3 scale:(double)a4 posterPreviewView:(id)a5 layoutOrientation:(int64_t)a6 index:(unint64_t)a7;
@end

@implementation PBFPosterGalleryPreviewContentView

- (PBFPosterGalleryPreviewContentView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PBFPosterGalleryPreviewContentView;
  v3 = -[PBFPosterGalleryPreviewContentView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = objc_opt_new();
    contentContainerView = v3->_contentContainerView;
    v3->_contentContainerView = (UIView *)v4;

    [(UIView *)v3->_contentContainerView setClipsToBounds:1];
    [(UIView *)v3->_contentContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
    v6 = v3->_contentContainerView;
    v7 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
    [(UIView *)v6 setBackgroundColor:v7];

    [(PBFPosterGalleryPreviewContentView *)v3 addSubview:v3->_contentContainerView];
  }
  return v3;
}

- (void)prepareForReuse
{
  if ([(UIView *)self->_fullScreenTransitionView isDescendantOfView:self]) {
    [(UIView *)self->_fullScreenTransitionView removeFromSuperview];
  }
  fullScreenTransitionView = self->_fullScreenTransitionView;
  self->_fullScreenTransitionView = 0;
}

- (void)updatePreviewType:(id)a3 scale:(double)a4 posterPreviewView:(id)a5 layoutOrientation:(int64_t)a6 index:(unint64_t)a7
{
  v13 = (NSString *)a3;
  id v12 = a5;
  if (self->_previewType != v13
    || !BSEqualObjects()
    || self->_layoutOrientation != a6
    || self->_index != a7)
  {
    objc_storeStrong((id *)&self->_previewType, a3);
    [(PBFPosterGalleryPreviewContentView *)self setPosterPreviewView:v12];
    self->_layoutOrientation = a6;
    self->_index = a7;
    [(PBFPosterGalleryPreviewContentView *)self _createHiddenViewsIfNeeded];
    [(PBFPosterGalleryPreviewContentView *)self invalidateIntrinsicContentSize];
    [(PBFPosterGalleryPreviewContentView *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  v35.receiver = self;
  v35.super_class = (Class)PBFPosterGalleryPreviewContentView;
  [(PBFPosterGalleryPreviewContentView *)&v35 layoutSubviews];
  [(PBFPosterGalleryPreviewContentView *)self bounds];
  double v6 = v5;
  double v8 = v7;
  if (v3 != *MEMORY[0x1E4F1DB30] || v4 != *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    double v10 = v3;
    double v11 = v4;
    id v12 = [(PBFPosterGalleryPreviewContentView *)self traitCollection];
    [v12 displayScale];

    previewType = (__CFString *)self->_previewType;
    v14 = PBFPreviewTypeSmartAlbum;
    double v15 = v11;
    v16 = PBFPreviewTypeHero;
    double v17 = v10;
    double v18 = v8;
    double v19 = v6;
    if (previewType == PBFPreviewTypeSmartAlbum)
    {
      UIRectRoundToScale();
      double v19 = v20;
      double v18 = v21;
      double v17 = v22;
      double v15 = v23;
    }
    v24 = [(PBFPosterGalleryPreviewContentView *)self window];
    v25 = [v24 screen];
    v26 = +[PBFPosterGalleryViewSpec specForScreen:v25];

    [v26 posterCornerRadius];
    double v34 = v27;
    -[UIView setFrame:](self->_contentContainerView, "setFrame:", v19, v18, v17, v15);
    portalView = self->_portalView;
    [(UIView *)self->_contentContainerView bounds];
    -[_UIPortalView setFrame:](portalView, "setFrame:");
    fullScreenTransitionView = self->_fullScreenTransitionView;
    [(UIView *)self->_contentContainerView bounds];
    -[UIView setFrame:](fullScreenTransitionView, "setFrame:");
    if (self->_fullScreenTransitionView) {
      -[UIView bringSubviewToFront:](self->_contentContainerView, "bringSubviewToFront:");
    }
    if (previewType == v14)
    {
      -[UIImageView setFrame:](self->_frontHiddenImageView, "setFrame:", v6, v8, v10, v11);
      UIRectRoundToScale();
      -[UIImageView setFrame:](self->_frontHiddenImageView, "setFrame:");
      [(UIImageView *)self->_frontHiddenImageView _setContinuousCornerRadius:v34 * 0.839999974];
      UIRectRoundToScale();
      -[UIImageView setFrame:](self->_backHiddenImageView, "setFrame:");
      [(UIImageView *)self->_backHiddenImageView _setContinuousCornerRadius:v34 * 0.720000029];
      contentContainerView = self->_contentContainerView;
      double v31 = v34 * 0.964999974;
    }
    else
    {
      v30 = self->_contentContainerView;
      if (previewType == v16)
      {
        [v26 posterHeroContentSize];
        [(UIView *)v30 _setCornerRadius:v33 * 0.5];
        goto LABEL_15;
      }
      [v26 posterCornerRadius];
      contentContainerView = v30;
    }
    [(UIView *)contentContainerView _setContinuousCornerRadius:v31];
LABEL_15:
  }
}

- (void)setPosterPreviewView:(id)a3
{
  uint64_t v5 = (uint64_t)a3;
  p_posterPreviewView = &self->_posterPreviewView;
  if (self->_posterPreviewView != (UIView *)v5)
  {
    double v11 = (void *)v5;
    objc_storeStrong((id *)&self->_posterPreviewView, a3);
    double v7 = [v11 accessibilityIdentifier];
    [(PBFPosterGalleryPreviewContentView *)self setAccessibilityIdentifier:v7];

    portalView = self->_portalView;
    if (portalView)
    {
      [(_UIPortalView *)portalView setSourceView:v11];
    }
    else
    {
      objc_super v9 = (_UIPortalView *)[objc_alloc(MEMORY[0x1E4FB2248]) initWithSourceView:v11];
      double v10 = self->_portalView;
      self->_portalView = v9;

      [(_UIPortalView *)self->_portalView setHidesSourceView:0];
      [(_UIPortalView *)self->_portalView setMatchesPosition:0];
      [(_UIPortalView *)self->_portalView setMatchesTransform:0];
      [(_UIPortalView *)self->_portalView setAllowsBackdropGroups:1];
      [(UIView *)self->_contentContainerView addSubview:self->_portalView];
    }
    uint64_t v5 = (uint64_t)*p_posterPreviewView;
    if (*p_posterPreviewView)
    {
      if (self->_portalView)
      {
        uint64_t v5 = objc_msgSend((id)v5, "isHidden", v11);
        if ((v5 & 1) == 0)
        {
          [(PBFPosterGalleryPreviewContentView *)self setNeedsLayout];
          uint64_t v5 = [(PBFPosterGalleryPreviewContentView *)self layoutIfNeeded];
        }
      }
    }
  }
  MEMORY[0x1F4181820](v5);
}

- (void)prepareForFullScreenTransitionWithContentView:(id)a3
{
  p_fullScreenTransitionView = &self->_fullScreenTransitionView;
  objc_storeStrong((id *)&self->_fullScreenTransitionView, a3);
  id v7 = a3;
  double v6 = *p_fullScreenTransitionView;
  [(UIView *)self->_contentContainerView bounds];
  -[UIView setFrame:](v6, "setFrame:");
  [(UIView *)self->_contentContainerView addSubview:v7];
}

- (CGRect)previewImageFrame
{
  [(UIView *)self->_contentContainerView frame];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (UIView)contentView
{
  return self->_fullScreenTransitionView;
}

- (void)_createHiddenViewsIfNeeded
{
  if ((__CFString *)self->_previewType == PBFPreviewTypeSmartAlbum)
  {
    double v5 = [(PBFPosterGalleryPreviewContentView *)self window];
    double v6 = [v5 screen];
    v13 = +[PBFPosterGalleryViewSpec specForScreen:v6];

    if (!self->_frontHiddenImageView)
    {
      id v7 = (UIImageView *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:0];
      frontHiddenImageView = self->_frontHiddenImageView;
      self->_frontHiddenImageView = v7;

      [(UIImageView *)self->_frontHiddenImageView setContentMode:0];
      [(UIImageView *)self->_frontHiddenImageView setClipsToBounds:1];
      objc_super v9 = self->_frontHiddenImageView;
      [(UIImageView *)v13 posterCornerRadius];
      -[UIImageView _setContinuousCornerRadius:](v9, "_setContinuousCornerRadius:");
      [(UIImageView *)self->_frontHiddenImageView setTranslatesAutoresizingMaskIntoConstraints:0];
      [(PBFPosterGalleryPreviewContentView *)self insertSubview:self->_frontHiddenImageView belowSubview:self->_contentContainerView];
    }
    if (!self->_backHiddenImageView)
    {
      double v10 = (UIImageView *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:0];
      backHiddenImageView = self->_backHiddenImageView;
      self->_backHiddenImageView = v10;

      [(UIImageView *)self->_backHiddenImageView setContentMode:0];
      [(UIImageView *)self->_backHiddenImageView setClipsToBounds:1];
      id v12 = self->_backHiddenImageView;
      [(UIImageView *)v13 posterCornerRadius];
      -[UIImageView _setContinuousCornerRadius:](v12, "_setContinuousCornerRadius:");
      [(UIImageView *)self->_backHiddenImageView setTranslatesAutoresizingMaskIntoConstraints:0];
      [(UIImageView *)self->_backHiddenImageView setAlpha:0.959999979];
      [(PBFPosterGalleryPreviewContentView *)self insertSubview:self->_backHiddenImageView belowSubview:self->_frontHiddenImageView];
    }
    [(PBFPosterGalleryPreviewContentView *)self _updateHiddenImages];
    double v4 = v13;
  }
  else
  {
    [(UIImageView *)self->_frontHiddenImageView removeFromSuperview];
    double v3 = self->_frontHiddenImageView;
    self->_frontHiddenImageView = 0;

    [(UIImageView *)self->_backHiddenImageView removeFromSuperview];
    double v4 = self->_backHiddenImageView;
    self->_backHiddenImageView = 0;
  }
}

- (void)_updateHiddenImages
{
  unint64_t v3 = 2 * self->_index % 6;
  id v11 = (id)objc_msgSend([NSString alloc], "initWithFormat:", @"shuffle-top-%tu", v3 | 1);
  double v4 = (void *)MEMORY[0x1E4FB1818];
  double v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  double v6 = [v4 imageNamed:v11 inBundle:v5 compatibleWithTraitCollection:0];

  if (v6) {
    [(UIImageView *)self->_frontHiddenImageView setImage:v6];
  }
  id v7 = objc_msgSend([NSString alloc], "initWithFormat:", @"shuffle-top-%tu", v3 + 2);
  double v8 = (void *)MEMORY[0x1E4FB1818];
  objc_super v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  double v10 = [v8 imageNamed:v7 inBundle:v9 compatibleWithTraitCollection:0];

  if (v10) {
    [(UIImageView *)self->_backHiddenImageView setImage:v10];
  }
}

- (UIView)contentContainerView
{
  return self->_contentContainerView;
}

- (void)setContentContainerView:(id)a3
{
}

- (UIView)posterPreviewView
{
  return self->_posterPreviewView;
}

- (void)setContentView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_posterPreviewView, 0);
  objc_storeStrong((id *)&self->_previewType, 0);
  objc_storeStrong((id *)&self->_fullScreenTransitionView, 0);
  objc_storeStrong((id *)&self->_portalView, 0);
  objc_storeStrong((id *)&self->_backHiddenImageView, 0);
  objc_storeStrong((id *)&self->_frontHiddenImageView, 0);
  objc_storeStrong((id *)&self->_contentContainerView, 0);
}

@end