@interface MRScreenMirroringObserver
+ (id)UIControllingObserver;
+ (id)observerWithStateChangeCallback:(id)a3;
- (MRScreenMirroringObserver)initWithStateChangeCallback:(id)a3;
- (OS_dispatch_queue)queue;
- (id)callback;
- (int64_t)deviceCount;
- (void)_contextChangeNotification:(id)a3;
- (void)_init;
- (void)_notifyIfNeeded;
- (void)dealloc;
- (void)setDeviceCount:(int64_t)a3;
@end

@implementation MRScreenMirroringObserver

+ (id)observerWithStateChangeCallback:(id)a3
{
  id v3 = a3;
  v4 = [[MRScreenMirroringObserver alloc] initWithStateChangeCallback:v3];

  return v4;
}

+ (id)UIControllingObserver
{
  v2 = objc_alloc_init(MRScreenMirroringUIControllingObserver);

  return v2;
}

- (MRScreenMirroringObserver)initWithStateChangeCallback:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MRScreenMirroringObserver;
  v5 = [(MRScreenMirroringObserver *)&v14 init];
  v6 = v5;
  if (v5)
  {
    v5->_deviceCount = 0;
    uint64_t v7 = MEMORY[0x1997190F0](v4);
    id callback = v6->_callback;
    v6->_id callback = (id)v7;

    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.MediaRemote.MRScreenMirroringObserver.queue", v9);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v10;

    [(MRScreenMirroringObserver *)v6 _init];
    v12 = _MRLogForCategory(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v16 = v6;
      _os_log_impl(&dword_194F3C000, v12, OS_LOG_TYPE_DEFAULT, "[MRScreenMirroringObserver] <%p> Initialized.", buf, 0xCu);
    }
  }
  return v6;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = _MRLogForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v6 = self;
    _os_log_impl(&dword_194F3C000, v3, OS_LOG_TYPE_DEFAULT, "[MRScreenMirroringObserver] <%p> Deallocating.", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)MRScreenMirroringObserver;
  [(MRScreenMirroringObserver *)&v4 dealloc];
}

- (void)_init
{
  id v3 = [(MRScreenMirroringObserver *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__MRScreenMirroringObserver__init__block_invoke;
  block[3] = &unk_1E57D0518;
  block[4] = self;
  dispatch_async(v3, block);
}

void __34__MRScreenMirroringObserver__init__block_invoke(uint64_t a1)
{
  id v4 = +[MRAVOutputContext sharedSystemScreenContext];
  v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 addObserver:*(void *)(a1 + 32) selector:sel__contextChangeNotification_ name:@"MRAVOutputContextOutputDevicesDidChangeNotification" object:v4];

  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:*(void *)(a1 + 32) selector:sel__contextChangeNotification_ name:@"MRAVOutputContextOutputDeviceDidChangeNotification" object:v4];

  [*(id *)(a1 + 32) _notifyIfNeeded];
}

- (void)_contextChangeNotification:(id)a3
{
  id v4 = a3;
  v5 = [(MRScreenMirroringObserver *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__MRScreenMirroringObserver__contextChangeNotification___block_invoke;
  v7[3] = &unk_1E57D0790;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __56__MRScreenMirroringObserver__contextChangeNotification___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = _MRLogForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = [*(id *)(a1 + 40) name];
    int v6 = 134218242;
    uint64_t v7 = v3;
    __int16 v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_194F3C000, v2, OS_LOG_TYPE_DEFAULT, "[MRScreenMirroringObserver] <%p> Received %@.", (uint8_t *)&v6, 0x16u);
  }
  return [*(id *)(a1 + 32) _notifyIfNeeded];
}

- (void)_notifyIfNeeded
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(MRScreenMirroringObserver *)self deviceCount];
  id v4 = +[MRAVOutputContext sharedSystemScreenContext];
  v5 = [v4 outputDevices];
  -[MRScreenMirroringObserver setDeviceCount:](self, "setDeviceCount:", [v5 count]);

  int v6 = _MRLogForCategory(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = +[MRAVOutputContext sharedSystemScreenContext];
    int v12 = 134218752;
    v13 = self;
    __int16 v14 = 2048;
    v15 = v7;
    __int16 v16 = 2048;
    uint64_t v17 = v3;
    __int16 v18 = 2048;
    int64_t v19 = [(MRScreenMirroringObserver *)self deviceCount];
    _os_log_impl(&dword_194F3C000, v6, OS_LOG_TYPE_DEFAULT, "[MRScreenMirroringObserver] <%p> Re-evaluate for context: %p. Old count: %ld, new: %ld.", (uint8_t *)&v12, 0x2Au);
  }
  if (v3)
  {
    if (v3 >= 1 && ![(MRScreenMirroringObserver *)self deviceCount])
    {
      __int16 v8 = [(MRScreenMirroringObserver *)self callback];

      if (v8)
      {
        v9 = _MRLogForCategory(0);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          int v12 = 134217984;
          v13 = self;
          _os_log_impl(&dword_194F3C000, v9, OS_LOG_TYPE_DEFAULT, "[MRScreenMirroringObserver] <%p> Notify mirroring OFF.", (uint8_t *)&v12, 0xCu);
        }
LABEL_14:

        v11 = [(MRScreenMirroringObserver *)self callback];
        v11[2]();
      }
    }
  }
  else if ([(MRScreenMirroringObserver *)self deviceCount] >= 1)
  {
    uint64_t v10 = [(MRScreenMirroringObserver *)self callback];

    if (v10)
    {
      v9 = _MRLogForCategory(0);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 134217984;
        v13 = self;
        _os_log_impl(&dword_194F3C000, v9, OS_LOG_TYPE_DEFAULT, "[MRScreenMirroringObserver] <%p> Notify mirroring ON.", (uint8_t *)&v12, 0xCu);
      }
      goto LABEL_14;
    }
  }
}

- (id)callback
{
  return self->_callback;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (int64_t)deviceCount
{
  return self->_deviceCount;
}

- (void)setDeviceCount:(int64_t)a3
{
  self->_deviceCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong(&self->_callback, 0);
}

@end