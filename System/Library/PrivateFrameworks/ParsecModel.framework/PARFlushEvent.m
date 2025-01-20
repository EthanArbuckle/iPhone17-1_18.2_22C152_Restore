@interface PARFlushEvent
- (PARFlushEvent)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4;
@end

@implementation PARFlushEvent

- (PARFlushEvent)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  return (PARFlushEvent *)PARFlushEvent.init(entity:insertInto:)();
}

@end