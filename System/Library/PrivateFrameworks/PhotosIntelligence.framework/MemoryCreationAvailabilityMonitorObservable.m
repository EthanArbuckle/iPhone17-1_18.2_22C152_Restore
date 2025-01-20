@interface MemoryCreationAvailabilityMonitorObservable
- (void)stateDidChangeWithMonitor:(id)a3;
@end

@implementation MemoryCreationAvailabilityMonitorObservable

- (void)stateDidChangeWithMonitor:(id)a3
{
  id v3 = a3;
  swift_retain();
  sub_2596F7E18(v3);

  swift_release();
}

@end