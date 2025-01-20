@interface PARSessionEngagementsByTrigger
- (PARSessionEngagementsByTrigger)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4;
@end

@implementation PARSessionEngagementsByTrigger

- (PARSessionEngagementsByTrigger)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  return (PARSessionEngagementsByTrigger *)PARSessionEngagementsByTrigger.init(entity:insertInto:)();
}

@end