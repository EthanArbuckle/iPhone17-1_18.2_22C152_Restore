@interface LocationOfInterest
+ (id)fetchRequest;
@end

@implementation LocationOfInterest

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"LocationOfInterest"];
}

@end