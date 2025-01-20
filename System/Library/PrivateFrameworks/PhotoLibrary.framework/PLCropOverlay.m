@interface PLCropOverlay
- (BOOL)controlsAreVisible;
- (BOOL)isDisplayedInPopover;
- (BOOL)isEditingHomeScreen;
- (BOOL)isEditingLockScreen;
- (BOOL)isTelephonyUIMode:(int)a3;
- (BOOL)isWallpaperUIMode:(int)a3;
- (BOOL)motionToggleHidden;
- (BOOL)motionToggleIsOn;
- (BOOL)previewMode;
- (CGRect)bottomBarFrame;
- (CGRect)cropRect;
- (CGRect)titleRect;
- (NSString)defaultCancelButtonTitle;
- (NSString)defaultOKButtonTitle;
- (PLContactPhotoOverlay)contactPhotoOverlay;
- (PLCropOverlay)initWithFrame:(CGRect)a3;
- (PLCropOverlay)initWithFrame:(CGRect)a3 mode:(int)a4;
- (PLCropOverlay)initWithFrame:(CGRect)a3 mode:(int)a4 offsettingStatusBar:(BOOL)a5;
- (PLCropOverlayBottomBar)_bottomBar;
- (PLCropOverlayDelegate)delegate;
- (PLCropOverlayWallpaperBottomBar)wallpaperBottomBar;
- (UIButton)_cameraCancelButton;
- (UIView)cameraBottomBar;
- (id)_bottomBarFileSizeMenu;
- (id)_bottomBarFileSizeMenuActions;
- (id)_fileResizingButton;
- (id)_newOverlayViewWithFrame:(CGRect)a3 lighterEdgeOnTop:(BOOL)a4;
- (id)bottomBar;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)overlayContainerView;
- (int)mode;
- (void)_backgroundSavePhoto:(id)a3 cropRect:(CGRect)a4 minimalCropDimension:(double)a5;
- (void)_createCropView;
- (void)_fadeOutCompleted:(id)a3;
- (void)_pauseButtonPressed:(id)a3;
- (void)_playButtonPressed:(id)a3;
- (void)_savePhotoFinished:(id)a3;
- (void)_setMode:(int)a3;
- (void)_tappedBottomBarCancelButton:(id)a3;
- (void)_tappedBottomBarDoneButton:(id)a3;
- (void)_tappedBottomBarMotionToggle;
- (void)_tappedBottomBarPlaybackButton:(id)a3;
- (void)_tappedBottomBarSetBothButton;
- (void)_tappedBottomBarSetHomeButton;
- (void)_tappedBottomBarSetLockButton;
- (void)_updateCropRectInRect:(CGRect)a3;
- (void)_updateEditImageCancelButtonTitle;
- (void)_updateEditImageDoneButtonTitle;
- (void)_updateMotionToggle;
- (void)_updateTitle;
- (void)_updateToolbarItems:(BOOL)a3;
- (void)_updateWallpaperBottomBarSettingButtons;
- (void)beginBackgroundSaveWithTile:(id)a3 progressTitle:(id)a4 completionCallbackTarget:(id)a5 options:(int)a6;
- (void)cancelButtonClicked:(id)a3;
- (void)cropOverlayBottomBarPauseButtonClicked:(id)a3;
- (void)cropOverlayBottomBarPlayButtonClicked:(id)a3;
- (void)dealloc;
- (void)didCapturePhoto;
- (void)didCaptureVideo;
- (void)didPauseVideo;
- (void)didPlayVideo;
- (void)dismiss;
- (void)insertIrisView:(id)a3;
- (void)layoutSubviews;
- (void)removeProgress;
- (void)setCameraBottomBar:(id)a3;
- (void)setCancelButtonTitle:(id)a3;
- (void)setControlsAreVisible:(BOOL)a3;
- (void)setCropRectVisible:(BOOL)a3 duration:(float)a4;
- (void)setDefaultCancelButtonTitle:(id)a3;
- (void)setDefaultOKButtonTitle:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayedInPopover:(BOOL)a3;
- (void)setFileResizingHidden:(BOOL)a3;
- (void)setFileResizingTitle:(id)a3;
- (void)setIsEditingHomeScreen:(BOOL)a3;
- (void)setIsEditingLockScreen:(BOOL)a3;
- (void)setMotionToggleHidden:(BOOL)a3;
- (void)setMotionToggleIsOn:(BOOL)a3;
- (void)setOKButtonShowsCamera:(BOOL)a3;
- (void)setOKButtonTitle:(id)a3;
- (void)setOverlayContainerView:(id)a3;
- (void)setPreviewMode:(BOOL)a3;
- (void)setProgressDone;
- (void)setShowProgress:(BOOL)a3 title:(id)a4;
- (void)setShowsCropRegion:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)setTitle:(id)a3 okButtonTitle:(id)a4;
- (void)setTitleHidden:(BOOL)a3 animationDuration:(double)a4;
- (void)setUserInteractionEnabled:(BOOL)a3;
- (void)statusBarHeightDidChange:(id)a3;
@end

@implementation PLCropOverlay

- (void).cxx_destruct
{
}

- (UIButton)_cameraCancelButton
{
  return self->__cameraCancelButton;
}

- (PLCropOverlayBottomBar)_bottomBar
{
  return self->__bottomBar;
}

- (PLCropOverlayDelegate)delegate
{
  return (PLCropOverlayDelegate *)objc_loadWeak((id *)&self->_delegate);
}

- (NSString)defaultCancelButtonTitle
{
  return self->_defaultCancelButtonTitle;
}

- (NSString)defaultOKButtonTitle
{
  return self->_defaultOKButtonTitle;
}

- (BOOL)isDisplayedInPopover
{
  return self->_displayedInPopover;
}

- (BOOL)isEditingLockScreen
{
  return self->_isEditingLockScreen;
}

- (BOOL)isEditingHomeScreen
{
  return self->_isEditingHomeScreen;
}

- (BOOL)motionToggleIsOn
{
  return self->_motionToggleIsOn;
}

- (PLContactPhotoOverlay)contactPhotoOverlay
{
  return self->_contactPhotoOverlay;
}

- (BOOL)isWallpaperUIMode:(int)a3
{
  return a3 == 6;
}

- (BOOL)isTelephonyUIMode:(int)a3
{
  return (a3 - 3) < 2;
}

- (id)_newOverlayViewWithFrame:(CGRect)a3 lighterEdgeOnTop:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v17.double width = 1.0;
  v17.double height = 5.0;
  UIGraphicsBeginImageContext(v17);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F428B8], "colorWithWhite:alpha:", 0.098, 0.62), "set");
  v18.origin.double x = 0.0;
  v18.origin.double y = 0.0;
  v18.size.double width = 1.0;
  v18.size.double height = 5.0;
  UIRectFillUsingBlendMode(v18, kCGBlendModeNormal);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F428B8], "colorWithWhite:alpha:", 1.0, 0.37), "set");
  if (v4) {
    double v9 = 1.0;
  }
  else {
    double v9 = 3.0;
  }
  uint64_t v10 = 0;
  double v11 = 1.0;
  double v12 = 1.0;
  UIRectFillUsingBlendMode(*(CGRect *)(&v9 - 1), kCGBlendModeCopy);
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  uint64_t v14 = -[UIImage resizableImageWithCapInsets:resizingMode:](ImageFromCurrentImageContext, "resizableImageWithCapInsets:resizingMode:", 1, 2.0, 0.0, 2.0, 0.0);
  v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42AA0]), "initWithFrame:", x, y, width, height);
  [v15 setImage:v14];
  return v15;
}

- (void)_updateCropRectInRect:(CGRect)a3
{
  p_cropRect = &self->_cropRect;
  self->_cropRect.origin.double x = 0.0;
  self->_cropRect.origin.double y = 0.0;
  if (a3.size.width >= a3.size.height) {
    a3.size.double width = a3.size.height;
  }
  self->_cropRect.size.double width = a3.size.width;
  self->_cropRect.size.double height = a3.size.width;
  UIRectCenteredIntegralRect();
  p_cropRect->origin.double x = v4;
  p_cropRect->origin.double y = v5;
  p_cropRect->size.double width = v6;
  p_cropRect->size.double height = v7;
}

- (void)_updateToolbarItems:(BOOL)a3
{
  BOOL v3 = a3;
  CGFloat v5 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:5 target:0 action:0];
  id v6 = objc_alloc(MEMORY[0x1E4F427C0]);
  if (v3) {
    uint64_t v7 = 17;
  }
  else {
    uint64_t v7 = 18;
  }
  v8 = &selRef__playButtonPressed_;
  if (!v3) {
    v8 = &selRef__pauseButtonPressed_;
  }
  id v9 = (id)[v6 initWithBarButtonSystemItem:v7 target:self action:*v8];
  -[UIToolbar setItems:](self->_customToolbar, "setItems:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v5, v9, v5, 0));
}

- (void)_updateEditImageCancelButtonTitle
{
  BOOL v3 = [(PLCropOverlayPreviewBottomBar *)[(PLCropOverlayBottomBar *)[(PLCropOverlay *)self _bottomBar] previewBottomBar] cancelButton];
  CGFloat v4 = [(PLCropOverlay *)self defaultCancelButtonTitle];
  if (![(NSString *)v4 length]) {
    CGFloat v4 = (NSString *)PLLocalizedFrameworkString();
  }
  [(UIButton *)v3 setTitle:v4 forState:0];
}

- (void)_updateEditImageDoneButtonTitle
{
  unsigned int mode = self->_mode;
  BOOL v3 = mode > 7;
  int v4 = (1 << mode) & 0x92;
  if (!v3 && v4 != 0)
  {
    uint64_t v7 = [(PLCropOverlayPreviewBottomBar *)[(PLCropOverlayBottomBar *)[(PLCropOverlay *)self _bottomBar] previewBottomBar] doneButton];
    v8 = [(PLCropOverlay *)self defaultOKButtonTitle];
    if (![(NSString *)v8 length]) {
      v8 = (NSString *)PLLocalizedFrameworkString();
    }
    [(UIButton *)v7 setTitle:v8 forState:0];
  }
}

- (void)_updateTitle
{
  uint64_t v3 = PLLocalizedFrameworkString();
  [(PLCropOverlay *)self setTitle:v3];
}

- (void)setFileResizingHidden:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(PLCropOverlay *)self _fileResizingButton];
  [v4 setHidden:v3];
}

- (void)setFileResizingTitle:(id)a3
{
  id v4 = [(PLCropOverlay *)self _fileResizingButton];
  [v4 setTitle:a3 forState:0];
}

- (id)_fileResizingButton
{
  v2 = [(PLCropOverlayBottomBar *)[(PLCropOverlay *)self _bottomBar] previewBottomBar];
  return [(PLCropOverlayPreviewBottomBar *)v2 fileResizingButton];
}

- (BOOL)previewMode
{
  return *((unsigned char *)self + 504) & 1;
}

- (void)setPreviewMode:(BOOL)a3
{
  char v3 = *((unsigned char *)self + 504);
  if (((((v3 & 1) == 0) ^ a3) & 1) == 0)
  {
    *((unsigned char *)self + 504) = v3 & 0xFE | a3;
    [(PLCropOverlay *)self _updateTitle];
    [(UIView *)self->_wildcatPickerTopView setHidden:*((unsigned char *)self + 504) & 1];
    [(UIView *)self->_wildcatPickerBottomView setHidden:*((unsigned char *)self + 504) & 1];
    BOOL v5 = (*((unsigned char *)self + 504) & 1) == 0;
    [(PLCropOverlay *)self setCropRectVisible:v5 duration:0.0];
  }
}

- (void)setTitleHidden:(BOOL)a3 animationDuration:(double)a4
{
  double v4 = 1.0;
  if (a3) {
    double v4 = 0.0;
  }
  if (a4 <= 0.0)
  {
    titleLabel = self->_titleLabel;
    [(UILabel *)titleLabel setAlpha:v4];
  }
  else
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __50__PLCropOverlay_setTitleHidden_animationDuration___block_invoke;
    v6[3] = &unk_1E63D2930;
    v6[4] = self;
    *(double *)&v6[5] = v4;
    objc_msgSend(MEMORY[0x1E4F42FF0], "animateWithDuration:animations:", v6);
  }
}

uint64_t __50__PLCropOverlay_setTitleHidden_animationDuration___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 472) setAlpha:*(double *)(a1 + 40)];
}

- (void)setShowsCropRegion:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 504) = *((unsigned char *)self + 504) & 0xEF | v3;
}

- (void)setProgressDone
{
}

- (void)removeProgress
{
  self->_hud = 0;
}

- (void)setShowProgress:(BOOL)a3 title:(id)a4
{
  if (a3
    && ([(PLCropOverlay *)self isTelephonyUIMode:self->_mode]
     || [(PLCropOverlay *)self isWallpaperUIMode:self->_mode]))
  {

    id v6 = objc_alloc_init(PLProgressHUD);
    self->_hud = v6;
    [(PLProgressHUD *)v6 setText:a4];
    hud = self->_hud;
    [(PLProgressHUD *)hud showInView:self];
  }
  else
  {
    v8 = self->_hud;
    [(PLProgressHUD *)v8 hide];
  }
}

- (void)setCancelButtonTitle:(id)a3
{
  if (![(PLCropOverlay *)self isTelephonyUIMode:self->_mode])
  {
    [(UIButton *)[(PLCropOverlayPreviewBottomBar *)[(PLCropOverlayBottomBar *)self->__bottomBar previewBottomBar] cancelButton] setTitle:a3 forState:0];
    bottomBar = self->__bottomBar;
    [(PLCropOverlayBottomBar *)bottomBar setNeedsLayout];
  }
}

- (void)setOKButtonShowsCamera:(BOOL)a3
{
  if (![(PLCropOverlay *)self isTelephonyUIMode:self->_mode])
  {
    bottomBar = self->__bottomBar;
    [(PLCropOverlayBottomBar *)bottomBar setStyle:0];
  }
}

- (void)setDefaultCancelButtonTitle:(id)a3
{
  if (self->_defaultCancelButtonTitle != a3 && (objc_msgSend(a3, "isEqualToString:") & 1) == 0)
  {

    self->_defaultCancelButtonTitle = (NSString *)[a3 copy];
    [(PLCropOverlay *)self _updateEditImageCancelButtonTitle];
  }
}

- (void)setDefaultOKButtonTitle:(id)a3
{
  if (self->_defaultOKButtonTitle != a3 && (objc_msgSend(a3, "isEqualToString:") & 1) == 0)
  {

    self->_defaultOKButtonTitle = (NSString *)[a3 copy];
    [(PLCropOverlay *)self _updateEditImageDoneButtonTitle];
  }
}

- (void)setOKButtonTitle:(id)a3
{
  if (![(PLCropOverlay *)self isTelephonyUIMode:self->_mode])
  {
    [(UIButton *)[(PLCropOverlayPreviewBottomBar *)[(PLCropOverlayBottomBar *)self->__bottomBar previewBottomBar] doneButton] setTitle:a3 forState:0];
    [(PLCropOverlayBottomBar *)self->__bottomBar setNeedsLayout];
  }
  [(UIButton *)self->_okButton setTitle:a3 forState:0];
  if (self->_mode == 6)
  {
    BOOL v5 = [(PLCropOverlayWallpaperBottomBar *)[(PLCropOverlayBottomBar *)self->__bottomBar wallpaperBottomBar] doSetButton];
    [(PLWallpaperButton *)v5 setTitle:a3 forState:0];
  }
}

- (CGRect)titleRect
{
  if ([(PLCropOverlay *)self isTelephonyUIMode:self->_mode])
  {
    [(UILabel *)self->_titleLabel frame];
  }
  else
  {
    double v3 = *MEMORY[0x1E4F1DB28];
    double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (void)setTitle:(id)a3
{
  if ([(PLCropOverlay *)self isTelephonyUIMode:self->_mode])
  {
    [(UILabel *)self->_titleLabel setText:a3];
    [(UILabel *)self->_titleLabel sizeToFit];
    [(PLCropOverlay *)self setNeedsLayout];
  }
  else if (self->_mode == 6)
  {
    double v5 = [(PLCropOverlayBottomBar *)self->__bottomBar wallpaperBottomBar];
    [(PLCropOverlayWallpaperBottomBar *)v5 setText:a3];
  }
}

- (void)setTitle:(id)a3 okButtonTitle:(id)a4
{
  if ([(PLCropOverlay *)self isTelephonyUIMode:self->_mode])
  {
    [(UILabel *)self->_titleLabel setText:a3];
    [(UILabel *)self->_titleLabel sizeToFit];
    [(PLCropOverlay *)self setNeedsLayout];
    okButton = self->_okButton;
    [(UIButton *)okButton setTitle:a4 forState:0];
  }
}

- (CGRect)cropRect
{
  uint64_t v3 = MEMORY[0x1E4F1DB28];
  CGFloat x = *MEMORY[0x1E4F1DB28];
  double y = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  BOOL v6 = [(PLCropOverlay *)self isTelephonyUIMode:self->_mode];
  bottomBar = self->__bottomBar;
  if (v6)
  {
    if ([(PLCropOverlayBottomBar *)bottomBar previewBottomBar])
    {
      contactPhotoOverladouble y = self->_contactPhotoOverlay;
      if (contactPhotoOverlay && ([(PLContactPhotoOverlay *)contactPhotoOverlay bounds], !CGRectIsEmpty(v28))) {
        [(PLContactPhotoOverlay *)self->_contactPhotoOverlay inscribingBounds];
      }
      else {
        [(PLCropOverlay *)self bounds];
      }
    }
    else
    {
      [(PLCropOverlay *)self bounds];
      [(UIImageView *)self->_bottomShineView frame];
      [(UIImageView *)self->_topShineView frame];
      CGRectGetMaxY(v29);
      UIRectCenteredIntegralRect();
    }
    CGFloat x = v9;
    double y = v10;
    CGFloat width = v11;
  }
  else if (bottomBar)
  {
    CGFloat x = self->_cropRect.origin.x;
    double y = self->_cropRect.origin.y;
    CGFloat width = self->_cropRect.size.width;
    double height = self->_cropRect.size.height;
  }
  else
  {
    CGFloat width = *(double *)(v3 + 16);
    double height = *(double *)(v3 + 24);
    if (self->_wildcatPickerBottomView && self->_wildcatPickerTopView)
    {
      [(PLCropOverlay *)self bounds];
      CGFloat x = v14;
      double v16 = v15;
      CGFloat width = v17;
      double v19 = v18;
      [(UIView *)self->_wildcatPickerTopView frame];
      double v21 = v20;
      double v23 = v22;
      [(UIView *)self->_wildcatPickerBottomView frame];
      double y = v16 + v21 + v23;
      double height = v19 - (v21 + v23 + v24);
    }
  }
  double v25 = x;
  double v26 = y;
  double v27 = width;
  result.size.double height = height;
  result.size.CGFloat width = v27;
  result.origin.double y = v26;
  result.origin.CGFloat x = v25;
  return result;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)PLCropOverlay;
  double v5 = -[PLCropOverlay hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  overlayContainerView = self->_overlayContainerView;
  if ((!overlayContainerView || v5 == overlayContainerView || !-[UIView isDescendantOfView:](v5, "isDescendantOfView:"))
    && (isKindOfClass & 1) == 0)
  {
    return 0;
  }
  return v5;
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PLCropOverlay;
  -[PLCropOverlay setUserInteractionEnabled:](&v5, sel_setUserInteractionEnabled_);
  [(PLCropOverlayBottomBar *)[(PLCropOverlay *)self _bottomBar] setUserInteractionEnabled:v3];
}

- (void)_pauseButtonPressed:(id)a3
{
}

- (void)cropOverlayBottomBarPauseButtonClicked:(id)a3
{
  p_delegate = &self->_delegate;
  objc_loadWeak((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    id Weak = objc_loadWeak((id *)p_delegate);
    [Weak cropOverlayPause:self];
  }
}

- (void)_playButtonPressed:(id)a3
{
}

- (void)cropOverlayBottomBarPlayButtonClicked:(id)a3
{
  p_delegate = &self->_delegate;
  objc_loadWeak((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    id Weak = objc_loadWeak((id *)p_delegate);
    [Weak cropOverlayPlay:self];
  }
}

- (void)_tappedBottomBarPlaybackButton:(id)a3
{
  [(PLCropOverlayBottomBar *)self->__bottomBar togglePlaybackState];
  BOOL v4 = [(PLCropOverlayBottomBar *)self->__bottomBar isPlayingVideo];
  objc_loadWeak((id *)&self->_delegate);
  if (v4)
  {
    if (objc_opt_respondsToSelector())
    {
      id Weak = objc_loadWeak((id *)&self->_delegate);
      [Weak cropOverlayPlay:self];
    }
  }
  else if (objc_opt_respondsToSelector())
  {
    id v6 = objc_loadWeak((id *)&self->_delegate);
    [v6 cropOverlayPause:self];
  }
}

- (BOOL)motionToggleHidden
{
  v2 = [(PLCropOverlay *)self wallpaperBottomBar];
  return [(PLCropOverlayWallpaperBottomBar *)v2 motionToggleHidden];
}

- (void)setMotionToggleHidden:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v4 = [(PLCropOverlay *)self wallpaperBottomBar];
  [(PLCropOverlayWallpaperBottomBar *)v4 setMotionToggleHidden:v3];
}

- (void)_updateWallpaperBottomBarSettingButtons
{
  BOOL isEditingLockScreen = self->_isEditingLockScreen;
  if (self->_isEditingLockScreen)
  {
    BOOL v4 = [(PLCropOverlay *)self wallpaperBottomBar];
LABEL_3:
    uint64_t v5 = 0;
    goto LABEL_6;
  }
  BOOL isEditingHomeScreen = self->_isEditingHomeScreen;
  BOOL v4 = [(PLCropOverlay *)self wallpaperBottomBar];
  if (!isEditingHomeScreen) {
    goto LABEL_3;
  }
  uint64_t v5 = 1;
LABEL_6:
  [(PLCropOverlayWallpaperBottomBar *)v4 setShouldOnlyShowHomeScreenButton:v5];
  uint64_t v7 = [(PLCropOverlay *)self wallpaperBottomBar];
  [(PLCropOverlayWallpaperBottomBar *)v7 setShouldOnlyShowLockScreenButton:isEditingLockScreen];
}

- (void)setIsEditingLockScreen:(BOOL)a3
{
  if (self->_isEditingLockScreen != a3)
  {
    self->_BOOL isEditingLockScreen = a3;
    [(PLCropOverlay *)self _updateWallpaperBottomBarSettingButtons];
  }
}

- (void)setIsEditingHomeScreen:(BOOL)a3
{
  if (self->_isEditingHomeScreen != a3)
  {
    self->_BOOL isEditingHomeScreen = a3;
    [(PLCropOverlay *)self _updateWallpaperBottomBarSettingButtons];
  }
}

- (void)_updateMotionToggle
{
  v2 = [(PLCropOverlayWallpaperBottomBar *)[(PLCropOverlay *)self wallpaperBottomBar] motionToggle];
  uint64_t v3 = PLLocalizedFrameworkString();
  [(PLWallpaperButton *)v2 setTitle:v3 forState:0];
}

- (void)setMotionToggleIsOn:(BOOL)a3
{
  if (self->_motionToggleIsOn != a3)
  {
    self->_motionToggleIsOn = a3;
    [(PLCropOverlay *)self _updateMotionToggle];
    BOOL v4 = [(PLCropOverlay *)self wallpaperBottomBar];
    [(PLCropOverlayWallpaperBottomBar *)v4 setNeedsLayout];
  }
}

- (id)_bottomBarFileSizeMenuActions
{
  p_delegate = &self->_delegate;
  objc_loadWeak((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  id Weak = objc_loadWeak((id *)p_delegate);
  return (id)[Weak cropOverlayFileSizeMenuActions:self];
}

- (id)_bottomBarFileSizeMenu
{
  v11[1] = *MEMORY[0x1E4F143B8];
  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x1E4F42930];
  uint64_t v5 = MEMORY[0x1E4F143A8];
  uint64_t v6 = 3221225472;
  uint64_t v7 = __39__PLCropOverlay__bottomBarFileSizeMenu__block_invoke;
  v8 = &unk_1E63D1FC0;
  objc_copyWeak(&v9, &location);
  v11[0] = [v2 elementWithProvider:&v5];
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F42B80], "menuWithTitle:children:", &stru_1F1A10F90, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v11, 1, v5, v6, v7, v8));
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v3;
}

uint64_t __39__PLCropOverlay__bottomBarFileSizeMenu__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [objc_loadWeak((id *)(a1 + 32)) _bottomBarFileSizeMenuActions];
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = MEMORY[0x1E4F1CBF0];
  }
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(a2 + 16);
  return v5(a2, v4);
}

- (void)_tappedBottomBarMotionToggle
{
  [(PLCropOverlay *)self setMotionToggleIsOn:!self->_motionToggleIsOn];
  objc_loadWeak((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    id Weak = objc_loadWeak((id *)&self->_delegate);
    BOOL motionToggleIsOn = self->_motionToggleIsOn;
    [Weak motionToggledManually:motionToggleIsOn];
  }
}

- (void)_tappedBottomBarSetBothButton
{
  [(PLCropOverlay *)self setUserInteractionEnabled:0];
  objc_loadWeak((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    id Weak = objc_loadWeak((id *)&self->_delegate);
    [Weak setImageAsHomeScreenAndLockScreenClicked:self];
  }
}

- (void)_tappedBottomBarSetLockButton
{
  [(PLCropOverlay *)self setUserInteractionEnabled:0];
  objc_loadWeak((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    id Weak = objc_loadWeak((id *)&self->_delegate);
    [Weak setImageAsLockScreenClicked:self];
  }
}

- (void)_tappedBottomBarSetHomeButton
{
  [(PLCropOverlay *)self setUserInteractionEnabled:0];
  objc_loadWeak((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    id Weak = objc_loadWeak((id *)&self->_delegate);
    [Weak setImageAsHomeScreenClicked:self];
  }
}

- (void)_tappedBottomBarDoneButton:(id)a3
{
  [(PLCropOverlay *)self setUserInteractionEnabled:0];
  objc_loadWeak((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    id Weak = objc_loadWeak((id *)&self->_delegate);
    [Weak cropOverlayWasOKed:self];
  }
}

- (void)_tappedBottomBarCancelButton:(id)a3
{
  [(PLCropOverlay *)self setUserInteractionEnabled:0];
  objc_loadWeak((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [objc_loadWeak((id *)&self->_delegate) cropOverlayWasCancelled:self];
  }
  if ((*((unsigned char *)self + 504) & 8) != 0)
  {
    *((unsigned char *)self + 504) &= ~8u;
    [(PLCropOverlayBottomBar *)self->__bottomBar setStyle:0 animated:1];
    LODWORD(v4) = 0.5;
    [(PLCropOverlay *)self setCropRectVisible:0 duration:v4];
    if ([(PLCropOverlay *)self contactPhotoOverlay])
    {
      uint64_t v5 = [(PLCropOverlay *)self contactPhotoOverlay];
      [(UIView *)v5 pl_setHidden:1 animated:1];
    }
  }
}

- (void)cancelButtonClicked:(id)a3
{
  [(PLCropOverlay *)self setUserInteractionEnabled:0];
  objc_loadWeak((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    id Weak = objc_loadWeak((id *)&self->_delegate);
    [Weak cropOverlayWasCancelled:self];
  }
}

- (void)_fadeOutCompleted:(id)a3
{
  [(PLCropOverlay *)self removeFromSuperview];
  double v4 = self;
}

- (void)dismiss
{
  uint64_t v3 = self;
  [(PLCropOverlay *)self setUserInteractionEnabled:0];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __24__PLCropOverlay_dismiss__block_invoke;
  v5[3] = &unk_1E63D2660;
  v5[4] = self;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __24__PLCropOverlay_dismiss__block_invoke_2;
  v4[3] = &unk_1E63D2688;
  v4[4] = self;
  [MEMORY[0x1E4F42FF0] animateWithDuration:v5 animations:v4 completion:0.5];
  [(PLProgressHUD *)self->_hud done];
  [(PLProgressHUD *)self->_hud removeFromSuperview];

  self->_hud = 0;
}

uint64_t __24__PLCropOverlay_dismiss__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __24__PLCropOverlay_dismiss__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fadeOutCompleted:0];
}

- (void)setDelegate:(id)a3
{
}

- (void)statusBarHeightDidChange:(id)a3
{
  if ([(PLCropOverlay *)self isTelephonyUIMode:self->_mode])
  {
    [(UIImageView *)self->_topShineView frame];
    double v5 = v4;
    double v7 = v6;
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42738], "sharedApplication"), "statusBarHeight");
    *(float *)&double v8 = v8;
    if (v7 != *(float *)&v8)
    {
      [(UIImageView *)self->_topShineView setFrame:v5];
      [(PLCropOverlay *)self setNeedsLayout];
    }
  }
  else
  {
    cropView = self->_cropView;
    if (cropView)
    {
      [(PLCropOverlayCropView *)cropView frame];
      double v11 = v10;
      double v13 = v12;
      double v15 = v14;
      double v17 = v16;
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42738], "sharedApplication"), "statusBarHeight");
      *(float *)&double v18 = v18;
      float v19 = *(float *)&v18 - self->_statusBarHeight;
      self->_statusBarHeight = *(float *)&v18;
      double v20 = v19;
      double v21 = v13 + v19;
      double v22 = self->_cropView;
      -[PLCropOverlayCropView setFrame:](v22, "setFrame:", v11, v21, v15, v17 - v20);
    }
  }
}

- (void)dealloc
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:", self);

  v3.receiver = self;
  v3.super_class = (Class)PLCropOverlay;
  [(PLCropOverlay *)&v3 dealloc];
}

- (int)mode
{
  return self->_mode;
}

- (void)didPauseVideo
{
  if (self->__bottomBar) {
    [(PLCropOverlayBottomBar *)self->__bottomBar setPlayingVideo:0];
  }
  else {
    [(PLCropOverlay *)self _updateToolbarItems:1];
  }
}

- (void)didPlayVideo
{
  if (self->__bottomBar) {
    [(PLCropOverlayBottomBar *)self->__bottomBar setPlayingVideo:1];
  }
  else {
    [(PLCropOverlay *)self _updateToolbarItems:0];
  }
}

- (void)didCaptureVideo
{
  if (!self->_mode)
  {
    *((unsigned char *)self + 504) |= 8u;
    objc_super v3 = [(PLCropOverlayBottomBar *)self->__bottomBar previewBottomBar];
    [(UIButton *)[(PLCropOverlayPreviewBottomBar *)v3 doneButton] setTitle:PLLocalizedFrameworkString() forState:0];
    [(PLCropOverlayPreviewBottomBar *)v3 setNeedsLayout];
    bottomBar = self->__bottomBar;
    [(PLCropOverlayBottomBar *)bottomBar setStyle:2 animated:1];
  }
}

- (void)didCapturePhoto
{
  int mode = self->_mode;
  if (mode == 3 || mode == 0)
  {
    *((unsigned char *)self + 504) |= 8u;
    double v5 = [(PLCropOverlayBottomBar *)self->__bottomBar previewBottomBar];
    [(UIButton *)[(PLCropOverlayPreviewBottomBar *)v5 doneButton] setTitle:[(PLCropOverlay *)self defaultOKButtonTitle] forState:0];
    [(PLCropOverlayPreviewBottomBar *)v5 setNeedsLayout];
    [(PLCropOverlay *)self setCropRectVisible:(*((unsigned __int8 *)self + 504) >> 4) & 1 duration:0.0];
    [(PLCropOverlayBottomBar *)self->__bottomBar setStyle:1 animated:1];
    if ([(PLCropOverlay *)self contactPhotoOverlay])
    {
      double v6 = [(PLCropOverlay *)self contactPhotoOverlay];
      [(UIView *)v6 pl_setHidden:0 animated:1];
    }
  }
}

- (void)_setMode:(int)a3
{
  self->_int mode = a3;
  if (self->__bottomBar)
  {
    if (a3 <= 6 && ((1 << a3) & 0x45) != 0) {
      uint64_t v5 = 0;
    }
    else {
      uint64_t v5 = [(PLCropOverlay *)self isTelephonyUIMode:*(void *)&a3] ^ 1;
    }
    [(PLCropOverlay *)self setCropRectVisible:v5 duration:0.0];
    double v6 = [(PLCropOverlay *)self _bottomBar];
    double v7 = [(PLCropOverlayBottomBar *)v6 previewBottomBar];
    double v8 = [(PLCropOverlayPreviewBottomBar *)v7 doneButton];
    id v9 = [(PLContactPhotoOverlay *)[(PLCropOverlay *)self contactPhotoOverlay] titleLabel];
    switch(a3)
    {
      case 0:
      case 3:
        [(PLCropOverlayBottomBar *)v6 setStyle:0];
        goto LABEL_9;
      case 1:
      case 4:
        [(PLCropOverlayBottomBar *)v6 setStyle:1];
        [(PLCropOverlay *)self _updateEditImageDoneButtonTitle];
LABEL_9:
        [(PLCropOverlay *)self _updateEditImageCancelButtonTitle];
        uint64_t v10 = PLLocalizedFrameworkString();
        [(UILabel *)v9 setText:v10];
        return;
      case 2:
        [(PLCropOverlayBottomBar *)v6 setStyle:2];
        [(UIButton *)v8 setTitle:PLLocalizedFrameworkString() forState:0];
        goto LABEL_23;
      case 6:
        unint64_t v11 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42948], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL;
        [(PLWallpaperButton *)[(PLCropOverlayWallpaperBottomBar *)[(PLCropOverlayBottomBar *)v6 wallpaperBottomBar] doCancelButton] setTitle:PLLocalizedFrameworkString() forState:0];
        if (v11 == 1)
        {
          [(PLWallpaperButton *)[(PLCropOverlayWallpaperBottomBar *)[(PLCropOverlayBottomBar *)v6 wallpaperBottomBar] doSetHomeScreenButton] setTitle:PLLocalizedFrameworkString() forState:0];
          [(PLWallpaperButton *)[(PLCropOverlayWallpaperBottomBar *)[(PLCropOverlayBottomBar *)v6 wallpaperBottomBar] doSetLockScreenButton] setTitle:PLLocalizedFrameworkString() forState:0];
          [(PLWallpaperButton *)[(PLCropOverlayWallpaperBottomBar *)[(PLCropOverlayBottomBar *)v6 wallpaperBottomBar] doSetBothScreenButton] setTitle:PLLocalizedFrameworkString() forState:0];
          [(PLCropOverlay *)self _updateMotionToggle];
        }
        return;
      case 7:
        [(PLCropOverlayBottomBar *)v6 setStyle:1];
        if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42948], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) == 1)
        {
          [(UIButton *)[(PLCropOverlayPreviewBottomBar *)v7 cancelButton] setHidden:1];
          double v12 = [(PLCropOverlayPreviewBottomBar *)v7 doneButton];
          [(UIButton *)v12 setHidden:1];
        }
        else
        {
          [(PLCropOverlay *)self _updateEditImageDoneButtonTitle];
LABEL_23:
          [(PLCropOverlay *)self _updateEditImageCancelButtonTitle];
        }
        break;
      default:
        return;
    }
  }
}

- (void)setCropRectVisible:(BOOL)a3 duration:(float)a4
{
  BOOL v5 = a3;
  if (!a3 || ![(PLCropOverlay *)self contactPhotoOverlay])
  {
    char v7 = *((unsigned char *)self + 504);
    if (((((v7 & 2) == 0) ^ v5) & 1) == 0)
    {
      if (v5) {
        char v8 = 2;
      }
      else {
        char v8 = 0;
      }
      *((unsigned char *)self + 504) = v7 & 0xFD | v8;
      [(PLCropOverlay *)self _createCropView];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __45__PLCropOverlay_setCropRectVisible_duration___block_invoke;
      v9[3] = &unk_1E63D2660;
      v9[4] = self;
      if (a4 <= 0.0) {
        [(PLCropOverlayCropView *)self->_cropView setAlpha:(double)((*((unsigned __int8 *)self + 504) >> 1) & 1)];
      }
      else {
        [MEMORY[0x1E4F42FF0] animateWithDuration:v9 animations:a4];
      }
    }
  }
}

uint64_t __45__PLCropOverlay_setCropRectVisible_duration___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 408) setAlpha:(double)((*(unsigned __int8 *)(*(void *)(a1 + 32) + 504) >> 1) & 1)];
}

- (CGRect)bottomBarFrame
{
  if (self->_mode == 5
    || (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42948], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) == 1
    && self->_mode == 2)
  {
    objc_super v3 = &OBJC_IVAR___PLCropOverlay__customToolbar;
  }
  else
  {
    objc_super v3 = &OBJC_IVAR___PLCropOverlay___bottomBar;
  }
  double v4 = *(Class *)((char *)&self->super.super.super.isa + *v3);
  [v4 frame];
  result.size.double height = v8;
  result.size.CGFloat width = v7;
  result.origin.double y = v6;
  result.origin.CGFloat x = v5;
  return result;
}

- (id)bottomBar
{
  if (self->_mode == 5
    || (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42948], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) == 1
    && self->_mode == 2)
  {
    objc_super v3 = &OBJC_IVAR___PLCropOverlay__customToolbar;
  }
  else
  {
    objc_super v3 = &OBJC_IVAR___PLCropOverlay___bottomBar;
  }
  return *(Class *)((char *)&self->super.super.super.isa + *v3);
}

- (void)insertIrisView:(id)a3
{
  if (self->_cropView) {
    -[PLCropOverlay insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", a3);
  }
  else {
    [(PLCropOverlay *)self addSubview:a3];
  }
  bottomBar = self->__bottomBar;
  [(PLCropOverlay *)self bringSubviewToFront:bottomBar];
}

- (void)_createCropView
{
  if (!self->_cropView)
  {
    float v3 = 0.0;
    if (![(PLCropOverlay *)self isDisplayedInPopover]
      && (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42738], "sharedApplication"), "isStatusBarHidden") & 1) == 0)
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42738], "sharedApplication"), "statusBarHeight");
      float v3 = v4;
    }
    self->_float statusBarHeight = v3;
    if ([(PLCropOverlay *)self isDisplayedInPopover])
    {
      double v5 = 480.0;
    }
    else
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42D90], "mainScreen"), "bounds");
      -[PLCropOverlay convertRect:fromView:](self, "convertRect:fromView:", 0);
      double v5 = v6;
    }
    [(PLCropOverlay *)self frame];
    double v8 = v7;
    double v10 = v9;
    float statusBarHeight = self->_statusBarHeight;
    double v12 = v5 - statusBarHeight;
    double v13 = 0.0;
    if (v9 > v12)
    {
      double v14 = (float)(statusBarHeight + 0.0);
      if ((*((unsigned char *)self + 504) & 4) != 0) {
        double v13 = v14;
      }
      else {
        double v13 = 0.0;
      }
    }
    [(PLCropOverlayBottomBar *)self->__bottomBar bounds];
    double v16 = v10 - v15 - v13;
    -[PLCropOverlay _updateCropRectInRect:](self, "_updateCropRectInRect:", 0.0, v13, v8, v16);
    double v17 = -[PLCropOverlayCropView initWithFrame:]([PLCropOverlayCropView alloc], "initWithFrame:", 0.0, v13, v8, v16);
    self->_cropView = v17;
    -[PLCropOverlayCropView setCropRect:](v17, "setCropRect:", self->_cropRect.origin.x, self->_cropRect.origin.y, self->_cropRect.size.width, self->_cropRect.size.height);
    [(PLCropOverlayCropView *)self->_cropView setUserInteractionEnabled:0];
    [(PLCropOverlayCropView *)self->_cropView setOpaque:0];
    [(PLCropOverlayCropView *)self->_cropView setAutoresizingMask:18];
    cropView = self->_cropView;
    bottomBar = self->__bottomBar;
    [(PLCropOverlay *)self insertSubview:cropView belowSubview:bottomBar];
  }
}

- (PLCropOverlay)initWithFrame:(CGRect)a3
{
  return -[PLCropOverlay initWithFrame:mode:offsettingStatusBar:](self, "initWithFrame:mode:offsettingStatusBar:", 1, 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (PLCropOverlay)initWithFrame:(CGRect)a3 mode:(int)a4
{
  return -[PLCropOverlay initWithFrame:mode:offsettingStatusBar:](self, "initWithFrame:mode:offsettingStatusBar:", *(void *)&a4, 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)setOverlayContainerView:(id)a3
{
  if (!self->_mode)
  {
    overlayContainerView = self->_overlayContainerView;
    if (overlayContainerView != a3)
    {
      [(UIView *)overlayContainerView removeFromSuperview];

      double v6 = (UIView *)a3;
      self->_overlayContainerView = v6;
      [(PLCropOverlay *)self addSubview:v6];
    }
  }
}

- (id)overlayContainerView
{
  if (self->_mode) {
    return 0;
  }
  else {
    return self->_overlayContainerView;
  }
}

- (void)setControlsAreVisible:(BOOL)a3
{
  char v3 = *((unsigned char *)self + 504);
  if (((((v3 & 0x20) == 0) ^ a3) & 1) == 0)
  {
    char v5 = a3 ? 32 : 0;
    *((unsigned char *)self + 504) = v3 & 0xDF | v5;
    if (!self->_mode)
    {
      if (a3)
      {
        BOOL v6 = 0;
      }
      else
      {
        [(PLCropOverlay *)self setShowsCropRegion:0];
        [(PLCropOverlay *)self setCropRectVisible:0 duration:0.0];
        BOOL v6 = (*((unsigned char *)self + 504) & 0x20) == 0;
      }
      bottomBar = self->__bottomBar;
      [(PLCropOverlayBottomBar *)bottomBar setHidden:v6];
    }
  }
}

- (BOOL)controlsAreVisible
{
  return (*((unsigned __int8 *)self + 504) >> 5) & 1;
}

- (PLCropOverlayWallpaperBottomBar)wallpaperBottomBar
{
  return [(PLCropOverlayBottomBar *)self->__bottomBar wallpaperBottomBar];
}

- (void)setCameraBottomBar:(id)a3
{
  [(PLCropOverlayBottomBar *)self->__bottomBar setCameraBottomBar:a3];
  [(PLCropOverlay *)self setNeedsLayout];
}

- (UIView)cameraBottomBar
{
  return [(PLCropOverlayBottomBar *)self->__bottomBar cameraBottomBar];
}

- (void)layoutSubviews
{
  v43.receiver = self;
  v43.super_class = (Class)PLCropOverlay;
  [(PLCropOverlay *)&v43 layoutSubviews];
  [(PLCropOverlay *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  cropView = self->_cropView;
  if (cropView)
  {
    [(PLCropOverlayCropView *)cropView bounds];
    -[PLCropOverlay _updateCropRectInRect:](self, "_updateCropRectInRect:");
    -[PLCropOverlayCropView setCropRect:](self->_cropView, "setCropRect:", self->_cropRect.origin.x, self->_cropRect.origin.y, self->_cropRect.size.width, self->_cropRect.size.height);
  }
  if ([(PLCropOverlay *)self mode] == 5
    || (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42948], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) == 1
    && [(PLCropOverlay *)self mode] == 2)
  {
    id v12 = [(PLCropOverlay *)self bottomBar];
    [MEMORY[0x1E4F42F60] defaultHeight];
    double v14 = v13;
    v44.origin.double x = v4;
    v44.origin.double y = v6;
    v44.size.CGFloat width = v8;
    v44.size.double height = v10;
    double MaxY = CGRectGetMaxY(v44);
    [(PLCropOverlay *)self safeAreaInsets];
    double v17 = MaxY - (v14 + v16);
    v45.origin.double x = v4;
    v45.origin.double y = v6;
    v45.size.CGFloat width = v8;
    v45.size.double height = v10;
    double Width = CGRectGetWidth(v45);
    double x = 0.0;
    id v20 = v12;
    double y = v17;
    double height = v14;
  }
  else
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42D90], "mainScreen"), "scale");
    double v24 = 1.0 / v23 + 72.0;
    if ([(PLCropOverlay *)self mode] == 6) {
      double v24 = 49.0;
    }
    [(PLCropOverlay *)self safeAreaInsets];
    CGFloat v26 = v24 + v25;
    memset(&slice, 0, sizeof(slice));
    [(PLCropOverlay *)self bounds];
    CGRectDivide(v46, &slice, &v41, v26, CGRectMaxYEdge);
    id v20 = [(PLCropOverlay *)self bottomBar];
    double x = slice.origin.x;
    double y = slice.origin.y;
    double Width = slice.size.width;
    double height = slice.size.height;
  }
  objc_msgSend(v20, "setFrame:", x, y, Width, height);
  if ([(PLCropOverlay *)self contactPhotoOverlay]) {
    -[PLContactPhotoOverlay setFrame:]([(PLCropOverlay *)self contactPhotoOverlay], "setFrame:", v4, v6, v8, v10);
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42738], "sharedApplication"), "statusBarHeight");
  float v28 = v27;
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42D90], "mainScreen"), "bounds");
  -[PLCropOverlay convertRect:fromView:](self, "convertRect:fromView:", 0);
  double v30 = v29;
  [(PLCropOverlay *)self bounds];
  double v32 = v31;
  double v34 = v33;
  double v35 = v30 - v28;
  double v36 = 0.0;
  if (v33 > v35)
  {
    if ((*((unsigned char *)self + 504) & 4) != 0) {
      double v36 = (float)(v28 + 0.0);
    }
    else {
      double v36 = 0.0;
    }
  }
  [[(UIImageView *)self->_topShineView image] size];
  -[UIImageView setFrame:](self->_topShineView, "setFrame:", 0.0, v36, v32, v37);
  titleLabel = self->_titleLabel;
  [(UILabel *)titleLabel frame];
  UIRectCenteredIntegralRect();
  -[UILabel setFrame:](titleLabel, "setFrame:");
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42948], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    [[(UIImageView *)self->_bottomShineView image] size];
    -[UIImageView setFrame:](self->_bottomShineView, "setFrame:", 0.0, v34 - v39, v32, v39);
    UIRectCenteredYInRect();
    float v40 = (v32 + -16.0) * 0.5;
    [(UIButton *)self->_okButton setFrame:roundf(v40) + -132.0 + 148.0];
  }
}

- (void)setDisplayedInPopover:(BOOL)a3
{
  if (self->_displayedInPopover != a3)
  {
    self->_displayedInPopover = a3;
    bottomBar = self->__bottomBar;
    BOOL v4 = [(PLCropOverlay *)self isDisplayedInPopover];
    [(PLCropOverlayBottomBar *)bottomBar setInPopover:v4];
  }
}

- (PLCropOverlay)initWithFrame:(CGRect)a3 mode:(int)a4 offsettingStatusBar:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = *(void *)&a4;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v53.receiver = self;
  v53.super_class = (Class)PLCropOverlay;
  unint64_t v11 = -[PLCropOverlay initWithFrame:](&v53, sel_initWithFrame_);
  id v12 = v11;
  if (v11)
  {
    if (v5) {
      char v13 = 4;
    }
    else {
      char v13 = 0;
    }
    *((unsigned char *)v11 + 504) = *((unsigned char *)v11 + 504) & 0xFB | v13;
    *((unsigned char *)v11 + 504) |= 0x20u;
    [(PLCropOverlay *)v11 setAutoresizingMask:18];
    if (v6 == 5
      || (uint64_t v14 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42948], "currentDevice"), "userInterfaceIdiom"),
          v6 == 2)
      && (v14 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      CGFloat v15 = *MEMORY[0x1E4F1DB28];
      CGFloat v16 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      [MEMORY[0x1E4F42F60] defaultHeight];
      double v18 = v17;
      v54.origin.double x = v15;
      v54.origin.double y = v16;
      v54.size.double width = width;
      v54.size.double height = height;
      CGFloat v19 = CGRectGetMaxY(v54) - v18;
      v55.origin.double x = v15;
      v55.origin.double y = v16;
      v55.size.double width = width;
      v55.size.double height = height;
      id v20 = (UIToolbar *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42F60]), "initWithFrame:", 0.0, v19, CGRectGetWidth(v55), v18);
      v12->_customToolbar = v20;
      [(UIToolbar *)v20 setAutoresizingMask:10];
      [(PLCropOverlay *)v12 addSubview:v12->_customToolbar];
      [(PLCropOverlay *)v12 _updateToolbarItems:1];
    }
    else
    {
      if (v6 == 6)
      {
        double v23 = [PLCropOverlayBottomBar alloc];
        double v24 = *MEMORY[0x1E4F1DB28];
        double v25 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
        double v26 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
        double v27 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
        float v28 = -[PLCropOverlayBottomBar initWithFrame:](v23, "initWithFrame:", *MEMORY[0x1E4F1DB28], v25, v26, v27);
        v12->__bottomBar = v28;
        [(PLCropOverlayBottomBar *)v28 setAutoresizingMask:10];
        [(PLCropOverlayBottomBar *)v12->__bottomBar setInPopover:[(PLCropOverlay *)v12 isDisplayedInPopover]];
        [(PLCropOverlay *)v12 addSubview:v12->__bottomBar];
        double v29 = -[PLCropOverlayWallpaperBottomBar initWithFrame:]([PLCropOverlayWallpaperBottomBar alloc], "initWithFrame:", v24, v25, v26, v27);
        [(PLCropOverlayBottomBar *)v12->__bottomBar setWallpaperBottomBar:v29];

        double v30 = [(PLCropOverlayWallpaperBottomBar *)v29 doCancelButton];
        [(PLWallpaperButton *)v30 addTarget:v12 action:sel__tappedBottomBarCancelButton_ forControlEvents:64];
        if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42948], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) == 1)
        {
          uint64_t v31 = [MEMORY[0x1E4F428B8] lightGrayColor];
          [(PLWallpaperButton *)v30 setTitleColor:v31 forState:1];
          double v32 = [(PLCropOverlayWallpaperBottomBar *)v29 doSetHomeScreenButton];
          [(PLWallpaperButton *)v32 addTarget:v12 action:sel__tappedBottomBarSetHomeButton forControlEvents:64];
          [(PLWallpaperButton *)v32 setTitleColor:v31 forState:1];
          double v33 = [(PLCropOverlayWallpaperBottomBar *)v29 doSetLockScreenButton];
          [(PLWallpaperButton *)v33 addTarget:v12 action:sel__tappedBottomBarSetLockButton forControlEvents:64];
          [(PLWallpaperButton *)v33 setTitleColor:v31 forState:1];
          double v34 = [(PLCropOverlayWallpaperBottomBar *)v29 doSetBothScreenButton];
          [(PLWallpaperButton *)v34 addTarget:v12 action:sel__tappedBottomBarSetBothButton forControlEvents:64];
          [(PLWallpaperButton *)v34 setTitleColor:v31 forState:1];
          double v35 = [(PLCropOverlayWallpaperBottomBar *)v29 motionToggle];
          [(PLWallpaperButton *)v35 addTarget:v12 action:sel__tappedBottomBarMotionToggle forControlEvents:64];
          [(PLWallpaperButton *)v35 setTitleColor:v31 forState:1];
        }
        else
        {
          [(PLWallpaperButton *)[(PLCropOverlayWallpaperBottomBar *)v29 doSetButton] addTarget:v12 action:sel__tappedBottomBarDoneButton_ forControlEvents:64];
        }
        goto LABEL_9;
      }
      uint64_t v36 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42948], "currentDevice"), "userInterfaceIdiom");
      if (v6 != 1 || (v36 & 0xFFFFFFFFFFFFFFFBLL) != 1)
      {
        CGRect v41 = [PLCropOverlayBottomBar alloc];
        double v42 = *MEMORY[0x1E4F1DB28];
        double v43 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
        double v44 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
        double v45 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
        CGRect v46 = -[PLCropOverlayBottomBar initWithFrame:](v41, "initWithFrame:", *MEMORY[0x1E4F1DB28], v43, v44, v45);
        v12->__bottomBar = v46;
        [(PLCropOverlayBottomBar *)v46 setAutoresizingMask:2];
        [(PLCropOverlayBottomBar *)v12->__bottomBar setInPopover:[(PLCropOverlay *)v12 isDisplayedInPopover]];
        [(PLCropOverlay *)v12 addSubview:v12->__bottomBar];
        v47 = -[PLCropOverlayPreviewBottomBar initWithFrame:]([PLCropOverlayPreviewBottomBar alloc], "initWithFrame:", v42, v43, v44, v45);
        [(PLCropOverlayPreviewBottomBar *)v47 setBackgroundStyle:[(PLCropOverlay *)v12 isTelephonyUIMode:v6]];
        [(PLCropOverlayBottomBar *)v12->__bottomBar setPreviewBottomBar:v47];

        [(UIButton *)[(PLCropOverlayPreviewBottomBar *)v47 cancelButton] addTarget:v12 action:sel__tappedBottomBarCancelButton_ forControlEvents:64];
        [(UIButton *)[(PLCropOverlayPreviewBottomBar *)v47 doneButton] addTarget:v12 action:sel__tappedBottomBarDoneButton_ forControlEvents:64];
        [(UIButton *)[(PLCropOverlayPreviewBottomBar *)v47 playbackButton] addTarget:v12 action:sel__tappedBottomBarPlaybackButton_ forControlEvents:64];
        v48 = (UIButton *)[MEMORY[0x1E4F427E0] buttonWithType:0];
        v12->__cameraCancelButton = v48;
        -[UIButton setTitleColor:forState:](v48, "setTitleColor:forState:", [MEMORY[0x1E4F428B8] whiteColor], 0);
        [(UIButton *)v12->__cameraCancelButton addTarget:v12 action:sel__tappedBottomBarCancelButton_ forControlEvents:64];
        [(UIButton *)v12->__cameraCancelButton setExclusiveTouch:1];
        [(UIButton *)v12->__cameraCancelButton setTitle:PLLocalizedFrameworkString() forState:0];
        v49 = [(UIButton *)v12->__cameraCancelButton titleLabel];
        -[UILabel setFont:](v49, "setFont:", objc_msgSend(MEMORY[0x1E4F42A30], "fontWithDescriptor:size:", objc_msgSend(MEMORY[0x1E4F42A38], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E4F43870]), 18.0));
        v50 = v12->__cameraCancelButton;
        if ([(PLCropOverlay *)v12 isTelephonyUIMode:v6])
        {
          v51 = -[PLContactPhotoOverlay initWithFrame:]([PLContactPhotoOverlay alloc], "initWithFrame:", v42, v43, v44, v45);
          v12->_contactPhotoOverladouble y = v51;
          [(PLCropOverlay *)v12 insertSubview:v51 belowSubview:v12->__bottomBar];
          if (v6 != 7)
          {
            if (v6 == 3) {
              [(UIView *)v51 pl_setHidden:1 animated:0];
            }
            goto LABEL_9;
          }
        }
        else if (v6 != 7)
        {
          goto LABEL_9;
        }
        v52 = [(PLCropOverlayPreviewBottomBar *)v47 fileResizingButton];
        [(UIButton *)v52 setMenu:[(PLCropOverlay *)v12 _bottomBarFileSizeMenu]];
        [(UIButton *)v52 setShowsMenuAsPrimaryAction:1];
        goto LABEL_9;
      }
      double v37 = -[PLCropOverlay _newOverlayViewWithFrame:lighterEdgeOnTop:](v12, "_newOverlayViewWithFrame:lighterEdgeOnTop:", 0, x, 0.0, width, 53.0);
      v12->_wildcatPickerTopView = v37;
      [(UIView *)v37 setAutoresizingMask:34];
      [(PLCropOverlay *)v12 addSubview:v12->_wildcatPickerTopView];
      v38 = -[PLCropOverlay _newOverlayViewWithFrame:lighterEdgeOnTop:](v12, "_newOverlayViewWithFrame:lighterEdgeOnTop:", 1, x, y + height + -53.0, width, 53.0);
      v12->_wildcatPickerBottomView = v38;
      [(UIView *)v38 setAutoresizingMask:10];
      [(PLCropOverlay *)v12 addSubview:v12->_wildcatPickerBottomView];
      id v39 = objc_alloc(MEMORY[0x1E4F42B38]);
      [(UIView *)v12->_wildcatPickerBottomView bounds];
      float v40 = objc_msgSend(v39, "initWithFrame:");
      [v40 setText:PLLocalizedFrameworkString()];
      objc_msgSend(v40, "setBackgroundColor:", objc_msgSend(MEMORY[0x1E4F428B8], "clearColor"));
      [v40 setFont:UISystemFontBoldForSize()];
      objc_msgSend(v40, "setTextColor:", objc_msgSend(MEMORY[0x1E4F428B8], "whiteColor"));
      [v40 setTextAlignment:1];
      objc_msgSend(v40, "setShadowColor:", objc_msgSend(MEMORY[0x1E4F428B8], "colorWithWhite:alpha:", 0.0, 0.75));
      objc_msgSend(v40, "setShadowOffset:", 0.0, -1.0);
      [v40 sizeToFit];
      [v40 frame];
      objc_msgSend(v40, "setFrame:");
      [v40 setAutoresizingMask:2];
      [(UIView *)v12->_wildcatPickerBottomView addSubview:v40];
    }
LABEL_9:
    double v21 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
    [v21 addObserver:v12 selector:sel_statusBarHeightDidChange_ name:*MEMORY[0x1E4F436D8] object:0];
    [(PLCropOverlay *)v12 _setMode:v6];
    [(PLCropOverlay *)v12 _updateTitle];
  }
  return v12;
}

- (void)_savePhotoFinished:(id)a3
{
  [(PLCropOverlay *)self setProgressDone];
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42738], "sharedApplication"), "endIgnoringInteractionEvents");
  BOOL v5 = (void *)[a3 objectForKey:@"completionTarget"];
  [v5 cropOverlay:self didFinishSaving:a3];
}

- (void)_backgroundSavePhoto:(id)a3 cropRect:(CGRect)a4 minimalCropDimension:(double)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v11 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  id v12 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"tile"), "dictionaryWithCroppedImageForRect:minimalCropDimension:withOptions:", objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"options"), "unsignedIntValue"), x, y, width, height, a5);
  uint64_t v13 = [a3 objectForKey:@"completionTarget"];
  if (v12) {
    id v14 = (id)[v12 mutableCopy];
  }
  else {
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  CGFloat v15 = v14;
  if (v13) {
    [v14 setObject:v13 forKey:@"completionTarget"];
  }
  pl_dispatch_sync();
}

uint64_t __81__PLCropOverlay_PhotoSaving___backgroundSavePhoto_cropRect_minimalCropDimension___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _savePhotoFinished:*(void *)(a1 + 40)];
}

- (void)beginBackgroundSaveWithTile:(id)a3 progressTitle:(id)a4 completionCallbackTarget:(id)a5 options:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v11 = (void *)[a3 scrollView];
  id v12 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:v6];
  [v11 cancelMouseTracking];
  [v11 setUserInteractionEnabled:0];
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42738], "sharedApplication"), "beginIgnoringInteractionEvents");
  if (!a4) {
    a4 = (id)PLLocalizedFrameworkString();
  }
  [(PLCropOverlay *)self setShowProgress:1 title:a4];
  uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", a3, @"tile", a5, @"completionTarget", v12, @"options", 0);
  id v14 = (void *)[a3 scrollView];
  if ((v6 & 4) != 0) {
    [(PLContactPhotoOverlay *)[(PLCropOverlay *)self contactPhotoOverlay] inscribingBounds];
  }
  else {
    [(PLCropOverlay *)self cropRect];
  }
  objc_msgSend(v14, "convertRect:fromView:", self);
  CGFloat v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  CGFloat v16 = dispatch_queue_attr_make_with_qos_class(v15, QOS_CLASS_USER_INITIATED, 0);
  double v17 = dispatch_queue_create("com.apple.photos.plcropoverlay.save", v16);
  pl_dispatch_async();
  dispatch_release(v17);
}

uint64_t __105__PLCropOverlay_PhotoSaving__beginBackgroundSaveWithTile_progressTitle_completionCallbackTarget_options___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_backgroundSavePhoto:cropRect:minimalCropDimension:", *(void *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
}

@end