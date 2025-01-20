@interface OutOfServiceDuration
+ (id)fetchRequest;
@end

@implementation OutOfServiceDuration

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"OutOfServiceDuration"];
}

@end