@interface RBAnimationThread
- (id).cxx_construct;
- (uint64_t)initThread;
- (uint64_t)startThread;
- (void)dispatchHandlers:(id)a3;
- (void)initWithScreen:(void *)a1;
- (void)thread:(id)a3;
@end

@implementation RBAnimationThread

- (void)initWithScreen:(void *)a1
{
  if (!a1) {
    return 0;
  }
  v8.receiver = a1;
  v8.super_class = (Class)RBAnimationThread;
  v3 = objc_msgSendSuper2(&v8, sel_init);
  if (v3)
  {
    if (a2) {
      v4 = a2;
    }
    else {
      v4 = (void *)MEMORY[0x263F15780];
    }
    id v5 = (id)[v4 displayLinkWithTarget:v3 selector:sel_dispatchHandlers_];
    id v6 = (id)v3[2];
    if (v6 != v5)
    {

      id v5 = v5;
      v3[2] = v5;
    }
    if (v5)
    {
      *(void *)((char *)v3 + 28) = 60;
      return v3;
    }

    return 0;
  }
  return v3;
}

- (uint64_t)startThread
{
  if (result)
  {
    uint64_t v1 = result;
    v2 = (void *)[objc_alloc(MEMORY[0x263F08B88]) initWithTarget:result selector:sel_thread_ object:0];

    *(void *)(v1 + 8) = v2;
    [v2 setQualityOfService:33];
    [*(id *)(v1 + 8) setName:@"com.apple.renderbox.animation-thread"];
    v3 = *(void **)(v1 + 8);
    return [v3 start];
  }
  return result;
}

- (void)thread:(id)a3
{
  -[RBAnimationThread initThread]((uint64_t)self);
  v4 = (void *)[MEMORY[0x263EFF9F0] currentRunLoop];
  [(CADisplayLink *)self->_link._p addToRunLoop:v4 forMode:*MEMORY[0x263EFF588]];
  self->_empty_ttl = 10;
  os_unfair_lock_lock(v5);
  os_unfair_lock_unlock(v5);
  [(CADisplayLink *)self->_link._p invalidate];

  self->_link._p = 0;
  self->_thread._p = 0;
}

- (uint64_t)initThread
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (result)
  {
    uint64_t v1 = pthread_self();
    result = pthread_mach_thread_np(v1);
    if (result)
    {
      thread_act_t v2 = result;
      integer_t policy_info = 0;
      thread_policy_set(result, 1u, &policy_info, 1u);
      pid_t v3 = getpid();
      result = proc_pidinfo(v3, 2, 0, buffer, 232);
      if ((int)result >= 1)
      {
        integer_t v4 = 54 - v7;
        return thread_policy_set(v2, 3u, &v4, 1u);
      }
    }
  }
  return result;
}

- (void)dispatchHandlers:(id)a3
{
  os_unfair_lock_t lock = (os_unfair_lock_t)v4;
  char v23 = 1;
  os_unfair_lock_lock((os_unfair_lock_t)v4);
  self->_pending_int frame_rate = 48;
  uint64_t v5 = v4 + 8;
  uint64_t v6 = *(void *)(v4 + 272);
  if (*(void *)(v4 + 264)) {
    uint64_t v5 = *(void *)(v4 + 264);
  }
  if (v6)
  {
    uint64_t v7 = 32 * v6;
    uint64_t v8 = (float *)(v5 + 24);
    int v9 = 48;
    while (1)
    {
      float v10 = *v8;
      if (*v8 >= 320.0) {
        break;
      }
      if (v10 >= 160.0)
      {
        if (v9 <= 80) {
          int v9 = 80;
        }
        goto LABEL_13;
      }
      if (v10 >= 100.0)
      {
        if (v9 <= 60) {
          int v9 = 60;
        }
        goto LABEL_13;
      }
LABEL_14:
      v8 += 8;
      v7 -= 32;
      if (!v7) {
        goto LABEL_15;
      }
    }
    int v9 = 120;
LABEL_13:
    self->_pending_int frame_rate = v9;
    goto LABEL_14;
  }
LABEL_15:
  int frame_rate = self->_frame_rate;
  [(CADisplayLink *)self->_link._p targetTimestamp];
  if (*(void *)(v4 + 272))
  {
    self->_empty_ttl = 10;
    pending_int frame_rate = self->_pending_frame_rate;
    if (pending_frame_rate != self->_frame_rate)
    {
      self->_int frame_rate = pending_frame_rate;
      LODWORD(v13) = 1117782016;
      LODWORD(v14) = 1123024896;
      float v18 = 80.0;
      LODWORD(v16) = 1111490560;
      if (pending_frame_rate > 54) {
        *(float *)&double v16 = 60.0;
      }
      if (pending_frame_rate <= 74) {
        float v18 = 60.0;
      }
      else {
        *(float *)&double v16 = 80.0;
      }
      if (pending_frame_rate <= 114) {
        float v19 = *(float *)&v16;
      }
      else {
        float v19 = 120.0;
      }
      if (pending_frame_rate <= 114)
      {
        *(float *)&double v14 = v18;
        *(float *)&double v13 = *(float *)&v16;
      }
      *(float *)&double v15 = v19;
      -[CADisplayLink setPreferredFrameRateRange:](self->_link._p, "setPreferredFrameRateRange:", v13, v14, v15, v16);
      if (v19 > 60.0) {
        [(CADisplayLink *)self->_link._p setHighFrameRateReason:2555992];
      }
    }
  }
  else
  {
    unsigned int v20 = self->_empty_ttl - 1;
    self->_empty_ttl = v20;
    if (!v20)
    {
      v21 = (void *)[MEMORY[0x263EFF9F0] currentRunLoop];
      [(CADisplayLink *)self->_link._p removeFromRunLoop:v21 forMode:*MEMORY[0x263EFF588]];
      CFRunLoopStop((CFRunLoopRef)[v21 getCFRunLoop]);
    }
  }
  if (v23) {
    os_unfair_lock_unlock(lock);
  }
}

- (void).cxx_destruct
{
  p = self->_thread._p;
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

@end