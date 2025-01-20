@interface PLCropOverlayBottomBar
- (BOOL)_isEditingStyle:(int64_t)a3;
- (BOOL)isInPopover;
- (BOOL)isPlayingVideo;
- (PLCropOverlayBottomBar)initWithCoder:(id)a3;
- (PLCropOverlayBottomBar)initWithFrame:(CGRect)a3;
- (PLCropOverlayPreviewBottomBar)previewBottomBar;
- (PLCropOverlayWallpaperBottomBar)wallpaperBottomBar;
- (UIView)cameraBottomBar;
- (int64_t)style;
- (void)_commonPLCropOverlayBottomBarInitialization;
- (void)_updateBottomBars;
- (void)_updatePreviewBottomBarForPlaybackState;
- (void)_updateStyle;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setCameraBottomBar:(id)a3;
- (void)setInPopover:(BOOL)a3;
- (void)setPlayingVideo:(BOOL)a3;
- (void)setPreviewBottomBar:(id)a3;
- (void)setStyle:(int64_t)a3;
- (void)setStyle:(int64_t)a3 animated:(BOOL)a4;
- (void)setWallpaperBottomBar:(id)a3;
- (void)togglePlaybackState;
@end

@implementation PLCropOverlayBottomBar

- (BOOL)isInPopover
{
  return self->_inPopover;
}

- (BOOL)isPlayingVideo
{
  return self->_playingVideo;
}

- (PLCropOverlayWallpaperBottomBar)wallpaperBottomBar
{
  return self->_wallpaperBottomBar;
}

- (PLCropOverlayPreviewBottomBar)previewBottomBar
{
  return self->_previewBottomBar;
}

- (UIView)cameraBottomBar
{
  return self->_cameraBottomBar;
}

- (int64_t)style
{
  return self->_style;
}

- (void)_updateStyle
{
  double v3 = 0.0;
  if (self->_style) {
    double v4 = 0.0;
  }
  else {
    double v4 = 1.0;
  }
  if (-[PLCropOverlayBottomBar _isEditingStyle:](self, "_isEditingStyle:")) {
    double v3 = 1.0;
  }
  [(UIView *)self->_cameraBottomBar setAlpha:v4];
  [(PLCropOverlayPreviewBottomBar *)self->_previewBottomBar setAlpha:v3];
  int64_t style = self->_style;
  v6 = [(PLCropOverlayPreviewBottomBar *)self->_previewBottomBar playbackButton];
  if (style == 2)
  {
    [(UIButton *)v6 setHidden:0];
    [(PLCropOverlayBottomBar *)self _updatePreviewBottomBarForPlaybackState];
  }
  else
  {
    [(UIButton *)v6 setHidden:1];
  }
}

- (BOOL)_isEditingStyle:(int64_t)a3
{
  return (unint64_t)(self->_style - 1) < 2;
}

- (void)_updatePreviewBottomBarForPlaybackState
{
  double v3 = [(PLCropOverlayPreviewBottomBar *)self->_previewBottomBar playbackButton];
  BOOL playingVideo = self->_playingVideo;
  v5 = (void *)MEMORY[0x1E4F42A80];
  uint64_t v6 = PLPhotoLibraryFrameworkBundle();
  if (playingVideo) {
    v7 = @"PLCameraPickerPause.png";
  }
  else {
    v7 = @"PLCameraPickerPlay.png";
  }
  -[UIButton setImage:forState:](v3, "setImage:forState:", [v5 imageNamed:v7 inBundle:v6], 0);
  previewBottomBar = self->_previewBottomBar;
  [(PLCropOverlayPreviewBottomBar *)previewBottomBar setNeedsLayout];
}

- (void)_updateBottomBars
{
  [(PLCropOverlayBottomBar *)self _updateStyle];
  [(PLCropOverlayBottomBar *)self setNeedsLayout];
}

- (void)setInPopover:(BOOL)a3
{
  if (self->_inPopover != a3)
  {
    self->_inPopover = a3;
    [(PLCropOverlayBottomBar *)self _updateBottomBars];
  }
}

- (void)togglePlaybackState
{
}

- (void)setPlayingVideo:(BOOL)a3
{
  if (self->_playingVideo != a3)
  {
    self->_BOOL playingVideo = a3;
    [(PLCropOverlayBottomBar *)self _updatePreviewBottomBarForPlaybackState];
  }
}

- (void)setStyle:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_style != a3)
  {
    self->_int64_t style = a3;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __44__PLCropOverlayBottomBar_setStyle_animated___block_invoke;
    v4[3] = &unk_1E63D2660;
    v4[4] = self;
    if (a4) {
      [MEMORY[0x1E4F42FF0] animateWithDuration:v4 animations:0.3];
    }
    else {
      [(PLCropOverlayBottomBar *)self _updateStyle];
    }
  }
}

uint64_t __44__PLCropOverlayBottomBar_setStyle_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateStyle];
}

- (void)setStyle:(int64_t)a3
{
}

- (void)setWallpaperBottomBar:(id)a3
{
  wallpaperBottomBar = self->_wallpaperBottomBar;
  if (wallpaperBottomBar != a3)
  {
    [(PLCropOverlayWallpaperBottomBar *)wallpaperBottomBar removeFromSuperview];

    uint64_t v6 = (PLCropOverlayWallpaperBottomBar *)a3;
    self->_wallpaperBottomBar = v6;
    [(PLCropOverlayBottomBar *)self addSubview:v6];
    [(PLCropOverlayBottomBar *)self _updateBottomBars];
  }
}

- (void)setPreviewBottomBar:(id)a3
{
  previewBottomBar = self->_previewBottomBar;
  if (previewBottomBar != a3)
  {
    [(PLCropOverlayPreviewBottomBar *)previewBottomBar removeFromSuperview];

    uint64_t v6 = (PLCropOverlayPreviewBottomBar *)a3;
    self->_previewBottomBar = v6;
    [(PLCropOverlayBottomBar *)self addSubview:v6];
    [(PLCropOverlayBottomBar *)self _updateBottomBars];
  }
}

- (void)setCameraBottomBar:(id)a3
{
  cameraBottomBar = self->_cameraBottomBar;
  if (cameraBottomBar != a3)
  {

    self->_cameraBottomBar = (UIView *)a3;
    [(PLCropOverlayBottomBar *)self _updateBottomBars];
  }
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)PLCropOverlayBottomBar;
  [(PLCropOverlayBottomBar *)&v11 layoutSubviews];
  [(PLCropOverlayBottomBar *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[PLCropOverlayPreviewBottomBar setFrame:](self->_previewBottomBar, "setFrame:");
  -[PLCropOverlayWallpaperBottomBar setFrame:](self->_wallpaperBottomBar, "setFrame:", v4, v6, v8, v10);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PLCropOverlayBottomBar;
  [(PLCropOverlayBottomBar *)&v3 dealloc];
}

- (PLCropOverlayBottomBar)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PLCropOverlayBottomBar;
  objc_super v3 = [(PLCropOverlayBottomBar *)&v6 initWithCoder:a3];
  double v4 = v3;
  if (v3) {
    [(PLCropOverlayBottomBar *)v3 _commonPLCropOverlayBottomBarInitialization];
  }
  return v4;
}

- (PLCropOverlayBottomBar)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PLCropOverlayBottomBar;
  objc_super v3 = -[PLCropOverlayBottomBar initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3) {
    [(PLCropOverlayBottomBar *)v3 _commonPLCropOverlayBottomBarInitialization];
  }
  return v4;
}

- (void)_commonPLCropOverlayBottomBarInitialization
{
  self->_int64_t style = 0;
  self->_inPopover = 0;
  self->_BOOL playingVideo = 0;
}

@end