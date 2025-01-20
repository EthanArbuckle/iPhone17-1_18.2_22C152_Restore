@interface SBApplicationBlurSnapshotGenerationContainerView
- (UIView)liveBlurView;
- (UIView)realSnapshotView;
- (UIView)wallpaperView;
- (void)layoutSubviews;
- (void)setLiveBlurView:(id)a3;
- (void)setRealSnapshotView:(id)a3;
- (void)setWallpaperView:(id)a3;
@end

@implementation SBApplicationBlurSnapshotGenerationContainerView

- (void)layoutSubviews
{
  [(SBApplicationBlurSnapshotGenerationContainerView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id v13 = [(SBApplicationBlurSnapshotGenerationContainerView *)self wallpaperView];
  v11 = [(SBApplicationBlurSnapshotGenerationContainerView *)self realSnapshotView];
  v12 = [(SBApplicationBlurSnapshotGenerationContainerView *)self liveBlurView];
  objc_msgSend(v13, "setFrame:", v4, v6, v8, v10);
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);
  objc_msgSend(v12, "setFrame:", v4, v6, v8, v10);
}

- (UIView)wallpaperView
{
  return self->_wallpaperView;
}

- (void)setWallpaperView:(id)a3
{
}

- (UIView)realSnapshotView
{
  return self->_realSnapshotView;
}

- (void)setRealSnapshotView:(id)a3
{
}

- (UIView)liveBlurView
{
  return self->_liveBlurView;
}

- (void)setLiveBlurView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_liveBlurView, 0);
  objc_storeStrong((id *)&self->_realSnapshotView, 0);
  objc_storeStrong((id *)&self->_wallpaperView, 0);
}

@end