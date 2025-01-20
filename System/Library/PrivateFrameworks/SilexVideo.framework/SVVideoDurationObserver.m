@interface SVVideoDurationObserver
- (SVKeyValueObserver)playerItemDurationObserver;
- (SVPlayerItemObserving)playerItemObserver;
- (SVVideoDurationObserver)initWithPlayerItemObserver:(id)a3;
- (double)duration;
- (id)changeBlock;
- (void)onChange:(id)a3;
- (void)setDuration:(double)a3;
- (void)setPlayerItemDurationObserver:(id)a3;
- (void)updateDuration:(id *)a3;
@end

@implementation SVVideoDurationObserver

- (SVVideoDurationObserver)initWithPlayerItemObserver:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SVVideoDurationObserver;
  v6 = [(SVVideoDurationObserver *)&v18 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_playerItemObserver, a3);
    objc_initWeak(&location, v7);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __54__SVVideoDurationObserver_initWithPlayerItemObserver___block_invoke;
    v15[3] = &unk_264771078;
    objc_copyWeak(&v16, &location);
    v8 = (void *)MEMORY[0x22A63E020](v15);
    v9 = [(SVVideoDurationObserver *)v7 playerItemObserver];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __54__SVVideoDurationObserver_initWithPlayerItemObserver___block_invoke_3;
    v13[3] = &unk_2647710A0;
    id v10 = v8;
    id v14 = v10;
    [v9 onChange:v13];

    v11 = [v5 item];
    (*((void (**)(id, void *))v10 + 2))(v10, v11);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __54__SVVideoDurationObserver_initWithPlayerItemObserver___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [v3 duration];
    [WeakRetained updateDuration:v10];

    id v5 = [SVKeyValueObserver alloc];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __54__SVVideoDurationObserver_initWithPlayerItemObserver___block_invoke_2;
    v8[3] = &unk_264771050;
    objc_copyWeak(&v9, (id *)(a1 + 32));
    v6 = [(SVKeyValueObserver *)v5 initWithKeyPath:@"duration" ofObject:v3 withOptions:1 change:v8];
    objc_destroyWeak(&v9);
  }
  else
  {
    v6 = 0;
  }
  id v7 = objc_loadWeakRetained((id *)(a1 + 32));
  [v7 setPlayerItemDurationObserver:v6];
}

void __54__SVVideoDurationObserver_initWithPlayerItemObserver___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  long long v9 = 0uLL;
  uint64_t v10 = 0;
  v4 = [a3 objectForKey:*MEMORY[0x263F081B8]];
  id v5 = v4;
  if (v4)
  {
    [v4 CMTimeValue];
  }
  else
  {
    long long v9 = 0uLL;
    uint64_t v10 = 0;
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  long long v7 = v9;
  uint64_t v8 = v10;
  [WeakRetained updateDuration:&v7];
}

void __54__SVVideoDurationObserver_initWithPlayerItemObserver___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 item];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

- (void)updateDuration:(id *)a3
{
  if ((a3->var2 & 0x1D) == 1 && (a3->var2 & 0x11) != 17)
  {
    CMTime v4 = *(CMTime *)a3;
    [(SVVideoDurationObserver *)self setDuration:fmax(CMTimeGetSeconds(&v4), 0.0)];
  }
}

- (void)setDuration:(double)a3
{
  if (self->_duration != a3)
  {
    self->_duration = a3;
    CMTime v4 = [(SVVideoDurationObserver *)self changeBlock];

    if (v4)
    {
      id v5 = [(SVVideoDurationObserver *)self changeBlock];
      v5[2](v5, self);
    }
  }
}

- (id)changeBlock
{
  return self->changeBlock;
}

- (void)onChange:(id)a3
{
}

- (SVPlayerItemObserving)playerItemObserver
{
  return self->_playerItemObserver;
}

- (SVKeyValueObserver)playerItemDurationObserver
{
  return self->_playerItemDurationObserver;
}

- (void)setPlayerItemDurationObserver:(id)a3
{
}

- (double)duration
{
  return self->_duration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerItemDurationObserver, 0);
  objc_storeStrong((id *)&self->_playerItemObserver, 0);

  objc_storeStrong(&self->changeBlock, 0);
}

@end