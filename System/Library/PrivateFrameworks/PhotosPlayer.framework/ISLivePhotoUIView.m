@interface ISLivePhotoUIView
- (BOOL)_playingVitality;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (CAMeshTransform)vitalityTransform;
- (ISLivePhotoUIView)initWithCoder:(id)a3;
- (ISLivePhotoUIView)initWithFrame:(CGRect)a3;
- (ISLivePhotoUIViewDelegate)delegate;
- (ISTouchLivePhotoPlaybackFilter)_playbackFilter;
- (UIGestureRecognizer)playbackGestureRecognizer;
- (UILabel)_overlayLabel;
- (int64_t)_overlayDismissalID;
- (void)_ISLivePhotoUIViewCommonInitialization;
- (void)_dismissOverlayLabel:(int64_t)a3;
- (void)_playerDidChangeHinting;
- (void)_playerDidChangePlaybackStyle;
- (void)_setOverlayDismissalID:(int64_t)a3;
- (void)_setPlaybackFilter:(id)a3;
- (void)_setPlayingVitality:(BOOL)a3;
- (void)_showOverlayLabel;
- (void)_updateGestureRecognizerParameters;
- (void)_updatePlaybackFilter;
- (void)_updatePlaybackFilterInput;
- (void)_updateVideoTransform;
- (void)audioSessionDidChange;
- (void)contentDidChange;
- (void)dealloc;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setDelegate:(id)a3;
- (void)setPlaybackFilterTouchActive:(BOOL)a3;
- (void)setPlayer:(id)a3;
- (void)setVitalityTransform:(id)a3;
@end

@implementation ISLivePhotoUIView

- (void)setPlayer:(id)a3
{
  id v4 = a3;
  id v5 = [(ISBasePlayerUIView *)self player];
  v6 = v5;
  if (v5 != v4)
  {
    [v5 unregisterChangeObserver:self context:ISLivePhotoPlayerObservableContext];
    v7 = [(ISLivePhotoUIView *)self _playbackFilter];
    [v6 removePlaybackFilter:v7];

    v9.receiver = self;
    v9.super_class = (Class)ISLivePhotoUIView;
    [(ISBasePlayerUIView *)&v9 setPlayer:v4];
    [v4 registerChangeObserver:self context:ISLivePhotoPlayerObservableContext];
    v8 = [(ISLivePhotoUIView *)self _playbackFilter];
    [v4 addPlaybackFilter:v8];
  }
}

- (ISTouchLivePhotoPlaybackFilter)_playbackFilter
{
  return self->__playbackFilter;
}

- (UIGestureRecognizer)playbackGestureRecognizer
{
  return self->_playbackGestureRecognizer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__overlayLabel, 0);
  objc_storeStrong((id *)&self->__playbackFilter, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_vitalityTransform, 0);
  objc_storeStrong((id *)&self->_playbackGestureRecognizer, 0);

  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
}

- (void)_ISLivePhotoUIViewCommonInitialization
{
  [(ISBasePlayerUIView *)self setContentMode:2];
  v8 = objc_alloc_init(ISLivePhotoPlayer);
  [(ISLivePhotoUIView *)self setPlayer:v8];
  [(ISLivePhotoUIView *)self _updatePlaybackFilter];
  v3 = [[ISTouchingGestureRecognizer alloc] initWithTarget:self action:sel__handlePlaybackRecognizer_];
  [(ISTouchingGestureRecognizer *)v3 setMinimumTouchDuration:0.15];
  [(ISTouchingGestureRecognizer *)v3 setCancelsTouchesInView:0];
  [(ISTouchingGestureRecognizer *)v3 setDelegate:self];
  [(ISTouchingGestureRecognizer *)v3 setRequireSingleTouch:1];
  [(ISLivePhotoUIView *)self addGestureRecognizer:v3];
  playbackGestureRecognizer = self->_playbackGestureRecognizer;
  self->_playbackGestureRecognizer = &v3->super;
  id v5 = v3;

  [(ISLivePhotoUIView *)self _updateGestureRecognizerParameters];
  v6 = (UIImpactFeedbackGenerator *)[objc_alloc(MEMORY[0x1E4F42AA8]) initWithStyle:0];
  feedbackGenerator = self->_feedbackGenerator;
  self->_feedbackGenerator = v6;
}

- (void)audioSessionDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)ISLivePhotoUIView;
  [(ISBasePlayerUIView *)&v3 audioSessionDidChange];
  [(ISLivePhotoUIView *)self _updatePlaybackFilter];
}

- (void)_setOverlayDismissalID:(int64_t)a3
{
  self->__overlayDismissalID = a3;
}

- (int64_t)_overlayDismissalID
{
  return self->__overlayDismissalID;
}

- (UILabel)_overlayLabel
{
  return self->__overlayLabel;
}

- (void)_setPlayingVitality:(BOOL)a3
{
  self->__playingVitality = a3;
}

- (BOOL)_playingVitality
{
  return self->__playingVitality;
}

- (ISLivePhotoUIViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ISLivePhotoUIViewDelegate *)WeakRetained;
}

- (CAMeshTransform)vitalityTransform
{
  return self->_vitalityTransform;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v5 = a4;
  if ((void *)ISLivePhotoPlayerObservableContext != a5)
  {
    v7.receiver = self;
    v7.super_class = (Class)ISLivePhotoUIView;
    -[ISBasePlayerUIView observable:didChange:context:](&v7, sel_observable_didChange_context_, a3, a4);
    return;
  }
  [(ISLivePhotoUIView *)self _showOverlayLabel];
  if ((v5 & 8) == 0)
  {
    if ((v5 & 0x20) == 0) {
      goto LABEL_5;
    }
LABEL_8:
    [(ISLivePhotoUIView *)self _playerDidChangeHinting];
    if ((v5 & 0x10) == 0) {
      return;
    }
    goto LABEL_9;
  }
  [(ISLivePhotoUIView *)self _playerDidChangePlaybackStyle];
  if ((v5 & 0x20) != 0) {
    goto LABEL_8;
  }
LABEL_5:
  if ((v5 & 0x10) == 0) {
    return;
  }
LABEL_9:

  [(ISLivePhotoUIView *)self _updateVideoTransform];
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ISLivePhotoUIView *)self playbackGestureRecognizer];
  if (v8 == v6) {
    objc_super v9 = v6;
  }
  else {
    objc_super v9 = 0;
  }
  id v10 = v9;

  if (v10 && self->_delegateRespondsTo.extraMinimumTouchDuration)
  {
    v11 = [(ISLivePhotoUIView *)self delegate];
    [v11 livePhotoViewExtraMinimumTouchDuration:self touch:v7];
    objc_msgSend(v10, "setExtraMinimumTouchDuration:");
  }
  return 1;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  if (!self->_delegateRespondsTo.canBeginInteractivePlayback) {
    return 1;
  }
  objc_super v3 = self;
  id v4 = [(ISLivePhotoUIView *)self delegate];
  LOBYTE(v3) = [v4 livePhotoViewCanBeginInteractivePlayback:v3];

  return (char)v3;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)_updateGestureRecognizerParameters
{
  id v6 = [(ISLivePhotoUIView *)self playbackGestureRecognizer];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v3 = [(ISBasePlayerUIView *)self player];
    uint64_t v4 = [v3 currentPlaybackStyle];

    double v5 = 1.79769313e308;
    if (v4 != 1) {
      double v5 = 10.0;
    }
    [v6 setMaximumTouchMovement:v5];
  }
}

- (void)_playerDidChangeHinting
{
  objc_super v3 = [(ISBasePlayerUIView *)self player];
  int v4 = [v3 isHinting];

  if (v4)
  {
    feedbackGenerator = self->_feedbackGenerator;
    [(UIImpactFeedbackGenerator *)feedbackGenerator prepare];
  }
}

- (void)_playerDidChangePlaybackStyle
{
  objc_super v3 = [(ISBasePlayerUIView *)self player];
  uint64_t v4 = [v3 currentPlaybackStyle];

  if (v4 == 1) {
    [(UIImpactFeedbackGenerator *)self->_feedbackGenerator impactOccurred];
  }

  [(ISLivePhotoUIView *)self _updateGestureRecognizerParameters];
}

- (void)_dismissOverlayLabel:(int64_t)a3
{
  if ([(ISLivePhotoUIView *)self _overlayDismissalID] == a3)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __42__ISLivePhotoUIView__dismissOverlayLabel___block_invoke;
    v4[3] = &unk_1E6BECD80;
    v4[4] = self;
    [MEMORY[0x1E4F42FF0] animateWithDuration:v4 animations:0.2];
  }
}

void __42__ISLivePhotoUIView__dismissOverlayLabel___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _overlayLabel];
  [v1 setAlpha:0.0];
}

- (void)_showOverlayLabel
{
  objc_super v3 = +[ISPlayerSettings sharedInstance];
  int v4 = [v3 showStateOverlay];

  if (v4)
  {
    if (!self->__overlayLabel)
    {
      double v5 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
      overlayLabel = self->__overlayLabel;
      self->__overlayLabel = v5;

      [(UILabel *)self->__overlayLabel setAlpha:0.0];
      id v7 = self->__overlayLabel;
      id v8 = [MEMORY[0x1E4F428B8] whiteColor];
      [(UILabel *)v7 setTextColor:v8];

      objc_super v9 = self->__overlayLabel;
      id v10 = [MEMORY[0x1E4F428B8] colorWithWhite:0.2 alpha:0.5];
      [(UILabel *)v9 setBackgroundColor:v10];

      v11 = [(UILabel *)self->__overlayLabel layer];
      [v11 setCornerRadius:8.0];

      v12 = [(UILabel *)self->__overlayLabel layer];
      [v12 setMasksToBounds:1];

      [(UILabel *)self->__overlayLabel setTextAlignment:1];
      [(ISLivePhotoUIView *)self addSubview:self->__overlayLabel];
    }
    v13 = [(ISBasePlayerUIView *)self player];
    if ([v13 isPlayingVitality])
    {
      v14 = @"Vitality";
    }
    else if ([v13 currentPlaybackStyle] == 2)
    {
      v14 = @"Hint";
    }
    else if ([v13 currentPlaybackStyle] == 1)
    {
      v14 = @"Full";
    }
    else
    {
      v14 = @"Idle";
    }
    [(UILabel *)self->__overlayLabel setText:v14];
    [(UILabel *)self->__overlayLabel sizeToFit];
    v15 = self->__overlayLabel;
    [(ISLivePhotoUIView *)self bounds];
    CGFloat x = v27.origin.x;
    CGFloat y = v27.origin.y;
    CGFloat width = v27.size.width;
    CGFloat height = v27.size.height;
    double MidX = CGRectGetMidX(v27);
    v28.origin.CGFloat x = x;
    v28.origin.CGFloat y = y;
    v28.size.CGFloat width = width;
    v28.size.CGFloat height = height;
    -[UILabel setCenter:](v15, "setCenter:", MidX, CGRectGetMidY(v28));
    v21 = self->__overlayLabel;
    [(UILabel *)v21 frame];
    CGRect v30 = CGRectInset(v29, -10.0, -10.0);
    -[UILabel setFrame:](v21, "setFrame:", v30.origin.x, v30.origin.y, v30.size.width, v30.size.height);
    [(UILabel *)self->__overlayLabel setAlpha:1.0];
    v22 = (void *)([(ISLivePhotoUIView *)self _overlayDismissalID] + 1);
    [(ISLivePhotoUIView *)self _setOverlayDismissalID:v22];
    objc_initWeak(&location, self);
    dispatch_time_t v23 = dispatch_time(0, 500000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __38__ISLivePhotoUIView__showOverlayLabel__block_invoke;
    block[3] = &unk_1E6BECC18;
    objc_copyWeak(v25, &location);
    v25[1] = v22;
    dispatch_after(v23, MEMORY[0x1E4F14428], block);
    objc_destroyWeak(v25);
    objc_destroyWeak(&location);
  }
}

void __38__ISLivePhotoUIView__showOverlayLabel__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _dismissOverlayLabel:*(void *)(a1 + 40)];
}

- (void)_updatePlaybackFilter
{
  objc_super v3 = [(ISBasePlayerUIView *)self wrappedAudioSession];

  if (v3) {
    int v4 = objc_alloc_init(ISTouchLivePhotoPlaybackFilter);
  }
  else {
    int v4 = 0;
  }
  id v6 = v4;
  [(ISLivePhotoPlaybackFilter *)v4 setPlaybackDisabled:v3 == 0 forReason:@"ConfiguringAudioSession"];
  double v5 = +[ISPlayerSettings sharedInstance];
  -[ISLivePhotoPlaybackFilter setPlayIsSticky:](v6, "setPlayIsSticky:", [v5 playIsSticky]);

  [(ISLivePhotoUIView *)self _setPlaybackFilter:v6];
}

- (void)contentDidChange
{
  v2.receiver = self;
  v2.super_class = (Class)ISLivePhotoUIView;
  [(ISBasePlayerUIView *)&v2 contentDidChange];
}

- (void)_setPlaybackFilter:(id)a3
{
  p_playbackFilter = &self->__playbackFilter;
  id v7 = (ISTouchLivePhotoPlaybackFilter *)a3;
  if (*p_playbackFilter != v7)
  {
    id v6 = [(ISBasePlayerUIView *)self player];
    [v6 removePlaybackFilter:*p_playbackFilter];
    objc_storeStrong((id *)p_playbackFilter, a3);
    [v6 addPlaybackFilter:v7];
  }
}

- (void)_updateVideoTransform
{
  objc_super v3 = [(ISBasePlayerUIView *)self player];
  int v4 = [v3 isPlayingVitality];

  if (v4)
  {
    id v5 = [(ISLivePhotoUIView *)self vitalityTransform];
    [(ISBasePlayerUIView *)self setVideoTransform:v5];
  }
  else
  {
    [(ISBasePlayerUIView *)self setVideoTransform:0];
  }
}

- (void)_updatePlaybackFilterInput
{
  id v8 = [(ISLivePhotoUIView *)self playbackGestureRecognizer];
  [v8 distanceFromInitialPoint];
  double v4 = v3;
  BOOL v5 = (unint64_t)([v8 state] - 1) < 2;
  id v6 = [(ISLivePhotoUIView *)self _playbackFilter];
  uint64_t v7 = [v6 state];

  if (v7 != 2 && v4 > 20.0)
  {
    [v8 setEnabled:0];
    [v8 setEnabled:1];
    BOOL v5 = 0;
  }
  [(ISLivePhotoUIView *)self setPlaybackFilterTouchActive:v5];
}

- (void)setPlaybackFilterTouchActive:(BOOL)a3
{
  double v4 = [(ISLivePhotoUIView *)self _playbackFilter];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__ISLivePhotoUIView_setPlaybackFilterTouchActive___block_invoke;
  v5[3] = &__block_descriptor_33_e8_v16__0_8l;
  BOOL v6 = a3;
  [v4 performChanges:v5];
}

uint64_t __50__ISLivePhotoUIView_setPlaybackFilterTouchActive___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setTouchActive:*(unsigned __int8 *)(a1 + 32)];
}

- (void)setVitalityTransform:(id)a3
{
  uint64_t v5 = (uint64_t)a3;
  uint64_t v6 = v5;
  if (self->_vitalityTransform != (CAMeshTransform *)v5)
  {
    uint64_t v7 = v5;
    uint64_t v5 = objc_msgSend((id)v5, "isEqual:");
    uint64_t v6 = v7;
    if ((v5 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_vitalityTransform, a3);
      uint64_t v5 = [(ISLivePhotoUIView *)self _updateVideoTransform];
      uint64_t v6 = v7;
    }
  }

  MEMORY[0x1F41817F8](v5, v6);
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    id v5 = objc_storeWeak((id *)&self->_delegate, obj);
    p_delegateRespondsTo = &self->_delegateRespondsTo;
    self->_delegateRespondsTo.canBeginInteractivePlayback = objc_opt_respondsToSelector() & 1;

    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    p_delegateRespondsTo->extraMinimumTouchDuration = objc_opt_respondsToSelector() & 1;
  }
}

- (void)dealloc
{
  [(ISLivePhotoUIView *)self setPlayer:0];
  double v3 = [(UIGestureRecognizer *)self->_playbackGestureRecognizer view];
  [v3 removeGestureRecognizer:self->_playbackGestureRecognizer];

  v4.receiver = self;
  v4.super_class = (Class)ISLivePhotoUIView;
  [(ISLivePhotoUIView *)&v4 dealloc];
}

- (ISLivePhotoUIView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ISLivePhotoUIView;
  double v3 = [(ISBasePlayerUIView *)&v6 initWithCoder:a3];
  objc_super v4 = v3;
  if (v3) {
    [(ISLivePhotoUIView *)v3 _ISLivePhotoUIViewCommonInitialization];
  }
  return v4;
}

- (ISLivePhotoUIView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ISLivePhotoUIView;
  double v3 = -[ISBasePlayerUIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_super v4 = v3;
  if (v3) {
    [(ISLivePhotoUIView *)v3 _ISLivePhotoUIViewCommonInitialization];
  }
  return v4;
}

@end