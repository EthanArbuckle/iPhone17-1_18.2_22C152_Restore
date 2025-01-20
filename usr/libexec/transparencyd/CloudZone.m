@interface CloudZone
+ (id)fetchRequest;
@end

@implementation CloudZone

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"CloudZone"];
}

@end