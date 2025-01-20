@interface NUAVPlayerView
+ (Class)layerClass;
- (AVPlayer)player;
- (BOOL)isReadyForDisplay;
- (NUAVPlayerView)initWithCoder:(id)a3;
- (NUAVPlayerView)initWithFrame:(CGRect)a3;
- (NUAVPlayerViewDelegate)delegate;
- (void)_setReadyForDisplay:(BOOL)a3;
- (void)_updateReadyForDisplayWithID:(int)a3;
- (void)dealloc;
- (void)dispose;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setDelegate:(id)a3;
- (void)setPlayer:(id)a3;
@end

@implementation NUAVPlayerView

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_player, 0);
}

- (void)setDelegate:(id)a3
{
}

- (NUAVPlayerViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NUAVPlayerViewDelegate *)WeakRetained;
}

- (BOOL)isReadyForDisplay
{
  return self->_readyForDisplay;
}

- (AVPlayer)player
{
  return self->_player;
}

- (void)_setReadyForDisplay:(BOOL)a3
{
  if (self->_readyForDisplay != a3)
  {
    self->_readyForDisplay = a3;
    id v4 = [(NUAVPlayerView *)self delegate];
    [v4 playerViewReadyForDisplayDidChange:self];
  }
}

- (void)_updateReadyForDisplayWithID:(int)a3
{
  unsigned int v3 = atomic_load((unsigned int *)&self->_updateReadyForDisplayID);
  if (v3 == a3)
  {
    id v5 = [(NUAVPlayerView *)self layer];
    -[NUAVPlayerView _setReadyForDisplay:](self, "_setReadyForDisplay:", [v5 isReadyForDisplay]);
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a4;
  v11 = v10;
  if ((void *)PlayerLayerReadyForDisplayObservationContext == a6)
  {
    uint64_t v12 = atomic_fetch_add(&self->_updateReadyForDisplayID, 1u) + 1;
    if ([v10 isReadyForDisplay])
    {
      [(NUAVPlayerView *)self _updateReadyForDisplayWithID:v12];
    }
    else
    {
      objc_initWeak(&location, self);
      dispatch_time_t v13 = dispatch_time(0, 300000000);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __65__NUAVPlayerView_observeValueForKeyPath_ofObject_change_context___block_invoke;
      block[3] = &unk_2642C2DE8;
      objc_copyWeak(&v16, &location);
      int v17 = v12;
      dispatch_after(v13, MEMORY[0x263EF83A0], block);
      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)NUAVPlayerView;
    [(NUAVPlayerView *)&v14 observeValueForKeyPath:a3 ofObject:v10 change:a5 context:a6];
  }
}

void __65__NUAVPlayerView_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = atomic_load((unsigned int *)(a1 + 40));
  [WeakRetained _updateReadyForDisplayWithID:v2];
}

- (void)dealloc
{
  [(NUAVPlayerView *)self dispose];
  v3.receiver = self;
  v3.super_class = (Class)NUAVPlayerView;
  [(NUAVPlayerView *)&v3 dealloc];
}

- (void)dispose
{
  if (!self->_observerDetached)
  {
    self->_observerDetached = 1;
    id v3 = [(NUAVPlayerView *)self layer];
    [v3 removeObserver:self forKeyPath:@"readyForDisplay" context:PlayerLayerReadyForDisplayObservationContext];
  }
}

- (NUAVPlayerView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NUAVPlayerView;
  id v3 = [(NUAVPlayerView *)&v5 initWithCoder:a3];
  _commonInit(v3);
  return v3;
}

- (NUAVPlayerView)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NUAVPlayerView;
  id v3 = -[NUAVPlayerView initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  _commonInit(v3);
  return v3;
}

- (void)setPlayer:(id)a3
{
  v6 = (AVPlayer *)a3;
  if (self->_player != v6)
  {
    objc_storeStrong((id *)&self->_player, a3);
    objc_super v5 = [(NUAVPlayerView *)self layer];
    [v5 setPlayer:v6];
  }
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

@end