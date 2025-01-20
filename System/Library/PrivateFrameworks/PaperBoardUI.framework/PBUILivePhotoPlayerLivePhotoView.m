@interface PBUILivePhotoPlayerLivePhotoView
- (PBUILivePhotoPlayerLivePhotoView)init;
- (id)_playerUIView;
- (id)gestureRecognizer;
- (int64_t)playbackState;
- (void)_subclass_updateForForcingPlayback:(BOOL)a3;
- (void)_subclass_updatePlayerItemForUse:(id)a3;
@end

@implementation PBUILivePhotoPlayerLivePhotoView

- (PBUILivePhotoPlayerLivePhotoView)init
{
  v9.receiver = self;
  v9.super_class = (Class)PBUILivePhotoPlayerLivePhotoView;
  v2 = [(PBUILivePhotoPlayerLivePhotoView *)&v9 init];
  if (v2)
  {
    uint64_t v11 = 0;
    v12 = &v11;
    uint64_t v13 = 0x2050000000;
    v3 = (void *)getISLivePhotoUIViewClass_softClass;
    uint64_t v14 = getISLivePhotoUIViewClass_softClass;
    if (!getISLivePhotoUIViewClass_softClass)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __getISLivePhotoUIViewClass_block_invoke;
      v10[3] = &unk_1E62B2890;
      v10[4] = &v11;
      __getISLivePhotoUIViewClass_block_invoke((uint64_t)v10);
      v3 = (void *)v12[3];
    }
    v4 = v3;
    _Block_object_dispose(&v11, 8);
    v5 = (ISLivePhotoUIView *)objc_alloc_init(v4);
    livePhotoView = v2->_livePhotoView;
    v2->_livePhotoView = v5;

    v7 = [(ISLivePhotoUIView *)v2->_livePhotoView player];
    [(PBUILivePhotoPlayerView *)v2 _common_configurePlayer:v7];

    [(PBUILivePhotoPlayerView *)v2 _common_configurePlayerView:v2->_livePhotoView];
  }
  return v2;
}

- (id)gestureRecognizer
{
  return (id)[(ISLivePhotoUIView *)self->_livePhotoView playbackGestureRecognizer];
}

- (int64_t)playbackState
{
  v2 = [(ISLivePhotoUIView *)self->_livePhotoView player];
  uint64_t v3 = [v2 currentPlaybackStyle];

  if ((unint64_t)(v3 - 1) > 3) {
    return 0;
  }
  else {
    return qword_1BC53ED78[v3 - 1];
  }
}

- (id)_playerUIView
{
  return self->_livePhotoView;
}

- (void)_subclass_updateForForcingPlayback:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = [(ISLivePhotoUIView *)self->_livePhotoView player];
  id v5 = v4;
  if (v3) {
    [v4 startPlaybackWithStyleWhenReady:1];
  }
  else {
    [v4 stopPlayback];
  }
}

- (void)_subclass_updatePlayerItemForUse:(id)a3
{
}

- (void).cxx_destruct
{
}

@end