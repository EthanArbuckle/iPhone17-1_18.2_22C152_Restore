@interface PNPSyntheticWaitEvent
- (PNPSyntheticWaitEvent)initWithDelay:(double)a3;
- (void)serviceDestination:(id)a3 fromSource:(id)a4 withCompletionBlock:(id)a5;
@end

@implementation PNPSyntheticWaitEvent

- (PNPSyntheticWaitEvent)initWithDelay:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PNPSyntheticWaitEvent;
  result = [(PNPSyntheticWaitEvent *)&v5 init];
  result->_delay = a3;
  return result;
}

- (void)serviceDestination:(id)a3 fromSource:(id)a4 withCompletionBlock:(id)a5
{
  id v6 = a5;
  dispatch_time_t v7 = dispatch_time(0, (uint64_t)(self->_delay * 1000000000.0));
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __75__PNPSyntheticWaitEvent_serviceDestination_fromSource_withCompletionBlock___block_invoke;
  block[3] = &unk_264DA5768;
  id v10 = v6;
  id v8 = v6;
  dispatch_after(v7, MEMORY[0x263EF83A0], block);
}

uint64_t __75__PNPSyntheticWaitEvent_serviceDestination_fromSource_withCompletionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end