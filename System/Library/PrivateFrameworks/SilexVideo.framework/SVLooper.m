@interface SVLooper
- (AVPlayer)player;
- (SVLooper)initWithPlayer:(id)a3;
- (SVVideoDurationObserver)durationObserver;
@end

@implementation SVLooper

- (SVLooper)initWithPlayer:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SVLooper;
  v6 = [(SVLooper *)&v17 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_player, a3);
    v8 = [[SVPlayerItemObserver alloc] initWithPlayer:v5];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __27__SVLooper_initWithPlayer___block_invoke;
    v15[3] = &unk_2647712A8;
    v9 = v8;
    v16 = v9;
    v10 = (void (**)(void, void))MEMORY[0x22A63E020](v15);
    v11 = [[SVVideoDurationObserver alloc] initWithPlayerItemObserver:v9];
    durationObserver = v7->_durationObserver;
    v7->_durationObserver = v11;

    [(SVVideoDurationObserver *)v7->_durationObserver onChange:v10];
    [(SVVideoDurationObserver *)v7->_durationObserver duration];
    if (v13 > 0.0) {
      ((void (**)(void, SVVideoDurationObserver *))v10)[2](v10, v7->_durationObserver);
    }
  }
  return v7;
}

void __27__SVLooper_initWithPlayer___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) item];
  v3 = [*(id *)(a1 + 32) item];
  v4 = v3;
  if (v3) {
    [v3 duration];
  }
  else {
    memset(&duration, 0, sizeof(duration));
  }
  CMTime v5 = *(CMTime *)*(void *)&MEMORY[0x263F010E0];
  CMTimeRangeMake(&v7, &v5, &duration);
  [v2 setLoopTimeRange:&v7];
}

- (AVPlayer)player
{
  return self->_player;
}

- (SVVideoDurationObserver)durationObserver
{
  return self->_durationObserver;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_durationObserver, 0);

  objc_storeStrong((id *)&self->_player, 0);
}

@end