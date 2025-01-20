@interface EventMonitorBlockEvent
- (BOOL)hasOccurred;
- (id)copyWithZone:(_NSZone *)a3;
- (id)eventBlock;
- (id)testBlock;
- (void)dealloc;
- (void)performAction;
- (void)setEventBlock:(id)a3;
- (void)setTestBlock:(id)a3;
@end

@implementation EventMonitorBlockEvent

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)EventMonitorBlockEvent;
  [(EventMonitorBlockEvent *)&v3 dealloc];
}

- (BOOL)hasOccurred
{
  testBlock = (uint64_t (**)(void))self->_testBlock;
  if (testBlock) {
    LOBYTE(testBlock) = testBlock[2]();
  }
  return (char)testBlock;
}

- (void)performAction
{
  eventBlock = (void (**)(void))self->_eventBlock;
  if (eventBlock) {
    eventBlock[2]();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)EventMonitorBlockEvent;
  v5 = -[EventMonitorEvent copyWithZone:](&v7, "copyWithZone:");
  v5[4] = [self->_eventBlock copyWithZone:a3];
  v5[5] = [self->_testBlock copyWithZone:a3];
  return v5;
}

- (id)eventBlock
{
  return self->_eventBlock;
}

- (void)setEventBlock:(id)a3
{
}

- (id)testBlock
{
  return self->_testBlock;
}

- (void)setTestBlock:(id)a3
{
}

@end