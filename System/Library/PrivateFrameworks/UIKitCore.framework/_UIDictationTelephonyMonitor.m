@interface _UIDictationTelephonyMonitor
- (BOOL)telephonyActivity;
- (_UIDictationTelephonyMonitor)init;
- (id)activityChanged;
- (void)_backgroundInit;
- (void)_backgroundReset;
- (void)setActivityChanged:(id)a3;
- (void)start;
@end

@implementation _UIDictationTelephonyMonitor

- (BOOL)telephonyActivity
{
  return self->_telephonyActivity;
}

- (void)start
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37___UIDictationTelephonyMonitor_start__block_invoke;
  block[3] = &unk_1E52D9F70;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)setActivityChanged:(id)a3
{
}

- (_UIDictationTelephonyMonitor)init
{
  v6.receiver = self;
  v6.super_class = (Class)_UIDictationTelephonyMonitor;
  v2 = [(_UIDictationTelephonyMonitor *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create(0, 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (void)_backgroundInit
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2050000000;
  dispatch_queue_t v3 = (void *)qword_1EB25AA90;
  uint64_t v11 = qword_1EB25AA90;
  if (!qword_1EB25AA90)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __getCXCallObserverClass_block_invoke;
    v7[3] = &unk_1E52D9900;
    v7[4] = &v8;
    __getCXCallObserverClass_block_invoke((uint64_t)v7);
    dispatch_queue_t v3 = (void *)v9[3];
  }
  v4 = v3;
  _Block_object_dispose(&v8, 8);
  v5 = (CXCallObserver *)objc_alloc_init(v4);
  callObserver = self->_callObserver;
  self->_callObserver = v5;

  [(CXCallObserver *)self->_callObserver setDelegate:self queue:self->_queue];
  [(_UIDictationTelephonyMonitor *)self _backgroundReset];
}

- (void)_backgroundReset
{
  BOOL telephonyActivity = self->_telephonyActivity;
  callObserver = self->_callObserver;
  if (callObserver)
  {
    v5 = [(CXCallObserver *)callObserver calls];
    self->_BOOL telephonyActivity = [v5 count] != 0;
  }
  else
  {
    self->_BOOL telephonyActivity = 0;
  }
  objc_super v6 = [(_UIDictationTelephonyMonitor *)self activityChanged];
  v7 = v6;
  if (telephonyActivity != self->_telephonyActivity && v6 != 0)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48___UIDictationTelephonyMonitor__backgroundReset__block_invoke;
    block[3] = &unk_1E52DA040;
    id v10 = v6;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

- (id)activityChanged
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_activityChanged, 0);
  objc_storeStrong((id *)&self->_callObserver, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end