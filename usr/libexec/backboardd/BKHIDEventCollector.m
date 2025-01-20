@interface BKHIDEventCollector
@end

@implementation BKHIDEventCollector

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectedEvents, 0);

  objc_storeStrong((id *)&self->_clientPortToEventCount, 0);
}

@end