@interface PARSafariPropensity
- (PARSafariPropensity)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4;
@end

@implementation PARSafariPropensity

- (PARSafariPropensity)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  return (PARSafariPropensity *)PARSafariPropensity.init(entity:insertInto:)();
}

@end