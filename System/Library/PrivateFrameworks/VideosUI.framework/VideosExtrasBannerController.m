@interface VideosExtrasBannerController
- (IKDocumentBannerElement)bannerElement;
- (NSArray)installedConstraints;
- (NSLayoutConstraint)bannerImageViewHeightConstraint;
- (UIImageView)bannerImageView;
- (UIImageView)vignetteImageView;
- (UIScrollView)trackingScrollView;
- (UIView)installedView;
- (UIView)maskView;
- (VideosExtrasBannerController)initWithBannerElement:(id)a3;
- (unint64_t)vignetteType;
- (void)_configureBanner;
- (void)_doAllSetup;
- (void)_updateVignetteImage;
- (void)installBannerOnView:(id)a3 anchoredToScrollView:(id)a4;
- (void)setBannerImageView:(id)a3;
- (void)setBannerImageViewHeightConstraint:(id)a3;
- (void)setInstalledConstraints:(id)a3;
- (void)setInstalledView:(id)a3;
- (void)setMaskView:(id)a3;
- (void)setTrackingScrollView:(id)a3;
- (void)setVignetteImageView:(id)a3;
- (void)setVignetteType:(unint64_t)a3;
@end

@implementation VideosExtrasBannerController

- (VideosExtrasBannerController)initWithBannerElement:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VideosExtrasBannerController;
  v6 = [(VideosExtrasBannerController *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bannerElement, a3);
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4FB1EB0]) initForAutolayout];
    maskView = v7->_maskView;
    v7->_maskView = (UIView *)v8;

    v10 = v7->_maskView;
    v11 = [MEMORY[0x1E4FB1618] blackColor];
    [(UIView *)v10 setBackgroundColor:v11];
  }
  return v7;
}

- (void)_configureBanner
{
  v3 = [(IKDocumentBannerElement *)self->_bannerElement background];
  v4 = [v3 images];
  if ([v4 count])
  {
    id v5 = [v4 firstObject];
    v6 = [v5 artworkCatalog];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_installedView);
    [WeakRetained frame];
    objc_msgSend(v6, "setFittingSize:", v8, v9);

    bannerImageView = self->_bannerImageView;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __48__VideosExtrasBannerController__configureBanner__block_invoke;
    v11[3] = &unk_1E6DF9A60;
    v11[4] = self;
    [v6 setDestination:bannerImageView configurationBlock:v11];
  }
}

void __48__VideosExtrasBannerController__configureBanner__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v15 = a2;
  id v5 = a3;
  v6 = v5;
  if (v5)
  {
    [v5 size];
    double v9 = v8 / v7;
    BOOL v10 = v7 <= 0.0;
    double v11 = 1.0;
    if (!v10) {
      double v11 = v9;
    }
    uint64_t v12 = [MEMORY[0x1E4F28DC8] constraintWithItem:*(void *)(*(void *)(a1 + 32) + 48) attribute:8 relatedBy:0 toItem:*(void *)(*(void *)(a1 + 32) + 48) attribute:7 multiplier:v11 constant:0.0];
    uint64_t v13 = *(void *)(a1 + 32);
    v14 = *(void **)(v13 + 64);
    *(void *)(v13 + 64) = v12;

    [*(id *)(*(void *)(a1 + 32) + 64) setActive:1];
    [v15 setImage:v6];
  }
  else
  {
    [*(id *)(*(void *)(a1 + 32) + 64) setActive:0];
  }
}

- (void)_doAllSetup
{
  v38[4] = *MEMORY[0x1E4F143B8];
  if (self->_installedConstraints) {
    objc_msgSend(MEMORY[0x1E4F28DC8], "deactivateConstraints:");
  }
  v3 = [(UIImageView *)self->_bannerImageView superview];

  if (v3) {
    [(UIImageView *)self->_bannerImageView removeFromSuperview];
  }
  v4 = [(UIImageView *)self->_vignetteImageView superview];

  if (v4) {
    [(UIImageView *)self->_vignetteImageView removeFromSuperview];
  }
  id v5 = [(UIView *)self->_maskView superview];

  if (v5) {
    [(UIView *)self->_maskView removeFromSuperview];
  }
  v6 = [(VideosExtrasBannerController *)self trackingScrollView];
  double v7 = [(VideosExtrasBannerController *)self installedView];
  uint64_t v8 = [(VideosExtrasBannerController *)self maskView];
  double v9 = (UIImageView *)[objc_alloc(MEMORY[0x1E4FB1838]) initForAutolayout];
  bannerImageView = self->_bannerImageView;
  self->_bannerImageView = v9;

  LODWORD(v11) = 1132068864;
  [(UIImageView *)self->_bannerImageView setContentCompressionResistancePriority:0 forAxis:v11];
  LODWORD(v12) = 1132068864;
  [(UIImageView *)self->_bannerImageView setContentCompressionResistancePriority:1 forAxis:v12];
  [(UIImageView *)self->_bannerImageView setUserInteractionEnabled:0];
  uint64_t v13 = (UIImageView *)[objc_alloc(MEMORY[0x1E4FB1838]) initForAutolayout];
  vignetteImageView = self->_vignetteImageView;
  self->_vignetteImageView = v13;

  [(VideosExtrasBannerController *)self _updateVignetteImage];
  id v15 = [v6 superview];

  v16 = self->_bannerImageView;
  if (v15 == v7) {
    [v7 insertSubview:v16 belowSubview:v6];
  }
  else {
    [v7 addSubview:v16];
  }
  [v7 insertSubview:self->_vignetteImageView aboveSubview:self->_bannerImageView];
  [v7 insertSubview:v8 aboveSubview:self->_vignetteImageView];
  v17 = [(UIImageView *)self->_bannerImageView topAnchor];
  [v6 topAnchor];
  v18 = v6;
  v19 = v37 = v6;
  v36 = [v17 constraintEqualToAnchor:v19];

  uint64_t v20 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_bannerImageView attribute:3 relatedBy:-1 toItem:v7 attribute:3 multiplier:1.0 constant:0.0];
  double v21 = *MEMORY[0x1E4FB2848];
  double v22 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v23 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  double v24 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  v34 = objc_msgSend(MEMORY[0x1E4F28DC8], "constraintsByAttachingView:toView:alongEdges:insets:", self->_bannerImageView, v18, 10, *MEMORY[0x1E4FB2848], v22, v23, v24);
  v35 = (void *)v8;
  v33 = objc_msgSend(MEMORY[0x1E4F28DC8], "constraintsByAttachingView:toView:alongEdges:insets:", self->_vignetteImageView, self->_bannerImageView, 11, v21, v22, v23, v24);
  v25 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_vignetteImageView attribute:8 relatedBy:0 toItem:v7 attribute:8 multiplier:1.0 constant:0.0];
  v26 = [MEMORY[0x1E4F28DC8] constraintWithItem:v8 attribute:3 relatedBy:0 toItem:self->_vignetteImageView attribute:4 multiplier:1.0 constant:0.0];
  v27 = objc_msgSend(MEMORY[0x1E4F28DC8], "constraintsByAttachingView:toView:alongEdges:insets:", v8, v7, 14, v21, v22, v23, v24);
  v28 = [MEMORY[0x1E4F1CA48] array];
  [(NSArray *)v28 addObjectsFromArray:v34];
  [(NSArray *)v28 addObjectsFromArray:v33];
  [(NSArray *)v28 addObjectsFromArray:v27];
  v38[0] = v20;
  v38[1] = v25;
  v29 = (void *)v20;
  v38[2] = v36;
  v38[3] = v26;
  v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:4];
  [(NSArray *)v28 addObjectsFromArray:v30];

  installedConstraints = self->_installedConstraints;
  self->_installedConstraints = v28;
  v32 = v28;

  [MEMORY[0x1E4F28DC8] activateConstraints:v32];
  [(VideosExtrasBannerController *)self _configureBanner];
}

- (void)installBannerOnView:(id)a3 anchoredToScrollView:(id)a4
{
  p_trackingScrollView = &self->_trackingScrollView;
  id v7 = a3;
  objc_storeWeak((id *)p_trackingScrollView, a4);
  objc_storeWeak((id *)&self->_installedView, v7);

  [(VideosExtrasBannerController *)self _doAllSetup];
}

- (void)setVignetteType:(unint64_t)a3
{
  if (self->_vignetteType != a3)
  {
    self->_vignetteType = a3;
    [(VideosExtrasBannerController *)self _updateVignetteImage];
  }
}

- (void)_updateVignetteImage
{
  id v3 = +[VideosExtrasBackgroundViewController vignetteImageForType:self->_vignetteType];
  [(UIImageView *)self->_vignetteImageView setImage:v3];
}

- (IKDocumentBannerElement)bannerElement
{
  return self->_bannerElement;
}

- (unint64_t)vignetteType
{
  return self->_vignetteType;
}

- (UIView)installedView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_installedView);
  return (UIView *)WeakRetained;
}

- (void)setInstalledView:(id)a3
{
}

- (UIScrollView)trackingScrollView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_trackingScrollView);
  return (UIScrollView *)WeakRetained;
}

- (void)setTrackingScrollView:(id)a3
{
}

- (NSArray)installedConstraints
{
  return self->_installedConstraints;
}

- (void)setInstalledConstraints:(id)a3
{
}

- (UIImageView)bannerImageView
{
  return self->_bannerImageView;
}

- (void)setBannerImageView:(id)a3
{
}

- (UIImageView)vignetteImageView
{
  return self->_vignetteImageView;
}

- (void)setVignetteImageView:(id)a3
{
}

- (NSLayoutConstraint)bannerImageViewHeightConstraint
{
  return self->_bannerImageViewHeightConstraint;
}

- (void)setBannerImageViewHeightConstraint:(id)a3
{
}

- (UIView)maskView
{
  return self->_maskView;
}

- (void)setMaskView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maskView, 0);
  objc_storeStrong((id *)&self->_bannerImageViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_vignetteImageView, 0);
  objc_storeStrong((id *)&self->_bannerImageView, 0);
  objc_storeStrong((id *)&self->_installedConstraints, 0);
  objc_destroyWeak((id *)&self->_trackingScrollView);
  objc_destroyWeak((id *)&self->_installedView);
  objc_storeStrong((id *)&self->_bannerElement, 0);
}

@end