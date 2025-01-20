@interface SVPlayerItemObserver
- (AVPlayer)player;
- (AVPlayerItem)item;
- (SVKeyValueObserver)observer;
- (SVPlayerItemObserver)initWithPlayer:(id)a3;
- (id)changeBlock;
- (void)onChange:(id)a3;
- (void)setItem:(id)a3;
@end

@implementation SVPlayerItemObserver

- (SVPlayerItemObserver)initWithPlayer:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SVPlayerItemObserver;
  v6 = [(SVPlayerItemObserver *)&v19 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_player, a3);
    objc_initWeak(&location, v7);
    v8 = [SVKeyValueObserver alloc];
    uint64_t v13 = MEMORY[0x263EF8330];
    uint64_t v14 = 3221225472;
    v15 = __39__SVPlayerItemObserver_initWithPlayer___block_invoke;
    v16 = &unk_264771050;
    objc_copyWeak(&v17, &location);
    uint64_t v9 = [(SVKeyValueObserver *)v8 initWithKeyPath:@"currentItem" ofObject:v5 withOptions:1 change:&v13];
    observer = v7->_observer;
    v7->_observer = (SVKeyValueObserver *)v9;

    v11 = objc_msgSend(v5, "currentItem", v13, v14, v15, v16);
    objc_storeWeak((id *)&v7->_item, v11);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __39__SVPlayerItemObserver_initWithPlayer___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = [a3 objectForKey:*MEMORY[0x263F081B8]];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setItem:v5];
}

- (void)setItem:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_item);

  id v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_item, obj);
    v6 = [(SVPlayerItemObserver *)self changeBlock];

    id v5 = obj;
    if (v6)
    {
      v7 = [(SVPlayerItemObserver *)self changeBlock];
      ((void (**)(void, SVPlayerItemObserver *))v7)[2](v7, self);

      id v5 = obj;
    }
  }
}

- (id)changeBlock
{
  return self->_changeBlock;
}

- (void)onChange:(id)a3
{
}

- (AVPlayerItem)item
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_item);

  return (AVPlayerItem *)WeakRetained;
}

- (AVPlayer)player
{
  return self->_player;
}

- (SVKeyValueObserver)observer
{
  return self->_observer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observer, 0);
  objc_storeStrong((id *)&self->_player, 0);
  objc_destroyWeak((id *)&self->_item);

  objc_storeStrong(&self->_changeBlock, 0);
}

@end