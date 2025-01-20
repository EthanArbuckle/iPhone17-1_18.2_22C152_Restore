@interface SKUIRunLoopDelay
- (SKUIRunLoopDelay)initWithRunLoopMode:(id)a3 timeout:(double)a4;
- (void)dealloc;
- (void)delayRunLoop;
- (void)endDelay;
@end

@implementation SKUIRunLoopDelay

- (SKUIRunLoopDelay)initWithRunLoopMode:(id)a3 timeout:(double)a4
{
  id v6 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIRunLoopDelay initWithRunLoopMode:timeout:]();
  }
  v12.receiver = self;
  v12.super_class = (Class)SKUIRunLoopDelay;
  v7 = [(SKUIRunLoopDelay *)&v12 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    mode = v7->_mode;
    v7->_mode = (NSString *)v8;

    v7->_timeout = a4;
    v7->_runLoop = CFRunLoopGetCurrent();
    memset(&v11, 0, sizeof(v11));
    v7->_runLoopSource = CFRunLoopSourceCreate(0, 0, &v11);
  }

  return v7;
}

- (void)dealloc
{
  CFRunLoopSourceInvalidate(self->_runLoopSource);
  v3.receiver = self;
  v3.super_class = (Class)SKUIRunLoopDelay;
  [(SKUIRunLoopDelay *)&v3 dealloc];
}

- (void)delayRunLoop
{
  CFStringRef v3 = self->_mode;
  CFRunLoopAddSource(self->_runLoop, self->_runLoopSource, v3);
  CFRunLoopRunInMode(v3, self->_timeout, 1u);

  CFRelease(v3);
}

- (void)endDelay
{
  CFRunLoopSourceSignal(self->_runLoopSource);
  runLoop = self->_runLoop;

  CFRunLoopWakeUp(runLoop);
}

- (void).cxx_destruct
{
}

- (void)initWithRunLoopMode:timeout:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIRunLoopDelay initWithRunLoopMode:timeout:]";
}

@end