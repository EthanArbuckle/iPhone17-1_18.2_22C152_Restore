@interface CloudDevice
+ (id)fetchRequest;
@end

@implementation CloudDevice

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"CloudDevice"];
}

@end