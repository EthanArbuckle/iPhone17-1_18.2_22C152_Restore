@interface PBUILivePhotoPlayerView
+ (PBUILivePhotoPlayerView)playerViewWithRewindPlaybackStyle:(BOOL)a3;
- (BOOL)_isForcingPlayback;
- (BOOL)isInteracting;
- (ISBasePlayerUIView)_playerUIView;
- (PBUILivePhotoPlayerViewDelegate)delegate;
- (UIGestureRecognizer)gestureRecognizer;
- (id)videoPlayerForPlayer:(id)a3;
- (int64_t)playbackState;
- (void)_common_configurePlayer:(id)a3;
- (void)_common_configurePlayerView:(id)a3;
- (void)_handlePlaybackGesture:(id)a3;
- (void)_setInteracting:(BOOL)a3;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)prepareWithPhoto:(CGImage *)a3 videoAsset:(id)a4 photoTime:(double)a5 photoEXIFOrientation:(int)a6;
- (void)setContentMode:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)startPlaybackWithReason:(id)a3;
- (void)stopPlaybackWithReason:(id)a3;
@end

@implementation PBUILivePhotoPlayerView

+ (PBUILivePhotoPlayerView)playerViewWithRewindPlaybackStyle:(BOOL)a3
{
  v3 = off_1E62B2240;
  if (!a3) {
    v3 = off_1E62B2238;
  }
  id v4 = objc_alloc_init(*v3);
  return (PBUILivePhotoPlayerView *)v4;
}

- (void)prepareWithPhoto:(CGImage *)a3 videoAsset:(id)a4 photoTime:(double)a5 photoEXIFOrientation:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v10 = a4;
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x2050000000;
  v11 = (void *)getISAssetClass_softClass;
  uint64_t v40 = getISAssetClass_softClass;
  if (!getISAssetClass_softClass)
  {
    uint64_t v32 = MEMORY[0x1E4F143A8];
    uint64_t v33 = 3221225472;
    v34 = __getISAssetClass_block_invoke;
    v35 = &unk_1E62B2890;
    v36 = &v37;
    __getISAssetClass_block_invoke((uint64_t)&v32);
    v11 = (void *)v38[3];
  }
  v12 = v11;
  _Block_object_dispose(&v37, 8);
  v13 = (void *)[[v12 alloc] initWithVideoAsset:v10 photo:a3 photoTime:v6 photoEXIFOrientation:a5];
  v14 = [MEMORY[0x1E4F42D90] mainScreen];
  [v14 bounds];
  double v16 = v15;
  double v18 = v17;

  v19 = [MEMORY[0x1E4F42D90] mainScreen];
  [v19 scale];
  CGFloat v21 = v20;

  CGAffineTransformMakeScale(&v31, v21, v21);
  double a = v31.a;
  double b = v31.b;
  double c = v31.c;
  double d = v31.d;
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x2050000000;
  v26 = (void *)getISPlayerItemClass_softClass;
  uint64_t v40 = getISPlayerItemClass_softClass;
  if (!getISPlayerItemClass_softClass)
  {
    uint64_t v32 = MEMORY[0x1E4F143A8];
    uint64_t v33 = 3221225472;
    v34 = __getISPlayerItemClass_block_invoke;
    v35 = &unk_1E62B2890;
    v36 = &v37;
    __getISPlayerItemClass_block_invoke((uint64_t)&v32);
    v26 = (void *)v38[3];
  }
  id v27 = v26;
  _Block_object_dispose(&v37, 8);
  v28 = objc_msgSend(v27, "playerItemWithAsset:targetSize:", v13, v18 * c + a * v16, v18 * d + b * v16);
  [v28 registerChangeObserver:self context:PlayerItemObservationContext];
  [(PBUILivePhotoPlayerView *)self _subclass_updatePlayerItemForUse:v28];
  v29 = [(PBUILivePhotoPlayerView *)self _playerUIView];
  v30 = [v29 player];
  [v30 setPlayerItem:v28];
}

- (void)startPlaybackWithReason:(id)a3
{
  id v4 = a3;
  forcePlaybackReasons = self->_forcePlaybackReasons;
  id v8 = v4;
  if (!forcePlaybackReasons)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA80] set];
    v7 = self->_forcePlaybackReasons;
    self->_forcePlaybackReasons = v6;

    id v4 = v8;
    forcePlaybackReasons = self->_forcePlaybackReasons;
  }
  [(NSMutableSet *)forcePlaybackReasons addObject:v4];
  [(PBUILivePhotoPlayerView *)self _subclass_updateForForcingPlayback:[(PBUILivePhotoPlayerView *)self _isForcingPlayback]];
}

- (void)stopPlaybackWithReason:(id)a3
{
  [(NSMutableSet *)self->_forcePlaybackReasons removeObject:a3];
  BOOL v4 = [(PBUILivePhotoPlayerView *)self _isForcingPlayback];
  [(PBUILivePhotoPlayerView *)self _subclass_updateForForcingPlayback:v4];
}

- (void)setContentMode:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PBUILivePhotoPlayerView;
  -[PBUILivePhotoPlayerView setContentMode:](&v6, sel_setContentMode_);
  v5 = [(PBUILivePhotoPlayerView *)self _playerUIView];
  [v5 setContentMode:a3];
}

- (BOOL)_isForcingPlayback
{
  return [(NSMutableSet *)self->_forcePlaybackReasons count] != 0;
}

- (void)_common_configurePlayer:(id)a3
{
  id v4 = a3;
  [v4 setAudioEnabled:0];
  [v4 registerChangeObserver:self context:PlayerObservationContext];
  [v4 setDelegate:self];
}

- (void)_common_configurePlayerView:(id)a3
{
  id v4 = a3;
  [(PBUILivePhotoPlayerView *)self bounds];
  objc_msgSend(v4, "setFrame:");
  [v4 setAutoresizingMask:18];
  [(PBUILivePhotoPlayerView *)self addSubview:v4];

  id v5 = [(PBUILivePhotoPlayerView *)self gestureRecognizer];
  [v5 addTarget:self action:sel__handlePlaybackGesture_];
}

- (void)_setInteracting:(BOOL)a3
{
  if (self->_interacting != a3)
  {
    self->_interacting = a3;
    id v4 = [(PBUILivePhotoPlayerView *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v4 playerViewIsInteractingDidChange:self];
    }
  }
}

- (void)_handlePlaybackGesture:(id)a3
{
  BOOL v4 = (unint64_t)([a3 state] - 1) < 2;
  [(PBUILivePhotoPlayerView *)self _setInteracting:v4];
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v8 = a3;
  v9 = [(PBUILivePhotoPlayerView *)self delegate];
  if ((void *)PlayerObservationContext != a5) {
    goto LABEL_2;
  }
  uint64_t v20 = 0;
  CGFloat v21 = &v20;
  uint64_t v22 = 0x2050000000;
  id v10 = (void *)getISLiveWallpaperPlayerClass_softClass;
  uint64_t v23 = getISLiveWallpaperPlayerClass_softClass;
  if (!getISLiveWallpaperPlayerClass_softClass)
  {
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    double v17 = __getISLiveWallpaperPlayerClass_block_invoke;
    double v18 = &unk_1E62B2890;
    v19 = &v20;
    __getISLiveWallpaperPlayerClass_block_invoke((uint64_t)&v15);
    id v10 = (void *)v21[3];
  }
  id v11 = v10;
  _Block_object_dispose(&v20, 8);
  if (objc_opt_isKindOfClass())
  {
    if ((v6 & 0x10) == 0) {
      goto LABEL_2;
    }
    goto LABEL_12;
  }
  uint64_t v20 = 0;
  CGFloat v21 = &v20;
  uint64_t v22 = 0x2050000000;
  v12 = (void *)getISLivePhotoPlayerClass_softClass;
  uint64_t v23 = getISLivePhotoPlayerClass_softClass;
  if (!getISLivePhotoPlayerClass_softClass)
  {
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    double v17 = __getISLivePhotoPlayerClass_block_invoke;
    double v18 = &unk_1E62B2890;
    v19 = &v20;
    __getISLivePhotoPlayerClass_block_invoke((uint64_t)&v15);
    v12 = (void *)v21[3];
  }
  id v13 = v12;
  _Block_object_dispose(&v20, 8);
  char isKindOfClass = objc_opt_isKindOfClass();
  if (v6 & 8) != 0 && (isKindOfClass)
  {
LABEL_12:
    if (objc_opt_respondsToSelector()) {
      [v9 playerViewPlaybackStateDidChange:self];
    }
  }
LABEL_2:
}

- (id)videoPlayerForPlayer:(id)a3
{
  BOOL v4 = [(PBUILivePhotoPlayerView *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v5 = [v4 videoPlayerForPlayerView:self];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (PBUILivePhotoPlayerViewDelegate)delegate
{
  WeakRetainedouble d = objc_loadWeakRetained((id *)&self->_delegate);
  return (PBUILivePhotoPlayerViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isInteracting
{
  return self->_interacting;
}

- (ISBasePlayerUIView)_playerUIView
{
  return self->__playerUIView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__playerUIView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_forcePlaybackReasons, 0);
}

- (UIGestureRecognizer)gestureRecognizer
{
  return 0;
}

- (int64_t)playbackState
{
  return 0;
}

@end