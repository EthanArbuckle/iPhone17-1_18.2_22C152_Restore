@interface AirInstanceEntity
+ (id)fetchRequest;
@end

@implementation AirInstanceEntity

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"AirInstanceEntity"];
}

@end