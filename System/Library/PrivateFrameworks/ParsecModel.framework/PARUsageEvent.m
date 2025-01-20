@interface PARUsageEvent
- (PARUsageEvent)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4;
@end

@implementation PARUsageEvent

- (PARUsageEvent)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  return (PARUsageEvent *)PARUsageEvent.init(entity:insertInto:)();
}

@end