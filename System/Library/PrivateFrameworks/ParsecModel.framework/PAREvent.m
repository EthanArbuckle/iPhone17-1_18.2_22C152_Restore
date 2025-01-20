@interface PAREvent
- (PAREvent)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4;
@end

@implementation PAREvent

- (PAREvent)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  return (PAREvent *)PAREvent.init(entity:insertInto:)();
}

@end