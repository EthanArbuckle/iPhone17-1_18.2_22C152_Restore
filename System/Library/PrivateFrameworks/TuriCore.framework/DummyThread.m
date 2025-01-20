@interface DummyThread
- (DummyThread)init;
@end

@implementation DummyThread

- (DummyThread)init
{
  v3 = (void *)[objc_alloc(MEMORY[0x263F08B88]) initWithTarget:self selector:sel_dummy object:0];
  [v3 start];

  return self;
}

@end