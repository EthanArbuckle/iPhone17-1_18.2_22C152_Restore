@interface VideosExtrasConstrainedArtworkContainerView
- (BOOL)shouldAutoresizeMaskLayerToFillBounds;
- (BOOL)shouldBottomAlignArtwork;
- (MPUArtworkView)artworkView;
- (NSArray)overlaySizeConstraints;
- (UIImage)overlayImage;
- (UIImageView)overlayView;
- (VideosExtrasConstrainedArtworkContainerView)initWithFrame:(CGRect)a3;
- (double)overlayScale;
- (void)layoutSubviews;
- (void)setArtworkView:(id)a3;
- (void)setOverlayImage:(id)a3;
- (void)setOverlayScale:(double)a3;
- (void)setOverlaySizeConstraints:(id)a3;
- (void)setOverlayView:(id)a3;
- (void)setShouldAutoresizeMaskLayerToFillBounds:(BOOL)a3;
- (void)setShouldBottomAlignArtwork:(BOOL)a3;
@end

@implementation VideosExtrasConstrainedArtworkContainerView

- (VideosExtrasConstrainedArtworkContainerView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)VideosExtrasConstrainedArtworkContainerView;
  v3 = -[VideosExtrasConstrainedArtworkContainerView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [VideosExtrasArtworkLayoutTriggeringView alloc];
    [(VideosExtrasConstrainedArtworkContainerView *)v3 bounds];
    v5 = -[MPUArtworkView initWithFrame:](v4, "initWithFrame:");
    [(VideosExtrasConstrainedArtworkContainerView *)v3 addSubview:v5];
    [(VideosExtrasConstrainedArtworkContainerView *)v3 setArtworkView:v5];
    id v6 = objc_alloc_init(MEMORY[0x1E4FB1838]);
    [v6 setContentMode:1];
    [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(VideosExtrasConstrainedArtworkContainerView *)v3 addSubview:v6];
    [(VideosExtrasConstrainedArtworkContainerView *)v3 setOverlayView:v6];
  }
  return v3;
}

- (void)layoutSubviews
{
  v38.receiver = self;
  v38.super_class = (Class)VideosExtrasConstrainedArtworkContainerView;
  [(VideosExtrasConstrainedArtworkContainerView *)&v38 layoutSubviews];
  [(VideosExtrasConstrainedArtworkContainerView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(VideosExtrasConstrainedArtworkContainerView *)self artworkView];
  v12 = [v11 image];
  [v12 size];
  double v14 = v13;
  double v16 = v15;

  int v17 = MPUFloatLessThanOrEqualToFloat();
  if (v8 >= 1.0) {
    double v18 = v8;
  }
  else {
    double v18 = 1.0;
  }
  if (v17) {
    double v14 = v18;
  }
  int v19 = MPUFloatLessThanOrEqualToFloat();
  if (v10 >= 1.0) {
    double v20 = v10;
  }
  else {
    double v20 = 1.0;
  }
  if (!v19) {
    double v20 = v16;
  }
  double v21 = v8 / v14;
  if (v8 / v14 >= v10 / v20) {
    double v21 = v10 / v20;
  }
  objc_msgSend(v11, "setBounds:", 0.0, 0.0, v14 * v21, v20 * v21);
  v39.origin.x = v4;
  v39.origin.y = v6;
  v39.size.width = v8;
  v39.size.height = v10;
  double MidY = CGRectGetMidY(v39);
  if ([(VideosExtrasConstrainedArtworkContainerView *)self shouldBottomAlignArtwork])
  {
    v40.origin.x = v4;
    v40.origin.y = v6;
    v40.size.width = v8;
    v40.size.height = v10;
    double MaxY = CGRectGetMaxY(v40);
    [v11 bounds];
    double MidY = MaxY + CGRectGetHeight(v41) * -0.5;
  }
  v42.origin.x = v4;
  v42.origin.y = v6;
  v42.size.width = v8;
  v42.size.height = v10;
  double MidX = CGRectGetMidX(v42);
  objc_msgSend(v11, "setCenter:", MidX, MidY);
  if (self->_overlayImage
    && ([v11 image], (uint64_t v25 = objc_claimAutoreleasedReturnValue()) != 0)
    && (v26 = (void *)v25, char v27 = [v11 isDisplayingPlaceholder], v26, (v27 & 1) == 0))
  {
    [v11 bounds];
    double v32 = v31;
    [v11 bounds];
    if (v32 >= v33) {
      double v34 = v33;
    }
    else {
      double v34 = v32;
    }
    double v35 = self->_overlayScale * v34;
    v29 = [(VideosExtrasConstrainedArtworkContainerView *)self overlayView];
    objc_msgSend(v29, "setBounds:", 0.0, 0.0, v35, v35);
    objc_msgSend(v29, "setCenter:", MidX, MidY);
    v28 = v29;
    uint64_t v30 = 0;
  }
  else
  {
    v28 = [(VideosExtrasConstrainedArtworkContainerView *)self overlayView];
    v29 = v28;
    uint64_t v30 = 1;
  }
  [v28 setHidden:v30];

  if ([(VideosExtrasConstrainedArtworkContainerView *)self shouldAutoresizeMaskLayerToFillBounds])
  {
    v36 = [(VideosExtrasConstrainedArtworkContainerView *)self layer];
    v37 = [v36 mask];
    [v36 bounds];
    objc_msgSend(v37, "setFrame:");
  }
}

- (void)setOverlayImage:(id)a3
{
  double v5 = (UIImage *)a3;
  if (self->_overlayImage != v5)
  {
    double v7 = v5;
    objc_storeStrong((id *)&self->_overlayImage, a3);
    CGFloat v6 = [(VideosExtrasConstrainedArtworkContainerView *)self overlayView];
    [v6 setImage:self->_overlayImage];
    [(VideosExtrasConstrainedArtworkContainerView *)self setNeedsLayout];

    double v5 = v7;
  }
}

- (void)setOverlayScale:(double)a3
{
  if (self->_overlayScale != a3)
  {
    if (a3 == 0.0) {
      a3 = 1.0;
    }
    self->_overlayScale = a3;
    [(VideosExtrasConstrainedArtworkContainerView *)self setNeedsLayout];
  }
}

- (MPUArtworkView)artworkView
{
  return self->_artworkView;
}

- (void)setArtworkView:(id)a3
{
}

- (BOOL)shouldAutoresizeMaskLayerToFillBounds
{
  return self->_shouldAutoresizeMaskLayerToFillBounds;
}

- (void)setShouldAutoresizeMaskLayerToFillBounds:(BOOL)a3
{
  self->_shouldAutoresizeMaskLayerToFillBounds = a3;
}

- (BOOL)shouldBottomAlignArtwork
{
  return self->_shouldBottomAlignArtwork;
}

- (void)setShouldBottomAlignArtwork:(BOOL)a3
{
  self->_shouldBottomAlignArtwork = a3;
}

- (UIImage)overlayImage
{
  return self->_overlayImage;
}

- (double)overlayScale
{
  return self->_overlayScale;
}

- (UIImageView)overlayView
{
  return self->_overlayView;
}

- (void)setOverlayView:(id)a3
{
}

- (NSArray)overlaySizeConstraints
{
  return self->_overlaySizeConstraints;
}

- (void)setOverlaySizeConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlaySizeConstraints, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_overlayImage, 0);
  objc_storeStrong((id *)&self->_artworkView, 0);
}

@end