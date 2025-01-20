@interface VFXJitterer
+ (void)initialize;
- (BOOL)isAborting;
- (BOOL)isEnabled;
- (VFXJitterer)initWithDelegate:(id)a3;
- (void)dealloc;
- (void)delegateWillDie;
- (void)jitter;
- (void)restart;
- (void)setEnabled:(BOOL)a3;
- (void)stopIfNeeded;
- (void)update;
@end

@implementation VFXJitterer

+ (void)initialize
{
  v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  qword_1EB995F68 = (uint64_t)dispatch_queue_create("com.apple.vfx.jitteringUpdateQueue", v2);
}

- (VFXJitterer)initWithDelegate:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)VFXJitterer;
  v4 = [(VFXJitterer *)&v10 init];
  v5 = v4;
  if (v4)
  {
    objc_storeWeak((id *)&v4->_delegate, a3);
    v5->_restartSourceIsSuspended = 1;
    v5->_state = 3;
    v9[0] = 0;
    v9[1] = v9;
    v9[2] = 0x3052000000;
    v9[3] = sub_1B645F96C;
    v9[4] = sub_1B645F97C;
    v9[5] = v5;
    v6 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)qword_1EB995F68);
    v5->_restartSource = (OS_dispatch_source *)v6;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = sub_1B645F988;
    handler[3] = &unk_1E6142310;
    handler[4] = v9;
    dispatch_source_set_event_handler(v6, handler);
    _Block_object_dispose(v9, 8);
  }
  return v5;
}

- (void)dealloc
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B645FAD8;
  block[3] = &unk_1E61422C0;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)qword_1EB995F68, block);
  v3 = dispatch_semaphore_create(0);
  restartSource = self->_restartSource;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = sub_1B645FAF0;
  handler[3] = &unk_1E61422C0;
  handler[4] = v3;
  dispatch_source_set_cancel_handler(restartSource, handler);
  dispatch_source_cancel((dispatch_source_t)self->_restartSource);
  dispatch_release((dispatch_object_t)self->_restartSource);
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v3);
  objc_storeWeak((id *)&self->_delegate, 0);
  v5.receiver = self;
  v5.super_class = (Class)VFXJitterer;
  [(VFXJitterer *)&v5 dealloc];
}

- (void)delegateWillDie
{
  objc_storeWeak((id *)&self->_delegate, 0);
  if (self->_state <= 1) {
    self->_state = 2;
  }
  v3 = qword_1EB995F68;

  dispatch_sync(v3, &unk_1F0FB57E8);
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    if (a3)
    {
      self->_enabled = 1;
      objc_msgSend_restart(self, a2, a3, v3);
    }
    else
    {
      objc_msgSend_stopIfNeeded(self, a2, a3, v3);
      self->_enabled = 0;
    }
  }
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (BOOL)isAborting
{
  return self->_state == 2;
}

- (void)update
{
  id Weak = objc_loadWeak((id *)&self->_delegate);
  unint64_t state = self->_state;
  if (state)
  {
    if (state != 1) {
      return;
    }
    self->_iteration = 0;
    if (!objc_msgSend__canJitter(Weak, v4, v5, v6)) {
      return;
    }
    self->_unint64_t state = 0;
  }

  MEMORY[0x1F4181798](self, sel_jitter, v5, v6);
}

- (void)jitter
{
  if (self->_iteration >= 0x52) {
    sub_1B63F2F54(17, @"Assertion '%s' failed. invalid iteration count", v2, v3, v4, v5, v6, v7, (uint64_t)"_iteration <= CFXJitteringIterationCount");
  }
  id Weak = objc_loadWeak((id *)&self->_delegate);
  if (Weak)
  {
    objc_super v10 = Weak;
    v11 = (void *)MEMORY[0x1BA9B76E0]();
    id v12 = v10;
    unint64_t iteration = self->_iteration;
    BOOL v18 = (iteration & 1) == 0 && iteration > 8;
    v19 = objc_msgSend_renderer(v10, v13, v14, v15);
    objc_msgSend__jitterAtStep_updateMainFramebuffer_redisplay_jitterer_(v19, v20, self->_iteration, v18, v18, self);
    unint64_t state = self->_state;
    unint64_t v22 = self->_iteration + 1;
    self->_unint64_t iteration = v22;
    if (v22 == 81)
    {
      if (!state) {
        self->_unint64_t state = 3;
      }
    }
    else if (state != 2)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = sub_1B645FDC0;
      block[3] = &unk_1E61422C0;
      block[4] = self;
      dispatch_async((dispatch_queue_t)qword_1EB995F68, block);
    }
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = sub_1B645FDC8;
    v23[3] = &unk_1E61422C0;
    v23[4] = v10;
    dispatch_async(MEMORY[0x1E4F14428], v23);
  }
}

- (void)stopIfNeeded
{
  if (self->_enabled)
  {
    if (self->_state <= 1) {
      self->_unint64_t state = 2;
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1B645FE64;
    block[3] = &unk_1E61422C0;
    block[4] = self;
    dispatch_async((dispatch_queue_t)qword_1EB995F68, block);
  }
}

- (void)restart
{
  if (self->_enabled)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1B645FF24;
    block[3] = &unk_1E61422C0;
    block[4] = self;
    dispatch_async((dispatch_queue_t)qword_1EB995F68, block);
  }
}

@end