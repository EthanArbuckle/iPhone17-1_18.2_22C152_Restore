@interface PARSpotlightPropensity
- (PARSpotlightPropensity)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4;
@end

@implementation PARSpotlightPropensity

- (PARSpotlightPropensity)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  return (PARSpotlightPropensity *)PARSpotlightPropensity.init(entity:insertInto:)();
}

@end