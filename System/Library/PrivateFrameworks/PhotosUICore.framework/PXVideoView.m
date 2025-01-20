@interface PXVideoView
+ (Class)layerClass;
- (BOOL)toneMapToStandardDynamicRange;
- (BOOL)videoIsReadyForDisplay;
- (ISWrappedAVPlayer)player;
- (NSString)kvoProxyIdentifier;
- (NSString)videoGravity;
- (PXVideoView)init;
- (PXVideoViewDelegate)delegate;
- (void)_layerReadyForDisplayDidChange;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setKvoProxyIdentifier:(id)a3;
- (void)setPlayer:(id)a3;
- (void)setToneMapToStandardDynamicRange:(BOOL)a3;
- (void)setVideoGravity:(id)a3;
@end

@implementation PXVideoView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kvoProxyIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_player, 0);
}

- (void)setKvoProxyIdentifier:(id)a3
{
}

- (NSString)kvoProxyIdentifier
{
  return self->_kvoProxyIdentifier;
}

- (PXVideoViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXVideoViewDelegate *)WeakRetained;
}

- (void)setToneMapToStandardDynamicRange:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(PXVideoView *)self playerLayer];
  [v4 setToneMapToStandardDynamicRange:v3];
}

- (BOOL)toneMapToStandardDynamicRange
{
  v2 = [(PXVideoView *)self playerLayer];
  char v3 = [v2 toneMapToStandardDynamicRange];

  return v3;
}

- (void)_layerReadyForDisplayDidChange
{
}

void __45__PXVideoView__layerReadyForDisplayDidChange__block_invoke(uint64_t a1)
{
  v2 = *(unsigned char **)(a1 + 32);
  if (v2[416])
  {
    int v3 = [v2 videoIsReadyForDisplay];
    id v4 = +[PXWorkaroundSettings sharedInstance];
    int v5 = [v4 shouldWorkAround92398340];

    if (v3) {
      BOOL v6 = v5 == 0;
    }
    else {
      BOOL v6 = 1;
    }
    if (v6)
    {
      id v8 = [*(id *)(a1 + 32) delegate];
      [v8 videoViewReadinessDidChange:*(void *)(a1 + 32)];
    }
    else
    {
      dispatch_time_t v7 = dispatch_time(0, 100000000);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __45__PXVideoView__layerReadyForDisplayDidChange__block_invoke_2;
      block[3] = &unk_1E5DD36F8;
      block[4] = *(void *)(a1 + 32);
      dispatch_after(v7, MEMORY[0x1E4F14428], block);
    }
  }
}

void __45__PXVideoView__layerReadyForDisplayDidChange__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 videoViewReadinessDidChange:*(void *)(a1 + 32)];
}

- (BOOL)videoIsReadyForDisplay
{
  id v2 = [(PXVideoView *)self playerLayer];
  char v3 = [v2 isReadyForDisplay];

  return v3;
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    self->_delegateRespondsTo.readinessDidChange = objc_opt_respondsToSelector() & 1;
  }
}

- (void)setPlayer:(id)a3
{
  id v8 = a3;
  objc_storeStrong((id *)&self->_player, a3);
  int v5 = [(PXVideoView *)self layer];
  [v8 attachToPlayerLayerIfNeeded:v5];

  BOOL v6 = v8;
  if (!v8)
  {
    dispatch_time_t v7 = [(PXVideoView *)self layer];
    [v7 setWrappedPlayer:0];

    BOOL v6 = 0;
  }
}

- (void)dealloc
{
  char v3 = [(PXVideoView *)self playerLayer];
  [v3 deferredDealloc];

  v4.receiver = self;
  v4.super_class = (Class)PXVideoView;
  [(PXVideoView *)&v4 dealloc];
}

- (ISWrappedAVPlayer)player
{
  return self->_player;
}

- (NSString)videoGravity
{
  id v2 = [(PXVideoView *)self layer];
  char v3 = [v2 videoGravity];

  return (NSString *)v3;
}

- (void)setVideoGravity:(id)a3
{
  objc_super v4 = (void *)MEMORY[0x1E4F39CF8];
  id v5 = a3;
  [v4 begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  BOOL v6 = [(PXVideoView *)self layer];
  [v6 setVideoGravity:v5];

  dispatch_time_t v7 = (void *)MEMORY[0x1E4F39CF8];
  [v7 commit];
}

- (PXVideoView)init
{
  v8.receiver = self;
  v8.super_class = (Class)PXVideoView;
  id v2 = [(PXVideoView *)&v8 init];
  if (v2)
  {
    objc_initWeak(&location, v2);
    uint64_t v5 = MEMORY[0x1E4F143A8];
    objc_copyWeak(&v6, &location);
    char v3 = [(PXVideoView *)v2 playerLayer];
    [v3 setReadyForDisplayChangeHandler:&v5];

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __19__PXVideoView_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _layerReadyForDisplayDidChange];
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

@end