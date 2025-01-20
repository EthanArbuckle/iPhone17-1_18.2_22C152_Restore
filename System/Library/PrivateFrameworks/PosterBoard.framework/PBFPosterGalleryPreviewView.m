@interface PBFPosterGalleryPreviewView
- (BOOL)showsLoadingIndicator;
- (CGRect)posterPreviewFrame;
- (CGSize)intrinsicContentSize;
- (NSString)previewType;
- (PBFPosterGalleryPreviewComplicationContentView)complicationContentView;
- (PBFPosterGalleryPreviewView)initWithFrame:(CGRect)a3;
- (UIView)contentView;
- (UIView)posterPreviewView;
- (double)posterPreviewScale;
- (id)makeComplicationsPortalView;
- (id)pbf_displayContext;
- (int64_t)layoutOrientation;
- (unint64_t)index;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)prepareForFullScreenTransitionWithContentView:(id)a3;
- (void)prepareForReuse;
- (void)setShowsLoadingIndicator:(BOOL)a3;
- (void)sizeToFit;
- (void)updatePreviewType:(id)a3 scale:(double)a4 posterPreviewView:(id)a5 layoutOrientation:(int64_t)a6 index:(unint64_t)a7;
@end

@implementation PBFPosterGalleryPreviewView

- (PBFPosterGalleryPreviewView)initWithFrame:(CGRect)a3
{
  v21.receiver = self;
  v21.super_class = (Class)PBFPosterGalleryPreviewView;
  v3 = -[PBFPosterGalleryPreviewView initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(PBFPosterGalleryPreviewView *)v3 window];
    v6 = [v5 screen];
    v7 = +[PBFPosterGalleryViewSpec specForScreen:v6];
    [v7 posterCornerRadius];
    double v9 = v8;

    v10 = objc_alloc_init(PBFPosterGalleryPreviewContentView);
    posterPreviewContentView = v4->_posterPreviewContentView;
    v4->_posterPreviewContentView = v10;

    v12 = objc_alloc_init(PBFShadowView);
    shadowView = v4->_shadowView;
    v4->_shadowView = v12;

    [(PBFShadowView *)v4->_shadowView setCornerRadius:v9];
    [(PBFShadowView *)v4->_shadowView setShadowType:2];
    v14 = [[PBFPosterGalleryShadowContainerView alloc] initWithContentView:v4->_posterPreviewContentView shadowView:v4->_shadowView perspectiveEnabled:0];
    shadowContainerView = v4->_shadowContainerView;
    v4->_shadowContainerView = v14;

    v16 = v4->_shadowContainerView;
    [(PBFPosterGalleryPreviewView *)v4 bounds];
    -[PBFPosterGalleryShadowContainerView setFrame:](v16, "setFrame:");
    [(PBFPosterGalleryPreviewView *)v4 addSubview:v4->_shadowContainerView];
    v17 = [PBFPosterGalleryPreviewComplicationContentView alloc];
    [(PBFPosterGalleryPreviewView *)v4 bounds];
    uint64_t v18 = -[PBFPosterGalleryPreviewComplicationContentView initWithFrame:](v17, "initWithFrame:");
    posterPreviewComplicationContentView = v4->_posterPreviewComplicationContentView;
    v4->_posterPreviewComplicationContentView = (PBFPosterGalleryPreviewComplicationContentView *)v18;

    [(PBFPosterGalleryPreviewComplicationContentView *)v4->_posterPreviewComplicationContentView setPreferredCornerRadius:v9 != 0.0];
    [(PBFPosterGalleryPreviewView *)v4 addSubview:v4->_posterPreviewComplicationContentView];
  }
  return v4;
}

- (void)prepareForReuse
{
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  long long v8 = *MEMORY[0x1E4F1DAB8];
  long long v9 = v3;
  long long v10 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [(PBFPosterGalleryPreviewView *)self setTransform:&v8];
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
  long long v12 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
  long long v13 = v4;
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
  long long v14 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
  long long v15 = v5;
  long long v6 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
  long long v8 = *MEMORY[0x1E4F39B10];
  long long v9 = v6;
  long long v7 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
  long long v10 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
  long long v11 = v7;
  [(PBFPosterGalleryPreviewView *)self setTransform3D:&v8];
  self->_posterPreviewScale = 1.0;
  self->_layoutOrientation = 1;
  [(PBFPosterGalleryPreviewContentView *)self->_posterPreviewContentView prepareForReuse];
}

- (void)didMoveToWindow
{
  v14.receiver = self;
  v14.super_class = (Class)PBFPosterGalleryPreviewView;
  [(PBFPosterGalleryPreviewView *)&v14 didMoveToWindow];
  long long v3 = [(PBFPosterGalleryPreviewView *)self window];
  long long v4 = [v3 screen];
  long long v5 = +[PBFPosterGalleryViewSpec specForScreen:v4];
  [v5 posterCornerRadius];
  double v7 = v6;

  double v8 = v7;
  if ((__CFString *)self->_previewType == PBFPreviewTypeHero)
  {
    long long v9 = [(PBFPosterGalleryPreviewView *)self window];
    long long v10 = [v9 screen];
    long long v11 = +[PBFPosterGalleryViewSpec specForScreen:v10];
    [v11 posterHeroContentSize];
    double v13 = v12;

    double v8 = v13 / 7.0;
  }
  [(PBFShadowView *)self->_shadowView setCornerRadius:v8];
  [(PBFPosterGalleryPreviewComplicationContentView *)self->_posterPreviewComplicationContentView setPreferredCornerRadius:v7 != 0.0];
}

- (void)prepareForFullScreenTransitionWithContentView:(id)a3
{
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)PBFPosterGalleryPreviewView;
  [(PBFPosterGalleryPreviewView *)&v5 layoutSubviews];
  shadowContainerView = self->_shadowContainerView;
  [(PBFPosterGalleryPreviewView *)self bounds];
  -[PBFPosterGalleryShadowContainerView setFrame:](shadowContainerView, "setFrame:");
  posterPreviewComplicationContentView = self->_posterPreviewComplicationContentView;
  [(PBFPosterGalleryPreviewView *)self bounds];
  -[PBFPosterGalleryPreviewComplicationContentView setFrame:](posterPreviewComplicationContentView, "setFrame:");
}

- (void)sizeToFit
{
  [(PBFPosterGalleryPreviewView *)self frame];
  double v4 = v3;
  double v6 = v5;
  [(PBFPosterGalleryPreviewView *)self intrinsicContentSize];
  -[PBFPosterGalleryPreviewView setFrame:](self, "setFrame:", v4, v6, v7, v8);
}

- (CGSize)intrinsicContentSize
{
  double v3 = [(PBFPosterGalleryPreviewView *)self window];
  double v4 = [v3 screen];
  double v5 = +[PBFPosterGalleryViewSpec specForScreen:v4];

  if ((__CFString *)self->_previewType == PBFPreviewTypeHero) {
    [v5 posterHeroContentSize];
  }
  else {
    objc_msgSend(v5, "posterContentSizeForOrientation:", -[PBFPosterGalleryPreviewView layoutOrientation](self, "layoutOrientation"));
  }
  double v8 = v6;
  double v9 = v7;
  [(PBFPosterGalleryPreviewView *)self posterPreviewScale];
  double v11 = v8 * v10;
  [(PBFPosterGalleryPreviewView *)self posterPreviewScale];
  double v13 = v9 * v12;

  double v14 = v11;
  double v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

- (void)updatePreviewType:(id)a3 scale:(double)a4 posterPreviewView:(id)a5 layoutOrientation:(int64_t)a6 index:(unint64_t)a7
{
  double v15 = (NSString *)a3;
  id v12 = a5;
  [(PBFPosterGalleryPreviewContentView *)self->_posterPreviewContentView updatePreviewType:v15 scale:v12 posterPreviewView:a6 layoutOrientation:a7 index:a4];
  if (self->_layoutOrientation != a6) {
    goto LABEL_6;
  }
  id v13 = [(PBFPosterGalleryPreviewContentView *)self->_posterPreviewContentView posterPreviewView];
  if (v13 != v12 || !BSFloatEqualToFloat() || self->_previewType != v15)
  {

LABEL_6:
    self->_previewType = v15;
    self->_posterPreviewScale = a4;
    self->_layoutOrientation = a6;
    self->_unint64_t index = a7;
    [(PBFPosterGalleryPreviewComplicationContentView *)self->_posterPreviewComplicationContentView setLayoutOrientation:a6];
    [(PBFPosterGalleryPreviewView *)self invalidateIntrinsicContentSize];
    [(PBFPosterGalleryPreviewView *)self setNeedsLayout];
    goto LABEL_7;
  }
  unint64_t index = self->_index;

  if (index != a7) {
    goto LABEL_6;
  }
LABEL_7:
}

- (CGRect)posterPreviewFrame
{
  [(PBFPosterGalleryPreviewContentView *)self->_posterPreviewContentView previewImageFrame];
  posterPreviewContentView = self->_posterPreviewContentView;
  -[PBFPosterGalleryPreviewView convertRect:fromView:](self, "convertRect:fromView:", posterPreviewContentView);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (void)setShowsLoadingIndicator:(BOOL)a3
{
  v37[6] = *MEMORY[0x1E4F143B8];
  if (self->_showsLoadingIndicator != a3)
  {
    self->_showsLoadingIndicator = a3;
    if (a3)
    {
      id v4 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
      double v5 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.4];
      [v4 setBackgroundColor:v5];

      double v6 = [v4 layer];
      [v6 setCompositingFilter:*MEMORY[0x1E4F3A308]];

      [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
      double v7 = (void *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
      double v8 = [MEMORY[0x1E4FB1618] whiteColor];
      [v7 setColor:v8];

      [v7 startAnimating];
      [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
      [v4 addSubview:v7];
      [v4 setAlpha:0.0];
      [(PBFPosterGalleryPreviewView *)self addSubview:v4];
      v25 = (void *)MEMORY[0x1E4F28DC8];
      v34 = v7;
      v33 = [v7 centerXAnchor];
      v32 = [v4 centerXAnchor];
      v31 = [v33 constraintEqualToAnchor:v32];
      v37[0] = v31;
      v30 = [v7 centerYAnchor];
      v29 = [v4 centerYAnchor];
      v28 = [v30 constraintEqualToAnchor:v29];
      v37[1] = v28;
      v27 = [v4 topAnchor];
      v26 = [(PBFPosterGalleryPreviewView *)self topAnchor];
      v24 = [v27 constraintEqualToAnchor:v26];
      v37[2] = v24;
      v23 = [v4 bottomAnchor];
      v22 = [(PBFPosterGalleryPreviewView *)self bottomAnchor];
      double v9 = [v23 constraintEqualToAnchor:v22];
      v37[3] = v9;
      double v10 = [v4 leadingAnchor];
      double v11 = [(PBFPosterGalleryPreviewView *)self leadingAnchor];
      id v12 = [v10 constraintEqualToAnchor:v11];
      v37[4] = v12;
      id v13 = [v4 trailingAnchor];
      double v14 = [(PBFPosterGalleryPreviewView *)self trailingAnchor];
      double v15 = [v13 constraintEqualToAnchor:v14];
      v37[5] = v15;
      v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:6];
      [v25 activateConstraints:v16];

      v17 = (void *)MEMORY[0x1E4FB1EB0];
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __56__PBFPosterGalleryPreviewView_setShowsLoadingIndicator___block_invoke;
      v35[3] = &unk_1E69808C0;
      uint64_t v18 = (UIView *)v4;
      v36 = v18;
      [v17 animateWithDuration:v35 animations:0.2];
      loadingIndicatorContainerView = self->_loadingIndicatorContainerView;
      self->_loadingIndicatorContainerView = v18;
      v20 = v18;
    }
    else
    {
      [(UIView *)self->_loadingIndicatorContainerView removeFromSuperview];
      objc_super v21 = self->_loadingIndicatorContainerView;
      self->_loadingIndicatorContainerView = 0;
    }
  }
}

uint64_t __56__PBFPosterGalleryPreviewView_setShowsLoadingIndicator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

- (id)pbf_displayContext
{
  v6.receiver = self;
  v6.super_class = (Class)PBFPosterGalleryPreviewView;
  double v3 = [(UIView *)&v6 pbf_displayContext];
  id v4 = objc_msgSend(v3, "displayContextWithUpdatedInterfaceOrientation:", -[PBFPosterGalleryPreviewView layoutOrientation](self, "layoutOrientation"));

  return v4;
}

- (id)makeComplicationsPortalView
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4FB2248]) initWithSourceView:self->_posterPreviewComplicationContentView];
  [v2 setHidesSourceView:0];
  [v2 setMatchesPosition:0];
  [v2 setMatchesTransform:0];
  [v2 setAllowsBackdropGroups:1];
  return v2;
}

- (UIView)contentView
{
  return [(PBFPosterGalleryPreviewContentView *)self->_posterPreviewContentView contentView];
}

- (int64_t)layoutOrientation
{
  return self->_layoutOrientation;
}

- (PBFPosterGalleryPreviewComplicationContentView)complicationContentView
{
  return self->_posterPreviewComplicationContentView;
}

- (unint64_t)index
{
  return self->_index;
}

- (NSString)previewType
{
  return self->_previewType;
}

- (double)posterPreviewScale
{
  return self->_posterPreviewScale;
}

- (UIView)posterPreviewView
{
  return self->_posterPreviewView;
}

- (BOOL)showsLoadingIndicator
{
  return self->_showsLoadingIndicator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_posterPreviewView, 0);
  objc_storeStrong((id *)&self->_loadingIndicatorContainerView, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_shadowContainerView, 0);
  objc_storeStrong((id *)&self->_posterPreviewContentView, 0);
  objc_storeStrong((id *)&self->_posterPreviewComplicationContentView, 0);
}

@end