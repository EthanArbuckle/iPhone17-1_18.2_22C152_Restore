@interface MXMDisplayProbe_iphoneOS_Internal
+ (id)_allDescriptors;
+ (unint64_t)_displayIndexWithDescriptor:(id)a3;
- ($175F2685EF764341F5DD80B75CC65478)_pollDisplayForSample;
- (MXMDisplayProbePlatformDelegate)delegate;
- (id)initPrivateWithDescriptor:(id)a3 queue:(id)a4;
- (void)_loop;
- (void)_start;
- (void)_stop;
- (void)setDelegate:(id)a3;
@end

@implementation MXMDisplayProbe_iphoneOS_Internal

+ (unint64_t)_displayIndexWithDescriptor:(id)a3
{
  v3 = (void *)MEMORY[0x263F15778];
  id v4 = a3;
  v5 = [v3 displays];
  v6 = [v4 display];

  unint64_t v7 = [v5 indexOfObject:v6];
  return v7;
}

+ (id)_allDescriptors
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFF980];
  v3 = [MEMORY[0x263F15778] displays];
  id v4 = objc_msgSend(v2, "arrayWithCapacity:", objc_msgSend(v3, "count"));

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = objc_msgSend(MEMORY[0x263F15778], "displays", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = [[MXMDisplayDescriptor alloc] initWithDisplay:*(void *)(*((void *)&v12 + 1) + 8 * i)];
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)initPrivateWithDescriptor:(id)a3 queue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MXMDisplayProbe_iphoneOS_Internal;
  v9 = [(MXMDisplayProbe_iphoneOS_Internal *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_displayDescriptor, a3);
    v10->_pollRate = 0.0;
    objc_storeStrong((id *)&v10->_queue, a4);
    v10->_lastSample.timestamp = NAN;
  }

  return v10;
}

- (void)_start
{
  self->_pollRate = 0.2;
  [(MXMDisplayProbe_iphoneOS_Internal *)self _loop];
}

- (void)_stop
{
  obj = self;
  objc_sync_enter(obj);
  obj->_pollRate = 0.0;
  objc_sync_exit(obj);
}

- (void)_loop
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__MXMDisplayProbe_iphoneOS_Internal__loop__block_invoke;
  block[3] = &unk_2645251F8;
  block[4] = self;
  dispatch_async(queue, block);
  id v4 = self;
  objc_sync_enter(v4);
  double pollRate = v4->_pollRate;
  if (pollRate > 0.0)
  {
    usleep((pollRate * 1000000.0));
    [(MXMDisplayProbe_iphoneOS_Internal *)v4 _loop];
  }
  objc_sync_exit(v4);
}

- ($175F2685EF764341F5DD80B75CC65478)_pollDisplayForSample
{
  CFTimeInterval v3 = CACurrentMediaTime();
  [(id)objc_opt_class() _displayIndexWithDescriptor:self->_displayDescriptor];
  unint64_t FrameCounterByIndex = CARenderServerGetFrameCounterByIndex();
  double v5 = v3;
  result.var1 = FrameCounterByIndex;
  result.var0 = v5;
  return result;
}

- (MXMDisplayProbePlatformDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MXMDisplayProbePlatformDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_displayDescriptor, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end