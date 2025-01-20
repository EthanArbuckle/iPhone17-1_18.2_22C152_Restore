@interface ISLivePhotoPlaybackFilter
- (BOOL)isPerformingInputChanges;
- (BOOL)isPlaybackDisabled;
- (BOOL)playIsSticky;
- (ISLivePhotoPlaybackFilter)init;
- (NSMutableSet)_playbackDisabledReasons;
- (double)hintProgress;
- (int64_t)state;
- (void)_setPerformingInputChanges:(BOOL)a3;
- (void)_setPlaybackDisabled:(BOOL)a3;
- (void)_setState:(int64_t)a3;
- (void)reset;
- (void)setHintProgress:(double)a3;
- (void)setPlayIsSticky:(BOOL)a3;
- (void)setPlaybackDisabled:(BOOL)a3 forReason:(id)a4;
- (void)setState:(int64_t)a3;
@end

@implementation ISLivePhotoPlaybackFilter

- (ISLivePhotoPlaybackFilter)init
{
  v6.receiver = self;
  v6.super_class = (Class)ISLivePhotoPlaybackFilter;
  v2 = [(ISObservable *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    playbackDisabledReasons = v2->__playbackDisabledReasons;
    v2->__playbackDisabledReasons = v3;
  }
  return v2;
}

- (void).cxx_destruct
{
}

- (void)setPlaybackDisabled:(BOOL)a3 forReason:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v7 = [(ISLivePhotoPlaybackFilter *)self _playbackDisabledReasons];
  id v8 = v7;
  if (v4) {
    [v7 addObject:v6];
  }
  else {
    [v7 removeObject:v6];
  }
}

- (NSMutableSet)_playbackDisabledReasons
{
  return self->__playbackDisabledReasons;
}

- (void)_setPerformingInputChanges:(BOOL)a3
{
  self->_isPerformingInputChanges = a3;
}

- (BOOL)isPerformingInputChanges
{
  return self->_isPerformingInputChanges;
}

- (void)_setPlaybackDisabled:(BOOL)a3
{
  self->_playbackDisabled = a3;
}

- (void)setPlayIsSticky:(BOOL)a3
{
  self->_playIsSticky = a3;
}

- (BOOL)playIsSticky
{
  return self->_playIsSticky;
}

- (int64_t)state
{
  return self->_state;
}

- (double)hintProgress
{
  return self->_hintProgress;
}

- (void)reset
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __34__ISLivePhotoPlaybackFilter_reset__block_invoke;
  v2[3] = &unk_1E6BED038;
  v2[4] = self;
  [(ISObservable *)self performChanges:v2];
}

uint64_t __34__ISLivePhotoPlaybackFilter_reset__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setState:0];
}

- (void)_setState:(int64_t)a3
{
  if (self->_state != a3)
  {
    self->_state = a3;
    [(ISObservable *)self signalChange:1];
  }
}

- (void)setState:(int64_t)a3
{
  if (self->_state != 2 || ![(ISLivePhotoPlaybackFilter *)self playIsSticky])
  {
    [(ISLivePhotoPlaybackFilter *)self _setState:a3];
  }
}

- (void)setHintProgress:(double)a3
{
  if (self->_hintProgress != a3)
  {
    self->_hintProgress = a3;
    [(ISObservable *)self signalChange:2];
  }
}

- (BOOL)isPlaybackDisabled
{
  v2 = [(ISLivePhotoPlaybackFilter *)self _playbackDisabledReasons];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

@end