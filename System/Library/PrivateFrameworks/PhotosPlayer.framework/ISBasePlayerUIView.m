@interface ISBasePlayerUIView
+ (Class)playerClass;
+ (id)audioSessionQueue;
+ (id)livePhotoAudioSession;
+ (void)_handleAVResourceReclamationEvent:(id)a3;
- (BOOL)isDisplayingPhoto;
- (BOOL)isVideoReadyForDisplay;
- (CAFilter)videoFilter;
- (CAMeshTransform)videoTransform;
- (CGPoint)scaleAnchorOffset;
- (CGRect)contentsRect;
- (ISBasePlayer)player;
- (ISBasePlayerUIView)initWithCoder:(id)a3;
- (ISBasePlayerUIView)initWithFrame:(CGRect)a3;
- (ISBasePlayerUIViewChangeObserver)_changeObserver;
- (ISVideoPlayerUIView)videoBlurView;
- (ISVideoPlayerUIView)videoView;
- (ISWrappedAVAudioSession)wrappedAudioSession;
- (PXAVResourceReclamationController)resourceReclamationController;
- (UIImage)overrideImage;
- (UIImageView)photoView;
- (UIView)containerView;
- (UIView)customPhotoView;
- (UIView)videoContainerView;
- (id)generateSnapshotImage;
- (id)videoLayerReadyForDisplayChangeHandler;
- (int64_t)preferredImageDynamicRange;
- (void)_performCommonInitialization;
- (void)_setChangeObserver:(id)a3;
- (void)_setWrappedAudioSession:(id)a3;
- (void)_signalChange:(unint64_t)a3 withAnimationDuration:(double)a4;
- (void)_updateAudioSession;
- (void)_updatePhotoView;
- (void)_updatePhotoViewDynamicRange;
- (void)_updatePlayerAudioSession;
- (void)_updateVideoViewsFrameWithContainerBounds:(CGRect)a3;
- (void)_videoViewReadyForDisplayDidChange;
- (void)applyOutputInfo:(id)a3 withTransitionOptions:(id)a4 completion:(id)a5;
- (void)applyScale:(double)a3 withTransitionOptions:(id)a4 completion:(id)a5;
- (void)layoutSubviews;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)registerChangeObserver:(id)a3;
- (void)setContent:(id)a3;
- (void)setContentMode:(int64_t)a3;
- (void)setContentsRect:(CGRect)a3;
- (void)setCustomPhotoView:(id)a3;
- (void)setOverrideImage:(id)a3;
- (void)setPlayer:(id)a3;
- (void)setPreferredImageDynamicRange:(int64_t)a3;
- (void)setScaleAnchorOffset:(CGPoint)a3;
- (void)setVideoFilter:(id)a3;
- (void)setVideoLayerReadyForDisplayChangeHandler:(id)a3;
- (void)setVideoTransform:(id)a3;
- (void)unregisterChangeObserver:(id)a3;
@end

@implementation ISBasePlayerUIView

- (void)setPlayer:(id)a3
{
  v5 = (ISBasePlayer *)a3;
  p_player = &self->_player;
  player = self->_player;
  if (player != v5)
  {
    v8 = v5;
    [(ISObservable *)player unregisterChangeObserver:self context:ISBasePlayerUIViewPlayerObservationContext];
    [(ISBasePlayer *)*p_player removeOutput:self];
    [(ISBasePlayerUIView *)self setContent:0];
    objc_storeStrong((id *)&self->_player, a3);
    [(ISBasePlayer *)*p_player addOutput:self];
    [(ISObservable *)*p_player registerChangeObserver:self context:ISBasePlayerUIViewPlayerObservationContext];
    player = (ISBasePlayer *)[(ISBasePlayerUIView *)self playerDidChange];
    v5 = v8;
  }

  MEMORY[0x1F41817F8](player, v5);
}

- (void)setContent:(id)a3
{
  v5 = (ISPlayerOutputContent *)a3;
  v6 = v5;
  if (self->_content != v5)
  {
    v19 = v5;
    v5 = (ISPlayerOutputContent *)-[ISPlayerOutputContent isEqual:](v5, "isEqual:");
    v6 = v19;
    if ((v5 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_content, a3);
      v7 = [(ISBasePlayerUIView *)self photoView];
      v8 = [(ISBasePlayerUIView *)self videoView];
      v9 = [(ISBasePlayerUIView *)self overrideImage];

      if (v9)
      {
        uint64_t v10 = [(ISBasePlayerUIView *)self overrideImage];
      }
      else
      {
        uint64_t v16 = [(ISPlayerOutputContent *)v19 photo];
        id v17 = [v7 image];
        uint64_t v18 = [v17 CGImage];

        v12 = v19;
        if (v16 == v18) {
          goto LABEL_7;
        }
        if (!v16)
        {
          [v7 setImage:0];
          goto LABEL_6;
        }
        [(ISPlayerOutputContent *)v19 photoEXIFOrientation];
        uint64_t v10 = [objc_alloc(MEMORY[0x1E4F42A80]) initWithCGImage:v16 scale:PLImageOrientationFromExifOrientation() orientation:1.0];
      }
      v11 = (void *)v10;
      [v7 setImage:v10];

LABEL_6:
      v12 = v19;
LABEL_7:
      v13 = [(ISPlayerOutputContent *)v12 videoPlayer];
      [v8 setVideoPlayer:v13];
      v14 = [(ISPlayerOutputContent *)v19 videoPlayer];
      v15 = [(ISBasePlayerUIView *)self videoBlurView];
      [v15 setVideoPlayer:v14];

      [(ISBasePlayerUIView *)self _updatePhotoView];
      [(ISBasePlayerUIView *)self setNeedsLayout];

      v6 = v19;
    }
  }

  MEMORY[0x1F41817F8](v5, v6);
}

- (void)_updatePhotoView
{
  id v11 = [(ISBasePlayerUIView *)self photoView];
  v3 = [(ISBasePlayerUIView *)self customPhotoView];
  v4 = [(ISBasePlayerUIView *)self containerView];
  v5 = self->_content;
  v6 = v5;
  if (v3 && (!v5 || [(ISPlayerOutputContent *)v5 photoIsOriginal]))
  {
    [v11 removeFromSuperview];
    v7 = [v3 superview];

    if (v7 == v4) {
      goto LABEL_9;
    }
    v8 = v4;
    id v9 = v3;
  }
  else
  {
    uint64_t v10 = [v11 superview];

    if (v10) {
      goto LABEL_9;
    }
    [v3 removeFromSuperview];
    v8 = v4;
    id v9 = v11;
  }
  [v8 insertSubview:v9 atIndex:0];
LABEL_9:
  [(ISBasePlayerUIView *)self setNeedsLayout];
}

- (ISWrappedAVAudioSession)wrappedAudioSession
{
  return self->_wrappedAudioSession;
}

- (ISVideoPlayerUIView)videoView
{
  return self->_videoView;
}

- (UIImage)overrideImage
{
  return self->_overrideImage;
}

- (UIView)customPhotoView
{
  return self->_customPhotoView;
}

- (void)applyOutputInfo:(id)a3 withTransitionOptions:(id)a4 completion:(id)a5
{
  id v26 = a4;
  id v8 = a5;
  id v9 = a3;
  [(ISBasePlayerUIView *)self layoutIfNeeded];
  uint64_t v10 = [(ISBasePlayerUIView *)self videoContainerView];
  id v11 = [(ISBasePlayerUIView *)self photoView];
  v12 = [(ISBasePlayerUIView *)self customPhotoView];
  BOOL v13 = [(ISBasePlayerUIView *)self isDisplayingPhoto];
  v14 = [v12 layer];
  v15 = v14;
  if (v14)
  {
    id v16 = v14;
  }
  else
  {
    id v16 = [v11 layer];
  }
  id v17 = v16;

  uint64_t v18 = +[ISTransitionApplier defaultApplier];
  v19 = [v10 layer];
  [v18 applyOutputInfo:v9 withTransitionOptions:v26 toPhotoLayer:v17 videoLayer:v19 completion:v8];

  v20 = NSNumber;
  [v9 videoAlpha];
  double v22 = v21;

  v23 = [v20 numberWithDouble:v22];
  v24 = [(ISBasePlayerUIView *)self videoBlurView];
  v25 = [v24 layer];
  [v18 setValue:v23 forKeyPath:@"opacity" ofLayer:v25 withTransitionOptions:v26 completion:0];

  if (v13 != [(ISBasePlayerUIView *)self isDisplayingPhoto])
  {
    [v26 transitionDuration];
    -[ISBasePlayerUIView _signalChange:withAnimationDuration:](self, "_signalChange:withAnimationDuration:", 1);
  }
}

- (BOOL)isDisplayingPhoto
{
  v2 = [(ISBasePlayerUIView *)self videoContainerView];
  [v2 alpha];
  BOOL v4 = v3 == 0.0;

  return v4;
}

- (ISVideoPlayerUIView)videoBlurView
{
  return self->_videoBlurView;
}

- (UIView)videoContainerView
{
  return self->_videoContainerView;
}

- (void)layoutSubviews
{
  v57.receiver = self;
  v57.super_class = (Class)ISBasePlayerUIView;
  [(ISBasePlayerUIView *)&v57 layoutSubviews];
  [(ISBasePlayerUIView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id v11 = [(ISBasePlayerUIView *)self containerView];
  v12 = [(ISBasePlayerUIView *)self photoView];
  BOOL v13 = [(ISBasePlayerUIView *)self customPhotoView];
  v14 = [(ISBasePlayerUIView *)self videoView];
  v15 = [(ISBasePlayerUIView *)self videoContainerView];
  id v16 = [(ISBasePlayerUIView *)self videoBlurView];
  uint64_t v17 = [(ISBasePlayerUIView *)self contentMode];
  uint64_t v18 = [v14 layer];
  [v18 setMeshTransform:0];

  v19 = [v12 image];
  [v19 size];
  if (v19)
  {
    BOOL v22 = v21 == *(double *)(MEMORY[0x1E4F1DB30] + 8) && v20 == *MEMORY[0x1E4F1DB30];
    if (!v22 && v17 != 2)
    {
      double v24 = v20 / v21;
      v58.origin.double x = v4;
      v58.origin.double y = v6;
      v58.size.double width = v8;
      v58.size.double height = v10;
      double MidX = CGRectGetMidX(v58);
      v59.origin.double x = v4;
      v59.origin.double y = v6;
      v59.size.double width = v8;
      v59.size.double height = v10;
      double MidY = CGRectGetMidY(v59);
      if (v8 / v10 > v24) {
        double v8 = v10 * v24;
      }
      else {
        double v10 = v8 / v24;
      }
      double v4 = MidX + v8 * -0.5;
      double v6 = MidY + v10 * -0.5;
    }
  }
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);
  [v11 bounds];
  double x = v60.origin.x;
  double y = v60.origin.y;
  double width = v60.size.width;
  double height = v60.size.height;
  double v31 = CGRectGetMidX(v60);
  v61.origin.double x = x;
  v61.origin.double y = y;
  v61.size.double width = width;
  v61.size.double height = height;
  double v32 = CGRectGetMidY(v61);
  objc_msgSend(v12, "setCenter:", v31, v32);
  objc_msgSend(v12, "setBounds:", x, y, width, height);
  [v12 setContentMode:v17];
  objc_msgSend(v13, "setCenter:", v31, v32);
  objc_msgSend(v13, "setBounds:", x, y, width, height);
  objc_msgSend(v15, "setCenter:", v31, v32);
  objc_msgSend(v15, "setBounds:", x, y, width, height);
  [v15 setContentMode:v17];
  objc_msgSend(v14, "setCenter:", v31, v32);
  objc_msgSend(v14, "setBounds:", x, y, width, height);
  [v14 setContentMode:v17];
  objc_msgSend(v16, "setCenter:", v31, v32);
  objc_msgSend(v16, "setBounds:", x, y, width, height);
  [v16 setContentMode:v17];
  -[ISBasePlayerUIView _updateVideoViewsFrameWithContainerBounds:](self, "_updateVideoViewsFrameWithContainerBounds:", x, y, width, height);
  [(ISBasePlayerUIView *)self scaleAnchorOffset];
  double v34 = v33;
  double v36 = v35;
  v62.origin.double x = x;
  v62.origin.double y = y;
  v62.size.double width = width;
  v62.size.double height = height;
  double v37 = 0.5;
  double v38 = 0.5;
  if (!CGRectIsEmpty(v62))
  {
    v63.origin.double x = x;
    v63.origin.double y = y;
    v63.size.double width = width;
    v63.size.double height = height;
    double v38 = v34 / CGRectGetWidth(v63) + 0.5;
    v64.origin.double x = x;
    v64.origin.double y = y;
    v64.size.double width = width;
    v64.size.double height = height;
    double v37 = v36 / CGRectGetHeight(v64) + 0.5;
  }
  v39 = [v12 layer];
  objc_msgSend(v39, "setAnchorPoint:", v38, v37);

  [v12 center];
  objc_msgSend(v12, "setCenter:", v40 + v34, v41 + v36);
  v42 = [v13 layer];
  objc_msgSend(v42, "setAnchorPoint:", v38, v37);

  [v13 center];
  objc_msgSend(v13, "setCenter:", v43 + v34, v44 + v36);
  v45 = [v14 layer];
  objc_msgSend(v45, "setAnchorPoint:", v38, v37);

  [v14 center];
  objc_msgSend(v14, "setCenter:", v46 + v34, v47 + v36);
  v48 = [v16 layer];
  objc_msgSend(v48, "setAnchorPoint:", v38, v37);

  [v16 center];
  objc_msgSend(v16, "setCenter:", v49 + v34, v50 + v36);
  v51 = [v15 layer];
  objc_msgSend(v51, "setAnchorPoint:", v38, v37);

  [v15 center];
  objc_msgSend(v15, "setCenter:", v52 + v34, v53 + v36);
  v54 = [(ISBasePlayerUIView *)self videoTransform];
  v55 = [v14 layer];
  [v55 setMeshTransform:v54];

  v56 = [(ISBasePlayerUIView *)self videoTransform];
  [v16 setHidden:v56 == 0];
}

- (CAMeshTransform)videoTransform
{
  return self->_videoTransform;
}

- (ISBasePlayerUIView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ISBasePlayerUIView;
  double v3 = -[ISBasePlayerUIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3) {
    [(ISBasePlayerUIView *)v3 _performCommonInitialization];
  }
  return v4;
}

- (void)_performCommonInitialization
{
  v37[1] = *MEMORY[0x1E4F143B8];
  p_contentsRect = &self->_contentsRect;
  self->_contentsRect = *(CGRect *)ISRectUnit;
  double v4 = (PXAVResourceReclamationController *)objc_alloc_init(MEMORY[0x1E4F8EB78]);
  resourceReclamationController = self->_resourceReclamationController;
  self->_resourceReclamationController = v4;

  [(PXAVResourceReclamationController *)self->_resourceReclamationController registerObserver:self];
  self->_preferredImageDynamicRange = 0;
  [(ISBasePlayerUIView *)self _updateAudioSession];
  [(ISBasePlayerUIView *)self setClipsToBounds:1];
  objc_super v6 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
  containerView = self->_containerView;
  self->_containerView = v6;

  [(UIView *)self->_containerView setClipsToBounds:1];
  [(ISBasePlayerUIView *)self addSubview:self->_containerView];
  double v8 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4F42AA0]);
  photoView = self->_photoView;
  self->_photoView = v8;

  double x = p_contentsRect->origin.x;
  double y = p_contentsRect->origin.y;
  double width = p_contentsRect->size.width;
  double height = p_contentsRect->size.height;
  v14 = [(UIImageView *)self->_photoView layer];
  objc_msgSend(v14, "setContentsRect:", x, y, width, height);

  v15 = objc_alloc_init(ISVideoPlayerUIView);
  videoView = self->_videoView;
  self->_videoView = v15;

  double v17 = p_contentsRect->origin.x;
  double v18 = p_contentsRect->origin.y;
  double v19 = p_contentsRect->size.width;
  double v20 = p_contentsRect->size.height;
  double v21 = [(ISVideoPlayerUIView *)self->_videoView layer];
  objc_msgSend(v21, "setContentsRect:", v17, v18, v19, v20);

  objc_initWeak(&location, self);
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __50__ISBasePlayerUIView__performCommonInitialization__block_invoke;
  v34[3] = &unk_1E6BECB10;
  objc_copyWeak(&v35, &location);
  [(ISVideoPlayerUIView *)self->_videoView setVideoLayerReadyForDisplayChangeHandler:v34];
  BOOL v22 = objc_alloc_init(ISVideoPlayerUIView);
  videoBlurView = self->_videoBlurView;
  self->_videoBlurView = v22;

  double v24 = p_contentsRect->origin.x;
  double v25 = p_contentsRect->origin.y;
  double v26 = p_contentsRect->size.width;
  double v27 = p_contentsRect->size.height;
  v28 = [(ISVideoPlayerUIView *)self->_videoBlurView layer];
  objc_msgSend(v28, "setContentsRect:", v24, v25, v26, v27);

  v29 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A0D0]];
  [v29 setName:@"vitalityBlur"];
  [v29 setCachesInputImage:0];
  [v29 setValue:&unk_1F3554990 forKey:@"inputRadius"];
  [v29 setValue:MEMORY[0x1E4F1CC38] forKey:@"inputHardEdges"];
  [v29 setValue:@"medium" forKey:@"inputQuality"];
  v37[0] = v29;
  v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:1];
  double v31 = [(ISVideoPlayerUIView *)self->_videoBlurView layer];
  [v31 setFilters:v30];

  double v32 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
  videoContainerView = self->_videoContainerView;
  self->_videoContainerView = v32;

  [(UIView *)self->_videoContainerView addSubview:self->_videoBlurView];
  [(UIView *)self->_videoContainerView addSubview:self->_videoView];
  [(UIView *)self->_containerView addSubview:self->_photoView];
  [(UIView *)self->_containerView addSubview:self->_videoContainerView];
  [(ISBasePlayerUIView *)self _updatePhotoViewDynamicRange];

  objc_destroyWeak(&v35);
  objc_destroyWeak(&location);
}

- (CGPoint)scaleAnchorOffset
{
  double x = self->_scaleAnchorOffset.x;
  double y = self->_scaleAnchorOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

void __50__ISBasePlayerUIView__performCommonInitialization__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _videoViewReadyForDisplayDidChange];
}

- (void)setContentMode:(int64_t)a3
{
  if ([(ISBasePlayerUIView *)self contentMode] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)ISBasePlayerUIView;
    [(ISBasePlayerUIView *)&v5 setContentMode:a3];
    [(ISBasePlayerUIView *)self setNeedsLayout];
  }
}

- (void)_setWrappedAudioSession:(id)a3
{
  objc_super v5 = (ISWrappedAVAudioSession *)a3;
  p_wrappedAudioSession = &self->_wrappedAudioSession;
  if (self->_wrappedAudioSession != v5)
  {
    double v7 = v5;
    objc_storeStrong((id *)p_wrappedAudioSession, a3);
    p_wrappedAudioSession = (ISWrappedAVAudioSession **)[(ISBasePlayerUIView *)self audioSessionDidChange];
    objc_super v5 = v7;
  }

  MEMORY[0x1F41817F8](p_wrappedAudioSession, v5);
}

- (void)setVideoLayerReadyForDisplayChangeHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoView, 0);
  objc_storeStrong((id *)&self->_photoView, 0);
  objc_storeStrong((id *)&self->_resourceReclamationController, 0);
  objc_storeStrong((id *)&self->_videoBlurView, 0);
  objc_destroyWeak((id *)&self->__changeObserver);
  objc_storeStrong((id *)&self->_wrappedAudioSession, 0);
  objc_storeStrong((id *)&self->_videoContainerView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_videoFilter, 0);
  objc_storeStrong((id *)&self->_videoTransform, 0);
  objc_storeStrong(&self->_videoLayerReadyForDisplayChangeHandler, 0);
  objc_storeStrong((id *)&self->_overrideImage, 0);
  objc_storeStrong((id *)&self->_customPhotoView, 0);
  objc_storeStrong((id *)&self->_player, 0);

  objc_storeStrong((id *)&self->_content, 0);
}

- (UIImageView)photoView
{
  return self->_photoView;
}

- (PXAVResourceReclamationController)resourceReclamationController
{
  return self->_resourceReclamationController;
}

- (ISBasePlayerUIViewChangeObserver)_changeObserver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);

  return (ISBasePlayerUIViewChangeObserver *)WeakRetained;
}

- (UIView)containerView
{
  return self->_containerView;
}

- (CAFilter)videoFilter
{
  return self->_videoFilter;
}

- (id)videoLayerReadyForDisplayChangeHandler
{
  return self->_videoLayerReadyForDisplayChangeHandler;
}

- (int64_t)preferredImageDynamicRange
{
  return self->_preferredImageDynamicRange;
}

- (CGRect)contentsRect
{
  double x = self->_contentsRect.origin.x;
  double y = self->_contentsRect.origin.y;
  double width = self->_contentsRect.size.width;
  double height = self->_contentsRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (ISBasePlayer)player
{
  return self->_player;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  if ((a4 & 4) != 0 && (void *)ISBasePlayerUIViewPlayerObservationContext == a5) {
    [(ISBasePlayerUIView *)self _updatePlayerAudioSession];
  }
}

- (void)setOverrideImage:(id)a3
{
  objc_super v6 = (UIImage *)a3;
  if (self->_overrideImage != v6)
  {
    objc_storeStrong((id *)&self->_overrideImage, a3);
    objc_super v5 = [(ISBasePlayerUIView *)self photoView];
    [v5 setImage:v6];
  }
}

- (id)generateSnapshotImage
{
  double v3 = [(ISBasePlayerUIView *)self videoView];
  double v4 = [(ISBasePlayerUIView *)self videoContainerView];
  [v4 alpha];
  double v6 = v5;

  if (v6 <= 0.0)
  {
    double v7 = [(ISBasePlayerUIView *)self photoView];
    double v24 = [v7 image];
  }
  else
  {
    double v7 = [v3 videoPlayer];
    double v8 = [v7 currentItem];
    double v9 = [v8 asset];

    double v10 = [v7 currentItem];
    id v11 = [v10 videoComposition];

    long long v33 = 0uLL;
    uint64_t v34 = 0;
    if (v7) {
      [v7 currentTime];
    }
    v12 = (void *)[objc_alloc(MEMORY[0x1E4F16368]) initWithAsset:v9];
    [(ISBasePlayerUIView *)self bounds];
    double v14 = v13;
    double v16 = v15;
    double v17 = [(ISBasePlayerUIView *)self traitCollection];
    [v17 displayScale];
    double v19 = v18;

    if (v19 == 0.0)
    {
      double v20 = [MEMORY[0x1E4F42D90] mainScreen];
      [v20 scale];
      double v19 = v21;
    }
    objc_msgSend(v12, "setMaximumSize:", v14 * v19, v16 * v19);
    [v12 setAppliesPreferredTrackTransform:1];
    long long v31 = *MEMORY[0x1E4F1FA48];
    long long v26 = v31;
    uint64_t v32 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
    uint64_t v22 = v32;
    [v12 setRequestedTimeToleranceAfter:&v31];
    long long v29 = v26;
    uint64_t v30 = v22;
    [v12 setRequestedTimeToleranceBefore:&v29];
    [v12 setVideoComposition:v11];
    [v12 setApertureMode:*MEMORY[0x1E4F15798]];
    long long v27 = v33;
    uint64_t v28 = v34;
    v23 = (CGImage *)[MEMORY[0x1E4F8CC38] copyCGImageFromImageGenerator:v12 atTime:&v27 actualTime:0 error:0];
    double v24 = (void *)[objc_alloc(MEMORY[0x1E4F42A80]) initWithCGImage:v23];
    CGImageRelease(v23);
  }

  return v24;
}

- (void)applyScale:(double)a3 withTransitionOptions:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  [(ISBasePlayerUIView *)self layoutIfNeeded];
  id v18 = [(ISBasePlayerUIView *)self videoContainerView];
  double v10 = [(ISBasePlayerUIView *)self photoView];
  id v11 = [(ISBasePlayerUIView *)self customPhotoView];
  v12 = [v11 layer];
  double v13 = v12;
  if (v12)
  {
    id v14 = v12;
  }
  else
  {
    id v14 = [v10 layer];
  }
  double v15 = v14;

  double v16 = +[ISTransitionApplier defaultApplier];
  double v17 = [v18 layer];
  [v16 applyScale:v9 withTransitionOptions:v15 toPhotoLayer:v17 videoLayer:v8 completion:a3];
}

- (void)_updatePhotoViewDynamicRange
{
  int64_t v3 = [(ISBasePlayerUIView *)self preferredImageDynamicRange];
  id v4 = [(ISBasePlayerUIView *)self photoView];
  [v4 setPreferredImageDynamicRange:v3];
}

- (void)setPreferredImageDynamicRange:(int64_t)a3
{
  if (self->_preferredImageDynamicRange != a3)
  {
    self->_preferredImageDynamicRange = a3;
    [(ISBasePlayerUIView *)self _updatePhotoViewDynamicRange];
  }
}

- (void)_updateVideoViewsFrameWithContainerBounds:(CGRect)a3
{
  id v4 = [(ISBasePlayerUIView *)self containerView];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;

  id v9 = [(ISPlayerOutputContent *)self->_content aspectRatio];
  [v9 doubleValue];
  double v11 = v10;
  if (v10 == 0.0)
  {
    double v11 = 1.0;
    if (v6 != 0.0 && v8 != 0.0)
    {
      BOOL v12 = v6 == *MEMORY[0x1E4F8A250] && v8 == *(double *)(MEMORY[0x1E4F8A250] + 8);
      double v13 = fabs(v6 / v8);
      if (v12) {
        double v11 = 1.0;
      }
      else {
        double v11 = v13;
      }
    }
  }

  id v14 = [(ISBasePlayerUIView *)self traitCollection];
  [v14 displayScale];
  double v16 = v15;

  if (v16 <= 0.0)
  {
    double v17 = [MEMORY[0x1E4F42D90] mainScreen];
    [v17 scale];
    double v16 = v18;
  }
  [(ISBasePlayerUIView *)self contentsRect];
  PFFrameApplyingContentsRectInBounds();
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  long long v27 = [(ISBasePlayerUIView *)self videoView];
  objc_msgSend(v27, "setFrame:", v20, v22, v24, v26);

  id v28 = [(ISBasePlayerUIView *)self videoBlurView];
  objc_msgSend(v28, "setFrame:", v20, v22, v24, v26);
}

- (void)_signalChange:(unint64_t)a3 withAnimationDuration:(double)a4
{
  if (self->_changeObserverRespondsTo.didChangeWithAnimationDuration)
  {
    id v7 = [(ISBasePlayerUIView *)self _changeObserver];
    [v7 basePlayerUIView:self didChange:a3 withAnimationDuration:a4];
  }
}

- (void)_updatePlayerAudioSession
{
  id v5 = [(ISBasePlayerUIView *)self wrappedAudioSession];
  if (v5)
  {
    int64_t v3 = [(ISBasePlayerUIView *)self player];
    id v4 = [v3 videoPlayer];
    [v4 setWrappedAudioSession:v5];
  }
}

- (void)_updateAudioSession
{
  objc_initWeak(&location, self);
  int64_t v3 = [(id)objc_opt_class() audioSessionQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__ISBasePlayerUIView__updateAudioSession__block_invoke;
  block[3] = &unk_1E6BECDA8;
  block[4] = self;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, block);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __41__ISBasePlayerUIView__updateAudioSession__block_invoke(uint64_t a1)
{
  v2 = [(id)objc_opt_class() livePhotoAudioSession];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __41__ISBasePlayerUIView__updateAudioSession__block_invoke_2;
  v4[3] = &unk_1E6BECDA8;
  objc_copyWeak(&v6, (id *)(a1 + 40));
  id v5 = v2;
  id v3 = v2;
  dispatch_async(MEMORY[0x1E4F14428], v4);

  objc_destroyWeak(&v6);
}

void __41__ISBasePlayerUIView__updateAudioSession__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _setWrappedAudioSession:*(void *)(a1 + 32)];
}

- (void)setContentsRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  p_contentsRect = &self->_contentsRect;
  if (!CGRectEqualToRect(a3, self->_contentsRect))
  {
    p_contentsRect->origin.double x = x;
    p_contentsRect->origin.double y = y;
    p_contentsRect->size.double width = width;
    p_contentsRect->size.double height = height;
    [(ISBasePlayerUIView *)self setNeedsLayout];
    id v9 = [(ISBasePlayerUIView *)self photoView];
    double v10 = [v9 layer];
    objc_msgSend(v10, "setContentsRect:", x, y, width, height);

    id v11 = [(ISBasePlayerUIView *)self videoView];
    objc_msgSend(v11, "setContentsRect:", x, y, width, height);
  }
}

- (void)setScaleAnchorOffset:(CGPoint)a3
{
  if (a3.x != self->_scaleAnchorOffset.x || a3.y != self->_scaleAnchorOffset.y)
  {
    self->_scaleAnchorOffset = a3;
    [(ISBasePlayerUIView *)self setNeedsLayout];
  }
}

- (void)_videoViewReadyForDisplayDidChange
{
  id v3 = [(ISBasePlayerUIView *)self videoLayerReadyForDisplayChangeHandler];

  if (v3)
  {
    id v4 = [(ISBasePlayerUIView *)self videoLayerReadyForDisplayChangeHandler];
    v4[2]();
  }
}

- (BOOL)isVideoReadyForDisplay
{
  v2 = [(ISBasePlayerUIView *)self videoView];
  char v3 = [v2 videoLayerReadyForDisplay];

  return v3;
}

- (void)setCustomPhotoView:(id)a3
{
  id v5 = (UIView *)a3;
  customPhotoView = self->_customPhotoView;
  if (customPhotoView != v5)
  {
    id v7 = v5;
    [(UIView *)customPhotoView removeFromSuperview];
    objc_storeStrong((id *)&self->_customPhotoView, a3);
    customPhotoView = (UIView *)[(ISBasePlayerUIView *)self _updatePhotoView];
    id v5 = v7;
  }

  MEMORY[0x1F41817F8](customPhotoView, v5);
}

- (void)setVideoFilter:(id)a3
{
  id v5 = (CAFilter *)a3;
  p_videoFilter = (id *)&self->_videoFilter;
  if (self->_videoFilter != v5)
  {
    id v9 = v5;
    id v7 = [(ISBasePlayerUIView *)self videoView];
    double v8 = [v7 layer];

    if (*p_videoFilter) {
      objc_msgSend(v8, "is_removeFilter:");
    }
    objc_storeStrong(p_videoFilter, a3);
    if (v9) {
      objc_msgSend(v8, "is_addFilter:", v9);
    }

    id v5 = v9;
  }
}

- (void)setVideoTransform:(id)a3
{
  uint64_t v4 = (uint64_t)a3;
  uint64_t v5 = v4;
  if (self->_videoTransform != (CAMeshTransform *)v4)
  {
    double v17 = (void *)v4;
    uint64_t v4 = objc_msgSend((id)v4, "isEqual:");
    uint64_t v5 = (uint64_t)v17;
    if ((v4 & 1) == 0)
    {
      id v6 = (CAMeshTransform *)[v17 copy];
      videoTransform = self->_videoTransform;
      self->_videoTransform = v6;

      [MEMORY[0x1E4F39CF8] begin];
      [MEMORY[0x1E4F39CF8] disableActions];
      double v8 = [(ISBasePlayerUIView *)self videoView];
      id v9 = [v8 layer];
      [v9 setMeshTransform:v17];

      double v10 = [MEMORY[0x1E4F42D90] mainScreen];
      [v10 scale];
      double v12 = v11;
      double v13 = [(ISBasePlayerUIView *)self videoView];
      id v14 = [v13 layer];
      [v14 setRasterizationScale:v12];

      double v15 = [(ISBasePlayerUIView *)self videoTransform];
      double v16 = [(ISBasePlayerUIView *)self videoBlurView];
      [v16 setHidden:v15 == 0];

      uint64_t v4 = [MEMORY[0x1E4F39CF8] commit];
      uint64_t v5 = (uint64_t)v17;
    }
  }

  MEMORY[0x1F41817F8](v4, v5);
}

- (void)_setChangeObserver:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->__changeObserver, obj);
    self->_changeObserverRespondsTo.didChangeWithAnimationDuration = objc_opt_respondsToSelector() & 1;
  }
}

- (void)unregisterChangeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(ISBasePlayerUIView *)self _changeObserver];

  if (v5 == v4)
  {
    [(ISBasePlayerUIView *)self _setChangeObserver:0];
  }
}

- (void)registerChangeObserver:(id)a3
{
  id v5 = a3;
  id v4 = [(ISBasePlayerUIView *)self _changeObserver];
  if (v4 != v5) {
    [(ISBasePlayerUIView *)self _setChangeObserver:v5];
  }
}

- (ISBasePlayerUIView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ISBasePlayerUIView;
  char v3 = [(ISBasePlayerUIView *)&v6 initWithCoder:a3];
  id v4 = v3;
  if (v3) {
    [(ISBasePlayerUIView *)v3 _performCommonInitialization];
  }
  return v4;
}

+ (void)_handleAVResourceReclamationEvent:(id)a3
{
  char v3 = objc_msgSend(a1, "audioSessionQueue", a3);
  dispatch_async(v3, &__block_literal_global_10);
}

void __56__ISBasePlayerUIView__handleAVResourceReclamationEvent___block_invoke()
{
  v0 = (void *)SharedAudioSession;
  SharedAudioSession = 0;
}

+ (id)livePhotoAudioSession
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  char v3 = [a1 audioSessionQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)SharedAudioSession;
  if (!SharedAudioSession)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F8EB78]);
    objc_super v6 = (void *)livePhotoAudioSession_resourceReclamationController;
    livePhotoAudioSession_resourceReclamationController = (uint64_t)v5;

    uint64_t v7 = [(id)livePhotoAudioSession_resourceReclamationController observationWithWeakTarget:a1 selector:sel__handleAVResourceReclamationEvent_];
    double v8 = (void *)livePhotoAudioSession_reclamationObservation;
    livePhotoAudioSession_reclamationObservation = v7;

    uint64_t v9 = +[ISWrappedAVAudioSession auxiliarySession];
    double v10 = (void *)SharedAudioSession;
    SharedAudioSession = v9;

    uint64_t v11 = *MEMORY[0x1E4F14F68];
    uint64_t v12 = *MEMORY[0x1E4F15050];
    id v17 = 0;
    char v13 = [(id)SharedAudioSession setCategory:v11 mode:v12 routeSharingPolicy:0 options:0 error:&v17];
    id v14 = v17;
    if ((v13 & 1) == 0)
    {
      double v15 = ISGetLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v19 = v14;
        _os_log_error_impl(&dword_1DB21E000, v15, OS_LOG_TYPE_ERROR, "Failed configuring AVAudioSession for Live Photo playback. Error: %@", buf, 0xCu);
      }
    }
    id v4 = (void *)SharedAudioSession;
  }

  return v4;
}

+ (id)audioSessionQueue
{
  if (audioSessionQueue_onceToken != -1) {
    dispatch_once(&audioSessionQueue_onceToken, &__block_literal_global_265);
  }
  v2 = (void *)audioSessionQueue__queue;

  return v2;
}

void __39__ISBasePlayerUIView_audioSessionQueue__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.ISLivePhotoUIView.audiosession", v2);
  v1 = (void *)audioSessionQueue__queue;
  audioSessionQueue__queue = (uint64_t)v0;
}

+ (Class)playerClass
{
  return (Class)objc_opt_class();
}

@end