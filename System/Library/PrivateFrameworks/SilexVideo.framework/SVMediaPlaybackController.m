@interface SVMediaPlaybackController
- (AVPlayer)currentlyPlaying;
- (NSMapTable)timeControlStatusObservers;
- (SVMediaPlaybackController)init;
- (void)registerPlayer:(id)a3;
- (void)setCurrentlyPlaying:(id)a3;
- (void)unregisterPlayer:(id)a3;
- (void)updateCurrentlyPlaying:(id)a3;
@end

@implementation SVMediaPlaybackController

- (SVMediaPlaybackController)init
{
  v6.receiver = self;
  v6.super_class = (Class)SVMediaPlaybackController;
  v2 = [(SVMediaPlaybackController *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F08968] weakToStrongObjectsMapTable];
    timeControlStatusObservers = v2->_timeControlStatusObservers;
    v2->_timeControlStatusObservers = (NSMapTable *)v3;
  }
  return v2;
}

- (void)updateCurrentlyPlaying:(id)a3
{
  p_currentlyPlaying = &self->_currentlyPlaying;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_currentlyPlaying);
  [WeakRetained pause];

  [(SVMediaPlaybackController *)self setCurrentlyPlaying:v6];
}

- (void)registerPlayer:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = [SVKeyValueObserver alloc];
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  v10 = __44__SVMediaPlaybackController_registerPlayer___block_invoke;
  v11 = &unk_264771050;
  objc_copyWeak(&v12, &location);
  id v6 = [(SVKeyValueObserver *)v5 initWithKeyPath:@"timeControlStatus" ofObject:v4 withOptions:1 change:&v8];
  v7 = [(SVMediaPlaybackController *)self timeControlStatusObservers];
  [v7 setObject:v6 forKey:v4];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __44__SVMediaPlaybackController_registerPlayer___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = [v10 object];
    uint64_t v5 = [WeakRetained currentlyPlaying];
    if (v4 == (void *)v5)
    {
    }
    else
    {
      id v6 = (void *)v5;
      v7 = [v10 object];
      if ([v7 timeControlStatus] == 1)
      {
      }
      else
      {
        uint64_t v8 = [v10 object];
        uint64_t v9 = [v8 timeControlStatus];

        if (v9 != 2) {
          goto LABEL_9;
        }
      }
      id v4 = [v10 object];
      [WeakRetained updateCurrentlyPlaying:v4];
    }
  }
LABEL_9:
}

- (void)unregisterPlayer:(id)a3
{
  id v4 = a3;
  id v5 = [(SVMediaPlaybackController *)self timeControlStatusObservers];
  [v5 removeObjectForKey:v4];
}

- (NSMapTable)timeControlStatusObservers
{
  return self->_timeControlStatusObservers;
}

- (AVPlayer)currentlyPlaying
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentlyPlaying);

  return (AVPlayer *)WeakRetained;
}

- (void)setCurrentlyPlaying:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_currentlyPlaying);

  objc_storeStrong((id *)&self->_timeControlStatusObservers, 0);
}

@end