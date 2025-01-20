@interface PARImagesPropensity
- (PARImagesPropensity)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4;
@end

@implementation PARImagesPropensity

- (PARImagesPropensity)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  return (PARImagesPropensity *)PARImagesPropensity.init(entity:insertInto:)();
}

@end