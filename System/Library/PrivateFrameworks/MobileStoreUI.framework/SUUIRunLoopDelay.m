@interface SUUIRunLoopDelay
- (SUUIRunLoopDelay)initWithRunLoopMode:(id)a3 timeout:(double)a4;
- (void)dealloc;
- (void)delayRunLoop;
- (void)endDelay;
@end

@implementation SUUIRunLoopDelay

- (SUUIRunLoopDelay)initWithRunLoopMode:(id)a3 timeout:(double)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SUUIRunLoopDelay;
  v7 = [(SUUIRunLoopDelay *)&v12 init];
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
  v3.super_class = (Class)SUUIRunLoopDelay;
  [(SUUIRunLoopDelay *)&v3 dealloc];
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

@end