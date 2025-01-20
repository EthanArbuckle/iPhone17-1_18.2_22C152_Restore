@interface PHVideoScrubberView
- (AVPlayer)player;
- (BOOL)_isUserInteractingWithScrollView;
- (BOOL)_needsUpdate;
- (BOOL)_needsUpdateFilmStripView;
- (BOOL)_needsUpdateVideoScrubberController;
- (BOOL)_playerIsPlaying;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (PHVideoScrubberFilmstripView)_filmStripView;
- (PHVideoScrubberFilmstripViewProvider)filmstripViewProvider;
- (PHVideoScrubberView)initWithFrame:(CGRect)a3;
- (PHVideoScrubberViewInteractionDelegate)interactionDelegate;
- (PUPlayheadView)_playheadView;
- (PXVideoScrubberController)_videoScrubberController;
- (UIImage)placeholderThumbnail;
- (UIScrollView)scrollView;
- (double)_lengthForDuration:(double)a3;
- (double)estimatedDuration;
- (double)videoScrubberController:(id)a3 lengthForDuration:(double)a4;
- (id)_currentAVAsset;
- (id)_currentVideoComposition;
- (id)_scrollView;
- (void)_handleInteractionBegan;
- (void)_handleInteractionEndedAndTogglePlayState:(BOOL)a3;
- (void)_handleLongPressGesture:(id)a3;
- (void)_handleTapGesture:(id)a3;
- (void)_handleTouchGesture:(id)a3;
- (void)_invalidateFilmStripView;
- (void)_invalidateVideoScrubberController;
- (void)_setFilmStripView:(id)a3;
- (void)_setNeedsUpdateFilmStripView:(BOOL)a3;
- (void)_setNeedsUpdateVideoScrubberController:(BOOL)a3;
- (void)_setPlayheadView:(id)a3;
- (void)_setScrollView:(id)a3;
- (void)_setVideoScrubberController:(id)a3;
- (void)_updateFilmStripViewIfNeeded;
- (void)_updateIfNeeded;
- (void)_updatePlayheadFrame;
- (void)_updateScrollViewContentOffset;
- (void)_updateVideoscrubberControllerIfNeeded;
- (void)_updateVisibleRectOfFilmStripView;
- (void)dealloc;
- (void)layoutSubviews;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDecelerating:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)setEstimatedDuration:(double)a3;
- (void)setFilmstripViewProvider:(id)a3;
- (void)setInteractionDelegate:(id)a3;
- (void)setPlaceholderThumbnail:(id)a3;
- (void)setPlayer:(id)a3;
- (void)videoScrubberControllerDidUpdate:(id)a3;
@end

@implementation PHVideoScrubberView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__playheadView, 0);
  objc_storeStrong((id *)&self->__videoScrubberController, 0);
  objc_storeStrong((id *)&self->__filmStripView, 0);
  objc_destroyWeak((id *)&self->_filmstripViewProvider);
  objc_destroyWeak((id *)&self->_interactionDelegate);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_placeholderThumbnail, 0);
  objc_storeStrong((id *)&self->_player, 0);
}

- (void)_setPlayheadView:(id)a3
{
}

- (PUPlayheadView)_playheadView
{
  return self->__playheadView;
}

- (PXVideoScrubberController)_videoScrubberController
{
  return self->__videoScrubberController;
}

- (void)_setFilmStripView:(id)a3
{
}

- (PHVideoScrubberFilmstripView)_filmStripView
{
  return self->__filmStripView;
}

- (void)_setNeedsUpdateVideoScrubberController:(BOOL)a3
{
  self->__needsUpdateVideoScrubberController = a3;
}

- (BOOL)_needsUpdateVideoScrubberController
{
  return self->__needsUpdateVideoScrubberController;
}

- (void)_setNeedsUpdateFilmStripView:(BOOL)a3
{
  self->__needsUpdateFilmStripView = a3;
}

- (BOOL)_needsUpdateFilmStripView
{
  return self->__needsUpdateFilmStripView;
}

- (void)setFilmstripViewProvider:(id)a3
{
}

- (PHVideoScrubberFilmstripViewProvider)filmstripViewProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_filmstripViewProvider);
  return (PHVideoScrubberFilmstripViewProvider *)WeakRetained;
}

- (PHVideoScrubberViewInteractionDelegate)interactionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactionDelegate);
  return (PHVideoScrubberViewInteractionDelegate *)WeakRetained;
}

- (void)_setScrollView:(id)a3
{
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (UIImage)placeholderThumbnail
{
  return self->_placeholderThumbnail;
}

- (double)estimatedDuration
{
  return self->_estimatedDuration;
}

- (AVPlayer)player
{
  return self->_player;
}

- (void)videoScrubberControllerDidUpdate:(id)a3
{
  id v4 = [(PHVideoScrubberView *)self scrollView];
  if (([v4 isDragging] & 1) == 0
    && ([v4 isTracking] & 1) == 0
    && ([v4 isDecelerating] & 1) == 0)
  {
    [(PHVideoScrubberView *)self _updateScrollViewContentOffset];
  }
}

- (double)_lengthForDuration:(double)a3
{
  if (a3 < 1.0) {
    a3 = 1.0;
  }
  if (a3 >= 2.0)
  {
    float v4 = a3;
    double v3 = log2f(v4);
  }
  else
  {
    double v3 = a3 * 0.5;
  }
  return v3 * 150.0;
}

- (double)videoScrubberController:(id)a3 lengthForDuration:(double)a4
{
  [(PHVideoScrubberView *)self estimatedDuration];
  -[PHVideoScrubberView _lengthForDuration:](self, "_lengthForDuration:");
  return result;
}

- (void)_updatePlayheadFrame
{
  double v3 = [(PHVideoScrubberView *)self scrollView];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;

  id v18 = [(PHVideoScrubberView *)self scrollView];
  [v18 contentSize];
  double v9 = v8;
  [v18 contentInset];
  double v11 = v10;
  [v18 contentOffset];
  double v13 = v11 + v12;
  double v14 = v9 - v13;
  if (v13 <= v9) {
    double v14 = 0.0;
  }
  if (v13 < 0.0) {
    double v15 = 0.0 - v13;
  }
  else {
    double v15 = v14;
  }
  double v16 = v5 * 0.5 - v7 * 0.5 * 0.5 + v15;
  v17 = [(PHVideoScrubberView *)self _playheadView];
  objc_msgSend(v17, "setFrame:", v16, 0.0, v7 * 0.5, v7 + 2.0);
}

- (void)_updateScrollViewContentOffset
{
  id v9 = [(PHVideoScrubberView *)self scrollView];
  double v3 = [(PHVideoScrubberView *)self _videoScrubberController];
  [v3 playheadProgress];
  double v5 = v4;

  [v9 contentSize];
  double v7 = v5 * v6;
  [v9 contentInset];
  objc_msgSend(v9, "setContentOffset:", v7 - v8, 0.0);
}

- (void)_updateVisibleRectOfFilmStripView
{
  double v3 = [(PHVideoScrubberView *)self scrollView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;

  double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  if (v5 <= 0.0) {
    double v11 = *MEMORY[0x1E4F1DB28];
  }
  else {
    double v11 = v5;
  }
  double v12 = -0.0;
  if (v5 <= 0.0) {
    double v12 = v5;
  }
  double v13 = v7 + v12;
  id v14 = [(PHVideoScrubberView *)self _filmStripView];
  objc_msgSend(v14, "setVisibleRect:", v11, v10, v13, v9);
}

- (void)_updateIfNeeded
{
  if ([(PHVideoScrubberView *)self _needsUpdate])
  {
    [(PHVideoScrubberView *)self _updateVideoscrubberControllerIfNeeded];
    [(PHVideoScrubberView *)self _updateFilmStripViewIfNeeded];
    if ([(PHVideoScrubberView *)self _needsUpdate])
    {
      id v4 = [MEMORY[0x1E4F28B00] currentHandler];
      [v4 handleFailureInMethod:a2 object:self file:@"PHVideoScrubberView.m" lineNumber:396 description:@"Video scrubber still dirty after update"];
    }
  }
}

- (BOOL)_needsUpdate
{
  if ([(PHVideoScrubberView *)self _needsUpdateFilmStripView]) {
    return 1;
  }
  return [(PHVideoScrubberView *)self _needsUpdateVideoScrubberController];
}

- (void)_updateVideoscrubberControllerIfNeeded
{
  if (![(PHVideoScrubberView *)self _needsUpdateVideoScrubberController]) {
    return;
  }
  [(PHVideoScrubberView *)self _setNeedsUpdateVideoScrubberController:0];
  id v14 = [(PHVideoScrubberView *)self player];
  double v3 = [(PHVideoScrubberView *)self _videoScrubberController];
  if (v14)
  {
    id v4 = [v3 target];
    id v5 = [v4 videoPlayer];
    if (v5 != v14)
    {

LABEL_8:
      [(PHVideoScrubberView *)self estimatedDuration];
      double v11 = v10;
      double v12 = (void *)[objc_alloc(MEMORY[0x1E4F906C8]) initWithVideoPlayer:v14];
      double v13 = (void *)[objc_alloc(MEMORY[0x1E4F908B8]) initWithTarget:v12 estimatedDuration:v11];
      [(PHVideoScrubberView *)self _setVideoScrubberController:v13];

      goto LABEL_9;
    }
    [v3 estimatedDuration];
    double v7 = v6;
    [(PHVideoScrubberView *)self estimatedDuration];
    double v9 = v8;

    if (v7 != v9) {
      goto LABEL_8;
    }
  }
  else
  {
    [(PHVideoScrubberView *)self _setVideoScrubberController:0];
  }
LABEL_9:
}

- (void)_updateFilmStripViewIfNeeded
{
  if ([(PHVideoScrubberView *)self _needsUpdateFilmStripView])
  {
    [(PHVideoScrubberView *)self _setNeedsUpdateFilmStripView:0];
    double v3 = [(PHVideoScrubberView *)self _filmStripView];

    if (!v3)
    {
      id v4 = [(PHVideoScrubberView *)self filmstripViewProvider];
      id v5 = [v4 createFilmstripViewForVideoScrubberView:self];
      double v6 = v5;
      if (v5)
      {
        double v7 = v5;
      }
      else
      {
        double v8 = [PUFilmstripView alloc];
        double v7 = -[PUFilmstripView initWithFrame:](v8, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      }
      double v9 = v7;

      [(PHVideoScrubberView *)self _setFilmStripView:v9];
      double v10 = [(PHVideoScrubberView *)self scrollView];
      [v10 addSubview:v9];
    }
    double v11 = [(PHVideoScrubberView *)self _filmStripView];
    char v12 = objc_opt_respondsToSelector();

    if (v12)
    {
      double v13 = [(PHVideoScrubberView *)self _filmStripView];
      id v14 = [(PHVideoScrubberView *)self _currentAVAsset];
      double v15 = [(PHVideoScrubberView *)self _currentVideoComposition];
      [v13 setAsset:v14 videoComposition:v15];
    }
    double v16 = [(PHVideoScrubberView *)self _filmStripView];
    v17 = [(PHVideoScrubberView *)self _currentAVAsset];
    [v16 setAsset:v17];

    id v18 = [(PHVideoScrubberView *)self _filmStripView];
    v19 = [(PHVideoScrubberView *)self placeholderThumbnail];
    [v18 setPlaceholderImage:v19];

    [(PHVideoScrubberView *)self _updateVisibleRectOfFilmStripView];
  }
}

- (void)_invalidateVideoScrubberController
{
  [(PHVideoScrubberView *)self _setNeedsUpdateVideoScrubberController:1];
  [(PHVideoScrubberView *)self setNeedsLayout];
}

- (void)_invalidateFilmStripView
{
  [(PHVideoScrubberView *)self _setNeedsUpdateFilmStripView:1];
  [(PHVideoScrubberView *)self setNeedsLayout];
}

- (void)_handleInteractionEndedAndTogglePlayState:(BOOL)a3
{
  unint64_t previousPlayState = self->_previousPlayState;
  if (previousPlayState)
  {
    BOOL v5 = previousPlayState == 2;
    if (a3)
    {
      BOOL v5 = previousPlayState != 2;
      if (previousPlayState != 1)
      {
LABEL_4:
        double v6 = [(PHVideoScrubberView *)self player];
        [v6 play];
        goto LABEL_8;
      }
    }
    else if (previousPlayState == 1)
    {
      goto LABEL_4;
    }
    if (!v5)
    {
LABEL_9:
      self->_unint64_t previousPlayState = 0;
      return;
    }
    double v6 = [(PHVideoScrubberView *)self player];
    [v6 pause];
LABEL_8:

    goto LABEL_9;
  }
}

- (void)_handleInteractionBegan
{
  if (!self->_previousPlayState)
  {
    if ([(PHVideoScrubberView *)self _playerIsPlaying])
    {
      self->_unint64_t previousPlayState = 1;
      id v3 = [(PHVideoScrubberView *)self player];
      [v3 pause];
    }
    else
    {
      self->_unint64_t previousPlayState = 2;
    }
  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v5 = a3;
  [(PHVideoScrubberView *)self _handleInteractionEndedAndTogglePlayState:0];
  if (self->_interactionDelegateRespondsTo.didEndDecelerating)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_interactionDelegate);
    [WeakRetained videoScrubberView:self didEndDeceleratingInScrollView:v5];
  }
}

- (void)scrollViewWillBeginDecelerating:(id)a3
{
  if (self->_interactionDelegateRespondsTo.willBeginDecelerating)
  {
    p_interactionDelegate = &self->_interactionDelegate;
    id v5 = a3;
    id WeakRetained = objc_loadWeakRetained((id *)p_interactionDelegate);
    [WeakRetained videoScrubberView:self willBeginDeceleratingInScrollView:v5];
  }
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  id v6 = a3;
  id v8 = v6;
  if (!a4)
  {
    [(PHVideoScrubberView *)self _handleInteractionEndedAndTogglePlayState:0];
    id v6 = v8;
  }
  if (self->_interactionDelegateRespondsTo.didEndDragging)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_interactionDelegate);
    [WeakRetained videoScrubberView:self didEndDraggingInScrollView:v8];

    id v6 = v8;
  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  if (self->_interactionDelegateRespondsTo.willBeginDragging)
  {
    p_interactionDelegate = &self->_interactionDelegate;
    id v5 = a3;
    id WeakRetained = objc_loadWeakRetained((id *)p_interactionDelegate);
    [WeakRetained videoScrubberView:self willBeginDraggingInScrollView:v5];
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  id v12 = a3;
  if ([(PHVideoScrubberView *)self _isUserInteractingWithScrollView])
  {
    [v12 contentSize];
    double v5 = v4;
    [v12 contentInset];
    double v7 = v6;
    [v12 contentOffset];
    double v9 = fmax(v7 + v8, 0.0);
    if (v5 < v9) {
      double v9 = v5;
    }
    double v10 = v9 / v5;
    double v11 = [(PHVideoScrubberView *)self _videoScrubberController];
    [v11 setPlayheadProgress:v10];
  }
  [(PHVideoScrubberView *)self _updateVisibleRectOfFilmStripView];
  [(PHVideoScrubberView *)self _updatePlayheadFrame];
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)_handleLongPressGesture:(id)a3
{
  self->_unint64_t previousPlayState = 0;
}

- (void)_handleTouchGesture:(id)a3
{
  uint64_t v4 = [a3 state];
  if (v4 == 3)
  {
    if (!self->_interactionDelegateRespondsTo.didEndTouching) {
      return;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_interactionDelegate);
    [WeakRetained didEndTouchingVideoScrubberView:self];
  }
  else
  {
    if (v4 != 1) {
      return;
    }
    [(PHVideoScrubberView *)self _handleInteractionBegan];
    if (!self->_interactionDelegateRespondsTo.didBeginTouching) {
      return;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_interactionDelegate);
    [WeakRetained didBeginTouchingVideoScrubberView:self];
  }
}

- (void)_handleTapGesture:(id)a3
{
}

- (BOOL)_playerIsPlaying
{
  v2 = [(PHVideoScrubberView *)self player];
  [v2 rate];
  BOOL v4 = v3 > 0.0;

  return v4;
}

- (BOOL)_isUserInteractingWithScrollView
{
  v2 = [(PHVideoScrubberView *)self scrollView];
  if ([v2 isDragging] & 1) != 0 || (objc_msgSend(v2, "isTracking")) {
    char v3 = 1;
  }
  else {
    char v3 = [v2 isDecelerating];
  }

  return v3;
}

- (id)_currentVideoComposition
{
  v2 = [(PHVideoScrubberView *)self player];
  char v3 = [v2 currentItem];

  BOOL v4 = [v3 videoComposition];

  return v4;
}

- (id)_currentAVAsset
{
  v2 = [(PHVideoScrubberView *)self player];
  char v3 = [v2 currentItem];

  BOOL v4 = [v3 asset];

  return v4;
}

- (void)setPlaceholderThumbnail:(id)a3
{
  double v5 = (UIImage *)a3;
  if (self->_placeholderThumbnail != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_placeholderThumbnail, a3);
    [(PHVideoScrubberView *)self _invalidateFilmStripView];
    double v5 = v6;
  }
}

- (void)_setVideoScrubberController:(id)a3
{
  double v5 = (PXVideoScrubberController *)a3;
  videoScrubberController = self->__videoScrubberController;
  double v7 = v5;
  if (videoScrubberController != v5)
  {
    [(PXVideoScrubberController *)videoScrubberController setDelegate:0];
    objc_storeStrong((id *)&self->__videoScrubberController, a3);
    [(PXVideoScrubberController *)v7 setDelegate:self];
  }
}

- (void)setEstimatedDuration:(double)a3
{
  if (self->_estimatedDuration != a3)
  {
    self->_estimatedDuration = a3;
    [(PHVideoScrubberView *)self _invalidateVideoScrubberController];
    [(PHVideoScrubberView *)self _invalidateFilmStripView];
  }
}

- (void)setPlayer:(id)a3
{
  double v5 = (AVPlayer *)a3;
  p_player = &self->_player;
  player = self->_player;
  if (player != v5)
  {
    double v8 = v5;
    [(AVPlayer *)player removeObserver:self forKeyPath:@"status" context:avPlayerObservationContext];
    [(AVPlayer *)*p_player removeObserver:self forKeyPath:@"currentItem" context:avPlayerObservationContext];
    [(AVPlayer *)*p_player removeObserver:self forKeyPath:@"currentItem.videoComposition" context:avPlayerObservationContext];
    objc_storeStrong((id *)&self->_player, a3);
    [(AVPlayer *)*p_player addObserver:self forKeyPath:@"status" options:0 context:avPlayerObservationContext];
    [(AVPlayer *)*p_player addObserver:self forKeyPath:@"currentItem" options:0 context:avPlayerObservationContext];
    [(AVPlayer *)*p_player addObserver:self forKeyPath:@"currentItem.videoComposition" options:0 context:avPlayerObservationContext];
    [(PHVideoScrubberView *)self _invalidateVideoScrubberController];
    [(PHVideoScrubberView *)self _invalidateFilmStripView];
    double v5 = v8;
  }
}

- (void)setInteractionDelegate:(id)a3
{
  id obj = a3;
  p_interactionDelegate = &self->_interactionDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactionDelegate);

  if (WeakRetained != obj)
  {
    id v6 = objc_storeWeak((id *)&self->_interactionDelegate, obj);
    p_interactionDelegateRespondsTo = &self->_interactionDelegateRespondsTo;
    self->_interactionDelegateRespondsTo.didBeginTouching = objc_opt_respondsToSelector() & 1;

    id v8 = objc_loadWeakRetained((id *)&self->_interactionDelegate);
    p_interactionDelegateRespondsTo->didEndTouching = objc_opt_respondsToSelector() & 1;

    id v9 = objc_loadWeakRetained((id *)p_interactionDelegate);
    p_interactionDelegateRespondsTo->willBeginDragging = objc_opt_respondsToSelector() & 1;

    id v10 = objc_loadWeakRetained((id *)p_interactionDelegate);
    p_interactionDelegateRespondsTo->didEndDragging = objc_opt_respondsToSelector() & 1;

    id v11 = objc_loadWeakRetained((id *)p_interactionDelegate);
    p_interactionDelegateRespondsTo->willBeginDecelerating = objc_opt_respondsToSelector() & 1;

    id v12 = objc_loadWeakRetained((id *)p_interactionDelegate);
    p_interactionDelegateRespondsTo->didEndDecelerating = objc_opt_respondsToSelector() & 1;
  }
}

- (id)_scrollView
{
  return self->_scrollView;
}

- (void)layoutSubviews
{
  v17.receiver = self;
  v17.super_class = (Class)PHVideoScrubberView;
  [(PHVideoScrubberView *)&v17 layoutSubviews];
  [(PHVideoScrubberView *)self _updateIfNeeded];
  [(PHVideoScrubberView *)self bounds];
  double width = v18.size.width;
  v18.origin.double x = *(CGFloat *)MEMORY[0x1E4F1DAD8];
  v18.origin.double y = *(CGFloat *)(MEMORY[0x1E4F1DAD8] + 8);
  CGRect v19 = CGRectInset(v18, 0.0, 1.0);
  double x = v19.origin.x;
  double y = v19.origin.y;
  double v6 = v19.size.width;
  double height = v19.size.height;
  id v8 = [(PHVideoScrubberView *)self scrollView];
  objc_msgSend(v8, "setFrame:", x, y, v6, height);

  double v9 = width * 0.5;
  id v10 = [(PHVideoScrubberView *)self _videoScrubberController];
  [v10 length];
  double v12 = v11;

  double v13 = [(PHVideoScrubberView *)self scrollView];
  objc_msgSend(v13, "setContentInset:", 0.0, v9, 0.0, v9);

  id v14 = [(PHVideoScrubberView *)self _filmStripView];

  if (v14)
  {
    double v15 = [(PHVideoScrubberView *)self _filmStripView];
    objc_msgSend(v15, "setFrame:", 0.0, 0.0, v12, height);
  }
  double v16 = [(PHVideoScrubberView *)self scrollView];
  objc_msgSend(v16, "setContentSize:", v12, height);

  [(PHVideoScrubberView *)self _updateScrollViewContentOffset];
  [(PHVideoScrubberView *)self _updatePlayheadFrame];
}

- (PHVideoScrubberView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v15.receiver = self;
  v15.super_class = (Class)PHVideoScrubberView;
  double v7 = -[PHVideoScrubberView initWithFrame:](&v15, sel_initWithFrame_);
  if (v7)
  {
    id v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1BE0]), "initWithFrame:", x, y, width, height);
    [v8 setAlwaysBounceHorizontal:1];
    [v8 setShowsHorizontalScrollIndicator:0];
    [v8 setDelegate:v7];
    [v8 _setSupportsPointerDragScrolling:1];
    [(PHVideoScrubberView *)v7 _setScrollView:v8];
    [(PHVideoScrubberView *)v7 addSubview:v8];
    double v9 = [PUPlayheadView alloc];
    id v10 = -[PUPlayheadView initWithFrame:](v9, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(PHVideoScrubberView *)v7 _setPlayheadView:v10];
    [(PHVideoScrubberView *)v7 addSubview:v10];
    double v11 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:v7 action:sel__handleTapGesture_];
    [(PHVideoScrubberView *)v7 addGestureRecognizer:v11];
    double v12 = [[PUTouchingGestureRecognizer alloc] initWithTarget:v7 action:sel__handleTouchGesture_];
    [(PUTouchingGestureRecognizer *)v12 setDelegate:v7];
    [(PHVideoScrubberView *)v7 addGestureRecognizer:v12];
    double v13 = (void *)[objc_alloc(MEMORY[0x1E4FB1968]) initWithTarget:v7 action:sel__handleLongPressGesture_];
    [v11 maximumSingleTapDuration];
    objc_msgSend(v13, "setMinimumPressDuration:");
    [(PHVideoScrubberView *)v7 addGestureRecognizer:v13];
  }
  return v7;
}

- (void)dealloc
{
  [(AVPlayer *)self->_player removeObserver:self forKeyPath:@"status" context:avPlayerObservationContext];
  [(AVPlayer *)self->_player removeObserver:self forKeyPath:@"currentItem" context:avPlayerObservationContext];
  [(AVPlayer *)self->_player removeObserver:self forKeyPath:@"currentItem.videoComposition" context:avPlayerObservationContext];
  v3.receiver = self;
  v3.super_class = (Class)PHVideoScrubberView;
  [(PHVideoScrubberView *)&v3 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ((void *)avPlayerObservationContext == a6)
  {
    [(PHVideoScrubberView *)self _invalidateFilmStripView];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)PHVideoScrubberView;
    -[PHVideoScrubberView observeValueForKeyPath:ofObject:change:context:](&v6, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

@end