@interface PBUILivePhotoPlayerLiveWallpaperView
- (PBUILivePhotoPlayerLiveWallpaperView)init;
- (id)_playerUIView;
- (id)gestureRecognizer;
- (int64_t)playbackState;
- (void)_subclass_updateForForcingPlayback:(BOOL)a3;
- (void)_subclass_updatePlayerItemForUse:(id)a3;
@end

@implementation PBUILivePhotoPlayerLiveWallpaperView

- (PBUILivePhotoPlayerLiveWallpaperView)init
{
  v9.receiver = self;
  v9.super_class = (Class)PBUILivePhotoPlayerLiveWallpaperView;
  v2 = [(PBUILivePhotoPlayerLiveWallpaperView *)&v9 init];
  if (v2)
  {
    uint64_t v11 = 0;
    v12 = &v11;
    uint64_t v13 = 0x2050000000;
    v3 = (void *)getISLiveWallpaperUIViewClass_softClass;
    uint64_t v14 = getISLiveWallpaperUIViewClass_softClass;
    if (!getISLiveWallpaperUIViewClass_softClass)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __getISLiveWallpaperUIViewClass_block_invoke;
      v10[3] = &unk_1E62B2890;
      v10[4] = &v11;
      __getISLiveWallpaperUIViewClass_block_invoke((uint64_t)v10);
      v3 = (void *)v12[3];
    }
    v4 = v3;
    _Block_object_dispose(&v11, 8);
    v5 = (ISLiveWallpaperUIView *)objc_alloc_init(v4);
    liveWallpaperView = v2->_liveWallpaperView;
    v2->_liveWallpaperView = v5;

    v7 = [(ISLiveWallpaperUIView *)v2->_liveWallpaperView player];
    [(PBUILivePhotoPlayerView *)v2 _common_configurePlayer:v7];

    [(PBUILivePhotoPlayerView *)v2 _common_configurePlayerView:v2->_liveWallpaperView];
  }
  return v2;
}

- (id)gestureRecognizer
{
  return (id)[(ISLiveWallpaperUIView *)self->_liveWallpaperView playbackGestureRecognizer];
}

- (int64_t)playbackState
{
  v2 = [(ISLiveWallpaperUIView *)self->_liveWallpaperView player];
  int v3 = [v2 isPlaying];

  if (v3) {
    return 4;
  }
  else {
    return 0;
  }
}

- (id)_playerUIView
{
  return self->_liveWallpaperView;
}

- (void)_subclass_updateForForcingPlayback:(BOOL)a3
{
  v4 = [(ISLiveWallpaperUIView *)self->_liveWallpaperView player];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __75__PBUILivePhotoPlayerLiveWallpaperView__subclass_updateForForcingPlayback___block_invoke;
  v5[3] = &__block_descriptor_33_e31_v16__0__ISLiveWallpaperPlayer_8l;
  BOOL v6 = a3;
  [v4 performChanges:v5];
}

void __75__PBUILivePhotoPlayerLiveWallpaperView__subclass_updateForForcingPlayback___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned __int8 *)(a1 + 32);
  id v5 = a2;
  [v5 setTouching:v3];
  double v4 = 400.0;
  if (!*(unsigned char *)(a1 + 32)) {
    double v4 = 0.0;
  }
  [v5 setForce:v4];
}

- (void)_subclass_updatePlayerItemForUse:(id)a3
{
}

- (void).cxx_destruct
{
}

@end