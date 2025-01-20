@interface TSAnomaly
+ (id)fetchRequest;
@end

@implementation TSAnomaly

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"TSAnomaly"];
}

@end