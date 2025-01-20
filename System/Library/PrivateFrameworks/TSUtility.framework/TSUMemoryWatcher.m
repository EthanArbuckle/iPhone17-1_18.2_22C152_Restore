@interface TSUMemoryWatcher
- (TSUMemoryWatcher)initWithFlushingManager:(id)a3;
- (void)_periodicallySimulateMemoryWarning:(id)a3;
- (void)_simulateMemoryWarning:(id)a3;
- (void)beginObserving;
- (void)dealloc;
- (void)stopObserving;
@end

@implementation TSUMemoryWatcher

- (TSUMemoryWatcher)initWithFlushingManager:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TSUMemoryWatcher;
  result = [(TSUMemoryWatcher *)&v5 init];
  if (result) {
    result->_flushingManager = (TSUFlushingManager *)a3;
  }
  return result;
}

- (void)dealloc
{
  [(TSUMemoryWatcher *)self stopObserving];
  v3.receiver = self;
  v3.super_class = (Class)TSUMemoryWatcher;
  [(TSUMemoryWatcher *)&v3 dealloc];
}

- (void)beginObserving
{
  if (!self->_going)
  {
    *(_WORD *)&self->_going = 1;
    uint64_t v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x263EFFA40], "standardUserDefaults"), "integerForKey:", @"TSUSimulateMemoryWarningsEvery");
    if (v3 >= 1)
    {
      v4 = (void *)MEMORY[0x263F08B88];
      uint64_t v5 = [NSNumber numberWithInteger:v3];
      [v4 detachNewThreadSelector:sel__periodicallySimulateMemoryWarning_ toTarget:self withObject:v5];
    }
  }
}

- (void)stopObserving
{
  self->_stop = 1;
}

- (void)_periodicallySimulateMemoryWarning:(id)a3
{
  uint64_t v5 = objc_opt_new();
  uint64_t v6 = [a3 integerValue];
  NSLog((NSString *)@"%@ enabled, simulating UIKit memory warning every %ld seconds", @"TSUSimulateMemoryWarningsEvery", v6);
  while (!self->_stop)
  {
    [v5 drain];
    uint64_t v5 = objc_opt_new();
    [MEMORY[0x263F08B88] sleepForTimeInterval:(double)v6];
    [(TSUMemoryWatcher *)self performSelectorOnMainThread:sel__simulateMemoryWarning_ withObject:0 waitUntilDone:1];
  }
  [v5 drain];
}

- (void)_simulateMemoryWarning:(id)a3
{
  uint64_t v3 = objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", a3);
  uint64_t v4 = *MEMORY[0x263F1D060];
  uint64_t v5 = [MEMORY[0x263F1C408] sharedApplication];
  [v3 postNotificationName:v4 object:v5];
}

@end