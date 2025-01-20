@interface ISTouchLivePhotoPlaybackFilter
- (BOOL)isTouchActive;
- (ISDisplayLink)_displayLink;
- (NSDate)_playbackStartDate;
- (int64_t)_nextPlaybackRequestID;
- (int64_t)_playbackRequestID;
- (void)_handleDisplayLink;
- (void)_setDisplayLink:(id)a3;
- (void)_setPlaybackReaquestID:(int64_t)a3;
- (void)_setPlaybackStartDate:(id)a3;
- (void)didPerformChanges;
- (void)reset;
- (void)setTouchActive:(BOOL)a3;
@end

@implementation ISTouchLivePhotoPlaybackFilter

- (void).cxx_destruct
{
}

- (void)_setPlaybackStartDate:(id)a3
{
}

- (NSDate)_playbackStartDate
{
  return self->__playbackStartDate;
}

- (void)_setDisplayLink:(id)a3
{
  self->__displayLink = (ISDisplayLink *)a3;
}

- (ISDisplayLink)_displayLink
{
  return self->__displayLink;
}

- (void)_setPlaybackReaquestID:(int64_t)a3
{
  self->__playbackRequestID = a3;
}

- (int64_t)_playbackRequestID
{
  return self->__playbackRequestID;
}

- (BOOL)isTouchActive
{
  return self->_touchActive;
}

- (void)reset
{
  if ([(ISLivePhotoPlaybackFilter *)self playIsSticky])
  {
    v3.receiver = self;
    v3.super_class = (Class)ISTouchLivePhotoPlaybackFilter;
    [(ISLivePhotoPlaybackFilter *)&v3 reset];
  }
}

- (void)_handleDisplayLink
{
  objc_super v3 = [(ISTouchLivePhotoPlaybackFilter *)self _playbackStartDate];
  [v3 timeIntervalSinceNow];
  double v5 = v4;

  v6[1] = 3221225472;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[2] = __52__ISTouchLivePhotoPlaybackFilter__handleDisplayLink__block_invoke;
  v6[3] = &unk_1E6BECFE8;
  v6[4] = self;
  *(double *)&v6[5] = v5 / -0.1 + 1.0;
  [(ISObservable *)self performChanges:v6];
}

uint64_t __52__ISTouchLivePhotoPlaybackFilter__handleDisplayLink__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setHintProgress:*(double *)(a1 + 40)];
}

- (void)didPerformChanges
{
  v6.receiver = self;
  v6.super_class = (Class)ISTouchLivePhotoPlaybackFilter;
  [(ISObservable *)&v6 didPerformChanges];
  BOOL v3 = [(ISTouchLivePhotoPlaybackFilter *)self isTouchActive];
  [(ISLivePhotoPlaybackFilter *)self hintProgress];
  if (v3)
  {
    if (v4 >= 1.0)
    {
      if ([(ISLivePhotoPlaybackFilter *)self state] == 1)
      {
        if ([(ISLivePhotoPlaybackFilter *)self isPlaybackDisabled]) {
          uint64_t v5 = 1;
        }
        else {
          uint64_t v5 = 2;
        }
      }
      else
      {
        uint64_t v5 = 2 * ([(ISLivePhotoPlaybackFilter *)self state] == 2);
      }
    }
    else
    {
      uint64_t v5 = 1;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  [(ISLivePhotoPlaybackFilter *)self setState:v5];
}

- (void)setTouchActive:(BOOL)a3
{
  if (self->_touchActive != a3)
  {
    self->_touchActive = a3;
    if (a3)
    {
      double v4 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:0.1];
      [(ISTouchLivePhotoPlaybackFilter *)self _setPlaybackStartDate:v4];
      objc_initWeak(&location, self);
      uint64_t v5 = [ISDisplayLink alloc];
      uint64_t v8 = MEMORY[0x1E4F143A8];
      uint64_t v9 = 3221225472;
      v10 = __49__ISTouchLivePhotoPlaybackFilter_setTouchActive___block_invoke;
      v11 = &unk_1E6BECBD0;
      objc_copyWeak(&v12, &location);
      objc_super v6 = [(ISDisplayLink *)v5 initWithUpdateHandler:&v8 completionHandler:0];
      -[ISDisplayLink setPreferredFramesPerSecond:](v6, "setPreferredFramesPerSecond:", 60, v8, v9, v10, v11);
      [(ISTouchLivePhotoPlaybackFilter *)self _setDisplayLink:v6];
      [(ISDisplayLink *)v6 start];

      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
    }
    else
    {
      v7 = [(ISTouchLivePhotoPlaybackFilter *)self _displayLink];
      [v7 stop];

      [(ISTouchLivePhotoPlaybackFilter *)self _setDisplayLink:0];
    }
  }
}

void __49__ISTouchLivePhotoPlaybackFilter_setTouchActive___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleDisplayLink];
}

- (int64_t)_nextPlaybackRequestID
{
  int64_t v3 = [(ISTouchLivePhotoPlaybackFilter *)self _playbackRequestID] + 1;
  [(ISTouchLivePhotoPlaybackFilter *)self _setPlaybackReaquestID:v3];
  return v3;
}

@end