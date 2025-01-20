@interface UIEventDispatcher
- (UIEventDispatcher)initWithApplication:(id)a3;
- (void)_installEventRunLoopSources:(uint64_t)a1;
- (void)dealloc;
- (void)eventFetcherDidReceiveEvents:(id)a3;
@end

@implementation UIEventDispatcher

void __41__UIEventDispatcher_initWithApplication___block_invoke(uint64_t a1, void *a2)
{
}

- (void)eventFetcherDidReceiveEvents:(id)a3
{
  CFRunLoopSourceSignal(self->_collectHIDEventsRunLoopSource);
  runLoop = self->_runLoop;
  CFRunLoopWakeUp(runLoop);
}

- (void)_installEventRunLoopSources:(uint64_t)a1
{
  if (a1)
  {
    *(void *)(a1 + 40) = a2;
    v4 = *(void **)(a1 + 8);
    *(void *)(a1 + 16) = *(void *)(v4[1] + 152);
    memset(&v8.retain, 0, 64);
    v8.version = 0;
    v8.info = v4;
    if (_UIUpdateCycleEnabled())
    {
      CFStringRef v5 = (const __CFString *)*MEMORY[0x1E4F1D410];
    }
    else
    {
      v8.perform = (void (__cdecl *)(void *))__eventQueueSourceCallback;
      v6 = CFRunLoopSourceCreate(0, -1, &v8);
      *(void *)(a1 + 24) = v6;
      CFStringRef v5 = (const __CFString *)*MEMORY[0x1E4F1D410];
      CFRunLoopAddSource(a2, v6, (CFRunLoopMode)*MEMORY[0x1E4F1D410]);
      CFRelease(*(CFTypeRef *)(a1 + 24));
    }
    v8.perform = (void (__cdecl *)(void *))__eventFetcherSourceCallback;
    v8.info = (void *)a1;
    v7 = CFRunLoopSourceCreate(0, -2, &v8);
    *(void *)(a1 + 32) = v7;
    CFRunLoopAddSource(a2, v7, v5);
    CFRelease(*(CFTypeRef *)(a1 + 32));
  }
}

- (UIEventDispatcher)initWithApplication:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)UIEventDispatcher;
  v4 = [(UIEventDispatcher *)&v10 init];
  if (v4)
  {
    CFStringRef v5 = [[UIEventEnvironment alloc] initWithApplication:a3];
    mainEnvironment = v4->_mainEnvironment;
    v4->_mainEnvironment = v5;

    if (_UIUpdateCycleEnabled())
    {
      v7 = (void *)qword_1EB256BE8;
      qword_1EB256BE0 = (uint64_t)v4;
      qword_1EB256BE8 = (uint64_t)&__block_literal_global_469;

      CFRunLoopSourceContext v8 = (void *)qword_1EB256B88;
      qword_1EB256B80 = (uint64_t)v4;
      qword_1EB256B88 = (uint64_t)&__block_literal_global_3_9;
    }
  }
  return v4;
}

void __41__UIEventDispatcher_initWithApplication___block_invoke_2(uint64_t a1, void *a2)
{
}

- (void)dealloc
{
  if ((_UIUpdateCycleEnabled() & 1) == 0) {
    CFRunLoopSourceInvalidate(self->_handleEventQueueRunLoopSource);
  }
  CFRunLoopSourceInvalidate(self->_collectHIDEventsRunLoopSource);
  v3.receiver = self;
  v3.super_class = (Class)UIEventDispatcher;
  [(UIEventDispatcher *)&v3 dealloc];
}

- (void).cxx_destruct
{
}

@end