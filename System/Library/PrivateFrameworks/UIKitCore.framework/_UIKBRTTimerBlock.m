@interface _UIKBRTTimerBlock
- (NSTimer)timer;
- (OS_dispatch_queue)queue;
- (OS_dispatch_queue)selfQueue;
- (_UIKBRTTimerBlock)initWithTimeInterval:(double)a3 onQueue:(id)a4 do:(id)a5 owner:(id)a6;
- (id)onTimer;
- (id)owner;
- (void)dealloc;
- (void)fireNow;
- (void)invalidate;
- (void)timerFired:(id)a3;
@end

@implementation _UIKBRTTimerBlock

- (_UIKBRTTimerBlock)initWithTimeInterval:(double)a3 onQueue:(id)a4 do:(id)a5 owner:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v23.receiver = self;
  v23.super_class = (Class)_UIKBRTTimerBlock;
  v14 = [(_UIKBRTTimerBlock *)&v23 init];
  if (v14)
  {
    dispatch_queue_t v15 = dispatch_queue_create("UIKBRTTouchInfoQueue", 0);
    selfQueue = v14->_selfQueue;
    v14->_selfQueue = (OS_dispatch_queue *)v15;

    objc_storeStrong((id *)&v14->_queue, a4);
    v17 = _Block_copy(v12);
    id onTimer = v14->_onTimer;
    v14->_id onTimer = v17;

    objc_storeStrong(&v14->_owner, a6);
    uint64_t v19 = [MEMORY[0x1E4F1CB00] timerWithTimeInterval:v14 target:sel_timerFired_ selector:0 userInfo:0 repeats:a3];
    timer = v14->_timer;
    v14->_timer = (NSTimer *)v19;

    v21 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    [v21 addTimer:v14->_timer forMode:*MEMORY[0x1E4F1C3A0]];
  }
  return v14;
}

- (void)dealloc
{
  [(_UIKBRTTimerBlock *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)_UIKBRTTimerBlock;
  [(_UIKBRTTimerBlock *)&v3 dealloc];
}

- (void)fireNow
{
  selfQueue = self->_selfQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __28___UIKBRTTimerBlock_fireNow__block_invoke;
  v3[3] = &unk_1E52D9CD0;
  v3[4] = self;
  v3[5] = a2;
  dispatch_sync(selfQueue, v3);
}

- (void)invalidate
{
  selfQueue = self->_selfQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31___UIKBRTTimerBlock_invalidate__block_invoke;
  block[3] = &unk_1E52D9F70;
  block[4] = self;
  dispatch_sync(selfQueue, block);
}

- (void)timerFired:(id)a3
{
  id v4 = a3;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__141;
  v27 = __Block_byref_object_dispose__141;
  id v28 = 0;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__108;
  v21 = __Block_byref_object_dispose__109;
  id v22 = 0;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy__141;
  v15[4] = __Block_byref_object_dispose__141;
  id v16 = 0;
  selfQueue = self->_selfQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32___UIKBRTTimerBlock_timerFired___block_invoke;
  block[3] = &unk_1E52FE2E0;
  id v6 = v4;
  id v10 = v6;
  id v11 = self;
  id v12 = &v23;
  id v13 = &v17;
  v14 = v15;
  dispatch_sync(selfQueue, block);
  if (v18[5])
  {
    v7 = v24[5];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __32___UIKBRTTimerBlock_timerFired___block_invoke_2;
    v8[3] = &unk_1E52EAC30;
    v8[4] = &v17;
    v8[5] = v15;
    dispatch_async(v7, v8);
  }

  _Block_object_dispose(v15, 8);
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
}

- (OS_dispatch_queue)selfQueue
{
  return self->_selfQueue;
}

- (NSTimer)timer
{
  return self->_timer;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)onTimer
{
  return self->_onTimer;
}

- (id)owner
{
  return self->_owner;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_owner, 0);
  objc_storeStrong(&self->_onTimer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_selfQueue, 0);
}

@end