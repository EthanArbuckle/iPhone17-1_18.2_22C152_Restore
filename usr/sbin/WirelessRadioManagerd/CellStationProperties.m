@interface CellStationProperties
+ (id)fetchRequest;
@end

@implementation CellStationProperties

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"CellStationProperties"];
}

@end