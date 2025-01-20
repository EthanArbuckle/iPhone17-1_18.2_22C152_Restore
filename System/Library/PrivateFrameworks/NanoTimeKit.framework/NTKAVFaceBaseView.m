@interface NTKAVFaceBaseView
- (CLKVideoPlayerView)videoPlayerView;
- (NTKAVFaceBaseView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5;
- (UIImageView)posterImageView;
- (id)_posterImageView;
- (id)_selectedContentView;
- (void)_beginTransitionToOption;
- (void)_cleanupAfterTransitionToOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_createVideoPlayerViewIfNeeded;
- (void)_loadSnapshotContentViews;
- (void)_mediaServicesWereReset:(id)a3;
- (void)_prepareForEditing;
- (void)_reset;
- (void)_transitionToPosterView:(id)a3;
- (void)_unloadSnapshotContentViews;
- (void)dealloc;
- (void)layoutSubviews;
- (void)pauseVideoPlayerViewIfItExists;
- (void)setPosterImageView:(id)a3;
- (void)setVideoPlayerView:(id)a3;
@end

@implementation NTKAVFaceBaseView

- (void)dealloc
{
  [(NTKAVFaceBaseView *)self setVideoPlayerView:0];
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)NTKAVFaceBaseView;
  [(NTKFaceView *)&v4 dealloc];
}

- (NTKAVFaceBaseView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)NTKAVFaceBaseView;
  v5 = [(NTKFaceView *)&v8 initWithFaceStyle:a3 forDevice:a4 clientIdentifier:a5];
  if (v5)
  {
    v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:v5 selector:sel__mediaServicesWereReset_ name:*MEMORY[0x1E4F15048] object:0];
  }
  return v5;
}

- (void)_loadSnapshotContentViews
{
  v8.receiver = self;
  v8.super_class = (Class)NTKAVFaceBaseView;
  [(NTKBackgroundImageFaceView *)&v8 _loadSnapshotContentViews];
  if (!self->_posterImageView)
  {
    v3 = [(NTKAVFaceBaseView *)self _posterImageView];
    posterImageView = self->_posterImageView;
    self->_posterImageView = v3;
    v5 = v3;

    v6 = [(NTKBackgroundImageFaceView *)self backgroundContainerView];
    [v6 addSubview:self->_posterImageView];

    v7 = [(NTKBackgroundImageFaceView *)self backgroundContainerView];
    [v7 sendSubviewToBack:self->_posterImageView];
  }
}

- (void)_unloadSnapshotContentViews
{
  v3.receiver = self;
  v3.super_class = (Class)NTKAVFaceBaseView;
  [(NTKBackgroundImageFaceView *)&v3 _unloadSnapshotContentViews];
  [(UIImageView *)self->_posterImageView removeFromSuperview];
}

- (id)_selectedContentView
{
  kdebug_trace();
  posterImageView = self->_posterImageView;

  return posterImageView;
}

- (void)_transitionToPosterView:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (self->_posterImageView)
  {
    posterImageView = [v4 image];
    [(UIImageView *)self->_posterImageView setImage:posterImageView];
  }
  else
  {
    v7 = (UIImageView *)v4;
    posterImageView = self->_posterImageView;
    self->_posterImageView = v7;
  }

  id v8 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  [(CLKVideoPlayerView *)self->_videoPlayerView bounds];
  v9 = objc_msgSend(v8, "initWithFrame:");
  v10 = [MEMORY[0x1E4FB1618] blackColor];
  [v9 setBackgroundColor:v10];

  [v9 setAlpha:0.0];
  v11 = [(NTKFaceView *)self contentView];
  [v11 insertSubview:v9 aboveSubview:self->_videoPlayerView];

  v12 = (void *)MEMORY[0x1E4FB1EB0];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __45__NTKAVFaceBaseView__transitionToPosterView___block_invoke;
  v16[3] = &unk_1E62BFF20;
  id v17 = v9;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __45__NTKAVFaceBaseView__transitionToPosterView___block_invoke_2;
  v14[3] = &unk_1E62C3780;
  v14[4] = self;
  id v15 = v17;
  id v13 = v17;
  [v12 animateWithDuration:0x10000 delay:v16 options:v14 animations:0.2 completion:0.0];
}

uint64_t __45__NTKAVFaceBaseView__transitionToPosterView___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

void __45__NTKAVFaceBaseView__transitionToPosterView___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1072) removeFromSuperview];
  [*(id *)(*(void *)(a1 + 32) + 1072) pause];
  [*(id *)(*(void *)(a1 + 32) + 1080) setAlpha:0.0];
  v2 = [*(id *)(a1 + 32) backgroundContainerView];
  [v2 addSubview:*(void *)(*(void *)(a1 + 32) + 1080)];

  objc_super v3 = [*(id *)(a1 + 32) backgroundContainerView];
  [v3 sendSubviewToBack:*(void *)(*(void *)(a1 + 32) + 1080)];

  [*(id *)(*(void *)(a1 + 32) + 1080) setHidden:0];
  id v4 = (void *)MEMORY[0x1E4FB1EB0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __45__NTKAVFaceBaseView__transitionToPosterView___block_invoke_3;
  v8[3] = &unk_1E62C09C0;
  v5 = *(void **)(a1 + 40);
  v8[4] = *(void *)(a1 + 32);
  id v9 = v5;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__NTKAVFaceBaseView__transitionToPosterView___block_invoke_4;
  v6[3] = &unk_1E62C2648;
  id v7 = *(id *)(a1 + 40);
  [v4 animateWithDuration:0x10000 delay:v8 options:v6 animations:0.3 completion:0.0];
}

uint64_t __45__NTKAVFaceBaseView__transitionToPosterView___block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) posterImageView];
  [v2 setAlpha:1.0];

  objc_super v3 = *(void **)(a1 + 40);

  return [v3 setAlpha:0.0];
}

uint64_t __45__NTKAVFaceBaseView__transitionToPosterView___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

- (void)_prepareForEditing
{
  v4.receiver = self;
  v4.super_class = (Class)NTKAVFaceBaseView;
  [(NTKBackgroundImageFaceView *)&v4 _prepareForEditing];
  objc_super v3 = [(NTKAVFaceBaseView *)self _posterImageView];
  [(NTKAVFaceBaseView *)self _transitionToPosterView:v3];
}

- (void)_beginTransitionToOption
{
}

- (void)_cleanupAfterTransitionToOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)NTKAVFaceBaseView;
  [(NTKBackgroundImageFaceView *)&v8 _cleanupAfterTransitionToOption:a3 forCustomEditMode:a4 slot:a5];
  v6 = [(NTKBackgroundImageFaceView *)self backgroundContainerView];
  [v6 addSubview:self->_posterImageView];

  id v7 = [(NTKBackgroundImageFaceView *)self backgroundContainerView];
  [v7 sendSubviewToBack:self->_posterImageView];
}

- (void)_mediaServicesWereReset:(id)a3
{
  kdebug_trace();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__NTKAVFaceBaseView__mediaServicesWereReset___block_invoke;
  block[3] = &unk_1E62BFF20;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __45__NTKAVFaceBaseView__mediaServicesWereReset___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reset];
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)NTKAVFaceBaseView;
  [(NTKDigitalFaceView *)&v11 layoutSubviews];
  [(NTKAVFaceBaseView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[UIImageView ntk_setBoundsAndPositionFromFrame:](self->_posterImageView, "ntk_setBoundsAndPositionFromFrame:");
  -[CLKVideoPlayerView ntk_setBoundsAndPositionFromFrame:](self->_videoPlayerView, "ntk_setBoundsAndPositionFromFrame:", v4, v6, v8, v10);
}

- (CLKVideoPlayerView)videoPlayerView
{
  [(NTKAVFaceBaseView *)self _createVideoPlayerViewIfNeeded];
  videoPlayerView = self->_videoPlayerView;

  return videoPlayerView;
}

- (void)pauseVideoPlayerViewIfItExists
{
}

- (void)_createVideoPlayerViewIfNeeded
{
  if (!self->_videoPlayerView)
  {
    kdebug_trace();
    id v3 = objc_alloc(MEMORY[0x1E4F19AF0]);
    [(NTKAVFaceBaseView *)self bounds];
    double v4 = objc_msgSend(v3, "initWithFrame:");
    [(NTKAVFaceBaseView *)self setVideoPlayerView:v4];

    videoPlayerView = self->_videoPlayerView;
    [(CLKVideoPlayerView *)videoPlayerView setDelegate:self];
  }
}

- (void)_reset
{
  [(CLKVideoPlayerView *)self->_videoPlayerView setDelegate:0];
  [(CLKVideoPlayerView *)self->_videoPlayerView pause];
  [(CLKVideoPlayerView *)self->_videoPlayerView removeFromSuperview];
  [(NTKAVFaceBaseView *)self setVideoPlayerView:0];
  [(NTKAVFaceBaseView *)self _createVideoPlayerViewIfNeeded];
  if ([(NTKFaceView *)self dataMode] == 1)
  {
    [(UIImageView *)self->_posterImageView removeFromSuperview];
    posterImageView = self->_posterImageView;
    self->_posterImageView = 0;

    [(NTKAVFaceBaseView *)self addSubview:self->_videoPlayerView];
    videoPlayerView = self->_videoPlayerView;
    [(NTKAVFaceBaseView *)self sendSubviewToBack:videoPlayerView];
  }
}

- (id)_posterImageView
{
  return 0;
}

- (void)setVideoPlayerView:(id)a3
{
}

- (UIImageView)posterImageView
{
  return self->_posterImageView;
}

- (void)setPosterImageView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_posterImageView, 0);

  objc_storeStrong((id *)&self->_videoPlayerView, 0);
}

@end