@interface SASHIDGenerator
- (SASHIDGenerator)init;
- (void)_sendHIDEvent:(__IOHIDEvent *)a3;
- (void)_sendHIDHoldHomeButton;
- (void)_sendHIDHoldLockButton;
- (void)dealloc;
- (void)sendHoldHomeButtonHIDEvents;
- (void)sendHoldLockButtonHIDEvents;
@end

@implementation SASHIDGenerator

- (SASHIDGenerator)init
{
  v7.receiver = self;
  v7.super_class = (Class)SASHIDGenerator;
  v2 = [(SASHIDGenerator *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.siri.SASHIDGenerator", v3);
    generatorQueue = v2->_generatorQueue;
    v2->_generatorQueue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

- (void)dealloc
{
  ioSystemClient = self->_ioSystemClient;
  if (ioSystemClient) {
    CFRelease(ioSystemClient);
  }
  v4.receiver = self;
  v4.super_class = (Class)SASHIDGenerator;
  [(SASHIDGenerator *)&v4 dealloc];
}

- (void)sendHoldHomeButtonHIDEvents
{
  generatorQueue = self->_generatorQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__SASHIDGenerator_sendHoldHomeButtonHIDEvents__block_invoke;
  block[3] = &unk_2645BCD30;
  block[4] = self;
  dispatch_async(generatorQueue, block);
}

uint64_t __46__SASHIDGenerator_sendHoldHomeButtonHIDEvents__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendHIDHoldHomeButton];
}

- (void)sendHoldLockButtonHIDEvents
{
  generatorQueue = self->_generatorQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__SASHIDGenerator_sendHoldLockButtonHIDEvents__block_invoke;
  block[3] = &unk_2645BCD30;
  block[4] = self;
  dispatch_async(generatorQueue, block);
}

uint64_t __46__SASHIDGenerator_sendHoldLockButtonHIDEvents__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendHIDHoldLockButton];
}

- (void)_sendHIDHoldHomeButton
{
  SASHIDGetCurrentTime();
  KeyboardEvent = (const void *)IOHIDEventCreateKeyboardEvent();
  IOHIDEventSetIntegerValue();
  IOHIDEventSetPhase();
  -[SASHIDGenerator _sendHIDEvent:](self, "_sendHIDEvent:", KeyboardEvent, xmmword_22168AF00, 0, 58393417, 0, 334856333);
  CFRelease(KeyboardEvent);
  nanosleep(&__rqtp, 0);
  objc_super v4 = (const void *)IOHIDEventCreateKeyboardEvent();
  IOHIDEventSetIntegerValue();
  IOHIDEventSetPhase();
  [(SASHIDGenerator *)self _sendHIDEvent:v4];
  CFRelease(v4);
  nanosleep(&v8, 0);
  v5 = (const void *)IOHIDEventCreateKeyboardEvent();
  IOHIDEventSetIntegerValue();
  IOHIDEventSetIntegerValue();
  [(SASHIDGenerator *)self _sendHIDEvent:v5];
  CFRelease(v5);
  nanosleep(&v7, 0);
  v6 = (const void *)IOHIDEventCreateKeyboardEvent();
  IOHIDEventSetIntegerValue();
  [(SASHIDGenerator *)self _sendHIDEvent:v6];
  CFRelease(v6);
}

- (void)_sendHIDHoldLockButton
{
  SASHIDGetCurrentTime();
  KeyboardEvent = (const void *)IOHIDEventCreateKeyboardEvent();
  IOHIDEventSetIntegerValue();
  -[SASHIDGenerator _sendHIDEvent:](self, "_sendHIDEvent:", KeyboardEvent, xmmword_22168AF10);
  CFRelease(KeyboardEvent);
  nanosleep(&v5, 0);
  objc_super v4 = (const void *)IOHIDEventCreateKeyboardEvent();
  IOHIDEventSetIntegerValue();
  [(SASHIDGenerator *)self _sendHIDEvent:v4];
  CFRelease(v4);
}

- (void)_sendHIDEvent:(__IOHIDEvent *)a3
{
  if (a3)
  {
    if (!self->_ioSystemClient) {
      self->_ioSystemClient = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreate();
    }
    MEMORY[0x270EF4430]();
  }
}

- (void).cxx_destruct
{
}

@end